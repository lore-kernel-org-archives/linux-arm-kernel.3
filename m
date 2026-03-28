Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A7810BA421
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 08:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ejJZ2msrybPfriDsCgcnWyd7Z8ZISOT5WUkjT8Zg0gg=; b=WYwozhsfqst7zb4SkDwmfg3Jk6
	NE49Jev3tA5JQgQ3FDhzw1/la8TkYjrhtLF9LDB4ZMozbe2wxSe6sgz6BAjIf1gcgjHrwme6f/Gtt
	I3oxJj+q0hxS3DNrdIHdlmxrQGR97CkRlj2C15zoeUIkfoh1sH+wTzTDsQppmg6Y8lf66bBcrwa8O
	VZKTGT5COJQt/xTSxhNytf4yjUZzon87/OD0miQsMbRGXSQFZ7u5V0NNs57nejBdDh7LhMAo5r8H6
	UDlYdZup8hQcf2dAXGmwG7BDl2vE41xaIAakSCuBf0Ye23eIl2TthV/pp9On8H6VvCuKNG7S0DLeD
	ydx1s/NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6OrV-00000008jHe-2JjG;
	Sat, 28 Mar 2026 08:17:41 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6OrO-00000008jH3-1t4l
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 08:17:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ejJZ2msrybPfriDsCgcnWyd7Z8ZISOT5WUkjT8Zg0gg=; b=t6UKIqEKEe0xdQ4e6+tsd6DeSR
	NBT4of6c00PndbkeLeMSBHo8y5rTdNHleSCIjDcpvUdqjLggks7OJEh95Hj6onI1lPuXAPo1p6fO2
	ftDKcVenb368/7W2sN6mhs6yDFil5eeg39VWit8dkXUBGqRjhohyP+FMmVJtzaB+OfbPAjFeVfuCT
	mpvhndZjApCMqhnhiX80x3gD9yLW4/cZTCRejqcpl1JBy87uV8tuIfPR6YsgW/zBdMWy63YjMEXY+
	JnqkuKQIExZlygJ1nYyiwHB4og6EGP3zr6VTsmb13kImgTqe0LafJnsmGyejL8DthLmgiiGft/8Wd
	Jop/neCQ==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1w6OrK-00000001FqP-2Oxh;
	Sat, 28 Mar 2026 09:17:30 +0100
Date: Sat, 28 Mar 2026 09:17:23 +0100
From: Michal Piekos <michal.piekos@mmpsystems.pl>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] net: stmmac: skip VLAN restore when VLAN hash ops are
 missing
Message-ID: <d3nc2eqhedz6ygstu76cgj2dghkoiod5dnamdwqpvoe3vajndq@ewqtagfgkfzd>
References: <20260328-vlan-restore-error-v3-1-df47a039c6f6@mmpsystems.pl>
 <aceIeFWGAZwr1njk@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aceIeFWGAZwr1njk@shell.armlinux.org.uk>
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_011734_985227_1A7C7AE5 
X-CRM114-Status: GOOD (  23.52  )
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

On Sat, Mar 28, 2026 at 07:51:20AM +0000, Russell King (Oracle) wrote:
> On Sat, Mar 28, 2026 at 07:51:53AM +0100, Michal Piekos wrote:
> > stmmac_vlan_restore() unconditionally calls stmmac_vlan_update() when
> > NETIF_F_VLAN_FEATURES is set. On platforms where priv->hw->vlan (or
> > ->update_vlan_hash) is not provided, stmmac_update_vlan_hash() returns
> > -EINVAL via stmmac_do_void_callback(), resulting in a spurious
> > "Failed to restore VLANs" error even when no VLAN filtering is in use.
> > 
> > Remove the unneeded comment.
> > 
> > Tested on Orange Pi Zero 3.
> > 
> > Fixes: bd7ad51253a7 ("net: stmmac: Fix VLAN HW state restore")
> > Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> > ---
> > This patch fixes a noisy "Failed to restore VLANs" message on platforms
> > where stmmac VLAN hash ops are not implemented.
> > stmmac_vlan_restore() calls stmmac_vlan_update() without checking for
> > VLAN hash ops presence which results in -EINVAL. 
> > ---
> > Changes in v3:
> > - Remove the offending comment
> > - Restore the original check for NETIF_F_VLAN_FEATURES
> > - Link to v2: https://lore.kernel.org/r/20260321-vlan-restore-error-v2-1-45cf56a5223d@mmpsystems.pl
> > 
> > Changes in v2:
> > - Replace check for hash ops with check for HW FILTER flags
> > - Link to v1: https://lore.kernel.org/r/20260314-vlan-restore-error-v1-1-4fc6c3e2115f@mmpsystems.pl
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 +-------
> >  1 file changed, 1 insertion(+), 7 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 6827c99bde8c..0f3e5ac05faa 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -6861,19 +6861,13 @@ static int stmmac_vlan_rx_kill_vid(struct net_device *ndev, __be16 proto, u16 vi
> >  
> >  static int stmmac_vlan_restore(struct stmmac_priv *priv)
> >  {
> > -	int ret;
> > -
> >  	if (!(priv->dev->features & NETIF_F_VLAN_FEATURES))
> >  		return 0;
> >  
> >  	if (priv->hw->num_vlan)
> >  		stmmac_restore_hw_vlan_rx_fltr(priv, priv->dev, priv->hw);
> >  
> > -	ret = stmmac_vlan_update(priv, priv->num_double_vlans);
> > -	if (ret)
> > -		netdev_err(priv->dev, "Failed to restore VLANs\n");
> > -
> > -	return ret;
> > +	return stmmac_vlan_update(priv, priv->num_double_vlans);
> >  }
> 
> Yes, but as both Andrew and myself have pointed out, no one checks
> the return value of stmmac_vlan_restore(), so why does it return
> int?

Was too quick with the patch. Will spin another version.

Michal
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

