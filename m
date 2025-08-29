Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2375CA1003
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 12:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wUtIC/PUlgbnKWmqB1hhaXTqqtxzlLh5ui1srkbL3AQ=; b=eqE/UeUvhz77gYe/s0Hfw3vs8W
	LGQds1Vy2YIvNMhRQuuviQ6V2OgV1QSR4tHvR5JX0MRhwOKr9zIoPEbs6i/yIAlphQL0WszCS7znC
	Ah73yb9y6QmQ6nniZ10+Sm+Y3TO3BVmxeawNtWfFnQxRJJSS15v1rbybrVpykTZFysW22+Coy09Q2
	ey5mLPI6d2pf0s/OI0Oa8RMuusjM+Eaf2UaUNKELjDwbTeNni6FPKDHxqjJxMTh/bUc8fjvOW5s/O
	7F/GycY+HWoAkR55SraCWr5TYK/T1TCrcDrBgOLntqHlEJ3cZz/11HTUHSXgbUgCgFH8yAIzP9oQE
	MmrqXgIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uryAq-00000005dkr-3hRG;
	Fri, 29 Aug 2025 12:25:44 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urvlw-00000005Cvx-0UFB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 09:51:53 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-45a1b05d8d0so13318845e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 02:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756461110; x=1757065910; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wUtIC/PUlgbnKWmqB1hhaXTqqtxzlLh5ui1srkbL3AQ=;
        b=YnwBjZRd5wzyJ4BcKmybRo4JF++9m2iKAOjoM9DyCNKpFXmiQTJUp1cU1xKzuWOwc5
         /NDxRabGM8QHZevXqKoDEXi2kbKo/fbKnvBzIgOCXD+NpMG+7DBTAt483LeaAiMXENOG
         BxG5qphqGI3UTFg6MmRFXIr8cDkbsPfo10TkkY5Tbgg5KBWMD01hrkvh/GyZ068BDwb/
         XjxAIisvftp9dKTmkmcPRTNnCUWTguU4vrSYxzOELfpM2fuGy7GNfB394rHhaBuK8qnu
         vg9/VnXeFtSjpq+XjL+nqeM+rnjOMdzLKiD01ATc3bZROdkcRZPOgW0jp7Ikzmju8oiD
         uF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756461110; x=1757065910;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wUtIC/PUlgbnKWmqB1hhaXTqqtxzlLh5ui1srkbL3AQ=;
        b=Yw/tdj1kqoeZgSxpvRM1Uo3YE0IAbZl6kQFY2h82uH1ElJtr56lEcHVdYtoVK8FTje
         LCcUV9gzFdImFfN/Mg7M68z4u4R/4UDKa7sS5PFfxpVwwy5GhxXx7NoYc7xgNGnrQ6fq
         /ERXELnXuUklyS7vY9NV3QTkKbpiJNWGiqMXvU3JsfwbsHekQBd56xPDH2JWbPGLfhlr
         jAg69bp7io8vGVrBMFyzg/71SzrLiwy30/ymyZjROU1mutRf3SKNPLlOE3sIPg4nnLx+
         ozOOUJQhNtWE3EDWDW8vF4zCLmpgxWArR9HUP5SF0Q8MmqN3g+kuAeziEjdnYW9fn1dE
         tPqw==
X-Forwarded-Encrypted: i=1; AJvYcCW2Qf/kDAt2ZI9rLtKwcDbVjns6g9i6UzfPFfe20c1QRQeJlU23NcuhpDFMl1MWPPRf98faSZo/Zq+9mGpm7r/T@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6zkPOjNNnlxx1d+jJGoFZHv15GJhIdQ3lV+RjkgB0e3Wugu5O
	ajmbePO1A8D4iBuJzpmbIeU+cKBBji0wOh2wX8J902ytwJ+NpstrnI3w1kkBtz7jMbgqv19Vh8m
	3Nw==
X-Google-Smtp-Source: AGHT+IG4LZvprQPgXGbuTP/AJPiF0vWUOEP8YRyLeAssbzWZY1ebzdVHOewocmmnLPmpci27WwY3j7d7sg==
X-Received: from wmht1.prod.google.com ([2002:a05:600c:41c1:b0:45b:79d1:abcb])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:5491:b0:459:d9a2:e927
 with SMTP id 5b1f17b1804b1-45b51798f8fmr242471655e9.5.1756461109684; Fri, 29
 Aug 2025 02:51:49 -0700 (PDT)
Date: Fri, 29 Aug 2025 10:51:43 +0100
In-Reply-To: <20250829095143.123476-1-tabba@google.com>
Mime-Version: 1.0
References: <20250829095143.123476-1-tabba@google.com>
X-Mailer: git-send-email 2.51.0.338.gd7d06c2dae-goog
Message-ID: <20250829095143.123476-4-tabba@google.com>
Subject: [PATCH v3 3/3] arm64: sysreg: Add validation checks to sysreg header
 generation script
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vdonnefort@google.com, qperret@google.com, 
	sebastianene@google.com, keirf@google.com, smostafa@google.com, 
	tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_025152_154188_B125BE5B 
X-CRM114-Status: GOOD (  10.85  )
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

The gen_sysreg.awk script processes the system register specification in
the sysreg text file to generate C macro definitions. The current script
will silently accept certain errors in the specification file, leading
to incorrect header generation.

For example, a Sysreg or SysregFields can be accidentally duplicated,
causing its macros to be emitted twice. An Enum can contain duplicate
values for different items, which is architecturally incorrect.

Add checks to catch these errors at build time. The script now tracks
all seen Sysreg and SysregFields definitions and checks for duplicates.
It also tracks values within each Enum block to ensure entries are
unique.

Acked-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/tools/gen-sysreg.awk | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
index f2a1732cb1f6..bbbb812603e8 100755
--- a/arch/arm64/tools/gen-sysreg.awk
+++ b/arch/arm64/tools/gen-sysreg.awk
@@ -122,6 +122,10 @@ $1 == "SysregFields" && block_current() == "Root" {
 	res1 = "UL(0)"
 	unkn = "UL(0)"
 
+	if (reg in defined_fields)
+		fatal("Duplicate SysregFields definition for " reg)
+	defined_fields[reg] = 1
+
 	next_bit = 63
 
 	next
@@ -162,6 +166,10 @@ $1 == "Sysreg" && block_current() == "Root" {
 	res1 = "UL(0)"
 	unkn = "UL(0)"
 
+	if (reg in defined_regs)
+		fatal("Duplicate Sysreg definition for " reg)
+	defined_regs[reg] = 1
+
 	define("REG_" reg, "S" op0 "_" op1 "_C" crn "_C" crm "_" op2)
 	define("SYS_" reg, "sys_reg(" op0 ", " op1 ", " crn ", " crm ", " op2 ")")
 
@@ -284,6 +292,8 @@ $1 == "SignedEnum" && (block_current() == "Sysreg" || block_current() == "Sysreg
 	define_field(reg, field, msb, lsb)
 	define_field_sign(reg, field, "true")
 
+	delete seen_enum_vals
+
 	next
 }
 
@@ -297,6 +307,8 @@ $1 == "UnsignedEnum" && (block_current() == "Sysreg" || block_current() == "Sysr
 	define_field(reg, field, msb, lsb)
 	define_field_sign(reg, field, "false")
 
+	delete seen_enum_vals
+
 	next
 }
 
@@ -309,6 +321,8 @@ $1 == "Enum" && (block_current() == "Sysreg" || block_current() == "SysregFields
 
 	define_field(reg, field, msb, lsb)
 
+	delete seen_enum_vals
+
 	next
 }
 
@@ -320,6 +334,8 @@ $1 == "EndEnum" && block_current() == "Enum" {
 	lsb = null
 	print ""
 
+	delete seen_enum_vals
+
 	block_pop()
 	next
 }
@@ -329,6 +345,10 @@ $1 == "EndEnum" && block_current() == "Enum" {
 	val = $1
 	name = $2
 
+	if (val in seen_enum_vals)
+		fatal("Duplicate Enum value " val " for " name)
+	seen_enum_vals[val] = 1
+
 	define(reg "_" field "_" name, "UL(" val ")")
 	next
 }
-- 
2.51.0.338.gd7d06c2dae-goog


