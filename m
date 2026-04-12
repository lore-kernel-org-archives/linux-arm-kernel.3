Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E91E937EF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 17:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pmWYTgynkvgBD+uM77KEXQPDTogdgg03IqQ5cV8AE9w=; b=D1Z92RlCn62fmbZWuT9D4nKRiD
	xqi6Za9QmU5kqK5cJgGOCiTplYY0aZNyKH+3WqikJTYxWymWifeuUAtXMskOBjTlgJLFkPMr2YLKy
	7DI2fpr8NEw/tOwBS5yDLtg6yBL4N1vCEVH5Rvr8joidtc68MBW5mYrffeOya8SC+3XGJqta1mQHF
	o/t5YUK700vygfG5SvVsnkqCQMSB3YWoHnYfo8a6UUUEdokq4KOnxcb8n+s0tIDcD7BfPSn1YHuDO
	xj8FJ2Aqfq9tkR5f3TNpXLkImXjX/fLIKlZU4O5f8YbkU1/3bZPt41EbIVBknVWUaILsEfd08ikYt
	tj2DY7jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wByMk-0000000EWQA-3qMv;
	Sun, 12 Apr 2026 17:12:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wByMh-0000000EWOq-3m74
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 17:12:57 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE4cY43560487
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 17:12:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pmWYTgynkvgBD+uM77KEXQPDTogdgg03IqQ5cV8AE9w=; b=CaX2YV+AWf7cr90j
	n4IjQpL7i0qqwrwGGBIVM7OZ3hdSocvRmXicGajkRqv/VtKDexIv03dqY8yHeZLe
	zYmncyV0kLQ04NCACfhaRzaHSxv57Zq/9lPMcsL1fr4zHPK1e9z9Z4o1k1uw2cu/
	oy2Tybq7RgYOeUHop3rDyrVZl4DdWOe6c56788C8ZDrBzKSIdbQ7tQu4wAsO+vQI
	FxIgSoLa1uTkvO165Anq83W+k3ON+GC8H/fctWFmtUqGJJgJSnYdJCXJAKn1whn9
	+13HVGPlLodS1pyn6/79/bf1pBQxvwJJFi9bx0J0Rl957EArM6nsW9hhArqyFi7L
	maYzFA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffb0jphu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 17:12:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4076dc16so70005461cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 10:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776013974; x=1776618774; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pmWYTgynkvgBD+uM77KEXQPDTogdgg03IqQ5cV8AE9w=;
        b=czLHh4FWTFcF3lNNydJ4rAOCwQilOgm957wEUflRTlvztx5eoYTYwo2J3I/uNBHuMK
         HNP/yghHiFqo5H4Ldcm5YXbdvu7QwvvXtmr5kFAgkLwwHwyoDaJe5Ycbv4N5Mb2LICqX
         HxMnDAOO7ZZ4cmUVih+hnR80wYyn2nmj4AU1PjGacihVPEVr2QH2iAOL1F8MG3gEeTAk
         HYPDfIwlNZzXHuvWFux3x/CVUoqIrxpzp5O/hvIsqF9aRPg80qXb6ziWRJomq50pjCYj
         6RwJ3H4nLndFm5oz6hF8HrRi3f3XAeWCuhM4MQbRuMzhzDuc5GAtIuPPrQmFpTQRalmc
         1RGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776013974; x=1776618774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pmWYTgynkvgBD+uM77KEXQPDTogdgg03IqQ5cV8AE9w=;
        b=EvCY0CUc3tCgNwhLWqKGaK/3gRcB6u2zb8EpNBJwR3jw7ki6Maio6im2EdIAWtPkTf
         phktoKSORSM3JsUw6htNA0wWVbeZ8nAkkjLRkt1csbqXov0LphT77Z1th6ZOkRY3IGb5
         f1jqPFOAC7x193DHMCLQdFgi1LjlQ2t387OLuAf/ktUElrsmlzAfBwTD8vfS5xprJea/
         Zo3cxocUN8lXf396CGO8jm6XfU+aIZtoHPgYUfGVVga1cFz9832C7xbKIz5CKmudpJlC
         0mhrVuEv0AblKJG7ZxjIw7IRqITQ3KDtl9jXckEyDCuSE4KHAdvhfgkK9Z4V5ReExi9h
         hNqw==
X-Forwarded-Encrypted: i=1; AJvYcCUdjcK4+JloIonoH0OkvKsCoc+inGQ4jEjijtWyWo9+qBVo6Ug5HMAaPttNIkSBXjn80MepnOvAgIiMUQNMbG2T@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx272ydGcRZYMpkEkbFpXEk1uE2rpj7O7nURTzDwpcsiC+zw7+
	7z4hBfoPTHXldVT60P8d62AnrSdomrnoB/o60qkSspQ/9GCvf38z4QDq2s/4O7la195cCJBnNxV
	iFV3p3fsaP0Gb88lr5h48keEHgA0xhKTvbUfEJNjb2cLwBgI3EUpKtYa7N/0A9IJ9S9VeFfPoKE
	UKFA==
X-Gm-Gg: AeBDieuwQuV/1hiTBnT7ulUjJDATV/SrWtOcd0szEQKuqxx8HWe3F2SJIExN4w3IIxG
	kGsLH1PlP8oEVnsZRRN07XiotSofbuajmg2JAMQ9rDkk1qKS2BgIRI6B4uJtYhGD+yppts8xom0
	aGflOf906Tg25fFeq1O4WnN7BKNWLAh0ZUqa44Q/lC4ZIdUbW/WoYVxadulROi2+R0DGaRl32yy
	VET0sPKU5FAEL1juALb6NkqgrQi8l+3P+4R5iTlKw+5pcLAfqAbgr5y43hhswTOq5KLRY4ODzxL
	kphI2bhfQ4o17DRVXRIA3nvXDUDAbGaynLZDmRhhjoNGBNvFxvwMZT9KfEenQFqpcCyEIBeYupd
	Fw+B9NjjXK++8A/kjSTKHktVNmJKsDpAaIUe3ID91n6JM
X-Received: by 2002:a05:622a:250a:b0:50b:6b21:2bf7 with SMTP id d75a77b69052e-50dd5a44875mr159814011cf.0.1776013974387;
        Sun, 12 Apr 2026 10:12:54 -0700 (PDT)
X-Received: by 2002:a05:622a:250a:b0:50b:6b21:2bf7 with SMTP id d75a77b69052e-50dd5a44875mr159813671cf.0.1776013973997;
        Sun, 12 Apr 2026 10:12:53 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de3499sm23715547f8f.1.2026.04.12.10.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 10:12:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 19:12:44 +0200
Subject: [PATCH 1/5] ARM: multi_v7_defconfig: Move entries to match
 savedefconfig
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-b4-defconfig-multi-v7-v1-1-e76de035c2df@oss.qualcomm.com>
References: <20260412-b4-defconfig-multi-v7-v1-0-e76de035c2df@oss.qualcomm.com>
In-Reply-To: <20260412-b4-defconfig-multi-v7-v1-0-e76de035c2df@oss.qualcomm.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3806;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YV3YfCEMXg/5PND6vVExXVVeEAoJHpkm1JRVpD4pXyk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp29KOqLrYx0npCq6gwpwF2lTOgGsbgP/31ghaw
 E6eVAzbGdiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadvSjgAKCRDBN2bmhouD
 11DyEACUql4jcZA1f03hJCGBKd2/QaO8Lsp3pfN0Y9n4Fa4+YOlrZQPo/ocbQgIyeAskROqqwDT
 kN9NftU8St6U7BjNmdI9inAGSj1tFf2bbExZFmgjFK87XqLMN/RpQb7NELew0dbjBpjGSVP82Ja
 uzdH6vgMSzStwHQUEa3tN48ZFZHEIufBHxe556qFjKOwKtlXvdnJTMxcrX+rir2XPGbT1dVKxEa
 bHzwd37EiT7VymCR99Fj83EMYwnXZei3pRe0DRr4Kr+rRRBSqNXcc+7aBIxlOIr2CuI4zXxraYp
 Gca+OD8qRWwX4Qd+5i2JW88q+URmLaCh8ragxeu9puMztl7+XTeD5hNGLczpANRDdmpPgl7qnN9
 buv3j1Y0TJaaSD6nn82Ep7AN3okLHFZYz53uUK9QL20PyARVSJWSCCSW4TlW+DSDgrglcm7G7hv
 BtP9z17m67fZxL6SnFfyn2prLOfwWvsCHaVzJQlk2q73yvVBOPVY7YZCcSUKY7LcjRqx4192RfN
 JIhIxCx8T77oZI7naeoZXYIa8OxuLWTuJ/pK17DpEx0Kh5+Nfp1fEBlCqQl/emVXQHYjVah/jlj
 NXzSZCSyzxaWM8VPE1KWbM5DT2LvkDk4gVzORl/U1ZhKoHMT6f8ceqGm06/FOVqoOCkack+2yOD
 guMcBteMNhFCTVg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=YfmNIQRf c=1 sm=1 tr=0 ts=69dbd297 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=2ShsH9uPjTmnt004chwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE2OCBTYWx0ZWRfX+KPzH3sHJk5V
 NFzvdAd9O36L1XY/Vnnk8gNKKrlTrDYfI+fXM0pWorlkbcG2577otZSn2H8/cMNXyiEbSQzXw8T
 WGaVbSBmwF3cNAYjN9JfUMovUks7Gzjyr2czQ9VpBP/yk12q2fn9eaz+06l6JJwDspxWmhh2cCE
 uPSYtow8K5M0EJjri9XiTHMgXRyaaVT1Eqs4AG/YbXnKHlDx0ufX5ztJuU8UCY8eG1PMMCbz5Fh
 xR96L8r04u9pSOSMIl1LPGmC8eX3JIRit8+5xYyF5W/eVKNMw4AAzybvUA3CXYiIpt5ZadNhgY7
 F6xtcRsGgal5DkNkQLpbcKc5GNtTTgPq4JPn0lgBkHaX+TgZkb3aCehSK2ZJbDFMcUFIOewGy/l
 fNcoGIxOGduZT77t7Z4ksglvj8/NEaSbAV7+uS3bxyQjI+3iTArx3rbVJJDthwtWWborHakdjvG
 xkmOp6p8C3DT/2aI6qQ==
X-Proofpoint-ORIG-GUID: z8Ml-fnsrudwyfqOeL6dm1m6H4n_GnsB
X-Proofpoint-GUID: z8Ml-fnsrudwyfqOeL6dm1m6H4n_GnsB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_101256_765796_170CF943 
X-CRM114-Status: GOOD (  13.02  )
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

Only re-shuffle entries to match savedefconfig, without removing any
symbols.  This helps in reviewing defconfig when comparing with
savedefconfig and looking for obsolete symbols.  No impact on
include/generated/autoconf.h.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/configs/multi_v7_defconfig | 82 ++++++++++++++++++-------------------
 1 file changed, 41 insertions(+), 41 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index bcc9aabc1202..c477454a4694 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -360,9 +360,9 @@ CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_NR_UARTS=5
 CONFIG_SERIAL_8250_RUNTIME_UARTS=5
 CONFIG_SERIAL_8250_EXTENDED=y
+CONFIG_SERIAL_8250_SHARE_IRQ=y
 CONFIG_SERIAL_8250_MANY_PORTS=y
 CONFIG_SERIAL_8250_ASPEED_VUART=m
-CONFIG_SERIAL_8250_SHARE_IRQ=y
 CONFIG_SERIAL_8250_BCM2835AUX=y
 CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_8250_EM=y
@@ -731,40 +731,8 @@ CONFIG_VIDEO_ADV7604_CEC=y
 CONFIG_VIDEO_ML86V7667=m
 CONFIG_IMX_IPUV3_CORE=m
 CONFIG_DRM=y
-CONFIG_DRM_NOUVEAU=m
-# CONFIG_DRM_NOUVEAU_CH7006 is not set
-# CONFIG_DRM_NOUVEAU_SIL164 is not set
-CONFIG_DRM_EXYNOS=m
-CONFIG_DRM_EXYNOS_FIMD=y
-CONFIG_DRM_EXYNOS_MIXER=y
-CONFIG_DRM_EXYNOS_DPI=y
-CONFIG_DRM_EXYNOS_DSI=y
-CONFIG_DRM_EXYNOS_HDMI=y
-CONFIG_DRM_ROCKCHIP=m
-CONFIG_ROCKCHIP_ANALOGIX_DP=y
-CONFIG_ROCKCHIP_DW_HDMI=y
-CONFIG_ROCKCHIP_DW_MIPI_DSI=y
-CONFIG_ROCKCHIP_INNO_HDMI=y
+CONFIG_DRM_ASPEED_GFX=m
 CONFIG_DRM_ATMEL_HLCDC=m
-CONFIG_DRM_RCAR_DU=m
-CONFIG_DRM_SUN4I=m
-CONFIG_DRM_OMAP=m
-CONFIG_OMAP5_DSS_HDMI=y
-CONFIG_DRM_TILCDC=m
-CONFIG_DRM_MSM=m
-CONFIG_DRM_FSL_DCU=m
-CONFIG_DRM_TEGRA=y
-CONFIG_DRM_STM=m
-CONFIG_DRM_STM_DSI=m
-CONFIG_DRM_PANEL_LVDS=m
-CONFIG_DRM_PANEL_ORISETECH_OTM8009A=m
-CONFIG_DRM_PANEL_RAYDIUM_RM68200=m
-CONFIG_DRM_PANEL_SAMSUNG_LD9040=m
-CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03=m
-CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0=m
-CONFIG_DRM_PANEL_SHARP_LQ101R1SX01=m
-CONFIG_DRM_PANEL_EDP=y
-CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_DISPLAY_CONNECTOR=m
 CONFIG_DRM_I2C_NXP_TDA998X=m
 CONFIG_DRM_ITE_IT66121=m
@@ -780,20 +748,52 @@ CONFIG_DRM_TI_TFP410=m
 CONFIG_DRM_TI_TPD12S015=m
 CONFIG_DRM_I2C_ADV7511=m
 CONFIG_DRM_I2C_ADV7511_AUDIO=y
-CONFIG_DRM_STI=m
+CONFIG_DRM_ETNAVIV=m
+CONFIG_DRM_EXYNOS=m
+CONFIG_DRM_EXYNOS_FIMD=y
+CONFIG_DRM_EXYNOS_MIXER=y
+CONFIG_DRM_EXYNOS_DPI=y
+CONFIG_DRM_EXYNOS_DSI=y
+CONFIG_DRM_EXYNOS_HDMI=y
+CONFIG_DRM_FSL_DCU=m
 CONFIG_DRM_IMX=m
 CONFIG_DRM_IMX_PARALLEL_DISPLAY=m
 CONFIG_DRM_IMX_TVE=m
 CONFIG_DRM_IMX_LDB=m
 CONFIG_DRM_IMX_HDMI=m
+CONFIG_DRM_LIMA=m
+CONFIG_DRM_MSM=m
+CONFIG_DRM_MXSFB=m
+CONFIG_DRM_NOUVEAU=m
+# CONFIG_DRM_NOUVEAU_CH7006 is not set
+# CONFIG_DRM_NOUVEAU_SIL164 is not set
+CONFIG_DRM_OMAP=m
+CONFIG_OMAP5_DSS_HDMI=y
+CONFIG_DRM_PANEL_LVDS=m
+CONFIG_DRM_PANEL_ORISETECH_OTM8009A=m
+CONFIG_DRM_PANEL_RAYDIUM_RM68200=m
+CONFIG_DRM_PANEL_SAMSUNG_LD9040=m
+CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03=m
+CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0=m
+CONFIG_DRM_PANEL_SHARP_LQ101R1SX01=m
+CONFIG_DRM_PANEL_EDP=y
+CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_PANFROST=m
+CONFIG_DRM_PL111=m
+CONFIG_DRM_RCAR_DU=m
+CONFIG_DRM_ROCKCHIP=m
+CONFIG_ROCKCHIP_ANALOGIX_DP=y
+CONFIG_ROCKCHIP_DW_HDMI=y
+CONFIG_ROCKCHIP_DW_MIPI_DSI=y
+CONFIG_ROCKCHIP_INNO_HDMI=y
+CONFIG_DRM_STI=m
+CONFIG_DRM_STM=m
+CONFIG_DRM_STM_DSI=m
+CONFIG_DRM_SUN4I=m
+CONFIG_DRM_TEGRA=y
+CONFIG_DRM_TILCDC=m
 CONFIG_DRM_V3D=m
 CONFIG_DRM_VC4=m
-CONFIG_DRM_ETNAVIV=m
-CONFIG_DRM_MXSFB=m
-CONFIG_DRM_PL111=m
-CONFIG_DRM_LIMA=m
-CONFIG_DRM_PANFROST=m
-CONFIG_DRM_ASPEED_GFX=m
 CONFIG_FB=y
 CONFIG_FB_EFI=y
 CONFIG_FB_WM8505=y

-- 
2.51.0


