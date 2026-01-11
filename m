Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDFDD2502E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 15:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Ps9zzlmwajZdK6WVYvUFwmHm1zDHy3alwitBecy758=; b=GA2EitA7ozohOgrq+3fXeCKryz
	U+U/HJU+4O+pleYGsPfdZYFkoNVQZDuFBwbnOT7r5BDIVYuhRPtN8z9pkHrJ6m6EZ9gnWLsIwY/4g
	uNPEcOeKwAt1ftCBehbHPmvJVcWdgvFVNCiHZ62ST7loV/1tncEsJjWZSoxJCL0/8kPaQo37z3UMf
	Ez/f+5FSZqKE9ket+eQDvQKDQyeNbBQE69pWP8gAEkfbUibse1vADmxYxB/WDBYqp1sflZZ/IqO1/
	M3s8T0nKjcbVyA8cMiP2xyO5smYhJ7fLq38SqXyblergQDb1kF1ETEYkJ081wfcuMX58Qa3WVTe1G
	cJ+O0Eqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vexdW-00000004Kzx-3AR1;
	Sun, 11 Jan 2026 15:45:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vexdQ-00000004KxK-2S5T
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 15:45:45 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BCxuPH2988293
	for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 15:45:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Ps9zzlmwajZdK6WVYvUFwmHm1zDHy3alwitBecy758=; b=XlojS593hlXIZ7Mx
	gwBumC/gHHpEFprdV1RxIc74c9yS1PBkWL2iH1i1lyajdgi1PA6wh+dXQe0Fib1P
	QEU3afWQD2b62ycU2X7EIusWthnuPECsar0XHohAcu3PwJ/M06cDGE6XXgkQc455
	3hr7v5eWZEvKd6CzyuEYLqbQYpYmFi5KVz09BIBMsRgcAnykXDD7VgwBO7qSxHUL
	k1dOUBZCeA0eJMjLc0AI063wHmL8Aj6ehjOKDZYur46+xwA4UoGQFFHUNenShbzl
	XEehEcLXoci/7twcFF2/WmsGoY6uk+ipLEz4CtpwqJBKRnJzEBnmFhxqgCAsT1WR
	QH4C2A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkebu2e69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 15:45:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8ba026720eeso56280685a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 07:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768146343; x=1768751143; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Ps9zzlmwajZdK6WVYvUFwmHm1zDHy3alwitBecy758=;
        b=dw7Es/vtN28lFiBp4QgDh46p3VPaT466n3uFt/vhR/lCfZeorNe1Z98RVzxP6VrVZh
         LiU9XDxHPi6ci0mXv9uvRxPg2W61D/OeT6uOB7sB7gMH5sY+COkIQJ2ZC1nD0z8Odvqn
         bdQ+FfpQjAGO128C58t4sq5bVWGRCZBHgfXFp5JkacmEkHRj50jszEL1YjGvJNCsf9K7
         TNp09WXeQgblb3xx+BdlO64dNdP+SfylVnfRA0llPEyXFsuM9k1/N5XSIPpBp7e3RPY8
         11XTlBT+z2szwGX5iJJfRv/eYVOrAlACy0pb99fnuW1CO1MALk7BlYb43V6HCwYDp/IY
         tHsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768146343; x=1768751143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5Ps9zzlmwajZdK6WVYvUFwmHm1zDHy3alwitBecy758=;
        b=vy+QhKt5pzY0G2k6ZXso1GJ+YQuZWmSfu9V6zLd5dTgoo5E9Tv8YIBr3+OxwadCc+y
         g7dPRSLqwjx2rWxSLB8W3/7wRe+Ur1WEsOGKO/g1yrm1NsA1WZNZgA09hm+8F6lFCcnk
         /5OEwftyG3nQquDeo++rdq/7ERQqi2rm4zNV7IEbM6qsi6hB5Ci6machGcSGe8Ma4mBa
         hlUayP3aoPcTknqjYdr/MSRIG/1Wq+Wh8jJ3e3ir9a+rKyiGT9WejksSi93vRU/6s8nz
         P62srA5gBfixUs0Bu3AVSIXssKasp7XNrkDQ5+N5ErVFXVAynar5yHfJikXeKrwhq9V8
         K+9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXEh39kmAOCsjzHU5dtvG+prC26hzoBG0yJwniiIEig9/E59DRRO2ZvdTSqm4bsh++992jnshpqU2RktslntwSu@lists.infradead.org
X-Gm-Message-State: AOJu0YwPtbLHMP3dOvDjExdpku+M63DaY/rX/6FmhaykMTsSQgBOXOuW
	UVU2vA2ERvdiTy2DWNGNR7N+aFOMrCeV3vZXYt1OVgh+qrubxf+7uV0wHpt8s4IXX0Eh4cH5TFc
	yJZC3kQrVCVT0t6sGt5uDElYOb64RzR2o33KAIyyzz2HDI382xCyGuvzPmGSrxgnYrV3myDznTz
	9Avg==
X-Gm-Gg: AY/fxX4FO6lA9BPfj6iVpNtFRInTVLKQ31j8oaCCoYuqvMMu+pUOioJjP5aPVW3SSG/
	mgURTsRGSKCJkebeg81OCkdbGccnqg5jQT7osbOQiBYtveo+OelEl+MTf0omyUQnIhqFEn3ThcR
	rNbTvc3L+a6x9mqogvE23+hQ1ctJaAG4/bNcBilfjnfNXHNIy1EjEmYZHOJ0i+eS7NTiBecgKmn
	T4FbzpROrQC1o1usCjIB2A1UNFg+uKS7mHbNTkhwdsuUCaGVffTMOw7ZPJCNJZsA8eSYLBvSyhl
	Vty68n3Fwv50HRVnTZXSTeku34u0ZhoOHs0A94bZBX29brEbVl23DNyuSS1iBGs4iqIMap0nmS8
	xqzluL9aFEnbb1YyyYLx1qJislKpooTL38A==
X-Received: by 2002:a05:620a:4555:b0:8ba:c15:e998 with SMTP id af79cd13be357-8c38938b5c8mr2149039685a.29.1768146342901;
        Sun, 11 Jan 2026 07:45:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvsha3u4Nuo7Y3nMu2qTWPHZlW7jiK2dwV64P/LB1S8s6OVHDY3b3dD6dBTP99yi29N2vlPA==
X-Received: by 2002:a05:620a:4555:b0:8ba:c15:e998 with SMTP id af79cd13be357-8c38938b5c8mr2149036785a.29.1768146342459;
        Sun, 11 Jan 2026 07:45:42 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a5180bdsm1636605566b.57.2026.01.11.07.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 07:45:41 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 11 Jan 2026 16:45:31 +0100
Subject: [PATCH RESEND v2 2/4] watchdog: s3c2410_wdt: Drop S3C2410 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260111-watchdog-s3c-cleanup-v2-2-fab2d21a2048@oss.qualcomm.com>
References: <20260111-watchdog-s3c-cleanup-v2-0-fab2d21a2048@oss.qualcomm.com>
In-Reply-To: <20260111-watchdog-s3c-cleanup-v2-0-fab2d21a2048@oss.qualcomm.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2896;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tfUVqfSUN7/loUc0Y2WZXc/4Aj4HFepsvMYbIp4rXe4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpY8WfQB9eA5fjhUbOkZcGFnyEZ8Z9nulliqAw3
 s7BG3vnmdyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWPFnwAKCRDBN2bmhouD
 1/4iEACRraOZ3YaA+6GG8UwHOtvBOGeUda0rq/nK6G100DesDo/Oo81m3NOkcAtQwHWCVQgGYfz
 lqnRs8kGQMw81r4iPveYo4DLx1PQ7fcUbfR4iFvHMZDNEGRJVk76nxOg/ouuAu4bnz7DVDrYf92
 RlDKKpnPx4v4Zx5UC9OOny3d4KfaobFuKOwUr3QWMNUgCf+n5U+rvvoWeNUN5azXTd8DZYnTy6H
 d4P+iNisUVljQ9cc5HsE3mYIivP2rSbELwqgXThGkHiJWW4rxjrpJ53BgWGjSmtEXKtrevtANz8
 7Hdyctwd2C2H2BlR9A48X3mQoDcqeYS2GJtm4aF+gOteAP58UftHpzzaVdSuZ4hnxi3fvKKTR1L
 RNOltTI1W6VAokmskGNKegF9j91GxpDtBKDVEc+fdcCEGRpNFKDD9GbET+DpHzWzKGb89SNzFHQ
 YHpse4xSQEA/lO9+lwEnHXHbHY2aqWSmidbnTjgwHpOq91dfW+q/P65cXXt7FdnzvhogqpKspuH
 z7aN0j2HxSCTbMIM0yUON+BxWcSgHGdj0qCGWU6gZ7Sx5heRAXIquBFqUDiwg7IFbZn9mBiNTT9
 PKekTnBzRl+S5YwN2YWSE97mvOWS28SARWkeX4v03oMOqTpTCO+YhvQc01kn2EFscA/XqhXqcvl
 JkHdpp8q9Za2h2A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: kZek2GcSHgtWron2-KVQBotPS9IT-mel
X-Proofpoint-ORIG-GUID: kZek2GcSHgtWron2-KVQBotPS9IT-mel
X-Authority-Analysis: v=2.4 cv=LeYxKzfi c=1 sm=1 tr=0 ts=6963c5a7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=_jlGtV7tAAAA:8 a=EUspDBNiAAAA:8
 a=SrvLU9wFeIYBZhyLgqUA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDE0NiBTYWx0ZWRfX7AjgvIxkH4z+
 1Wk3aQUqZYJuA/cLgHan+EZTScQW6iasV0mQRtlMEc5xc8W88gNiIqH+wrfZRUuJg1h6hzWUxM1
 13sOSJpjoC0QV/NXqPqKtUTNv0WMRoUrcL10ZmFB5EwGfX1tjEnyHxOc6gLTsz5CRZrzmvazroW
 s515mWa9toAC9WMR+LYHh9oXnvVRi1pbgwsnz0e2OZ0o+6VUwxn4D6+JwBlwXaLTtUat+DE9Rkv
 QnMkRXrZ4SP1/YHyZZ4dzzV501IVZhoKtRvNGwpVs7UM7MBrjcIT0B10nc9kW0kuucwanombjlN
 kjFiXMEo50+Fz8oEz+s/16mH9XCy6BNLLx8Dm7bmmlgJ/O40QAy0t8zVm2mj7v5EkVqxybc/MN4
 ubgig+Sxh0i65xO4FU2J7GaQK/5I3M9C6uCZMlhk8u1xcKsJMoY6d0+q2tRGUt7WUTtl/BHMNEt
 z8BPtl8NVxe4ZpgQERA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601110146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_074544_755363_079B6944 
X-CRM114-Status: GOOD (  19.16  )
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

Samsung S3C2410 SoC was removed from Linux kernel in the
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
2023.  There are no in-kernel users of samsung,s3c2410-wdt compatible
and s3c2410-wdt platform device name, so drop both.  This leaves the
driver boundable only via compatibles, so drop any CONFIG_OF ifdefs.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/watchdog/s3c2410_wdt.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index b774477190b6..e31f93db0509 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -208,11 +208,6 @@ struct s3c2410_wdt {
 	u32 max_cnt;
 };
 
-static const struct s3c2410_wdt_variant drv_data_s3c2410 = {
-	.quirks = 0
-};
-
-#ifdef CONFIG_OF
 static const struct s3c2410_wdt_variant drv_data_s3c6410 = {
 	.quirks = QUIRK_HAS_WTCLRINT_REG,
 };
@@ -378,8 +373,6 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
 static const struct of_device_id s3c2410_wdt_match[] = {
 	{ .compatible = "google,gs101-wdt",
 	  .data = &drv_data_gs101_cl0 },
-	{ .compatible = "samsung,s3c2410-wdt",
-	  .data = &drv_data_s3c2410 },
 	{ .compatible = "samsung,s3c6410-wdt",
 	  .data = &drv_data_s3c6410 },
 	{ .compatible = "samsung,exynos5250-wdt",
@@ -399,16 +392,6 @@ static const struct of_device_id s3c2410_wdt_match[] = {
 	{},
 };
 MODULE_DEVICE_TABLE(of, s3c2410_wdt_match);
-#endif
-
-static const struct platform_device_id s3c2410_wdt_ids[] = {
-	{
-		.name = "s3c2410-wdt",
-		.driver_data = (unsigned long)&drv_data_s3c2410,
-	},
-	{}
-};
-MODULE_DEVICE_TABLE(platform, s3c2410_wdt_ids);
 
 /* functions */
 
@@ -720,7 +703,6 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
 			   platform_get_device_id(pdev)->driver_data;
 	}
 
-#ifdef CONFIG_OF
 	/* Choose Exynos850/ExynosAutov9 driver data w.r.t. cluster index */
 	if (variant == &drv_data_exynos850_cl0 ||
 	    variant == &drv_data_exynosautov9_cl0 ||
@@ -756,7 +738,6 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
 			return dev_err_probe(dev, -EINVAL, "wrong cluster index: %u\n", index);
 		}
 	}
-#endif
 
 	wdt->drv_data = variant;
 	return 0;
@@ -949,11 +930,10 @@ static DEFINE_SIMPLE_DEV_PM_OPS(s3c2410wdt_pm_ops,
 static struct platform_driver s3c2410wdt_driver = {
 	.probe		= s3c2410wdt_probe,
 	.shutdown	= s3c2410wdt_shutdown,
-	.id_table	= s3c2410_wdt_ids,
 	.driver		= {
 		.name	= "s3c2410-wdt",
 		.pm	= pm_sleep_ptr(&s3c2410wdt_pm_ops),
-		.of_match_table	= of_match_ptr(s3c2410_wdt_match),
+		.of_match_table	= s3c2410_wdt_match,
 	},
 };
 

-- 
2.51.0


