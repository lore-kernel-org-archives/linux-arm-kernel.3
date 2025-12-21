Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4800E66886
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 14:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cXrQ0eZNLwvaZ+XYDJE/L7mMaZiYna99KUBbaqbUVsU=; b=lDu6/57TzL5G8RVuQ1EO+iMaik
	PK2tYIN1Fx9tuwS0FrmMe2z2h9zQ+an9CCaEJvDbU6/yS47AgMhm5/xqbssx5QTacQ9FCLFZPQFzg
	6iptTRWj3Bv/V/arbpvznhlF7TW70yZDxvI/tgH0MvRaqPifVaZk6AOuap6e1WbCiAO3zkHanQgsh
	Oc2I2lhSq2QojSWI2bX/FfaX63tv8dlnULQS+60TSkoZnsf10zvyeQ5c7iyqHF69b3DdG+Ryq5SUV
	faPFz1bdClLYdwmb/VkblQVuvJ/2hjAzQ16eDTy0WAa4LyHriGN9fTmwPAPo+KQzVmm6vpkYdY5kw
	ZKUK6XNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXKOH-0000000CVcD-3C38;
	Sun, 21 Dec 2025 14:26:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXKOD-0000000CVYY-0JoF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 14:26:30 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BL0Cfvt722773
	for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 14:26:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cXrQ0eZNLwv
	aZ+XYDJE/L7mMaZiYna99KUBbaqbUVsU=; b=ESqqQSPkedBLhNq/E4CyZq1vCkD
	mpS6lcHajHlLLq/IzjSJkGONW3Tznz5HDQnY+sJEDU44RT5HXK84eRAg4auDDsZt
	zLLXjBpYr1sqVkGKeMxBfU+iRF0ltmCP7OorhTUfUIrexKTjYOhdgXO1uRnmTTOo
	RYs66G5eVwg5VkaTjWa76ONagbOYxuX7LJ8ZseR6gac0w1VDbJtk+0tn2mZnS/p9
	RtpsflX7YiFYyf4JPZCHTg4e78dvWbgGf9ImF6xO9beP6TCqGEwd8DVsqpquJ/2m
	X42Ay2Vjkaz7PLsknBt5NgF2+BFa5mxDqxmuCUkOgnZuaWs4fT77J2KgHDA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mtqjdm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 14:26:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1d2aa793fso82452481cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 06:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766327187; x=1766931987; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXrQ0eZNLwvaZ+XYDJE/L7mMaZiYna99KUBbaqbUVsU=;
        b=biSV7DQLngO0r4Pc1rNfpJfcIQhXTfziHmO9i/vG3b5vHpzxJcfTNMjYWtYLFsEFpa
         XV6eMm/5KrZUPO9NbRHIoo3K/K2nJZ5k02rzxq5FdUhXudMjAoSxZ/7OIpwDXhlGRwUz
         qQSx6JXRHKWdgwkbyaRyBz6B9+j7CI+rd0fnZapoDGSfp/s1DQ9DUsd+AoX7RkF9C4TP
         Qk58SDZ5vikxiB4kSon1um0DwluV/I+KGxNEkYH4Sg+iEhtIkKrRLCaB0i3y6OVor9Ju
         g42rIxPlC4Hzv+UhRQ0gj2X3e1xdxotsG3ahNZreDH+iE2jVTigApRAGrlRze9iEesZR
         2SMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766327187; x=1766931987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cXrQ0eZNLwvaZ+XYDJE/L7mMaZiYna99KUBbaqbUVsU=;
        b=lgqB0OwqpTKSxXi2xzaYrZi6Pb+6NTVuGUze+3tCrzOBLEjpjlIwd/wnS5RsZV+Fal
         rSJtCp2/si42W61Y0M9mK/6r7tMOmQ1vAFH3RncCqJ5zl/DVYVaV8AHbE0rQZv2KBUUi
         uU9qTqim1Qjm7uOTJX8egYngZWnDgeksqs90ZaxrXTcMADx3t7znzxeYifsyd8tvPtCO
         TOwAAR1dnG6r4/SjkmbabdlF0L8vBL2oHUCOGzRrS3dVCDc8RcZFaebKBCzkSM8SUedt
         rOd7TBUkbB+p76St7Fqokgda9URBzBu8kSn3sVUfSrU3tTLtOIxDku9b7V/XxZT6CWp9
         tFGg==
X-Forwarded-Encrypted: i=1; AJvYcCW42cvVU+L2gwpMSgZjsY+Vaz6j4oEDwNmFaSkgN8PUtUbLmr/WpYApQNoZh4+PWuqI84xQcfABYjDkqSC4A9on@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/OhM88Ix3t+dfv/MtyahpwxZkOO6uucVPkFpavOKlW6J/2EvM
	YMhuA2kG2T8dd6utaAcQbCHBPCe07WlwmfPXRAL+ls6uvDH+35aclAi4AImgpZEfJMT7oNJXvGA
	Z7AmEs5G6GgaMioDFpd8YW+58bnRFFvSZVyd/26x6GjQ84obnDZl2wdEZ9AHUQ8vMeLt5z85u/q
	gMsw==
X-Gm-Gg: AY/fxX6dlQH/FbZ8gRvLTJFWFXXgxeegvo4U1BcYyv4tNpSLMN41MtN7w72/5nNJLUE
	dMY2cei2KrzO6EiJsbn184mjuBINsjIjDF5UUmpBlQbDsr8jCAWKSwFmYNv8Sm/KxMYZeAH0iUq
	rnqiMom4XrNuAVAElH/9N+RVJWOJL251lE/C2bVkwxy6eh5YtEX1Uz9Qu2lF/SDHiu/h6zgW2av
	4JpQNOLxoMyIhZvdFagDlfYX9aD/I7I/Am/4YME+dkjwogS4nkAS5sbR/TagYi1tXsO3tzHZHw5
	pV6jFFcSHOFJsupCrXe1z3rEAxv7779oZb1B3Z3Su4cOHT5mdI0VRYs7nwNLd+6QZOkC8tsR2VE
	roWfYqI8HcdhryRD4EYjjjgsFaL0FibMnziCOSJ4uJZoKfpGzKim3qf8H5JSJb1GzPYo=
X-Received: by 2002:ac8:6f07:0:b0:4f1:83e3:bb1a with SMTP id d75a77b69052e-4f4abcf86abmr121194981cf.31.1766327187406;
        Sun, 21 Dec 2025 06:26:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4X1T9bdZZS/qvpRUsFhD2vRTGIBwr1akucMiS/SqlqEtSXJi9+JqEGzxWGbwmBgDxvbN0gQ==
X-Received: by 2002:ac8:6f07:0:b0:4f1:83e3:bb1a with SMTP id d75a77b69052e-4f4abcf86abmr121194621cf.31.1766327186904;
        Sun, 21 Dec 2025 06:26:26 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b80620c4520sm211742666b.28.2025.12.21.06.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 06:26:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
        =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-iio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/3] iio: adc: exynos: Simplify probe() with local 'dev' and 'np'
Date: Sun, 21 Dec 2025 15:26:04 +0100
Message-ID: <20251221142602.47368-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251221142602.47368-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251221142602.47368-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4355; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=K0IQtqWX619jZ9YkzBmDaKMoDdmrpKcT02lv7CF+pGE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpSAN7uXaCJu7ZGPqhfs4R9Ef5h9276gYJLaLUY
 YKtXtzQRLGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUgDewAKCRDBN2bmhouD
 1zfqD/wIktSEHD3nlDu4v1bjhJA+iTTRm5qqTc01Jd3T7PEFYcGXDQQwVYANojieNLNhQux9H/p
 NFLX3aSMRGGDEtulqa8DTrHo70IujJZnb2VvTTwdsT1tLHm2e3cIJu2tEdsuSICwS/NYNbpJahV
 BwjaeUk3isJfSeqXAP6Csj3zU4RfoaB92oRmTYaBj3eORohYq6iX/4Aau7uY4KTPR/L2Q979/L2
 oK46pTx6bcGRSMxerNyqWfkY7wFEnldgowWv+xTWy8+zUeEttz+1RTfu/TZN3KMTkwPJo6EQNHU
 cYv/XezRWPAZdmSeVmsNQARSPCZoXtMw8kY5rq3m6NdJaGe/epLes9YKEEVao3TqboDYEtFGpws
 +N1kQjjwOjdRLTBufFRlH7Srs3LK7s7fliDsvr4QC+Ds6HVcj9VQ629ELMv7HOVj5z1L6xtGB4/
 2uHJWxzoPAY0CvX1tuyVHtvXrc9W4i4hAe/dNXmPpkgY4sndzLGcjsLtfZNNSHzRozcPVo3LRmQ
 QEsDz+N1VL2jw2fvLPTeV4GlwIFvlwXk9g+Tp7XFsQroqX6D4OTzxudmqlMPnjJcrcF0tvZMlol
 mMO9nAe9r45SZ0mNUNB+DdalACiMKdZxySYOp6/HwvPbxNagKQxBEAAnkQS2cnW/OIZdKLBHhdD StOStPPzq1Gm0FA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WYAcC-VBdJ-sTbjt58ilMlHoRHyZFS38
X-Authority-Analysis: v=2.4 cv=dPWrWeZb c=1 sm=1 tr=0 ts=69480394 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=XA6BSOE7zRTYN9-09qgA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: WYAcC-VBdJ-sTbjt58ilMlHoRHyZFS38
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIxMDEzNSBTYWx0ZWRfXyesYucdglBkb
 a283cMim2bS5zBWOoso+BpWnFH0YoMIF2FQTa418vrDhLrJLaXI7x+jFW0dTATWJGA+YGzX3nyC
 7QklOZ5yfYSzGaTDUk99qlADrjNhTCRqfeQ8x7yZQ1JfBf6xAWnbKR/Ygiy5GCjBI7bTPzQXch8
 n496ke5hva/NunrZK7nXZ6+4VGv3a+4j0RTDAIa2mvkuJfWy/eUpRb5UHuOTH13CN39vj/u8TJS
 lo6BbEcisR07RzPWJtD782AXRem7I9YTJdczhKuDGgl2tMSpXm1PF2gpgBOu2duy1E6Dmmh4ng1
 FAYikJ/JSRwOdxYtG06lBnArzDfR/ajhU88VH7qxi1KovbBufqnFnuJ5TZdqPfYwGeCRP032s6s
 8EgMwdetg5RITjVKD9X7vIVYIJDmhA1uvBVn65N4QPZsIZhsH8hT826lBYVSd8k/chOHNQZJLHf
 9HEUHyf7sRY2/mggaQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_04,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512210135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_062629_228229_3FDCEEDB 
X-CRM114-Status: GOOD (  15.86  )
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

Simplify the probe function by using local 'dev' and 'np' variables
instead of full pointer dereferences.  This makes several lines shorter,
which allows to avoid wrapping making code more readable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/iio/adc/exynos_adc.c | 36 ++++++++++++++++--------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
index 491e8dcfd91e..aa287132a369 100644
--- a/drivers/iio/adc/exynos_adc.c
+++ b/drivers/iio/adc/exynos_adc.c
@@ -552,12 +552,13 @@ static int exynos_adc_remove_devices(struct device *dev, void *c)
 static int exynos_adc_probe(struct platform_device *pdev)
 {
 	struct exynos_adc *info = NULL;
+	struct device *dev = &pdev->dev;
 	struct device_node *np = pdev->dev.of_node;
 	struct iio_dev *indio_dev = NULL;
 	int ret;
 	int irq;
 
-	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(struct exynos_adc));
+	indio_dev = devm_iio_device_alloc(dev, sizeof(struct exynos_adc));
 	if (!indio_dev)
 		return -ENOMEM;
 
@@ -565,7 +566,7 @@ static int exynos_adc_probe(struct platform_device *pdev)
 
 	info->data = exynos_adc_get_data(pdev);
 	if (!info->data)
-		return dev_err_probe(&pdev->dev, -EINVAL, "failed getting exynos_adc_data\n");
+		return dev_err_probe(dev, -EINVAL, "failed getting exynos_adc_data\n");
 
 	info->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(info->regs))
@@ -573,11 +574,9 @@ static int exynos_adc_probe(struct platform_device *pdev)
 
 
 	if (info->data->needs_adc_phy) {
-		info->pmu_map = syscon_regmap_lookup_by_phandle(
-					pdev->dev.of_node,
-					"samsung,syscon-phandle");
+		info->pmu_map = syscon_regmap_lookup_by_phandle(np, "samsung,syscon-phandle");
 		if (IS_ERR(info->pmu_map))
-			return dev_err_probe(&pdev->dev, PTR_ERR(info->pmu_map),
+			return dev_err_probe(dev, PTR_ERR(info->pmu_map),
 					     "syscon regmap lookup failed.\n");
 	}
 
@@ -585,25 +584,24 @@ static int exynos_adc_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 	info->irq = irq;
-	info->dev = &pdev->dev;
+	info->dev = dev;
 
 	init_completion(&info->completion);
 
-	info->clk = devm_clk_get(&pdev->dev, "adc");
+	info->clk = devm_clk_get(dev, "adc");
 	if (IS_ERR(info->clk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(info->clk), "failed getting clock\n");
+		return dev_err_probe(dev, PTR_ERR(info->clk), "failed getting clock\n");
 
 	if (info->data->needs_sclk) {
-		info->sclk = devm_clk_get(&pdev->dev, "sclk");
+		info->sclk = devm_clk_get(dev, "sclk");
 		if (IS_ERR(info->sclk))
-			return dev_err_probe(&pdev->dev, PTR_ERR(info->sclk),
+			return dev_err_probe(dev, PTR_ERR(info->sclk),
 					     "failed getting sclk clock\n");
 	}
 
-	info->vdd = devm_regulator_get(&pdev->dev, "vdd");
+	info->vdd = devm_regulator_get(dev, "vdd");
 	if (IS_ERR(info->vdd))
-		return dev_err_probe(&pdev->dev, PTR_ERR(info->vdd),
-				     "failed getting regulator");
+		return dev_err_probe(dev, PTR_ERR(info->vdd), "failed getting regulator");
 
 	ret = regulator_enable(info->vdd);
 	if (ret)
@@ -619,7 +617,7 @@ static int exynos_adc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, indio_dev);
 
-	indio_dev->name = dev_name(&pdev->dev);
+	indio_dev->name = dev_name(dev);
 	indio_dev->info = &exynos_adc_iio_info;
 	indio_dev->modes = INDIO_DIRECT_MODE;
 	indio_dev->channels = exynos_adc_iio_channels;
@@ -627,11 +625,9 @@ static int exynos_adc_probe(struct platform_device *pdev)
 
 	mutex_init(&info->lock);
 
-	ret = request_irq(info->irq, exynos_adc_isr,
-					0, dev_name(&pdev->dev), info);
+	ret = request_irq(info->irq, exynos_adc_isr, 0, dev_name(dev), info);
 	if (ret < 0) {
-		dev_err(&pdev->dev, "failed requesting irq, irq = %d\n",
-							info->irq);
+		dev_err(dev, "failed requesting irq, irq = %d\n", info->irq);
 		goto err_disable_clk;
 	}
 
@@ -644,7 +640,7 @@ static int exynos_adc_probe(struct platform_device *pdev)
 
 	ret = of_platform_populate(np, exynos_adc_match, NULL, &indio_dev->dev);
 	if (ret < 0) {
-		dev_err(&pdev->dev, "failed adding child nodes\n");
+		dev_err(dev, "failed adding child nodes\n");
 		goto err_of_populate;
 	}
 
-- 
2.51.0


