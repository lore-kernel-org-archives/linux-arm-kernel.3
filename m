Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FCAE66886
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 14:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hgLU28eZkGhuvXnuaKPXbCVu7AuMcgJfWMs7HupizkM=; b=4QcJZLTeIbVq3ZEemK15fSxgGs
	FNoWnMKLOYd2Lmsc3pY1D8kG+9JdMyLy9mhIUgoTW3pmIH3QWnuE2drARTBXUdczLgJrUbDtw8duk
	Na6AcFgzsr1Y+kTlJyrERmIFeqCps4MjWDU2X+xzfKID9dIlk5CB68uSw8rXXedbIcXRm5DyhspYi
	6bKnbrHpTn1uvOEy3swVYJZZOAN62jsHghJRmuzNEz4z0YOAb+lHC9BH3dVF8+krpULutWEGL0LRX
	aRxJQnRWquUoWhOSpZv4eYUXC/JzM3XXcLUEtU1UwLtODlEvKP5BgfMvujvRvQcGgHGbVumIfGYxX
	/P2MKUDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXKOE-0000000CVZE-1bw6;
	Sun, 21 Dec 2025 14:26:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXKOB-0000000CVY0-2CFK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 14:26:28 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BL9xLwP2751712
	for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 14:26:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hgLU28eZkGhuvXnuaKPXbCVu7AuMcgJfWMs
	7HupizkM=; b=m8EUpWtXl3yU9Rj8JAnOwV47nrwluO7hLjeBfomTh99Rg6v1FVH
	7lAbOiiTId8JG875n/CBetzVQxZEHKmAMdJET8z4HgZVPs7bISugR6zXg3fFhal2
	a2UIH3pS28Yv9WxloIjcXIPDcn0gBraDLP0+7emj/amIHKMcjaK9OMFHYI+eau/j
	g3dnQQ+6l7Xi2Qg6Gm6zL2tYxBiP0vzYnwJx0KXBO/kWCqlomOL72jkz03dBO/bA
	m4GRGIlJM0YgE+6i1SPaC097B1CIf1vxFfh5mjzJ4/uXgfMt8rC2QepxY0l8jZjx
	uGgk+5Nia8r/IT/KjxAfK2djdBySTQC9QYA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mraad2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 14:26:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4edb6a94873so64292211cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 06:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766327185; x=1766931985; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hgLU28eZkGhuvXnuaKPXbCVu7AuMcgJfWMs7HupizkM=;
        b=QlZ1n3aqYUdokEcKrNXVFNlhZUSFPeVuCEOxP9jF49dbI3CmXHhfWzqupWwSNFe0xM
         tlEetFphlBgWchW9wj/MfKg3OVZay78bdrA9aVwudjo3vttsV3/k5HoAx31YOe4ceDqi
         oefXz0+iT9uxXgPSYXjyW8ypX53WLBGsPxWNoUmkAen2fOb1ggQccksZJywIgFE+BnN3
         tNXD0Ne/M65O8bUVwPaVFEnxccAqjh54BzjJ/JdD65Sd6Zxnd7nCyMXn0X2QbISlKtOK
         792auUO3is4nZIHB2rR6kE7f5Nh3BQPYYL9/MGlU06YQPoAgL+8qJSU8OhQeOAYMsjCA
         fRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766327185; x=1766931985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgLU28eZkGhuvXnuaKPXbCVu7AuMcgJfWMs7HupizkM=;
        b=w0YpmN8FBT3cfYdEHpE3CNolmhKMfUyFWa+9FtBujwr35IJcytbBPZXTDiM2kszPY9
         0YKHfAd8qEHst66Vq6hrWorkbhAaHhpc9vq1c6aMlCnkrsM+QlGGfn+oo8i6U2s3Ph99
         DGu4tLsSH++Ml2eLzUwDaTgK5lAPCG9Pb9UPgXbBZr1D2Iqz4RkmGYA/haLLfOcSi79m
         8CfA8cMbwB57d1GHsCVrwqd8WFRaQAPsqE02sG9fqbAqtO1F93Ztry+LvpmGc1y2+X2S
         r3qg5kuTdtrejAa2d3FY57orR1v4TttzaCe9wqmYVpG3WgMiVkmNZDWjPyDVdpq3MVgB
         KANQ==
X-Forwarded-Encrypted: i=1; AJvYcCW34oy2Rj9uxbS+HKGcRsLGHEeJDXTBzZ33jWTFnjYPJ1UAkJDeS8Pbpcv9zM+/jRm7f4Z6XRHcdZijzFX9/NPS@lists.infradead.org
X-Gm-Message-State: AOJu0YybIlngdyNtLjEbqQ5AcJM84JYI7qJDBcKD9pLFklYnYQPUbNck
	uhS+XIN7UFT6PS38uhnqAZaKyFW/hEhx3j9FwoePC8U/L6dTFOmFlb4vB10dOvcAPX0xizwFApv
	nWapA9cju4GIhqTEv1yT6QyxKL2ge7ItRL3a8sjj+W2OMCDNN9/dLpX60B7iwwWX3bJX4mxh/Fm
	6x4Q==
X-Gm-Gg: AY/fxX6F33GeUOw8iDmw62CGY5MZNNcBKykacB6JGOVRJzOVbILIVw1hCMEcKpdM3iR
	Ma1Q2S8Lk7jX4pZLqtjC/zeKC6znfgVXCvXX22K+GgM19SpmLV4hXnApaNgFTc2C7niaOI4nPYL
	r41CSzyWr8ELapcrLAMdhL5d62P8angZfha0/4iZJSa+Sk3RLLxkTbn0sa2gLdICnKUuFS3iibp
	plCyyFfSz3jLy6zveO4drQN9q3/k+kmjrT9R/I1udCle8tOv/8V6lMa+6AZFFkFgVB24nZNk0TJ
	NyeYeR9wNIVtqgfcwaGvt1Z/ggbyeuEY86HDBTCHDhX9pmSbamsAY2RU4mXoqteo0aVoCDA+8P+
	VL96OvIsS9KSaKDQihlZi4N72lNi1uWKQM4r1MHsiCyBKebthqPNM4BcuZZSNNbUt9VI=
X-Received: by 2002:ac8:7c4d:0:b0:4f1:ea37:cc6c with SMTP id d75a77b69052e-4f4abccef5cmr121973781cf.1.1766327185430;
        Sun, 21 Dec 2025 06:26:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1Ewwu8jx2ZwPNq71Z/1YkKihvuGLTgnEvdj7fUV4p110jAK9fWg0mU4MzcCWC6pVFe4KQUw==
X-Received: by 2002:ac8:7c4d:0:b0:4f1:ea37:cc6c with SMTP id d75a77b69052e-4f4abccef5cmr121973401cf.1.1766327184948;
        Sun, 21 Dec 2025 06:26:24 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b80620c4520sm211742666b.28.2025.12.21.06.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 06:26:24 -0800 (PST)
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
Subject: [PATCH 1/3] iio: adc: aspeed: Simplify probe() with local 'dev' and 'np'
Date: Sun, 21 Dec 2025 15:26:03 +0100
Message-ID: <20251221142602.47368-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5796; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=4memX5LYrUSHkpPHO9rC17xhoMrrygUhrVZmB+X+Pes=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpSAN6XXbmliCtMd47o2Ukt4Nzqp5wMfuT7YMpn
 B0bxk6i8+iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUgDegAKCRDBN2bmhouD
 1+QUD/4h6/Z/xjzwuixOi8qQKqxnJhDBq0SFL89uOLzuKcSdkerG6kIqP7Ohf+mL8qJq4iT9ZiK
 VsdrgMQA3s3wVXAXqMBkdCK4e9csD8bF2MAUKIb6+HbFsphWegKqmDsL43IPwZx9/Jnhc8ju4xg
 oxISsYHMxi+Lj+hZLswy7fJuPV/rlT4xRCfpnYaEaHrxzE0DHOdYw9VFuch6FLzt/KI5dJB+0rq
 7bqm2523WSW2EJ4qQhN0AIfkGnn7aQS8WFdQ9JgjvYolDnqxLqRTskV+aTUh77WY2ryH27Z/qSm
 cHHcsvZ4+knptjeLzi7tuaHR6Fm1a4PV9q1Cf6nvm2G8XflIX9mk9xTUCzqz5uFkJx4p/hW2n5R
 6owLdaaAFn3fweGPPh56+M388RM89VLo3lkF1W0ElrbFdySTYlWn00GU1nS90KlKf7MxrsWOoSS
 RaSroRmjHzXefIK6ze3kbvtJE6WWl4yhFfauKQea7oj8F2bPFtXX966l/rAm3hf2dxd1CrYdOCE
 RksgInFqSNWHu3uv+A5FBHnK3AqjapgI4O0rjglPxs4M65UEZ/Y7wJDZtriE0TYjiDNFIxl4lo2
 njHCvzlwf61GZw/aZas9Y1KQrIPiEYJeCBOcCv49+k/V6Q8WWZUJtdkLDLvBbHNzeL+MeN/gb4A JQzD7dXuG8fDQ9A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: n0qJtktJYDrxZ-EtH701ATgCd0Oa3je0
X-Proofpoint-GUID: n0qJtktJYDrxZ-EtH701ATgCd0Oa3je0
X-Authority-Analysis: v=2.4 cv=e9wLiKp/ c=1 sm=1 tr=0 ts=69480392 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Nk-rwAvTYNLgZ8AtZ6UA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIxMDEzNSBTYWx0ZWRfXyliNkl4FtcDd
 8gOZGXFnPXFslkdH7GBgMJRSeWH1WROrRlLCeGp4FbhxrkjF2lpadHxmofqj6dcb4g5jgxaSbsw
 D050Wq4mNKn2+K9nbPJLpJlMjARB2BNRUO9lotHWYbqsfusxyd+ItO0B8PkL5xu8iHt9F3qinbl
 xIgZlJWcBLauvVtrl9YNWuFgdh8rtGqZrRM72lAmYBN2bIUqmuH48VfHorcyuIU/Ois6Zp84gEW
 yv8bWHTzhZb0QoTvaUvklquSQnBPNtXwa2KuHqyW7pbwwxm7v8nB12y2voECpBTeREPGBGnwQUV
 jSoLepUFQoNdMa2mcA1bcCDYqM4jd6g0TtwENY3k+mRcNJ6JezhOKNEjKwoGrurImxtLRVVjey4
 2GfA0e5kUo6wxuH1TXHBffOsKTX2uFk+fUm7eIu8uy8zIQE6iksxyD90ozqvrvxg8wnJqmNicI+
 qGmJGKKoVUmkxqYahnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_04,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512210135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_062627_684725_EAC0C9FD 
X-CRM114-Status: GOOD (  17.41  )
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
which allows to avoid wrapping making code more readable.  While
touching the return line, simplify by avoiding unnecessary 'ret'
assignment.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/iio/adc/aspeed_adc.c | 42 ++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 23 deletions(-)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index 1ae45fe90e6c..4be44c524b4d 100644
--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -472,16 +472,18 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 	struct aspeed_adc_data *data;
 	int ret;
 	u32 adc_engine_control_reg_val;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev_of_node(dev);
 	unsigned long scaler_flags = 0;
 	char clk_name[32], clk_parent_name[32];
 
-	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*data));
+	indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
 	if (!indio_dev)
 		return -ENOMEM;
 
 	data = iio_priv(indio_dev);
-	data->dev = &pdev->dev;
-	data->model_data = of_device_get_match_data(&pdev->dev);
+	data->dev = dev;
+	data->model_data = of_device_get_match_data(dev);
 	platform_set_drvdata(pdev, indio_dev);
 
 	data->base = devm_platform_ioremap_resource(pdev, 0);
@@ -491,16 +493,15 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 	/* Register ADC clock prescaler with source specified by device tree. */
 	spin_lock_init(&data->clk_lock);
 	snprintf(clk_parent_name, ARRAY_SIZE(clk_parent_name), "%s",
-		 of_clk_get_parent_name(pdev->dev.of_node, 0));
+		 of_clk_get_parent_name(np, 0));
 	snprintf(clk_name, ARRAY_SIZE(clk_name), "%s-fixed-div",
 		 data->model_data->model_name);
-	data->fixed_div_clk = clk_hw_register_fixed_factor(
-		&pdev->dev, clk_name, clk_parent_name, 0, 1, 2);
+	data->fixed_div_clk = clk_hw_register_fixed_factor(dev, clk_name,
+							   clk_parent_name, 0, 1, 2);
 	if (IS_ERR(data->fixed_div_clk))
 		return PTR_ERR(data->fixed_div_clk);
 
-	ret = devm_add_action_or_reset(data->dev,
-				       aspeed_adc_unregister_fixed_divider,
+	ret = devm_add_action_or_reset(dev, aspeed_adc_unregister_fixed_divider,
 				       data->fixed_div_clk);
 	if (ret)
 		return ret;
@@ -510,7 +511,7 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 		snprintf(clk_name, ARRAY_SIZE(clk_name), "%s-prescaler",
 			 data->model_data->model_name);
 		data->clk_prescaler = devm_clk_hw_register_divider(
-			&pdev->dev, clk_name, clk_parent_name, 0,
+			dev, clk_name, clk_parent_name, 0,
 			data->base + ASPEED_REG_CLOCK_CONTROL, 17, 15, 0,
 			&data->clk_lock);
 		if (IS_ERR(data->clk_prescaler))
@@ -526,7 +527,7 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 	snprintf(clk_name, ARRAY_SIZE(clk_name), "%s-scaler",
 		 data->model_data->model_name);
 	data->clk_scaler = devm_clk_hw_register_divider(
-		&pdev->dev, clk_name, clk_parent_name, scaler_flags,
+		dev, clk_name, clk_parent_name, scaler_flags,
 		data->base + ASPEED_REG_CLOCK_CONTROL, 0,
 		data->model_data->scaler_bit_width,
 		data->model_data->need_prescaler ? CLK_DIVIDER_ONE_BASED : 0,
@@ -534,15 +535,14 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 	if (IS_ERR(data->clk_scaler))
 		return PTR_ERR(data->clk_scaler);
 
-	data->rst = devm_reset_control_get_shared(&pdev->dev, NULL);
+	data->rst = devm_reset_control_get_shared(dev, NULL);
 	if (IS_ERR(data->rst))
-		return dev_err_probe(&pdev->dev, PTR_ERR(data->rst),
+		return dev_err_probe(dev, PTR_ERR(data->rst),
 				     "invalid or missing reset controller device tree entry");
 
 	reset_control_deassert(data->rst);
 
-	ret = devm_add_action_or_reset(data->dev, aspeed_adc_reset_assert,
-				       data->rst);
+	ret = devm_add_action_or_reset(dev, aspeed_adc_reset_assert, data->rst);
 	if (ret)
 		return ret;
 
@@ -554,7 +554,7 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	if (of_property_present(data->dev->of_node, "aspeed,battery-sensing")) {
+	if (of_property_present(np, "aspeed,battery-sensing")) {
 		if (data->model_data->bat_sense_sup) {
 			data->battery_sensing = 1;
 			if (readl(data->base + ASPEED_REG_ENGINE_CONTROL) &
@@ -566,15 +566,13 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 				data->battery_mode_gain.div = 2;
 			}
 		} else
-			dev_warn(&pdev->dev,
-				 "Failed to enable battery-sensing mode\n");
+			dev_warn(dev, "Failed to enable battery-sensing mode\n");
 	}
 
 	ret = clk_prepare_enable(data->clk_scaler->clk);
 	if (ret)
 		return ret;
-	ret = devm_add_action_or_reset(data->dev,
-				       aspeed_adc_clk_disable_unprepare,
+	ret = devm_add_action_or_reset(dev, aspeed_adc_clk_disable_unprepare,
 				       data->clk_scaler->clk);
 	if (ret)
 		return ret;
@@ -592,8 +590,7 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 	writel(adc_engine_control_reg_val,
 	       data->base + ASPEED_REG_ENGINE_CONTROL);
 
-	ret = devm_add_action_or_reset(data->dev, aspeed_adc_power_down,
-					data);
+	ret = devm_add_action_or_reset(dev, aspeed_adc_power_down, data);
 	if (ret)
 		return ret;
 
@@ -625,8 +622,7 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 					    aspeed_adc_iio_channels;
 	indio_dev->num_channels = data->model_data->num_channels;
 
-	ret = devm_iio_device_register(data->dev, indio_dev);
-	return ret;
+	return devm_iio_device_register(dev, indio_dev);
 }
 
 static const struct aspeed_adc_trim_locate ast2500_adc_trim = {
-- 
2.51.0


