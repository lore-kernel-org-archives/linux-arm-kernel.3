Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F29AC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 11:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NOeWhTTTmJw+cRV1iLSsKeEmy87nigqJau3tOOpaj6U=; b=mN/vJIwmnE/tE5lghwdPnh+1i3
	QuhiqnHqSlnxhPWgG7CcHojwyx020UJyUTDbjFbK8rvU9aYmAKbOJiwOnuT/XVFPwDbH2xQfSjnAy
	h7rcevTMb+/5dtRYzLc7J7qw0ucHyZ2YZlgvF3uon7dEQ54ct3lP+Wm5zhGBzwIGq5RpR8yL/PIQe
	MvQM6C5IYZVdRh8OpMOIQZpx1iE2AXMT1fFUwdP4AHtFKr9hHObq1mDTgKAGWunIdi0WWoLIMyhhK
	nrXgQz4MDVqWvmuCxsuD61RLtWhRMRCIAb3wRKVPCBcTp5K3yk7Q3zS3A4vEjW9H5s4IgERu0aJ9W
	OyMwRO/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAbl-000000076v6-1cam;
	Wed, 12 Feb 2025 11:08:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAYP-000000076L9-3kO8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 11:05:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3733F106F;
	Wed, 12 Feb 2025 03:05:38 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0CD233F6A8;
	Wed, 12 Feb 2025 03:05:15 -0800 (PST)
Date: Wed, 12 Feb 2025 11:05:07 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: Add missing registrations of hwcaps
Message-ID: <Z6yAY_8UcavXRzRZ@J2N7QTR9R3>
References: <20250212-arm64-fix-2024-dpisa-v2-1-67a1c11d6001@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-arm64-fix-2024-dpisa-v2-1-67a1c11d6001@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_030517_972159_D5FB203F 
X-CRM114-Status: GOOD (  16.89  )
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

On Wed, Feb 12, 2025 at 12:30:42AM +0000, Mark Brown wrote:
> Commit 819935464cb2 ("arm64/hwcap: Describe 2024 dpISA extensions to
> userspace") added definitions for HWCAP_FPRCVT, HWCAP_F8MM8 and
> HWCAP_F8MM4 but did not include the crucial registration in
> arm64_elf_hwcaps.  Add it.
> 
> Fixes: 819935464cb2 ("arm64/hwcap: Describe 2024 dpISA extensions to userspace")
> Reported-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Thanks for the respin.

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
> Changes in v2:
> - Add FPRCVT.
> - Link to v1: https://lore.kernel.org/r/20250210-arm64-fix-2024-dpisa-v1-1-d77f43c7b253@kernel.org
> ---
>  arch/arm64/kernel/cpufeature.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index f0910f20fbf8c18fbeb63bcee18abf13371b1d5e..d561cf3b8ac7b11784282dc889852ef52a7b8f6e 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -3091,6 +3091,7 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
>  	HWCAP_CAP(ID_AA64ISAR0_EL1, TS, FLAGM, CAP_HWCAP, KERNEL_HWCAP_FLAGM),
>  	HWCAP_CAP(ID_AA64ISAR0_EL1, TS, FLAGM2, CAP_HWCAP, KERNEL_HWCAP_FLAGM2),
>  	HWCAP_CAP(ID_AA64ISAR0_EL1, RNDR, IMP, CAP_HWCAP, KERNEL_HWCAP_RNG),
> +	HWCAP_CAP(ID_AA64ISAR3_EL1, FPRCVT, IMP, CAP_HWCAP, KERNEL_HWCAP_FPRCVT),
>  	HWCAP_CAP(ID_AA64PFR0_EL1, FP, IMP, CAP_HWCAP, KERNEL_HWCAP_FP),
>  	HWCAP_CAP(ID_AA64PFR0_EL1, FP, FP16, CAP_HWCAP, KERNEL_HWCAP_FPHP),
>  	HWCAP_CAP(ID_AA64PFR0_EL1, AdvSIMD, IMP, CAP_HWCAP, KERNEL_HWCAP_ASIMD),
> @@ -3190,6 +3191,8 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
>  	HWCAP_CAP(ID_AA64FPFR0_EL1, F8FMA, IMP, CAP_HWCAP, KERNEL_HWCAP_F8FMA),
>  	HWCAP_CAP(ID_AA64FPFR0_EL1, F8DP4, IMP, CAP_HWCAP, KERNEL_HWCAP_F8DP4),
>  	HWCAP_CAP(ID_AA64FPFR0_EL1, F8DP2, IMP, CAP_HWCAP, KERNEL_HWCAP_F8DP2),
> +	HWCAP_CAP(ID_AA64FPFR0_EL1, F8MM8, IMP, CAP_HWCAP, KERNEL_HWCAP_F8MM8),
> +	HWCAP_CAP(ID_AA64FPFR0_EL1, F8MM4, IMP, CAP_HWCAP, KERNEL_HWCAP_F8MM4),
>  	HWCAP_CAP(ID_AA64FPFR0_EL1, F8E4M3, IMP, CAP_HWCAP, KERNEL_HWCAP_F8E4M3),
>  	HWCAP_CAP(ID_AA64FPFR0_EL1, F8E5M2, IMP, CAP_HWCAP, KERNEL_HWCAP_F8E5M2),
>  #ifdef CONFIG_ARM64_POE
> 
> ---
> base-commit: 21fed7c223e20e694b91dbf25936d922a50c8b19
> change-id: 20250207-arm64-fix-2024-dpisa-635a5961609c
> 
> Best regards,
> -- 
> Mark Brown <broonie@kernel.org>
> 

