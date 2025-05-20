Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD35C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 14:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8rFwTJRGtxqflVNaCdpfI+LQag0jWewHcCtUY5KbEzU=; b=0ssK5rIrLAhxk+4GnI6Q/1+ep3
	L+DUA+dO9t+zeCSX6+wHEONiSMIg0mnYWdHgLqtj3d1Gu2xopeLA55dPhTyEpVuOSXkURzPZUXt4+
	QoWW5zQ9o5/zNVZEEV+YGXvIi4Mnq+Kk325K1xCT8od5Dki1KgUQoSnAxHh0f9ofa32zi72nT4Ufj
	LYZo6zyI7H/93AYqqqdxwdSNeLkvJNzD+48KnQWp1v5GURHvSXPUfyvKknULj+rE27WaObrO8ZUnd
	xeGWpc14QK99jXZ4TdqFncPO9tG+HZG/a2kQSaqZ340MdLH11XStqz8MXlMP2K0RcaFUizG7lu/B8
	rsNHQmPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHNqG-0000000D8rY-2EBN;
	Tue, 20 May 2025 14:21:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHNo9-0000000D8Xd-1X1r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 14:19:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B37D62A23;
	Tue, 20 May 2025 14:19:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A241C4CEE9;
	Tue, 20 May 2025 14:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747750743;
	bh=PImC0z23eYKw/vXRVR7ONqgOkNS50/feSR50iDqb2S4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xoe6kfQRYp0a+bxJMj2n383/MzThfYUb+3NqLxYyAjpZq9cZvg/58X4ngv99tjHBm
	 bFdRgVblrYVt8pKtJhcgSce+lxTAB1Ru4DzEB1lZdHx2WHK80U9fN0QIkgLk/yIhNF
	 1ieIXJMQpqJnmeaA1EUp/mKxFNzpWI392lagsxqeogfTRGiglGCFXiOprBznAfSIEx
	 2bJRBXCbD7K4uEBg+5MGLr/QuosEz2jqoX4MB/JR171XwQkFtDmiZMm3LZPvKn8paM
	 HZEHxRDWn0gBgeCAPgdLu++7AhmEtC3xpOIv5n+2zCFUQy6Di/NwF49W65rk6gPvbb
	 9gLnVcGm3Nl4w==
Date: Tue, 20 May 2025 15:18:57 +0100
From: Will Deacon <will@kernel.org>
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v6 0/7] iommu/arm-smmu, drm/msm: Fixes for stall-on-fault
Message-ID: <20250520141857.GC18711@willie-the-truck>
References: <20250515-msm-gpu-fault-fixes-next-v6-0-4fe2a583a878@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515-msm-gpu-fault-fixes-next-v6-0-4fe2a583a878@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

Hi Connor,

On Thu, May 15, 2025 at 03:58:42PM -0400, Connor Abbott wrote:
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
> Patches 1-2 and 4 fix the first problem by switching the IRQ to be a
> threaded IRQ and then making drm/msm do its devcoredump work
> synchronously in the threaded IRQ. Patch 4 is dependent on patches 1-2.
> Patch 6 fixes the second problem and is dependent on patch 3. Patch 5 is
> a cleanup for patch 4 and patch 7 is a subsequent further cleanup to get
> rid of the resume_fault() callback once we switch resuming to being done
> by the SMMU's fault handler.

Thanks for reworking this; I think it looks much better now from the
SMMU standpoint.

> I've organized the series in the order that it should be picked up:
> 
> - Patches 1-3 need to be applied to the iommu tree first.

Which kernel version did you base these on? I can't see to apply the
second patch, as you seem to have a stale copy of arm-smmu-qcom.c?

Will

