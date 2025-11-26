Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C51FD1118B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 16:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k3JbgWsz0MgrUoNw+KV6VClK/+7GvmHIylTI2s89udk=; b=kx42yyiVhdJpFG0oU38+7B0MUl
	h4OmGYzSOJtInKdeU4gO8Pur15urpyXKU/ZlsJddnBBQzO+GuoyS2f2wt2CRDvVf4wgXFqPtJbcOu
	Cvj2gwA63JHUVXkh4TcuhbVgjufLkHWRVLcxgV6BlvtW5kr8vIc+cqx/bOs/Q0S64Mbl0U//lGQ0i
	z15pcSW25L31OPZzp/sY7iQUHqtwrCe7w9Qv489y4E1jnsmsU94gAQJtTvqbNqBNaoPOz5F9Feu/Q
	j2FWQ5kVFk51gjVzcI+n/7aJ5kx7eNSsKjXRBIJGPdsQBDH8Z2D53yFCQ+IHPXOufYrcPhXIMFNYF
	Ymx/x6aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIrX-0000000FLOI-17bI;
	Wed, 26 Nov 2025 16:59:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIrP-0000000FLH4-2DDV
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 26 Nov 2025 16:59:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=k3JbgWsz0MgrUoNw+KV6VClK/+7GvmHIylTI2s89udk=; b=dQI1cM0L5r6hY/xBeOoWpEB2uP
	9gAV7/Hs95bfVUBovJ0ZW9tS6J0h0H3M9OGx4Jo9GWFWAtcUstyTX7ZEKY2RXjszeAnPs/25rVV3i
	k3WS8Pg0I6DH1t6gxq3YRpXVsKQ7tI51Lu67FsJZsr7cFjYwlPtJQFus+NuA/tQNFFaclD60/OUKr
	DgoQFdEHIOX2EdNix/sfg03ErpfOToCZtTdyRIx5gUKdPdaMMey3+vBm+tkiRl+RQYF0BuY/i7sha
	m+fiwtgB9moto5H/nSDSCh3N6zWq4IKpGdlQb2zyjuWNMdihZVdfqVMzF5l3NPo/zbc5rpaGosIHR
	Y1nM/MEw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHzk-00000008S4V-2MRo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 16:03:55 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQG16sU1234827
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 16:59:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k3JbgWsz0MgrUoNw+KV6VClK/+7GvmHIylTI2s89udk=; b=Pn7x4zXy5QN267Fx
	phQ+eFB+DXPWMX2zPUyRVMnKXuAkPNQXoWd0RpjRpxGSq1xv0xt9ZgidGi7+/UY6
	2Q5lRK4doKzxld3kluq/bfdS33BNiSDRJ9qFMll5TdhWK4AgsIGLqtp2QqpkybJJ
	uioo39jXj6NvZqw5WqfERoXxP+eMo2v3HaT7Wtyho4V14DxiMrAQtN/kEXYnTm7p
	uE4DZUaeTzXGxnzkN4aZB7NQgbO4v/OFYrAtEcTN5t57F0L5110thT1twtsDXk2H
	/9UXPyJ4HTzAtnMpwWwZ62iU/NDVfOR7zsxPYzRCDd+dBhMhkC/CqwBvR9fJ1Rbu
	fN8Njg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anwd41mww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 16:59:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee0488e746so282661cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 08:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764176349; x=1764781149; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k3JbgWsz0MgrUoNw+KV6VClK/+7GvmHIylTI2s89udk=;
        b=kHOFFy1PFSLGVApVNt1vwDspvn5cE4AzEFwX7WV6w9R/pW66SmwvhuyCSdk/jtEcJB
         rGY363/p2eVGJnrUhawscUYkGcTFPW9hFuiKMOpF/r0daPUKJW4HMWjhSeG4a5Q1jKLH
         Ow7AeDVe8wdFETiG3gZPoLlaF4GjU/LYb3nf5Is4hI5f3V/xzBtblSFoaV7IcOmLfetZ
         Ha0mukSwF5LA4X1JBSJ7LeXM/mjbJH0JYA3VxsH6RrUNHAt0u7kj4cKGsSEspmK2dIc4
         2GLEPs2mDEoCpkoTDeOXbHrZhMeTY+7ygYphZbwkrfikNTPcI+LGH3chT1g37ub/Ao0n
         rWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764176349; x=1764781149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k3JbgWsz0MgrUoNw+KV6VClK/+7GvmHIylTI2s89udk=;
        b=fXB/Ur+zsmcXoVY7IlOwknzm3GrI3SXKbtliHvVWje8I4Y9yGFbVtRAZOW7PxjihaD
         av0f4N9f2h13WywGfF2tBhx5Lp9gu/ikW0M55xFnSixMU5hLb7xhgbgpmm92S+urMp4O
         t32jNNS2oNCM6nxjBt8GE+WqZeG+zn0QKvR9bdlLiRwLS2Mb7Xfwnbe7V6pINRmuskOH
         H3uKvuUceDk4d1D6V84K5YRpEulXzFXQehwTf+MijeW1nnbvjl3L3PHQRI8m4/SPASrM
         XzX4rmVOPUdEfSwPlj+pwTZE5MjuVknX0v4jM7JUTm5dkxXCfah41L0eTkHxryfZIzYp
         HjGw==
X-Forwarded-Encrypted: i=1; AJvYcCUVcArlZKLYNLiIXdpxEiyW+zNJv9gLdsajScUTrYkPvpYUOuDCpy648NjnN0/GpEDZCjC/mNoOOIc8ICsBTEmk@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4ECmqFG1qH+vQzpu54RhKrsVm+ah0I2dMB0uCCZ23m/swEkZ7
	6P13Ax6WSneO5y2rm3BAxQ8ZIv137qjzWkzJjMttnE1ziIC3hh4ibBilSH6JvzoKd+q3j3RrP8L
	BDpH01buE+YtAcmVkqb5P74DIEnilK6EMcC9KWN/LNElnIRRdbelf05Up1Mc8phA8/asBmygdYJ
	v6YQ==
X-Gm-Gg: ASbGncsED//zxCr8ybuZoq7k4gNUm7mU3j2Wdt4zWO5puklsv0yQ2jkKn4L5iSxkR4+
	pILjLVUL3ld3LPr7ULA/nCI4qBDqITyDQEI+vRYHrI4oHChPkxzEwRcGvnRdaHqwFQXHaA9sdtT
	VAZXUWWrEJ6v2k2hMEr/aYAd6M1ZgdiKfCxOUwNyy9O8RIwQubd1lrCVSnZ5nx+7snGLxEU9OE3
	0Rj0NeJf0mqwgpdFP2k8vIK6hW2o8iPn1GLoWTiLmCw6AD9V+2hR29ongb8Ljfrqsq67Zt2JAAL
	z1upjoxNNVMHF+xL/EBBDUOtf3IDysZKWhpPBQK4aEIXBMpPUchoZNDuSSnFhsC8lqqBOVKtuZT
	YCNWzCj5+vm4ITwlmRyt2FqGImDvc4hP42Q==
X-Received: by 2002:ac8:7d4b:0:b0:4ee:1bdb:a547 with SMTP id d75a77b69052e-4ee4b44942amr390379871cf.14.1764176348667;
        Wed, 26 Nov 2025 08:59:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXP8xwc6R66Df1B5JWgQH4iuh0Ol81d6xkP0icKm57B55Hsx263/Lx3e/3QyuggROGBRbYXQ==
X-Received: by 2002:ac8:7d4b:0:b0:4ee:1bdb:a547 with SMTP id d75a77b69052e-4ee4b44942amr390379201cf.14.1764176348111;
        Wed, 26 Nov 2025 08:59:08 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3a81sm42398811f8f.26.2025.11.26.08.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:59:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 17:58:44 +0100
Subject: [PATCH 1/8] regulator: Use container_of_const() when all types are
 const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v1-1-eeec378144d4@oss.qualcomm.com>
References: <20251126-container-of-const-regulator-v1-0-eeec378144d4@oss.qualcomm.com>
In-Reply-To: <20251126-container-of-const-regulator-v1-0-eeec378144d4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10498;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ksdKQZDZf6PSfDQolGcZw2sgxojAWSKaADH0pEqNoMg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzHR9c8eoy/Zb1bCHwTyc/IxD6/8sMI7RPdLr
 hFw5PxjURyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaScx0QAKCRDBN2bmhouD
 13A2D/96aVoQBIWlztNXHma1dMqEyrhOjl/nJwqbU4bYXR9p/7cDyCWHzZCzlJanYbCQdHlRsU3
 4XJvLpFKn3SvHvuqFc3piKonZ+WomWUZNApZFb/vIlNP+3qKj/mqckQQ6z3OxM16g9XSWstiWvh
 tJG/ALTOSWZrASQacFCckdNuYkNn8Evw1Y1r3dCyiVTy5VXph/WNp/5faqtO3pkByfVRHf0ST4L
 6z4lQL9qo8fRN8JbfqrIsun9Sf+9/57RGVcaKdiKmUwGhOeXTrfjace7hrhenXayDc705KHjpNl
 vwisst1JR5vYIHCkcmgU1NbnUkMG4q95FKcOS+BV5KHvtg1fSCm79r5EsUGNUFnFYi2WEnydKCZ
 V+Ns7/irjxSJWscArOxlj9ckOeosuoQYzN6Xf0WOHh2U2wICuXj2hiZr4keTRVjztY9/tNwYbfA
 y85fBdV7vcJ6flA96dLqBIQHVKKI9BTXFZD3bC/6EuCidR6FqfZFhvHxGequ2cVyghIkTER/exb
 3aOHQKGJTOwONquL25xJ0Vd/v8z00tEH8KZg6ObhWKrqkOTUFldmCRLBBF2Xv7bnP/R0AU1IA3e
 0GcwJVD/hzuxG/Mhd90sxi+T27+6432JhJ2TEetTwtr01w5+jmENQ/rRiXUedI67uaVyLR2w+8U
 pdjV8C1PTk32Ymw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: joxL6gwGujTBJ3wcY36SKXTU2DyG_anT
X-Authority-Analysis: v=2.4 cv=feqgCkQF c=1 sm=1 tr=0 ts=692731dd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=SzMjVNougZAxKi99s30A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: joxL6gwGujTBJ3wcY36SKXTU2DyG_anT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDEzOCBTYWx0ZWRfX3RSbviZp+xxt
 oktRb6t6Tw8EKTn/9/TJfgp54lpewHgD3zH2etM33POTTE0Rcj96LOkTzJNlXaBnXBBbcHiMUtV
 O+kjfXdqPPHE8swxVwqKGIIGeDtMA4+AxM/S0mSVYE/c+HA9BSWwvGZmWdw2Ays81VGK596mJz3
 ljSyrqfddU2Y+aTJkDM+18IjSmeAAxM1YNv6CfzaSPmOSk+nLyEfzcryluldoe3jF5cwFsF4KRC
 sU/hQEduU9crvEaEys8lo+n33ZHrCFv1Liixar1dTDW3SRidU5wUbe8hKeMbBQOesQmL/4vi7HG
 Cfsv4IAVmMAGeUWri9leNVX1TyfGXwYrh7phF008C7KOyTLVnyZUHpCSz3tsBeVeMUSsw7bbxM9
 xtGG2DOaHSSdPpe/4bNaE38562WP1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_160353_205807_679EF996 
X-CRM114-Status: GOOD (  18.13  )
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
 drivers/regulator/pf1550-regulator.c     | 24 ++++++++++++------------
 6 files changed, 28 insertions(+), 28 deletions(-)

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
diff --git a/drivers/regulator/pf1550-regulator.c b/drivers/regulator/pf1550-regulator.c
index 904926097738..037b8ec94066 100644
--- a/drivers/regulator/pf1550-regulator.c
+++ b/drivers/regulator/pf1550-regulator.c
@@ -71,9 +71,9 @@ static int pf1550_set_ramp_delay(struct regulator_dev *rdev, int ramp_delay)
 
 static int pf1550_set_suspend_enable(struct regulator_dev *rdev)
 {
-	const struct pf1550_desc *desc = container_of(rdev->desc,
-						      struct pf1550_desc,
-						      desc);
+	const struct pf1550_desc *desc = container_of_const(rdev->desc,
+							    struct pf1550_desc,
+							    desc);
 	unsigned int val = desc->stby_enable_mask;
 
 	return regmap_update_bits(rdev->regmap, desc->stby_enable_reg,
@@ -82,9 +82,9 @@ static int pf1550_set_suspend_enable(struct regulator_dev *rdev)
 
 static int pf1550_set_suspend_disable(struct regulator_dev *rdev)
 {
-	const struct pf1550_desc *desc = container_of(rdev->desc,
-						      struct pf1550_desc,
-						      desc);
+	const struct pf1550_desc *desc = container_of_const(rdev->desc,
+							    struct pf1550_desc,
+							    desc);
 
 	return regmap_update_bits(rdev->regmap, desc->stby_enable_reg,
 				  desc->stby_enable_mask, 0);
@@ -93,9 +93,9 @@ static int pf1550_set_suspend_disable(struct regulator_dev *rdev)
 static int pf1550_buck_set_table_suspend_voltage(struct regulator_dev *rdev,
 						 int uV)
 {
-	const struct pf1550_desc *desc = container_of(rdev->desc,
-						      struct pf1550_desc,
-						      desc);
+	const struct pf1550_desc *desc = container_of_const(rdev->desc,
+							    struct pf1550_desc,
+							    desc);
 	int ret;
 
 	ret = regulator_map_voltage_ascend(rdev, uV, uV);
@@ -111,9 +111,9 @@ static int pf1550_buck_set_table_suspend_voltage(struct regulator_dev *rdev,
 static int pf1550_buck_set_linear_suspend_voltage(struct regulator_dev *rdev,
 						  int uV)
 {
-	const struct pf1550_desc *desc = container_of(rdev->desc,
-						      struct pf1550_desc,
-						      desc);
+	const struct pf1550_desc *desc = container_of_const(rdev->desc,
+							    struct pf1550_desc,
+							    desc);
 	int ret;
 
 	ret = regulator_map_voltage_linear(rdev, uV, uV);

-- 
2.48.1


