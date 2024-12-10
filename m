Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960E5E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 17:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hjkihMjIRz/Nk2UoZw3NAd65+iAcxCFKj+NhXJbOJeo=; b=vHYPGoi/e7ILDFHIz6JnIP351n
	SstHNy7GbAfVNs9tdUzBgW/cpgwHxNhSzrJ0Z4HtHTwaQC0BrlhoE2G2P0SJk83kOsI8faWecKhcC
	V/+ntwuUZ+j1vR6e3PJS5D2R7B9+J2mJ4asTbgwnPek6ToHYkkRrzwEYsXT320FhBKdPB6yioH/P1
	CWJUX4HCR52JzGtDyTzcw9NfVv1AclsPGG5PX1BPseTyYXHUUOYnCnFw/5tdaQl+THFSaUZOrMPZc
	MMB+tWZ+bLYFXf3j3T/EZBMziwTLx6v99UlGcPiTtk+skYBvHm3NBnTQTlwTABkPo6EBaVSd5o8/I
	c0cIRd4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL3bJ-0000000CBXp-1MIy;
	Tue, 10 Dec 2024 17:00:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL3aF-0000000CBO1-1p5s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 16:59:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C7281007;
	Tue, 10 Dec 2024 09:00:05 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E3E63F58B;
	Tue, 10 Dec 2024 08:59:35 -0800 (PST)
Date: Tue, 10 Dec 2024 16:59:32 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH V2 0/7] arm64/hw_breakpoint: Enable FEAT_Debugv8p9
Message-ID: <Z1hzdLQLlIPg7eV5@J2N7QTR9R3>
References: <20241028053426.2486633-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028053426.2486633-1-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_085939_558264_9FA977F2 
X-CRM114-Status: GOOD (  16.03  )
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

On Mon, Oct 28, 2024 at 11:04:19AM +0530, Anshuman Khandual wrote:
> This series enables FEAT_Debugv8p9 thus extending breakpoint and watchpoint
> support upto 64. This series is based on v6.12-rc5 although this depends on
> FEAT_FGT2 FGU series posted earlier, for MDSELR_EL1 handling in various KVM
> guest configurations.
> 
> https://lore.kernel.org/all/20241001024356.1096072-1-anshuman.khandual@arm.com/

To avoid further confusion: since we discussed things further on the v1
thread after this v2 thread was posted, I'm waiting for a v3 to be
posted which addresses the comments there (e.g. ID reg field handling,
mutual exclusion for breakpoint manipulation).

Mark.

> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Cc: James Morse <james.morse@arm.com>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: kvmarm@lists.linux.dev
> Cc: linux-kernel@vger.kernel.org
> 
> Changes in V2:
> 
> Following changes have been made per review comments from Mark Rutland
> 
> - Orr MDCR_EL2_EBWE directly without an intermittent register
> - Alphabetically order header files in debug-monitors.c
> - Dropped embwe_ref_count mechanism
> - Dropped preempt_enable() from AARCH64_DBG_READ
> - Dropped preempt_disable() from AARCH64_DBG_WRITE
> - Dropped set_bank_index()
> - Renamed read/write_wb_reg() as __read/__write_wb_reg()
> - Modified read/write_wb_reg() to have MDSELR_E1 based banked read/write
> - Added required sysreg tools patches from KVM FEAT_FGT2 series for build
> 
> Changes in V1:
> 
> https://lore.kernel.org/all/20241001043602.1116991-1-anshuman.khandual@arm.com/
> 
> - Changed FTR_STRICT to FTR_NONSTRICT for the following ID_AA64DFR1_EL1
>   register fields - ABL_CMPs, DPFZS, PMICNTR, CTX_CMPs, WRPs and BRPs
> 
> Changes in RFC V2:
> 
> https://lore.kernel.org/linux-arm-kernel/20240620092607.267132-1-anshuman.khandual@arm.com/
> 
> - This series has been split from RFC V1 dealing only with arm64 breakpoints
> - Restored back DBG_MDSCR_MASK definition (unrelated change)
> - Added preempt_disable()/enable() blocks between selecting banks and registers
> 
> Changes in RFC:
> 
> https://lore.kernel.org/all/20240405080008.1225223-1-anshuman.khandual@arm.com/
> 
> Anshuman Khandual (7):
>   arm64/sysreg: Update register fields for ID_AA64MMFR0_EL1
>   arm64/sysreg: Add register fields for MDSELR_EL1
>   arm64/sysreg: Add register fields for HDFGRTR2_EL2
>   arm64/sysreg: Add register fields for HDFGWTR2_EL2
>   arm64/cpufeature: Add field details for ID_AA64DFR1_EL1 register
>   arm64/boot: Enable EL2 requirements for FEAT_Debugv8p9
>   arm64/hw_breakpoint: Enable FEAT_Debugv8p9
> 
>  Documentation/arch/arm64/booting.rst    | 19 +++++++
>  arch/arm64/include/asm/debug-monitors.h |  1 +
>  arch/arm64/include/asm/el2_setup.h      | 26 +++++++++
>  arch/arm64/include/asm/hw_breakpoint.h  | 46 ++++++++++++----
>  arch/arm64/include/asm/kvm_arm.h        |  1 +
>  arch/arm64/kernel/cpufeature.c          | 21 ++++++--
>  arch/arm64/kernel/debug-monitors.c      | 15 ++++--
>  arch/arm64/kernel/hw_breakpoint.c       | 38 +++++++++++++-
>  arch/arm64/tools/sysreg                 | 70 +++++++++++++++++++++++++
>  9 files changed, 216 insertions(+), 21 deletions(-)
> 
> -- 
> 2.25.1
> 

