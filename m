Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B43CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 17:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1HvYCNLV5CI0boyLI+MOBTwgyqBxpYEqfcX5SoAEoA=; b=pu9rPYgwi8cQQJzUTi6RBGx89l
	bzODejCOSKkRkaUXrOaILGsGiMNWLcaLXbdSn28cBY+dYwWeNem35pfsSN8GSyJSD8QuQFp4fcbCn
	CaDMz5Q3BKAEzHleZXNngECUGbIjEr/S00s++35hjcZaMAhEwLuRIeOwKAFWxNvp5CndW+qEmWCjQ
	CXHnde98GIZP5145LujoaA+iH5/kSnugbUPtk7qg9pW3f8OL3s9f0G0Azp7UaAy0GgBV6MK5i1Ho1
	XcL/P7D+ZPbk/xgYAH0NahDwHfiNV4+gkthDP2zeKEo1eyv63MXH2OUw6BLRJHlD2BQS1Tf/81CmK
	TqvtWCeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCLwb-0000000A9U7-2g3d;
	Fri, 24 Oct 2025 17:51:17 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCLwR-0000000A9Q2-2BpZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 17:51:09 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-427060bc0f5so1323508f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 10:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761328266; x=1761933066; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S1HvYCNLV5CI0boyLI+MOBTwgyqBxpYEqfcX5SoAEoA=;
        b=EX91mNQAe/h3hdcReTiB3WwLZgt+bQUKiZ3+k5BG2AzaZcUNT2dOOjHGGQ1xB7NnXr
         15CuyLQ3ymQO1JoUUr1m1pBCauOhZ5Z2vzi5qKtl28yp1jykUMaxHWUnAr2zNHKYmIkE
         HTO9aK5pxOV3au3cfFlxeUZhDlLw5cnl+5QHVrlCT+65py3X/CfthlenkL0TDgWaowU3
         DzpGXHK6q4odit6QEWFUHqUQSruCZC9WhQ9cPG+90/3nCA5nzUpxpORd9p+2gBD+hYLz
         cULMLeNdKKETDjAmQGINdPi2DXEMR2k4DcDjYNQ3NFSfGTQqVKrxd1EGdwEcC8mrOvct
         uMrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761328266; x=1761933066;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S1HvYCNLV5CI0boyLI+MOBTwgyqBxpYEqfcX5SoAEoA=;
        b=F4a3hSCwHuNC3z3/7OsYD1mAWQ/D7FB59pTI4+IHEQ4mY5DZzvPK3o/KpAHVMTIM6m
         DumXyABrcEYL5GSxivYfrx/o2Q+6NFpWhq+JZy7TCW/Ov7P2Jg4E5RtyTAICZmS06+0U
         HwDjvncyPBW7qtGnmzvFrKntHuomDjp/1ggHq8Q+6IPmozXHcmA+qTeeQrh6SVotaFfK
         uTdsWchRXwa6XfvwOl0qtTur5jTCwtWufMKca/lLAH/TVoKgTa/wraBaNlW0v+iff7Cs
         vC4aHsV5768AdPlqDJWap0MWqjfH69DiyPdKHq9guRONhwBht22eJk3pgnf6ij3AG22l
         vxQg==
X-Forwarded-Encrypted: i=1; AJvYcCV2jpTIjWZnVutH2RQLYen/YWfs99OKFQV7x6sNMvh623AYSrgQDYsouJ5LkUMaDvD2n5+aGiNapPLV9R+dp+Eb@lists.infradead.org
X-Gm-Message-State: AOJu0YwEGWWuhtzI6T0E/C3mcUeWA9lmC4GoSAdL4q1ys24JSTKmRVxk
	1SiWnfGTqRsEW23kVRjALWn5FZrVLbrJz/p7euYyrTyZsqvm35d/TNLUYuYRBIVaP7Y=
X-Gm-Gg: ASbGncvG/TFMVZxjeRcGryPl5RVzKkRNZGep66YAdZBhBIVUNTKakvMbWL9kYw6MZfa
	+ZsHkiy6A0fGJHmc5deRTk500YzeSEOrdy2+qCiPFRrh/lOKURo71+gae1URp96KiS1y8MikGvh
	MCfwW7CEwIquvrGlDaB2TJ2bGbzMl5eiM+3QUInX1YPpwXaZeEy/gj0RDl026d0dk+qi4uNTgi1
	HOEoz/skc+2BgT9TITJKyoordy3q0GupafDRmBUUlxoZ4sMgJbE/SXVP/YvKWErZHy17tzqbUEe
	wZ1JX8jkP28I3wRX41a3oRC15kxc5gcaF7bOn3IPJ/N11Kx6uDGMY0ID4VfQY7sRClohk+aFJ19
	9H/7Bd0h7eTy85D4PrbFuziDZLM58Ggrp4V33NunHY/XU52t8zPFqZ5kauuNtdJ5mb4PL7hKx9r
	7HYAuJaCDk+ocI0Ux+F2pTT8PsL7coSje6LFrjlZ9t+5sMWAOmlPvRdNRItbL/ENU=
X-Google-Smtp-Source: AGHT+IG+eLRf8YPCXCIvX1Icim3foq9BCM0qVymaKl3/VkViHXuuqGJB+jB3dPU4X7R8xwku0ueZeA==
X-Received: by 2002:a05:6000:2f85:b0:428:3bf5:b3b8 with SMTP id ffacd0b85a97d-429907467e1mr3127739f8f.44.1761328265663;
        Fri, 24 Oct 2025 10:51:05 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429897e7622sm10321900f8f.8.2025.10.24.10.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 10:51:05 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 24 Oct 2025 17:51:01 +0000
Subject: [PATCH v2 2/2] arm64: dts: exynos: gs101: add TRNG node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-gs101-trng-v2-2-c2bb81322da4@linaro.org>
References: <20251024-gs101-trng-v2-0-c2bb81322da4@linaro.org>
In-Reply-To: <20251024-gs101-trng-v2-0-c2bb81322da4@linaro.org>
To: =?utf-8?q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>, 
 Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 linux-samsung-soc@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761328263; l=1126;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=raBiU2TNdnYW5GXBQGKlY34qsI95KKrr7UkG+dolrPs=;
 b=e1UEZMWe5ikZ+mjOHJ6zxj4LdozzJBMXJBQkXRXZTR6davdh/DgSzg4n+2rpnv8ebPSQH3L5u
 GH+sVbHAu/sBN1oTyQY44OWkPjPvlcgeWGZUXH/mWGz27nhPuprVPia
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_105107_578686_31224D27 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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

Define the TRNG node. GS101 TRNG works well with the current
Exynos850 TRNG support. Specify the Google specific compatible
in front of the Exynos one.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index d06d1d05f36408137a8acd98e43d48ea7d4f4292..380f7e70910ab8bcc28690782532fff87ca7e30b 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -630,6 +630,15 @@ watchdog_cl1: watchdog@10070000 {
 			status = "disabled";
 		};
 
+		trng: rng@10141400 {
+			compatible = "google,gs101-trng",
+				     "samsung,exynos850-trng";
+			reg = <0x10141400 0x100>;
+			clocks = <&cmu_misc CLK_GOUT_MISC_SSS_I_ACLK>,
+				 <&cmu_misc CLK_GOUT_MISC_SSS_I_PCLK>;
+			clock-names = "secss", "pclk";
+		};
+
 		gic: interrupt-controller@10400000 {
 			compatible = "arm,gic-v3";
 			#address-cells = <0>;

-- 
2.51.1.851.g4ebd6896fd-goog


