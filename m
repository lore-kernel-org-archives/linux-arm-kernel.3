Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63404C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 17:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vYNQ8VX97EaCI8U1DSIB17rVPQxvYw0f7K2FluDPZoA=; b=kju9FfNXfK6tFaS/xd2KnxeRL/
	MZN/ewPxJ8PiACXwOWBOU0CPWB9jTQwclDylzXTuUMpFzUbLQJX8VPMi53AyJtg+yFusJ1rh58SLw
	wfLwZAJrR5KvrR9PKIFu7BkLi4E6U6SXtS7NrAd5EGS7hLaX0p7yqQhO083F60h9TbhHwdwRSf4kO
	0pZ9vqQBCMz7E+WlV/cYJrS5kjZss3xi3n05ye6Lrijr0ex0hXCXj6dLJos+DMDJ0lgpDLTxGgn0i
	1LKlIQFw1PCjphdWCVTIp2nl2Us0LuAysotHntz8N6VO1CPs0Al51tpjpz9kXY7BQYfmbjqNnebxc
	rPu9qxGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2As0-00000000Eir-1Ef3;
	Thu, 03 Sep 2026 17:05:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Arz-00000000Eht-0Rga
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 17:04:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D51F1447AD;
	Thu,  3 Sep 2026 17:04:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 834C31F00A3E;
	Thu,  3 Sep 2026 17:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788455098;
	bh=vYNQ8VX97EaCI8U1DSIB17rVPQxvYw0f7K2FluDPZoA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fRlf0DDq8TN6EgULfeOX0yIZMBB7GUdK+mj9D9bekyGgEh2BNMC1L7IJekf/p2DVq
	 Pn3NvubYZgZHRUvymmmiYJnqeKh59Eqr4nkN4bDQV/JEUcKjo6pUf+5+Ynkm3Zqlus
	 Z64xrDe2tcaQTNYeeEFyClqxVEZ1K5kSJ8Gwip2isGTt6mXVOwT1jHRkCr6hozdwuk
	 bVln045yaTHz6nG7MtBU1Kf2jrA+O6ST7p4vY03P6yO5x8Ck91GNeD/TybBN5Rwt+t
	 UMgerG8ngVxK6aqaed3bcvATkbjJa6QHvR4RCR1mGFd7ixY4eQmN3c79w2A1xln/+d
	 VrJce9NYZ9uTA==
From: Vinod Koul <vkoul@kernel.org>
To: Frank.Li@kernel.org, michal.simek@amd.com, 
 Golla Nagendra <nagendra.golla@amd.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, git@amd.com
In-Reply-To: <20260814045616.1661199-1-nagendra.golla@amd.com>
References: <20260814045616.1661199-1-nagendra.golla@amd.com>
Subject: Re: [PATCH V2 0/8] dmaengine: zynqmp_dma: Fix error paths and
 follow-up cleanups
Message-Id: <178845509608.1711546.18424966399852946639.b4-ty@kernel.org>
Date: Thu, 03 Sep 2026 22:34:56 +0530
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


On Fri, 14 Aug 2026 10:26:08 +0530, Golla Nagendra wrote:
> This series fixes error-path cleanup issues in alloc/probe flows and
> applies follow-up cleanups in the Xilinx ZynqMP DMA driver.
> 
> This series fixes error-path cleanup issues in alloc/probe flows and
> applies follow-up cleanups in the Xilinx ZynqMP DMA driver.
> 
> Patch 1 fixes runtime PM rollback when sw_desc_pool allocation fails
> after pm_runtime_resume_and_get().
> 
> [...]

Applied, thanks!

[1/8] dmaengine: zynqmp_dma: Fix PM rollback on sw_desc_pool alloc failure
      commit: a073a5796b3b95062f2c1ecf6ab446cb2596f38e
[2/8] dmaengine: zynqmp_dma: Free sw_desc_pool on desc_pool_v alloc failure
      commit: 25cfbf610a7277e0b08195953fb6aaf8b64cf845
[3/8] dmaengine: zynqmp_dma: Fix chan probe/remove error handling
      commit: 3f30db282c28cc35a502aa1cec34fb642854b057
[4/8] dmaengine: zynqmp_dma: Fix stale kerneldoc comments
      commit: 584f033c5c7954a412781e9089247cd6f47ae73e
[5/8] dmaengine: zynqmp_dma: Fix minor whitespace
      commit: 5089056bf050e3231313d873e0bc1ed0c63e5418
[6/8] dmaengine: zynqmp_dma: Use of_dma_is_coherent for dma-coherent
      commit: ce71cd145014d50ce4f9358c23c933b60f205cdd
[7/8] dmaengine: zynqmp_dma: Reject zero-length memcpy transfers
      commit: fec4a5a61945e641eb9ce89e24598ee19a78cebc
[8/8] dmaengine: zynqmp_dma: Remove unused define and duplicate IRQ bit
      commit: 868457a86a585d0ff04f03ecca2a5737561f23e7

Best regards,
-- 
~Vinod



