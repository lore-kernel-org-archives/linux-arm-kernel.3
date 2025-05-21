Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95048C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 11:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xjYJ4e+XtwIcJl1jl56ZIwqUgLexrfu3sCYY5OlPbMA=; b=IYi81TgT/+zbytCFvPJijcG8VX
	krNM0msDzSMLVAra2QJWVriw2THPVV6H52OLZ1MEhofOF5htfmX70yqq5K7bVlkzu6kjFOrw8w8Hg
	yu67/sTdSZrAoAThlH2RN0fWQ4aB8BWqO8FAXTSDMdzkKLbcsYWbrKsQH0zYV7/wKVLY0KHeQhZMM
	Hax3yWpV32pDXknCdr3n42rkBXWjLC/9VUzK3Ek5vvvgxjGJ7S9p07CK3+Fx/6VVGkZcq1vQZ1+sd
	8WA7HVMy/M3tPM4N/jGPYkzlVccyDQiEw13FRdGpDni5uKwwk+Ypmcy/OjsjDkhDK6p8e20mxwHgz
	5L3UccRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHhEU-0000000FZpU-18Q2;
	Wed, 21 May 2025 11:03:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHhCR-0000000FZTi-0IDu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 11:01:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 26EA66111C;
	Wed, 21 May 2025 11:01:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11329C4CEED;
	Wed, 21 May 2025 11:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747825285;
	bh=r1/Lj3aBtMU6yVgyPDJKVl5vYOZFzl7ANqCIVliCoFg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HR//G+ayZ/fHI/yyn+TC97knjRgGdaWgs2GwNlgfKquYDDWWlZhTTV8iY0N7Cxe+G
	 6QElKLXLuBsarxEA/oySb5opjI0WecLjavgxq9JJIJyj2En6GBv52sQruOndlTejp9
	 94VU4S18850jDs0DS6h/TNqMmLgGyFbszooWqxw4F2AuV+tCsDhsEWJAw1AkUdqrIX
	 M98rMv1WFVyMP5FMkF7E4nUamyww/ocajjGDXjT+X+U9sImU1rovrGeokTE7D7Hu3T
	 Tg9ppgkwFpx7dukynX06w/MTqCoT5t+vNX+kj4v5gUnmm89aYjozedQ5IcCckbOQoV
	 X+519zbizVaqQ==
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Connor Abbott <cwabbott0@gmail.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v8 0/7] iommu/arm-smmu, drm/msm: Fixes for stall-on-fault
Date: Wed, 21 May 2025 12:01:17 +0100
Message-Id: <174782058731.37848.9736429299251401095.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250520-msm-gpu-fault-fixes-next-v8-0-fce6ee218787@gmail.com>
References: <20250520-msm-gpu-fault-fixes-next-v8-0-fce6ee218787@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 20 May 2025 15:08:53 -0400, Connor Abbott wrote:
> drm/msm uses the stall-on-fault model to record the GPU state on the
> first GPU page fault to help debugging. On systems where the GPU is
> paired with a MMU-500, there were two problems:
> 
> 1. The MMU-500 doesn't de-assert its interrupt line until the fault is
>    resumed, which led to a storm of interrupts until the fault handler
>    was called. If we got unlucky and the fault handler was on the same
>    CPU as the interrupt, there was a deadlock.
> 2. The GPU is capable of generating page faults much faster than we can
>    resume them. GMU (GPU Management Unit) shares the same context bank
>    as the GPU, so if there was a sudden spurt of page faults it would be
>    effectively starved and would trigger a watchdog reset, made even
>    worse because the GPU cannot be reset while there's a pending
>    transaction leaving the GPU permanently wedged.
> 
> [...]

Applied first three SMMU driver changes to iommu (arm/smmu/updates), thanks!

[1/7] iommu/arm-smmu-qcom: Enable threaded IRQ for Adreno SMMUv2/MMU500
      https://git.kernel.org/iommu/c/1650620774fa
[2/7] iommu/arm-smmu: Move handing of RESUME to the context fault handler
      https://git.kernel.org/iommu/c/3053a2c5086d
[3/7] iommu/arm-smmu-qcom: Make set_stall work when the device is on
      https://git.kernel.org/iommu/c/70892277ca2d

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

