Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B46A4CAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 17:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/h3GryW2ugWYvXKu7+Axpgl6L5jNnr93ft50tZXJ/tA=; b=jH84SpWYLWTYKL
	xdmHvvrCJST3Aph7sgS3OaJmAJ8dQBBEgcCBuC2GsCLL2ta8ITHxio2k4wOIbpouAAjZ0u+5wn28Q
	b4BUhmQ2k07Z8Gv6/wFsOrSsiGQrQiLA2Ot6xRsq2JQ8Yab0c3GrhzCAz8J/4MD0xushgNZZxX7Zq
	lJAX4PkLdZl4k1DLBKf8BfTD3C2nmq9jatNfpUqKRExdIynveYvY+j6jgpSVgiqV/p6b8bmXQgQAx
	1FF/SaJWtsi4deKFwNYLJtFfG869YzXS5xPKDd9W2drP9P5VQks47WolpHw/zdUAseOgXz1fVdzcP
	OaQU3007FZQ5ELtbiN8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v179m-0000000ESOv-2ws5;
	Tue, 23 Sep 2025 17:50:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v179c-0000000ES9a-0j8a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 17:50:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E640497;
	Tue, 23 Sep 2025 10:50:07 -0700 (PDT)
Received: from e137867.cambridge.arm.com (e137867.arm.com [10.1.30.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EC8333F5A1;
	Tue, 23 Sep 2025 10:50:11 -0700 (PDT)
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 15/16] arm64/insn: always inline aarch64_insn_gen_load_acq_store_rel()
Date: Tue, 23 Sep 2025 18:49:02 +0100
Message-ID: <20250923174903.76283-16-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923174903.76283-1-ada.coupriediaz@arm.com>
References: <20250923174903.76283-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_105016_350174_B5773CFD 
X-CRM114-Status: GOOD (  10.18  )
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

As it is always called with an explicit instruction type, we can
check for its validity at compile time and remove the runtime error print.

This makes `aarch64_insn_gen_load_acq_store_rel()` safe for inlining
and usage from patching callbacks, as both
`aarch64_insn_encode_ldst_size()` and `aarch64_insn_encode_register()`
have been made safe in previous commits.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
 arch/arm64/include/asm/insn.h | 36 +++++++++++++++++++++++++++++++----
 arch/arm64/lib/insn.c         | 29 ----------------------------
 2 files changed, 32 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
index 46d4d452e2e2..b7abc9b3e74c 100644
--- a/arch/arm64/include/asm/insn.h
+++ b/arch/arm64/include/asm/insn.h
@@ -882,10 +882,38 @@ u32 aarch64_insn_gen_load_store_pair(enum aarch64_insn_register reg1,
 				     int offset,
 				     enum aarch64_insn_variant variant,
 				     enum aarch64_insn_ldst_type type);
-u32 aarch64_insn_gen_load_acq_store_rel(enum aarch64_insn_register reg,
-					enum aarch64_insn_register base,
-					enum aarch64_insn_size_type size,
-					enum aarch64_insn_ldst_type type);
+
+static __always_inline u32 aarch64_insn_gen_load_acq_store_rel(
+					 enum aarch64_insn_register reg,
+					 enum aarch64_insn_register base,
+					 enum aarch64_insn_size_type size,
+					 enum aarch64_insn_ldst_type type)
+{
+	compiletime_assert(type == AARCH64_INSN_LDST_LOAD_ACQ ||
+					type == AARCH64_INSN_LDST_STORE_REL,
+		"unknown load-acquire/store-release encoding");
+	u32 insn;
+
+	switch (type) {
+	case AARCH64_INSN_LDST_LOAD_ACQ:
+		insn = aarch64_insn_get_load_acq_value();
+		break;
+	case AARCH64_INSN_LDST_STORE_REL:
+		insn = aarch64_insn_get_store_rel_value();
+		break;
+	default:
+		return AARCH64_BREAK_FAULT;
+	}
+
+	insn = aarch64_insn_encode_ldst_size(size, insn);
+
+	insn = aarch64_insn_encode_register(AARCH64_INSN_REGTYPE_RT, insn,
+					    reg);
+
+	return aarch64_insn_encode_register(AARCH64_INSN_REGTYPE_RN, insn,
+					    base);
+}
+
 u32 aarch64_insn_gen_load_store_ex(enum aarch64_insn_register reg,
 				   enum aarch64_insn_register base,
 				   enum aarch64_insn_register state,
diff --git a/arch/arm64/lib/insn.c b/arch/arm64/lib/insn.c
index 63564d236235..6ee298f96d47 100644
--- a/arch/arm64/lib/insn.c
+++ b/arch/arm64/lib/insn.c
@@ -328,35 +328,6 @@ u32 aarch64_insn_gen_load_store_pair(enum aarch64_insn_register reg1,
 					     offset >> shift);
 }
 
-u32 aarch64_insn_gen_load_acq_store_rel(enum aarch64_insn_register reg,
-					enum aarch64_insn_register base,
-					enum aarch64_insn_size_type size,
-					enum aarch64_insn_ldst_type type)
-{
-	u32 insn;
-
-	switch (type) {
-	case AARCH64_INSN_LDST_LOAD_ACQ:
-		insn = aarch64_insn_get_load_acq_value();
-		break;
-	case AARCH64_INSN_LDST_STORE_REL:
-		insn = aarch64_insn_get_store_rel_value();
-		break;
-	default:
-		pr_err("%s: unknown load-acquire/store-release encoding %d\n",
-		       __func__, type);
-		return AARCH64_BREAK_FAULT;
-	}
-
-	insn = aarch64_insn_encode_ldst_size(size, insn);
-
-	insn = aarch64_insn_encode_register(AARCH64_INSN_REGTYPE_RT, insn,
-					    reg);
-
-	return aarch64_insn_encode_register(AARCH64_INSN_REGTYPE_RN, insn,
-					    base);
-}
-
 u32 aarch64_insn_gen_load_store_ex(enum aarch64_insn_register reg,
 				   enum aarch64_insn_register base,
 				   enum aarch64_insn_register state,
-- 
2.43.0


