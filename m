Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F329D1118F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 17:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YXi5iMekNPozgcM2KO7yOuNDGNCDpMEgSaAIxNoOMS8=; b=cwbs3bsgDIfdXxv49bUg00pHI2
	heMxfx0/0WDggCAqFNU/d9CH0FxHajJ1l5URl9AdnAc34nkXQw19MQPSV85A9Emh+TqzrTomRBznd
	B/hn5dEPrSbRUPKrGpPepvblR2wtxuBxs3slbF2mt+TVDMuVNAKoa+CyLzg9blaQDcJ2S0/Adn1K1
	+YNGVXG2/qR6c2mKQpm3h/ucooAZ92KiqyfvO/Ha52sAjfqOlz5GtbO32lE4w41je+MZz06W5rm2u
	9CDgrrhsX7Luy/mRMxQnYz0/p/qJ/uig3lxhOC9avuYBHH+pCpzyoNbK0L5b4442AB89QLc5MUh2d
	U+rDfFSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJVn-0000000FRDX-0QYV;
	Wed, 26 Nov 2025 17:41:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJVA-0000000FQpA-0yr9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 17:40:46 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQB4Efs1668686
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 17:40:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YXi5iMekNPozgcM2KO7yOuNDGNCDpMEgSaAIxNoOMS8=; b=YqVj+Xxp9YY2tixt
	eenl7IDMEmeVj2aENO6JE6BD5dviSs3iq5LlydV+9qIhor8taBRBI9aq61US8BlS
	xiwHrwUNjI+AQY90WiDZ7gDZOxRO1zRCpf3ZQY7IsYUBcVCaaJDaLqOGAI/HxNw4
	bXxSQvdPrMZwqaJPKLv4Bz/05CF22VxqsRF7O3rkaE/XyarKZrcWO0wqaWiT5Kjx
	2Gn8gBGgippfcGAxPiCP38wekbqdxtWUKChyiCvL+2Xdf/O3tJSlf8z0bW+41uM6
	sEJIC0veB5XQLmVkD+dBouvwB/AmpWH+2IdVeNYsUS1sDEboIjOlIE3ZX9i3Yfmc
	fb/Vrg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0bms3h2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 17:40:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b259f0da04so145085a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 09:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764178823; x=1764783623; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YXi5iMekNPozgcM2KO7yOuNDGNCDpMEgSaAIxNoOMS8=;
        b=Bq3R8AUNBMnmbZWXvbz7Qv1Ab+anMOPmdby6PBrY+1qjeGNazONjiJYjtSP04q9hC/
         +PiB4orSlVYEfpD8iD95CVxE6eFwcW49YwCR1jpQcWe32aarJUpMCIB9kdoZZVSuwJJc
         gsaOrQGOGmDNfybsfcbThr2ARRQzw7meb0VnwEnBn2j2XNAKgvTQC8u+s0E9EO/SQPYg
         81gk/dVPj7QOsnPrsQ8XQfAbbteAnzBOmd5e0o0NRhMtlAEPR4dnW8O/dnlMEaNe/7nn
         lZX7xDjNmvhN1TMt3ldCWJjx2BaINPGcXcjAeMxrBpFsNAvziNsAvyrHK3UdcDOomviF
         s5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764178823; x=1764783623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YXi5iMekNPozgcM2KO7yOuNDGNCDpMEgSaAIxNoOMS8=;
        b=kR9s2LzckKSnKnyZx4U7d+23Z6d95eu1ATMyW/fKHLeA+tBM4I5id0Bb6Fq9b+GIoF
         MO+ft1BZzd9UxX/g2vbQy8a/AOlpnoGQDfcq687n7q3mhTgL4d7cWNMGKobIWNp4rSCv
         /WKojP6le6fKnwMG5HO1YqEWBBhy/dovUKoXyj4iMQMMezFRB9+linYsai2GnrFGyCiy
         Bp1a+8wxuy1D4BlYPvBBn7u7yOscUMO5zO0KbsI1hl3M7PKXQk00Cy92v8cphmLr3wkJ
         x7WgERxtK4ZSBzW6B5M6xoACsvvShdSVMClgYgYudxQpOV7aDnSnOB7CuoYLzWD6vQ7C
         9neA==
X-Forwarded-Encrypted: i=1; AJvYcCV4116mOB9zQUJh8YOBz9R1L/kD2vJtqzxQO1IRWZHJ6V3OqAs/37ksj5KjNGcCTpgXidVdoT7HTYsmqXazJIll@lists.infradead.org
X-Gm-Message-State: AOJu0YwsqSTuKfiVhfFv03CZmv+dygX7fsjglmRpS46/ho30AdhLHMkX
	HO5F1HUe6oVnPD9QuXZMUL4LBWW3EKvkaW7rK1SrpTF1nusrdU8pb1rEUAh4ofjrQ24O1baxNeH
	tniunMmvDkV92s5hxrU0AcXOX82LkDNmdQYlfCuTeul5+9Di+vdLkFjF0BVTEad++c+s1Sxv2vs
	6Xrw==
X-Gm-Gg: ASbGncuy3pPBAtk08QYJVHpv5u70j+tdhCmBmZTkI/9rGecUpwoeLXNb5IOdKZAk5r8
	CUC8DbQm0HUZkF00tavuXsnRnRIFM6FbflYLdSxJvWtysklerG2ZCj0AY/aPi1FjDDTzD3/3YYu
	qAh8cUQ4TZgNHZh0hZNO2mOzyw6pEsabHuMlQMN8zdOpGNfjW8QvlV0UJ5oVCJUg/4NPSAfmj4c
	vGg2GH4V/YnRGMabi7qfqLDziHz14BaNN1TZqCgel+5ERAZIMjO7LWEk1wOhomeJNWkMXdq5QeS
	PKRUFcRfqYer5H6VgCENldEKi1nzZxiZj5eqbA6cSAUkHZNgaI7oDW8xC8CQ2IhdwudAwWSZ73h
	6zDHSR0tozZSI+8TYCAZm3qQ9oHVfheDrnA==
X-Received: by 2002:a05:620a:700b:b0:8b2:db27:4262 with SMTP id af79cd13be357-8b33d469984mr2447593585a.74.1764178822705;
        Wed, 26 Nov 2025 09:40:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFe3tkVK1tsFBQiS4G+6Zjm6S22v96S5ZcYKIvedvhh8WC93a4qg7Aoeuo37ULuK17/ykM07Q==
X-Received: by 2002:a05:620a:700b:b0:8b2:db27:4262 with SMTP id af79cd13be357-8b33d469984mr2447590085a.74.1764178822232;
        Wed, 26 Nov 2025 09:40:22 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8e54sm43226430f8f.40.2025.11.26.09.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 09:40:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 18:40:06 +0100
Subject: [PATCH v2 2/8] regulator: bd71815: Constify pointers to
 'regulator_desc' wrap struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v2-2-7ad3408d6f29@oss.qualcomm.com>
References: <20251126-container-of-const-regulator-v2-0-7ad3408d6f29@oss.qualcomm.com>
In-Reply-To: <20251126-container-of-const-regulator-v2-0-7ad3408d6f29@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Samuel Kayode <samkay014@gmail.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1606;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=VUNpL3jXdgc3MZUwnQFvZgDT2ptHwcLxGJcoxf3oJiI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzt7AGT6LRAY8YfTFg7COgV+NHDwYgj6p9TWN
 VpN1PDcNE6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSc7ewAKCRDBN2bmhouD
 1yreD/wORlUqhLlB45GKp/eaG6b75/1Gp+R/YcNxqWEg2vaslfLtaam7C2VNfj1bijUX30oHGsV
 cvb5KCyoED+dHbJeunzFQLHUyRKJYQKvNgi/1i19ttMSWbnODpIM+eKNEtjS5h98uq+/g8Ja5o2
 ihes407gdCdW5M8NKknn9xPb0j43QQtYq5MpghUXAnmY8l4p+ly2V3dwvHLbbLDzqqMHZz0g8R2
 60TZalrhocpwjgjBxNZDaFk/3PWEmgiUmkTBQ4PuV362d0Sq4qU+L87zXCc2PSpCZydbPSVgc4P
 CkTBsAup4SXI+FQSDzJleQfgwwbM1EBTUkRTlv7ruB9rjksAVpIBU5K4Z/kFd/lg4uuq34MbFqF
 OwYEZiJZHnGihTn0SgEOgp/EheBr/eGTcVksVvUS1Ko5hh14gFhIUIy16T9wSyoc7XYHKgCr7Tw
 xgyea8gx9hwFo2A8z3Z/Mw+zJRULbVeILjFQw2Twx36z3MuKWXAEF0JDDDRX8cpWZswQ8rDKLOi
 u89KNH5rZV/R20O8aDfZIB0Q6gbntWdzlE19d2hvEhRUXnRED36YaYfT70ccbfKrJshM9woCi3u
 ovO2Tvn/y8dDRXNNTuFizGrvIC6ay4E8Tvd2E/z0VaNerk+CPu/M4bc+devSFo8tWMehxBBF371
 7CuJNQBLi/UUsZQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=AKyLkLWT c=1 sm=1 tr=0 ts=69273b87 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9MRJ1adic_HRPEocbcUA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE0NCBTYWx0ZWRfX4nzKrPr70nFl
 fQRRfOVFxMShqvbre80mMjwmxTU8lzE98OMltcPj3P2rOP4YQDKlxv5K7+DuufbpnKWyrYbxbCD
 QelCEvo3VtDzW+xZmkD5gsH45U2m/11j73gP662gygJ9lv0G+2WOnE7o+7wHu74SrhRjcfnFa0h
 oSKwAv6M5rMCY6m7R/ttN5ufCsdQKlJmNEzAIbgMz6Q9aZNRDxxqCHK2arT/QU6Ra6i2lAe0V3T
 QDHaKbrBgrjx3jsYXVBW7GE87ndt737ayH3WMaYlPq5PQpHGzzpJjMMCHH1+2ryTnAT6JhBB3W5
 y7Yn04l7+QWdT7wZJyZz1flzGXi6hvzUagSZtskqlvKXhzXmIu5hTt34J8Q9oTXN2ARRxQ+JtvK
 UfCM0tLpxY10tT7VLoQbwkOi0oJ8fA==
X-Proofpoint-GUID: rrkdy5t_PfH1vjilxb2EAWLVk_bZaPqQ
X-Proofpoint-ORIG-GUID: rrkdy5t_PfH1vjilxb2EAWLVk_bZaPqQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_094024_270238_94A010A3 
X-CRM114-Status: GOOD (  15.93  )
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

Pointer to 'struct regulator_desc' is a pointer to const and the
wrapping structure (container) is not being modified, thus entire syntax
can be replaced to preferred and safer container_of_const().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/regulator/bd71815-regulator.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/bd71815-regulator.c b/drivers/regulator/bd71815-regulator.c
index 79fbb45297f6..8da57a7bb2f1 100644
--- a/drivers/regulator/bd71815-regulator.c
+++ b/drivers/regulator/bd71815-regulator.c
@@ -173,9 +173,9 @@ static int set_hw_dvs_levels(struct device_node *np,
 			     const struct regulator_desc *desc,
 			     struct regulator_config *cfg)
 {
-	struct bd71815_regulator *data;
+	const struct bd71815_regulator *data;
 
-	data = container_of(desc, struct bd71815_regulator, desc);
+	data = container_of_const(desc, struct bd71815_regulator, desc);
 	return rohm_regulator_set_dvs_levels(data->dvs, np, desc, cfg->regmap);
 }
 
@@ -195,10 +195,10 @@ static int buck12_set_hw_dvs_levels(struct device_node *np,
 				    const struct regulator_desc *desc,
 				    struct regulator_config *cfg)
 {
-	struct bd71815_regulator *data;
+	const struct bd71815_regulator *data;
 	int ret = 0, val;
 
-	data = container_of(desc, struct bd71815_regulator, desc);
+	data = container_of_const(desc, struct bd71815_regulator, desc);
 
 	if (of_property_present(np, "rohm,dvs-run-voltage") ||
 	    of_property_present(np, "rohm,dvs-suspend-voltage") ||

-- 
2.48.1


