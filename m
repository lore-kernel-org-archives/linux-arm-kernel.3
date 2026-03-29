Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1879F3D616
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 17:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ciwR+Yq7ju75Bn/QB75/ch5qLZQgENkzyPM8tTaImt0=; b=hhuPpOwvpKbSupE5a8bTQrcpE8
	gLkmVo2dqdfiEbALQaXZrK5nrh/rZyR5PFQGiOwRcCDVaPXQWBYEcECqPlZdra+M9msADRdH9NVhO
	YuVkv9AF2kpL1S5h9UawM58fg0hPeP6T8VmuTKudayJ+dStwAjy2i5BbNV+SnCxqqg4TxD0dM3HFt
	DHCFPJuVAsQxn8Yftsod/5B7vmmAbpHL38FklPilr5HagIUL8tIaJfbahZ+yXEGzCN1TrWB/dL0lN
	fuBxACHMW6s7htzegaGNlcCrxL+CvWrAOtnQSxNLT9OQZO2A3GbTyEgIV9xzKHCRgxSynMcOWCkgB
	vI1iHaJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6u9b-0000000AD6q-2V64;
	Sun, 29 Mar 2026 17:42:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6u9a-0000000AD6j-3bWw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 17:42:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D683660054;
	Sun, 29 Mar 2026 17:42:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD8E1C116C6;
	Sun, 29 Mar 2026 17:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774806145;
	bh=Dgjm5JDJVPVi105xPjT0M4xjKqbcapeMVq6MJrJMHiM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=K1jBwiTRDPR5JvC58W6u26L8/DtzjfHPUvIDFhoueqTs8Yyh8imbx+gyg0AEbJ/C0
	 E/P0YqYGro7/VjB/9vvmPxzj73HJ4eBS1VwSEaZhQms+WwMizCdiV66lfek0iR+XlR
	 5NYPjEn7exjhGjtri4rs0Qw5sqU9W1VtBOsvxmJGAlzVMVcHt/vdg3iMHgMk/Mu7i0
	 JQlYlUt+FkmspPZR98PWwk1stUEgEOpZBI8PMzOWegLeUSUp8hly7TiljKmUZE3ftQ
	 QXAio38VTVRmvs8A4BEgGzp86HFnRZCx//Kcbr6dkoDVJ3E+xD5Vhk3Y+qWRz05zRX
	 wZwT7h1mgwS0Q==
Date: Sun, 29 Mar 2026 10:42:23 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org, Ong Boon
 Leong <boon.leong.ong@intel.com>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 01/10] net: stmmac: fix TSO support when some
 channels have TBS available
Message-ID: <20260329104223.358351ee@kernel.org>
In-Reply-To: <acjzmxY9xmBInSwm@shell.armlinux.org.uk>
References: <achJ1dfeT6Q8rBuX@shell.armlinux.org.uk>
	<E1w6bKj-0000000ELtf-3md9@rmk-PC.armlinux.org.uk>
	<acjzmxY9xmBInSwm@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sun, 29 Mar 2026 10:40:43 +0100 Russell King (Oracle) wrote:
> On Sat, Mar 28, 2026 at 09:36:41PM +0000, Russell King (Oracle) wrote:
> > According to the STM32MP25xx manual, which is dwmac v5.3, TBS (time
> > based scheduling) is not permitted for channels which have hardware
> > TSO enabled. Intel's commit 5e6038b88a57 ("net: stmmac: fix TSO and
> > TBS feature enabling during driver open") concurs with this, but it
> > is incomplete.
> > 
> > This commit avoids enabling TSO support on the channels which have
> > TBS available, which, as far as the hardware is concerned, means we
> > do not set the TSE bit in the DMA channel's transmit control register.
> > 
> > However, the net device's features apply to all queues(channels), which
> > means these channels may still be handed TSO skbs to transmit, and the
> > driver will pass them to stmmac_tso_xmit(). This will generate the
> > descriptors for TSO, even though the channel has the TSE bit clear.
> > 
> > Fix this by checking whether the queue(channel) has TBS available,
> > and if it does, fall back to software GSO support.  
> 
> This is sufficient for the immediate issue of fixing the patch below,
> but I think there's another issue that also needs fixing here.
> 
> TSO requires the hardware to support checksum offload, and there is
> a comment in the driver:
> 
>         /* DWMAC IPs can be synthesized to support tx coe only for a few tx
>          * queues. In that case, checksum offloading for those queues that don't
>          * support tx coe needs to fallback to software checksum calculation.
>          *
>          * Packets that won't trigger the COE e.g. most DSA-tagged packets will
>          * also have to be checksummed in software.
>          */
> 
> So, it seems at the very least we need to add a check (in a subsequent
> patch) for priv->plat->tx_queues_cfg[queue].coe_unsupported to
> stmmac_channel_tso_permitted().
> 
> I'm also wondering about the stmmac_has_ip_ethertype() thing, which
> checks whether the skb can be checksummed by the hardware, and how that
> interacts with TSO, and whether that's yet another hole that needs
> plugging.

If the driver "un-advertises" checksum offload accordingly the core
should automatically clear TSO feature.

