Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264D4C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 05:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p07sjty6xKqv6rCV4Fqi1eiP0EADaUe999Gk077M4nk=; b=RgbhXX5JUHtTcRw4F7c/weYvVd
	XY/jOUMyFnNzDUGS3AiWcksApZVBqkoFvZOkee3sf+XlbyH4CMGdRTDlhUXkJhTZvCn8DQ8pZP6uF
	7ynakos0xAeZ0g8WcTir2VfbBD5id2WfzUfu/6hoyxqvdPzsxl/7c8cry6S4NO7oR76GE59wJclOj
	Ubz25loCjj7qZ4ZS1oIrHPPBzG32L2qeee5lKqFpzgvIPsAZ4igxia9ZVKndRotq+jYYfR7LjfQKM
	Fq+pkuytn1NjCPJD7zhhSCiNyRxAUXFzFbwi3EalnnZBHNzd1S+RcFnj9dtsKujbh+1L4+holWGJf
	7CarxYaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbCEZ-0000000Dwxa-0xaE;
	Fri, 24 Jan 2025 05:27:59 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbCDF-0000000DwpN-36Du;
	Fri, 24 Jan 2025 05:26:38 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-3003c0c43c0so17440721fa.1;
        Thu, 23 Jan 2025 21:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737696395; x=1738301195; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p07sjty6xKqv6rCV4Fqi1eiP0EADaUe999Gk077M4nk=;
        b=WTKOoh1SsohoUzOBsF8Qf1dPofkonCMpvrv2RT0Hp4Yuk6dvz/R/NI/t99R1lNhKIl
         m8DPvhD1jLXOz7cKHfn62tffMWu/AcHxum+Ysx8kLUDRARd4UiFuNEquUoir2qnyLyS+
         UW7JVd/Njyyx3ChqzM8fPgen4jLsegrW/Vjd9PC/lp0iq7OuaR28rkPP/a+qLNiO2jXu
         a9Vn71bm2zHQMI06zIfG5HlXcLDC88E6Ayk8mt8N2N1/htre+K8t8f7l3QmVALbsfVwL
         mRyKbJsHpIG5rwlwkBsOljcNuh7daCV9iqqbMU5K7aPieyHnzXclLpqZNuWKV8Tte3rL
         BmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737696395; x=1738301195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p07sjty6xKqv6rCV4Fqi1eiP0EADaUe999Gk077M4nk=;
        b=HcK+cnbYBD4aWm36n0WyE3QCLXBuwon4ls44qJ3Z7QP7nP5AGrTc3R7aahG9KarsjW
         b04MzXy+dtX0bOE6A+6huXrXoCxt7/uPngslY+b549idUheEhG2jc7Q8FNY6N6PWi3ZJ
         B8ViuXK+tAXytqCcUL11wCH4tjRApXVZUZDJF6T7UZgVQ+oixK/m/hkKgm49AiJgTOTD
         21u333UwZ7hmZbyMaZtG+xIoBj6t05K464HG9lvVpLKLqvFJ47d/82BNeECTyzLKGlQ7
         Dit78o3SsFY2djgO0KgxppHZjD7+hh7HIuvW1e4NqE+4HlxFh00cojOKZwSDtA9Q9KPZ
         zU8w==
X-Forwarded-Encrypted: i=1; AJvYcCUAVz/j1z9rM2SgtgDLQEnsdgFmhN4Xz8B9viHH3lAVS7xUCnusxLrfAmYFsbEpGb9VaYAEhWknk6Few1Rp2aNP@lists.infradead.org
X-Gm-Message-State: AOJu0YzfNdizAOA9h1LOSuW3wQKyNxQcmjtnx0NH/uis/o4zC3Vs7Xpw
	Jk0hhHqDGsV6mBVXQv5czDlX62J8ZO+qadcsKH+rjulkc74bkPHRIp0Q1yQP
X-Gm-Gg: ASbGncu66p2WQilchZixdf/R7l7M1o74yKfktleB1+G24q5ZctHNnM3IszN+mRnXkIu
	YwDlXLxT3LbbJS9XGOQRUw6B0DkXhyHChF+66i+dYdsh9Jgt1pWihy5lsWLCbPyGwAwtxnvpn67
	ObtH1hiV/kek6Y68N4Krj1OF4J31auWesgwAWKwglTN1z+0EvmiUrtD3K5CmsV1qitfviYoh3ei
	+7MBEdcPk/999GRT6PAu/GpxyfEICtKEQyysErhWPvUsw2u1OQO5qsimiYu12b+1oCTjr2xF36x
	PDh9oWIyoBdeEsk/zGU2jetAEpWJ
X-Google-Smtp-Source: AGHT+IFlqUx90XIioMXK3K5xnP0U9POjUttzeJEvX3ss+rSU2HenO99mLcexlPY8+ML+vDDZJVxQcA==
X-Received: by 2002:a2e:a263:0:b0:302:3abc:d9e2 with SMTP id 38308e7fff4ca-3072cb21f67mr76745751fa.29.1737696394396;
        Thu, 23 Jan 2025 21:26:34 -0800 (PST)
Received: from localhost.localdomain ([188.243.23.53])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bc49f46sm2389441fa.105.2025.01.23.21.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 21:26:32 -0800 (PST)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Alexey Charkov <alchark@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Dragan Simic <dsimic@manjaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: Fix broken tsadc pinctrl binding for rk3588
Date: Fri, 24 Jan 2025 08:26:11 +0300
Message-Id: <20250124052611.3705-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_212637_787292_2F09FF73 
X-CRM114-Status: GOOD (  11.14  )
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

There is no pinctrl "gpio" and "otpout" (probably designed as "output")
handling in the tsadc driver.
Let's use proper binding "default" and "sleep".

Fixes: 32641b8ab1a5 ("arm64: dts: rockchip: add rk3588 thermal sensor")
Cc: stable@vger.kernel.org
Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index a337f3fb8377..f141065eb69d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -2667,9 +2667,9 @@ tsadc: tsadc@fec00000 {
 		rockchip,hw-tshut-temp = <120000>;
 		rockchip,hw-tshut-mode = <0>; /* tshut mode 0:CRU 1:GPIO */
 		rockchip,hw-tshut-polarity = <0>; /* tshut polarity 0:LOW 1:HIGH */
-		pinctrl-0 = <&tsadc_gpio_func>;
-		pinctrl-1 = <&tsadc_shut>;
-		pinctrl-names = "gpio", "otpout";
+		pinctrl-0 = <&tsadc_shut>;
+		pinctrl-1 = <&tsadc_gpio_func>;
+		pinctrl-names = "default", "sleep";
 		#thermal-sensor-cells = <1>;
 		status = "disabled";
 	};
-- 
2.39.1


