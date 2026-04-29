Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B81CD13D2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 18:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=il7ZtFXUm/0VgwIneFEdIfwHcrPU08oUjosBQhZyc7I=; b=UMreuai/gjxoR1OsY3JPAHF6sr
	5+GhKmA7gzwnDu0F/U6XYUAtUkqlotd3xSLg0x4dMkHx7FgcK9RcVzl9VnozPeetcRurWccPe0+HE
	BcMbg7Y83ubHDg0X9t+xzBCqLU5D+ZA8pN/kKmFqbz4nS1qGjGwXswvbQdNJ4hCVA9wmviI+2Cbpw
	gPsJTN4dgAr1xgDcXxQdejkudIoLMKl26zuv0l0jW8oe7JDRMKKEvgNAiHwVPuNcuaw1/BM56fPXU
	PwqJe/GiH3jwRHEmym7DWVgNHe/kAgKPdt4w0chnSOoUHZzJ9/D28qnLUgQH1zwLIuytjaDSRaP2O
	GVi5R+hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI9zo-000000045mW-0Xsx;
	Wed, 29 Apr 2026 18:50:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI9zc-000000045hs-1nsG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 18:50:41 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TFwFqs1721223
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 18:50:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	il7ZtFXUm/0VgwIneFEdIfwHcrPU08oUjosBQhZyc7I=; b=UCNkD/PxHOTA81YZ
	vTEqGFiFYyUd4PaCVW5jXI3fPazQE+04m0c1i+Ky87ktmVbr/qGX7K9XJrAXQQme
	OQJgTWm336BElEpXnN8VCLYPpwXOcEljF36Zy2GwXROPehj8cqtfhXOt8S5OArkZ
	nXfwPXSbZWty3qQ5MImDNnr4Kcr3xvRmnj/ksY4/fSyDXIK3CeMrlIthUVZB5oLX
	YEwQ+POWz8mp/E4skfZ2shdomRdnW6pjpGl9vmT5jbx2JPNPVoYAmMlQSjur+6H3
	URMvR1K3r7a2AVwkBtokSGUFjIdQt3LWpDDwF9IH61XqJME6roMqxPSI2kjigN1U
	qR2usw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dua733jeq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 18:50:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50faf1ecd1dso1546371cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 11:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777488639; x=1778093439; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=il7ZtFXUm/0VgwIneFEdIfwHcrPU08oUjosBQhZyc7I=;
        b=K1ldSE8jXDi46PrX6YSkZtw5WgOhRLU1MxIhPOm1HPOS9tuDKQaVsugyBMZGaCN+jK
         6iu4ozLBjnQseXozj3vdvYHXWuWZwaXrxgwl2J3yq5FwgNSrDnnoJPGUAmh32cBx7xcy
         zHtY+F87HWqY24Mqhbl0lsbJppmUGTP+GSRkfzaqKBfuWa5sAb1VJKJjrgtvoXbdRn0j
         7MJA2250IueCe6/HJFtEIwp7M6MKdz9ZAGt7GqO7I/06VxQSo05EolSk8hiDonDDYDKS
         fvbDiUBXUz9a4EyEY8QYiJ4BUmxatLVPG5gMAdy9Jzop5AQ82vEPcVX0T2xbLOZEKx09
         sGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777488639; x=1778093439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=il7ZtFXUm/0VgwIneFEdIfwHcrPU08oUjosBQhZyc7I=;
        b=QYuUGDoYUBEwfzVMP01XrD+TY5EAsivTKqPNQ8J7LWG2i0RPqIdL4MaExmgB+yVn0S
         FpPUjBGkVyoq/e7iQ61dR9z8x7z9NlLf2SWmzhHFxB/+W/NBucDZnbot9IQg6s5cv170
         oX9uJ37zCXXwVxJs6eBdrUSBR2/tgUAl6/1ItA6RWCZq8xvP9B9Fxh78vin3ZgE5qMSA
         NY0nZdW1/SyLxsWbWeJBlweTQAvyD4yvdbUryJ3NKnIWa7pz3p6AtILyGyfU5oCtXNbP
         hrQNJQ7URcji4TutpKonxtnEVRnE12e4TELy+Ltr9CG/PnVBPNuWp5WPYkndlupdAB8N
         kVOQ==
X-Forwarded-Encrypted: i=1; AFNElJ/xX1XMrOxbC8ziyK2y+cJPUiPocksNagsVCUzRX/0Gof/C11B8deYmwh2phyLi91nrkEmZr7MaovKhDb/7hpl9@lists.infradead.org
X-Gm-Message-State: AOJu0YyAwb2d7suX5xuKClMmL3sBuFVq359gAeG0iIqobfdTTa9uJApB
	O5QISNmLdva3DwHA5BVj4QcdNWqxK6K3SNqC5lrhnVLGZI27rInTFzyV4A5H6KMdPMhRZZ0NgRV
	Jl453dqDNCh0Tm7rA95ZB4Mt+vMS7C+jBhv7StkpgNkw8QWaDCJ7zzswXm3FAGK+Bc69fDrvYQo
	y4IQ==
X-Gm-Gg: AeBDies0KZ5sfwTtJucbW8LWMhE4ktRNJvawDUuloNaYk9otpJ0999HVL45CkAPJGK4
	4ouz8y46SC4D1mqS9jMWrYdUk3fj8OgCukTorxaVNnAb+gQikh/bsTPWLjAuSb04ztemqQzKBwm
	DzakLEzyJykrfrlwqNwP3FzNIhW0s/RK2CFS/SFRT/OFnXTegwQaOLTT7Wvna4+pTr4tfYKyq6O
	qQ+q/pAHgckoWPTaIc7niOuTHa78XgWzSHLX9cKhmng8M4AF1Dwl9HCv364McNjgti/e9xh8yGF
	nVI9p/YExf4uqekfLG2KcbfYZQiP3tSYqTCSaXls/+C9i0Bg4MRD3uJVREWDSfC4KEuaTHNxHlJ
	/6HCKNflTBXMgYM/fP3Ce9NyzQvmbk6hdRfie9FPxzjqe/51tM9mBb7k=
X-Received: by 2002:a05:622a:145:b0:50f:bb11:df41 with SMTP id d75a77b69052e-5100e1f6136mr120912421cf.60.1777488638847;
        Wed, 29 Apr 2026 11:50:38 -0700 (PDT)
X-Received: by 2002:a05:622a:145:b0:50f:bb11:df41 with SMTP id d75a77b69052e-5100e1f6136mr120911981cf.60.1777488638429;
        Wed, 29 Apr 2026 11:50:38 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301b7bsm10525115e9.11.2026.04.29.11.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 11:50:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 20:50:24 +0200
Subject: [PATCH v2 3/5] arm64: defconfig: Drop default or selected drivers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-defconfig-v2-3-e4ed4186028b@oss.qualcomm.com>
References: <20260429-defconfig-v2-0-e4ed4186028b@oss.qualcomm.com>
In-Reply-To: <20260429-defconfig-v2-0-e4ed4186028b@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3932;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Y18lQeK785BUdXcoivL1iOwoR7xldMbNw4zRskgiwhw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp8lL0sgeXDSDby3iCOTPT8ih77bBMMdS9vr72F
 T9jC7nElgeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafJS9AAKCRDBN2bmhouD
 12wPEACV2nKntoCfsb9G+XLWmv2LbLw/iYIflfPo75L/dO8qFnTL+Zt1E/pSbXziYWTAbr2Bxc1
 wj8HYvHODhvFS6BXyPMVbQEtNO89II7vfpQYLF2Xxdw9v3rWCp3VvZ4nHiGcIP/HRB65mJ8EY9z
 frmOPUZSGL4gh33Wnc3U03AnkoGBLZpbE50pL1NyKjRgr7SZUn+3/bHqXGL7I7L9lr8Ajny6XkN
 xyZmJC3pTfRZPM9p4y7wcoH4+OGhO8/jHGWt9ICC86cqN8ToK3F4dIQl852Q6kLIbAGoTeDFBWV
 PHxLY/PwoIUTfaEMngXB3/YaWvjFP4AY/JVqEkrlKMgqWg0yFQQavGwDxs9eMBmsBhH1Z0E/vHr
 wymRFpFY7FNohM/wJxl+Iy9FJTZ6pbjC1TbaiV1/Jl3tQ3/f4ZEuVsZIs08rr8UvOOoze6TtVjX
 /pk0NfMSsPTN10nsSnU7I3grP7Z/re6eyu2o8OpxwVn1moNS/qKUUYlbdadvU18ZoXLk66IMF2D
 9mjKd3pd+Ol0FJeJr75YtgtxLxWxcnAqDO1Ds2DEiOPf63O9SXgCyYbL6TjCoFY1K00sxe3Nkcb
 WLu6SK1eh2BoIOyh2uLCDvsbI0JvYdUR0HRUGIAt9y/mXEUz4RW54a/PyhiDoe2KsshoGj07bcD
 rp6qMk/6LpIYGUQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=XtvK/1F9 c=1 sm=1 tr=0 ts=69f252ff cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9vOstYy64hXmyjEA1s4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE4OCBTYWx0ZWRfX++FkmowRSGYA
 dXu7G3lLuNnrHgHGmaw8wwsuc7vM6LS7vNFNBiW+wihZu4bmdjcBEof3188DnrcdAcJEOV9or+I
 xwgy4rpepsNKDQFZfPoihr+VrccdRLigaRd6lcKf8vfZOLlFCac/jprFJ1DWFeDPDsKdJSxZFqZ
 v49MrFn/Dgw+Sun9qdCbHiR0TLUQk2JnoONFt2GYXXnUntgRgc83fhTF1eMS+G502UcsHrfc0hu
 nJh3zP4P3iJY3rk0U+FjuqPGtDBv0l3L1V5CGyO4Anc607C46cJLbk7L7l1LkSz5r1EuKEFO9W6
 +ia1A9S3MHHE6cLtBOy7xBNV3Q0OydtSkYJ9ITuTfGBr6xLjI46ypD9pBhEoG+G85fKaamHrHpa
 djXHhn8HExAVVXzK2cazIctUEX5gb7IdfE2dAc8IgwRD7PzQ4nvYHJqZSSmfRjh/oxCW1oGJEmY
 1geBByWqpKHgso/PcLw==
X-Proofpoint-GUID: HzOl8hfEtSRLElaE1HwBa9r2_OGaSDIr
X-Proofpoint-ORIG-GUID: HzOl8hfEtSRLElaE1HwBa9r2_OGaSDIr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_115040_481320_872FB0FF 
X-CRM114-Status: GOOD (  11.87  )
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

Drop all options which are either defaults or selected by other drivers:
1. IMX Pinctrl drivers are defaults for this ARCH.
2. RP1 is selected by MISC_RP1.
3. I2C_DESIGNWARE_PLATFORM is default with I2C_DESIGNWARE_CORE.
4. DRM_SAMSUNG_DSIM is selected by DRM_EXYNOS_DSI.
5. SUN6I, SUN8I and Renesas DRM drivers have defaults.
6. SND_SOC_ROCKCHIP does not exist.
7. Several ASoC drivers are selected by other main sound switches.
8. USB_CDNS3_IMX is default with USB_CDNS3.
9. IPQ_APSS_5018 never existed.

No impact on include/generated/autoconf.h.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9a31b258a56e..c9f6d5d6ef69 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -557,7 +557,6 @@ CONFIG_I2C_MUX_PINCTRL=m
 CONFIG_I2C_BCM2835=m
 CONFIG_I2C_CADENCE=m
 CONFIG_I2C_DESIGNWARE_CORE=y
-CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_I2C_GPIO=m
 CONFIG_I2C_IMX=y
 CONFIG_I2C_IMX_LPI2C=y
@@ -632,15 +631,6 @@ CONFIG_PINCTRL_SX150X=m
 CONFIG_PINCTRL_OWL=y
 CONFIG_PINCTRL_S700=y
 CONFIG_PINCTRL_S900=y
-CONFIG_PINCTRL_IMX8MM=y
-CONFIG_PINCTRL_IMX8MN=y
-CONFIG_PINCTRL_IMX8MP=y
-CONFIG_PINCTRL_IMX8MQ=y
-CONFIG_PINCTRL_IMX8QM=y
-CONFIG_PINCTRL_IMX8QXP=y
-CONFIG_PINCTRL_IMX8DXL=y
-CONFIG_PINCTRL_IMX8ULP=y
-CONFIG_PINCTRL_IMX93=y
 CONFIG_PINCTRL_BRCMSTB=y
 CONFIG_PINCTRL_BCM2712=y
 CONFIG_PINCTRL_SKY1=y
@@ -669,7 +659,6 @@ CONFIG_PINCTRL_QCS615=y
 CONFIG_PINCTRL_QCS8300=y
 CONFIG_PINCTRL_QDF2XXX=y
 CONFIG_PINCTRL_QDU1000=y
-CONFIG_PINCTRL_RP1=m
 CONFIG_PINCTRL_SA8775P=y
 CONFIG_PINCTRL_SC7180=y
 CONFIG_PINCTRL_SC7280=y
@@ -954,11 +943,6 @@ CONFIG_DRM=m
 CONFIG_DRM_HDLCD=m
 CONFIG_DRM_MALI_DISPLAY=m
 CONFIG_DRM_KOMEDA=m
-CONFIG_DRM_RCAR_MIPI_DSI=m
-CONFIG_DRM_RZG2L_MIPI_DSI=m
-CONFIG_DRM_SUN6I_DSI=m
-CONFIG_DRM_SUN8I_DW_HDMI=m
-CONFIG_DRM_SUN8I_MIXER=m
 CONFIG_DRM_DISPLAY_CONNECTOR=m
 CONFIG_DRM_FSL_LDB=m
 CONFIG_DRM_I2C_NXP_TDA998X=m
@@ -970,7 +954,6 @@ CONFIG_DRM_LONTIUM_LT8713SX=m
 CONFIG_DRM_ITE_IT66121=m
 CONFIG_DRM_NWL_MIPI_DSI=m
 CONFIG_DRM_PARADE_PS8640=m
-CONFIG_DRM_SAMSUNG_DSIM=m
 CONFIG_DRM_SII902X=m
 CONFIG_DRM_SIMPLE_BRIDGE=m
 CONFIG_DRM_THINE_THC63LVD1024=m
@@ -1108,7 +1091,6 @@ CONFIG_SND_SOC_SC8280XP=m
 CONFIG_SND_SOC_SC7180=m
 CONFIG_SND_SOC_SC7280=m
 CONFIG_SND_SOC_X1E80100=m
-CONFIG_SND_SOC_ROCKCHIP=m
 CONFIG_SND_SOC_RCAR=m
 CONFIG_SND_SOC_MSIOF=m
 CONFIG_SND_SOC_RZ=m
@@ -1137,7 +1119,6 @@ CONFIG_SND_SOC_TEGRA210_AMX=m
 CONFIG_SND_SOC_TEGRA210_ADX=m
 CONFIG_SND_SOC_TEGRA210_MIXER=m
 CONFIG_SND_SOC_TEGRA_AUDIO_GRAPH_CARD=m
-CONFIG_SND_SOC_DAVINCI_MCASP=m
 CONFIG_SND_SOC_J721E_EVM=m
 CONFIG_SND_SOC_XILINX_I2S=m
 CONFIG_SND_SOC_XILINX_AUDIO_FORMATTER=m
@@ -1158,7 +1139,6 @@ CONFIG_SND_SOC_GTM601=m
 CONFIG_SND_SOC_MAX98090=m
 CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
 CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
-CONFIG_SND_SOC_PCM3168A_I2C=m
 CONFIG_SND_SOC_RK3308=m
 CONFIG_SND_SOC_RK817=m
 CONFIG_SND_SOC_RT5640=m
@@ -1215,7 +1195,6 @@ CONFIG_USB_CDNS_SUPPORT=m
 CONFIG_USB_CDNS3=m
 CONFIG_USB_CDNS3_GADGET=y
 CONFIG_USB_CDNS3_HOST=y
-CONFIG_USB_CDNS3_IMX=m
 CONFIG_USB_MTU3=y
 CONFIG_USB_MUSB_HDRC=y
 CONFIG_USB_MUSB_SUNXI=y
@@ -1437,7 +1416,6 @@ CONFIG_COMMON_CLK_CS2000_CP=y
 CONFIG_COMMON_CLK_FSL_SAI=y
 CONFIG_COMMON_CLK_S2MPS11=y
 CONFIG_COMMON_CLK_PWM=y
-CONFIG_COMMON_CLK_RP1=m
 CONFIG_COMMON_CLK_RS9_PCIE=y
 CONFIG_COMMON_CLK_VC3=y
 CONFIG_COMMON_CLK_VC5=y
@@ -1490,7 +1468,6 @@ CONFIG_QCOM_CLK_APCC_MSM8996=y
 CONFIG_QCOM_CLK_SMD_RPM=y
 CONFIG_QCOM_CLK_RPMH=y
 CONFIG_IPQ_APSS_6018=y
-CONFIG_IPQ_APSS_5018=y
 CONFIG_IPQ_CMN_PLL=m
 CONFIG_IPQ_GCC_5018=y
 CONFIG_IPQ_GCC_5210=y

-- 
2.51.0


