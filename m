Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D9CC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D49O1NeemyQmd2xxB1EDTbL7eRgYjkwJtwKVF5+rHbk=; b=Dw5oMrrHN9dQlT7z336Iub64C6
	+5ot4v1kd5iCPizWjQK6La8dval6WCK9tW8+ZFIJddnrwwHdNz1mRa1ZKhDNZyeON8t42popgXOnR
	PvPKRGqHYX8gdzLhmJozHG71Ypw4RSi83hg1XwyRUmj89Nc0XKldqCAGlbGc+bdMfUu1KmWRjnKbw
	fdP6Lw9QU1IuBNwDkObERI3gxdEdpBQ1EwOZge5CAGKrVwH4Czzsih/Vzsl/9/sWB90ii2vzWblE9
	7Hwkftm3n51MwLgabJfopfFE0wJlZ/aIWST+QqioHk5VxIZUrYZ0lWNOxg3tm7FJ7Ltx6vDWTzZqk
	5om1BklA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3c72-00000007Hl2-2dlV;
	Mon, 07 Sep 2026 16:22:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3c6y-00000007Hje-0XWN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:22:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F85D1477;
	Mon,  7 Sep 2026 09:22:19 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0316C3F528;
	Mon,  7 Sep 2026 09:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788798142; bh=XAeqWuHc9jnj7EF+rIUKhmu4pAbQvhgD5GDfn5hHh9I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G+J91P19HVXLKxQXd9uRL/DwKTix2YtsSCBzkyKxR8RVFksiU9e5ONFoRnN0cHFb+
	 r7LbJ6PFOT/WA4xYbR3enBx7EemQ4YVFW9gqTSpCOKZlLAqlVh13rLfOefjg1Pb34H
	 Rp7oau2DGEt7l8MfqiGL0PlM7uZCudjBa2uycWsM=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	linux-kernel@vger.kernel.org,
	maz@kernel.org,
	pavan.kondeti@oss.qualcomm.com,
	tabba@google.com,
	aneesh.kumar@kernel.org,
	mark.rutland@arm.com,
	sdonthineni@nvidia.com,
	steven.price@arm.com,
	gshan@redhat.com,
	yuzenghui@huawei.com,
	kvmarm@lists.linux.dev,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v17 1/1] arm64: mm: Handle Granule Protection Faults (GPFs)
Date: Mon,  7 Sep 2026 17:22:04 +0100
Message-ID: <20260907162204.1479401-2-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907162204.1479401-1-suzuki.poulose@arm.com>
References: <20260907162204.1479401-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_092224_257830_DE1CB2B9 
X-CRM114-Status: GOOD (  15.03  )
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

If the host attempts to access granules that have been delegated for use
in a realm these accesses will be caught and will trigger a Granule
Protection Fault (GPF).

A fault during a page walk signals a bug in the kernel and is handled by
oopsing the kernel. A non-page walk fault could be caused by user space
having access to a page which has been delegated to the kernel and will
trigger a SIGBUS to allow debugging why user space is trying to access a
delegated page.

Also, until we unmap the "private" memory pages from the linear map, we could
get spurious GPFs from within the kernel, e.g., load_unaligned_zeropad(). So,
try to fix them up for now.

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Steven Price <steven.price@arm.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
Changes since v16:
 * Update the commit description to indicate why we try to fixup GPFs
Changes since v10:
 * Don't call arm64_notify_die() in do_gpf() but simply return 1.
Changes since v2:
 * Include missing "Granule Protection Fault at level -1"
---
 arch/arm64/mm/fault.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 0b52557652be6..ad00997b1a873 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -910,6 +910,22 @@ static int do_tag_check_fault(unsigned long far, unsigned long esr,
 	return 0;
 }
 
+static int do_gpf_ptw(unsigned long far, unsigned long esr, struct pt_regs *regs)
+{
+	const struct fault_info *inf = esr_to_fault_info(esr);
+
+	die_kernel_fault(inf->name, far, esr, regs);
+	return 0;
+}
+
+static int do_gpf(unsigned long far, unsigned long esr, struct pt_regs *regs)
+{
+	if (!is_el1_instruction_abort(esr) && fixup_exception(regs, esr))
+		return 0;
+
+	return 1;
+}
+
 static const struct fault_info fault_info[] = {
 	{ do_bad,		SIGKILL, SI_KERNEL,	"ttbr address size fault"	},
 	{ do_bad,		SIGKILL, SI_KERNEL,	"level 1 address size fault"	},
@@ -946,12 +962,12 @@ static const struct fault_info fault_info[] = {
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
+	{ do_gpf,		SIGBUS,  SI_KERNEL,	"granule protection fault" },
 	{ do_bad,		SIGKILL, SI_KERNEL,	"level -1 address size fault"	},
 	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 42"			},
 	{ do_translation_fault,	SIGSEGV, SEGV_MAPERR,	"level -1 translation fault"	},
-- 
2.43.0


