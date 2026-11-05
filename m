Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51647606A335
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 13:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g+X8qYM/;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=AJAD0adZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xtG6fIgcVTzyv91/g3gp13PkyR5FUez629otMerYOAs=; b=g+X8qYM/TQ1YQVmDb4Rpw8sLG2
	GQlKkJjCeUWrDsvqG7MEFeu4LfjcyGptnhPWhcuN43ZW/+IgWuU4ouf4onZ9JouZsrFbA1jFf2+de
	XzYKROO5DKhfVWeMg51V457NGIB4cnboDnUvYLHlKhK6O7cDX9SeTOD2Gp2AjQltNC2lTx2AYpYWd
	A9Oy+DhIaRkz8zRRRmOUhJOIMTKZ1Z/Nbjwl+A+CcjaCnwTYl5t4CRo6lcsiJLdRCMHsjAT3TRNxt
	SlOt9W7xwVykYC4Er8+Z5I8NWmWylwUDQRkwioSP365+LDWYQ8AsmywSWy8sKGYn1Mkfpe0C2q3AN
	zqdGN0pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxbh-000000099Hb-3s01;
	Thu, 05 Nov 2026 13:34:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxbb-000000099Eu-3apV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 13:34:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4776152B;
	Thu,  5 Nov 2026 05:34:11 -0800 (PST)
Received: from e143914.arm.com (e143914.arm.com [10.2.213.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A10D3F628;
	Thu,  5 Nov 2026 05:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793885654; bh=l14vhx5E/VbDt8tx/DC7VJgj77lpt87vUA3lRCAIukc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AJAD0adZM+HCYJxY7MSwwM7ewupYaBK7MHtAFWoJGwaLsy9a2Z3j0hqOYyLCD7h9l
	 uZQcELPuN4SgmB/pGNNyGyoik9JIl7sAoIqln4XYNWCG+mWzdqV5Zl3w/eOB4igDB/
	 a7d1AJeMDvSeVAgYKmR7bolgYmyGdI2IYsVoMx3k=
Date: Thu, 5 Nov 2026 13:34:09 +0000
From: Joey Gouly <joey.gouly@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>, Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/16] KVM: arm64: selftests: Add protected-VM boot
 trampoline
Message-ID: <auyF0ePpUlJKZgNo@e143914.arm.com>
References: <20261104084842.132944-1-fuad.tabba@linux.dev>
 <20261104084842.132944-6-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104084842.132944-6-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_053417_505407_4503161F 
X-CRM114-Status: GOOD (  21.87  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 08:48:31AM +0000, Fuad Tabba wrote:
> EL2 takes only PC and X0 from the host when it boots a protected vCPU,
> and resets everything else. So the registers the selftest library sets
> before the first run never reach the guest.
> 
> Boot a protected guest through a trampoline that restores X0-X7, seven
> EL1 system registers and the stack pointer from a block X0 points to,
> then enables the MMU and branches to the guest's entry point.
> 
> Co-developed-by: Will Deacon <will@kernel.org>
> Signed-off-by: Will Deacon <will@kernel.org>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Similar idea to the 'realm-boot' I added, and mentioned previously. I
think it should work for Realms too.

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> ---
>  tools/testing/selftests/kvm/Makefile.kvm      |  1 +
>  .../selftests/kvm/include/arm64/pkvm.h        | 50 ++++++++++++++++
>  .../selftests/kvm/lib/arm64/pvm-entry.S       | 58 +++++++++++++++++++
>  3 files changed, 109 insertions(+)
>  create mode 100644 tools/testing/selftests/kvm/include/arm64/pkvm.h
>  create mode 100644 tools/testing/selftests/kvm/lib/arm64/pvm-entry.S
> 
> diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
> index 17a4256e90819..c254e82f9a786 100644
> --- a/tools/testing/selftests/kvm/Makefile.kvm
> +++ b/tools/testing/selftests/kvm/Makefile.kvm
> @@ -35,6 +35,7 @@ LIBKVM_arm64 += lib/arm64/gic_v3.c
>  LIBKVM_arm64 += lib/arm64/gic_v3_its.c
>  LIBKVM_arm64 += lib/arm64/handlers.S
>  LIBKVM_arm64 += lib/arm64/processor.c
> +LIBKVM_arm64 += lib/arm64/pvm-entry.S
>  LIBKVM_arm64 += lib/arm64/spinlock.c
>  LIBKVM_arm64 += lib/arm64/ucall.c
>  LIBKVM_arm64 += lib/arm64/vgic.c
> diff --git a/tools/testing/selftests/kvm/include/arm64/pkvm.h b/tools/testing/selftests/kvm/include/arm64/pkvm.h
> new file mode 100644
> index 0000000000000..6ef769b8ff977
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/include/arm64/pkvm.h
> @@ -0,0 +1,50 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2025 Google LLC
> + * Author: Fuad Tabba <fuad.tabba@linux.dev>
> + * Author: Will Deacon <will@kernel.org>
> + */
> +
> +#ifndef SELFTEST_KVM_ARM64_PKVM_H
> +#define SELFTEST_KVM_ARM64_PKVM_H
> +
> +#ifndef __ASSEMBLER__
> +/*
> + * Register state the boot trampoline (pvm-entry.S) restores. Only PC and X0
> + * survive to a protected guest's first run, so X0 points at this block.
> + */
> +struct pvm_boot_args {
> +	u64	jump_tgt;
> +
> +	u64	regs[8];
> +	u64	cpacr_el1;
> +	u64	sctlr_el1;
> +	u64	tcr_el1;
> +	u64	mair_el1;
> +	u64	ttbr0_el1;
> +	u64	vbar_el1;
> +
> +	u64	tpidr_el1;
> +	u64	sp_el1;
> +};
> +#endif
> +
> +#define PVM_BOOT_ARGS_OFF_JUMP_TGT	0
> +#define PVM_BOOT_ARGS_OFF_X0		(PVM_BOOT_ARGS_OFF_JUMP_TGT + 8)
> +#define PVM_BOOT_ARGS_OFF_X1		(PVM_BOOT_ARGS_OFF_X0 + 8)
> +#define PVM_BOOT_ARGS_OFF_X2		(PVM_BOOT_ARGS_OFF_X1 + 8)
> +#define PVM_BOOT_ARGS_OFF_X3		(PVM_BOOT_ARGS_OFF_X2 + 8)
> +#define PVM_BOOT_ARGS_OFF_X4		(PVM_BOOT_ARGS_OFF_X3 + 8)
> +#define PVM_BOOT_ARGS_OFF_X5		(PVM_BOOT_ARGS_OFF_X4 + 8)
> +#define PVM_BOOT_ARGS_OFF_X6		(PVM_BOOT_ARGS_OFF_X5 + 8)
> +#define PVM_BOOT_ARGS_OFF_X7		(PVM_BOOT_ARGS_OFF_X6 + 8)
> +#define PVM_BOOT_ARGS_OFF_CPACR_EL1	(PVM_BOOT_ARGS_OFF_X7 + 8)
> +#define PVM_BOOT_ARGS_OFF_SCTLR_EL1	(PVM_BOOT_ARGS_OFF_CPACR_EL1 + 8)
> +#define PVM_BOOT_ARGS_OFF_TCR_EL1	(PVM_BOOT_ARGS_OFF_SCTLR_EL1 + 8)
> +#define PVM_BOOT_ARGS_OFF_MAIR_EL1	(PVM_BOOT_ARGS_OFF_TCR_EL1 + 8)
> +#define PVM_BOOT_ARGS_OFF_TTBR0_EL1	(PVM_BOOT_ARGS_OFF_MAIR_EL1 + 8)
> +#define PVM_BOOT_ARGS_OFF_VBAR_EL1	(PVM_BOOT_ARGS_OFF_TTBR0_EL1 + 8)
> +#define PVM_BOOT_ARGS_OFF_TPIDR_EL1	(PVM_BOOT_ARGS_OFF_VBAR_EL1 + 8)
> +#define PVM_BOOT_ARGS_OFF_SP_EL1	(PVM_BOOT_ARGS_OFF_TPIDR_EL1 + 8)
> +
> +#endif /* SELFTEST_KVM_ARM64_PKVM_H */
> diff --git a/tools/testing/selftests/kvm/lib/arm64/pvm-entry.S b/tools/testing/selftests/kvm/lib/arm64/pvm-entry.S
> new file mode 100644
> index 0000000000000..a0974cde78da6
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/lib/arm64/pvm-entry.S
> @@ -0,0 +1,58 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2025 Google LLC
> + * Author: Fuad Tabba <fuad.tabba@linux.dev>
> + * Author: Will Deacon <will@kernel.org>
> + */
> +
> +#include "pkvm.h"
> +
> +	.text
> +	.balign 16
> +	.globl	pvm_entry_start
> +pvm_entry_start:
> +	mov	x30, x0
> +
> +	ldr	x0, [x30, #PVM_BOOT_ARGS_OFF_X0]
> +	ldr	x1, [x30, #PVM_BOOT_ARGS_OFF_X1]
> +	ldr	x2, [x30, #PVM_BOOT_ARGS_OFF_X2]
> +	ldr	x3, [x30, #PVM_BOOT_ARGS_OFF_X3]
> +	ldr	x4, [x30, #PVM_BOOT_ARGS_OFF_X4]
> +	ldr	x5, [x30, #PVM_BOOT_ARGS_OFF_X5]
> +	ldr	x6, [x30, #PVM_BOOT_ARGS_OFF_X6]
> +	ldr	x7, [x30, #PVM_BOOT_ARGS_OFF_X7]
> +
> +	ldr	x8, [x30, #PVM_BOOT_ARGS_OFF_JUMP_TGT]
> +
> +	ldr	x9, [x30, #PVM_BOOT_ARGS_OFF_CPACR_EL1]
> +	msr	cpacr_el1, x9
> +
> +	ldr	x9, [x30, #PVM_BOOT_ARGS_OFF_TCR_EL1]
> +	msr	tcr_el1, x9
> +
> +	ldr	x9, [x30, #PVM_BOOT_ARGS_OFF_MAIR_EL1]
> +	msr	mair_el1, x9
> +
> +	ldr	x9, [x30, #PVM_BOOT_ARGS_OFF_TTBR0_EL1]
> +	msr	ttbr0_el1, x9
> +
> +	ldr	x9, [x30, #PVM_BOOT_ARGS_OFF_VBAR_EL1]
> +	msr	vbar_el1, x9
> +
> +	ldr	x9, [x30, #PVM_BOOT_ARGS_OFF_TPIDR_EL1]
> +	msr	tpidr_el1, x9
> +
> +	ldr	x9, [x30, #PVM_BOOT_ARGS_OFF_SP_EL1]
> +	mov	sp, x9
> +
> +	/* No stale TLB entries, and the writes above in effect, before the MMU is on. */
> +	tlbi	vmalle1
> +	dsb	nsh
> +	isb
> +	ldr	x9, [x30, #PVM_BOOT_ARGS_OFF_SCTLR_EL1]
> +	msr	sctlr_el1, x9
> +	isb
> +
> +	br	x8
> +	.globl	pvm_entry_end
> +pvm_entry_end:
> -- 
> 2.47.3
> 

