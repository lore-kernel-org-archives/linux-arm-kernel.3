Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF10FCAC586
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 13:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SxmY20Iq+zF5eBH5ySLE0jIVwbkRURBOfoQ3iTUFGp0=; b=sAR1aEIICIKt3AgA0KUvCnhVN7
	DwUh+XEW80cvaHo8/uJPKsgz1jZOWWr804qvo5KHQCVhSQXZnoN7YDuHIdQ1RGvp9Lv+JgEs+aAYr
	vM8tKx+03uZ+EzfOj04X2nMUxrZADohwVALta0YlrbZLXNc3euXbGZQR8QFOS7joYkvp/atzjGi4C
	SuTNxnF7Vo8desknn8ja3D9xmMg1jM0weP5pNdPN9dinS1b/jMA/gTMKB+LXYfbHuoyiYuOF2Dpbf
	K5p6aBwN17VSBjTNIaWVvy8myTFplTTxy6ft6MzqrVylcY0MF3fB49aROVFbyfACF+45LeoGC1smn
	6BfUNk5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvbY9-0000000HF6K-475g;
	Mon, 08 Sep 2025 13:04:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvaYi-0000000GpSH-2GXf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 12:01:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E7564188A;
	Mon,  8 Sep 2025 12:01:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A093BC4CEF1;
	Mon,  8 Sep 2025 12:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757332874;
	bh=0rgldGhbl11HMepDjkEVXMk9/p/RSLdSGL+gD3Ej80c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pbwgT7S/pSJPKHabt9S5WLRMR/XJwGiZLRmkCpmB++TU0dDfePeudaJtqvPnjpC3V
	 nLKvaJR+gi3K9226t5WCvsdqs8jO5UfPOUMaIMMqZcmo19VRExrZk1io4jlDIQRCOB
	 qTFBQsjE1R0K/yD8Hh8OjLPacwM23Z+eQOhz1r8EXpIRVjJi9beM4nBsr8P8/phdF2
	 RcgHUIEOoW3qoJj0HuiFdU1/W8LFC+Pz7urUpe7MAql3EcA+aM4QxQUwcz84rlMBEY
	 K90KTpmVhva3RqoeZxXPYRrvB8/dqlJDHXvfgJ/Hl/iuajmkH+7F+O01Lw7hcE6z2V
	 l1FxdHqZ5UEcw==
Date: Mon, 8 Sep 2025 13:01:07 +0100
From: Will Deacon <will@kernel.org>
To: Yicong Yang <yangyicong@huawei.com>
Cc: catalin.marinas@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	corbet@lwn.net, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, shuah@kernel.org,
	jonathan.cameron@huawei.com, shameerali.kolothum.thodi@huawei.com,
	linuxarm@huawei.com, prime.zeng@hisilicon.com, xuwei5@huawei.com,
	yangyicong@hisilicon.com, tangchengchang@huawei.com,
	wangzhou1@hisilicon.com
Subject: Re: [PATCH v4 5/7] arm64: Add support for FEAT_{LS64, LS64_V}
Message-ID: <aL7Fgx__LeLfbDyU@willie-the-truck>
References: <20250715081356.12442-1-yangyicong@huawei.com>
 <20250715081356.12442-6-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715081356.12442-6-yangyicong@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_050120_618372_FA831731 
X-CRM114-Status: GOOD (  24.15  )
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

On Tue, Jul 15, 2025 at 04:13:54PM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Armv8.7 introduces single-copy atomic 64-byte loads and stores
> instructions and its variants named under FEAT_{LS64, LS64_V}.
> These features are identified by ID_AA64ISAR1_EL1.LS64 and the
> use of such instructions in userspace (EL0) can be trapped. In
> order to support the use of corresponding instructions in userspace:
> - Make ID_AA64ISAR1_EL1.LS64 visbile to userspace
> - Add identifying and enabling in the cpufeature list
> - Expose these support of these features to userspace through HWCAP3
>   and cpuinfo
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  Documentation/arch/arm64/booting.rst    | 12 ++++++
>  Documentation/arch/arm64/elf_hwcaps.rst |  6 +++
>  arch/arm64/include/asm/hwcap.h          |  2 +
>  arch/arm64/include/uapi/asm/hwcap.h     |  2 +
>  arch/arm64/kernel/cpufeature.c          | 51 +++++++++++++++++++++++++
>  arch/arm64/kernel/cpuinfo.c             |  2 +
>  arch/arm64/tools/cpucaps                |  2 +
>  7 files changed, 77 insertions(+)
> 
> diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
> index ee9b790c0d72..837823d49212 100644
> --- a/Documentation/arch/arm64/booting.rst
> +++ b/Documentation/arch/arm64/booting.rst
> @@ -483,6 +483,18 @@ Before jumping into the kernel, the following conditions must be met:
>  
>     - MDCR_EL3.TPM (bit 6) must be initialized to 0b0
>  
> +  For CPUs support for 64-byte loads and stores without status (FEAT_LS64):

nit: I think you're missing a word ("For CPUs with support ...").

> +
> +  - If the kernel is entered at EL1 and EL2 is present:
> +
> +    - HCRX_EL2.EnALS (bit 1) must be initialised to 0b1.
> +
> +  For CPUs support for 64-byte loads and stores with status (FEAT_LS64_V):

Same here, but also FEAT_LS64_V only applies to stores so no need to
mention loads.

> +
> +  - If the kernel is entered at EL1 and EL2 is present:
> +
> +    - HCRX_EL2.EnASR (bit 2) must be initialised to 0b1.
> +
>  The requirements described above for CPU mode, caches, MMUs, architected
>  timers, coherency and system registers apply to all CPUs.  All CPUs must
>  enter the kernel in the same exception level.  Where the values documented
> diff --git a/Documentation/arch/arm64/elf_hwcaps.rst b/Documentation/arch/arm64/elf_hwcaps.rst
> index 69d7afe56853..9e6db258ff48 100644
> --- a/Documentation/arch/arm64/elf_hwcaps.rst
> +++ b/Documentation/arch/arm64/elf_hwcaps.rst
> @@ -435,6 +435,12 @@ HWCAP2_SME_SF8DP4
>  HWCAP2_POE
>      Functionality implied by ID_AA64MMFR3_EL1.S1POE == 0b0001.
>  
> +HWCAP3_LS64
> +    Functionality implied by ID_AA64ISAR1_EL1.LS64 == 0b0001.
> +
> +HWCAP3_LS64_V
> +    Functionality implied by ID_AA64ISAR1_EL1.LS64 == 0b0010.

Given that these instructions only work on IMPLEMENTATION DEFINED memory
locations and aren't guaranteed to generate an abort if used elsewhere,
how is userspace supposed to know what to do with them?

As it stands, exposing the feature blindly feels like a bad idea to me.
Surely there needs to be a way for userspace to either probe or request
memory that supports the instructions? We should also make sure we
handle the abort properly if it occurs and presumably deliver a SIGBUS.

Will

