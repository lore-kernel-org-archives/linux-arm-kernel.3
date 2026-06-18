Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C34DCD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 09:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tou+gUoWEZe2fvebXTjOCap3tZyiNjWgYvWq5vHGM5w=; b=sQcR29F7cfRMkz/baroq0lvhWJ
	CYwxbkZSEgsXQlOkXy0mHAhg7S1CfNcvb2+UQJw2W02Re6R/4X6mYfCIvkENfjmLMYD2Uk8S/mfPD
	MBP6iYmj94h4H8IyqUFS8az+J9uC5E5v4E1KH9Tdjtai0HKAAASnT+Kn0IYzwBrZSnYN56UYBYGu+
	bMNtrIm9XpH2v8FTyfl3zZlAzdMtKkPTEJjbEM+Con/MJNCwXOBC/7YAxjFftmISsivx5qtv+QSPG
	6N0qWifNPk/+zL3EqqrZb5W5ehIRmtgGM0idnJmWrshIR+hElmryVgF92lJ42k90aMxPoukNUhLjC
	P3Y8FTIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8wh-00000000vQD-016V;
	Thu, 18 Jun 2026 09:21:59 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8wc-00000000vN1-1jli
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 09:21:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1781774512; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=tou+gUoWEZe2fvebXTjOCap3tZyiNjWgYvWq5vHGM5w=;
	b=N9sbhRmFkULLgz+T30j9qmHAtBYMWPAz3B4VhHOFE4RfqWvxPZiNaaICN3Mtz4yJZpQCLgHRdEHV+SuEN153vq8jWUJwYvGY/ragBLGGVVgI2IW79K1qbeYqBckanm0zPmF9Pn63EdLEqXhihiIi/xz9BmYxsZTT1e9PNV92kzc=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=tianruidong@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X56UStd_1781774505;
Received: from localhost(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0X56UStd_1781774505 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 18 Jun 2026 17:21:48 +0800
From: Ruidong Tian <tianruidong@linux.alibaba.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	rafael@kernel.org,
	tony.luck@intel.com,
	guohanjun@huawei.com,
	mchehab@kernel.org,
	xueshuai@linux.alibaba.com,
	tongtiangen@huawei.com,
	james.morse@arm.com,
	robin.murphy@arm.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	ryabinin.a.a@gmail.com,
	glider@google.com,
	christophe.leroy@csgroup.eu,
	aneesh.kumar@kernel.org,
	naveen.n.rao@linux.ibm.com,
	tglx@linutronix.de,
	mingo@redhat.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	tianruidong@linux.alibaba.com
Subject: [PATCH v15 3/9] arm64: extable: merge UACCESS_ERR_ZERO and KACCESS_ERR_ZERO into ACCESS_ERR_ZERO
Date: Thu, 18 Jun 2026 17:21:17 +0800
Message-ID: <20260618092124.3901230-4-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260618092124.3901230-1-tianruidong@linux.alibaba.com>
References: <20260618092124.3901230-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_022154_629198_18D9235B 
X-CRM114-Status: GOOD (  10.97  )
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

EX_TYPE_UACCESS_ERR_ZERO and EX_TYPE_KACCESS_ERR_ZERO have identical
handling in fixup_exception(): both unconditionally invoke
ex_handler_uaccess_err_zero() to set the error register to -EFAULT,
zero the destination register, and branch to the fixup address.

Merge them into a single EX_TYPE_ACCESS_ERR_ZERO to reduce redundancy
and renumber the subsequent types accordingly.

The _ASM_EXTABLE_UACCESS_ERR_ZERO and _ASM_EXTABLE_KACCESS_ERR_ZERO
helper macros are preserved as-is for caller readability, but both now
emit the unified EX_TYPE_ACCESS_ERR_ZERO type.

Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
---
 arch/arm64/include/asm/asm-extable.h | 15 +++++++--------
 arch/arm64/mm/extable.c              |  7 +++----
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/asm-extable.h b/arch/arm64/include/asm/asm-extable.h
index d67e2fdd1aee..06b19023939b 100644
--- a/arch/arm64/include/asm/asm-extable.h
+++ b/arch/arm64/include/asm/asm-extable.h
@@ -7,12 +7,11 @@
 
 #define EX_TYPE_NONE			0
 #define EX_TYPE_BPF			1
-#define EX_TYPE_UACCESS_ERR_ZERO	2
-#define EX_TYPE_KACCESS_ERR_ZERO	3
-#define EX_TYPE_UACCESS_CPY		4
-#define EX_TYPE_LOAD_UNALIGNED_ZEROPAD	5
+#define EX_TYPE_ACCESS_ERR_ZERO		2
+#define EX_TYPE_UACCESS_CPY		3
+#define EX_TYPE_LOAD_UNALIGNED_ZEROPAD	4
 
-/* Data fields for EX_TYPE_UACCESS_ERR_ZERO */
+/* Data fields for EX_TYPE_ACCESS_ERR_ZERO */
 #define EX_DATA_REG_ERR_SHIFT	0
 #define EX_DATA_REG_ERR		GENMASK(4, 0)
 #define EX_DATA_REG_ZERO_SHIFT	5
@@ -43,7 +42,7 @@
 
 #define _ASM_EXTABLE_UACCESS_ERR_ZERO(insn, fixup, err, zero)		\
 	__ASM_EXTABLE_RAW(insn, fixup, 					\
-			  EX_TYPE_UACCESS_ERR_ZERO,			\
+			  EX_TYPE_ACCESS_ERR_ZERO,			\
 			  (						\
 			    EX_DATA_REG(ERR, err) |			\
 			    EX_DATA_REG(ZERO, zero)			\
@@ -96,7 +95,7 @@
 #define _ASM_EXTABLE_UACCESS_ERR_ZERO(insn, fixup, err, zero)		\
 	__DEFINE_ASM_GPR_NUMS						\
 	__ASM_EXTABLE_RAW(#insn, #fixup, 				\
-			  __stringify(EX_TYPE_UACCESS_ERR_ZERO),	\
+			  __stringify(EX_TYPE_ACCESS_ERR_ZERO),	\
 			  "("						\
 			    EX_DATA_REG(ERR, err) " | "			\
 			    EX_DATA_REG(ZERO, zero)			\
@@ -105,7 +104,7 @@
 #define _ASM_EXTABLE_KACCESS_ERR_ZERO(insn, fixup, err, zero)		\
 	__DEFINE_ASM_GPR_NUMS						\
 	__ASM_EXTABLE_RAW(#insn, #fixup, 				\
-			  __stringify(EX_TYPE_KACCESS_ERR_ZERO),	\
+			  __stringify(EX_TYPE_ACCESS_ERR_ZERO),	\
 			  "("						\
 			    EX_DATA_REG(ERR, err) " | "			\
 			    EX_DATA_REG(ZERO, zero)			\
diff --git a/arch/arm64/mm/extable.c b/arch/arm64/mm/extable.c
index 6e0528831cd3..76b18780f1f9 100644
--- a/arch/arm64/mm/extable.c
+++ b/arch/arm64/mm/extable.c
@@ -41,7 +41,7 @@ get_ex_fixup(const struct exception_table_entry *ex)
 	return ((unsigned long)&ex->fixup + ex->fixup);
 }
 
-static bool ex_handler_uaccess_err_zero(const struct exception_table_entry *ex,
+static bool ex_handler_access_err_zero(const struct exception_table_entry *ex,
 					struct pt_regs *regs)
 {
 	int reg_err = FIELD_GET(EX_DATA_REG_ERR, ex->data);
@@ -103,9 +103,8 @@ bool fixup_exception(struct pt_regs *regs, unsigned long esr)
 	switch (ex->type) {
 	case EX_TYPE_BPF:
 		return ex_handler_bpf(ex, regs);
-	case EX_TYPE_UACCESS_ERR_ZERO:
-	case EX_TYPE_KACCESS_ERR_ZERO:
-		return ex_handler_uaccess_err_zero(ex, regs);
+	case EX_TYPE_ACCESS_ERR_ZERO:
+		return ex_handler_access_err_zero(ex, regs);
 	case EX_TYPE_UACCESS_CPY:
 		return ex_handler_uaccess_cpy(ex, regs, esr);
 	case EX_TYPE_LOAD_UNALIGNED_ZEROPAD:
-- 
2.39.3


