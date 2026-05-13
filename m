Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B65CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 13:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R9f23+34NQ+b4srH9etrLJCyaRm9k30QgdwYkbwhyFA=; b=KvUQkvuF46LEc6vnUUNpcZu0aJ
	+aBf5OLebTT6P9t7s0RdwKmaQP3rpuJTw30ku0cuu+vFIbAS/DbHWovxVYFdqmlMsEC6Ik2CRkAsh
	Q0Q7v+HD5p3SvW5dYQ8RxLfMeKpig78rnjnHiYd4GQNqQs79l9TOoTrziEH+MIDc3Fb0MaYtXFDz0
	rZxYa+X9b+wQQLK3tVa1Pnk//ez0W3IvCTPbfrmngPFzLTXR5PgYiWoAzwTBjtW+mmcmbKe9aDgOm
	eDCuPLVXf//kyptgcxNjygQOHmRqCAEzsIjtiyD/EZ6YnSiIO+oeb9LlBot8zJxCZQhN+v4EAtE9z
	odOu1lhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9UN-00000002eYv-1RgU;
	Wed, 13 May 2026 13:19:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9Tx-00000002e51-3lMT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 13:18:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 369452008;
	Wed, 13 May 2026 06:18:30 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.68.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 731803F836;
	Wed, 13 May 2026 06:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778678315; bh=wYci/lR7QDlj0l+x5OwM4GlFdDBfZiFG/oxhB6X2q68=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mogvs1ErX9X9DjFMK4iIiR+gk2qBwM1Bz4Hli86c8vN7ZW6Z4BRhiknMwPynHCh8y
	 QMahyUAxmA+D5w5e50VOqQx/4J9XFJTIKZOSkC00lozbyD/Bijuo6LPOHIZIq5ory3
	 i9VyMIPhtctokQftznRMHXYluEPZxsc8Mlmi79pw=
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>,
	WeiLin.Chang@arm.com,
	Lorenzo.Pieralisi2@arm.com
Subject: [PATCH v14 03/44] arm64: RME: Handle Granule Protection Faults (GPFs)
Date: Wed, 13 May 2026 14:17:11 +0100
Message-ID: <20260513131757.116630-4-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513131757.116630-1-steven.price@arm.com>
References: <20260513131757.116630-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_061838_038868_DE1B3385 
X-CRM114-Status: GOOD (  13.75  )
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

If the host attempts to access granules that have been delegated for use
in a realm these accesses will be caught and will trigger a Granule
Protection Fault (GPF).

A fault during a page walk signals a bug in the kernel and is handled by
oopsing the kernel. A non-page walk fault could be caused by user space
having access to a page which has been delegated to the kernel and will
trigger a SIGBUS to allow debugging why user space is trying to access a
delegated page.

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Steven Price <steven.price@arm.com>
---
Changes since v10:
 * Don't call arm64_notify_die() in do_gpf() but simply return 1.
Changes since v2:
 * Include missing "Granule Protection Fault at level -1"
---
 arch/arm64/mm/fault.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 0f3c5c7ca054..6358ea4787ba 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -905,6 +905,22 @@ static int do_tag_check_fault(unsigned long far, unsigned long esr,
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
@@ -941,12 +957,12 @@ static const struct fault_info fault_info[] = {
 	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 32"			},
 	{ do_alignment_fault,	SIGBUS,  BUS_ADRALN,	"alignment fault"		},
 	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 34"			},
-	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 35"			},
-	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 36"			},
-	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 37"			},
-	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 38"			},
-	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 39"			},
-	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 40"			},
+	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"Granule Protection Fault at level -1" },
+	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"Granule Protection Fault at level 0" },
+	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"Granule Protection Fault at level 1" },
+	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"Granule Protection Fault at level 2" },
+	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"Granule Protection Fault at level 3" },
+	{ do_gpf,		SIGBUS,  SI_KERNEL,	"Granule Protection Fault not on table walk" },
 	{ do_bad,		SIGKILL, SI_KERNEL,	"level -1 address size fault"	},
 	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 42"			},
 	{ do_translation_fault,	SIGSEGV, SEGV_MAPERR,	"level -1 translation fault"	},
-- 
2.43.0


