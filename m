Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1B2C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 01:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UPE/w7OMV+R/BpERehO0lW1KzawWpcv3Vb+OACxnfog=; b=YUuCiK0ZKqXgE5atGfj5VlMIgK
	oQINcFuuy6V+qItT5vaV+IIL3ay3cZ9JkSISv0W8ACpN4q8vhGpqjbwKFbLUo+RDcVMAZsIIvTXzJ
	L7sFBhcsvVtAgvOUjg4NbYwRFz00ffcuveN0v1s4q4iTPxTzCqWl5hBFGpLfL6Yg1NARit6VGpTRB
	itVRwUJ5yzTrHGKmJDc8pJv0bhLuDJLnmi2BbUjdogNsZDZ7OvNeGyLwr+uOr7vCQSqIDu6etIWm3
	Xhy7azU4izoQ20eil5NjLW/iiOHH4iDuh1k2Xrish1KmLKf55StvsXCRD3Laq6WF6r2v3mnXStx2f
	YWOBLH2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3PTD-0000000FEJ1-2POq;
	Sat, 12 Apr 2025 01:15:43 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3PO6-0000000FDt9-2kRQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 01:10:27 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-736b2a25d9fso1887261b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 18:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744420225; x=1745025025; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UPE/w7OMV+R/BpERehO0lW1KzawWpcv3Vb+OACxnfog=;
        b=SGMJNO4PGk/anLvep9IIR2d6W9CPmvFZ9Que03zMlfWjHsnseS3ILRFrixbxN0dDaV
         AnVLrxQiioa329cSEz1YrS9ivnduPAscYxmQ4SbIHsIqhNecRjOSOnIzL6uQk7knG/Ks
         hwxV+3Lp3SXl4k4fPNv4gzrLBxmieRubuUAh455Hf+NPSsVl5PF6FKLHVOT1++obM6kX
         BkXOfd6VNCZL1GgSmW1r+zE4Dd/AAqUv4wged90m5Ys2Ju4Sj5VbCTIF5DNFWE+o7ioH
         mQ/3TEh6aGIoPsPWNcmcXhTds53Tg/TzIfia5tP/WdZ20B6LCDgKv17tGcryTVUH11lS
         BNkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744420225; x=1745025025;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UPE/w7OMV+R/BpERehO0lW1KzawWpcv3Vb+OACxnfog=;
        b=G434pi9hB6zy3uL4ZMjy0Qtfya42RgOAN647RCYPl+NsY/Gy/vT5aGebHx2wo4tA1D
         Xhvj6Y4bcD712ewXGc7x7maAuVpwJdLWfOCTAdhPilm4m/8i/2Wnb73Z0Y36neWOjKHB
         ZbdBpboxf3QMEj3wNMPmUPoYwmNAJkznUXz7wyICBt9eF5jQFR//hXR0y0P5U128ngS9
         j0ndVfCyTiKpKCYIQR4aDC6wlmLkmMRxoROO22TgRcSawZIyLuU9T2WVrxdkbHhkzkBY
         wpGrE8Ke3568/p3RLrgFwOse9zFWbc/CVwVa09tPH0LuFnejkV2GSghGI+50jS1KUdGR
         5H4A==
X-Gm-Message-State: AOJu0YwQaDfcGF3yII5axvW0m8eTL7UIR08c8WeIOGCH/G4OEu6HFcI3
	Ac9c2vqIL1kXfr7xS/YCLE0E6tbNQPIAlmFjCYbxLK69kh6aq+QAmHOVcoa5SvZe9kLMTOuZQe2
	4J5th/5PaYf/AwJZM6oX9EA==
X-Google-Smtp-Source: AGHT+IGCCoJ+p4ug1h6JLtcNhK91NiKYTxwJFv7sDgsGsshWBvKN29loXFFysazsL5Y0Mr82eB8IfOe4BG34Ie+snA==
X-Received: from pfgt19.prod.google.com ([2002:a05:6a00:1393:b0:739:56be:f58c])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:9f8f:b0:1f5:6c94:2cc1 with SMTP id adf61e73a8af0-201797b7eeemr6841826637.21.1744420225268;
 Fri, 11 Apr 2025 18:10:25 -0700 (PDT)
Date: Sat, 12 Apr 2025 01:09:39 +0000
In-Reply-To: <20250412010940.1686376-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20250412010940.1686376-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250412010940.1686376-3-dylanbhatch@google.com>
Subject: [PATCH v2 2/2] arm64/module: Use text-poke API for late relocations.
From: Dylan Hatch <dylanbhatch@google.com>
To: Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, 
	"=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Song Liu <song@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Dylan Hatch <dylanbhatch@google.com>, Roman Gushchin <roman.gushchin@linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_181026_699109_7CA470EB 
X-CRM114-Status: GOOD (  17.38  )
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

To enable late module patching, livepatch modules need to be able to
apply some of their relocations well after being loaded. In this
scenario, use the text-poking API to allow this, even with
STRICT_MODULE_RWX.

This patch is largely based off commit 88fc078a7a8f6 ("x86/module: Use
text_poke() for late relocations").

Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 arch/arm64/kernel/module.c | 129 ++++++++++++++++++++++++-------------
 1 file changed, 83 insertions(+), 46 deletions(-)

diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
index 06bb680bfe975..0703502d9dc37 100644
--- a/arch/arm64/kernel/module.c
+++ b/arch/arm64/kernel/module.c
@@ -18,11 +18,13 @@
 #include <linux/moduleloader.h>
 #include <linux/random.h>
 #include <linux/scs.h>
+#include <linux/memory.h>
 
 #include <asm/alternative.h>
 #include <asm/insn.h>
 #include <asm/scs.h>
 #include <asm/sections.h>
+#include <asm/text-patching.h>
 
 enum aarch64_reloc_op {
 	RELOC_OP_NONE,
@@ -48,7 +50,8 @@ static u64 do_reloc(enum aarch64_reloc_op reloc_op, __le32 *place, u64 val)
 	return 0;
 }
 
-static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, int len)
+static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, int len,
+		      void *(*write)(void *dest, const void *src, size_t len))
 {
 	s64 sval = do_reloc(op, place, val);
 
@@ -66,7 +69,7 @@ static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, int len)
 
 	switch (len) {
 	case 16:
-		*(s16 *)place = sval;
+		write(place, &sval, sizeof(s16));
 		switch (op) {
 		case RELOC_OP_ABS:
 			if (sval < 0 || sval > U16_MAX)
@@ -82,7 +85,7 @@ static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, int len)
 		}
 		break;
 	case 32:
-		*(s32 *)place = sval;
+		write(place, &sval, sizeof(s32));
 		switch (op) {
 		case RELOC_OP_ABS:
 			if (sval < 0 || sval > U32_MAX)
@@ -98,7 +101,7 @@ static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, int len)
 		}
 		break;
 	case 64:
-		*(s64 *)place = sval;
+		write(place, &sval, sizeof(s64));
 		break;
 	default:
 		pr_err("Invalid length (%d) for data relocation\n", len);
@@ -113,11 +116,13 @@ enum aarch64_insn_movw_imm_type {
 };
 
 static int reloc_insn_movw(enum aarch64_reloc_op op, __le32 *place, u64 val,
-			   int lsb, enum aarch64_insn_movw_imm_type imm_type)
+			   int lsb, enum aarch64_insn_movw_imm_type imm_type,
+			   void *(*write)(void *dest, const void *src, size_t len))
 {
 	u64 imm;
 	s64 sval;
 	u32 insn = le32_to_cpu(*place);
+	__le32 le_insn;
 
 	sval = do_reloc(op, place, val);
 	imm = sval >> lsb;
@@ -145,7 +150,8 @@ static int reloc_insn_movw(enum aarch64_reloc_op op, __le32 *place, u64 val,
 
 	/* Update the instruction with the new encoding. */
 	insn = aarch64_insn_encode_immediate(AARCH64_INSN_IMM_16, insn, imm);
-	*place = cpu_to_le32(insn);
+	le_insn = cpu_to_le32(insn);
+	write(place, &le_insn, sizeof(le_insn));
 
 	if (imm > U16_MAX)
 		return -ERANGE;
@@ -154,11 +160,13 @@ static int reloc_insn_movw(enum aarch64_reloc_op op, __le32 *place, u64 val,
 }
 
 static int reloc_insn_imm(enum aarch64_reloc_op op, __le32 *place, u64 val,
-			  int lsb, int len, enum aarch64_insn_imm_type imm_type)
+			  int lsb, int len, enum aarch64_insn_imm_type imm_type,
+			  void *(*write)(void *dest, const void *src, size_t len))
 {
 	u64 imm, imm_mask;
 	s64 sval;
 	u32 insn = le32_to_cpu(*place);
+	__le32 le_insn;
 
 	/* Calculate the relocation value. */
 	sval = do_reloc(op, place, val);
@@ -170,7 +178,8 @@ static int reloc_insn_imm(enum aarch64_reloc_op op, __le32 *place, u64 val,
 
 	/* Update the instruction's immediate field. */
 	insn = aarch64_insn_encode_immediate(imm_type, insn, imm);
-	*place = cpu_to_le32(insn);
+	le_insn = cpu_to_le32(insn);
+	write(place, &le_insn, sizeof(le_insn));
 
 	/*
 	 * Extract the upper value bits (including the sign bit) and
@@ -189,17 +198,19 @@ static int reloc_insn_imm(enum aarch64_reloc_op op, __le32 *place, u64 val,
 }
 
 static int reloc_insn_adrp(struct module *mod, Elf64_Shdr *sechdrs,
-			   __le32 *place, u64 val)
+			   __le32 *place, u64 val,
+			   void *(*write)(void *dest, const void *src, size_t len))
 {
 	u32 insn;
+	__le32 le_insn;
 
 	if (!is_forbidden_offset_for_adrp(place))
 		return reloc_insn_imm(RELOC_OP_PAGE, place, val, 12, 21,
-				      AARCH64_INSN_IMM_ADR);
+				      AARCH64_INSN_IMM_ADR, write);
 
 	/* patch ADRP to ADR if it is in range */
 	if (!reloc_insn_imm(RELOC_OP_PREL, place, val & ~0xfff, 0, 21,
-			    AARCH64_INSN_IMM_ADR)) {
+			    AARCH64_INSN_IMM_ADR, write)) {
 		insn = le32_to_cpu(*place);
 		insn &= ~BIT(31);
 	} else {
@@ -211,15 +222,17 @@ static int reloc_insn_adrp(struct module *mod, Elf64_Shdr *sechdrs,
 						   AARCH64_INSN_BRANCH_NOLINK);
 	}
 
-	*place = cpu_to_le32(insn);
+	le_insn = cpu_to_le32(insn);
+	write(place, &le_insn, sizeof(le_insn));
 	return 0;
 }
 
-int apply_relocate_add(Elf64_Shdr *sechdrs,
+static int __apply_relocate_add(Elf64_Shdr *sechdrs,
 		       const char *strtab,
 		       unsigned int symindex,
 		       unsigned int relsec,
-		       struct module *me)
+		       struct module *me,
+		       void *(*write)(void *dest, const void *src, size_t len))
 {
 	unsigned int i;
 	int ovf;
@@ -255,23 +268,23 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 		/* Data relocations. */
 		case R_AARCH64_ABS64:
 			overflow_check = false;
-			ovf = reloc_data(RELOC_OP_ABS, loc, val, 64);
+			ovf = reloc_data(RELOC_OP_ABS, loc, val, 64, write);
 			break;
 		case R_AARCH64_ABS32:
-			ovf = reloc_data(RELOC_OP_ABS, loc, val, 32);
+			ovf = reloc_data(RELOC_OP_ABS, loc, val, 32, write);
 			break;
 		case R_AARCH64_ABS16:
-			ovf = reloc_data(RELOC_OP_ABS, loc, val, 16);
+			ovf = reloc_data(RELOC_OP_ABS, loc, val, 16, write);
 			break;
 		case R_AARCH64_PREL64:
 			overflow_check = false;
-			ovf = reloc_data(RELOC_OP_PREL, loc, val, 64);
+			ovf = reloc_data(RELOC_OP_PREL, loc, val, 64, write);
 			break;
 		case R_AARCH64_PREL32:
-			ovf = reloc_data(RELOC_OP_PREL, loc, val, 32);
+			ovf = reloc_data(RELOC_OP_PREL, loc, val, 32, write);
 			break;
 		case R_AARCH64_PREL16:
-			ovf = reloc_data(RELOC_OP_PREL, loc, val, 16);
+			ovf = reloc_data(RELOC_OP_PREL, loc, val, 16, write);
 			break;
 
 		/* MOVW instruction relocations. */
@@ -280,88 +293,88 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 			fallthrough;
 		case R_AARCH64_MOVW_UABS_G0:
 			ovf = reloc_insn_movw(RELOC_OP_ABS, loc, val, 0,
-					      AARCH64_INSN_IMM_MOVKZ);
+					      AARCH64_INSN_IMM_MOVKZ, write);
 			break;
 		case R_AARCH64_MOVW_UABS_G1_NC:
 			overflow_check = false;
 			fallthrough;
 		case R_AARCH64_MOVW_UABS_G1:
 			ovf = reloc_insn_movw(RELOC_OP_ABS, loc, val, 16,
-					      AARCH64_INSN_IMM_MOVKZ);
+					      AARCH64_INSN_IMM_MOVKZ, write);
 			break;
 		case R_AARCH64_MOVW_UABS_G2_NC:
 			overflow_check = false;
 			fallthrough;
 		case R_AARCH64_MOVW_UABS_G2:
 			ovf = reloc_insn_movw(RELOC_OP_ABS, loc, val, 32,
-					      AARCH64_INSN_IMM_MOVKZ);
+					      AARCH64_INSN_IMM_MOVKZ, write);
 			break;
 		case R_AARCH64_MOVW_UABS_G3:
 			/* We're using the top bits so we can't overflow. */
 			overflow_check = false;
 			ovf = reloc_insn_movw(RELOC_OP_ABS, loc, val, 48,
-					      AARCH64_INSN_IMM_MOVKZ);
+					      AARCH64_INSN_IMM_MOVKZ, write);
 			break;
 		case R_AARCH64_MOVW_SABS_G0:
 			ovf = reloc_insn_movw(RELOC_OP_ABS, loc, val, 0,
-					      AARCH64_INSN_IMM_MOVNZ);
+					      AARCH64_INSN_IMM_MOVNZ, write);
 			break;
 		case R_AARCH64_MOVW_SABS_G1:
 			ovf = reloc_insn_movw(RELOC_OP_ABS, loc, val, 16,
-					      AARCH64_INSN_IMM_MOVNZ);
+					      AARCH64_INSN_IMM_MOVNZ, write);
 			break;
 		case R_AARCH64_MOVW_SABS_G2:
 			ovf = reloc_insn_movw(RELOC_OP_ABS, loc, val, 32,
-					      AARCH64_INSN_IMM_MOVNZ);
+					      AARCH64_INSN_IMM_MOVNZ, write);
 			break;
 		case R_AARCH64_MOVW_PREL_G0_NC:
 			overflow_check = false;
 			ovf = reloc_insn_movw(RELOC_OP_PREL, loc, val, 0,
-					      AARCH64_INSN_IMM_MOVKZ);
+					      AARCH64_INSN_IMM_MOVKZ, write);
 			break;
 		case R_AARCH64_MOVW_PREL_G0:
 			ovf = reloc_insn_movw(RELOC_OP_PREL, loc, val, 0,
-					      AARCH64_INSN_IMM_MOVNZ);
+					      AARCH64_INSN_IMM_MOVNZ, write);
 			break;
 		case R_AARCH64_MOVW_PREL_G1_NC:
 			overflow_check = false;
 			ovf = reloc_insn_movw(RELOC_OP_PREL, loc, val, 16,
-					      AARCH64_INSN_IMM_MOVKZ);
+					      AARCH64_INSN_IMM_MOVKZ, write);
 			break;
 		case R_AARCH64_MOVW_PREL_G1:
 			ovf = reloc_insn_movw(RELOC_OP_PREL, loc, val, 16,
-					      AARCH64_INSN_IMM_MOVNZ);
+					      AARCH64_INSN_IMM_MOVNZ, write);
 			break;
 		case R_AARCH64_MOVW_PREL_G2_NC:
 			overflow_check = false;
 			ovf = reloc_insn_movw(RELOC_OP_PREL, loc, val, 32,
-					      AARCH64_INSN_IMM_MOVKZ);
+					      AARCH64_INSN_IMM_MOVKZ, write);
 			break;
 		case R_AARCH64_MOVW_PREL_G2:
 			ovf = reloc_insn_movw(RELOC_OP_PREL, loc, val, 32,
-					      AARCH64_INSN_IMM_MOVNZ);
+					      AARCH64_INSN_IMM_MOVNZ, write);
 			break;
 		case R_AARCH64_MOVW_PREL_G3:
 			/* We're using the top bits so we can't overflow. */
 			overflow_check = false;
 			ovf = reloc_insn_movw(RELOC_OP_PREL, loc, val, 48,
-					      AARCH64_INSN_IMM_MOVNZ);
+					      AARCH64_INSN_IMM_MOVNZ, write);
 			break;
 
 		/* Immediate instruction relocations. */
 		case R_AARCH64_LD_PREL_LO19:
 			ovf = reloc_insn_imm(RELOC_OP_PREL, loc, val, 2, 19,
-					     AARCH64_INSN_IMM_19);
+					     AARCH64_INSN_IMM_19, write);
 			break;
 		case R_AARCH64_ADR_PREL_LO21:
 			ovf = reloc_insn_imm(RELOC_OP_PREL, loc, val, 0, 21,
-					     AARCH64_INSN_IMM_ADR);
+					     AARCH64_INSN_IMM_ADR, write);
 			break;
 		case R_AARCH64_ADR_PREL_PG_HI21_NC:
 			overflow_check = false;
 			fallthrough;
 		case R_AARCH64_ADR_PREL_PG_HI21:
-			ovf = reloc_insn_adrp(me, sechdrs, loc, val);
+			ovf = reloc_insn_adrp(me, sechdrs, loc, val, write);
 			if (ovf && ovf != -ERANGE)
 				return ovf;
 			break;
@@ -369,46 +382,46 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 		case R_AARCH64_LDST8_ABS_LO12_NC:
 			overflow_check = false;
 			ovf = reloc_insn_imm(RELOC_OP_ABS, loc, val, 0, 12,
-					     AARCH64_INSN_IMM_12);
+					     AARCH64_INSN_IMM_12, write);
 			break;
 		case R_AARCH64_LDST16_ABS_LO12_NC:
 			overflow_check = false;
 			ovf = reloc_insn_imm(RELOC_OP_ABS, loc, val, 1, 11,
-					     AARCH64_INSN_IMM_12);
+					     AARCH64_INSN_IMM_12, write);
 			break;
 		case R_AARCH64_LDST32_ABS_LO12_NC:
 			overflow_check = false;
 			ovf = reloc_insn_imm(RELOC_OP_ABS, loc, val, 2, 10,
-					     AARCH64_INSN_IMM_12);
+					     AARCH64_INSN_IMM_12, write);
 			break;
 		case R_AARCH64_LDST64_ABS_LO12_NC:
 			overflow_check = false;
 			ovf = reloc_insn_imm(RELOC_OP_ABS, loc, val, 3, 9,
-					     AARCH64_INSN_IMM_12);
+					     AARCH64_INSN_IMM_12, write);
 			break;
 		case R_AARCH64_LDST128_ABS_LO12_NC:
 			overflow_check = false;
 			ovf = reloc_insn_imm(RELOC_OP_ABS, loc, val, 4, 8,
-					     AARCH64_INSN_IMM_12);
+					     AARCH64_INSN_IMM_12, write);
 			break;
 		case R_AARCH64_TSTBR14:
 			ovf = reloc_insn_imm(RELOC_OP_PREL, loc, val, 2, 14,
-					     AARCH64_INSN_IMM_14);
+					     AARCH64_INSN_IMM_14, write);
 			break;
 		case R_AARCH64_CONDBR19:
 			ovf = reloc_insn_imm(RELOC_OP_PREL, loc, val, 2, 19,
-					     AARCH64_INSN_IMM_19);
+					     AARCH64_INSN_IMM_19, write);
 			break;
 		case R_AARCH64_JUMP26:
 		case R_AARCH64_CALL26:
 			ovf = reloc_insn_imm(RELOC_OP_PREL, loc, val, 2, 26,
-					     AARCH64_INSN_IMM_26);
+					     AARCH64_INSN_IMM_26, write);
 			if (ovf == -ERANGE) {
 				val = module_emit_plt_entry(me, sechdrs, loc, &rel[i], sym);
 				if (!val)
 					return -ENOEXEC;
 				ovf = reloc_insn_imm(RELOC_OP_PREL, loc, val, 2,
-						     26, AARCH64_INSN_IMM_26);
+						     26, AARCH64_INSN_IMM_26, write);
 			}
 			break;
 
@@ -431,6 +444,30 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 	return -ENOEXEC;
 }
 
+int apply_relocate_add(Elf64_Shdr *sechdrs,
+		       const char *strtab,
+		       unsigned int symindex,
+		       unsigned int relsec,
+		       struct module *me)
+{
+	int ret;
+	bool early = me->state == MODULE_STATE_UNFORMED;
+	void *(*write)(void *, const void *, size_t) = memcpy;
+
+	if (!early) {
+		write = text_poke;
+		mutex_lock(&text_mutex);
+	}
+
+	ret = __apply_relocate_add(sechdrs, strtab, symindex, relsec, me,
+				   write);
+
+	if (!early)
+		mutex_unlock(&text_mutex);
+
+	return ret;
+}
+
 static inline void __init_plt(struct plt_entry *plt, unsigned long addr)
 {
 	*plt = get_plt_entry(addr, plt);
-- 
2.49.0.604.gff1f9ca942-goog


