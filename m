Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C46C47BCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 08:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OLntyfjjyt1SpCyW5jaihTrhxEUyaOdPS3OBALP6sE0=; b=0H2JnTSbjc5TJ44d0Gd6Rz3lRx
	FBSDUgIelQm2fW1rVhQy0Eu9lsGO/bjUA90zBuogbffOiNWPhmTvLKL9RZ30kCvlNfqAvGxjOw3kC
	nBHp6/IJFs4xRgoppMbQVfph1v27JGbvZuy9IzgIU1xKpg4RarPuBrH8PQPU3ZiTlSHhAHLTiXNbp
	1JkGzcI7to4rc8GSNKDdwCyRp12gYaJaDxy+gp8O4kYf/ZKKXsdh8vgzzCzyudk1mkG99XO1LitCL
	0dgusm4tEuuYZOIB7iUjek/xpMgF6FGcWfrkqk77pJ8TgAwnN5nnjWacb3lnGVPJDma+gmNa+eOoF
	kepRxwRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2qj-0000000CeHJ-468t;
	Tue, 06 Jan 2026 08:55:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2qc-0000000CeEY-3FMZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 08:55:33 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QCMB3442445
	for <linux-arm-kernel@lists.infradead.org>; Tue, 6 Jan 2026 08:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=OLntyfjjyt1SpCyW5jaihTrhxEUyaOdPS3O
	BALP6sE0=; b=aLPHJ2W0uZ4N9+nMk7NvPxJI5VOBQbeKQwRcvxMwerWEA1ccgfz
	jCNGrmI9y4C659750jq3jnsy5YNyypRPdaUjYJXkS5zgSS+AC1ksUf6ESK8w0X2S
	5rIprL1jEu0IiNcliscZ9xeZSpltQw52nBQ3weHa7/3PBPRIlNTIZe5XC9BO1JSf
	J3cUbUJLXw+Te4EaUM7cWg42XlKeprSlMtGCdiT3b8ucs3idG18ZxC6pWulPxWFz
	OIkTPvnkKrl1IBTNARdvFee/E9H7oIWu55PN4o5ZiRsWCHCWffbcM8IEVkgty9Su
	WuEnGZzoM+lkmn/T0q6YiL4j0qeWgcVOA/A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgmnh9s0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 08:55:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed74e6c468so9449971cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 00:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767689725; x=1768294525; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OLntyfjjyt1SpCyW5jaihTrhxEUyaOdPS3OBALP6sE0=;
        b=igHzls1zYIsnJNNjCu/dxrldw6agwUsgxGMpzW00n4cwLQcBFc7ezuxeEXNLqdRfDe
         83uTc3upTaWyR/e9zBwTMoMpYk0CWOobgLxU4hKdH9w4CrRsWhOcZAH8hBavbG3sUbcs
         fJqDkCeIs2Dk0mFOEIdjD697UVgq+b9OCziTZ2xvkyJPncmEaamWfekmeUc3WKs2i9e0
         iL0Ub8f/PLgOyLIDNSLRAq+6dl5il5EQ0C7It1KBldcLJulQUw89Y5sGZ1cftLDY2uMr
         R21259dSRkidd2iA8mcKBGviMtwP7YOobLj3AbfnmsLMjcH2PUSDOXhGVBvAtMBUkChc
         4nCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767689725; x=1768294525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLntyfjjyt1SpCyW5jaihTrhxEUyaOdPS3OBALP6sE0=;
        b=ZDexNkEZ2kf4/zqe0CnPZ30LjH3b0qgOBg96z2lHjMI5/fG9R2QUU3mkTuSZ0yI+Mu
         Kt8x4vfzM4JDk78unYc8LTMB/BopY08d6ZX/iBH8dR0wdxIhm+cP/xYDQnIG/UsIYuaD
         UfuZ6zAZkCfdSz66mFUcmcM4DgAKRM2X1EZW2gLkOXn+mux62geBQJ5mWIqvIvnGk3bt
         eZ3Y7HA6NWLm3WHU6Bhx2wGIZduHxff8nwtzcDGTBHOtPZNC1LnigZF01t6Pfupt5VMx
         dpDO7LxLIYtAu9XTw0jPIWUPdbftRgGv90tTpex2nn+OhPZerbnPokV9A6+tiyaWQLyr
         7HDg==
X-Forwarded-Encrypted: i=1; AJvYcCWLltqltJNrtuWNtnjB2PE1NGOvxt7Qm3g9KeTyFisrPENWD7Ee1eXqPlZw870zjGMP+PnKenFwg+SWkPpaQwnX@lists.infradead.org
X-Gm-Message-State: AOJu0YyrBESDOYOToyMOOb0oEHOyvY7LhJW/MfUSfZT4eXUWr649WwBA
	IEjld+hfAKNboeBtImDtmH0MXdKykYKWKTD43CTGifn+MRXo2OLjLR8f2A7yZV14Icq2M5vpCST
	rzdh0hmoVeZb3cjC90zlV0guc+Z/V0EKZt0Jwoy5HYLZi3cBJsER8rzy8kfAQh7A/Qx9ByV+pmv
	2Zmg==
X-Gm-Gg: AY/fxX5SxWVFAJqZrOHdJvrcMyYHaDu/pQ9nhtobgbPr2t8t8r22Y2G5jBP7uIG4eQv
	sGimW1i5dPEiFsE6/7+K1JeY92IoZA79bL/Sa2Imuku18p/Y1j5QZ8gEjJpXYTq3Gy8IEqy7g4d
	sYMlOGF1ciczcLqwcExPYRUz6vPJ5NYADYu/FCUMXsAJlMU25I/yLNT39FAUV9r0/rxgKe9t+99
	7ISw3rnNM1/zEFDzFiYmY18rGNLeh9XbYjy8VQBDe69kNfcSLemWmPevfBgb6eD1nbjtT6vTLht
	B8JLvYIW5OqOCps0MjiQJNgILaW7QpkFjvf89LFGY+J9R+j0jorZn1bY2jnDrv0rVMoKiRY3WRB
	0E/sIoclKjjl/Mp51leKhW+tDv5DLgNMyyfFE6XA=
X-Received: by 2002:ac8:5fce:0:b0:4ed:e064:1638 with SMTP id d75a77b69052e-4ffa77aa962mr28559741cf.40.1767689725070;
        Tue, 06 Jan 2026 00:55:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMU7QLas00J/5wXs1CjykWn9MmTc1yCeZJJVduAIoL1KbaKbhKziwT3E3DaYERxdSgROGv5A==
X-Received: by 2002:ac8:5fce:0:b0:4ed:e064:1638 with SMTP id d75a77b69052e-4ffa77aa962mr28559581cf.40.1767689724599;
        Tue, 06 Jan 2026 00:55:24 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:a1e5:bc32:d004:3d67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df9afsm3326754f8f.24.2026.01.06.00.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 00:55:24 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] pinctrl: meson: extend build coverage with COMPILE_TEST=y
Date: Tue,  6 Jan 2026 09:55:20 +0100
Message-ID: <20260106085520.21129-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: N4VLyTSAMcwhmGfKeb6cXLD8jejkIhTI
X-Proofpoint-ORIG-GUID: N4VLyTSAMcwhmGfKeb6cXLD8jejkIhTI
X-Authority-Analysis: v=2.4 cv=Vscuwu2n c=1 sm=1 tr=0 ts=695ccdfd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=kI-syGhB69xVGPkSyq8A:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NSBTYWx0ZWRfX8vUxE/Wu45zU
 lOD7gGAdLqK/JviHSz9SlodRJlrRjqsPJCe4ORJrsqKfxiNgWuAk3RXlKrBxS2mMnf2XEClw7v7
 Zaohtieru76+DBIrLlfJFYLFzRoovZsgRATJZTNDTnT3ks8Zizdgj+qF0f/wLNg5d1Ml8Q6tKXC
 xJ/br5juizfWeS9pEj2wcXkedCKMCsi/WZM0o9zW9M2qJ7jOLUEazKbCCHNYevSttKf4uJwtmBG
 myuExmo1FfAP1QlyCqsr+PGptK0PUuXZXxx1qJjGxmpjrFkHQI/IuOIvmgb7inhhC7zjC3fAVra
 OWpOgOMelIXTD8b8VqFsW0hhGUXmy4/lF0kyXDzWquOt9v3FBX/PUyXML/lV0tE9c7Gnw1TiUcE
 hdhKx+0J8QAAh/Bij3TRJfjf/z0nA0jZaLIImLZJNf/KmwMCwwNiTdGCqUXAud6WXfg4ggoVOW/
 Zfxf8FDgAzi3M2ZYSAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_005530_377151_86EB354E 
X-CRM114-Status: GOOD (  16.03  )
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

We currently only build these drivers on ARM but there's nothing that
should stop us from building it with allmodconfig on other
architectures. Extend the build coverage for all meson drivers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/meson/Kconfig | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/meson/Kconfig b/drivers/pinctrl/meson/Kconfig
index 0315e224bce6..ce6aeec2fc79 100644
--- a/drivers/pinctrl/meson/Kconfig
+++ b/drivers/pinctrl/meson/Kconfig
@@ -15,25 +15,25 @@ if PINCTRL_MESON
 
 config PINCTRL_MESON8
 	bool "Meson 8 SoC pinctrl driver"
-	depends on ARM
+	depends on ARM || COMPILE_TEST
 	select PINCTRL_MESON8_PMX
 	default ARCH_MESON
 
 config PINCTRL_MESON8B
 	bool "Meson 8b SoC pinctrl driver"
-	depends on ARM
+	depends on ARM || COMPILE_TEST
 	select PINCTRL_MESON8_PMX
 	default ARCH_MESON
 
 config PINCTRL_MESON_GXBB
 	tristate "Meson gxbb SoC pinctrl driver"
-	depends on ARM64
+	depends on ARM64 || COMPILE_TEST
 	select PINCTRL_MESON8_PMX
 	default ARCH_MESON
 
 config PINCTRL_MESON_GXL
 	tristate "Meson gxl SoC pinctrl driver"
-	depends on ARM64
+	depends on ARM64 || COMPILE_TEST
 	select PINCTRL_MESON8_PMX
 	default ARCH_MESON
 
@@ -42,7 +42,7 @@ config PINCTRL_MESON8_PMX
 
 config PINCTRL_MESON_AXG
 	tristate "Meson axg Soc pinctrl driver"
-	depends on ARM64
+	depends on ARM64 || COMPILE_TEST
 	select PINCTRL_MESON_AXG_PMX
 	default ARCH_MESON
 
@@ -51,25 +51,25 @@ config PINCTRL_MESON_AXG_PMX
 
 config PINCTRL_MESON_G12A
 	tristate "Meson g12a Soc pinctrl driver"
-	depends on ARM64
+	depends on ARM64 || COMPILE_TEST
 	select PINCTRL_MESON_AXG_PMX
 	default ARCH_MESON
 
 config PINCTRL_MESON_A1
 	tristate "Meson a1 Soc pinctrl driver"
-	depends on ARM64
+	depends on ARM64 || COMPILE_TEST
 	select PINCTRL_MESON_AXG_PMX
 	default ARCH_MESON
 
 config PINCTRL_MESON_S4
 	tristate "Meson s4 Soc pinctrl driver"
-	depends on ARM64
+	depends on ARM64 || COMPILE_TEST
 	select PINCTRL_MESON_AXG_PMX
 	default ARCH_MESON
 
 config PINCTRL_AMLOGIC_A4
 	bool "AMLOGIC pincontrol"
-	depends on ARM64
+	depends on ARM64 || COMPILE_TEST
 	default ARCH_MESON
 	help
 	  This is the driver for the pin controller found on Amlogic SoCs.
@@ -80,13 +80,13 @@ config PINCTRL_AMLOGIC_A4
 
 config PINCTRL_AMLOGIC_C3
 	tristate "Amlogic C3 SoC pinctrl driver"
-	depends on ARM64
+	depends on ARM64 || COMPILE_TEST
 	select PINCTRL_MESON_AXG_PMX
 	default ARCH_MESON
 
 config PINCTRL_AMLOGIC_T7
 	tristate "Amlogic T7 SoC pinctrl driver"
-	depends on ARM64
+	depends on ARM64 || COMPILE_TEST
 	select PINCTRL_MESON_AXG_PMX
 	default ARCH_MESON
 
-- 
2.47.3


