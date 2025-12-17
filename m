Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F47D6552B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 09:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Ps9zzlmwajZdK6WVYvUFwmHm1zDHy3alwitBecy758=; b=uVqiLBxWOwbvH3gKt55qNKKFxI
	z9CXRsPKNXP5YG0Hl23Y/DMyFP9HAT4ZvL8WEWayyeonl3sdxMCHmQNK9BUvg28BLGrpT4777SRR0
	CvDcLza1Q/IDaAhA4bkWGxxiez7jG/Grk5EX7viFLeUoEf1mvEuLa3PUMvtbYNShMck9tSCI/W7af
	ceBkNsdiDFzcNC8aS1EQxz2dWWEzTRj6FEgj5kWmIhaPq+1To2Db/7VdB2T8uVAAo6x7qAVA9sYUH
	efcQO/6KbMJCazqFP0coalbc1WJq7CTqtM4yfu6e9eLrj/I2dtCBfPDDF4f+rRDjWY8uOTrguXiO1
	l8oUx3hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoCX-00000006TEc-1zwg;
	Wed, 17 Dec 2025 09:52:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoCU-00000006TD7-1ZRg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 09:52:07 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH9pNsd009013
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 09:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Ps9zzlmwajZdK6WVYvUFwmHm1zDHy3alwitBecy758=; b=bFdkvJ8V86WJnu+b
	7O1dd9CUY8wuek248dutRBEu5fpmHqABaPWNqT7DDNSNdsHCGP1h2FEYoNiNYYhH
	fC1BJsbfxCvxyi+gukYQRs0+95qq5uhsezsXcByHGXI8mD7qJoQ2NQrK6cMYMsww
	CrhFKyGVt/xG/qBhpjOjsqGZNURG7Xi5AAItMw0RKjpilnqRnFHJvlosTLYV7MuO
	uuUDFOtOT+GeVDg/Rczd+WfxbiwGuBi1whEM7nBV7rQsvPw5b93sM0Dq0bJRiLw8
	VHC8z4gXU+H0H6PDUH1SANEvFMpu1wgknZw1xbw789S2T8cU85xS1aztA20MMhpz
	kNFGYw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3t8e003e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 09:52:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed74ab4172so117169411cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 01:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765965125; x=1766569925; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Ps9zzlmwajZdK6WVYvUFwmHm1zDHy3alwitBecy758=;
        b=f65Cno07yoOt/vOEyvzyMJiLJJvMqdTvsvC1klxugpaQv5KD7lilbFVee663Yfd55t
         hHnSdwhnF2Tig+85RU/bh+pIKNgtyYBkDOGVKZznb6y04KZ269iBV4HcuQf9We/eCuVA
         G2EA/I1WbpRyCKwyd0apA/77ZCVsTBOo2TB7jxqNP2vxCfzjHO/F01te3WckCHdf8BAR
         tTF2BMobm6SI3KJFq4JgkNAoJvd2NlTYAjozuvTXb2yKzPybXOldh6PmHOXEURjG3iWj
         I9xWVH6WDKz1bem0bn58tAku1rz5zkgu99CHbkGTrMX7mnFtHILwuTUrXDG14XKhLWrr
         HZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765965125; x=1766569925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5Ps9zzlmwajZdK6WVYvUFwmHm1zDHy3alwitBecy758=;
        b=KVXnXA8Nqr3/JqWM++39DIfyqM1PLWQbeWExWGg0+cfnM1kl25qayxrK2J7avtYIqV
         yZOx5jGo1fFCjAt/HnB1ggGOFBzkHcmYKZt0WV6k0KhOEPgTtJb1pxLhSPkAfARm45rr
         G51WvT+6IbDmgbtrFqaz7hniubFD2eeGK5Uz2BAxBgStVt7xzWMFKa+USpp835deE/ft
         BJJE8pDKcJO95CvEfKN35TcFq7YgkS60V8PrQ5oFNGJAEUM3M1jDLpaOhMk3jSqn+1vJ
         9sT+AneFqd4yCOjYPVfBA2sAXe04nHkRgEkJAgjQRfRt4UbO9f/6GB9eGRNs94f8CT/X
         xZHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPGVj9Gu7rsN696nWDJ62TjEuXipl14uRpgA7TUPhHNAoBRGCDa5S7f+vE7H/O2YvX2O/EM262uivgRYYdqVbI@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4iIMgt9xDHmbo9rjc9CxnPILRORZy28UfBLb3LRWts1/dnBek
	FwFCiMUjcXpb92i9qAEAVie5MiD+3SHOQKwoqz9v5upBBg/zZbUozsU8yMA5UoCeLwmc09WQn7R
	M3QjRhO0b2fyQXROKTKLP55x/DftnQMcN3H9uNnwE2Oldj5z0VIIUucg/AzD8Wbn58DZBS0m8x9
	NLbg==
X-Gm-Gg: AY/fxX7Y0f+iKPSyj72bpOmoyVcErrhmLn4rFt52zOX9BpGTEhwYsaJLXJal+paiB/Z
	aAbJEBkanDwex/HI2cI88ez9s7uFqnJk/8bIkbpxjsU5E33D3SA4QXNNSKtos+dHOia9LeTSNKm
	d43MYKoLqpgd8Wsow9KJTbD90E/zCd8Vouut8x9k3qsj3W4vhPfhUGgEq3a0IzS5Lrug5wtp8vQ
	NTQYAHkLQLJdSMfAq8k3fubEoiH/RTSlpecsVJV1k2FksNnjWlkMQV0VnYqzoZzeXnln4rxJIQt
	v3ab8GBD+3mVyQ8ce8GVvcUFH/6IrMZdoIoR5GvCnfE13kfWwuj+Cp+60l6You/UcrijOIv8Z+n
	8YCN+KBi6QqiI0Da38/6Gvodox6t3wRH4
X-Received: by 2002:a05:622a:2443:b0:4ed:67bc:50de with SMTP id d75a77b69052e-4f1d04bfe5fmr242556791cf.24.1765965124962;
        Wed, 17 Dec 2025 01:52:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+3hMiRP+attklLgtgofiK57yoL5Ct382xF3L33kH87mVyl7+crPmgYIhkbQpPG7pV+dpESg==
X-Received: by 2002:a05:622a:2443:b0:4ed:67bc:50de with SMTP id d75a77b69052e-4f1d04bfe5fmr242556561cf.24.1765965124521;
        Wed, 17 Dec 2025 01:52:04 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f5630easm1981969a12.22.2025.12.17.01.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 01:52:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 10:51:55 +0100
Subject: [PATCH v2 2/4] watchdog: s3c2410_wdt: Drop S3C2410 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-watchdog-s3c-cleanup-v2-2-79d8caf65ec3@oss.qualcomm.com>
References: <20251217-watchdog-s3c-cleanup-v2-0-79d8caf65ec3@oss.qualcomm.com>
In-Reply-To: <20251217-watchdog-s3c-cleanup-v2-0-79d8caf65ec3@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpQn08njWbvBo4bxgkg+4rCp+eaWZdetCYgwez4
 treNRcnbtyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUJ9PAAKCRDBN2bmhouD
 11A1D/4+bDgyvQQSOxP+Hj15yNATRPRad5DXeWoPM2D+tS6/0Rpv9Yc4KbVCS4adhcHgqhA9lRm
 +UcnY425ViAFzPCwFWGFE6kYPCBmpOI7VYQHxPmeC2egbN8GahfFVqgT1BtsTwxm13//rymFAKJ
 wnoCM5HS1OLhF7T8JDbL5qsL2jB+0J1FXSnZSgO5ICa8mxU5fX3nCp+Wh1O1NFHnOpxo3ujKm5w
 YRMj/b/dcekLaDDUn9nlm3v524UDYLOa4hj9sthCq7SRRjJRFp8aDZ9GesI4+RkEyn+AVumNz0x
 I23Jz8aCyCIuwFkGVZk4iOCfNwRfJVR8PBhpeIpuj4CWGlIeL+rZ5xjaYjkI4m9dNeCpt2fx2G3
 +9tK6dTzvukYgIRI9BqzYbkUAeKdYn1RXn2/4e+lo9BpAQe3PQbIV7c/fm+bSejhRin9qLx6I9G
 7/lrByx36rHradlyHcM7ZjCH2EKKZ2I9z76+ZUBAYKZBD05TrhNpKDwb+1u7nfKiqB7Umcy03lp
 eifr/o3mNtV/4bdZnpgRc5KU6RX8YsNdW/fBwOtKLUpwmMsQ+tiXDaBlEbZpXUHrgdJka7lwAab
 sDut9Pl8T8eYwMfmS/I+tXamqv1NXv/NJ7YIb8NIKSVVqqxwzO51lE+PbsR5yWObyQ526tP+Xmg
 j/hk5m2Xqvwp0gA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA3MiBTYWx0ZWRfX0r6Ln/fFk5Uz
 KirwlP0BUfCAIKVyn2ToSAbyNHfY5xFhfOKjVlx7es8j5gy3BEikX51qs3h224ArIf5Sf5JmZGl
 MhlWs0jZ8b8QXCa6GEhXa+8JsJZ2u7d/QZ6+zyN+ajj0B/Rr3kPXjR1Jgc3gqlqeuxqRTmmHbxo
 NCRK48O4k8CcbXXJNSTA6byltEKZ1sv7561EFTGS/Ezz+fKwUZpnQul7JFoPnVGwvoUhLnOPSdc
 /Ff3/TGart/AZ8g8o43c1dSPlxojYQDSvMRhRupcx0+RYtiIXeY5EZBN/kPgcRt9uxLJ0Sr+zif
 1vO6cKXNavCtyb24sG66FcRVImzu6x/tgbehjvRPnyYAhnwOXZdPcD/ys1HKhcth0t3SMNKJneZ
 hYxokfE/XUgJl2TqsVL3eLzC53bcfg==
X-Proofpoint-GUID: uxcNOyJwEoOnplRwWLOXSY7SyRMjHMjD
X-Proofpoint-ORIG-GUID: uxcNOyJwEoOnplRwWLOXSY7SyRMjHMjD
X-Authority-Analysis: v=2.4 cv=EsHfbCcA c=1 sm=1 tr=0 ts=69427d45 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=_jlGtV7tAAAA:8 a=EUspDBNiAAAA:8
 a=SrvLU9wFeIYBZhyLgqUA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_015206_423741_CE844145 
X-CRM114-Status: GOOD (  18.30  )
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


