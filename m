Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C45A9C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 12:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eQBV55pjnPQzDP+7XLl0sT2CKxbeF7SyKYEGPiZVinQ=; b=F1uDziyYBW/oSgALjZst0ByHw2
	GKUjoFEZz6YU71ST2wn4/rwMXIOPGe5rUECVmCWCFFJErsO/ZXEtbrsyZ6+YSAfteDyVF0vFOQ2z/
	FaLwH06kAQX5qCveobAyrMW/RL7exfKkjfC72/w2VBS1r2VmsBSsE6kYF8370KIkzbT+0ahESzUBC
	aIakPHD20xWT4kMN6mBTqxbjktc7hAXLuLgTpGZvOZe6roan1HsfZX0xJ57M9c/6rbRVR66VLHdEN
	/epNDtKdC6xCaqu5lB5NIcDzBOZrTfJ2iJGS6roXNWxVdTSgcubS75pQvUbilyALEBNmPjry+iZ7R
	fukhJq/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhn3-00000002IdI-0B8b;
	Fri, 17 Jul 2026 12:35:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhn2-00000002IdB-2Edk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 12:35:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E2816418EB;
	Fri, 17 Jul 2026 12:35:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF6C91F000E9;
	Fri, 17 Jul 2026 12:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784291739;
	bh=eQBV55pjnPQzDP+7XLl0sT2CKxbeF7SyKYEGPiZVinQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NzxcOn7E2r9Xy1DDG2MutRPBR1JRlm+9Wd6wqR0bviRX5uhKgenCqXRxOyllvSOBH
	 4D4hbAJqEGGRY2n/W9gC6YKLzNGswuU12ocXS4xynXmjdGikdMpfduSYHjS62H76gA
	 OAGOfqWEPY3HmPzpYKVrlI3iJZEXtPDeOMCZZ8QByoXzrC3tyEUx9NVXoyINGNMZO/
	 0U1G8ZxreuM5HwiUDuONVFnnBrK/UaL4qd/WTS8LmfcNw9YPaDXP3xJwXmhmaFq6v9
	 jWT3T/HKGIuJK3RLFXRp/W+6h0HG5Wkasxi9JRmrzfFLIqh+d6qC9DW/rEFXwJS/rc
	 rcrj+ddlt//bg==
From: Vinod Koul <vkoul@kernel.org>
To: peter.chen@cixtech.com, fugang.duan@cixtech.com, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, ychuang3@nuvoton.com, 
 schung@nuvoton.com, robin.murphy@arm.com, Frank.Li@kernel.org, 
 Jun Guo <jun.guo@cixtech.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260521072924.3000282-1-jun.guo@cixtech.com>
References: <20260521072924.3000282-1-jun.guo@cixtech.com>
Subject: Re: (subset) [PATCH v7 0/2] dmaengine: arm-dma350: handle shared
 channel IRQ wiring on sky1
Message-Id: <178429173437.1176696.17881383591434929640.b4-ty@kernel.org>
Date: Fri, 17 Jul 2026 18:05:34 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Thu, 21 May 2026 15:29:22 +0800, Jun Guo wrote:
> This series updates DMA-350 support for the SKY1 integration where all
> DMA
> channel interrupt outputs are wired to the same GIC SPI.
> 
> Patch 1 enables DMANSECCTRL.INTREN_ANYCHINTR in the driver so
> per-channel
> interrupt status is propagated even when channels share one parent IRQ
> line.
> 
> [...]

Applied, thanks!

[1/2] dmaengine: arm-dma350: enable ANYCH interrupt for shared IRQ wiring
      commit: 643c1e1ae3eb3cd9be31e83c2240e41849a6cb56

Best regards,
-- 
~Vinod



