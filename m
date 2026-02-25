Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B3FFCEE95
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 12:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oFLXg9YsqVnx/vQirs8Wi4dOzFCMdydXCNqeeph3xoQ=; b=0zGNRlBS9EECkqDPcJT/MKthLp
	oRsFv8MVqL9PUi1+ZPYBPA3+ZccaPNVfj/A3Mkyjv5rIaQ+9rEm27cEVIR8CIoct6gAbhAtVo4UHK
	NMM34+zOibtvJ16SXOfLkSXqQcxoiryv/1WILy81KR0CY6AWNeq0s/i/ce1iHlqzuNeh6T/0dC3o4
	zpFDVcfEgHwN1rXFjfL3BTGfBQBdXLjmKJKes97fl8VO8AvTVO+OcaIQwsP20BxCXihRhCoMV/eTG
	d/AVatABsUtQ9gnBfZcVeEV4D8Bpr1GQQaJZK99aJSWbmMxjLHTrstSDFGmSfuFSKy+To0pOrK72M
	oR2nxXMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvDiR-00000003xxH-06li;
	Wed, 25 Feb 2026 12:10:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvDiN-00000003xwX-3R2D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 12:10:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDDEF165C;
	Wed, 25 Feb 2026 04:09:52 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7ACC3F59E;
	Wed, 25 Feb 2026 04:09:58 -0800 (PST)
Date: Wed, 25 Feb 2026 12:09:56 +0000
From: Leo Yan <leo.yan@arm.com>
To: Will Deacon <will@kernel.org>, yabinc@google.com
Cc: James Clark <james.clark@linaro.org>, Marc Zyngier <maz@kernel.org>,
	kvmarm@lists.linux.dev, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	Oliver Upton <oupton@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH] KVM: arm64: Disable TRBE Trace Buffer Unit when running
 in guest context
Message-ID: <20260225120956.GD4184494@e132581.arm.com>
References: <20260216130959.19317-1-will@kernel.org>
 <86a4x8bw38.wl-maz@kernel.org>
 <d2f6877a-534d-4862-a61c-fb3cb5b96618@linaro.org>
 <aZNec3B0Iou9PYGw@willie-the-truck>
 <20260217141917.GA136967@e132581.arm.com>
 <aZSAsC1YI5_lK3e0@willie-the-truck>
 <20260217190121.GB136967@e132581.arm.com>
 <aZcWC25GE2iUKsNt@willie-the-truck>
 <20260219185800.GD136967@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219185800.GD136967@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_041003_905578_1B3E8141 
X-CRM114-Status: GOOD (  13.44  )
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

Hi Will,

[ + Yabin ]

Thanks for Suzuki's reminding, I should mention that Yabin reported
another lockup issue caused by missing CPU PM support in TRBE driver.

We have a patch series to fix the issue:
https://lore.kernel.org/linux-arm-kernel/20251119-arm_coresight_path_power_management_improvement-v5-16-f615a301ad0b@arm.com/

Besides your fix the translation regime issue, I'd also suggest applying
the CoreSight PM patch series to fix lockup caused by CPU idle.

I have a supplement for the context switch, please see the comment below.

On Thu, Feb 19, 2026 at 06:58:03PM +0000, Leo Yan wrote:

[...]

> Based on these conclusions, let me summarize the flow:
> 
>   // Prohibit trace
>   TRFCR_EL1 = 0;
> 
>   // No new program-flow trace
>   isb();
> 
>   // Trace operation and trace unit are flushed
>   tsb_csync();   // Executes twice if ARM64_WORKAROUND_TSB_FLUSH_FAILURE!
> 
>   // Disable trace unit
>   TRCPRGCTLR.EN = 0b0

We conclude that no need to disable and re-enable the trace unit
(TRCPRGCTLR.EN) during a KVM context switch.

Here are the details:

I initially proposed controlling the TRCPRGCTLR.EN bit during switch.
This would allow the trace unit to generate ASYNC packets, which I
assumed would be convenient for decoding, since the decoder can
recognize ASYNC packets rather than decoder is to be reset if any
discontinuity occurs.

After review, during a VM context switch, the trace unit can guarantee
a single continuous stream when switching back to the host. There is no
discontinuity in trace stream.  Therefore, we don't need to touch
TRCPRGCTLR.EN bit to generate ASYNC packets.

I hope this is reasonable to you.

Thanks,
Leo

