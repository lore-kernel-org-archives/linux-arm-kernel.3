Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9C2F54AB8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 13:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sBakceNa+h7eXRYfPTnQwzKuKJrAZzuT/RmEI5RMf8s=; b=S5Yvq0Qsijq87o39cGBSzBiyjW
	UJXd0fLpFLxGgKYoASF+2RpIywghMnbepafNjGYLKGAsI35mCY6RBYz6EEtJSlPbzaMSrxEjRuVGo
	3QqdQ1yLCCt3gEZl7133WesVV5akXj7W0raEiJzhT1pFxjAHx/uusbH9C4kBSdYz+9cfRwwg0HxYR
	d3Ie42AUuOWdSpCIiCv9ruF2sXItsNgJOKdiXPExkWInzAGQd1g4TGqeO277igYlIce0b1C8pCOqu
	hTXORTGyBZli/W/IZRTGzbxlUvna46ezRxBGq0Nz7FI2LAdUH66EbwkrI2BIRCmnofS0yWJR+ikBb
	hSyWhu/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51vc-00000001YYP-1doF;
	Tue, 24 Mar 2026 13:36:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51vZ-00000001YXy-2mE7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 13:36:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D02931476;
	Tue, 24 Mar 2026 06:36:05 -0700 (PDT)
Received: from [10.57.76.67] (unknown [10.57.76.67])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 49F5B3F836;
	Tue, 24 Mar 2026 06:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774359371; bh=6Ki15S7l8XHPgNRBcqNoAGTGF7cTa367l+xsShVQxHI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gNgOXKuNdMRBgb4secaHiXtf2czXw/iJ8jS8EV0omWiHC1pUpc1d9+L0HWMGwGkcR
	 N1YkeFBL9JagNz7itQgMZleszv1hcgbSmTTgH7REHuITcN4qxft1/mkbvkAOYwU1ty
	 O7LZY/a7MD5HOa48ZLjWiSonQJe51FGY/r4yyupk=
Message-ID: <77e54936-0d1b-452c-a9cc-36c6f03930f0@arm.com>
Date: Tue, 24 Mar 2026 13:36:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] dmaengine: arm-dma350: support combined IRQ mode
 with runtime IRQ topology detection
To: Jun Guo <jun.guo@cixtech.com>, peter.chen@cixtech.com,
 fugang.duan@cixtech.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, vkoul@kernel.org, ychuang3@nuvoton.com,
 schung@nuvoton.com, Frank.Li@kernel.org
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
 linux-arm-kernel@lists.infradead.org
References: <20260324120113.3681830-1-jun.guo@cixtech.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260324120113.3681830-1-jun.guo@cixtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_063613_841320_5D2305AD 
X-CRM114-Status: GOOD (  18.86  )
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

On 2026-03-24 12:01 pm, Jun Guo wrote:
> DMA-350 can be integrated with either one interrupt per channel or a
> single combined interrupt for all channels. This series adds support
> for the combined IRQ topology while keeping compatibility with the
> per-channel topology.
> 
> Patch 1 updates the DT binding to describe both interrupt topologies
> (1 combined IRQ or 8 per-channel IRQs).
> 
> Patch 2 updates the driver to detect IRQ topology at runtime via
> platform_irq_count(), handle both modes in one code path, and enable
> DMANSECCTRL.INTREN_ANYCHINTR only in combined IRQ mode.
> 
> Patch 3 adds the Sky1 DMA DT node using the combined IRQ topology.
> 
> Tested on CIX SKY1 with dmatest:
>    % echo 2000 > /sys/module/dmatest/parameters/timeout
>    % echo 1 > /sys/module/dmatest/parameters/iterations
>    % echo "" > /sys/module/dmatest/parameters/channel
>    % echo 1 > /sys/module/dmatest/parameters/run
> 
> Changes in v5:
> - Fix the formatting issue in the AI tag.
> - Remove the unnecessary "cix,sky1-dma-350".

Please don't churn reposts of a series so quickly. I've only just had 
time to finish the review of v3 that you posted only 3 working days ago, 
that I already moved over as a reply to yesterday's v4 for visibility...

Thanks,
Robin.

> Changes in v4:
> - Reword binding text to align with kernel style.
> - Revise the AI attribution to the standard format.
> - Remove redundant links from the commit log.
> 
> Changes in v3:
> - Rework binding compatible description to match generic-first model.
> - Keep interrupts schema support for both 1-IRQ and 8-IRQ topologies.
> - Drop SoC match-data dependency for IRQ mode selection.
> - Detect IRQ topology via platform_irq_count() in probe path.
> - Refactor IRQ handling into a shared channel handler.
> - Enable DMANSECCTRL.INTREN_ANYCHINTR only in combined IRQ mode.
> 
> Changes in v2:
> - Update to kernel standards, enhance patch description, and refactor
>   driver to use match data for hardware differentiation instead of
>   compatible strings.
> 
> Jun Guo (3):
>    dt-bindings: dma: arm-dma350: document combined and per-channel IRQ
>      topologies
>    dma: arm-dma350: support combined IRQ mode with runtime IRQ topology
>      detection
>    arm64: dts: cix: add DT nodes for DMA
> 
>   .../devicetree/bindings/dma/arm,dma-350.yaml  |  25 ++-
>   arch/arm64/boot/dts/cix/sky1.dtsi             |   7 +
>   drivers/dma/arm-dma350.c                      | 164 +++++++++++++++---
>   3 files changed, 161 insertions(+), 35 deletions(-)
> 


