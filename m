Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F5CDF54AAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 13:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WN2wTNGMgM5bYbRGfOQZgYj/JyTydD59C5V7z3tIw28=; b=G5cRctpHsI1C1C/64fNdme4tjJ
	W1mk17X/gFCmd1owlimhC3JxIYWT08RlzFHSTZA2Gh9UNBqX4EThAV57DyHFcF+vsxzYAgMW7i3y+
	6F6HbWjpe8ZqXKqpw+np4yWBWsZP+2P8IVLBgeRiVg+auuPS19OLHcMNhHuaqVLDAVlIajNSg2jt5
	VQ/E//9WYwZLN1x90nbMhzgLPxDyNQxj8phKMh0qTXzwxZ95plpixviHtYBEvnrV16SlHH3UOF6tP
	3d//rsC9KJGR5Uy60mI1upBrIODpOsglysbxcAIUP4EDlhqBnAqoEA424gSsi3Lu5QifL2UIqMAsD
	dzIWu0EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51RF-00000001UMx-2X0h;
	Tue, 24 Mar 2026 13:04:53 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51RC-00000001UMP-2jWi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 13:04:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WN2wTNGMgM5bYbRGfOQZgYj/JyTydD59C5V7z3tIw28=; b=JO4krb767LEVW4/gzQbytGjPP0
	FIMh0JO+ZsFiQqlgXLpEQXy+eQz2g1WGOjXNbzS/NKmGHCMkdlLFXkjvL60PFC3f/G9a6py6A95Gm
	96ru2QzKxJQQS/k6iUDn7Dg3FxM7m8nYjcTRlIb3HuBYR6O3quUUlNs2OW2TrV6WAFJjPQ2+2Q0bT
	mmgDDxr+rwB2aMz/UIIRPsLkxdp5Zpx7UZbRIJm20tcHSeOK7cIbnHJoqGQwKSh2lVbAUpgMCEM/Q
	QUsRNCxtLrGZ/884HjkfwvmSZ7+VurZEZR6m0RiLmmeUrmXRsh8T2Gnvr44ouJMTk87XQFyG67lKP
	1fXJtbMQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38946)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w51Qz-0000000021Z-0snn;
	Tue, 24 Mar 2026 13:04:37 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w51Qw-00000000558-0Eg7;
	Tue, 24 Mar 2026 13:04:34 +0000
Date: Tue, 24 Mar 2026 13:04:33 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Paolo Abeni <pabeni@redhat.com>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: Michal Piekos <michal.piekos@mmpsystems.pl>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] net: stmmac: skip VLAN restore when VLAN hash ops are
 missing
Message-ID: <acKL4RoM-zdwj1Ib@shell.armlinux.org.uk>
References: <20260321-vlan-restore-error-v2-1-45cf56a5223d@mmpsystems.pl>
 <5e5706bb-0f04-4bb1-94f4-45083a3c76fd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e5706bb-0f04-4bb1-94f4-45083a3c76fd@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_060450_851159_053378B9 
X-CRM114-Status: GOOD (  39.99  )
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

On Tue, Mar 24, 2026 at 01:14:29PM +0100, Paolo Abeni wrote:
> On 3/21/26 6:38 AM, Michal Piekos wrote:
> > stmmac_vlan_restore() unconditionally calls stmmac_vlan_update() when
> > NETIF_F_VLAN_FEATURES is set. On platforms where priv->hw->vlan (or
> > ->update_vlan_hash) is not provided, stmmac_update_vlan_hash() returns
> > -EINVAL via stmmac_do_void_callback(), resulting in a spurious
> > "Failed to restore VLANs" error even when no VLAN filtering is in use.
> > 
> > Check presence of VLAN HW FILTER flags before stmmac_vlan_update().
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
> > Changes in v2:
> > - Replace check for hash ops with check for HW FILTER flags
> > - Link to v1: https://lore.kernel.org/r/20260314-vlan-restore-error-v1-1-4fc6c3e2115f@mmpsystems.pl
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 6827c99bde8c..cfc0ce9cec9c 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -6863,7 +6863,8 @@ static int stmmac_vlan_restore(struct stmmac_priv *priv)
> >  {
> >  	int ret;
> >  
> > -	if (!(priv->dev->features & NETIF_F_VLAN_FEATURES))
> > +	if (!(priv->dev->features &
> > +	      (NETIF_F_HW_VLAN_CTAG_FILTER | NETIF_F_HW_VLAN_STAG_FILTER)))
> >  		return 0;
> >  
> >  	if (priv->hw->num_vlan)
> Adding Russell.
> 
> It's not obvious to me that with this change the
> restore_hw_vlan_rx_fltr() and vlan_update() callback are still invoked
> in all the relevant driver/features permutation.

I think there's a few questions here.

When CONFIG_VLAN_8021Q is enabled, then we set the filter features
if the vlhash dma capability is set:

        if (priv->dma_cap.vlhash) {
                ndev->features |= NETIF_F_HW_VLAN_CTAG_FILTER;
                ndev->features |= NETIF_F_HW_VLAN_STAG_FILTER;
        }

Only dwmac4 and dwxgmac2 have the ability to set this feature (and
thus be synthesised with the feature enabled.) From what I understand,
when present, these features are permanently enabled (as they're not
set in hw_Features).

However, in stmmac_vlan_update() there is:

        if (!priv->dma_cap.vlhash) {
                if (count > 2) /* VID = 0 always passes filter */
                        return -EOPNOTSUPP;

                pmatch = vid;
                hash = 0;
        }

So, it is clear that the intention is that stmmac_vlan_update() will
be called even when the NETIF_F_HW_VLAN_*TAG_FILTER features are not
present - consider a core that implements the VLAN ops, but has
priv->dma_cap.vlhash false.

It looks like vlan support was added in dwmac v4.0 and later cores
(from the hwif table.) As the vlan ops are NULL before that, the
horrid stmmac_do_void_callback() crud will return -EINVAL (yuck). The
method it calls is a void function, so the only possible return values
are zero if implemented, or -EINVAL if not.

stmmac_vlan_update() itself only ever returns zero if the netif
isn't running, or the above return value. So, an error returned from
stmmac_vlan_update() just means that the driver has no support for
programming the vlan configuration.

Looking at the implementations for the case where vlhash is false,
(where stmmac_update_vlan_hash() will be called with hash=0 and
perfect_match with a vid, vlan_update_hash() still write
to the VLAN_TAG register to configure vlan handling. I haven't
looked up exactly what it does.

The other possibility is dwxgmac2_update_vlan_hash(). This looks
similar.

So, I don't think that the correct solution is to only call this
function when one or more of NETIF_F_HW_VLAN_*TAG_FILTER feature flags
are set - clearly the code is written to handle the case where the
update_vlan_hash method is populated but vlhash is false and these
feature flags are clear.

Now I'm wondering whether the code in the STMMAC_VLAN_TAG_USED block
is correct:

        /* Both mac100 and gmac support receive VLAN tag detection */
        ndev->features |= NETIF_F_HW_VLAN_CTAG_RX | NETIF_F_HW_VLAN_STAG_RX;
        if (dwmac_is_xmac(priv->plat->core_type)) {
                ndev->hw_features |= NETIF_F_HW_VLAN_CTAG_RX;
                priv->hw->hw_vlan_en = true;
        }
        if (priv->dma_cap.vlhash) {
                ndev->features |= NETIF_F_HW_VLAN_CTAG_FILTER;
                ndev->features |= NETIF_F_HW_VLAN_STAG_FILTER;
        }
        if (priv->dma_cap.vlins)
                ndev->features |= NETIF_F_HW_VLAN_CTAG_TX;

The test for dwmac_is_xmac() matches for dwmac4 and dwxgmac cores. If
this is true, then we will have the vlan ops populated, and it means
that NETIF_F_HW_VLAN_CTAG_RX can be configured by the user rather than
being always-enabled. Is this correct? I'm not sure - I haven't dug
into enough of the documentation for this yet. However, I suggest
that we need to always call stmmac_update_vlan_hash() for these cores.

So, I'm coming to the conclusion that we either need a test for
dwmac_is_xmac() and not the feature flags, or maybe we just get rid
of the "Failed to restore VLANs" error print and make
stmmac_vlan_restore() return void (nothing uses the return value.)

In summary, I'm not sure what the correct approach is - please reach
out to Ovidiu Panait <ovidiu.panait.rb@renesas.com> who recently added
this code, but I'm fairly sure that this solution is incorrect.

Really, Ovidiu Panait should be reviewing this patch as his recent
change introduced the problematical error print.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

