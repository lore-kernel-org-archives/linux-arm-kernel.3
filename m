Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74278C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 14:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=76FpYM6Ge1vqPMazt7qg6DlSjkLRIZk420Qx/acPMmw=; b=gk1ywcc8wkV4rAiYVLLe4KHDpI
	cgAnEkJS9po3e0GiOhaw3K5Zc161cpLn4ulofIaK9dta0kuVePkiPlsYbwdKKqrSwtwaT6Cf2DtqP
	ro9q8Fmnrj3oIwRlT5NyUzl0rGgE50WvbIpYSfu8/iS2lHAPj1G6P7orJsfLc394H0rNkHzQPfZwk
	toP+F0fSZmYgAkiMtx5pRxP9HQRENFMSuQ1DPYuYHr66HPpf6quJ2b2+mL0sgFiyiYdIMewUbPLtg
	mB/HOAUQZ0q4FZwmOuj6rxZzE7RUNVtXnJQMzIcqr6qXIAyiaefde52OmHaX4zPdHwd9ly5tYXcWt
	EgbchM6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fQi-0000000EZeC-1lad;
	Thu, 10 Sep 2026 14:07:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fQc-0000000EZXS-1cdd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 14:07:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2929B40B8E;
	Thu, 10 Sep 2026 14:07:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC6871F000FF;
	Thu, 10 Sep 2026 14:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789049222;
	bh=76FpYM6Ge1vqPMazt7qg6DlSjkLRIZk420Qx/acPMmw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BlCzojX3Q0bsYwxm2sTiXEjuFBoLHnV+YcU812sF5drsbQCRV5Ibt2uztD1+ZxxOn
	 9RizU3GtxvtH6g3YEvf0NPdzI3dssg1CWFYF5gjaAetdBhQhYl53FElaEClrlegJSZ
	 /s9lUxID1mLHAGuhTQSoA8cz/cptKmWfn5lNJQvqsZFA4bRaAXspTh1Id6xch4GoxD
	 nDDRMaGuphtnMa7pk5c0IHEvzObUsKOGmFpg2SoykVpSqN4RWMmAl3aeYWLrR8W9yG
	 moR+luPjvreVWPqvTDrCnWj5ipZzYPSdvDukwDFhXIKMEpFcR/dmI2N1N7cPCCNhj+
	 4DdngHBzbZGSA==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Kedareswara rao Appana <appana.durga.rao@xilinx.com>, 
 Alex Bereza <alex@bereza.email>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260818-fix-hw-buf-desc-after-cyclic-mode-v2-1-530ff44c6a81@bereza.email>
References: <20260818-fix-hw-buf-desc-after-cyclic-mode-v2-1-530ff44c6a81@bereza.email>
Subject: Re: [PATCH v2] dmaengine: xilinx_dma: Fix hardware buffer
 descriptor chain after cyclic DMA
Message-Id: <178904921939.109109.4260321202940337828.b4-ty@kernel.org>
Date: Thu, 10 Sep 2026 19:36:59 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Tue, 18 Aug 2026 09:36:29 +0200, Alex Bereza wrote:
> Using the DMA in cyclic mode modifies the hardware buffer descriptor
> chain in xilinx_dma_prep_dma_cyclic so that the last descriptor used by
> the cyclic transfer points back to the first descriptor, but it never
> restores the original descriptor ring. This breaks using non-cyclic mode
> after cyclic mode with an error like:
> 
>   xilinx-vdma 86000000.dma: Channel 00000000354d5c8d has errors 100, cdr 6de40000 tdr 6de40400
> 
> [...]

Applied, thanks!

[1/1] dmaengine: xilinx_dma: Fix hardware buffer descriptor chain after cyclic DMA
      commit: 7ed1e3070c9b4bbd67d5519e14711038dd53ab13

Best regards,
-- 
~Vinod



