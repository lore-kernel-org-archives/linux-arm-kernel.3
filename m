Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC93C54E71
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 May 2025 07:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZmciNu0LzBJkCwAxE+xP2RniPnh6vstV6TXm+/dhXAk=; b=qfNaMPGIhBcnP9BcdHaBHvArdg
	5a5v0PxB+hL0YV1rTgxtcDhhVd+9gweDva5OGy8swRK5Hi8vy/SZIasNhpolFeuULUIpQRh3VDI9g
	Xv8gUW/idNz6xWTWn6c67kkG9sfzcv8HGS834UTGWdwx1yaeUWxDSLpba1VII6Rl7dm27W+W3A0C2
	cwDFT0sv9D74q4mjcPKf3thknADKQb4sU2RaPY3AqtY6YKus9SbGc0AEfc3M/VdEChc3rQ/pvy9MO
	NGiLEUzaO4kA1PoEAwTcqL9WSHbwS2AuLQvF145SBDOoD43+n8tYtW7tRuPKgrnIDz7XccDEHDeq6
	0KJDvZcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIjQM-00000005SBh-3cde;
	Sat, 24 May 2025 07:36:06 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIjLI-00000005R8y-38so
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 May 2025 07:30:54 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a3798794d3so531109f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 May 2025 00:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748071851; x=1748676651; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZmciNu0LzBJkCwAxE+xP2RniPnh6vstV6TXm+/dhXAk=;
        b=aP+Tu3vQrRtn/1I1OXgv23aDiqLC+vWg9j5xlbU2+bqZWR6rreZNiuHxSMh0wTeNdM
         Lm9TSg664KplnPKG16CBLwrSqTT556QeeOHs/fbU3NXsLpINpTOQj3ph/n1YxFu97/Bo
         RfEU2h29Jb63GfdlhASdhz3Lo3JfLcBbxqjEb4hrpZDhtlYs2Uuq90jq1DXmVjQPAuGV
         m70SNtMOUBJbdObz1SifSiyIC0UmARRBoD9aeDJ0nuaaxTRRD2QMqYBC8RUfSyu0Kuau
         JrOmUDYB3IACEuoSQfiX/xgZ8jrOL3rL3gB74X5tPVjGWAknsSkP/ICShcSut1LgoaNL
         2uQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748071851; x=1748676651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZmciNu0LzBJkCwAxE+xP2RniPnh6vstV6TXm+/dhXAk=;
        b=tYr8+Vln3xIyQEo5iu6VCVJtbeiu0h0Z6EFmc9cJGoTX9VJk77guwq3RIid+BuJu6Y
         +FmFEEhunfAHbJQsgmYDwTqed7JayDy7q8K6qAkapkxvUiA3oUD1PBj7rKaIhYF+NWZa
         GHmtBFDmLhBWYm0v5DGMAS9gmCpiQUAwkrDowVtHSjg+pE6ReIY1Vc8ZpFYFBx5eVD4A
         /jVZWE/YFnu9sNx4dA779Fgjl+KUNdJNLlhFlmTXeYGte82z8eTzRQaMeyBmlJb3mswn
         2DZWCrNnLYi7ipTumblUalivy3A/1F187vCH+xefeff/kCGre0YgYVjt/TW3GI3tBy3U
         WWsQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5D9uLepEggdiGjhMh8UzALLFgymh1VbpuhImv9w1izP2PYq0AjdzFNb46Hx8XLyDVuQDl9YlHMPtAK3r3yyqk@lists.infradead.org
X-Gm-Message-State: AOJu0YyG1xCJ8skLGm5Un0vFloTNAY+8Gp5PniWffA6Ch1Su9O7lnHGC
	w0nkzwtS0oSgbEgeGTT/spb3IuhnqSUu/pxfIB1u4JseHeP1u1TkmR+0VdWzgtRjQ6Y=
X-Gm-Gg: ASbGncsrmOl8v6ypuRrTks3RqYDG0hVPzv58N8iBvWZZxy0ke9/1OHJipg+7BYo148h
	IDSaCmRfr5skDjkP+eHFLpi/tUxhL61lgxSHtWABHuh//QBb2upCnRmOIOKqhGJmlNWkpYywOE6
	e9COLoj6trIvOZjPwrWJ8XF0X7fCsqSYyAWfs65ahX/tui7gthlwKcYz3W/yCitSCqsMYq9UFz/
	6wjVdsKXYWvUCAnx57b1E+BvoTwalrGw6ClcO9R7qjK20T4Yb9Qyr+k1WDhY3tOn/v4tdwFyQBa
	e4p13amIlp3Zl5+ZdLoUCNgtFG104zjCJG7JWU1l9FQnfoc/PerQuP0VsffcKuL97Fjs6GXDinL
	r+Z92CNs=
X-Google-Smtp-Source: AGHT+IG3Ci8gKkZTNURWKOCr4Gya8iUahrzHV+bC1Sl6TvVnxfZLPGWzu66llvg0ow/aQlaOFzwp3g==
X-Received: by 2002:a5d:5846:0:b0:3a4:bafb:adc0 with SMTP id ffacd0b85a97d-3a4cb47b7abmr1811022f8f.31.1748071851019;
        Sat, 24 May 2025 00:30:51 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([212.105.145.168])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a3ca066eb7sm10924273f8f.2.2025.05.24.00.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 00:30:50 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sat, 24 May 2025 08:30:29 +0100
Subject: [PATCH 1/2] arm64: dts: exynos: gs101: Add 'local-timer-stop' to
 cpuidle nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250524-gs101-cpuidle-v1-1-aea77a7842a6@linaro.org>
References: <20250524-gs101-cpuidle-v1-0-aea77a7842a6@linaro.org>
In-Reply-To: <20250524-gs101-cpuidle-v1-0-aea77a7842a6@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: William Mcvicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>, 
 Will Deacon <willdeacon@google.com>, 
 Youngmin Nam <youngmin.nam@samsung.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2028;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=YOBJe4JQl9jqFc/zsJIf4PxMvh4EMREF5cXBQbIBA7Y=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoMXWmsxp9Uy82tClf5s61NuoYnyaOBZdxLp10l
 q7TTH3NYf+JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaDF1pgAKCRDO6LjWAjRy
 unU1D/41OXg9QXtmWQJnnjdXLGulkJ+wCDBdcRAn/wUh2RWSgqGI02bMgMVihzdJcnJOfG03Lp+
 vd0CGC1CeypVlnLzTodx/ofUrU0SYY50EDhSOWuA6yDvWXgcDup2GhJ/MRvt/nhjIQneh+9GXOD
 rlp4sDeeR6pJ9pbI4hCOjzy1RWeFJMuxJR3kZGaGqQiDvvgzTssrQ8aJJTT89IpZoK+I8ooyeKt
 xD5Pe04SyIDpMLDsZu4x7Evzir+odIOOvKtRBYltVZ6BSfKWvKnj+bdsuleQ1aKZTooZP2uW2yd
 4qjuklYJkwWSXKFW6NrexhoCQ3m3TBNBDjaTdf/34gjH6WgafDWNcdkkqsX8kHEgmDnYhYK6nsB
 cT8AXkiRVkDeFd26OR99bnDq3i08Kb89ctFbCe2kXkvo2eJvkmGehf6cdbSN2LJdgjpZmGHuWcz
 l2ySFBhvJqaNA49ISF1qiuYfGVBxFqUdXcYNLAOnui5t4CbovkkDOfVsZqlSPIR/vFpNvRhBEhz
 45XNa1nnj+I1OK4L273LmA9tu0ckNz9X1pOZ2XLwzGCKywqoaCS7/IiLHosXLV55KaF4qw8VUQ1
 xUFN1BBPhlGZK0ubJgKgMV0EbOI6Wsu0aDfhxmuGKvsJHrXhT9Ov7+PeO15/9aECA/bZHxLKEHQ
 lEnnr4kQ1D4CV5g==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_003053_601639_33FB8463 
X-CRM114-Status: GOOD (  10.69  )
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

From: Will Deacon <willdeacon@google.com>

In preparation for switching to the architected timer as the primary
clockevents device, mark the cpuidle nodes with the 'local-timer-stop'
property to indicate that an alternative clockevents device must be
used for waking up from the "c2" idle state.

Signed-off-by: Will Deacon <willdeacon@google.com>
[Original commit from https://android.googlesource.com/kernel/gs/+/a896fd98638047989513d05556faebd28a62b27c]
Signed-off-by: Will McVicker <willmcvicker@google.com>
Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
Fixes: ea89fdf24fd9 ("arm64: dts: exynos: google: Add initial Google gs101 SoC support")
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 48c691fd0a3ae430b5d66b402610d23b72b144d7..94aa0ffb9a9760c58818c0417001fd187b048ea8 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -155,6 +155,7 @@ ananke_cpu_sleep: cpu-ananke-sleep {
 				idle-state-name = "c2";
 				compatible = "arm,idle-state";
 				arm,psci-suspend-param = <0x0010000>;
+				local-timer-stop;
 				entry-latency-us = <70>;
 				exit-latency-us = <160>;
 				min-residency-us = <2000>;
@@ -164,6 +165,7 @@ enyo_cpu_sleep: cpu-enyo-sleep {
 				idle-state-name = "c2";
 				compatible = "arm,idle-state";
 				arm,psci-suspend-param = <0x0010000>;
+				local-timer-stop;
 				entry-latency-us = <150>;
 				exit-latency-us = <190>;
 				min-residency-us = <2500>;
@@ -173,6 +175,7 @@ hera_cpu_sleep: cpu-hera-sleep {
 				idle-state-name = "c2";
 				compatible = "arm,idle-state";
 				arm,psci-suspend-param = <0x0010000>;
+				local-timer-stop;
 				entry-latency-us = <235>;
 				exit-latency-us = <220>;
 				min-residency-us = <3500>;

-- 
2.49.0.1151.ga128411c76-goog


