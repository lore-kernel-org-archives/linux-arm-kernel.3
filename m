Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A57EE7C6FA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Feb 2026 00:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+fhd0lY982XBAnyDnQ0FCgm+b2dtiG5VHP2W6sbths=; b=p8BYz+UeaJOjXG5I6eOhSfL+15
	zmv4KOOg1IVWMm+FAHD3ki1aji+lI7eDH22ZFy8YXWFqo3q9DYvul/ary69mG9/vuse3I+kh9cFPb
	14nkCKOTaCwByayn5k9sNsm2eTmfUN2kHfp8Pv0xHkcQbBpiFNNr8Sod1Kb5HZSbU110szq3vgFSs
	nC1lPigeM1zXFrlmTY+hpdqKecTHsYgsl5Kh0DLon64Bed/sPc8EwAR8KO3mHW3Vr5gOcsbzfeq+B
	dkmgyn0YWWdV+r7ez5AwGQFpc3ZOcDa1Hl99qkrgz30oHb31ptMlwVd5zz6sqtkNGLXzMG4D74M2a
	Sh1cKWtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmLZT-000000037yy-2uNJ;
	Sun, 01 Feb 2026 00:44:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmLZR-000000037yR-1ZAl;
	Sun, 01 Feb 2026 00:44:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F6E744285;
	Sun,  1 Feb 2026 00:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC401C4CEF1;
	Sun,  1 Feb 2026 00:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769906648;
	bh=OA7Q9YrHL2xoPfi2sklWNonwOgZc4d+Wx+DZIdbyklo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kvX99E3vssMYn5lQzJFdI61X61d3TmyvBziTkrjluG/VMSY5VbfgfqWvh7Dr/T2qv
	 79LiipB/GXy/Z2Aj0XufJ2mmkQf4se1bK7Euv6n0KD2WKuuluVHJKp0LMXXP80v9fc
	 1y7Da4yNqlUeXIcAieuPuzScx8WJOqa38oDGJSC15IixczeiWbRDJRAlJ5ScQttPcJ
	 E2a0CUd5EeFHwV3uhfh9hgdwN5TRMUko5hSPRDtltc+xcaE3vsV1ReA0+1p81LpQCp
	 5sQxBW/SIkA5PTMWeW3v2mmWD4EWoSZ7xA9ZDeOIbVqOBykw5djtK6SeSXir2HRYpo
	 TlHHX1+CQHmSg==
Date: Sat, 31 Jan 2026 16:44:06 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Heiko
 Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org, Paolo
 Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 01/10] net: stmmac: rk: convert to mask-based
 interface mode configuration
Message-ID: <20260131164406.3c90587f@kernel.org>
In-Reply-To: <aX6P9D99Xi4PnI2J@shell.armlinux.org.uk>
References: <aXyPK9rlMt8h_fze@shell.armlinux.org.uk>
	<E1vlmEY-00000006znn-0N0Q@rmk-PC.armlinux.org.uk>
	<20260131140850.3c35f95a@kernel.org>
	<aX6P9D99Xi4PnI2J@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_164409_461659_C6074E36 
X-CRM114-Status: GOOD (  11.91  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, 31 Jan 2026 23:27:48 +0000 Russell King (Oracle) wrote:
> > > +	if (bsp_priv->gmac_phy_intf_sel_mask ||
> > > +	    bsp_priv->gmac_rmii_mode_mask) {
> > > +		/* If defined, encode the phy_intf_sel value */
> > > +		val = rk_encode_wm16(intf, bsp_priv->gmac_phy_intf_sel_mask);
> > > +
> > > +		/* If defined, encode the RMII mode mask setting. */
> > > +		val |= rk_encode_wm16(intf == PHY_INTF_SEL_RMII,
> > > +				      bsp_priv->gmac_rmii_mode_mask);
> > > +
> > > +		ret = regmap_write(bsp_priv->grf, bsp_priv->gmac_grf_reg, val);
> > > +		if (ret < 0)  
> > 
> > missing
> > 	gmac_clk_enable(bsp_priv, false);
> > here?  
> 
> Opinions vary on whether errors from regmap_write() should be handled.
> See the recent thread:
> 
> https://lore.kernel.org/r/aXh9lcfw6D6KouI_@stanley.mountain
> 
> Seems that if regmap_write() fails, it's "buy a new computer" realms.
> If that's case, is it worth cleaning up resources, or even checking the
> return code from regmap_write() ?

I don't feel strongly, happy for you to make the call.

Just wanted to flag this now rather than Monday when it can be applied.
(I try to give reviewers 24h of "non-weekend" time before applying so
this series would have to wait until Mon, anyway.)

