Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D93FD8763
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 13:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1LeDQMyH2RycDF+8KnCGFkEFqzlWBy52GMaL6I3Md0E=; b=mpB9m364xGkXA3g8ueVQ2dWPUN
	qcdRTDf7uM7Pa+hS0GasOK0nOy+a2gW94t7RDCwUDE+gmIdD2NOICHsJQhptMtd34V+9AllbuCVKg
	UUuAfkX9zhj7btoYiFdgRykBwT5VEm2B/ZG3DTu/ISjxb0n1tN4xzQCBqOQB2wW5IAJA2zYBEDG7N
	eFn+axpmhIlQA+X7ipBlD/SaPdvnJsW1UrhaWnxLI71dYHXVifmlLOr+ZkKk7lE9TewIIHA6a5imw
	y3w3Anc4f8xdlqnjgs6wvdPUwg+vvMv/+SDmw2NKHilzYXFI3qXRP49yRg//ShI2mjpLN7OykvVIS
	WqbbaCtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2U7N-00000006Mvk-17QB;
	Tue, 17 Mar 2026 13:05:53 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2U7I-00000006Mud-16v8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 13:05:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1LeDQMyH2RycDF+8KnCGFkEFqzlWBy52GMaL6I3Md0E=; b=rYLR2K1lFK/0FJ4Mnf0QAtzzMB
	rRRY7w1bbN6NLsHAc4gSIgEJ09Sh508RhXb71uy1KVBXSXzf2C0f2SQ6NDhi3vJAsCHFgtmMKALT8
	RSsAzUr7+mMqOy2UoC/wVrNm9Rc2oLbrwn5nlAh/h5ttFMEjNOl06SAvb/u9anwW7VachNIfTOJ/r
	fVaYss9HQy8BiWIxPDumckhnbY+09PvmlNMm8KfbbHc4KHFx72cg+hqrqJyzNuakr40SU5AlrV5Nd
	eBCkxmlPnCwRtox8jd+HBElM1qmILB/yflF/tJwx72kWZOQmIU9y1UrDldLXCl7e9Tkj8AT8szqWO
	qGgGYs0Q==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1w2U7F-00000000foh-0Rg0;
	Tue, 17 Mar 2026 14:05:45 +0100
Date: Tue, 17 Mar 2026 14:05:00 +0100
From: Michal Piekos <michal.piekos@mmpsystems.pl>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] net: stmmac: skip VLAN restore when VLAN hash ops are
 missing
Message-ID: <6wr4v36ijdwlh4q6wiwki42qdjwsjoif7l47mu2df6npi42vrx@scd7zbgb4dml>
References: <20260314-vlan-restore-error-v1-1-4fc6c3e2115f@mmpsystems.pl>
 <TY7P301MB1984C5D71A81DFE5E8EC94D4D341A@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY7P301MB1984C5D71A81DFE5E8EC94D4D341A@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_060548_803868_F9181C64 
X-CRM114-Status: GOOD (  26.65  )
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

On Tue, Mar 17, 2026 at 12:36:42PM +0000, Ovidiu Panait wrote:
> Hi Michal,
> 
> > stmmac_vlan_restore() unconditionally calls stmmac_vlan_update() when
> > NETIF_F_VLAN_FEATURES is set. On platforms where priv->hw->vlan (or
> > ->update_vlan_hash) is not provided, stmmac_update_vlan_hash() returns
> > -EINVAL via stmmac_do_void_callback(), resulting in a spurious
> > "Failed to restore VLANs" error even when no VLAN filtering is in use.
> > 
> > Check presence of VLAN hash ops before stmmac_vlan_update().
> > 
> > Fixes: bd7ad51253a7 ("net: stmmac: Fix VLAN HW state restore")
> > Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> > ---
> > This patch fixes a noisy "Failed to restore VLANs" message on platforms
> > where stmmac VLAN hash ops are not implemented.
> > stmmac_vlan_restore() calls stmmac_vlan_update() without checking for
> > VLAN hash ops presence which results in -EINVAL.
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 6827c99bde8c..bc09439ec00b 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -6869,6 +6869,9 @@ static int stmmac_vlan_restore(struct stmmac_priv
> > *priv)
> >         if (priv->hw->num_vlan)
> >                 stmmac_restore_hw_vlan_rx_fltr(priv, priv->dev, priv->hw);
> > 
> > +       if (!priv->hw->vlan || !priv->hw->vlan->update_vlan_hash)
> > +               return 0;
> > +
> 
> The stmmac_restore_hw_vlan_rx_fltr() call above also goes through the
> priv->hw->vlan pointer, so maybe for consistency, the check for empty
> VLAN ops should be made at the top of the function.
> 
> Another alternative would be to replace the NETIF_F_VLAN_FEATURES check
> at the top of stmmac_vlan_update() function to check if VLAN HW filtering
> is supported instead (NETIF_F_HW_VLAN_CTAG_FILTER and
> NETIF_F_HW_VLAN_STAG_FILTER).
> 
> The restore only deals with the HW filters anyway and the vlan ops are
> always defined in that case (stmmac_vlan_rx_add_vid() and
> stmmac_vlan_rx_kill_vid() rely on this being true as well, as they also
> call stmmac_vlan_update() unconditionally).
> 
> Ovidiu

Thank you for the comment. 
Your suggested solution to check VLAN HW filtering flags is much better.
I'll go for it for v2.

Michal

> 
> >         ret = stmmac_vlan_update(priv, priv->num_double_vlans);
> >         if (ret)
> >                 netdev_err(priv->dev, "Failed to restore VLANs\n");
> > 
> > ---
> > base-commit: 1c9982b4961334c1edb0745a04cabd34bc2de675
> > change-id: 20260314-vlan-restore-error-f8b3a1c7f50a
> > 
> > Best regards,
> > --
> > Michal Piekos <michal.piekos@mmpsystems.pl>
> 

