Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11E2EDB7EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 10:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUGIsze2ZM1sMAlycpNpVpAjTScRX8yxh6ClH5yDmko=; b=z9etxemJjsMkaajjcX/n3duARj
	eF3V8/CX2kH5Xw6TxPK0/moaO8FpL98ZOFnFCyu6qI/Uy81qxvQ8uIDqDn4HcFm3nOUtyEdCATGO3
	pWB+ZT8Mp25JFPuexodxJrt/13l9G5nepKWhwnU+Ms8Bm7AE94e6AKEbwM/VlpE/6FsCtioaiD2yZ
	ir+QdcVK71fLVzvJvH1HjIyQLbSJaIEG/54iBybRtUKIoYlX18nr9HKnAu4KKAdBFLvKDy23P9I3U
	7+wAT7dyRLK0ivS8rkBROPkO29ueWz7bWcdjoApplZ3ff/2pAvKvcq0H0zqggVmoIKhqY7qkMZ98S
	YK2x48cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA3fy-00000006Ho5-4AdG;
	Tue, 07 Apr 2026 10:28:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA3fw-00000006Hmk-1zoJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 10:28:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3B481C14;
	Tue,  7 Apr 2026 03:28:45 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF30E3F86F;
	Tue,  7 Apr 2026 03:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775557731; bh=dTATCCNsPeqserIF3s6JVimXK6Cxpv5jGTnuaTnnMGc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tKWYDqoeTxb0CLgr9iK2Tf8kL6H42DB5AQb+7/X7bSvxD98EM5qsht9JoD5bMpPy1
	 TglfAlL0kprGwnB7PCBYJSJ6IU6fY6hoc47ALroqh/erU1Vx9Qm4Ol8EIlqPyxxUNY
	 o+yPDajSJawxBsdd14OYS89Y555Jbf151Eh/95Co=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v5 1/4] arm64: tlb: Introduce __tlbi_sync_s1ish_{kernel,batch}() for TLB maintenance
Date: Tue,  7 Apr 2026 11:28:41 +0100
Message-ID: <20260407102848.2266988-2-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407102848.2266988-1-catalin.marinas@arm.com>
References: <20260407102848.2266988-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_032852_641406_024E5D9A 
X-CRM114-Status: GOOD (  12.39  )
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

Add __tlbi_sync_s1ish_kernel() similar to __tlbi_sync_s1ish() and use it
for kernel TLB maintenance. Also use this function in flush_tlb_all()
which is only used in relation to kernel mappings. Subsequent patches
can differentiate between workarounds that apply to user only or both
user and kernel.

A subsequent patch will add mm_struct to __tlbi_sync_s1ish(). Since
arch_tlbbatch_flush() is not specific to an mm, add a corresponding
__tlbi_sync_s1ish_batch() helper.

Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/tlbflush.h | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index 1416e652612b..f41eebf00990 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -191,6 +191,18 @@ static inline void __tlbi_sync_s1ish(void)
 	__repeat_tlbi_sync(vale1is, 0);
 }
 
+static inline void __tlbi_sync_s1ish_batch(void)
+{
+	dsb(ish);
+	__repeat_tlbi_sync(vale1is, 0);
+}
+
+static inline void __tlbi_sync_s1ish_kernel(void)
+{
+	dsb(ish);
+	__repeat_tlbi_sync(vale1is, 0);
+}
+
 /*
  * Complete broadcast TLB maintenance issued by hyp code which invalidates
  * stage 1 translation information in any translation regime.
@@ -299,7 +311,7 @@ static inline void flush_tlb_all(void)
 {
 	dsb(ishst);
 	__tlbi(vmalle1is);
-	__tlbi_sync_s1ish();
+	__tlbi_sync_s1ish_kernel();
 	isb();
 }
 
@@ -385,7 +397,7 @@ static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
  */
 static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
 {
-	__tlbi_sync_s1ish();
+	__tlbi_sync_s1ish_batch();
 }
 
 /*
@@ -568,7 +580,7 @@ static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end
 	dsb(ishst);
 	__flush_tlb_range_op(vaale1is, start, pages, stride, 0,
 			     TLBI_TTL_UNKNOWN, false, lpa2_is_enabled());
-	__tlbi_sync_s1ish();
+	__tlbi_sync_s1ish_kernel();
 	isb();
 }
 
@@ -582,7 +594,7 @@ static inline void __flush_tlb_kernel_pgtable(unsigned long kaddr)
 
 	dsb(ishst);
 	__tlbi(vaae1is, addr);
-	__tlbi_sync_s1ish();
+	__tlbi_sync_s1ish_kernel();
 	isb();
 }
 

