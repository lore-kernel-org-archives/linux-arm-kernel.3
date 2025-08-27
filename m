Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B08CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 15:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u/mZvV9kb0orEkNWMjrJAyvdt/44HABaPUU1+rYsimU=; b=gtBbPLaBvWZrZqWKP0rExe1ka/
	EsvHXa/HTr8hYpIel3IJmtaE7vikWJBKsLUsVDsBS4L6YNq7MLvZ6wdzUVjjq1+MsJPV6u35Xx+F3
	c6Fcs0INU8vnr5548ZxlYRYxFS+hDxwIco4Aejc+9hT4WT0ywoauW75CiqyHQdOC4MCeGONIgIU3s
	Hhpifqc/+wofJ/3pYN+e8v1nZHv8U+O6Y44yKbDhMTnXdqJKwV5CRP4yVtZ4nbgRGxbxl9PmdMptf
	fGG3Q2YL3b5iJ59AY47Li+I+2sBz9bpTAHjATaRsI2yX15IL7ZBkxKmQjuDeOUAyitX6W6AxCQVlZ
	wPN7TCyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIRc-0000000G1yV-27xz;
	Wed, 27 Aug 2025 15:52:16 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urFTp-0000000FSJC-1XzL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 12:42:22 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3cc3600e5d1so1454338f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 05:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756298540; x=1756903340; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u/mZvV9kb0orEkNWMjrJAyvdt/44HABaPUU1+rYsimU=;
        b=SJ71P3SFVIfneZk8mgWuZIwHqi1z1WNdp1J2/X8FZ3001h526oYN5LVSLNN8tjQexk
         mWovP+1hKRjH4foXkHQ3RHNccmPej1W0pydmvfG6BkOiInrYs6kMOKnJfRj5L0aaQmfl
         5fcqDSwEulUdxRRb+JpwYrD/mCTUTuYUq8qQH2aiLKB5y9xR0cC6+ZrkIiVz4Ku76+6e
         aqsNQ1bTIKpd5FnvoGbYlpvMDahvMD+LUIOMcasONIfwpgVlNc3466SPtB5Y+w0osog6
         y8XQjJx/b8ayjBlV6D0sERHT4WuqrEQXdmgmq9AzF+czaFVkuV3eBIN0gQ1qiIj/SbYg
         z56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756298540; x=1756903340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u/mZvV9kb0orEkNWMjrJAyvdt/44HABaPUU1+rYsimU=;
        b=NHSScwmjO6iBotFyvjbEddHm086c7bPhqgChsFG/CO2u6VOUUWqCBXaFA99v3563dM
         pLpmxtO8uxbsR2fQwix+vOsxyK/2viMWRw3YnnrUk6973QyUlMjY4aIou5vv55C2YzFn
         DUsUNCeNWRZIcbAZfKyKPtc/NOGQXtPTamp+88qbczx6c5TbPunMY9+k9FjHN2jWxL47
         6iB3a6T/nnqZL1uBRTsvLgKTijjsoGSGAH0JE4Mz0Nh2sYNWJOe6slxwVzhQ+wm069K9
         yy2oZo07lg2vHbvi1P2F3lz4AYOzCq/1ssya7Um6SH7ZhsUQ9pRyTfxQ91dMUbDrhLaY
         RQqw==
X-Forwarded-Encrypted: i=1; AJvYcCVI/E/ytMVWvSwnUXTqDPbt8S9nRadAke0EBRmKqTENnpMyV4iX6XT1iXuFqQjVk4KOngmdUbKskZOHoalewAgD@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0PxQNbFgMLIGnBvKiVOsjv/6XvX+VDLjLek8wKB7v2e5V8wVi
	FxoCkzvPxWufHw7xNbAY/VfQYmAOy3s6t7gSUv31kFELN2Ntm5qI5X8nvTmIboTJOfo=
X-Gm-Gg: ASbGncvu/L08yOSFZU3iikleXSfI5FSIzF1sH84LH1cOoArWdtlKlvp78DmZoNds2ic
	MWBNidAkeBQAdadl+d7vkoQmK6YsmozNw7GDygkQO2WSLIf+x5001Me352qbOYbwc0wuP3TfBsH
	iywobANZCsxx0cb8RPXOtUxmJez8K7TbZFPSWsSSuq8TLuW4pZMns8xfsxuL5lOlKi9bRUVKyQL
	A595gMSZg7rWxYua0AfF2t7MeMqU4IaxJPzWRHM4rkdF2FvWAR0Md/Jx/EIcxuQfeBBnTNLcLAD
	fpWWXnRSfwaw9u1s/S7PsvmVPQ5/X2/pJxOkoJfhe/7+U2ZYZ1a3ONp6NcexD3yTeN2uBvTyLL+
	ysQWHqVw0rb14Eyhm+jAdrrLMdZxpiHNrAE3bHOx+RucUqJmWpmNEqHxhrMqt0PfvsTIR58Fn3s
	SdgA==
X-Google-Smtp-Source: AGHT+IHDaXwaFMJ9SMq4opGoNcipuyVIDBjCdJ6Q67OG3cP6PVryX0OdauanSBAD0FIphu46Ph59Og==
X-Received: by 2002:a05:6000:26c7:b0:3ca:368b:b816 with SMTP id ffacd0b85a97d-3ca368bb8d4mr6810396f8f.62.1756298539689;
        Wed, 27 Aug 2025 05:42:19 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cbab3ead0dsm6439420f8f.29.2025.08.27.05.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 05:42:19 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 27 Aug 2025 12:42:15 +0000
Subject: [PATCH v2 5/5] arm64: defconfig: enable Exynos ACPM clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-acpm-clk-v2-5-de5c86b49b64@linaro.org>
References: <20250827-acpm-clk-v2-0-de5c86b49b64@linaro.org>
In-Reply-To: <20250827-acpm-clk-v2-0-de5c86b49b64@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756298535; l=820;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=FUVnP6N7cHQr47dLL4bin/JIRmBbPwyaNW8naNR4SC8=;
 b=vr4YUS7k2uOJpKSWAUY/kzAsaucmPj03Ajnab4gJvYwF+6XrFjwzDMIGkG2H/vJmrLX4DqF85
 Z56PRG77k/rBpCAlx0bGdbJTtH91a+wz1P3HRfiu3UXboI+aGKI2hkH
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_054221_413223_A0C3D83B 
X-CRM114-Status: GOOD (  10.08  )
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

Enable the Exynos ACPM clocks driver. Samsung Exynos platforms
implement ACPM to provide support for clock configuration, PMIC
and temperature sensors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 58f87d09366cd12ae212a1d107660afe8be6c5ef..4255bc885545fb3bb7e9cf02760cac35bf2872fa 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1445,6 +1445,7 @@ CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_SM_VIDEOCC_8450=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
+CONFIG_EXYNOS_ACPM_CLK=m
 CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_OMAP=m

-- 
2.51.0.261.g7ce5a0a67e-goog


