Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B16E937F2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 17:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aXtdqQ9gBJK0c2LGclVO5rctZAjxvI989BiAyPOViss=; b=tolVA+Qk+Ce+lisei85WqXaq2H
	2RIb1B2O5Qi7sPf5qQ7DTOxuyqWU1dicGHdQJzlfzB173CNa4R+B0CQm3VdBPM/WOd/f5hDdOx0Fs
	RXcOoSLSGfM1+uPRjRy2SJSYTuK6zFqe5aS+31UhXzScm4NyldEWREJyFSU3BAnfjUWnRYooVqI/T
	MrSfR7XRA6TbIqpGjybvINWiNgr2BiSpi71m7lNff7N2Id5bf5FYmvhLWIdUQSNbuRLg2uY7GM1yl
	oTD7MJMob6Nce3p7Bah0FlkZYkqPAcLI+t+DxfTyONIS1iXpGQYrKABdFSEKFXk/V8clMrzYBjLLy
	e+Gc3Evw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wByMs-0000000EWUR-1YDY;
	Sun, 12 Apr 2026 17:13:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wByMo-0000000EWRq-0Wyt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 17:13:03 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE61vF2785889
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 17:13:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aXtdqQ9gBJK0c2LGclVO5rctZAjxvI989BiAyPOViss=; b=n5QjAkl2eGuF4aMU
	THc4x98CWOeQms/N6j+C0gVH9iUdWDXJtfuM60xxQHWHrFB73A+H/6kUKP1cgqL1
	byurZ78hLpVUui769k6lDOMCCHWC/F4U+8TpSP3FqJoDy5xDRL3JY0AfX9p9lJ/I
	6Ep82VeWb8luHgSycf0X9/ag2IGxT6JQNMLv34r05RNJeZOJwn4Uddtyf51R6kWk
	3EN64zcRLh80NYFd+qr+OybKCUbV9S1YcEps6v6UaNRGiRB/Bz6sTjj+hIZvAdOL
	dUGeRhJPnBKM8YFD1f0fQRW5q4K21TKC5euTIHB9vI4hEpBBm5q2ysvwwDWJoHIx
	cWQOCQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfjbpad9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 17:13:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8e4c29caso91547701cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 10:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776013980; x=1776618780; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aXtdqQ9gBJK0c2LGclVO5rctZAjxvI989BiAyPOViss=;
        b=WnVSj89RRMxzsj7osCebqjUta+z/MUMHCHdSJqfBUuUyWhCTacfNSj4jT8Ss++OyST
         CHyQwSjhUlDiScBDmVD4ksW4kH6oHmRiuENiHLf4iDH9rj2Gv9z0ykeJd8R5bevVqu/2
         9HSlTWugb9HPSmmCp2M7C1XGwgu9fFs4m8eYs0lkmW28od9aHHiaptDRo4cf+nGX6HT6
         yUAC2uoz2W/JwplwJ/+lqUeox9SQ1Nq0sj8P+l+BD2EmWh4xsnxN2mNjG0e+/IS5ECU4
         MMmbn0WNX5kiNfyiyoMJqj2E91KRf+oYPIJsM13CeWebT1oGYPEH3SKnbpVP+SM2y0AD
         dZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776013980; x=1776618780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aXtdqQ9gBJK0c2LGclVO5rctZAjxvI989BiAyPOViss=;
        b=pl0CEzjQ3kALDRCR507wHghlncfIuFMGhmf7+S14rQUTJYimTZeGCAar2Ix99zWlLR
         BFvW9hngT9RVQ1EHNal2FIPg6J/Mm5WyLKEEi9mjPlL6BoWwRGdk2X4jKHCI0wi73wen
         ckg3vX4ziboJEzTrv0U2j7HU+9GmsrnLUOJMcQlazXs4bNGJQzSnrvQn/Qg09ysrPvuf
         3+IHjx1esIhP2D1W2MHd1b9ZQerEOlWnNaNevaizIM0uV50hOc3JjZX6n5IrG9Y+Dxkx
         0p+HtL9w7L1GiO/Ds0B40VEJDkmYGibTsjYHJEubM64jdCKI0xa+OmJYQxSet3icoDdy
         Kh5A==
X-Forwarded-Encrypted: i=1; AJvYcCWDqxSt6qlC4gNez9eDH/f+yeKp0dLegy9WkYqoMuhXgI0wCPvwZnK6zN9t8ubZld8FhZhL2NwtpFcipTqGmT3p@lists.infradead.org
X-Gm-Message-State: AOJu0YzDw/U7xzU3zUrZLGzMFITxtdReOxvTAwPREOio43uGlI2MT71D
	JE38PSIz85+waX/IBbk5MTLjzVAps9eDL8QUp8LQCQkT3bUdRfNWJVxIbQVhci21dulO/LTSxH8
	It3rJLJXx+WRfUhxogWQM9wWLrzcnqfpPBzqKlvAqH/yK758+8RXd3ilbd33Sae/dbYofbol/7z
	G0OH4h17UaVQ==
X-Gm-Gg: AeBDievuIQ1mRIk3k3hKfEws0y0b4tyMCGgoT6X5STXFOkvzva8ScQBmD+xlz1Z7STB
	eQz1jiDVG1P0FnfO1P78TXb2Rlnj3Qs5bylxWoZL5YFGZ45mN6bLluPXHUO1gPe8rRQVeza3MJg
	zZ2z6/n+8qg3fnyIcvRXNjlbv9I7Y+inmKO75TOfzwNhkjEwXKMZ1dtarU+2OvgfbqUR76RG8dA
	9YmIUmIp5fp0kKZ1qweUraUQaZQgnX+jNXbjiL3+AKW0bsOFLvRgiN/sKr1bCzCKIlkk0y9LE0l
	ZkGcyylell8eIvVy4vaPNIDOizxpQXFKTk2OMgIfJ0szAiE0+u+CHHgPD862Vd8c9CS5oH111cn
	8ttVJOEQyEh6mS6aDaUg1L95Dzi9D7hBiOe27V/aThWUL
X-Received: by 2002:a05:622a:4a88:b0:50d:8cad:2381 with SMTP id d75a77b69052e-50dd5cae418mr158228381cf.54.1776013980556;
        Sun, 12 Apr 2026 10:13:00 -0700 (PDT)
X-Received: by 2002:a05:622a:4a88:b0:50d:8cad:2381 with SMTP id d75a77b69052e-50dd5cae418mr158227991cf.54.1776013980110;
        Sun, 12 Apr 2026 10:13:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de3499sm23715547f8f.1.2026.04.12.10.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 10:12:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 19:12:47 +0200
Subject: [PATCH 4/5] ARM: multi_v7_defconfig: Cleanup redundant options
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-b4-defconfig-multi-v7-v1-4-e76de035c2df@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2464;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gS3gQyTEEQDQLw3eknJCWE0NanahznRn/PqRqyF5SDU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp29KQQMj2gHAhKkq4zJa9tmDi0mYIFjdxv+UKa
 PPbjiMWSu6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadvSkAAKCRDBN2bmhouD
 1y6JD/47abvJ/C0j6buMufC7kTBHw4zcaMSiH11DLR4cAeZNZYYdzzkh8PDkEfLOFkZI4GAZXxV
 oa2K5RJ5u/0kPU0cDbgYiLH32Ck4zU/jo7u3EatmzPq7N7W+puLroX/B8vKPMChlucTi2qMlSZL
 KqCgMMPX4PmoR7BRr+5Ynb2xFZf1CwmKYHtB2O7T0Gtm0o77XZvSeRcl51FPhbNVMA0pMC81ubw
 /OvlsJ90+d00cGtAvpy80uPG78EtA1xptpx/bQlK+Fc8cNB8eJNzE5uinGeZclUU9jTk4zdMK7i
 /FaHDD7fvEPZB9LQt9rpA8j4JtnPFWbnRRoPobXBMXC1e6YPkxJPFH2bs8w7ubFLCC4L6Clm9Gy
 y371myM5cHA3+pjIgblBkqxXQOSEKUd4ZLooEXdXkxcRbb8CQJ9Cy/FmiyqiB8QArfRnSDkqcU8
 joVu7DSQkcW96ory3QuCFslvUMRVcFWejEUPFXOgNBe5yrHrnqRljXSVpLLh+vHOy71sn1gfnMb
 cyvDmzeRT+2mdQTfJetXKDTNzX+1WDb40vCBon/fkiNSvyBo7zKWRyyZV08mpq5lBagp+Q1GijN
 aiblBLclJ9YxQ+i6ek2FFQnVcw+kPvSwcF/WzCVtnQVnb4fkEJt02IPy5V9Vvl+MgxSz4z5t3s9
 M1xMLaT/csXybTg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=PuijqQM3 c=1 sm=1 tr=0 ts=69dbd29d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=9NBflued9iuJHBMiackA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: hrOvtIuzWaGsA_aa1BpbC6AgYkW2uheP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE2NyBTYWx0ZWRfX0S2xVoVRXu28
 u95U3ni9OnCNDGp5AXznrBrTKBvBtJ86rf/pEwqhAxQjbaqdva8/jEZeELghxaG4kRrvTL+vD7W
 3VIX2ZeOJhm5O/hzomot9O+xfX/us+0f8yHIxPULCLY9ybDMGHqoGSPxD7sCZJXiASyndx7n0Bl
 P6r9FBf0K0xM82QtN5z2W393rDECrVVw2AgTTuP06Lsm2pognvdtptrC88ND7+BwVFNhPIw6/n2
 33NVxj4aU8yWxAHTTWDe8LkWlW7iGAkZJpkK5VXV+L1sMmluNFR1Jxj4JJKpvOW6VtgLThcAM7R
 jnehP0T5D3OUyr+E0CUbzOrZD0iFtA++4i1MD9XOwMVV2ydzpkb5Euj7nZ9It2UjgaoYVmhG+il
 1ZIaU7CwyLmVsxtfL4ARhmFvJdKU3d4cG0zI7wDf+ysHk4RMQ+osaX5m6CtIOfQ8K0uRSIQAUE+
 MEczJ4M1hrTLQBboZ8Q==
X-Proofpoint-GUID: hrOvtIuzWaGsA_aa1BpbC6AgYkW2uheP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_101302_176006_A1E9FF58 
X-CRM114-Status: GOOD (  11.48  )
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

Drop all redundant entries:
1. SERIAL_BCM63XX is default=y for ARCH_BCMBCA.
2. USB_GPIO_VBUS is conflicting with enabled USB_CONN_GPIO since
   commit 0ce0f9d0785a ("usb: phy: phy-gpio-vbus-usb: Add device tree
   probing").
3. SND_HDA_CODEC_REALTEK_LIB is selected by other codecs,
   SND_HDA_CODEC_ALC269 by default.
4. SND_PXA_SOC_SSP depends on ARCH_PXA which is only for multi v5.
5. SND_SOC_ROCKCHIP is gone since commit cae3cc435db5 ("ASoC: rockchip:
   Standardize ASoC menu") and can be simply dropped without effect.
6. SND_SOC_TLV320AIC32X4 is selected by SND_SOC_TLV320AIC32X4_I2C/SPI.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/configs/multi_v7_defconfig | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 4032bf20625a..520e2dea77f2 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -387,7 +387,6 @@ CONFIG_SERIAL_MSM=y
 CONFIG_SERIAL_MSM_CONSOLE=y
 CONFIG_SERIAL_VT8500=y
 CONFIG_SERIAL_VT8500_CONSOLE=y
-CONFIG_SERIAL_BCM63XX=y
 CONFIG_SERIAL_BCM63XX_CONSOLE=y
 CONFIG_SERIAL_XILINX_PS_UART=y
 CONFIG_SERIAL_XILINX_PS_UART_CONSOLE=y
@@ -810,8 +809,6 @@ CONFIG_SND_HDA_INPUT_BEEP=y
 CONFIG_SND_HDA_PATCH_LOADER=y
 CONFIG_SND_HDA_TEGRA=m
 CONFIG_SND_HDA_CODEC_REALTEK=m
-CONFIG_SND_HDA_CODEC_REALTEK_LIB=m
-CONFIG_SND_HDA_CODEC_ALC269=m
 CONFIG_SND_HDA_CODEC_HDMI=m
 CONFIG_SND_HDA_CODEC_HDMI_GENERIC=m
 CONFIG_SND_HDA_CODEC_HDMI_NVIDIA=m
@@ -824,12 +821,10 @@ CONFIG_SND_ATMEL_SOC_I2S=m
 CONFIG_SND_BCM2835_SOC_I2S=m
 CONFIG_SND_IMX_SOC=m
 CONFIG_SND_SOC_FSL_ASOC_CARD=m
-CONFIG_SND_PXA_SOC_SSP=m
 CONFIG_SND_MMP_SOC_SSPA=m
 CONFIG_SND_PXA910_SOC=m
 CONFIG_SND_SOC_QCOM=m
 CONFIG_SND_SOC_APQ8016_SBC=m
-CONFIG_SND_SOC_ROCKCHIP=m
 CONFIG_SND_SOC_SH4_FSI=m
 CONFIG_SND_SOC_RCAR=m
 CONFIG_SND_SOC_ROCKCHIP_SPDIF=m
@@ -871,7 +866,6 @@ CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
 CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
 CONFIG_SND_SOC_SGTL5000=m
 CONFIG_SND_SOC_STI_SAS=m
-CONFIG_SND_SOC_TLV320AIC32X4=m
 CONFIG_SND_SOC_TLV320AIC32X4_I2C=m
 CONFIG_SND_SOC_TLV320AIC3X_I2C=m
 CONFIG_SND_SOC_WM8960=m
@@ -931,7 +925,6 @@ CONFIG_KEYSTONE_USB_PHY=m
 CONFIG_NOP_USB_XCEIV=y
 CONFIG_AM335X_PHY_USB=m
 CONFIG_TWL6030_USB=m
-CONFIG_USB_GPIO_VBUS=y
 CONFIG_USB_ISP1301=y
 CONFIG_USB_MXS_PHY=y
 CONFIG_USB_GADGET=y

-- 
2.51.0


