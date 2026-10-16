Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE986CCA490
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=81jQZ56Geu+Ohht4cRomCtGH2HqeEbqEfCQEOB/kiZ8=; b=fhKAiNfIZpOFVh
	7PaOy3/W5Q52KXPaVaG73H4I1eLzqFM3TukgoQHYD0SH3DPeISCBclxC7yKRqxk4HVmWpb1/F6nUI
	KGWprodTnjn5g7twEv7W5tiQ578mw2Ja88pYeguz9SPRVWbscyzAWIi/gSxpe9h7HgtMpnui3z3jH
	cImWrBQZnKZRb0kloLpU8ZjiJfrqtPl5SZZCgTEN8VMDNm7rbngr6GdRsER5Cb7rBWs7JapRKMtSl
	LZvFYJKqeTyI2Xouu37mF+ELMWvwO/BbpVIWdARbJt/HYIoPQMbVbc9u21P0P5/Y6JlrKC4DG7hf1
	Z39eGqqVVd/lI9IepVIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlAH-00000003T56-1Iz8;
	Fri, 16 Oct 2026 16:52:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlA9-00000003T13-1aoD
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 16:52:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=81jQZ56Geu+Ohht4cRomCtGH2HqeEbqEfCQEOB/kiZ8=; b=BS8fc8g4UUUmuNFBCbUjmjVKrn
	F0uas9wXKUwqJsssMaty+5Y8bTDZByWeS13zR9zFx+iQ1PD8Nw6S3zP82sVfzmdamqJceSxBAbZ6O
	4qcbApTRyzNU8Pwu6PBrVS9iUy+UcFMONymEQIuEJE98M+f6WeLJ9pf2hL8x7AtJFHA5TK0oSAro1
	43Cc0CFVBo5SjmnRpqJbdFKOiA/FpV3HNimKDzMuUqzrIIPyoegoZcoAHgFPSsYnoNlCo3AyualM8
	IkKn6421Eno34EUYUYIZZ+BjLqn2PO0Y6y6I12WRfA+PG3m5MtrfmvfZnxwYBDZIZjFy6Ypz/iNPq
	yfez+Bfw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHlA5-00000001l7J-1NbR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 16:52:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5DCBA1691;
	Fri, 16 Oct 2026 09:51:59 -0700 (PDT)
Received: from e137867.arm.com (unknown [10.57.15.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EAB253F7B4;
	Fri, 16 Oct 2026 09:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169522; bh=2ATbxOE6O4Nr3TpvbdMAkjOlj8QGNM1zKbAo1t35cH0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pbgW4E8CU+P4vw5KynCZU73BcTN8KvTP52rz2pVHBIDg/zG/528T3mFcUn4FqaLL6
	 ZvKDJaVwUhKeRWoF9u3dNmqmkXVTizD5jHU9desn9JdEvXO1nqqREz9ArcdqDmgsyV
	 xM1l/raxoHDH/zr9WelkPHmOu2fi0qc3lnnJO5X4=
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] arm64: insn: make `aarch64_insn_gen_d{m,s}b()` alternative-safe
Date: Fri, 16 Oct 2026 17:51:40 +0100
Message-ID: <20261016165140.254791-3-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016165140.254791-1-ada.coupriediaz@arm.com>
References: <20261016165140.254791-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_175205_765660_32ECE4E6 
X-CRM114-Status: GOOD (  11.88  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Barry Song <baohua@kernel.org>, Vladimir Murzin <vladimir.murzin@arm.com>, Puranjay Mohan <puranjay@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, Lucas Wei <lucaswei@google.com>, Mark Brown <broonie@kernel.org>, Andre Przywara <andre.przywara@arm.com>, Tejun Heo <tj@kernel.org>, Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Move `aarch64_insn_gen_d{m,s}b()` and `__get_barrier_crm_val()`
to `insn.h` and mark them `__always_inline`.
Replace the error print by an inline build-time check
now that the compiler can verify all call sites.

As BPF is the only caller, with static arguments, only accept
non-deprecated types for each barrier, as per Arm ARM DDI 0487
version M.c[0], and update `A64_DMB_ISH` accordingly.

As all functions are now inlined and do not call any instrumentable
function, they are now safe to call in alternative callbacks.

[0]: https://support.arm.com/documentation/ddi0487/mc/
         (See C6.2.150, C6.2.152)

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
 arch/arm64/include/asm/insn.h | 46 +++++++++++++++++++++++++++++++++--
 arch/arm64/lib/insn.c         | 44 ---------------------------------
 arch/arm64/net/bpf_jit.h      |  2 +-
 3 files changed, 45 insertions(+), 47 deletions(-)

diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
index 2d19f48aab81..c91a8431c961 100644
--- a/arch/arm64/include/asm/insn.h
+++ b/arch/arm64/include/asm/insn.h
@@ -703,8 +703,50 @@ u32 aarch64_insn_gen_cas(enum aarch64_insn_register result,
 			 enum aarch64_insn_register value,
 			 enum aarch64_insn_size_type size,
 			 enum aarch64_insn_mem_order_type order);
-u32 aarch64_insn_gen_dmb(enum aarch64_insn_mb_type type);
-u32 aarch64_insn_gen_dsb(enum aarch64_insn_mb_type type);
+
+static __always_inline u32 aarch64_insn_gen_dmb(enum aarch64_insn_mb_type type)
+{
+	u32 insn;
+
+	switch (type) {
+	case AARCH64_INSN_MB_LD:
+	case AARCH64_INSN_MB_ST:
+	case AARCH64_INSN_MB_SY:
+		break;
+	default:
+		BUILD_BUG_ON_MSG(1, "invalid dmb type");
+	}
+
+	insn = aarch64_insn_get_dmb_value();
+	insn &= ~AARCH64_INSN_MB_TYPE_MASK;
+	insn |= type;
+
+	return insn;
+}
+
+static __always_inline u32 aarch64_insn_gen_dsb(enum aarch64_insn_mb_type type)
+{
+	u32 insn;
+
+	switch (type) {
+	case AARCH64_INSN_MB_OSH:
+	case AARCH64_INSN_MB_NSH:
+	case AARCH64_INSN_MB_ISH:
+	case AARCH64_INSN_MB_LD:
+	case AARCH64_INSN_MB_ST:
+	case AARCH64_INSN_MB_SY:
+		break;
+	default:
+		BUILD_BUG_ON_MSG(1, "invalid dsb type");
+	}
+
+	insn = aarch64_insn_get_dsb_base_value();
+	insn &= ~AARCH64_INSN_MB_TYPE_MASK;
+	insn |= type;
+
+	return insn;
+}
+
 u32 aarch64_insn_gen_mrs(enum aarch64_insn_register result,
 			 enum aarch64_insn_system_register sysreg);
 
diff --git a/arch/arm64/lib/insn.c b/arch/arm64/lib/insn.c
index fa61a631d687..5c37f3a4c402 100644
--- a/arch/arm64/lib/insn.c
+++ b/arch/arm64/lib/insn.c
@@ -1561,50 +1561,6 @@ u32 aarch64_insn_gen_extr(enum aarch64_insn_variant variant,
 	return aarch64_insn_encode_register(AARCH64_INSN_REGTYPE_RM, insn, Rm);
 }
 
-static bool __is_valid_barrier_type(enum aarch64_insn_mb_type type)
-{
-	switch (type) {
-	case AARCH64_INSN_MB_OSH:
-	case AARCH64_INSN_MB_NSH:
-	case AARCH64_INSN_MB_ISH:
-	case AARCH64_INSN_MB_LD:
-	case AARCH64_INSN_MB_ST:
-	case AARCH64_INSN_MB_SY:
-		return true;
-	default:
-		pr_err("%s: unknown barrier type %d\n", __func__, type);
-		return false;
-	}
-}
-
-u32 aarch64_insn_gen_dmb(enum aarch64_insn_mb_type type)
-{
-	u32 insn;
-
-	if (!__is_valid_barrier_type(type))
-		return AARCH64_BREAK_FAULT;
-
-	insn = aarch64_insn_get_dmb_value();
-	insn &= ~AARCH64_INSN_MB_TYPE_MASK;
-	insn |= type;
-
-	return insn;
-}
-
-u32 aarch64_insn_gen_dsb(enum aarch64_insn_mb_type type)
-{
-	u32 insn;
-
-	if (!__is_valid_barrier_type(type))
-		return AARCH64_BREAK_FAULT;
-
-	insn = aarch64_insn_get_dsb_base_value();
-	insn &= ~AARCH64_INSN_MB_TYPE_MASK;
-	insn |= type;
-
-	return insn;
-}
-
 u32 aarch64_insn_gen_mrs(enum aarch64_insn_register result,
 			 enum aarch64_insn_system_register sysreg)
 {
diff --git a/arch/arm64/net/bpf_jit.h b/arch/arm64/net/bpf_jit.h
index b2fe6e6dcf44..08d514b40a5b 100644
--- a/arch/arm64/net/bpf_jit.h
+++ b/arch/arm64/net/bpf_jit.h
@@ -324,7 +324,7 @@
 #define A64_NOP    A64_HINT(AARCH64_INSN_HINT_NOP)
 
 /* DMB */
-#define A64_DMB_ISH aarch64_insn_gen_dmb(AARCH64_INSN_MB_ISH)
+#define A64_DMB_ISH aarch64_insn_gen_dmb(AARCH64_INSN_MB_SY)
 
 /* ADR */
 #define A64_ADR(Rd, offset) \
-- 
2.43.0


