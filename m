Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAEF3CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 08:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8mEWLTXv2KUk2tbgLc402QPvDnHN1hNEtq6wzUIochk=; b=ODxiALdK6rEknfOjEcnB7ipexM
	DcAcCfcD0DO4ON+7vdZpfiZbp2hjW2uoIkFQ8rqYeO1Lv3mJRKEml+bStHq7fDpytVya1SKxMQAGQ
	+jHYP08NV5qry2L2TavxDisiiBXmeh32eig0uxb2Htz6xPRItdZLelvTWTBOSZ9kCBPWZ4zejYovT
	uAlVKujkB2tWnVcWzTX06t/PWvFUHjDnMMXq/5yiPAywv6b8UGA0iPOdYpDJmEvZGEI21V8VUngrp
	SZRGkpTr8Q8up78cGMl7hssOg8gbBI4a/PINmGjBA6kfT7La59X8x7tyMB9LeW7O3a6xz3upMSYN+
	A8yNpZBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLGGq-00000005x6f-49Ge;
	Fri, 08 May 2026 08:09:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLGGo-00000005x6D-3RYP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 08:09:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ED75E600AE;
	Fri,  8 May 2026 08:09:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEECDC2BCB0;
	Fri,  8 May 2026 08:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778227753;
	bh=eB0+wWthSB1aSm57ux1yD5ULZTyAnqFK/PWKFYrDSuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dRPyQYC4G+WPwW+Fbw5jRWtcHFU5IoVKgowh+Hy/kkpFFfF+Le0+JoFDjKspoc88p
	 u9V2n0lbeR5u01c8CA5fVHfDP8PoDiQrCl9wolNLY48Sy2hAv292nHY9fgatumkszy
	 dlqdDY0fNb3+HzagzTn8gkBBu/TBBa5FcBtutX2CMOL0uROcj9z5Ase1x1bSI3a9+c
	 36mwNM91HI85KlY/iyhUidgrDjPz1AegG4coEaCbU+ODWGa8/ay5ztBwWfwIFq5SnP
	 FxEizECVnB+Lf3cax4gEwYI94QmtKfMDyspVumcOpNMumhv0PNXNBMUJ3r/KRXqvkv
	 sMmdwv10OLXtA==
Date: Fri, 8 May 2026 10:09:08 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com, will@kernel.org, ardb@kernel.org,
	mark.rutland@arm.com, steven.price@arm.com, aneesh.kumar@kernel.org,
	sudeep.holla@arm.com, robh@kernel.org, maz@kernel.org
Subject: Re: [RFC PATCH 0/4] arm64: realm: Support for probing RSI earlier
Message-ID: <af2aJKSbWIONhrMK@lpieralisi>
References: <20260429103535.266728-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429103535.266728-1-suzuki.poulose@arm.com>
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

On Wed, Apr 29, 2026 at 11:35:31AM +0100, Suzuki K Poulose wrote:
> The Realm Guest linux support is broken without rodata=full (fortunately default
> for arm64), as we detect the RSI support after we have created the Linear map
> with Block/Contiguous mappings. If the boot CPU doesn't support BBML2_NOABORT
> (there are CPUs out there with FEAT_RME and no - useable - BBML2_NOABORT)
> we are then not able to split the page tables down to PTE level if the system
> as such doesn't support BBML2.
> 
> See the following link for the discussion.
> 
> https://lore.kernel.org/all/20260330161705.3349825-2-ryan.roberts@arm.com/
> 
> The available options are :
>  1. Start with PTE level mappings at paging_init() and then "FOLD" the page tables
>     to Block/Cont mappings after we have the full picture available. Looking at the
>     future (with BBML3), this might mean "additional work" for most of the systems
>     at boot. But not bad as splitting them ?
>  2. Hold the secondary CPUs in busy loop with MMU disabled and split the mappings
>     by the boot CPU with MMU off (if Boot CPU can't support BBML2). This is tricky
>     with the page allocations required to add the page-tables.
>  3. Move the detection of Realm support earlier to make a better decision for
>     paging_init(), with an added bonus of earlycon support for Realms without
>     the user having to work out the "top bit" for the Realm.
> 
> This series is an attempt to implement (3) (without the earlycon support). We try
> to probe the PSCI conduit early from the DT/ACPI. DT is not flattened at this time.

Nit: you mean unflattened here.

> ACPI table is not mapped in full, so we have to map one table at a time and walk
> from the Root of the table (RSDP) through to XSDT and find the FADT table from
> the array of table pointers there. Minimal verification is performed on the 
> tables (e.g., revision checks, standard FADT sanity checks). Checksum is not
> verified, but should be possible to do for the parts we consume.

I went back to tracing acpi_boot_table_init() (joy :)) and it does what you
describe here above (it has been a while since I touched that code) relying on
early_memremap() mappings (as you re-do in this series) before acpi_permanent_mmap
is set in acpi_early_init() (that happens later in the boot process).

I am sure there are caveats in moving acpi_boot_table_init() before
paging_init() but I thought I'd mention it in case (3) is what we are
pursuing (I am most definitely in favour of alternatives if there are
any).

> With arm64, during the normal boot, we could fallback to using DT if the ACPI
> tables are not useable. So, during the early probe, we try to follow the similar
> logic and probe the conduit from both DT and ACPI where available. If both of
> them contain a conduit, we only proceed if they match. Otherwise, we skip the
> early probe and do things the normal way. (Any sane system shouldn't have such
> a mismatch, but..)
> 
> Once we probe the PSCI conduit, PSCI is probed, along with the presence of SMCCC.
> With that in place, we try to probe the RSI support after the early probe and
> advertise the Realm World. If the early probe wasn't successful, we fall back
> to the late mode, where we could end up with (on a possibly rare broken firmware).
> 
> NOTE: This is an early RFC attempt to moving the PSCI detection earlier. The other
> option(s) that may be worth exploring are:
> 
> 1. On systems with EFI, parse this from EFI Stub and pass the data back in the
>    DT Stub, under chosen node. e.g., "linux,uefi-arm-psci-conduit".
>    Challenge: EFI stub doesn't seem to be ACPI aware. We could make that change,
>    we only need a few table walks.

What would we gain compared to (3) above ?

Thanks,
Lorenzo

> 2. Have EFI firmware provide this information (with my limited knowledge on the
>    area, this looks like too much work, and bending the standards)
> 3. Append arm64 boot protocol to have this information passed to the kernel.
>    (Firmware provided) - (Steven's idea)
> 4. Any other options ?
> 
> 
> This series is also available here :
> 
> git@git.gitlab.arm.com:linux-arm/linux-cca.git	cca-guest/early-rsi-detection/rfc-v1
> 
> Thoughts ?
> 
> Suzuki
> 
> 
> Suzuki K Poulose (4):
>   arm64: acpi: Refactor FADT table verification
>   psci: Add support for Early detection and init
>   arm64: psci: Move detection and SMCCC probe earlier
>   arm64: realm: Move RSI detection earlier
> 
>  arch/arm64/include/asm/acpi.h |   1 +
>  arch/arm64/include/asm/rsi.h  |   1 +
>  arch/arm64/kernel/acpi.c      | 136 +++++++++++++++++++++++++++-------
>  arch/arm64/kernel/rsi.c       |  23 +++++-
>  arch/arm64/kernel/setup.c     |  69 +++++++++++++++++
>  drivers/firmware/psci/psci.c  |  49 +++++++++++-
>  include/linux/psci.h          |   2 +
>  7 files changed, 252 insertions(+), 29 deletions(-)
> 
> -- 
> 2.43.0
> 

