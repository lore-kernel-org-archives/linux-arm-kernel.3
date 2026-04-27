Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68696FF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 10:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZwZxR5amoXAOmwTJ88OLojORvzs3WOM8khIGdJcZejU=; b=u85WQWgroJFCm6jZweAQLjksHJ
	vgOxUKvsmQoFINABaOwpoeGGjfuNAOcjFo6zzcWDCqI9oo91GjoSMBVzeZZ730HXufJdRt7WnoeBj
	/MNE1X/wnNn+UXQyCVCVjYz1Q1cooZcpuYB5Qk9zB+tvqQf5Vlhp0c5M8MNZwvvamrlyQyu/A287+
	8XuNoTrFC7jH+SGcBxHDG9dUb1012T5Xr9oOCf5eFgXliZwD9UNV8gXKn/U+VaiPVupkEGUVIQmZT
	e3cP2j8GqSDYlgc3w4tjavT8wz0+xw5bR9rkIgafOXA4YS8mNo1alauhNTgBHqequG+VWdUCFVwCn
	mwj8Co1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHIzT-0000000GfTM-1luD;
	Mon, 27 Apr 2026 10:14:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHIzR-0000000GfSA-0IWl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 10:14:58 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8T8Sm2913809
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 10:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZwZxR5amoXAOmwTJ88OLojORvzs3WOM8khIGdJcZejU=; b=mYQiikmd+JD3Y2De
	sHT52q5kJSomDebXtiRX8Zv2hd09IZ2WswwarsyikmJ+AcvhgeLL3cSAAe0cN8XI
	ZXQraLrPEaTBqgucF8TDM1Hvy2bsWdTkOUxinJ2VlQSqnCdBddOMrsfH2glYpUht
	FDnJRqjCow3VCFM6tn6Xg9C0AMse52655JOzssnByoL+LldobTaA80Bwzm12xQ3t
	Qc5iLs1o6Bz61+kgbrAxaVoSBQYKqp7XJybM3vknQxuXvvzKCClxtO0rjWL75b39
	qcQjzaQs62pSPH5KObJKNAvkLUf2yRe0slVTk7Tj3mlsBeF3rwVXA3RJzSvDEawG
	1eDMTg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt26xh05g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 10:14:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b220c72bbso251199981cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 03:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777284895; x=1777889695; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZwZxR5amoXAOmwTJ88OLojORvzs3WOM8khIGdJcZejU=;
        b=R2cU46kMCbwpxocVtTFLsHp+LbWPmqX1HHCTGHPNS05CVl1TY7lRy+Ept4tH3Tk3zN
         xFG1IIj5OwYpXmvKIX55ydgIZs2rE7i7uxPukpUOkX/0CD+7+BDyKY07VsKexAuumIxv
         zl0CbsvYldDIkNypT1vvfwpYSNwb+g7LDLec56+cBlOofoFPEqswgKZD9LUchDA1sYlk
         eBbXU1P81H7kFXizlnFBRYaptDEsiim1lgcxNY+LDpizflbECv3JMU84zR944pX/1ycV
         JQ3cuyIllB4bFca+snlqFSqeoFJ7/ZldqZtS2Zj8/lptsI5qowU62tk8Z6WXZiUZ0N+9
         XAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284895; x=1777889695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZwZxR5amoXAOmwTJ88OLojORvzs3WOM8khIGdJcZejU=;
        b=mXY7zSkS/MUu8uEq3Xnhs/s1nvKwx9XTWhf5K+6D9fRsMJwqCRtJSTRqKPvjueqhck
         ORjlmraXXVz0hSju2godAVej2+zuhwpbcql3nrdOmCIuKVA5mZmjUy7J7DZINJErzjrx
         sE8crPm39B4afNt2Y7R8L8yF8/DeP+1bClP8NxqaPOc22Oj02JXFLsY/xUwk8lG9pCB3
         7Go4kxTJCAV2YqiYhewgHp8biI1jXlCrG3J00nGkikwEA23mCxDVHFzx05fGad4/yk4f
         m7bBi5zZldfi0+LH074HkYGaPuIqOvcpg9a6bTtMCC9RaqKauj+05TfasGjml/Qs0XxJ
         Tg3A==
X-Forwarded-Encrypted: i=1; AFNElJ+xw5lBDvNQpRQsb4Ehy/fcLlzcXPXhHEDpAgSVgzm2a/uTF5IvQ4g3yXZkBO+ScokPOtGcAOzmCUY9LOADALyi@lists.infradead.org
X-Gm-Message-State: AOJu0Yyvs71INbkeTOD9fblfWGTp8edBZZprHbcaa9YuYwoQ9S7Zfz10
	M/cEaMuaK/JUKELM6K97a5S1qp1PGMMgai61GklbMYV6k9AFYY6VdmVY+6GfZqIl5fpyswDfw3h
	JOitewWQX6GoQR+FMRz2iMkTb+6hjkk9ZUfhysVypdMfegcmMI8v0X4IWLV3gLxrPAioO+cvX9n
	cevgMM95lZzw==
X-Gm-Gg: AeBDiesYlzFrfsNlmoAMLV5k7KgTKDX/bpejaRYnyLd+SMblEg/Mi7MCZEuEYzEyf8K
	3u1NAiMm8DbXNRIFJJ+nyOeG2+fO8UoXMsgtAC2WLpiMNww6efyYadOGupTf5CtZkJiYskHQxx4
	o1XmrlbpyUdScG3kTIyDpOEsTM3bCv/Ak0lbxVwrXo902i7T9sO/a6xLP0Ub56uzcuBZEjFbDkD
	dYpD/84ECd/QNTSNwQ1GoE5iVgFPHB+9zOCyxSTwcziRILd6CK9RQWqWe3Y8ch0b0iQNeiO5OXV
	rCTh2UsniyMTqgQd9wpnfRcLfVoFj49wx3kWFCoJ2DA++kQHcGBIdmYu4665VEI+iEp/St7fIGC
	haKu8phAFZ0u0hr0xADurSiqx7QUA4gmrxNyovLlhIQCAyAThaIHbiQ2SHI9HKA==
X-Received: by 2002:a05:622a:1a91:b0:50f:b61c:ec65 with SMTP id d75a77b69052e-50fb61cf107mr388256401cf.23.1777284895448;
        Mon, 27 Apr 2026 03:14:55 -0700 (PDT)
X-Received: by 2002:a05:622a:1a91:b0:50f:b61c:ec65 with SMTP id d75a77b69052e-50fb61cf107mr388256211cf.23.1777284895067;
        Mon, 27 Apr 2026 03:14:55 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5062:ae86:23aa:702c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb74c789sm235103445e9.5.2026.04.27.03.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:14:53 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:14:33 +0200
Subject: [PATCH v2 2/4] ARM: pxa: spitz: attach software nodes to their
 target GPIO controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-pxa-gpio-swnodes-v2-2-86fc24b9e714@oss.qualcomm.com>
References: <20260427-pxa-gpio-swnodes-v2-0-86fc24b9e714@oss.qualcomm.com>
In-Reply-To: <20260427-pxa-gpio-swnodes-v2-0-86fc24b9e714@oss.qualcomm.com>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1603;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=jxTrQNR4gpZPqvGR21t6SEYABvNS8GOQuHajItmONbs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp7zcUKwvPo+ocrnJDRQFVq6Va2JiCEsp4/yTZV
 gtmYIqDXqWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae83FAAKCRAFnS7L/zaE
 w5l8D/9c0LfnfS8OD6Iif9B/tbOf1OixaL3QtLb3bHb08/+jQw4TDSKnGFg0XMsD0npmpVmXn7m
 OjuCghKC1kj6/QaD3LHRvxbOLZCmDnbxfMtaxeY5LU/N2xFx4nEiFfVyfFz3kfcbwEtlyqCrLyu
 +kCaHadxKNer89/t0OrRxipffmM6GXRyUsjfQIHzzP3JiVevHqWjzU+5wUZvIgARZx0DAZn/w9H
 /mgn3JNlFq6SqQb4ejc7KEyvNKKeGJBAiYuJN+/Yo6obsa7N5oUpktzXXM8WB5LydlFfFzySx3A
 U0Fmhh+4yZV1pCbseVFW0yWeZGlbi6O7PKtfkT8QpL71+ZLITkrrlTbhyx36WAjroGhd4zf/fli
 Gf45lghY4f3USUDpUPoG1V9orrk2bnPEDTsyWUpwUwnQxCzT9ewNZkClkFAwdbRlkBho3wtHTQz
 cmCLlwVHCED1bCRW93TeCNZ9ccOmVw6aKR1bulOD08F/FGo8IeDNOclvXRHSAtjO4hkJQmrLCsH
 TSugINPAq9dgpRtNQXkHrW9BVtJHxakemY6SkBWHQUvdJkSXc79gNwkOK9HFcgDiZYnh0+Zue7o
 krtaq6rTeZw3ITpGF4fi/o7f27mKR1VHj2AymWYUC7pALaVkpE/C5PW65lWuM1Vo3zKnG5r/4Ry
 ZsIoH4qxg8ryBeg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: M_9jah3DZ_N0FF2CQdNrZhQsFwhJNmHv
X-Proofpoint-ORIG-GUID: M_9jah3DZ_N0FF2CQdNrZhQsFwhJNmHv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEwOCBTYWx0ZWRfX5+uTZdAZbtEX
 aspgYTQH3LDgyS9NrzL8Ku3riXngLwOm3W9l5Apo4bnJgWFNg92O0Ab6EQ0Sbk3xIVxlibIHCs5
 fgYMjL2jO7eShcdfErhS81k3aWi5ftnCp3kai/AyEKuDirs2k4uv6jc6y+WSYhMixYD64zv+wE9
 CHMpTgYn6xjqpim2TeC9ZA+NxR47iICdpuQUmU9Li9QxoEWMR0PSX0+ryw9TrbTcZYxk/ia979J
 /Mu92oGomUsc0BwNsP7NA/IxRgocHPUiTAz+R7hu83G+g2FsOjikGaQ/exZ8MqoBZnzufqmSkJt
 WlZBdVl+ASgaaQl3s1mdJQGz31l+kE3ZzLWaidEr3OFAM2+oZb3T46FMkpBv7MtXasHX5PwWTZg
 /vwSqhzFHJRDTCOwFCmqQeweZnWXqeD4Y2w7i8PucBWsBYiyafglxowkes0V3h39GmGmZddKbKA
 Qua9IcdQFvFkUbZtiIg==
X-Authority-Analysis: v=2.4 cv=FM8rAeos c=1 sm=1 tr=0 ts=69ef3720 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ta5-_S-aL4JQErPj6J4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_031457_229196_6D459745 
X-CRM114-Status: GOOD (  19.64  )
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

Software nodes describing the GPIO controllers for the spitz platform
are currently "dangling" - they're not actually attached to the relevant
controllers and don't allow real fwnode lookup. Attach them either by
directly assigning them to the struct device or by using the i2c board
info struct.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-pxa/spitz.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
index 3284b9f62be970555042a7292993e45d56fde47e..5091b601c4e1bf25cfee07429881894929853dfe 100644
--- a/arch/arm/mach-pxa/spitz.c
+++ b/arch/arm/mach-pxa/spitz.c
@@ -204,11 +204,15 @@ static struct platform_device spitz_scoop_2_device = {
 
 static void __init spitz_scoop_init(void)
 {
+	spitz_scoop_1_device.dev.fwnode = software_node_fwnode(&spitz_scoop_1_gpiochip_node);
 	platform_device_register(&spitz_scoop_1_device);
 
 	/* Akita doesn't have the second SCOOP chip */
-	if (!machine_is_akita())
+	if (!machine_is_akita()) {
+		spitz_scoop_2_device.dev.fwnode = software_node_fwnode(
+							&spitz_scoop_2_gpiochip_node);
 		platform_device_register(&spitz_scoop_2_device);
+	}
 }
 
 /* Power control is shared with between one of the CF slots and SD */
@@ -988,6 +992,7 @@ static struct i2c_board_info spitz_i2c_devs[] = {
 		.type		= "max7310",
 		.addr		= 0x18,
 		.platform_data	= &akita_pca953x_pdata,
+		.swnode		= &akita_max7310_gpiochip_node,
 	},
 };
 

-- 
2.47.3


