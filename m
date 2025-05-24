Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4541C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 May 2025 05:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Twazfz0joDHDf3E0VUXRkggat1KdGbQWxfqNgUu5Y8=; b=Mxt3brezagemMWNXYPceVnfBf5
	rYL79LCTiiYz2runoQcjgop/SZPpIAExW6cFgRPwagAfl3Tn+pWOItmfiC/73ew4pS1OONq1098Ad
	+AiuTML2CWzucJqEdGkngUKMhuwJ7Tqh7n3p/NzQNUXLReJPdqHpcqK0/UJuPJCxLiCkquMChohDN
	HMZYSaLRiydeXKe3HpRrUmDJtxWrpDboJd1SJHyRL4Bb8BjQrW8KUtVFFFFsSV4E/IZbpPLa0Xa90
	zGC74O+owrt75tMmAN6x+wutofPpxqGufskihSBktL7nqz4k9MJjAWkmtBnYxFrTpgGicQb50iMmt
	+KHJc2sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIhQj-00000005K9z-0a5Q;
	Sat, 24 May 2025 05:28:21 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIhKH-00000005JhP-0njm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 May 2025 05:21:42 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6020ff8d35dso1031679a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 22:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748064099; x=1748668899; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Twazfz0joDHDf3E0VUXRkggat1KdGbQWxfqNgUu5Y8=;
        b=VRV24UmWIdA6Xy4Q+UK/t8GWdOxnXcbsVlXHyXD0DyO/Z3ovY+niOEt2TABGzTMUMe
         8EfDB1sdQmZWfxMF1RrIblgCwUJFEFY/zEFdOQggdlXT00ZkgQvUmV2w12nnWT1NXIsJ
         YmEFJXuvbpCUSYADzmmT5YJFCOprDRC7C/QX8U7dTJKasTkg7yNRVGjBJacmcHONi85i
         jUCbE1Ap/7b6y6KKJV0E2//TRzlF65lYU/luh2q1g8YaleyGJHpu076UaQLJVSmFiRM5
         nJCX2Hs+ajMBUcP211zGx2YA4vJ2cPp8Oi8/EOKu2t11oXoMdsHsmFWAB3bfjMo9Es5S
         m8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748064099; x=1748668899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Twazfz0joDHDf3E0VUXRkggat1KdGbQWxfqNgUu5Y8=;
        b=deajHzAiagyBMsv0eVRA7VEEQa7AO2bithoL/Bus3Fm0qmuY6wv5fCQPI1xK48lTvw
         PAwMbyPG4nFngoOhpkqwQtN03A2TpKVkPpH1ZmTY1FcNzIx6586Svhen3eoRMdBnJa2t
         qn9mkKQYUuXTiYVqiG0hvrwwl1bZIADqgBkyuqUnP0rFPaoWuU+zZaZKUYUw3ySUSMl+
         qE+Coy7aHcG6rbGv6S5uqvTmYXnAUyn8ytIsJZYMHhSSGZW4k++dKTGsz+HFKGZ6X3iU
         YzTvmastuVoK09Iy74QSbLXSJIbeh4nSxeQ1Lvk030BV7mqi1I+uEHdOJ4Q2FprhQXfl
         HBOQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4ikUkdQI5cfRXSAcsT8FZD6IsTMJsSqA0m4xhYASjqnPnWMiu4eGJ5FRmenscxdxiCjy+SpVwvExOFLBJAS/f@lists.infradead.org
X-Gm-Message-State: AOJu0YyQAnntmjLcE39fJkmLzoDXK4yXdCGhxQ6WdiCkeUsrKwgOLPKA
	0UfoqYfV4hNFL5F88fRCngRwW31W58stck9sOpYtWywxOc/7FCt69W+Ako1/3fHnKtY=
X-Gm-Gg: ASbGnctZGjwDZkL2jZ2az9LaQ0PSaEqlGGFms+vLtDtP9n0L1XOq99D8be13ljF3L+s
	0ZmiotO7jRlDatKOrK7Ee4cnzqLX3EEAfhI0JYiuXBkOA/Q68ulnyhMhbM80sgJ/ln82rthhqff
	d41y/itagsShaPHYRZa0bHuV2OYvluB/TS8FFYRIW1D3JY9PUlP/X71pfo2dpuHKkJzu/+pnuJv
	4uedv598CgjKkI0d1aPFWq1Xgicerwf+tA68Ez12/IDjgCPfVKc6fcID5yrfgJfideEGEMfV+zO
	es1Um3A/uTeQPeOFm8zqY9MKK5tuQhbWPOL/Zw1q+Re3Xq7alCv0uVX9FJ4qD3y0ipFpa32JYYP
	TVj4eZ2/8ClYZZld+YxXQUrMMopGWRpYxCC4=
X-Google-Smtp-Source: AGHT+IHtMWk0Zf+q26yD0iAFN/AxSEy+PDpN0ChAhlrk8dppBVzxLu8QU9Jabhie5nFR/O8+Q1JeMA==
X-Received: by 2002:a17:907:96a0:b0:ad5:67f3:73ea with SMTP id a640c23a62f3a-ad64e84b500mr516495266b.21.1748064099584;
        Fri, 23 May 2025 22:21:39 -0700 (PDT)
Received: from puffmais.c.googlers.com (68.57.204.35.bc.googleusercontent.com. [35.204.57.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad5572f6402sm1106778066b.178.2025.05.23.22.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 22:21:39 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sat, 24 May 2025 06:21:30 +0100
Subject: [PATCH v2 3/4] arm64: dts: exynos: gs101-pixel-common: add
 nvmem-reboot-mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250524-b4-max77759-mfd-dts-v2-3-b479542eb97d@linaro.org>
References: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org>
In-Reply-To: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_222141_227828_0103A6BC 
X-CRM114-Status: GOOD (  10.52  )
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

Add the 'nvmem-reboot-mode' which is used to communicate a requested
boot mode to the boot loader.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
- add dm-verity-device-corrupted
- update commit message slightly
---
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi      | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index de5c8d236b705505c0745827c5c6b67d94ba6227..cd8e1b8a10b111190b984e104f749d04514d0449 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -60,6 +60,21 @@ button-power {
 		};
 	};
 
+	reboot-mode {
+		compatible = "nvmem-reboot-mode";
+		nvmem-cells = <&nvmem_reboot_mode>;
+		nvmem-cell-names = "reboot-mode";
+		mode-bootloader = <0x800000fc>;
+		mode-charge = <0x8000000a>;
+		mode-dm-verity-device-corrupted = <0x80000050>;
+		mode-fastboot = <0x800000fa>;
+		mode-reboot-ab-update = <0x80000052>;
+		mode-recovery = <0x800000ff>;
+		mode-rescue = <0x800000f9>;
+		mode-shutdown-thermal = <0x80000051>;
+		mode-shutdown-thermal-battery = <0x80000051>;
+	};
+
 	/* TODO: Remove this once PMIC is implemented  */
 	reg_placeholder: regulator-0 {
 		compatible = "regulator-fixed";
@@ -224,7 +239,7 @@ nvmem-layout {
 				#address-cells = <1>;
 				#size-cells = <1>;
 
-				reboot-mode@0 {
+				nvmem_reboot_mode: reboot-mode@0 {
 					reg = <0x0 0x4>;
 				};
 

-- 
2.49.0.1151.ga128411c76-goog


