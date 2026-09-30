Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6E9CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 16:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=siRz+WcxdJ/XIMU6ghRfKBhMCX6aMkXdnGJVzrNDnTQ=; b=rpFYy3nrTv/3KvLIYzRkzXzqRu
	4aoWmEAxSofgYE52HDkWCEltxxf8zdqyowP2ZNbw6b4h2/Y77WN/QQSPOA7mtkgf4W99EF3EJ7Cm6
	31VXwwAoEGfxBzn7Xf+NvnGUtviMbUdNPX6tkTtWe8qnFFQVrvTaQVCNewycXbCYLEpWEWU9KrLE2
	VL+mbv9+4kgCgGKzj34m1soD8tzwkBJdLF0C4GXleUNZ7UQeQXwBj8V942vTpu+rdULVAJ5XN58uz
	/M5VpINQUayTjDSCnb+xXQm6oqQW5LbKDOmQTyHRtLcVEpfI7vKkDLrDN4VHBs9Fg/jo8uZkIhyli
	7FXd3wZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBxV8-00000006jy9-3lOh;
	Wed, 30 Sep 2026 16:49:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBxV6-00000006jxH-46Ml
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 16:49:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95DB4143D;
	Wed, 30 Sep 2026 09:49:43 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5A9A03F85F;
	Wed, 30 Sep 2026 09:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790786987; bh=lrNhVw8O7Z5bKR2hECDWo9LI4wPDPZzK7RqRkIo0tYc=;
	h=From:To:Cc:Subject:Date:From;
	b=HOkrkTYG/YbTkn5eyfqS5afO3Du8PmFgfxVoxBVqSusTSrNukE0pWZ1aX5nYZlvys
	 blUJUoabaDkqtrkoL6U187dBggR8gn0g6a5wQxaHmGOzJVxo/mmKHXnyKp/NJiL2E8
	 Wuja02T70TlspUUzByvme6jHB4JZZaYiLLz8Qf2E=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	linux-kernel@vger.kernel.org,
	steven.price@arm.com,
	gshan@redhat.com,
	aneesh.kumar@kernel.org,
	maz@kernel.org,
	oupton@kernel.org,
	tabba@google.com,
	mark.rutland@arm.com,
	linux-coco@lists.linux.dev,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v19] arm64: mm: Handle Granule Protection Faults (GPFs)
Date: Wed, 30 Sep 2026 17:49:30 +0100
Message-ID: <20260930164930.1388438-1-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_094949_101172_BB7FE5B0 
X-CRM114-Status: GOOD (  19.30  )
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

From: Steven Price <steven.price@arm.com>

If the host attempts to access granules that have been delegated to RMM
(for use as an RMM object or Realm Data), these accesses will be caught
and will trigger a Granule Protection Fault (GPF).

A fault during a page walk signals a bug in the kernel and is handled by
oopsing the kernel. A non-page walk fault could be caused by:

 * Userspace having access to a page which has been delegated. We don't allow
   mapping a delegated page (which may have Realm VM private data) to EL0.
   But if we do encounter this, trigger a SIGBUS to allow debugging

 * A kernel mode access is even more serious, except for the cases where :
   - Benign overreads e.g. load_unaligned_zeropad(), we should be able to fix
     this up.
   - A kdump kernel trying to access delegated page (donated by the primary
     kernel). We do not support this yet, but can be added in the later series.

There is ongoing work to unmap the guest_memfd backed private pages
from the linear map. We would additionally need to unmap the other
delegated pages too. For now handle the GPF and only fixing up kernel mode
accesses via kernel VA (which would cover both the legitimate cases above)

Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Steven Price <steven.price@arm.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
Changes since v18:
 * Only fixup accesses via kernel VA
Changes since v17:
 * Pass untagged address to die_kernel_fault() - Sashiko
 * Explicitly check !user_mode() for fixups - Catalin
 * Switch to BUS_OBJERR for si_code from SI_KERNEL - Catalin
Changes since v16:
 * Update the commit description to indicate why we try to fixup GPFs
Changes since v10:
 * Don't call arm64_notify_die() in do_gpf() but simply return 1.
Changes since v2:
 * Include missing "Granule Protection Fault at level -1"
---
 arch/arm64/mm/fault.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 75c3e463df2ef..ded9288a5dd2f 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -914,6 +914,29 @@ static int do_tag_check_fault(unsigned long far, unsigned long esr,
 	return 0;
 }
 
+static int do_gpf_ptw(unsigned long far, unsigned long esr, struct pt_regs *regs)
+{
+	const struct fault_info *inf = esr_to_fault_info(esr);
+	unsigned long addr = untagged_addr(far);
+
+	die_kernel_fault(inf->name, addr, esr, regs);
+	return 0;
+}
+
+static int do_gpf(unsigned long far, unsigned long esr, struct pt_regs *regs)
+{
+	/*
+	 * Userspace must not have a delegated page mapped in. If the kernel
+	 * is made to access it, then we have a serious problem.
+	 * Only fixup if the access came via kernel VA. e.g., load_unaligned_zeropad()
+	 */
+	if (!user_mode(regs) && !is_el1_instruction_abort(esr) &&
+	    !is_ttbr0_addr(untagged_addr(far)) && fixup_exception(regs, esr))
+		return 0;
+
+	return 1;
+}
+
 static const struct fault_info fault_info[] = {
 	{ do_bad,		SIGKILL, SI_KERNEL,	"ttbr address size fault"	},
 	{ do_bad,		SIGKILL, SI_KERNEL,	"level 1 address size fault"	},
@@ -950,12 +973,12 @@ static const struct fault_info fault_info[] = {
 	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 32"			},
 	{ do_alignment_fault,	SIGBUS,  BUS_ADRALN,	"alignment fault"		},
 	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 34"			},
-	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 35"			},
-	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 36"			},
-	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 37"			},
-	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 38"			},
-	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 39"			},
-	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 40"			},
+	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"level -1 granule protection fault (translation table walk)" },
+	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"level 0 granule protection fault (translation table walk)" },
+	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"level 1 granule protection fault (translation table walk)" },
+	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"level 2 granule protection fault (translation table walk)" },
+	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"level 3 granule protection fault (translation table walk)" },
+	{ do_gpf,		SIGBUS,  BUS_OBJERR,	"granule protection fault" },
 	{ do_bad,		SIGKILL, SI_KERNEL,	"level -1 address size fault"	},
 	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 42"			},
 	{ do_translation_fault,	SIGSEGV, SEGV_MAPERR,	"level -1 translation fault"	},
-- 
2.43.0


