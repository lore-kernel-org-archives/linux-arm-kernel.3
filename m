Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7043CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 18:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2sp3aPSAtyo6I6rR6nNXHOeKvBEwtpMGHhEmiY/HzQI=; b=RNNR8JvJuQs9nbbb/B5A0wOjoo
	/sgLL9K71bduQQX+gI7+kmdMp4mdvDk10SsLB2L/Y41EVbUogUsHElp3cXmeS3SYGN53EoQ1F/MUH
	1zxj7nA9qpUmO4O80L+ZM0rDppDb4tJtCCQflipz+WkOxDlhXuKRXhABKhzyP3wSqlKyX6FAN66Uc
	UpaWPePwOMvPMNqnMLTfbBJXxZ2JdV6ckSGBSPB6CSnf5Ypvb2gNHIplTz8zyaYwQx3Md17TS6Gmf
	iKNqskJCymSHbZfH5Am2cCrMjdqspzHD/oIemaIkaLODtQfbyseq7AWdGxRCWC3IM+IesyCoPepIv
	4zaGGwHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umFrB-0000000EeWA-38Uu;
	Wed, 13 Aug 2025 18:05:49 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umEbA-0000000ESkm-0vCi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 16:45:13 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-459dfbece11so35313765e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 09:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755103510; x=1755708310; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2sp3aPSAtyo6I6rR6nNXHOeKvBEwtpMGHhEmiY/HzQI=;
        b=f/WutEbAx+rF5S0th3VPwFva/nXXhT1n8zyZ+f4Aya5nMOLcrAO2cbE/aPBna2LEmM
         CEa8iIkXWAS8wxK+yqg5TXaDSjlF4azhfQGHKoCX+OEY8Su34Y34McpSz28wRly3At9Y
         CUbgUwa6xMgEbGhdAPX9LrE1bEpBGWNvGE+xChQ/bCpt7NmHI/AKCfYqtlU9h/yf9ZQD
         KyRsKyEVrSHLUgxK5MyHFwPxhu0+B64hKHngbZBXuT+5NLVGvTeb/cErYDgQWeU36gyc
         tDKXYVpqwgodNSRKqN8QehKfen7TnJOFHF4XCApbUPsU4LNOoD2kpDu3kKu98Yh1jcJ0
         TStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755103510; x=1755708310;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2sp3aPSAtyo6I6rR6nNXHOeKvBEwtpMGHhEmiY/HzQI=;
        b=MKNlhfUlCIkMaPSD0Yc7CyTKpYYZmulm6ODtyfnNrty9PADYgt6MOh9iaCgQzKbBuM
         5CZLDWE35b7T2w0JEay0z4GDUK/vBkNH1vLTfweL5d8V0Zc9nau6xhtkHr2lbOI1FOks
         FVCDyM/RFoiWSmQOoqtIvHb4VkqbICrGpYYscXozN062OluBLkvnoVb5G3gWt+I5vU69
         mZIaxOJfQkDXL42/M9g18GyXjExfls45WxRfaYfN8wnh+a0P5Ct2izpKZpgcqhp4rjZy
         uWGhONfZbrTTnOciVd9pt2QY5LLQfTi6qQVVq5zczV23SquZzMR585Dyr3VmGtRLCec4
         wsVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUti8PTU8lTOHcB0IeGkWKeEQ3tsRctNAvn4E1H38oSod1sbsp35VCij2MllOcyEsUnMqcvSyFjwui2B7eW/yVI@lists.infradead.org
X-Gm-Message-State: AOJu0YxGOxz1fH8BYNDnu8JL1beqDAfJDvQhfIP1eUe7XqogcsX/I4g+
	aOfY+WkWzsedQ7FbcwKm2ivZOc5/Yg/0MUItzd3hUB1b5QPUWXKmJr95I6gKYqeTyFdP5AUaZvj
	dow==
X-Google-Smtp-Source: AGHT+IHSkTxAvev72EiizIpa601N7yiEbIYtlzv/L++w8V6rBQLkl95wQlGjod9UkIaNfBEXvNzWjE/1PQ==
X-Received: from wmby11-n2.prod.google.com ([2002:a05:600c:c04b:20b0:458:6799:d779])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b23:b0:456:eab:6344
 with SMTP id 5b1f17b1804b1-45a165c4f74mr36679425e9.15.1755103509761; Wed, 13
 Aug 2025 09:45:09 -0700 (PDT)
Date: Wed, 13 Aug 2025 17:45:06 +0100
In-Reply-To: <20250813164506.1203851-1-tabba@google.com>
Mime-Version: 1.0
References: <20250813164506.1203851-1-tabba@google.com>
X-Mailer: git-send-email 2.51.0.rc0.215.g125493bb4a-goog
Message-ID: <20250813164506.1203851-3-tabba@google.com>
Subject: [PATCH v2 2/2] arm64: sysreg: Add validation checks to sysreg header
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
X-CRM114-CacheID: sfid-20250813_094512_258546_B05AF026 
X-CRM114-Status: GOOD (  11.09  )
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
causing its macros to be emitted twice. Or an Enum can contain duplicate
values for different items, which is architecturally incorrect.

Add checks to catch these errors at build time. The script now tracks
all seen Sysreg and SysregFields definitions and checks for duplicates.
It also tracks values within each Enum block to ensure entries are
unique.

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
2.51.0.rc0.215.g125493bb4a-goog


