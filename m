Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A29F6CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 22:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AwNxNeaNpD6uE4Gg7BQoNluSVl3Qj4wQb6AvWZjUprY=; b=1w6nvLxkz7aVwJeDz5cSJn0goG
	8vV8EPS3W93wMCU17Sol0B0wYHglEhgi7JV5dTAjPy89G/ZvsgfiOjAsZmtXuWbRb/trXcF+yeZtM
	8GyHtMhhaCNi2uuRpL2YrzY3SLgb32vehClEgwSguRPDT484jxqQdsvebpVQmleDP0FEuPeVJCf7c
	SVbsF2pRSp4zl4WXSZic8AtQkZFzEVRpG/ADHlKMV2rEHp7C+BySIRcBoozyBokfa5wQVn6NwvGvP
	+pOqS/dC5Tbevl/J5IZrCY+eEE/4WvDQF69yDwfpvj3XNGDRaeKQhJbrJyprgOcyO8WVEXtgyTbZs
	jYrFOHkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCPOH-0000000AMHV-3TXn;
	Thu, 01 Oct 2026 22:36:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCPOG-0000000AMHP-0tIj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 22:36:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A4642412F0;
	Thu,  1 Oct 2026 22:36:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A71331F000FF;
	Thu,  1 Oct 2026 22:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790894195;
	bh=AwNxNeaNpD6uE4Gg7BQoNluSVl3Qj4wQb6AvWZjUprY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RjZUvxqf/0Xcyoh3Y2wcNkYVE8cIlu2jnCDtLDY5fzTLOLBTOd5tK4k7iQ0pDmltY
	 85mXJg3W+INuH7wxv14IwuA4vgb8+Fym/yLLboqcsXBMkv9z8k7mCGuxeITYLGqkhB
	 zfXptKxS3uKrUcubsUr9eOWv5YHKXooe34ypwHC//oJQWtZPXXoyPwo4eLlgnaG09f
	 RrNpc5W5jKyAIoRGHNOPnhPLarn5dxJSdK4huWIDmiXoJmRK1Ww+UigYi4I64Agf3U
	 CJzpkAqlCY3/oxLAkVzQAraNde/C01BP88o7s8bmnBJWcs+S6T2FyI72T+lvHWQJK8
	 UYFp6qOFfzXbw==
Date: Fri, 2 Oct 2026 00:36:31 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Hongjian Dai <daihongjian@kylinsec.com.cn>
Cc: codrin.ciubotariu@microchip.com, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, me@cherr.cc
Subject: Re: [PATCH] i2c: at91: release DMA channels when probe defers
Message-ID: <ar7gTv9It4L_kuSM@zenone.zhora.eu>
References: <7D85C6CB6BF0A82E+20260929164340.41628-1-daihongjian@kylinsec.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7D85C6CB6BF0A82E+20260929164340.41628-1-daihongjian@kylinsec.com.cn>
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

Hi Hongjian,

On Wed, Sep 30, 2026 at 12:43:40AM +0800, Hongjian Dai wrote:
> at91_twi_probe_master() can return -EPROBE_DEFER from
> at91_init_twi_recovery_info() after at91_twi_configure_dma() has already
> claimed the tx/rx DMA channels. at91_twi_probe() then returns without
> releasing them, and since dma_request_chan() is not devres-managed the
> channels leak on every deferred probe attempt.
> 
> Release the channels before deferring the probe.
> 
> Fixes: f7eeb1af8537 ("i2c: at91: release DMA channels on remove and probe error")
> Assisted-by: LLM
> Signed-off-by: Hongjian Dai <daihongjian@kylinsec.com.cn>

pushed to i2c/i2c-fixes.

Thanks,
Andi

