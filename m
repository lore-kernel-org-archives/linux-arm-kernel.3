Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C245B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 02:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dEl4XW9H;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Q4dEGGKV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fR07HzCYiHUWXoygEK4KE/KCkYYrHs4rlMJZsk/rRdk=; b=dEl4XW9HsB/McaUOpR7nIEdh8A
	VaiktBBJ5xNQ4fueodlRc+RcWa45SyVkVcIsPUOhAJdUfwQ9bIsoDZ59ArvsiLthAou9PfUi8FDzk
	lESMEuLMv1MZBXvYmy470d7wNPRaxAcb78FZqjv7ZhuTy7YU8LzK/XJZ7dYjY3o8UYEusCbxkTkZf
	YzaPpAH27b3OvTnI99XVcnfTH+sixjvwG80fb1UsoCyKfx+gFrzUi+tqC9AVSV1ZEqHxIZwDsLZiT
	/1Jaso3dzIVhXJeMFtZSXzIl2KPuwk4rVS/p8es7bQfCRomxynRnkVBHnVu7RakEPQcU+08hPL8Ob
	6SxOOwRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLtHe-000000065eW-00RP;
	Wed, 28 Oct 2026 02:20:58 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLtHb-000000065e1-1zTD;
	Wed, 28 Oct 2026 02:20:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=fR07HzCYiHUWXoygEK4KE/KCkYYrHs4rlMJZsk/rRdk=; b=Q4dEGGKVey53CbOf9pJ4D+Qgeu
	+LuZKwfaRnJ/Mnxr3h9OLDa1i9BLVJvt1ZYkxMn4nXsO66nFT0/3fxs9bITdm4hIg2Dj2haphPyBx
	0PvrEXVIKaXT1C0Up8iWyweRQ9dbZ5v9QVACNXM05HfQreaS5mLiWv4esqheyvYDgqqQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xLtHG-00D2pX-Ip; Wed, 28 Oct 2026 03:20:34 +0100
Date: Wed, 28 Oct 2026 03:20:34 +0100
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
Subject: Re: [PATCH v3 5/7] net: dsa: mediatek: support MDIO switch
 downstream of MMIO switch
Message-ID: <f6fe9c7a-5617-475b-babe-da24cda815cc@lunn.ch>
References: <20261028011317.1557238-1-cjd@cjdns.fr>
 <20261028011317.1557238-6-cjd@cjdns.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028011317.1557238-6-cjd@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_192055_516358_D56BC448 
X-CRM114-Status: GOOD (  12.66  )
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

On Wed, Oct 28, 2026 at 01:13:15AM +0000, Caleb James DeLisle wrote:
> The MT7530 / MT7531 can connect via either MDIO or MMIO. In MMIO mode
> the switch provides its own MDIO bus which connects to its integrated
> PHYs, but also can be connected to other things, such as another
> switch.
> 
> If the MDIO bus contains another switch, then the upstream switch
> will register but it will not setup the DSA tree because the
> downstream switch is missing. Without the complete DSA tree,
> mt753x_setup() will not be called on the switch and therefore
> mt7530_setup_mdio() is never called so the downstream switch never
> registers.
> 
> Update mt7530_setup_mdio() so that it can be called multiple times,
> export the symbol, and call it again after dsa_register_switch()
> from mt7988_probe().

I would suggest just moving it to probe. Don't also have it in setup.
KISS.

	Andrew

