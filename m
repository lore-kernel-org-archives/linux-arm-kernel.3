Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DF1E937EF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 17:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EcDzNlIxPiZL0bdzdan7nhtA8ZUMs5VG9Gjq/1xDZdA=; b=VkQg2kqaom4RTFP4RmZ701XtvO
	bIYThJMYyj3jZxSZbut7A2JRN0zKpPuaqRf/aYUx6abIyYtxzf2qFhhQQTj00rBeZy1f4aAMbbZLi
	7+WzodUs7HxvbuB3Z/8a4V6XOljTDjdZRt54mrbz01aeG7SlO0ykkYQIZz1TfHqtkr2ZP1BZwojJW
	PaXC5I2NYjq0iRgiExclhbz6XcEeTdFKuewyGgfeH0j37RHjw/SCMLhCrogz+xO9mW3CPhAAfhD8T
	jERku0Mc06rEOpnLb0gOtMED9VbH6/JmEaNee/dFlhvhG39j6+vblznTNzM2/jcHAFqq9zK/IZCBU
	KtVb7g4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wByMo-0000000EWSQ-2HuY;
	Sun, 12 Apr 2026 17:13:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wByMm-0000000EWQY-05NS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 17:13:01 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE5OUe2533785
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 17:12:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EcDzNlIxPiZL0bdzdan7nhtA8ZUMs5VG9Gjq/1xDZdA=; b=jppQqfv/toEu7kEe
	AYpAuIUayMdyjsy+B5CNhsqcwtfFhYZEopBCP3B2DjQU6MF8TUJvaWNz3MS17PaV
	yhoeEfTYNikaWSA9LKn96yTc8IE8DeHVtgScRiqjzybLGp1h7Xw41zV6cILGB5Ff
	IG4RHq3KlBugp9/gG/MONvcer4DOX+dgLrkaGf6f2hFenCvnBCo/XVB1iXqrNG3O
	Il6PY+CcWmXtXmAAuxhJTova+fDaNj4DH4A9n2gSTncOmwmuJyNum3/ZKe6/5VDO
	xfDyFGSm9feC6cdNY+XJ1N2+fXO0FhNv0ndctjHVCEgGqPvO2WX988w65NKKIJGk
	rhU6HQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfeyytq2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 17:12:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50da529ff48so91149581cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 10:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776013979; x=1776618779; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EcDzNlIxPiZL0bdzdan7nhtA8ZUMs5VG9Gjq/1xDZdA=;
        b=ZhepIHlV0TGJUlylFqsDbX26FBEAZNb25Rtcote5BBa5Cx1tIgPzZgLik4Ev9/qI5N
         JGe7a2aStamhxBsaYcKTpLKP1JcZRYOT/A2JM0fijU8sxflwWzUVDGr8vESfvh/MDu/6
         WUb291hb8a+EfHPu+iefkTD7A5oBG6Ag7ruIb7K/xn23CW723KIgBjthy886B79OLiR4
         0cZ+zu/3ll8ZuN1/9WO/VkXjTSwwrP1HctVEtVJvgQMIXWV5CyljLyLSJQG4kRLaNjao
         yluhg2Sqrs2B3adKWyIweXmyK19lrl1pLapUzxnhK2PGx2h0nFLxN4vpbukabXAyx/3x
         d21w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776013979; x=1776618779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EcDzNlIxPiZL0bdzdan7nhtA8ZUMs5VG9Gjq/1xDZdA=;
        b=OUpwG76kjwnriKDTwvMa25CVPH8ombRJHIKf8xyz0r0py/jL9JEnsJ+DMPkEI6SIGC
         MzOc3F5W8xsYeuDBagdRSHvUlR66Ld37W7S3CuDIdtbNkFrVk1uW+vVwHns3rHwBah0D
         FHrdD2UsW77AFBqxYPwmKCp2YsGVjApvQBUQEyDbwfZ1eKzq88MCK9WLBw5BmpE+7Bck
         vepHJLWqV4KJzo2IhsUSj+36pWvWj0hG26O3QZBCrXuwwojaDw+soYXqEYjC+zvyVDv5
         BxPZDMNaCbuKoVN+hGwlM8OZyNeOt2Y66x9OhmH77QPJ4NOZ/yTX6y47zy1C/Ozna8Ny
         nCpw==
X-Forwarded-Encrypted: i=1; AJvYcCXxE3iRloO7WTDA14S7Bg0yz+Wyfong2Exv4y36gxKAA7R9rn18JvLkOFHw13QDDdgPKdocBZSWct5XArWLiO5R@lists.infradead.org
X-Gm-Message-State: AOJu0YzMO6plf2gTYXGTxrbkX5+/4m6IzXMHv4tpemjWKIT77VLnZyoO
	grhEiUyj6kqmI5CCBrR4CptdJDntc90xkKMVETDfjO/KlTFcDFJwA4s3aPWVYPrud/Qur2YvpCl
	uNQDiinMtL70FuCT6Fwaz6bdACjK+y1SSVmtTi8hU8rtXY0q4/Te6QuIhDBMRgc8ipzNJy78e2K
	zh/w==
X-Gm-Gg: AeBDietGQZnO7ozavC6BkkMTuWdBd8Boly5mcp2Nz6ki3swNfe6JuFt7GnwMQfvi2nb
	GixJYfbt+Pov9CJULf8ere+HulgDG9bwuaXsNBAwRbIH+Igj5BASY0JcqxdslWm/QpVVjp0WZSm
	VXHlV8ow3r/vTjhqRf6mVt3omJ3S08P0x5gWnGIKw+Vjox24HxaXI5uaChPrlyI6XYL4Ns26RRt
	c3zA/8EVVrTt4vreDuc7rs2C9upMo3Jg0EHNgOdNTfs7QpbdimGf/t9+SxGr+LOAzBk6X0psSuB
	K+64P13Va85ykaeXTDwc0ThPLIbnGsb/TwF4NbxETyuiw2dLLfok7NZvfds8bPZvZAPVjLzulwJ
	Q1xAQCi3hArDGyX6//M3LAmwnoB4gSWci2nAJsQ7+sQja
X-Received: by 2002:ac8:7e96:0:b0:509:18f4:6dba with SMTP id d75a77b69052e-50dd5c06e71mr166398581cf.62.1776013978561;
        Sun, 12 Apr 2026 10:12:58 -0700 (PDT)
X-Received: by 2002:ac8:7e96:0:b0:509:18f4:6dba with SMTP id d75a77b69052e-50dd5c06e71mr166397931cf.62.1776013978125;
        Sun, 12 Apr 2026 10:12:58 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de3499sm23715547f8f.1.2026.04.12.10.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 10:12:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 19:12:46 +0200
Subject: [PATCH 3/5] ARM: configs: Drop redundant SND_ATMEL_SOC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-b4-defconfig-multi-v7-v1-3-e76de035c2df@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3188;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=RV2PHCEC2W2QOfy1Y9Xpy/sCJdlSV1V6E9vi2fAesvI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp29KPevLw9vxMj22zUSSukW96/FY9RwLVpVOds
 SUeFeLtVnyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadvSjwAKCRDBN2bmhouD
 16udD/0bTYSk4YdtCF4T2ENunVxDwYoeOFE90kATLJil3r80Die8ZHP2C18dedZn6GXgI5YProH
 SebTpZ+MWTfexKIfFSo2cA0KvZfWnonteJ4k9EwStL7599/udBG/gCeb+ZPIEKqkwumipzDqr9P
 bsf3bSYXJEiPqhnamsWP9o9PUdLBQbnKbOziYfQ1jk5+qQERvMvEPX+oZ6VyRzf8j/AJtQDJAUV
 cgHQ7IU3LVgqCbEu6nR2qTqAP7B+O+JL5uphOZnuYC/sdLIJhX64ocUKhoDsu53zfpE7LVctAuO
 OdN8WVGgvIUQjrb7O3MF/2YRWAgMIPhi9Aq2fjkWfdfqFaqKZ5g9meoQOTCnHhnUKdNuBolfr47
 iLzHXRu/xanQO4CLd46zCq8afbI29UROmla40QupRBHuPh8IKDnBL0vKYaQglHoMB7SMktQ8Vxe
 9iXAqT4Jb1rSnWIcP0IhEQESy8VxFIw/vmLW8zxSnLQevVXvtLvscqIQUQIe30JnN8C41GOrMbC
 ebVybSKEbYjyR90n97xte0QtT/sx3zvRm3Wozy7SMXw88xJPff/8BbBqOh/EYm8vrtQItPSK78d
 69MoI5OJ8/HQPAhO34tMT4yh2jL14GHN24OWj4ahlEItZFQbksqzxcXK+i88vbNU8hXGapJbbag
 lBXZ0VA0sqcju0g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: PXqxU9D49WV9epfbCwtNvOgtT2slzpW3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE2NyBTYWx0ZWRfX8KTvVPJLGQf7
 w31RTFwbYFyTlqyk/Uis/2C58+ki+y/HoMnZ2gJSr5grIFZ7VVSvebJW1+afH0qPdGsQAbKOIPx
 Gz6Koov4ZlHoXIdB80UBRFc0laB1R2tTAGSSqaEcL+7lCRFuhD4uRR8KtwkcI8gL5rZN6daKIEW
 RD5D/QITT7y5fTPzawoLCkvlwfyl3ypIQGxjKx0DEdMVxR4jIsioEiHzzw+Fcdf6j7eVAA2cuaj
 9qq40MGBU8lpW3eED8FmHz0nCs3jRH8iwmumSiaMDGb3vU79jbz3nyUe31Vtc1ir0k7wFL9E+OQ
 Sbwsi0/FSlF3nG4vuvW9DWu9bNQkChJ+MhsBlfySH5/rolWrh8NhU9NeCxDb7LbgiU+z2uIdzV4
 02AFId6LXAZmmo6VaDDmcJ75lTvA07PjZp2FlAyXnSJ50Ck+Wkpvzr2ru5ilGimqDZ3pojk/+w1
 PiLdSN1820bU5ZudWHw==
X-Authority-Analysis: v=2.4 cv=FPQrAeos c=1 sm=1 tr=0 ts=69dbd29b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ZQtQTQ4zVFyU_Biz7KcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: PXqxU9D49WV9epfbCwtNvOgtT2slzpW3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_101300_068935_05147D0B 
X-CRM114-Status: GOOD (  11.06  )
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

CONFIG_SND_ATMEL_SOC is gone since commit 4f30f84feb77 ("ASoC: atmel:
Standardize ASoC menu") and can be simply dropped without effect.

No impact on include/generated/autoconf.h.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/configs/at91_dt_defconfig  | 1 -
 arch/arm/configs/multi_v5_defconfig | 1 -
 arch/arm/configs/multi_v7_defconfig | 1 -
 arch/arm/configs/pxa_defconfig      | 1 -
 arch/arm/configs/sama5_defconfig    | 1 -
 arch/arm/configs/sama7_defconfig    | 1 -
 6 files changed, 6 deletions(-)

diff --git a/arch/arm/configs/at91_dt_defconfig b/arch/arm/configs/at91_dt_defconfig
index 4f1153098b16..e331242dece7 100644
--- a/arch/arm/configs/at91_dt_defconfig
+++ b/arch/arm/configs/at91_dt_defconfig
@@ -155,7 +155,6 @@ CONFIG_LOGO=y
 CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_SOC=y
-CONFIG_SND_ATMEL_SOC=y
 CONFIG_SND_AT91_SOC_SAM9G20_WM8731=y
 CONFIG_SND_ATMEL_SOC_WM8904=y
 CONFIG_SND_AT91_SOC_SAM9X5_WM8731=y
diff --git a/arch/arm/configs/multi_v5_defconfig b/arch/arm/configs/multi_v5_defconfig
index 59b020e66a0b..d0aea907124d 100644
--- a/arch/arm/configs/multi_v5_defconfig
+++ b/arch/arm/configs/multi_v5_defconfig
@@ -186,7 +186,6 @@ CONFIG_BACKLIGHT_ATMEL_LCDC=y
 CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_SOC=y
-CONFIG_SND_ATMEL_SOC=y
 CONFIG_SND_AT91_SOC_SAM9G20_WM8731=m
 CONFIG_SND_ATMEL_SOC_WM8904=m
 CONFIG_SND_AT91_SOC_SAM9X5_WM8731=m
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 4f3d1fa99887..4032bf20625a 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -818,7 +818,6 @@ CONFIG_SND_HDA_CODEC_HDMI_NVIDIA=m
 CONFIG_SND_HDA_CODEC_HDMI_TEGRA=m
 CONFIG_SND_USB_AUDIO=m
 CONFIG_SND_SOC=m
-CONFIG_SND_ATMEL_SOC=m
 CONFIG_SND_ATMEL_SOC_WM8904=m
 CONFIG_SND_ATMEL_SOC_PDMIC=m
 CONFIG_SND_ATMEL_SOC_I2S=m
diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index 2d5f5dfe5af6..6bbf40d073ee 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -403,7 +403,6 @@ CONFIG_SND_DEBUG=y
 CONFIG_SND_SEQUENCER=m
 CONFIG_SND_USB_AUDIO=m
 CONFIG_SND_SOC=m
-CONFIG_SND_ATMEL_SOC=m
 CONFIG_SND_PXA2XX_SOC=m
 CONFIG_SND_PXA_SOC_SSP=m
 CONFIG_SND_PXA2XX_SOC_SPITZ=m
diff --git a/arch/arm/configs/sama5_defconfig b/arch/arm/configs/sama5_defconfig
index 2cad045e1d8d..bd7f0b5f7d66 100644
--- a/arch/arm/configs/sama5_defconfig
+++ b/arch/arm/configs/sama5_defconfig
@@ -168,7 +168,6 @@ CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_SOC=y
-CONFIG_SND_ATMEL_SOC=y
 CONFIG_SND_ATMEL_SOC_WM8904=y
 CONFIG_SND_ATMEL_SOC_CLASSD=y
 CONFIG_SND_ATMEL_SOC_PDMIC=y
diff --git a/arch/arm/configs/sama7_defconfig b/arch/arm/configs/sama7_defconfig
index e52f671ccec4..47abc56c40f5 100644
--- a/arch/arm/configs/sama7_defconfig
+++ b/arch/arm/configs/sama7_defconfig
@@ -159,7 +159,6 @@ CONFIG_BACKLIGHT_PWM=y
 CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_SOC=y
-CONFIG_SND_ATMEL_SOC=y
 CONFIG_SND_SOC_MIKROE_PROTO=m
 CONFIG_SND_MCHP_SOC_I2S_MCC=y
 CONFIG_SND_MCHP_SOC_SPDIFTX=y

-- 
2.51.0


