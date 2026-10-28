Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1992606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 12:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qq8iu/Qs;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Udr6XEpf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mIpHk6iOWjpGN9O5FHmkorJ2iYcIvsqGrTEb77wuOHQ=; b=qq8iu/QsIe0r6B3Xhs1wB/ZJ/a
	cy9G0lWnyqKj1Q/7K6HpvnikMvtXE+2zA+BvHjlHssr6I6IzSITTbaGloQ1K4DFCeeUQA8yv4UXv+
	xnsJzdoOqsadsGMjL4K69/2yLNPRvAaWtngmPvLrzLaGY/v7oWkY9vSqVFCa7hAaqhRtmAECQl1d9
	WNYES3JDakOpy2oMxFbsrp8OC0Onv7EOsM5m8bIIXI8DDwYUpdTUvMpe9w5ZtklAGuZjqVaF0cWR6
	brMFdpRIy0z7BEGwew5q6oKXVVqDATK+5QtSqqyQt7oLd8VVCeNcwK1+lRR/sas2GdUAbP7u6tMDP
	EH+w1GYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM2sN-00000006xvk-3Xi5;
	Wed, 28 Oct 2026 12:35:31 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM2sG-00000006xtm-2mlS;
	Wed, 28 Oct 2026 12:35:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=mIpHk6iOWjpGN9O5FHmkorJ2iYcIvsqGrTEb77wuOHQ=; b=Ud
	r6XEpfROX2s6rx/8r4fyxYUiLEnQP3mvrte9VsMJOGTUrS5vNKvMBluJWZ7nI3dTkepfI9xi4JyPE
	SjplqAo1pGuJgEeUiU806lu0j4JBl6o+7YAQ3LJL8HO32XgW0L4weh+kItNH4nPxUukinfStE1LRP
	yo7W+eseJeaWFYY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xM2ru-00D6jH-Dl; Wed, 28 Oct 2026 13:35:02 +0100
Date: Wed, 28 Oct 2026 13:35:02 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: netdev@vger.kernel.org, olteanv@gmail.com, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	chester.a.unal@arinc9.com, daniel@makrotopia.org,
	linux@armlinux.org.uk, arinc.unal@arinc9.com,
	Landen.Chao@mediatek.com, dqfext@gmail.com, sean.wang@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, naseefkm@gmail.com,
	b.larsson@gmx.com
Subject: Re: [PATCH v3 3/7] net: dsa: mediatek: add support for passthrough
 mode
Message-ID: <2b406479-8c3d-40e6-93e2-e7ad01d5f432@lunn.ch>
References: <20261028011317.1557238-1-cjd@cjdns.fr>
 <20261028011317.1557238-4-cjd@cjdns.fr>
 <734d4f06-26af-4bea-9c83-eb92c1b3b894@lunn.ch>
 <18472c61-efe2-4529-971b-82d877df6b15@cjdns.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <18472c61-efe2-4529-971b-82d877df6b15@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_053524_819218_DA0A40E9 
X-CRM114-Status: GOOD (  10.93  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> > What is actually left?
> 
> 
> In v2 I was using special switch ops, and it looked like this:

Sorry, i did not look at v2.

> /* No manipulation of forwarding rules allowed in passthrough mode */
> static const struct dsa_switch_ops mt7530_passthrough_switch_ops = {
>        .get_tag_protocol       = mtk_get_tag_protocol,
>        .setup                  = mt753x_setup,
>        .teardown               = mt753x_teardown,
>        .preferred_default_local_cpu_port =
> mt753x_preferred_default_local_cpu_port,
>        .get_strings            = mt7530_get_strings,
>        .get_ethtool_stats      = mt7530_get_ethtool_stats,
>        .get_sset_count         = mt7530_get_sset_count,
>        .get_eth_mac_stats      = mt7530_get_eth_mac_stats,
>        .get_rmon_stats         = mt7530_get_rmon_stats,
>        .get_eth_ctrl_stats     = mt7530_get_eth_ctrl_stats,
>        .get_stats64            = mt7530_get_stats64,
>        .port_enable            = mt7530_port_enable,
>        .port_disable           = mt7530_port_disable,
>        .phylink_get_caps       = mt753x_phylink_get_caps,
>        .support_eee            = dsa_supports_eee,
>        .set_mac_eee            = mt753x_set_mac_eee,
>        .conduit_state_change   = mt753x_conduit_state_change,
> };

I think you should be doing something like this. Either two
dsa_switch_ops, or you add generic implementations for all the ops,
which then call device specific implementations dependent on the
compatible. This is how many DSA drivers handle different families of
devices in one driver.

I would avoid putting "if (priv->passthrough)" everywhere.

	Andrew

