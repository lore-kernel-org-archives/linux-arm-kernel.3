Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68EFC0219C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 16:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YHHEMHsU+0a4+oqKZwIsh83OdLTXo1gU/En19+RQunI=; b=bddr8+sv3loU+aBGJgPbvivNkT
	n4Yku/jcsUO8HAMBNEaLdNdtMGyl2K4EvnTQk2BIpDkP4o8VpSP7D/W38BSUTU3XY/REopb+gN6Oe
	BK9xk/RLLa4aIApD5DLYK049ggeZjxPjn0Z6zeidneThBmEc1dfgtYr2JE+cmqFVHWC6sZlSHk9Au
	Smt7A7VlJ4kX9cX3YCMkCO1+spABwM3/9tCmV8ILPPaslNTsXtAohT7HQTy4Om34rqId+J4mdVVsB
	SBA7REQRFV1+weFUMtntAQKuR7WdHQJtUsOsJ4YykbF+zVgDNRxORYyMYYKfUj20/zi5baNLU47Tj
	cw47Uh1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgQoC-0000000ACYB-2PNZ;
	Fri, 07 Feb 2025 16:02:24 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgQio-0000000ABCJ-1E2A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 15:56:51 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-38dc33931d3so866594f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 07:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738943808; x=1739548608; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHHEMHsU+0a4+oqKZwIsh83OdLTXo1gU/En19+RQunI=;
        b=bll0ZntWj0QEETboXfb0GdYnTD1DFPS2Z5UyhBLgtqiTfZIgaYD1KpuW9IjYbSPP1l
         StsG+PxaodsTw0b7Jn1E6jnOPuojfAsQh0KOwjtdOrRsiK7e9bQ2h5iGm1TGesj1HR7E
         +REtolgNfVXqypQgwHE0lakk+debKY8M5PH1NDQyOQ9PkvwR4zxCY8w3iomKUlL1hovi
         IvMGBxQHNthnQc2r6VMk4YqUTXDd15CfyPb5IE8H+XtA7tPYPCIAk4mZH8W/Aen1gQnx
         HiWHlMXuCkrIeOWlMp9LJfAqbPjZ8pjFoFFpr4EPFWV5HIHf9PLGRaK8ycKbvhAniB7W
         ujIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738943808; x=1739548608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHHEMHsU+0a4+oqKZwIsh83OdLTXo1gU/En19+RQunI=;
        b=VMBPcMtmo4EpPLpLko1MeSh7xD2zQPyOejVGhL16XX9QoDR71OPL0ynoNGtBcJfg6F
         Pn7lwrfgUTAht1dliYh7Y0WPkDtarRUa9QlnB/nFkMCHeH12jDPV3mNmftBwu9nfQ31y
         uV5rVmqC3YJnv8TmgE0Gy6EFM+YLdI0ygVDEMMTT2IIHufwltMmTPeSBwhxCjdIZ5agx
         IQnXmZvBXrJgb3lB5mU69Jjj+g+S3qAF7qBiO6WmEDBeu9LppBssNEht0RFWf5DYWGqk
         jLG5QnZgeEDLyrhc304x6K2RSzN1lDfFA5qZ6f3e+n/uKqr1BRxBFZF8g7Henb4ogYNr
         sxzg==
X-Gm-Message-State: AOJu0YwUfN6QETxGJLL1Cl6/zlOfwHr8Nj6s2UtD0DJTjWW+vB6qpj5N
	nGEijKLr6Chc0qJIpRpEd79Chq5BpdGUiO2V9KZwn5erTARvuWuXThvq1VveiTI=
X-Gm-Gg: ASbGncvJ1R3u5EHpTLwjbvY8ay4jrnmnlzJ0Kb7tBVeRc/dISIZWsvaBw9Np6tTHKQE
	66TfmCtKaqAqhEO8iEJAaIYOqUzRwWHlQO6toXpYpmDsB5L1i+RIlHKAZ0+l78/Dfn5DMmQ/DvA
	4pLvrCDsFYmgb51IYjfJzfXX9DdmXyP66m9yANg4suNKR6F5wJsxbkZ1sTNa6f62kCUmDBKSNhn
	x+nN2GhcwhiZVcQQCPCDFAA3fDJLNA7JaJWjYv9OEvKlp8pyheohBSd4uxXJk6K64niZy9Ss9KB
	j6N4mnWZynGdh8RsI8wPp93tqwanZZSXrHFT/m9ick8acKG250R16ORICZVdGZv6J7zkOHA=
X-Google-Smtp-Source: AGHT+IEDZvEs9s4rKpAVm7wDLvW/bLNvak1Ptn/SkxGZOdPZ2WxEoPVQJKAp9WJcIeZNJtkpg4J6hg==
X-Received: by 2002:a05:6000:1448:b0:385:ee40:2d75 with SMTP id ffacd0b85a97d-38dc8dd9511mr2508329f8f.20.1738943808512;
        Fri, 07 Feb 2025 07:56:48 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc09fc2d9sm4197507f8f.6.2025.02.07.07.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:56:48 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 07 Feb 2025 15:56:46 +0000
Subject: [PATCH v4 4/4] arm64: defconfig: enable ACPM protocol and Exynos
 mailbox
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-gs101-acpm-dt-v4-4-230ba8663a2d@linaro.org>
References: <20250207-gs101-acpm-dt-v4-0-230ba8663a2d@linaro.org>
In-Reply-To: <20250207-gs101-acpm-dt-v4-0-230ba8663a2d@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738943805; l=1030;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=zqmyyeN/kAHahNeROhtKWHf1vZ7bvcbTcmNPC79a1h0=;
 b=d7DWG9cTHp3/0OLPztRrajPmsnKM3gPa+i7ZpieVei1gzfDXy+CtBAQnvfIs9uoSuXu6EqLbZ
 Zu1Scp59poYCz1QFb87V7AZEXSwyx+B8/yOAT5CxQ9bh0+TpNKXyXx1
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_075650_332999_983B855E 
X-CRM114-Status: UNSURE (   9.51  )
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

Enable the Samsung Exynos ACPM protocol and its transport layer, the
Exynos mailbox driver. Samsung Exynos platforms implement ACPM to
provide support for PMIC, clock frequency scaling, clock configuration
and temperature sensors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da4415599..18f96796298c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -264,6 +264,7 @@ CONFIG_IMX_SCU=y
 CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
 CONFIG_QCOM_QSEECOM=y
 CONFIG_QCOM_QSEECOM_UEFISECAPP=y
+CONFIG_EXYNOS_ACPM_PROTOCOL=m
 CONFIG_GNSS=m
 CONFIG_GNSS_MTK_SERIAL=m
 CONFIG_MTD=y
@@ -1403,6 +1404,7 @@ CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_TEGRA186_TIMER=y
 CONFIG_RENESAS_OSTM=y
 CONFIG_ARM_MHU=y
+CONFIG_EXYNOS_MBOX=m
 CONFIG_IMX_MBOX=y
 CONFIG_OMAP2PLUS_MBOX=m
 CONFIG_PLATFORM_MHU=y

-- 
2.48.1.502.g6dc24dfdaf-goog


