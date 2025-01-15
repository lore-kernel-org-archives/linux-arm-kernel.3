Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BACC02185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 13:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KeZuvH3UGnQUtqtWabBejUBG0pdX8SFSDZ3OStfizlM=; b=bkQkMxrc7kFZx2dZtvC8k271Dj
	vlA4uzLUvazl6UZqLyHToy2rGkyzQ/yXANky0qdpBzduzwTTi7epDRidHeTrpBIZqv7CQHaws2xp6
	27bG23uvhAs/U24iKvsKQq6iZ5xV7p5vp6td7uqJNla6YByp9dLzIsAwF92VjC+tRZT21jaPNYjf4
	YFxNzEX8rbxsmOcpoezlZirqJgFDoEWIwELT9BKQRpYrwRHfMWwApLR16ofuh/u7+jTkfAcoB8wdf
	pZ8uv3hh5PGdgBv2QXDv1msKbXsDEZv9Cr4xWOcLiT5ELCMF8xh3g8lEVqB9wvVmBU61WtATDFeGT
	Qpujmr7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY3kn-0000000C2gS-2u4G;
	Wed, 15 Jan 2025 13:48:17 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY3g1-0000000C1Uu-1vfn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 13:43:22 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4361815b96cso47943995e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 05:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736948600; x=1737553400; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KeZuvH3UGnQUtqtWabBejUBG0pdX8SFSDZ3OStfizlM=;
        b=p5l/aA6tIoYCaZE8+Tjjjsj10QLvIxjD74hUKPCuCzi2jIbTjUQmjLw5jTlJSbIGbw
         2qXRW13dsgDlgP1ZKN+BwyzM37aoHYfRfV+P+x8U92rB6ibQ0OZp0Bf6a/VK3erxsPd/
         RCFWvTOaz41lg9WyTYghAXb7DJ79Mc02BBUWLPK3LSr+7QgYMOY5XpbhtCqwoYnX7UTV
         Terju4CHdDMeybSh+NNfRe6o5avAuFYUg7HFoUouhQurPAwY/F6Y/6yoGadPEltO8fZO
         0Q89Nw80Q/zNY40R2mBQvDhufqG9FuHRHAxEUHuySfbb3YIz5f3QcOq6vHeOItn92SXE
         +kFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736948600; x=1737553400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KeZuvH3UGnQUtqtWabBejUBG0pdX8SFSDZ3OStfizlM=;
        b=FywGUwgTsRHnsayhVKWPe46fXCnSJFS6+XaZyLoolUdqBSSTCanLh5pqRwuKioKiWk
         zpfvCCEZ6W7Uw32A4TOIlLfHBiLa+tiQ3/y7mHzeVvSeWRfPc5NDvH7Z4Sn8fD6tgtKU
         EoYUjnnS5IuURCZSSAXFH21nItlrrENdt8DoFetLbl39gR35nuFaFVjPRBVxRGcopDOQ
         JWhPgMXUuZ1xV8ErpzIa7QRwSw8kwMt1bjeqfICZETeK/7RQLaVbuFAvCUP87t4VUr8x
         SaoySxB12LGE38853E3jJPkFrIlrfp3OBs90dMD9ynfLn4OY5aZ8yz3CpQ0m2kx9PC2M
         fh5g==
X-Gm-Message-State: AOJu0YzgDF3M/hU3D7LcxFSZpOBcOFRkzdz9Z/DXxtOxNxfNJBdU+P14
	jIuvgTOzB+XTW+GdNmZzvm2gLObv0hnq3h0JIo8KUiCdTp54x9sI/sY6aTPIOv7lfvEr1FPMitj
	6
X-Gm-Gg: ASbGncutM4eG5B83wiuMJeyFf0gpwZWec2ef7uBjSP6JG+inRnrt4JSyMVfhLSR6AvP
	RCchqIP2u2o8LHkRLfTualjC8l7a7YqxHWADUx0OuGu5CgHhDLMILXLO+WptAxRKbxyHjunfqXO
	DTpspHemMVTp31PTSnqfpiDz3aJBtf2Z6/SLB3unEReNQUyI4ZLOhWkrumropFD6WhjTxVzDx63
	L/zj4dZJB2f3VQUs3qxTihJEPOPsqijOkQBWYQYHL0fWpts0amyBIM=
X-Google-Smtp-Source: AGHT+IF6/6miVqA8lxPXwEMJFgSltM5n1uymfk4FgX+ZbGSSTlwfp9RcgUI/CSyzjF1w9ekENozQyg==
X-Received: by 2002:a05:600c:1384:b0:436:1c04:aa8e with SMTP id 5b1f17b1804b1-436e26bdac1mr316746855e9.16.1736948599790;
        Wed, 15 Jan 2025 05:43:19 -0800 (PST)
Received: from pop-os.. ([145.224.90.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7499bbasm24853825e9.3.2025.01.15.05.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 05:43:19 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	robh@kernel.org,
	broonie@kernel.org,
	maz@kernel.org
Cc: James Clark <james.clark@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	James Morse <james.morse@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] arm64/sysreg: Enforce whole word for opening blocks
Date: Wed, 15 Jan 2025 13:42:55 +0000
Message-Id: <20250115134259.1864060-4-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250115134259.1864060-1-james.clark@linaro.org>
References: <20250115134259.1864060-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_054321_494882_8ABCE8D6 
X-CRM114-Status: GOOD (  11.79  )
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

Similarly to the previous change, opening blocks can also match on words
with common prefixes. Fix it by ensuring the whole word matches. This
doesn't do much more than catch trailing typos.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/tools/gen-sysreg.awk | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
index 7c7412adf90e..7f578216dc68 100755
--- a/arch/arm64/tools/gen-sysreg.awk
+++ b/arch/arm64/tools/gen-sysreg.awk
@@ -111,11 +111,10 @@ END {
 /^$/ { next }
 /^[\t ]*#/ { next }
 
-/^SysregFields/ && block_current() == "Root" {
+$1 == "SysregFields" && block_current() == "Root" {
 	block_push("SysregFields")
 
 	expect_fields(2)
-
 	reg = $2
 
 	res0 = "UL(0)"
@@ -145,7 +144,7 @@ END {
 	next
 }
 
-/^Sysreg/ && block_current() == "Root" {
+$1 == "Sysreg" && block_current() == "Root" {
 	block_push("Sysreg")
 
 	expect_fields(7)
@@ -206,7 +205,7 @@ END {
 
 # Currently this is effectivey a comment, in future we may want to emit
 # defines for the fields.
-(/^Fields/ || /^Mapping/) && block_current() == "Sysreg" {
+($1 == "Fields" || $1 == "Mapping") && block_current() == "Sysreg" {
 	expect_fields(2)
 
 	if (next_bit != 63)
@@ -224,7 +223,7 @@ END {
 }
 
 
-/^Res0/ && (block_current() == "Sysreg" || block_current() == "SysregFields") {
+$1 == "Res0" && (block_current() == "Sysreg" || block_current() == "SysregFields") {
 	expect_fields(2)
 	parse_bitdef(reg, "RES0", $2)
 	field = "RES0_" msb "_" lsb
@@ -234,7 +233,7 @@ END {
 	next
 }
 
-/^Res1/ && (block_current() == "Sysreg" || block_current() == "SysregFields") {
+$1 == "Res1" && (block_current() == "Sysreg" || block_current() == "SysregFields") {
 	expect_fields(2)
 	parse_bitdef(reg, "RES1", $2)
 	field = "RES1_" msb "_" lsb
@@ -244,7 +243,7 @@ END {
 	next
 }
 
-/^Unkn/ && (block_current() == "Sysreg" || block_current() == "SysregFields") {
+$1 == "Unkn" && (block_current() == "Sysreg" || block_current() == "SysregFields") {
 	expect_fields(2)
 	parse_bitdef(reg, "UNKN", $2)
 	field = "UNKN_" msb "_" lsb
@@ -254,7 +253,7 @@ END {
 	next
 }
 
-/^Field/ && (block_current() == "Sysreg" || block_current() == "SysregFields") {
+$1 == "Field" && (block_current() == "Sysreg" || block_current() == "SysregFields") {
 	expect_fields(3)
 	field = $3
 	parse_bitdef(reg, field, $2)
@@ -265,14 +264,14 @@ END {
 	next
 }
 
-/^Raz/ && (block_current() == "Sysreg" || block_current() == "SysregFields") {
+$1 == "Raz" && (block_current() == "Sysreg" || block_current() == "SysregFields") {
 	expect_fields(2)
 	parse_bitdef(reg, field, $2)
 
 	next
 }
 
-/^SignedEnum/ && (block_current() == "Sysreg" || block_current() == "SysregFields") {
+$1 == "SignedEnum" && (block_current() == "Sysreg" || block_current() == "SysregFields") {
 	block_push("Enum")
 
 	expect_fields(3)
@@ -285,7 +284,7 @@ END {
 	next
 }
 
-/^UnsignedEnum/ && (block_current() == "Sysreg" || block_current() == "SysregFields") {
+$1 == "UnsignedEnum" && (block_current() == "Sysreg" || block_current() == "SysregFields") {
 	block_push("Enum")
 
 	expect_fields(3)
@@ -298,7 +297,7 @@ END {
 	next
 }
 
-/^Enum/ && (block_current() == "Sysreg" || block_current() == "SysregFields") {
+$1 == "Enum" && (block_current() == "Sysreg" || block_current() == "SysregFields") {
 	block_push("Enum")
 
 	expect_fields(3)
-- 
2.34.1


