Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D2BBE937EC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 16:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=clIhodCMUSi9bIWR5iQaOBvPMKBtZXbZtJjnqveYN24=; b=4xqVLw1GdbpHUBUhAR4xuL/abX
	foLuBZbQSXACAuMkZeGfbqJAEzqA4zv5SEp8hRmMqTT77LhYP7dn89X5oM2B5uxo6ewz7YRPppsvf
	iTzVjhFSFuKoi0KUEFw49LzdD8x7mXP0yeii/GQ/JSScj7vw7zxWm50Ptd4peiCyzfpGvdfTfun2l
	2i8sS1Jn6nJ/4dJBb31htxGxpxvS2Z/tXfnwkUNpNL/CV7Xft+169FIA/VXH6CdpV5YKxGR6iJ/uk
	Qda2P+DX+KiPkDsMSr+pyZk5bc353IqTM9MQCUq4pqoAWWJDLhxhShxNSjDf+EcNIhYmkfR5r444W
	bPDIT/LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBxYz-0000000ETh2-3Il2;
	Sun, 12 Apr 2026 16:21:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBxYv-0000000ETeE-1UXy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 16:21:30 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE5BYs543664
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 16:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	clIhodCMUSi9bIWR5iQaOBvPMKBtZXbZtJjnqveYN24=; b=Atlz/V+bhi19AuKd
	DViXUmC1mxRhdYsBrkOfdLNzMdR2EtblA5w7T/U/J3a2KjGgxSIl6/IxcLqmL3o4
	JUZ0scOAOHjaDFej6wTV0opArrwkKFJfM9CVcakTuMr0QoEtIX9n6dBQ9DrDPQY/
	Lc7ojFJFb2oFRMRokTeJJXqqFgWSYoXjY/nCUHWfRptJhXkmAdjY74gjpLMmfECB
	f6wA+NhG/FVpMzkefaYStU6N+QuzOEMPMw4kk3idOkFTTJm0DLsuj2F1AtCGIbW5
	NEQWc2ieHVMPhllwjc6/rf3ALgZX0rJGjpLc6igeNnLMNx/LBQfkLYxm1nnL7Bzp
	oTSjXQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexftn50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 16:21:28 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8aca14d1faaso32177446d6.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 09:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776010887; x=1776615687; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=clIhodCMUSi9bIWR5iQaOBvPMKBtZXbZtJjnqveYN24=;
        b=kgf1obBO1FNwY5kJfTpw4fHT/dHZLvRV4ihHgM/axIwMN5tqTTagHQMMvVfMDByXza
         CaMcwNew7dAiij8Xo4Z5A3exA/1lThyWFb2KN3tQ+8A+cZjNt0l6rElnH3cxPKhdWzx7
         C5QUfWzDeNO7ugv49F5/AoV4lup2AKG/E9MYZRCbWgEyvy4uI2j6xpwAQcd/vre9RpeX
         baELn1BwFAgvvetCYTGzmOsjBZDK/upCQtjObXWU9DWaFOvO33Pg0FmELzdSCZdUgTKm
         CAAfZeE5lfm3ybJny1nmuY6VLFvsIY5dWDHsc4Wk90mUMSilUcUqyVXLhC6KlOVKy4kf
         p0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776010887; x=1776615687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=clIhodCMUSi9bIWR5iQaOBvPMKBtZXbZtJjnqveYN24=;
        b=nIisP/KogltQZeO2kcgXAyMJ3tD+bfXyLr9F5ao5lZY74UXwXohEVB+2b0/Cd9llfb
         DvKTuvs44div26hYLpuc3evl4n3J11M3nmNsBcHrFrys9Ro+Zx1/wK5KZ6yYtAQKuvrU
         zn0g5ZFXFqkpOB0ncya/dhOESoP4NuU6y5lI9LDIC2yv/CGHds4Pg2mPavuo9Qo04FSL
         In0UZoCUJasLkAjBnKzmb0rcyxTUmcTyv0gHK6Zw3dm2wm394WzoLcUOerz8GqgDMypq
         3QKEfVlNG0gbQZzE0sSQc2CSmbrl4LVixFLsq4SWjR7tpqEuA/FbHFiwKI7TUtrsU/ZP
         4+Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUCrQ5gPUgYUGSw37wsjOU+rZZPmxa47rSrGYkD5//6idD4/em5w137SnBtDY33Zp9a/oQbtfOeccB+qlN6tOrb@lists.infradead.org
X-Gm-Message-State: AOJu0YzfEpAoJ1SyHd99rEmdWO8gPQF8pqdxqpE1n9R6S2kTLqvpxe5l
	E7GXNpWgjUq5dQdMR4eum/cdBxt0yR7b7LH1xkgTa6Sj6NR/63CQvaD46EuzL/fF1FEvKJ2IqLU
	e4/R0BLFlk0WBKT3SjQCgn58p1HDQ0rpC4Bw51zLKC0VheEO6GHxcWtgxPpC6+ZaU8scpQHJxzQ
	op+xYyS5Yf/A==
X-Gm-Gg: AeBDietv2t+1e/6O1hdUq5kudMeYXqUgHeA+DkWS5AJdxOXQaUtfmq1/7FiZ3hVswfA
	klfwmRae7dVLDBRm9Q7VeYgA6mbD2Y882ZxoSgDeP9aQXkVeHNjqDIN7e989Lem7vDqMiGp659t
	H241Oc+gO8UonIoix0dch6hd38z/sPWsFYYWFkZglqiwIuql6dYX5d39Gcl4B3IJjt6+1HSoJ0i
	lcXtQ4woBjcIHMhoiR0eQv3Zrhzpc8jO2kB7zjCx77Rp20CdVf6KsRvHUTImO4glHdd/coZw6QS
	2EoiGKpr3ZMCvuyoXvZHPy8zdCf+BXEGpLzHjwLKuMpV4HYbsps+KGZYn/czJYgRnkmI7jPeexi
	h0lAI3jtHTUS1xj/JzNSI7LRxKCE80QSmqMVp4tZqM6Zj
X-Received: by 2002:a05:622a:138b:b0:50b:4309:6c63 with SMTP id d75a77b69052e-50dd5c5ce1bmr164186511cf.46.1776010887412;
        Sun, 12 Apr 2026 09:21:27 -0700 (PDT)
X-Received: by 2002:a05:622a:138b:b0:50b:4309:6c63 with SMTP id d75a77b69052e-50dd5c5ce1bmr164186071cf.46.1776010886952;
        Sun, 12 Apr 2026 09:21:26 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d531f229sm301286585e9.3.2026.04.12.09.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 09:21:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 18:21:05 +0200
Subject: [PATCH 3/6] arm64: defconfig: Drop default or selected drivers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-defconfig-v1-3-a46918286451@oss.qualcomm.com>
References: <20260412-defconfig-v1-0-a46918286451@oss.qualcomm.com>
In-Reply-To: <20260412-defconfig-v1-0-a46918286451@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3884;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pgAv0cSIx1zTjEIDdb10mLlKxfNT2wuMo6N8m/X1XEU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp28Z4l9NwFSy/s/Afe2RGttvFojfyGvJMt1vso
 fEzTEVQWlmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadvGeAAKCRDBN2bmhouD
 19grD/4jlMTVNlRDfCm0k4nXh/tX4RZvoVIfoWzpezlPBWtvZ0NQWdwRvjJnNmkV2C6Svtuverd
 UWr0K9yl+PZAhzV4yeqVOymOrRR8nvo0LwF8BkcDGe0CM1TiZUzmq92QA9lng/s98+c2QMSPtMP
 FWs6MEdefIZI/VcXiyndxvzsOaOy0Ha1xjUjjDorNH1EgmpqXz7HjKgrmOYv+LVo4EBE1lS8GUs
 YjJ0K5NM9lBOKXCE1EVBSG1O6GcJ9bC+32L3sxV1YvFOHT9m6CUlQ3fcV2RVpvSuUjok92UQr9b
 lk8WWaZsXWopzWbFTbNwKXAbYeCjjB+ArYinY2o6Xp4Z81tqXFIXJpQvzYIDK2IBwduhyNxmDMd
 AVRHeFyqw+ul+e1Rk8W5x55KDIUt3admX92Cd2jIs8A7NPg7yQJUYf4JTOynQKMEDAsuKgYODct
 NTfbO/7+a3fPMbfJ7aPMSeKevtSpOt2DdxvNBgscFqsxSMOswmABcpmgfMv+qxj3Sz4jz8j7DGZ
 Lwp8Qfwhc6zyoiTyPbkEU4rhcRNh1gj5TUChNkgpTDBX5mUiIXXPaYGtCZGk2oGRzs5WlhY3IzA
 g7BZY0IeKE7x/WNER2qsD5Pmh7+OgUFiEQcIoDgO24T+/Q0IKwnz/YR9MraxkvX1Q0ehmeEC8mP
 NjDw2asnhtOoUKg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: wiTcP13lWlL0vl2NhzDNEKq4rhAkpVFh
X-Authority-Analysis: v=2.4 cv=OpZ/DS/t c=1 sm=1 tr=0 ts=69dbc688 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=9vOstYy64hXmyjEA1s4A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: wiTcP13lWlL0vl2NhzDNEKq4rhAkpVFh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE1OSBTYWx0ZWRfX1yzMR7teJ4/e
 AXJYgKn8oc5+TpN+0JAICRj7+34Vf7ZLClLc1zK56TkHbPV2s5x4PBOG+FC//I+5/N894Fjhd6W
 gqo/bcYbDedYBZ6Ohw8x1o+rZXeQNkdURncQha5cska1hy2JpYXYR5dnRg6yD3mFWhXH5wteXPY
 rD87/fA+brJpNAfZtcD81ajF/szUdutgEd5ODv15x/ckthjE1bvVczylniGAWI7cHt8U6M6Fx1k
 2uUbrxjeXd4A6S+hkDhIO4AthWXpnx6JO2MnZEvVjZH4bCx5hv2tCwPjS/8hB5f8eLdKW7uhF2h
 mA4pTPS/LZszEAT4Gn+qqaTwe7lB8a1nQym37oVUW8kZ2PBNOe0hZxZnalhW83PzwQbH2Q+aMUu
 b7wUsXtML6QVppKAfx6/Gn77sBW885JYYuEYbLeKhFbjFT1oMZaL/y1wQDstrUofeocsYy91ckc
 B44suOnDMjW8jK2YFgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_092129_555500_2DA3C6F1 
X-CRM114-Status: GOOD (  12.08  )
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


