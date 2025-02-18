Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD281C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 17:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qcEQZTMXF9WIa/CeqGayZS8UtlFlJyOHfR57hgJbgzU=; b=cCQbPlBX9G+LA98jzNNsKB6OlN
	/v2sFHaee1p7twz+L5wHnR+Ww7cBUZtzEZmYUz+gGmrJeO/vLOo1/s7XPMM4i7uijdOfxsow1lA0L
	z5HYWkIapnPfi1cGdxIEi3I9z5zwJB92JqtEsMvKuXCm86REhihO5BPkSVsJsB+EQ+DS836uKqVBT
	/no5Cfyqn4maXJ5Y3eFmgfY4JomaektOI3jB8ff6HKSK7Dm6d4lPRsvr+6EMjSJ25cJ7mWGtvuxxZ
	DIiTFingC43VBysIXql1HtthQidX31SQG6BnMy+VZfNUjBzq5sBSrxYEj2x/kUT589CX2dFmixzJN
	D3INGxrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkRGL-000000098VE-3MR4;
	Tue, 18 Feb 2025 17:20:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkRC3-000000097hk-44Ds
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 17:15:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6571F1F37;
	Tue, 18 Feb 2025 09:15:54 -0800 (PST)
Received: from e126864.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C4A613F59E;
	Tue, 18 Feb 2025 09:15:33 -0800 (PST)
From: =?UTF-8?q?Kristina=20Mart=C5=A1enko?= <kristina.martsenko@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Tong Tiangen <tongtiangen@huawei.com>,
	Robin Murphy <robin.murphy@arm.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 2/3] arm64: mm: Handle PAN faults on uaccess CPY* instructions
Date: Tue, 18 Feb 2025 17:14:29 +0000
Message-Id: <20250218171430.28227-3-kristina.martsenko@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250218171430.28227-1-kristina.martsenko@arm.com>
References: <20250218171430.28227-1-kristina.martsenko@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_091536_053733_895DA015 
X-CRM114-Status: GOOD (  13.83  )
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

A subsequent patch will use CPY* instructions to copy between user and
kernel memory. Add handling for PAN faults caused by an intended kernel
memory access erroneously accessing user memory, in order to make it
easier to debug kernel bugs and to keep the same behavior as with
regular loads/stores.

Signed-off-by: Kristina Martšenko <kristina.martsenko@arm.com>
---
 arch/arm64/include/asm/extable.h |  3 +++
 arch/arm64/mm/extable.c          | 11 +++++++++++
 arch/arm64/mm/fault.c            |  4 +++-
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/extable.h b/arch/arm64/include/asm/extable.h
index 5892b8977710..0a8cb2015c97 100644
--- a/arch/arm64/include/asm/extable.h
+++ b/arch/arm64/include/asm/extable.h
@@ -33,6 +33,9 @@ do {							\
 	(b)->data = (tmp).data;				\
 } while (0)
 
+bool extable_insn_may_access_user(const struct exception_table_entry *ex,
+				  unsigned long esr);
+
 #ifdef CONFIG_BPF_JIT
 bool ex_handler_bpf(const struct exception_table_entry *ex,
 		    struct pt_regs *regs);
diff --git a/arch/arm64/mm/extable.c b/arch/arm64/mm/extable.c
index 723238ec1760..71aaf5a6271e 100644
--- a/arch/arm64/mm/extable.c
+++ b/arch/arm64/mm/extable.c
@@ -20,6 +20,17 @@ static bool cpy_faulted_on_uaccess(const struct exception_table_entry *ex,
 	return !(uaccess_is_write ^ fault_on_write);
 }
 
+bool extable_insn_may_access_user(const struct exception_table_entry *ex,
+				  unsigned long esr)
+{
+	switch (ex->type) {
+	case EX_TYPE_UACCESS_CPY:
+		return cpy_faulted_on_uaccess(ex, esr);
+	default:
+		return true;
+	}
+}
+
 static inline unsigned long
 get_ex_fixup(const struct exception_table_entry *ex)
 {
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index da4854fc6150..c2f14f9c2d92 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -553,6 +553,7 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 	unsigned int mm_flags = FAULT_FLAG_DEFAULT;
 	unsigned long addr = untagged_addr(far);
 	struct vm_area_struct *vma;
+	const struct exception_table_entry *ex;
 	int si_code;
 	int pkey = -1;
 
@@ -606,7 +607,8 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 			die_kernel_fault("execution of user memory",
 					 addr, esr, regs);
 
-		if (!search_exception_tables(regs->pc))
+		ex = search_exception_tables(regs->pc);
+		if (!ex || !extable_insn_may_access_user(ex, esr))
 			die_kernel_fault("access to user memory outside uaccess routines",
 					 addr, esr, regs);
 	}
-- 
2.34.1


