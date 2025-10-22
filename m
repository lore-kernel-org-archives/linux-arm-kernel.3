Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97590CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 11:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SUARhHfbTngybzaWH5xMNt4+HQhGBHN+eDo+AihXMvI=; b=Jkoth+WnglLPfoiUEFH4qt8M1u
	fHB23jQhSQD2AEXMEl4Ak1Zfs6iHRZvLx8j1hS8kneDg+rlrkxmcQ0tQVjX031pmdkc64PCS2ew9b
	zgzdThVDxZSuOqs8uNcAPKYXQNzu84ekJcg31epM55Gb4H6qok/lamnweWVuW2a+MQX0nxjzg96tg
	1uZ8fOYg1BU8Z+uk7e+OSDJdfEt3gcUZDrW71XLxygTZzIAJoEUkrS8Q5S+UMOF4qm/ILjAFtEjhr
	iSfK5+S5Etqj5qs1wcvMlTc9zPdakXo+BIzknhdkjlQyZxMpGPVgHkbn931un7qksYAZS16pzo/3r
	8JkYiyoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBWsh-00000002cu6-20i8;
	Wed, 22 Oct 2025 11:19:51 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBWsX-00000002cpy-45TX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 11:19:46 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3ee64bc6b90so4346070f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 04:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761131980; x=1761736780; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SUARhHfbTngybzaWH5xMNt4+HQhGBHN+eDo+AihXMvI=;
        b=L5oTDQ2yCqh3yXj5/jdObdCvG8RcxgAMWDHAmm4l0/GLaqEJ43btEpEurXCY9pmlNg
         HJBGrMlylM39bgEyocd1vpsqJFWE0/AEbTXYZipVvpcmDkcSk9YqtWCDaAzfkaEXIPax
         VJFll5yD2K+EN98XYxJv4/c/s59PVEQ+5m5iimlGg+cyqppWzqb1XBSjGLOSR+ZtScUv
         MYh31tiVXMIKhe1v0/w8YgcyDqClFNYz1BPt3BhFQT+kjbGPBcP8IMKIEwHbjW4i//BD
         2Y4uV59rlTkmPqYekQVDG+IUHceFfaVdf1pmxcLa9TuzTIsnbAy9piop8VvG89GWJokj
         8ToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761131980; x=1761736780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SUARhHfbTngybzaWH5xMNt4+HQhGBHN+eDo+AihXMvI=;
        b=CyfSodsrcUTDDy9P+MW+FNvios/csa7wNBOADTuHgaEjeC0aq8zskAWhLLUAyvNAot
         7KV5Fmg0DoXH0v0XkMY9vdJbuzJ0vHt1YY7iehJzMGk/DD8A/LLl2J2bzmybSwaULXBB
         aXYSrybwe//Fv+bcwKZs2B5CNFCP47cST3PiPvr0joq+uOPYmi59/52S1hSFANblMsph
         yfU47CWW5lwSFeSpf9oxnmgo8aGYT31XjMBNQ8P0eJWdcdIYV5v/lo6SzpBt35t46f/r
         EWR2fR3B7U4yRI+BJNQlWBdeN0PRf3RIQX5z3zA2E+s7Wol/Ip98r+CElKDz/JLpjfpF
         /qRw==
X-Forwarded-Encrypted: i=1; AJvYcCX8Zu+2J3ALQKrFRZk2QFR9pEoVz6hQDEwfjXJKQ6FGhViLkdyLk4btY4HfGzgRnk5S2F/jkfgu7flyFY438Hg2@lists.infradead.org
X-Gm-Message-State: AOJu0YyX+dx4SPSMuP25Zlm/Zb5v40lzrPpOwM8H60AnG0NbhHx+a33H
	+BTnr8S5PXpYF9yTC3DGIwmUL8epG6Y983oYivH98r8GKAw0tuCTIU1NH5CeQ7pSiAM=
X-Gm-Gg: ASbGncs12WimOIV3NG1xGxuEtud+OFqtzDzY7XuRso7S7C83dLBSoUI8wLynjxGbKrN
	tnPZLLQN/eSf1KpkYzswh0e6B9emclzfQVGLZVl4aUVOnHrIqwUWYCc3kyRY6Sbs6lj0P+6MyaP
	UeFmri2DYe2sDRx799oVouW0vqQRwYCZ/v4iOkMwdfTXcxZ3BNUw1PCPF878TQTkEPPRGWTXEu1
	mWqXB3rO5rDNvVKOosXnrDpeagQSI7TFkFnrS55FFXCNlaWSIESOJwNScEI0iRiRwRWnFOyEVJc
	vCXQP2qmFFlrCWl2+jeECYO9IyRUDevKwIqpJqLOWS/U3+dTM3UMF5fKcuCTQiGVQJIfOGKm/oO
	Nu0c72rtl3J8+1TOpEVbADqddCtqUwliE3+UAmlwEuSxok9LnI351LbMouHTpg0aTWrKMTkLGtI
	kOhu0ORJQ0PEgCPN9CIvr+AHR9j7nw6Si2JSUH6le690hOUaPnBk6LbR6N1z8zqmw=
X-Google-Smtp-Source: AGHT+IGVU7PNSg91ufp9cPjVd4Gpkg96hHzSv4SIyKY7C0GpIrtxcWnGzFIXHyAzs+v1iGiF52UTjw==
X-Received: by 2002:a5d:59af:0:b0:427:60d:c4fb with SMTP id ffacd0b85a97d-427060dc744mr14141519f8f.60.1761131980105;
        Wed, 22 Oct 2025 04:19:40 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a78csm24820692f8f.26.2025.10.22.04.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 04:19:39 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 22 Oct 2025 11:19:36 +0000
Subject: [PATCH 2/2] arm64: dts: exynos: gs101: add TRNG node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-gs101-trng-v1-2-8817e2d7a6fc@linaro.org>
References: <20251022-gs101-trng-v1-0-8817e2d7a6fc@linaro.org>
In-Reply-To: <20251022-gs101-trng-v1-0-8817e2d7a6fc@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761131977; l=1126;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=1mrG/yol1/JtpGKNAwtm5R1RG+GDRE/X9WA1wtY9TFw=;
 b=N48x9p6uzGpyNoZtQ8hAMytjHe8+vJa5kkVV3y1m06z+AB9vHk0dNsc9uu/baMA5o2430cy1j
 F397zeVUFBlCxW6+4mUwrPVIDH0nAoJpuD4Xo1txP/TALKLTxBnAyBu
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_041942_217440_C39247B9 
X-CRM114-Status: GOOD (  10.79  )
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
2.51.0.915.g61a8936c21-goog


