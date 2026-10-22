Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2A4606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 11:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qi2eHQBC;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VwbgQH6E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aFj9EOMMM4ZfmH8lB0SRPQlwHihAc++U7Qmw0rZKtAw=; b=Qi2eHQBCb+kzDd+PvSLU+x2g1s
	kMMsMEZid3uwnG58KhtF1Sc3ZTexlOHIX7YiyK/r9ZH4jmmLq7n1xIbAAwtZFwQyehCv79D1uBHKt
	RlsXoVVnEFc8j8Q6V4vH8vL41rlqYh15ZJg1azH1avHqI1FBHLS8cByugiv7rEgrfYibWySpEVDDl
	wXBXfM22k/xce6YmX6KX7xqqtHS+2tY+g0q8zdkwVhji/DsKIQGzoIOyVTTkCga8kGa46QlzgRltK
	355NxA43k19RW3K35Q0MrlN5dxpX+iSsJ6mlUWbUX1+aTknsNNwmFm8blja37t4UicZKMDH0B8AG/
	IuRWHpvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJrMo-0000000E2WT-0HKb;
	Thu, 22 Oct 2026 11:53:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJrMl-0000000E2VY-0WjK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 11:53:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4248860A6F;
	Thu, 22 Oct 2026 11:53:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42F881F000C5;
	Thu, 22 Oct 2026 11:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792670030;
	bh=aFj9EOMMM4ZfmH8lB0SRPQlwHihAc++U7Qmw0rZKtAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VwbgQH6E6d2EPY7DrOxy0zWCdu18bjOfHPcC7AtxLsjjNoxU2WijAntIipUbau2H6
	 SzyLGawID2D2xB3WFoFCq7890+Ml7u9VNIIQFKdaHdOn0AzB3+kpmeVv4tl5+bTSrE
	 s7Hc4gCSgCjM3DFDo+tNo2WPAyyyP27uW67NO5In8bCrrGOZr3xGMTY38OAM4TqZTM
	 1rdDjXwP1N22vg1dirZduSskhN+vr0TUkKHAwWiiM/zyvFeYxvGSz/3Uz/RTuR/72q
	 d3QMKgthEetIcsCackzdQN4/1kTg0Q1+MqnWnLlXuX2bwFA/g+45JC621rhkLufpoJ
	 T4WYtaaVinzbA==
Date: Thu, 22 Oct 2026 19:33:44 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: stmmac: Disable checksum insertion for XDP frame TX
Message-ID: <atn0mF-dukVTK6Lh@xhacker>
References: <20260929121025.20821-1-jszhang@kernel.org>
 <f0d8c25f-96e1-4da8-af6c-3286610338ba@lunn.ch>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f0d8c25f-96e1-4da8-af6c-3286610338ba@lunn.ch>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Sep 29, 2026 at 10:29:14PM +0200, Andrew Lunn wrote:
> On Tue, Sep 29, 2026 at 08:10:25PM +0800, Jisheng Zhang wrote:
> > stmmac enables TX checksum insertion for XDP frames whenever the queue
> > supports it. XDP frames carry no TX checksum offload request, so this
> > can overwrite a checksum already present in the packet.
> > 
> > Pass false to stmmac_prepare_tx_desc() when transmitting an XDP frame
> > so that the packet is sent with its checksum fields unchanged.
> 
> This seems odd to me.
> 
> If the frame contains a checksum, it is either correct, and the
> hardware calculated one will come out the same, not an issue.  Or the
> checksum in the frame is actually wrong, because the frame has got
> mangled by eBPF before sending it out, and you want the hardware to
> calculate the correct value.
> 
> What an i missing?
> 
Hi Andrew and all,

some discussions happened in below thread
https://lore.kernel.org/netdev/athAoWfW-xesPhFP@xhacker/

Since it has been merged. Let's move the discussion back to my patch.

AIUI, dwmac can only do HW checksum for normal particular packets
layouts, such as TCP, UDP etc. The stmmac_has_ip_ethertype() has
well demostrated this limitation.
Different with normal tx where the common stack supplies the skb->ip_summed
metadata, XDP path doesn't have the necessary metadata. So to make
the XDP always work properly when transmiting tranmist arbitrary Eth
frames, dwmac HW csum needs to be disabled by default currently.

Thanks

