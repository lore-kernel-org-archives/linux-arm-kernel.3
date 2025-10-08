Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9B4CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 18:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NtQsWNEnamHa3G3fh6FSlZn9Y/iwFpdzrhz0aSdYXj8=; b=hEWZO4bDaPWPR0/W/lHHuUeaBk
	V9rf14/BMbe/Pcmx8Un8WaNmGFtvUhA2lf2twtewuvutJjm80TQl65Qyf7wS+WKfDx4Wn44OGj5/w
	s7LN72yvGNIFDa099mftqGY7jhKaHfPRuQ5LocyL79sF/1WkC2qX3ntR+x3Cd3HdYJGTk9L17HnUN
	E4rhtHaJzJywOjsPv8HHxwyU1EIO9AY/BgGCNbrw7vyFkh2pRnUUmOnN8WnRhvOjzZItvju5P3hr9
	HSwzGfuODf5Fvkn967Ro44Dq/prDFpI1iIbp8IT8u0Ks7j/3yiLctvuZ34mfEF9cqY9pLLXmuUKW0
	4j3NwKWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Yjg-00000004T6A-2M6G;
	Wed, 08 Oct 2025 18:18:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Yje-00000004T5J-2TaO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 18:18:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 645C422FC;
	Wed,  8 Oct 2025 11:17:47 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F1B923F738;
	Wed,  8 Oct 2025 11:17:54 -0700 (PDT)
Date: Wed, 8 Oct 2025 19:17:52 +0100
From: Leo Yan <leo.yan@arm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, alexandru.elisei@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Check cpu_has_spe() before initializing
 PMSCR_EL1 in VHE
Message-ID: <20251008181752.GD77665@e132581.arm.com>
References: <20251007182356.2813920-1-mukesh.ojha@oss.qualcomm.com>
 <aOVckTSJET5ORY1n@linux.dev>
 <861pndzn4w.wl-maz@kernel.org>
 <20251008124040.GC77665@e132581.arm.com>
 <20251008165058.lcwiapdnar6hvw3b@hu-mojha-hyd.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008165058.lcwiapdnar6hvw3b@hu-mojha-hyd.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_111758_666470_BA0A0726 
X-CRM114-Status: GOOD (  16.30  )
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

On Wed, Oct 08, 2025 at 10:20:58PM +0530, Mukesh Ojha wrote:

[...]

> > > To me, this smells a lot more like some sort of papering over a
> > > firmware bug. Why isn't SPE available the first place?
> > 
> > TF-a grants permission to non-secure world [1], only access from secure
> > world or realm will trap to EL3.
> > 
> > So yes, it would be good to check if any issue in firmware.
> 
> We have our own implementation of EL3 and not using TF-A.

If you don't fix your firmware, you won't be able to use Arm SPE with
the Linux kernel.

> I believe, we should check in a similar way as we are doing for nVHE
> case.
> 
> if (host_data_test_flag(HAS_SPE))
> 	write_sysreg_el1(0, SYS_PMSCR);

The document Documentation/arch/arm64/booting.rst does not state that
permission for Arm SPE is mandatory, and the SPE driver [2] can
tolerate the lack of permission. So I'm fine with applying your patch
to fix the boot issue.

Thanks,
Leo

[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/perf/arm_spe_pmu.c#n1084

