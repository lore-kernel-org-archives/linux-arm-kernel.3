Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC5B4D1118E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 17:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JLI88Fy68vj0FHydbJ/LnweRpXCDXBC8BYlqjA1nmeY=; b=rlcd5AR9cIjM8pkaNwRpLhzFRa
	RTuxINlTgO8TxYqjVjzJGt6v62qRpStYbg6dUxD5OnO2dOswZxC6UNsHKCM8Krc4NPo2gOMACFnai
	+uSJkdMFnp4muEErR7cdEAE3uDm6iFfVIs1XQG7rdpQDF6Bc/auxrWWQieQcLdKOzbEcI6M9Z5IV9
	ek+sc9kX0KVM+zb6dk/hyWuBiUjZE7Qv44e9ZNrH4tAzuLBpKIahB0jIYzJP8qNKHjcgbkT8Jf9IU
	LfJxiVlE0aOlALrGLzoLWD54y+VM7tQJ9o5/SgIWTX27+Qt/xYorLU7frDuVZldvRXejhM1pvXqkN
	A8i5mlwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJVm-0000000FRCu-3Gq9;
	Wed, 26 Nov 2025 17:41:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJV8-0000000FQog-2GzG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 17:40:46 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ97uj13666108
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 17:40:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JLI88Fy68vj0FHydbJ/LnweRpXCDXBC8BYlqjA1nmeY=; b=X2hCpKOjHqvkmIyQ
	uMGbdM+Zq5Xqds9v1bnS9koQdy81a4bAdgN8NvvPP5J/HCmK+XTBmct4P65Tnu7A
	MQIW9dyQ3VUq1w2rSb2t5p52+5dyBx9GWl5C+l00sgvx7ZOwp7UBKxea+3NPOMCG
	WY/rw4N8magCB4VbYTP+6Tt98itsAbM6YyfHRB+c6ph/DsNKacRtgotONcfOgwMI
	vJOWToH3NNrJrcRJCZ8tYqSNsiwtKtfeImSvCgWLTMjl2H/8mCXu6uilBOJPv2Vc
	hDw8UhX3AyL/8+lzgoavZPSKVV6Q/hWuTj+rChEK9j0ZIljyutimxvESTnFs0a/L
	+zCV2w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anmemu0uf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 17:40:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b234bae2a7so1841589785a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 09:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764178821; x=1764783621; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JLI88Fy68vj0FHydbJ/LnweRpXCDXBC8BYlqjA1nmeY=;
        b=D5RzKYsLbz/GUmq3GMH2N89NJgtWygeoBlRIQVa6+Qcmvmg+RKTpvP1LzL7rwPuw2+
         J6NPoxanN1XBzA3XcHmVqZbPsinso6mnnIAnoe5l/EFTMnoysmZjlSHptmJ2KMPAm+6k
         lPjeQishwPtQSdNbXRsfNHmg/PwFTEeei8YJzSq7mkL0aGgbuowpxxp7LwvqXqAy0MXj
         bU28LlTpD4mm6pb168OsXRxxrB2UBA9f/uv6zqZopANleJ/sVDDhwU8MzF/b5QvdvWh3
         EXlfRPC+7VPwxygcSXBuTt+b9P/bXZKxFAT/U+MKnrCGrGPiGqCR6WbhTSPkNOoTWTsy
         1xUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764178821; x=1764783621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JLI88Fy68vj0FHydbJ/LnweRpXCDXBC8BYlqjA1nmeY=;
        b=JEEdzJ5W+TeAyGYiHVZGt6T4d79TqlC2/5RBXnHvFFoHHH+ABNVvSEs4FEHL0YvhsI
         7oU5sJ9zpMpVWV0gEVtB4dQqm4UEOQt6kygpLYTusB6si92SXZHMfoHyZxOE44Hw9MqN
         CftBV3sqTPdxb0CkKKq4TfKBgPpBKCeOGhzXfOn7Oksb+ouSzuTmITwdV8VR0em011Bk
         5FM8E2y93t9+V8VoXxA/puDKdkTWeMtAsg+J68BQkhmy2WQg7P8Om+581mEn+ftF1Q2V
         EG2XwcAgkjQF33pSSwJnEg948D64DfLS/+US56ckUDEAc5VMDrEBlJQbNcy9prP7ZqfH
         GbfA==
X-Forwarded-Encrypted: i=1; AJvYcCXQVc1i/0Nbbzt/AclbMB69xB5iZCYR9unK0q9O/bzyAIYAyWwNlt9lfhy2xnM+nNtw2xR7FlIMwtEfc4GTMUob@lists.infradead.org
X-Gm-Message-State: AOJu0YwZK8Cm9mIryMoUAYXEDZLrdKgPY/FpX3y/H+TA1VGDVj93yIXl
	MSvhFaCEQ6ewgEcHHEr1mPFLPSdYlTc+aJwMiSbQyqvEaiWVoCu2aSa7NlJrWgBrchuTOsOfy7q
	0ORYP0FZW4Q/30ydj+EvK/IZachc496JC50lmxaTO7CODMfxZyHP4q9NEzKVBN0j2AbIv6TnxeB
	Ie/g==
X-Gm-Gg: ASbGncu3ijq2RSslVf5EO8e5FH31P9y+lsl8u/SnlAsVIoSVfoLdknp9dZIouB2mKzp
	FJ6mzyBE+mN3b5tz9wWiM9OJyKEuFkE7I89y4Lnaj93hrny/FjJ/rILAOOf8xCSM2x/qRzlun2C
	qYI8XsupTKWLiM11mcujedlcR5SGNexD0ybfuXq4iNZFPeBe5/S0hwO9AFO66C9iIezXgNxq3gp
	16/NnNxz+J7PcXCyX5InBNqfFZ08VwwhR/MN0djuDkf2dwxCiIAoT8OIdao95yvTXYfpzZp4AED
	3Y2AZnwVSYYf+0f8FP3oAOD7iqSrLm1Np/cA8ZUHtiohzX4Fch52aQ9cP8EGciaGlncThgX+Pjz
	MapTwCfCN9h8pKRHPxy96KC4FPK08BiVTKA==
X-Received: by 2002:a05:620a:700b:b0:8b2:db27:4262 with SMTP id af79cd13be357-8b33d469984mr2447580685a.74.1764178821011;
        Wed, 26 Nov 2025 09:40:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgxrvUjv1L8Qqp5Ly7KuU6GITEy+qFYGTAMuG8yUfN6EMn37qZfVIiA/8CZ6KMq+7xblT3zA==
X-Received: by 2002:a05:620a:700b:b0:8b2:db27:4262 with SMTP id af79cd13be357-8b33d469984mr2447575985a.74.1764178820475;
        Wed, 26 Nov 2025 09:40:20 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8e54sm43226430f8f.40.2025.11.26.09.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 09:40:19 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 18:40:05 +0100
Subject: [PATCH v2 1/8] regulator: Use container_of_const() when all types
 are const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v2-1-7ad3408d6f29@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8192;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=U43YtcHpntkrCP9ocMS7I2vJE2/QxslbHKdrzw9qWsk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzt68w5EN9ZnwGt1+nnfONVEK5b/pP2uSwOUj
 +R+gfl30iOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSc7egAKCRDBN2bmhouD
 14DUD/9GDZY/BGcJN5fJwbIt8KBO50Zvvu3MGbl6ps2SMhhE4/fcSimXlgCtPW1JuNC4OZz40MQ
 91cKFWG4uvhsNWiI6lkxzKr/57Jg6PMtDBHOTxIhn9OLDa3hOqftufyWUAD6FOrK7npVd7Lvc2g
 kEsw8Wtu/LCt/qUvkMSMNdzhr6OjynagBdWBjSNWv2RMgbucSHk6U8SbK5+oKXIJnnN0b3H05uM
 E/Z67qDfAG53irxS88P3LH0RNiRUAGCKPZ/XOO8FlWjKjlBqX9SDMNCqVWH7OO8ZHyTHtgSOD8A
 CfXoWzhYMQZvpN2Bi4pGUNqAqKZAYuALqB6TLEMmH6InA7M4moUOGcvzLoTU/egz6sBLyI3MmU8
 Y9OBwAauqzQ7gFvZ+FfEcYbqYHClcEgEISU+cz1/ABq1Zh+PqDxl3pjZw/6YB5IZaMj9juzT/9B
 cu9enEWaDT95j4tw41tZnPfBjcpsxQytQcSUQ67KidiCq/pvZKYR87T765Miiy50ZzORHcbMJnA
 ylQ6VEs9i+C9qJfuyU2pArE5hx3vKZ2wpQPJbe0DPUmLGWuL0V9V5RsvZFcLhOLRwGo5GR4uuMz
 QS3P34ZzExhBWJsA9GRwJVgTpt2xGDbSIB1fXDUOpRd1IKqeEwTyUclbct67aVIHaqpiUT966aa
 AD2y65T2pvfNdjA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: aT1lVgQlHvwIk1EIILIuOe7v8jrPJuEm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE0NCBTYWx0ZWRfXw3AKp0igenIt
 mAzcQoM3i/tMWgdcst8Nq9tVv20htVXF/qt0VpD4sFFfEHG3q1P1YX5jnETNZ8E2XmrsnuxoHyU
 KYc7i8edrNoYzv8P9CqG3YdP5NOfMoGK3a/UvIpHl9LzTEQGDA3jwC4xNbsZ0t+gKnTvbVQCPv+
 S7lkb5nhrS+buKimPJJjFNE9Yx098hTog/PP1wXUOAiSIoqNPIedbnA7HHDQG1oGihLJKnkfw9S
 11Azsl3Dv7srjY30RVqCO3z6w99LnlaMPidkd9O3qF+Sz04YqM13wBl8vYE/897Jwpq48E8hIBV
 1XZhMX7/xeej8YWFdGtOP7onNROzgQ5l7yoKAmjLRK6/amj+t0ATLOxz9YovjC7zbJJlJ06XnWW
 EhR2FoUgmScCNMGyAYgP/AvmZVKX+w==
X-Proofpoint-GUID: aT1lVgQlHvwIk1EIILIuOe7v8jrPJuEm
X-Authority-Analysis: v=2.4 cv=bZBmkePB c=1 sm=1 tr=0 ts=69273b86 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=vouig9Kt115S9qvWE1EA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_094022_581757_E7092908 
X-CRM114-Status: GOOD (  17.57  )
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

Use container_of_const(), which is preferred over container_of(), when
the argument 'ptr' and returned pointer are already const, for better
code safety and readability.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/regulator/hi6421-regulator.c     | 10 +++++-----
 drivers/regulator/hi6421v530-regulator.c |  4 ++--
 drivers/regulator/hi6421v600-regulator.c |  6 +++---
 drivers/regulator/max77650-regulator.c   |  6 +++---
 drivers/regulator/mt6315-regulator.c     |  6 +++---
 5 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/regulator/hi6421-regulator.c b/drivers/regulator/hi6421-regulator.c
index 69d24728d6a4..cd06030c3587 100644
--- a/drivers/regulator/hi6421-regulator.c
+++ b/drivers/regulator/hi6421-regulator.c
@@ -387,7 +387,7 @@ static unsigned int hi6421_regulator_ldo_get_mode(struct regulator_dev *rdev)
 	const struct hi6421_regulator_info *info;
 	unsigned int reg_val;
 
-	info = container_of(rdev->desc, struct hi6421_regulator_info, desc);
+	info = container_of_const(rdev->desc, struct hi6421_regulator_info, desc);
 	regmap_read(rdev->regmap, rdev->desc->enable_reg, &reg_val);
 	if (reg_val & info->mode_mask)
 		return REGULATOR_MODE_IDLE;
@@ -400,7 +400,7 @@ static unsigned int hi6421_regulator_buck_get_mode(struct regulator_dev *rdev)
 	const struct hi6421_regulator_info *info;
 	unsigned int reg_val;
 
-	info = container_of(rdev->desc, struct hi6421_regulator_info, desc);
+	info = container_of_const(rdev->desc, struct hi6421_regulator_info, desc);
 	regmap_read(rdev->regmap, rdev->desc->enable_reg, &reg_val);
 	if (reg_val & info->mode_mask)
 		return REGULATOR_MODE_STANDBY;
@@ -414,7 +414,7 @@ static int hi6421_regulator_ldo_set_mode(struct regulator_dev *rdev,
 	const struct hi6421_regulator_info *info;
 	unsigned int new_mode;
 
-	info = container_of(rdev->desc, struct hi6421_regulator_info, desc);
+	info = container_of_const(rdev->desc, struct hi6421_regulator_info, desc);
 	switch (mode) {
 	case REGULATOR_MODE_NORMAL:
 		new_mode = 0;
@@ -439,7 +439,7 @@ static int hi6421_regulator_buck_set_mode(struct regulator_dev *rdev,
 	const struct hi6421_regulator_info *info;
 	unsigned int new_mode;
 
-	info = container_of(rdev->desc, struct hi6421_regulator_info, desc);
+	info = container_of_const(rdev->desc, struct hi6421_regulator_info, desc);
 	switch (mode) {
 	case REGULATOR_MODE_NORMAL:
 		new_mode = 0;
@@ -464,7 +464,7 @@ hi6421_regulator_ldo_get_optimum_mode(struct regulator_dev *rdev,
 {
 	const struct hi6421_regulator_info *info;
 
-	info = container_of(rdev->desc, struct hi6421_regulator_info, desc);
+	info = container_of_const(rdev->desc, struct hi6421_regulator_info, desc);
 
 	if (load_uA > info->eco_microamp)
 		return REGULATOR_MODE_NORMAL;
diff --git a/drivers/regulator/hi6421v530-regulator.c b/drivers/regulator/hi6421v530-regulator.c
index b3ebd1624814..1822f5daf6ce 100644
--- a/drivers/regulator/hi6421v530-regulator.c
+++ b/drivers/regulator/hi6421v530-regulator.c
@@ -110,7 +110,7 @@ static unsigned int hi6421v530_regulator_ldo_get_mode(
 	const struct hi6421v530_regulator_info *info;
 	unsigned int reg_val;
 
-	info = container_of(rdev->desc, struct hi6421v530_regulator_info, rdesc);
+	info = container_of_const(rdev->desc, struct hi6421v530_regulator_info, rdesc);
 	regmap_read(rdev->regmap, rdev->desc->enable_reg, &reg_val);
 
 	if (reg_val & (info->mode_mask))
@@ -125,7 +125,7 @@ static int hi6421v530_regulator_ldo_set_mode(struct regulator_dev *rdev,
 	const struct hi6421v530_regulator_info *info;
 	unsigned int new_mode;
 
-	info = container_of(rdev->desc, struct hi6421v530_regulator_info, rdesc);
+	info = container_of_const(rdev->desc, struct hi6421v530_regulator_info, rdesc);
 	switch (mode) {
 	case REGULATOR_MODE_NORMAL:
 		new_mode = 0;
diff --git a/drivers/regulator/hi6421v600-regulator.c b/drivers/regulator/hi6421v600-regulator.c
index e5f6fbfc9016..e7c8bc10cf24 100644
--- a/drivers/regulator/hi6421v600-regulator.c
+++ b/drivers/regulator/hi6421v600-regulator.c
@@ -121,7 +121,7 @@ static unsigned int hi6421_spmi_regulator_get_mode(struct regulator_dev *rdev)
 	const struct hi6421_spmi_reg_info *sreg;
 	unsigned int reg_val;
 
-	sreg = container_of(rdev->desc, struct hi6421_spmi_reg_info, desc);
+	sreg = container_of_const(rdev->desc, struct hi6421_spmi_reg_info, desc);
 	regmap_read(rdev->regmap, rdev->desc->enable_reg, &reg_val);
 
 	if (reg_val & sreg->eco_mode_mask)
@@ -136,7 +136,7 @@ static int hi6421_spmi_regulator_set_mode(struct regulator_dev *rdev,
 	const struct hi6421_spmi_reg_info *sreg;
 	unsigned int val;
 
-	sreg = container_of(rdev->desc, struct hi6421_spmi_reg_info, desc);
+	sreg = container_of_const(rdev->desc, struct hi6421_spmi_reg_info, desc);
 	switch (mode) {
 	case REGULATOR_MODE_NORMAL:
 		val = 0;
@@ -162,7 +162,7 @@ hi6421_spmi_regulator_get_optimum_mode(struct regulator_dev *rdev,
 {
 	const struct hi6421_spmi_reg_info *sreg;
 
-	sreg = container_of(rdev->desc, struct hi6421_spmi_reg_info, desc);
+	sreg = container_of_const(rdev->desc, struct hi6421_spmi_reg_info, desc);
 
 	if (!sreg->eco_uA || ((unsigned int)load_uA > sreg->eco_uA))
 		return REGULATOR_MODE_NORMAL;
diff --git a/drivers/regulator/max77650-regulator.c b/drivers/regulator/max77650-regulator.c
index 7368f54f046d..a809264c77fc 100644
--- a/drivers/regulator/max77650-regulator.c
+++ b/drivers/regulator/max77650-regulator.c
@@ -68,7 +68,7 @@ static int max77650_regulator_is_enabled(struct regulator_dev *rdev)
 	struct regmap *map;
 	int val, rv, en;
 
-	rdesc = container_of(rdev->desc, struct max77650_regulator_desc, desc);
+	rdesc = container_of_const(rdev->desc, struct max77650_regulator_desc, desc);
 	map = rdev_get_regmap(rdev);
 
 	rv = regmap_read(map, rdesc->regB, &val);
@@ -85,7 +85,7 @@ static int max77650_regulator_enable(struct regulator_dev *rdev)
 	const struct max77650_regulator_desc *rdesc;
 	struct regmap *map;
 
-	rdesc = container_of(rdev->desc, struct max77650_regulator_desc, desc);
+	rdesc = container_of_const(rdev->desc, struct max77650_regulator_desc, desc);
 	map = rdev_get_regmap(rdev);
 
 	return regmap_update_bits(map, rdesc->regB,
@@ -98,7 +98,7 @@ static int max77650_regulator_disable(struct regulator_dev *rdev)
 	const struct max77650_regulator_desc *rdesc;
 	struct regmap *map;
 
-	rdesc = container_of(rdev->desc, struct max77650_regulator_desc, desc);
+	rdesc = container_of_const(rdev->desc, struct max77650_regulator_desc, desc);
 	map = rdev_get_regmap(rdev);
 
 	return regmap_update_bits(map, rdesc->regB,
diff --git a/drivers/regulator/mt6315-regulator.c b/drivers/regulator/mt6315-regulator.c
index 2608a6652d77..d3f93aae0fc5 100644
--- a/drivers/regulator/mt6315-regulator.c
+++ b/drivers/regulator/mt6315-regulator.c
@@ -80,7 +80,7 @@ static unsigned int mt6315_regulator_get_mode(struct regulator_dev *rdev)
 	int ret, regval;
 	u32 modeset_mask;
 
-	info = container_of(rdev->desc, struct mt6315_regulator_info, desc);
+	info = container_of_const(rdev->desc, struct mt6315_regulator_info, desc);
 	modeset_mask = init->modeset_mask[rdev_get_id(rdev)];
 	ret = regmap_read(rdev->regmap, MT6315_BUCK_TOP_4PHASE_ANA_CON42, &regval);
 	if (ret != 0) {
@@ -111,7 +111,7 @@ static int mt6315_regulator_set_mode(struct regulator_dev *rdev,
 	int ret, val, curr_mode;
 	u32 modeset_mask;
 
-	info = container_of(rdev->desc, struct mt6315_regulator_info, desc);
+	info = container_of_const(rdev->desc, struct mt6315_regulator_info, desc);
 	modeset_mask = init->modeset_mask[rdev_get_id(rdev)];
 	curr_mode = mt6315_regulator_get_mode(rdev);
 	switch (mode) {
@@ -165,7 +165,7 @@ static int mt6315_get_status(struct regulator_dev *rdev)
 	int ret;
 	u32 regval;
 
-	info = container_of(rdev->desc, struct mt6315_regulator_info, desc);
+	info = container_of_const(rdev->desc, struct mt6315_regulator_info, desc);
 	ret = regmap_read(rdev->regmap, info->status_reg, &regval);
 	if (ret < 0) {
 		dev_err(&rdev->dev, "Failed to get enable reg: %d\n", ret);

-- 
2.48.1


