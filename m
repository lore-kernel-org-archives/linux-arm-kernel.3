Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9AC2C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 21:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1KEzBGiOEBUQrq92XgFiEIjAFYjTrWz0MBZo0bROysE=; b=V1NH0BzXGwH1ff5A6BJTL8PFLq
	aS78LfaVdsfdvnMrDoW3vgtHn3++4tgPbyLWqKxVzL27HCaYbenHYg5SOCeW+JpVmg8njDmsBx6bM
	2r2RL3tPvHKXTqkmDkZwyZVXpLEhJmPAYvjL1TfzU1GgFcz2MMStoARlb23gcbNwEL70HSY31+kXc
	e0U8FoN4RQmvPpZOyhR9VzkihOXedsesuTZTci/zGK2qGT9/BYVmvoMBbC3nZwR/b61vYUQrLvfBN
	N1TELZylWamo1W9KU23XjUuClFmK7ajjkmeYUiamNzNDyEznckQh4H918m5jIdoO/C4D0AlPsQXol
	pruQ0Ufw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuI1p-000000042NP-2ALk;
	Mon, 17 Mar 2025 21:29:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuHzY-000000041zy-0Uen
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 21:27:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0EC455C5720;
	Mon, 17 Mar 2025 21:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02828C4CEED;
	Mon, 17 Mar 2025 21:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742246842;
	bh=z6q9Yf8R8e67nexnPrspZoEOpoHL0DbFkk7kRkc46xA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=II67G/Jdr5TfcE01THKWrfcwC/dnbFzFkjhZ/KsoAq2A9DhzXqWXp9a0/SwpXk4M4
	 tyr6h2Sy2vrO+CkZC+u7/Q8EucIo3X0V/EGyPnEsSAaIMy/EfuZTmK1p/wKnfP2qEn
	 YLagUIHnGVRuaViHS6pGD7YUqZHRXtRI6wUsxGRL77z67hJw8JpEr85uEV2Qb95ehw
	 V06Fcf3zKRi1BReiHq+PIsLz7s7EsBC/Av59tamayb0Clb0/aIuq4zFMkD16YkZZ61
	 9u/ZYqndehxwtCUPEf2t+vqeCmRI8thPtzOaVSO+7vgGsdGsnrxqIBeH1FSn9/0eNB
	 XwDkQ0FOmKqQg==
Date: Mon, 17 Mar 2025 21:27:20 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, mhklinux@outlook.com,
	ltykernel@gmail.com, stanislav.kinsburskiy@gmail.com,
	linux-acpi@vger.kernel.org, eahariha@linux.microsoft.com,
	jeff.johnson@oss.qualcomm.com, kys@microsoft.com,
	haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
	catalin.marinas@arm.com, will@kernel.org, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	hpa@zytor.com, daniel.lezcano@linaro.org, joro@8bytes.org,
	robin.murphy@arm.com, arnd@arndb.de, jinankjain@linux.microsoft.com,
	muminulrussell@gmail.com, skinsburskii@linux.microsoft.com,
	mrathor@linux.microsoft.com, ssengar@linux.microsoft.com,
	apais@linux.microsoft.com, gregkh@linuxfoundation.org,
	vkuznets@redhat.com, prapal@linux.microsoft.com,
	anrayabh@linux.microsoft.com, rafael@kernel.org, lenb@kernel.org,
	corbet@lwn.net
Subject: Re: [PATCH v6 00/10] Introduce /dev/mshv root partition driver
Message-ID: <Z9iTuJRSnKAD5t15@liuwe-devbox-ubuntu-v2.lamzopl0uupeniq2etz1fddiyg.xx.internal.cloudapp.net>
References: <1741980536-3865-1-git-send-email-nunodasneves@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1741980536-3865-1-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_142724_247963_5E77A048 
X-CRM114-Status: GOOD (  30.33  )
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

On Fri, Mar 14, 2025 at 12:28:46PM -0700, Nuno Das Neves wrote:
> This series introduces support for creating and running guest virtual
> machines while running on the Microsoft Hypervisor[0] as root partition.
> This is done via an IOCTL interface accessed through /dev/mshv, similar to
> /dev/kvm. Another series introducing this support was previously posted in
> 2021[1], and versions 1-4 of this series were posted in 2023[2].
> 
> Patches 1-4 are small refactors and additions to Hyper-V code.
> Patches 5-6 just export some definitions needed by /dev/mshv.
> Patches 7-9 introduce some functionality and definitions in common code, that
> are specific to the driver.
> Patch 10 contains the driver code.
> 
> -----------------
> [0] "Hyper-V" is more well-known, but it really refers to the whole stack
>     including the hypervisor and other components that run in Windows
>     kernel and userspace.
> [1] Previous /dev/mshv patch series (2021) and discussion:
> https://lore.kernel.org/linux-hyperv/1632853875-20261-1-git-send-email-nunodasneves@linux.microsoft.com/
> [2] v4 (2023):
> https://lore.kernel.org/linux-hyperv/1696010501-24584-1-git-send-email-nunodasneves@linux.microsoft.com/
> 
> -----------------
> Changes since v5:
> * Rework patch 1:
>  1. Introduce hv_status_printk() logging macros which print the raw HV_STATUS_
>     code along with string [Roman Kisel]
>  2. Iterate over an array of data items to get the string and errno for the
>     hv_result_to_*() functions. [Michael Kelley]
>  3. Use hv_status_printk() to log errors in hyperv/irqdomain.c and
>     hyperv-iommu.c [Easwar Hariharan]
> * Minor cleanup, improvements, and commit wording changes in patches 2, 3, 4, 6
>   [Roman Kisel, Easwar Hariharan, Michael Kelley]
> * Fix issues with declaration and lifecycle of hv_synic_eventring_tail in patch
>   7 [Michael Kelley]
> * Improve detail and clarity of commit message in patch 8 [Michael Kelley]
> * Minor cleanups in patch 9 - uapi types -> kernel types, #ifdef CONFIG_X86_64
>   -> CONFIG_X86 for consistency, fix HVCALL_* ordering, remove redundant
>   __packed, use explicit enum value [Stanislav Kinsburskii, Easwar Hariharan,
>   Michael Kelley, Tianyu Lan]
> * Minor fixes and cleanup in patch 10 [Michael Kelley]
> * Add MODULE_DESCRIPTION() to patch 10 [Jeff Johnson]
> 
> Changes since v4:
> * Slim down the IOCTL interface significantly, via several means:
>   1. Use generic "passthrough" call MSHV_ROOT_HVCALL to replace many ioctls.
>   2. Use MSHV_* versions of some of the HV_* definitions.
>   3. Move hv headers out of uapi altogether, into include/hyperv/, see:
> https://lore.kernel.org/linux-hyperv/1732577084-2122-1-git-send-email-nunodasneves@linux.microsoft.com/
> * Remove mshv_vtl module altogther, it will be posted in followup series
>   * Also remove the parent "mshv" module which didn't serve much purpose
> * Update and refactor parts of the driver code for clarity, extensibility
> 
> Changes since v3 (summarized):
> * Clean up the error and debug logging:
>   1. Add a set of macros vp_*() and partition_*() which call the equivalent
>      dev_*(), passing the device from the partition struct
>      * The new macros also print the partition and vp ids to aid debugging
> 	   and reduce repeated code
>   2. Use dev_*() (mostly via the new macros) instead of pr_*() *almost*
>   everywhere - in interrupt context we can't always get the device struct
>   3. Remove pr_*() logging from hv_call.c and mshv_root_hv_call.c
> 
> Changes since v2 (summarized):
> * Fix many checkpatch.pl --strict style issues
> * Initialize status in get/set registers hypercall helpers
> * Add missing return on error in get_vp_signaled_count
> 
> Changes since v1 (summarized):
> * Clean up formatting, commit messages
> 
> Nuno Das Neves (9):
>   hyperv: Log hypercall status codes as strings
>   arm64/hyperv: Add some missing functions to arm64
>   hyperv: Introduce hv_recommend_using_aeoi()
>   acpi: numa: Export node_to_pxm()
>   Drivers: hv: Export some functions for use by root partition module
>   Drivers: hv: Introduce per-cpu event ring tail
>   x86: hyperv: Add mshv_handler() irq handler and setup function
>   hyperv: Add definitions for root partition driver to hv headers
>   Drivers: hv: Introduce mshv_root module to expose /dev/mshv to VMMs
> 
> Stanislav Kinsburskii (1):
>   x86/mshyperv: Add support for extended Hyper-V features

Series applied to hyperv-next. Thanks.

I had to fix one minor compilation issue in patch 10, but nothing major.

I also folded the following patch to a previous patch that introduced
MSHV_ROOT (not in this series).


diff --git a/drivers/hv/Kconfig b/drivers/hv/Kconfig
index 794e88e9dc6b..3118d5472fab 100644
--- a/drivers/hv/Kconfig
+++ b/drivers/hv/Kconfig
@@ -57,7 +57,7 @@ config HYPERV_BALLOON
 
 config MSHV_ROOT
 	tristate "Microsoft Hyper-V root partition support"
-	depends on HYPERV
+	depends on HYPERV && (X86_64 || ARM64)
 	depends on !HYPERV_VTL_MODE
 	# The hypervisor interface operates on 4k pages. Enforcing it here
 	# simplifies many assumptions in the root partition code.

Wei.

