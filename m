Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C1DE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 18:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B+9FqYeeAENGrZd8cytmT4zJKeKkGEh69WKTjOVo18g=; b=EFXAJyIcj67sUOMAE3Vvg+pyBh
	S9l7FVK17HcaRpa+TVw3P8I9p39Lql9hIswgbAV4TmXLe9pOb88+IGf4BvFP3GtgVvP7Is5y9IdLm
	SdENRZr6TDp9NIbHOvPyFXpDGwh+P0o4t7ycTahc4tKzouibxYq48HaMqPTCD4zfiB2D6CyZz3Jhj
	a5CoOwIfGBHWZVbAX2Y7ohXqhNEi4Z8AxpJfxD6lV9vYxqjdLgNWkMN2R1AQOD0MJwsF+Hl0ZiexY
	KsUFIeHYdyOhB1Kt6HhOHE4k7YS8dAIYvadwqfIY74mY82898JHnZ4RmeleZ2mLJk4cXPVa3NUCny
	jE5bGhnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL4c2-0000000CMQQ-3Kw0;
	Tue, 10 Dec 2024 18:05:34 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL4Yy-0000000CLuM-2mYi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 18:02:25 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a9f1d76dab1so760237466b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 10:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733853743; x=1734458543; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+9FqYeeAENGrZd8cytmT4zJKeKkGEh69WKTjOVo18g=;
        b=beGMtHMN3IscYofM8KEfqy3JlA/8om1x5XLNnr8uDz9VKi7B49UP4gXJT6Xd6VX5zy
         vWCauJEey3323gsntwdHYKu2zTd798aMO8YmCoX8IOyIcOuT7ZrXuAkDZ1Xt6h3CTP0i
         xLgXj/aB21shB3QZvjMotEQmxQu011KrrTmEZiKW1zkN92HKeDBLXoMAhdNkLD3xvdjG
         Be8/RbCO3bQELDuRrhRZi9y+G/gxC5uazrIwgAJDYPEYTwr3/pof7ENo4NdXtKHbMzyb
         HB+Ftyix7C2FD9wuD99nlegbCsNhVbNOB9H4KgkhgV1lJC9dVgRxpzBgMI/B/Q2VCizz
         hWoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733853743; x=1734458543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B+9FqYeeAENGrZd8cytmT4zJKeKkGEh69WKTjOVo18g=;
        b=fIdXV3kRNgxEW8yYT4YK85fO6g9Kb64efN0g0gnz+K+k7WNRJH+nTD5mCgzzYsccxh
         42bbrPNeTAPVHVc2MHQ1gtpOeUmUFUddAhsh8vx4GwzkAEMSiSX1oOVHSVSheIUMDWaY
         K/GDPVegHMSo03ah3kYYhiR5jmVPg5Qgjhax2ao4n7cP6v8+OPGME0KPdtMSh5NXhxeh
         6S/UY5YH9gUQ0sEn1RnYQ1+RNQhjHZa+HboembuLKnpaYnIuZKBJxfrT9qvmKevd/abi
         yiqUHFgWPwvyhfmEyKu6Njah6yokK7VWp2eVD9w5p7CYk98VCTpsMFqVuN1AqsI2jwy2
         esGA==
X-Forwarded-Encrypted: i=1; AJvYcCVKDI0Hxua8MlwItI9s/3gYhZpWUKjB9E7Rw40SfhAah8wFJ2zQWhTevP/Dq+Kt0II5k+DHnDkzG0JOuvXTZ2CF@lists.infradead.org
X-Gm-Message-State: AOJu0Yxu2UJaq6MUtVjK3NVYrXmJtOyzdVvIqiMWKbk/L9Tf4M3eeWWQ
	g6nNIf1ILe7un0jTy88DL1B1Csa6VssrpUGMfHrsD3/bIDik2zuX
X-Gm-Gg: ASbGncs2gKHGP9/RIFz9oZw6LWjdPeMwdH6q3xknPQH55JEBPrRFQ10F95tr9GLms2V
	HcKRlSq0NzmVeb+zoKVi9qpstIMzLP8zaYZzvCZMoAPU/zbzUv7gF3M4c05Jd1Tdco9TAcpJpIg
	wgsry7JFl9K/06Vcj4M7OXRxaraQ27J8V4G12aoj9ObWMvjYQsxXYCmKkajbKOPAbxbCQuLJDr1
	/rKfwrWN8C2q8VaFRTVjXWC+kGzHNtozclw7vf8SrncVf67X/fNMzEAE+EuTbYC3xLFGqJGWuE0
	FBrZbpYUujpBOHMaoP6Snx4JTfLUBg==
X-Google-Smtp-Source: AGHT+IGQmiQFDU6Ifm3WpLzcxbuQNWrLM/dWyKQdSVJ1aQJakM+MmE9LVunH33Z/nHjWO9mihVn+7A==
X-Received: by 2002:a17:906:3184:b0:aa6:66eb:9c06 with SMTP id a640c23a62f3a-aa666eb9dc2mr1033264366b.5.1733853742664;
        Tue, 10 Dec 2024 10:02:22 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa69448304asm276347066b.45.2024.12.10.10.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 10:02:22 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] arm64: dts: exynos8895: Add syscon-poweroff and syscon-reboot nodes
Date: Tue, 10 Dec 2024 20:02:16 +0200
Message-ID: <20241210180216.398165-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241210180216.398165-1-ivo.ivanov.ivanov1@gmail.com>
References: <20241210180216.398165-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_100224_700120_7E0D76A3 
X-CRM114-Status: GOOD (  10.41  )
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

For Exynos8895, a reboot is handled by setting the bit(SWRESET_SYSTEM[1])
of SWRESET register(PMU + 0x400) and power-off is handled by setting
bit(DATA[8]) of PS_HOLD_CONTROL register (PMU + 0x330c).

Tested using "reboot" and "poweroff -p" commands.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos8895.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
index 90b318b2f..9eb89dd19 100644
--- a/arch/arm64/boot/dts/exynos/exynos8895.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
@@ -388,6 +388,21 @@ pmu_system_controller: system-controller@16480000 {
 			compatible = "samsung,exynos8895-pmu",
 				     "samsung,exynos7-pmu", "syscon";
 			reg = <0x16480000 0x10000>;
+
+			poweroff: syscon-poweroff {
+				compatible = "syscon-poweroff";
+				regmap = <&pmu_system_controller>;
+				offset = <0x330c>; /* PS_HOLD_CONTROL */
+				mask = <0x100>; /* reset value */
+			};
+
+			reboot: syscon-reboot {
+				compatible = "syscon-reboot";
+				regmap = <&pmu_system_controller>;
+				offset = <0x400>; /* SWRESET */
+				mask = <0x1>; /* SWRESET_SYSTEM */
+				value = <0x1>; /* reset value */
+			};
 		};
 
 		pinctrl_alive: pinctrl@164b0000 {
-- 
2.43.0


