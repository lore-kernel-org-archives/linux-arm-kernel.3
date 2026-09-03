Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96411C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 17:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IoLH/hhN9t2gCsFXAHpa1BHsHfqKZHWk++1GVr4n0bI=; b=A2i3OjKqE7Bt+zTYsOgk9R66kt
	VOG4m+TVBOlcUgcH9h/O7IoX7Yu93m82jwjJjRkxG8f5ILw/YdcRBiKqbmHVJsbIIsUvz+8jHEEW7
	we4sJPE3i8CbOyr91fWChctknExshPqEzhu+iUl5BkA5n1oVbpygJ6+OpO0gIztb1uwWpTdIuAQXH
	Hckdt5K0YlqGqywzYQ1jkZ+Y624FC3GrenZJIZvchwcgC7d8wv8NERW4OiVIGrY5845vtcJt+8yZ7
	NhpRVYWDFUGMfDCSqMcL6nFKXukLGj7b1hwvHAwV/wMU44s2wlHBZg2nW1NR6WG2iDIMyCXmv3ix6
	C2H75E4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Ark-00000000Eah-44bh;
	Thu, 03 Sep 2026 17:04:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Arj-00000000EZz-3LlT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 17:04:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2E1DB6053B;
	Thu,  3 Sep 2026 17:04:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AE451F000E9;
	Thu,  3 Sep 2026 17:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788455082;
	bh=IoLH/hhN9t2gCsFXAHpa1BHsHfqKZHWk++1GVr4n0bI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=oBnv8rhEodtCXyDWfOzmRB+rnPeUQjUPhuJpegQHEHhth2Hav0I1W1aABsNjvhneB
	 8rJvbS36xEMorJ2FF8z5CG9Hued3/lPeq6vxDdBXkb3LaLwITN/2mFDCE89m4Lk5EJ
	 liEYUzYROIsOE+NxhB8y5jD90xGQq4Ui+HwhYeYBQxbxRmC76+p4FwygalW1wYN29h
	 d7Sovp+Q1y2krd3i3bRPR8QawhZQnixEWEc4J859QqMMXPbJEf4HqpDqifLSoxRRPR
	 ZaaLuEO5iGQCY396f3THhdu5UoquFFKgRMhFKO8h1GeC+a2HgGw3NYZ8Fc4BmiBnPs
	 HMpIPw/6VP9mw==
From: Vinod Koul <vkoul@kernel.org>
To: ludovic.desroches@microchip.com, Frank.Li@kernel.org, 
 tudor.ambarus@linaro.org, nicolas.ferre@microchip.com, 
 Hongling Zeng <zenghongling@kylinos.cn>
Cc: linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, zhongling0719@126.com, sashiko-bot@kernel.org, 
 Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20260727061705.45169-1-zenghongling@kylinos.cn>
References: <20260727061705.45169-1-zenghongling@kylinos.cn>
Subject: Re: [PATCH RESEND v6] dma: at_hdmac: Fix use-after-free by proper
 tasklet cleanup
Message-Id: <178845507904.1711546.7183586519826680915.b4-ty@kernel.org>
Date: Thu, 03 Sep 2026 22:34:39 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Mon, 27 Jul 2026 14:17:05 +0800, Hongling Zeng wrote:
> Current cleanup paths have a use-after-free vulnerability:
> - vchan_init() creates tasklets that access at_dma_chan memory
> - free_irq() only waits for IRQ handler, NOT tasklets
> - atdma is devm-managed and freed after probe/remove
> - Running tasklets accessing freed memory → Use-After-Free!
> 
> The fix requires careful ordering:
> - free_irq() FIRST to synchronize with running IRQ handlers and prevent
>   them from scheduling new tasklets
> - Then kill tasklets to wait for already-scheduled ones to complete
> - Only then free other resources
> 
> [...]

Applied, thanks!

[1/1] dma: at_hdmac: Fix use-after-free by proper tasklet cleanup
      commit: 00c5236057e36e88d3aca7246dd891cb56b513a7

Best regards,
-- 
~Vinod



