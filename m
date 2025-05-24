Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F92EC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 May 2025 05:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=enzMbJYQFdAK3zJGU0fX+4958E9SfYdaxnw49zMJcLw=; b=yK+GuAZn+fc43GI64zD+wfIUuA
	oKkNhmdYF8cCAiDVSGHVP8d+LF9XSUxMTAebxoLxABhlbVsBultkQ4/oEbHVNq6l4//U1pdJ01dWG
	8e9OOMgUZCYInNjsHtq52dAjSMxBq7kOPRJNhUC5YLbbnf13nio5RPVrPR1sADPn+LaN6K8+HZobt
	BIOd4YafxbWrhtatFDYBEslEm5dL6d67Ax8SoaZO2K3+wLI3/n0iaSznQajqNhzphYrt/2PJGDKMQ
	OlyhYYK6K9jkQdTDM1/BJe/e6i5L6Xgic9agcXUp3lzsEpRzJUXAOql9NRLL3vO2mwFw011JAWQ0w
	jV8SJtdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIhSs-00000005KGe-3qCG;
	Sat, 24 May 2025 05:30:34 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIhKH-00000005Jho-31EV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 May 2025 05:21:42 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ad1f6aa2f84so106734866b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 22:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748064100; x=1748668900; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=enzMbJYQFdAK3zJGU0fX+4958E9SfYdaxnw49zMJcLw=;
        b=NjJHwCMSz84xrn2DxgvlyulXHgZn3pvfJWuxTwMHxsZ7WYzte40SJvjmjS54kLh4iW
         UBC3VSpHt1WdIauXJzvaE9ckI5wKTb7d9glEtOfgTP7gsXiesm4R+B7xSt5/0ivFIfB6
         o6vZuCumMyP2j7mOX114M699uJblqI25nuPE/bzWxXb+6ARx05PvcuA70sveX6+AhIWK
         VfcE3x9vL/zCij3JBjL7qRt6SXSftRAKVGnqKbLyjpifFkulfLq87APOMR5C6cic6RH6
         kNAe2PStUp4cJYNQd/QXaXI30EnrQyUWZjslPOQE+nd2mdUgO3zRqrkDmyCpJEyakzNI
         ftKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748064100; x=1748668900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=enzMbJYQFdAK3zJGU0fX+4958E9SfYdaxnw49zMJcLw=;
        b=WoERdDJGFhpw4VHhXA9rDHTinPgzmsOtQ1mmlMyWDlvCNdnEfbrvs2ZqYLlP/A86Um
         ZMhMj4Wy96F89NQ4Aj+YbB7UHZ3uexvaL0B0vaXn85GFQS43NeyOne8ecm0SmzW/Ma4T
         tsiibobzv/AjCovc+flOBxk6eFLH95SOmjWyQxESmiCowxh0Gg6Tpb8/h0/Ad3OrCKGK
         LlswHBhhNNCyy3kEJ/PVwtwKSXFG2f+0U/d0Z4pAGjcVhMoblWnmdmAcJDO0KRQ1SsHR
         CgAg5phS0gSzKuc6lrh3wGH6OgZ/19qhV4IJ3UwoYKYsuYVbqkrSFBT/UIRdTOGjv9Vy
         9H8g==
X-Forwarded-Encrypted: i=1; AJvYcCXYY7bdUOfXoBEGod8vB2tOZp9dmrwyeLX61GodQw7xyxZYm2w53P3cEz1tEDbY2I71NAePBttgFaxcnKwVWxGj@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3RZL5vOBqeHazAOW7HUKNu0ZslbJW/L4ct/GwEonQzKLM4Ff/
	/uooTJjOX6fM6EobzWz9oGP+UyqfaJDlj+TsbPD23gXYiwPHUcn3n09Z4gghPBgUFjM=
X-Gm-Gg: ASbGncvkh3vHZjGUq1xxYPA1V58kYWnt1LdLEVvYURkfhL036qL+IIjwmq/rSb8RrbP
	0ALAR2kdWrMsfYYRq1XeODoiL1H3izx2vy8eGa2TXhmaDZOdOkhz+a5rDoJb6wBIWLINIp/cBMa
	i6r6zzSUUguqR294jCLHaWaexnasYCV4HEhRMlnxCIvUAjFZ/KppbW+5er8kCDR/G8CiV6dnedv
	K/t4zoXM/eVNWOPC7h7qJbz12jEwtcTuxJU22kqCnH3iy23i0CCtSSwu8hV2npyfau5fWcXOlzA
	vJ6lHMvK6rBPAubLRarJrhTuTwYlC86Qae648kGHFisBmyjzzs6wuskQnpb1AUvdNkuTsMF0XR1
	3qt3sIpJlX1Khqwa0G7QVbS/Rml6VJlnHW2I=
X-Google-Smtp-Source: AGHT+IHTF8pgma55Bi8QUeu7CaUoHTKr21qBvP+LgCFCuUXyRbc9PZ/eQ2lz09LALMtTfl3r4Nz/Yw==
X-Received: by 2002:a17:907:a088:b0:ad5:4737:f030 with SMTP id a640c23a62f3a-ad8596d8befmr167307266b.1.1748064100011;
        Fri, 23 May 2025 22:21:40 -0700 (PDT)
Received: from puffmais.c.googlers.com (68.57.204.35.bc.googleusercontent.com. [35.204.57.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad5572f6402sm1106778066b.178.2025.05.23.22.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 22:21:39 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sat, 24 May 2025 06:21:31 +0100
Subject: [PATCH v2 4/4] arm64: dts: exynos: gs101: add
 dm-verity-device-corrupted syscon-reboot-mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250524-b4-max77759-mfd-dts-v2-4-b479542eb97d@linaro.org>
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
X-CRM114-CacheID: sfid-20250523_222141_781324_923F2453 
X-CRM114-Status: UNSURE (   9.84  )
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

On gs101, the boot mode is stored both in a syscon register, and in
nvmem.

Add the dm-verity-device-corrupted reboot mode to the syscon-reboot-
based boot mode as well, as both (nvmem & syscon) modes should be in
sync.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 48c691fd0a3ae430b5d66b402610d23b72b144d7..88e491b2befc463789651a4cc7f3a658999ee808 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1426,6 +1426,7 @@ reboot-mode {
 				offset = <0x0810>; /* EXYNOS_PMU_SYSIP_DAT0 */
 				mode-bootloader = <0xfc>;
 				mode-charge = <0x0a>;
+				mode-dm-verity-device-corrupted = <0x50>;
 				mode-fastboot = <0xfa>;
 				mode-reboot-ab-update = <0x52>;
 				mode-recovery = <0xff>;

-- 
2.49.0.1151.ga128411c76-goog


