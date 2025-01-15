Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED370C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 16:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zjd4L+skRjDfREyt5/l20Z/nbYutI6PIQ0sn5+CJWLE=; b=vYKd7DxgQEN0yx7mCvRAeZsCh/
	BxW8Tkz3c+09BRd67qeR6+L1kUg0HVacBHsVhYbsdeUokkAsJ84ZffFKjsq9RxDcisgY8f9O5ABgq
	ZL2Vn0Bmf9d0mc+i6NHF4hyp8fWMn5W+2sPVttdjE5hkWgFJ1SzEoPIsx+1HHsSPb6vKdzo9aX1LF
	QsyGXiBePFnKBQbvjkX3e4Fi5vrttYWkHevhyFOnPGwjGf1iUisJPnYeKCsALiB7RTgMbcszqXTWQ
	iXh0/T5tuLEKbYafk+QQaQix7LRUcqbwWCRcCu2cg3W7ncV/FwtGydMcEbL4WxffrJAfQRJBIYwMe
	xFlRUNJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY6JR-0000000CSQP-1WDB;
	Wed, 15 Jan 2025 16:32:13 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY6Fj-0000000CRcv-3ve5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 16:28:25 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-436202dd730so49901855e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 08:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736958502; x=1737563302; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zjd4L+skRjDfREyt5/l20Z/nbYutI6PIQ0sn5+CJWLE=;
        b=nF0uEUEZDJGyPe4Dm6Ijmr5Yq2Ix/ThNCwSS19SfGoNy0w89ylkCEDd0cM4VFy1bE1
         WOFSeD0NuCH1+DmfUh4SgrBJ2K+Rg8texNOG5GZ0ambR0zQcgC5X7JGp21e4ZjitaXVd
         aTzeqXGs1xJxaJ5TKO8Jpd4G/inmHxJb/hFxXzIMRDLlVcvrC5pWW86FN1uMcCmz/ojO
         njE2GClYllvGdf9hbkpoAeWGTGdHAokNVgiB0hviRw53ZPmsrnvE8Q7bwMMizU4IwUGz
         Ysnmu8vbQeE+gvHf1woUIb5tbosxCejnTfSKX7+jmpbMpyINswQAVYjUhixqrg8+PEo7
         HTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736958502; x=1737563302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zjd4L+skRjDfREyt5/l20Z/nbYutI6PIQ0sn5+CJWLE=;
        b=xPYYQ2rbxqp0X0ZxzFH0rzUdht4f5zevSRUnzU1X52t+qg//ccrIxy6MWVppK67+18
         oOYBv4vVTPwVxq3+XK6u9etE/B+gzQpNa/MYWJGqFcMMupiaanUdL0N1KSRUkpzqcLjd
         J8+TMcy3WJ4+eFoKCJ3Tofe+O5iUAj61xvujtB8eMRFaOKUl3/MjE/dBM1yliguUJZnb
         pemWcAtw4tX71lLmwTODCxx9Xjb3apBDRXEEEO0JhHwwJFB8HtDxhWENefchTEsdbyNl
         wYyx5BGrBI+WGdWZVsz+I9zZeXb3mV3Eskr+M1kmRdiCw/P2u6P9IJozml0RgK6fWQif
         Ffcg==
X-Gm-Message-State: AOJu0YwOvGiz6CzlkrXHmJvjvUiYQhik0QjedERq7EvhdxUbGn1cGq6s
	S4I43deGsVrqdIk3ss+KN8KWugZPtrzxCalobPUEqp2TwnPATR/C9LhSZe+Euc3Ksbgf93Og30A
	1
X-Gm-Gg: ASbGnctYl4McMPGRm2ivJz1Wa2WnccOvMybnCeXxZOW/Idtl6AsMIvSKhdWvDFDsVhL
	7mf3R/+EtHbaShPP+c47EUzTHnuh/6k3L5aidcOyLnL8mRksrMEpZ5D2AAAckqOgQJsxhRw/WK7
	wIKtxwJ5vwCkvHWRJcSn4GPPuhCc3kOLQ7eklmNZtu3G0CAuHqGMn8Xj1jA7a9ullQbb9/Ob73E
	OpejHTtFg0Rz900AXoehDkvPPa81SC1Civrjmqws4aaRxA+U6kC3Ss=
X-Google-Smtp-Source: AGHT+IFVNgnOJAPAG8manRzHjKDMqVJZ+LeOnlwimnKFOP7HxazUcQ5ElmsH3VOpcllswC4C2+OiCA==
X-Received: by 2002:a05:600c:3485:b0:436:fbe0:cebe with SMTP id 5b1f17b1804b1-436fbe0d10cmr129899845e9.30.1736958502328;
        Wed, 15 Jan 2025 08:28:22 -0800 (PST)
Received: from pop-os.. ([145.224.90.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74ac61csm28620115e9.14.2025.01.15.08.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 08:28:22 -0800 (PST)
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
Subject: [PATCH v2 2/4] arm64/sysreg: Enforce whole word match for open/close tokens
Date: Wed, 15 Jan 2025 16:25:56 +0000
Message-Id: <20250115162600.2153226-3-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250115162600.2153226-1-james.clark@linaro.org>
References: <20250115162600.2153226-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_082823_973609_76B7A9A8 
X-CRM114-Status: GOOD (  12.58  )
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

Opening and closing tokens can also match on words with common prefixes
like "Endsysreg" vs "EndsysregFields". This could potentially make the
script go wrong in weird ways so make it fall through to the fatal
unhandled statement catcher if it doesn't fully match the current
block.

Closing ones also get expect_fields(1) to ensure nothing other than
whitespace follows.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/tools/gen-sysreg.awk | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
index 1a2afc9fdd42..f2a1732cb1f6 100755
--- a/arch/arm64/tools/gen-sysreg.awk
+++ b/arch/arm64/tools/gen-sysreg.awk
@@ -111,7 +111,7 @@ END {
 /^$/ { next }
 /^[\t ]*#/ { next }
 
-/^SysregFields/ && block_current() == "Root" {
+$1 == "SysregFields" && block_current() == "Root" {
 	block_push("SysregFields")
 
 	expect_fields(2)
@@ -127,7 +127,8 @@ END {
 	next
 }
 
-/^EndSysregFields/ && block_current() == "SysregFields" {
+$1 == "EndSysregFields" && block_current() == "SysregFields" {
+	expect_fields(1)
 	if (next_bit > 0)
 		fatal("Unspecified bits in " reg)
 
@@ -145,7 +146,7 @@ END {
 	next
 }
 
-/^Sysreg/ && block_current() == "Root" {
+$1 == "Sysreg" && block_current() == "Root" {
 	block_push("Sysreg")
 
 	expect_fields(7)
@@ -177,7 +178,8 @@ END {
 	next
 }
 
-/^EndSysreg/ && block_current() == "Sysreg" {
+$1 == "EndSysreg" && block_current() == "Sysreg" {
+	expect_fields(1)
 	if (next_bit > 0)
 		fatal("Unspecified bits in " reg)
 
@@ -206,7 +208,7 @@ END {
 
 # Currently this is effectivey a comment, in future we may want to emit
 # defines for the fields.
-(/^Fields/ || /^Mapping/) && block_current() == "Sysreg" {
+($1 == "Fields" || $1 == "Mapping") && block_current() == "Sysreg" {
 	expect_fields(2)
 
 	if (next_bit != 63)
@@ -224,7 +226,7 @@ END {
 }
 
 
-/^Res0/ && (block_current() == "Sysreg" || block_current() == "SysregFields") {
+$1 == "Res0" && (block_current() == "Sysreg" || block_current() == "SysregFields") {
 	expect_fields(2)
 	parse_bitdef(reg, "RES0", $2)
 	field = "RES0_" msb "_" lsb
@@ -234,7 +236,7 @@ END {
 	next
 }
 
-/^Res1/ && (block_current() == "Sysreg" || block_current() == "SysregFields") {
+$1 == "Res1" && (block_current() == "Sysreg" || block_current() == "SysregFields") {
 	expect_fields(2)
 	parse_bitdef(reg, "RES1", $2)
 	field = "RES1_" msb "_" lsb
@@ -244,7 +246,7 @@ END {
 	next
 }
 
-/^Unkn/ && (block_current() == "Sysreg" || block_current() == "SysregFields") {
+$1 == "Unkn" && (block_current() == "Sysreg" || block_current() == "SysregFields") {
 	expect_fields(2)
 	parse_bitdef(reg, "UNKN", $2)
 	field = "UNKN_" msb "_" lsb
@@ -254,7 +256,7 @@ END {
 	next
 }
 
-/^Field/ && (block_current() == "Sysreg" || block_current() == "SysregFields") {
+$1 == "Field" && (block_current() == "Sysreg" || block_current() == "SysregFields") {
 	expect_fields(3)
 	field = $3
 	parse_bitdef(reg, field, $2)
@@ -265,14 +267,14 @@ END {
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
@@ -285,7 +287,7 @@ END {
 	next
 }
 
-/^UnsignedEnum/ && (block_current() == "Sysreg" || block_current() == "SysregFields") {
+$1 == "UnsignedEnum" && (block_current() == "Sysreg" || block_current() == "SysregFields") {
 	block_push("Enum")
 
 	expect_fields(3)
@@ -298,7 +300,7 @@ END {
 	next
 }
 
-/^Enum/ && (block_current() == "Sysreg" || block_current() == "SysregFields") {
+$1 == "Enum" && (block_current() == "Sysreg" || block_current() == "SysregFields") {
 	block_push("Enum")
 
 	expect_fields(3)
@@ -310,7 +312,8 @@ END {
 	next
 }
 
-/^EndEnum/ && block_current() == "Enum" {
+$1 == "EndEnum" && block_current() == "Enum" {
+	expect_fields(1)
 
 	field = null
 	msb = null
-- 
2.34.1


