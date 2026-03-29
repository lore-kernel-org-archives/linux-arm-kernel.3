Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AAB8F3D601
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 18:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qGzDB+BbAy2UxWoOKWueCLa/Ve0k5Xt432NyksbrD1U=; b=I8B00taFYKzLkTzM9s7bJ6ATfY
	VrAH5xIEM+lyCF3u+/4qvnNvUhOWuNTVGm5/Y+w3BjverRRP73rae6GDC0qDNQeBZN7HU1FgTJ3nh
	2EsTYevhne85fZSEn1oPGCvN6UHCojXAkp7N5IogPeMDkevBKe8U+q/G8YSV8gWcpvCN9xGog53Y+
	sqATTnAi1HXKLLb+JO7YqZJwQfzxmsMac2FkC/ZbmLMkxJrHp7MWcV4kkCeo6/q3DAhKCGM55qSzi
	TJAt0sTNOa6+npVXcOfSUVg86uLCgxYpA50ZJYQHhan0s1wwklLLgp2HjgpkFimrfRxpS3lNASSBz
	A3QTRDSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6uno-0000000AEjq-21xL;
	Sun, 29 Mar 2026 18:24:00 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6unk-0000000AEjP-3eoI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 18:23:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qGzDB+BbAy2UxWoOKWueCLa/Ve0k5Xt432NyksbrD1U=; b=OI9CE+1jdkOigebK4UrGva7oIH
	3kb6rNiaKlWyPv2pDJn6V1iQL+x3Xtk85WTKuiPDyEx6wH4eVUKwm1tQU6SUbEkj2LpFy75BYdzXI
	ij5MXbjcz8hCG+Nkh+/BOZUT8UpGncxn5isVX7KDE8IIEyltT21JtcHm9VLbkg/JD4+wwEr+bL3fc
	0vmnLgqW07tzcvAL090WEePlhMqKqWKqBvYvGtpvt95cdj2thxGnqttJjOTydf0ENTF0IxPYP0Dts
	+49KfUhFq9JwHkJnQACDdjYh6cLKTSuBsyROp4wJcEQJ6VYOfckxw1Zp6zWc9PyDBYOhot1H7uaJH
	tX13naQg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49410)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w6unc-000000008Ak-0F8p;
	Sun, 29 Mar 2026 19:23:48 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w6unY-000000001vr-31Tz;
	Sun, 29 Mar 2026 19:23:44 +0100
Date: Sun, 29 Mar 2026 19:23:44 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Ong Boon Leong <boon.leong.ong@intel.com>,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 01/10] net: stmmac: fix TSO support when some
 channels have TBS available
Message-ID: <acluMCDdWFPSw_Zr@shell.armlinux.org.uk>
References: <achJ1dfeT6Q8rBuX@shell.armlinux.org.uk>
 <E1w6bKj-0000000ELtf-3md9@rmk-PC.armlinux.org.uk>
 <acjzmxY9xmBInSwm@shell.armlinux.org.uk>
 <20260329104223.358351ee@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260329104223.358351ee@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_112357_185718_D1FE4E7D 
X-CRM114-Status: GOOD (  35.20  )
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

On Sun, Mar 29, 2026 at 10:42:23AM -0700, Jakub Kicinski wrote:
> On Sun, 29 Mar 2026 10:40:43 +0100 Russell King (Oracle) wrote:
> > On Sat, Mar 28, 2026 at 09:36:41PM +0000, Russell King (Oracle) wrote:
> > > According to the STM32MP25xx manual, which is dwmac v5.3, TBS (time
> > > based scheduling) is not permitted for channels which have hardware
> > > TSO enabled. Intel's commit 5e6038b88a57 ("net: stmmac: fix TSO and
> > > TBS feature enabling during driver open") concurs with this, but it
> > > is incomplete.
> > > 
> > > This commit avoids enabling TSO support on the channels which have
> > > TBS available, which, as far as the hardware is concerned, means we
> > > do not set the TSE bit in the DMA channel's transmit control register.
> > > 
> > > However, the net device's features apply to all queues(channels), which
> > > means these channels may still be handed TSO skbs to transmit, and the
> > > driver will pass them to stmmac_tso_xmit(). This will generate the
> > > descriptors for TSO, even though the channel has the TSE bit clear.
> > > 
> > > Fix this by checking whether the queue(channel) has TBS available,
> > > and if it does, fall back to software GSO support.  
> > 
> > This is sufficient for the immediate issue of fixing the patch below,
> > but I think there's another issue that also needs fixing here.
> > 
> > TSO requires the hardware to support checksum offload, and there is
> > a comment in the driver:
> > 
> >         /* DWMAC IPs can be synthesized to support tx coe only for a few tx
> >          * queues. In that case, checksum offloading for those queues that don't
> >          * support tx coe needs to fallback to software checksum calculation.
> >          *
> >          * Packets that won't trigger the COE e.g. most DSA-tagged packets will
> >          * also have to be checksummed in software.
> >          */
> > 
> > So, it seems at the very least we need to add a check (in a subsequent
> > patch) for priv->plat->tx_queues_cfg[queue].coe_unsupported to
> > stmmac_channel_tso_permitted().
> > 
> > I'm also wondering about the stmmac_has_ip_ethertype() thing, which
> > checks whether the skb can be checksummed by the hardware, and how that
> > interacts with TSO, and whether that's yet another hole that needs
> > plugging.
> 
> If the driver "un-advertises" checksum offload accordingly the core
> should automatically clear TSO feature.

Ah, yes, it's in harmonize_features().

However, I think that stmmac_has_ip_ethertype() is tighter than the
checks that harmonize_features() does.

stmmac_has_ip_ethertype():
        int depth = 0;
        __be16 proto;

        proto = __vlan_get_protocol(skb, eth_header_parse_protocol(skb),
                                    &depth);

        return (depth <= ETH_HLEN) &&
                (proto == htons(ETH_P_IP) || proto == htons(ETH_P_IPV6));

If I'm reading this correctly, then eth_header_parse_protocol(skb)
will return the contents of the ethernet header protocol field.

__vlan_get_protocol() will then return:

 - that protocol if it is not a vlan (0x8100 or 0x88A8)
   with depth set to skb->mac_len, which should be ETH_HLEN here.
 - the protocol below the vlan headers, in which case depth
   will be > ETH_HLEN

Unless I've missed something, that basically means that the 
__vlan_get_protocol() is pointless there, and the entire function
could just be checking that eth_header_parse_protocol(skb) returns
IP or IPv6.

Isn't it the case that skb->protocol should be the same as
eth_header_parse_protocol(skb) for a packet being transmitted at the
point that .ndo_features_check() or .ndo_start_xmit() is called?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

