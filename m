Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AE2F3D5FC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 09:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VedDf6KjO7+dUX4YVKgtrHVL8jRFgWiX8TrdhyAcPls=; b=Sqdfk6oiI2jaQlJuZ16U10GjNH
	DM0epxj69l+2mXc7jhh/F5fIIEmUIk6qDtSJnZJR5zQWq1zFlmt2tSNx0Bwml/FoxTunA0NLExGnK
	WAFrfmDQ1d2/vAVZm5A+/YOZ3XfccdmxuTMYOF2eIeVT9nZ7z/DUgl1DQ/tE7DGBtZqA89VQug5fo
	3FQbUo3NWR1ngU/DOOlScrqEJ7T+W5PtKq3XY0xY7NUZgQy9RE62rj/IcMRJ9tY0mA+RB/Od8Rm2X
	u4j5IMmMnKvgUaZ6SV+svK7CYsIyV1dZ8kuxctu15zmiu/EAthOxfBLLO0/fZMAlRKgohs0R+4io2
	f7N86OLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6mdb-00000009njV-0psk;
	Sun, 29 Mar 2026 09:40:55 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6mdZ-00000009njB-1Cm8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 09:40:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VedDf6KjO7+dUX4YVKgtrHVL8jRFgWiX8TrdhyAcPls=; b=Jc2Py1MS/550Vpu9IWtlooDX44
	a0y5FYBt2WATmyZfNO92STW5xUTWe20esS0KQaitLEMVxE5zzvgpVCe+rGXRGf0nKgcKhnzpfVP/8
	HB0uIISrxjcnHVgMQgzk35Xa5LhZ7AVOgkHHiXLWa6PR3MI3d8M60nBpUUUnsM1nLJVlSxTcunyaC
	UvIW3GzBYgDtz87l1RA6s7K/U0JZjT/3yGHKm8hfd8cfCFOEyeZgAMmq8O+zKeDpSXU87fZR3V4IF
	33/hmTlexM7N21VguQNH6cZXzpB+RcuGNjg8QNUS86npk/fjLmlUkbf0Nd77xQKRd1QkY0BOI2BdZ
	//cPxMQg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49578)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w6mdT-000000007qA-0Mle;
	Sun, 29 Mar 2026 10:40:47 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w6mdP-000000001cj-2hQZ;
	Sun, 29 Mar 2026 10:40:43 +0100
Date: Sun, 29 Mar 2026 10:40:43 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Ong Boon Leong <boon.leong.ong@intel.com>,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 01/10] net: stmmac: fix TSO support when some
 channels have TBS available
Message-ID: <acjzmxY9xmBInSwm@shell.armlinux.org.uk>
References: <achJ1dfeT6Q8rBuX@shell.armlinux.org.uk>
 <E1w6bKj-0000000ELtf-3md9@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1w6bKj-0000000ELtf-3md9@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_024053_324733_2EE1E30A 
X-CRM114-Status: GOOD (  20.02  )
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

On Sat, Mar 28, 2026 at 09:36:41PM +0000, Russell King (Oracle) wrote:
> According to the STM32MP25xx manual, which is dwmac v5.3, TBS (time
> based scheduling) is not permitted for channels which have hardware
> TSO enabled. Intel's commit 5e6038b88a57 ("net: stmmac: fix TSO and
> TBS feature enabling during driver open") concurs with this, but it
> is incomplete.
> 
> This commit avoids enabling TSO support on the channels which have
> TBS available, which, as far as the hardware is concerned, means we
> do not set the TSE bit in the DMA channel's transmit control register.
> 
> However, the net device's features apply to all queues(channels), which
> means these channels may still be handed TSO skbs to transmit, and the
> driver will pass them to stmmac_tso_xmit(). This will generate the
> descriptors for TSO, even though the channel has the TSE bit clear.
> 
> Fix this by checking whether the queue(channel) has TBS available,
> and if it does, fall back to software GSO support.

This is sufficient for the immediate issue of fixing the patch below,
but I think there's another issue that also needs fixing here.

TSO requires the hardware to support checksum offload, and there is
a comment in the driver:

        /* DWMAC IPs can be synthesized to support tx coe only for a few tx
         * queues. In that case, checksum offloading for those queues that don't
         * support tx coe needs to fallback to software checksum calculation.
         *
         * Packets that won't trigger the COE e.g. most DSA-tagged packets will
         * also have to be checksummed in software.
         */

So, it seems at the very least we need to add a check (in a subsequent
patch) for priv->plat->tx_queues_cfg[queue].coe_unsupported to
stmmac_channel_tso_permitted().

I'm also wondering about the stmmac_has_ip_ethertype() thing, which
checks whether the skb can be checksummed by the hardware, and how that
interacts with TSO, and whether that's yet another hole that needs
plugging.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

