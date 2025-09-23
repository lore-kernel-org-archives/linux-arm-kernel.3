Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8396CAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 17:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=og+DP0OpgQMx1Vo1aDv2fAVsSm3Pe/LirWAaXqKKDW0=; b=v+v+RDUNyXiX9Z
	Q43pfuY7VH+WsQkxGcxf6i5mpmUTWmY/CLpgWAF2UASdif8HTuQ8Y3of0J4lFTPBiQ2pSAqSuEyx5
	HwV8qNrSXwxgQQvxXr1thk6prJFMhD88KX2rT3wYGjlHZarFkHgT96egi4gkcddBCr4Qhopxr6z8b
	nckgUR9+aLmztKfCyNdNITKrHqiCZ2ORkaEmWFOJLmp3iZxT6f/DP3sDgb2N0YiMSuQ/1MUj53x2w
	33SlVGxhgS7+1Ks9wG+M0F1RHwlQ7j4j/8+02SD9jlFXGd0GSfAiFTJ77HTjxs0DQurE9lZccCdi9
	avo79uDyNJYv7qV/41OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v179f-0000000ESDm-20J5;
	Tue, 23 Sep 2025 17:50:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v179X-0000000ES5x-2gMS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 17:50:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65F85FEC;
	Tue, 23 Sep 2025 10:49:59 -0700 (PDT)
Received: from e137867.cambridge.arm.com (e137867.arm.com [10.1.30.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D6C233F5A1;
	Tue, 23 Sep 2025 10:50:03 -0700 (PDT)
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 13/16] arm64/insn: introduce missing is_store/is_load helpers
Date: Tue, 23 Sep 2025 18:49:00 +0100
Message-ID: <20250923174903.76283-14-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923174903.76283-1-ada.coupriediaz@arm.com>
References: <20250923174903.76283-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_105011_801086_11A3DBFC 
X-CRM114-Status: GOOD (  10.32  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, kvmarm@lists.linux.dev, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, kasan-dev@googlegroups.com, Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The current helpers only cover single and pair load/stores.
Introduce new helpers to cover exclusive, load acquire, store release
and the LSE atomics, as they both load and store.

To gather all of them in one call : introduce `aarch64_insn_is_load()`,
`aarch64_insn_is_store()`, and `aarch64_insn_is_ldst()` helpers which
check if the instruction is a load, store or either.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
Note: I made the LSE atomics part of the is_{load,store} helpers
as they are used as such by `aarch64_insn_encode_ldst_size()`,
but it could make sense to not have them in the helpers and just
call them together where neeeded.
---
 arch/arm64/include/asm/insn.h | 53 +++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
index 4ba4d5c50137..44435eede1f3 100644
--- a/arch/arm64/include/asm/insn.h
+++ b/arch/arm64/include/asm/insn.h
@@ -520,6 +520,23 @@ static __always_inline bool aarch64_insn_is_barrier(u32 insn)
 	       aarch64_insn_is_pssbb(insn);
 }
 
+#ifdef CONFIG_ARM64_LSE_ATOMICS
+static __always_inline bool aarch64_insn_is_lse_atomic(u32 insn)
+{
+	return aarch64_insn_is_ldadd(insn) ||
+	       aarch64_insn_is_ldclr(insn) ||
+	       aarch64_insn_is_ldeor(insn) ||
+		   aarch64_insn_is_ldset(insn) ||
+		   aarch64_insn_is_swp(insn) ||
+		   aarch64_insn_is_cas(insn);
+}
+#else /* CONFIG_ARM64_LSE_ATOMICS */
+static __always_inline bool aarch64_insn_is_lse_atomic(u32 insn)
+{
+	return false;
+}
+#endif /* CONFIG_ARM64_LSE_ATOMICS */
+
 static __always_inline bool aarch64_insn_is_store_single(u32 insn)
 {
 	return aarch64_insn_is_store_imm(insn) ||
@@ -534,6 +551,21 @@ static __always_inline bool aarch64_insn_is_store_pair(u32 insn)
 	       aarch64_insn_is_stp_post(insn);
 }
 
+static __always_inline bool aarch64_insn_is_store_ex_or_rel(u32 insn)
+{
+	return aarch64_insn_is_store_ex(insn) ||
+	       aarch64_insn_is_store_ex(insn & (~BIT(15))) ||
+		   aarch64_insn_is_store_rel(insn);
+}
+
+static __always_inline bool aarch64_insn_is_store(u32 insn)
+{
+	return aarch64_insn_is_store_single(insn) ||
+	       aarch64_insn_is_store_pair(insn) ||
+		   aarch64_insn_is_store_ex_or_rel(insn) ||
+		   aarch64_insn_is_lse_atomic(insn);
+}
+
 static __always_inline bool aarch64_insn_is_load_single(u32 insn)
 {
 	return aarch64_insn_is_load_imm(insn) ||
@@ -548,6 +580,27 @@ static __always_inline bool aarch64_insn_is_load_pair(u32 insn)
 	       aarch64_insn_is_ldp_post(insn);
 }
 
+static __always_inline bool aarch64_insn_is_load_ex_or_acq(u32 insn)
+{
+	return aarch64_insn_is_load_ex(insn) ||
+	       aarch64_insn_is_load_ex(insn & (~BIT(15))) ||
+		   aarch64_insn_is_load_acq(insn);
+}
+
+static __always_inline bool aarch64_insn_is_load(u32 insn)
+{
+	return aarch64_insn_is_load_single(insn) ||
+	       aarch64_insn_is_load_pair(insn) ||
+		   aarch64_insn_is_load_ex_or_acq(insn) ||
+		   aarch64_insn_is_lse_atomic(insn);
+}
+
+static __always_inline bool aarch64_insn_is_ldst(u32 insn)
+{
+	return aarch64_insn_is_load(insn) ||
+		   aarch64_insn_is_store(insn);
+}
+
 static __always_inline bool aarch64_insn_uses_literal(u32 insn)
 {
 	/* ldr/ldrsw (literal), prfm */
-- 
2.43.0


