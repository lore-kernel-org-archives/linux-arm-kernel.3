Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62FB8D1118A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 16:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eikYGZPX6lrV1IJPXaurHo/qZqzuHDqLnrPvPuI5kdM=; b=1rTP7GLQropB++Z1XdTBMi+MnB
	gXCOexnkgX73dX1Rd7KmtKSbkzZdbkLPTZoZ1VHhHkzaQpmnZeAVVkhNZf1eWawHvZJEAA6obx7Zs
	OusWjx0sM1i4Wwn47wxWlKe+IYzJAX14ZXQX6tBkhFMzI8GE0tzKHOlNiOj53aG0LtnXfJHOB8daI
	zaNieGfI93bsnauwWydIKGaEPDuiZzjQYs9V7A1MYTw6LQYyS6BKn+HMBe02JsX3LpT/N2Lf37hwQ
	L4vgM3To1yfdkbEZSi9EmuaJvL851UDxJaieQ1AoGe2q7e4/6AsoRBPhJX8quYSzDSuT+yyLyriTW
	HX7yRJNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIrR-0000000FLJ8-2RXM;
	Wed, 26 Nov 2025 16:59:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIrK-0000000FLCi-1572
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 16:59:15 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQBNxU61849691
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 16:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eikYGZPX6lrV1IJPXaurHo/qZqzuHDqLnrPvPuI5kdM=; b=UGSUQDDhRhXxvsL/
	CFeaQtpIxFRcb4GXL/po5P2L8zkbuUyQNSzxKCwc4ZfjVBEVNsvKU5uXzXKoh53e
	qGlMr2qxLNChXMefg9OJvHPGxQ6L5gCR1nhov6+mwUvqKutk5EScifYCDQLkMJ2a
	6CWBG63ubTGAfVnFi6OtMhvwgh/GeYF/ulAd+m5g82QWYaDEXtC9C3EjgizOUBD6
	8x5P0nRiuekBQljpvlTgIYa48ce4AYBgBv3L1Fv1vZGfUcttnfQ28IMKAG8Xoh2u
	wuNz7FkGpiJ+tBUgTxZ86kGoSXa4TBka5Xg5g9OZ9m3viNMYjr6syVjxGkIss6ke
	ij73Rg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0msrxes-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 16:59:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee3296e984so739341cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 08:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764176353; x=1764781153; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eikYGZPX6lrV1IJPXaurHo/qZqzuHDqLnrPvPuI5kdM=;
        b=YB2iNCRmLQVNuw7TVaLvXhaP1Y15MiwTtTX51/XRrycokWbQWN3/aVqYB9HydTPWOM
         288gPYBIICKatS5m2Kc+M0OHZBhg4dtfpAQCaGfdvYq0XJF1PjGHHY+k2q1Q8IUa3aVw
         t/ML1CF/idedZy64ZMqTTeQ9LZJ1mXyBme5XPe4NgZEwwpAR5pyd7bqEsah+JVY0nlm8
         ISdl5ArKy5qBqqbg+QU4dlQBuOkVvouolwEMdmotTRXWGVwiDPfK1ujQZG+HYy3oNO9z
         curEqyedtv1uhB0hysH59Pt2YyPg0k/PA6WuHZExguS+rw6GFc/EwQ3o4SAHCH+fApJQ
         VBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764176353; x=1764781153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eikYGZPX6lrV1IJPXaurHo/qZqzuHDqLnrPvPuI5kdM=;
        b=KpowUZhGXDyU+piH93i5NIeI6BWWzdBfPerk64C2kZfDb82CEva/BgOFCwU4An5vhj
         nbtq2GIiv4rCF4/xeXBUa8AXbcEY2r2xJXDfood7DVFK5rpLS3GNXxOhpECgYB8tdwua
         33WqaNGGZD70sBLboEL5ODObhjTbuheRXnHE5+PpHXT2aeTguG3wy4lQzJfu8WWlf65V
         AB4APP/KZXo/9CfClDFl5rCVo4kNkYk1eNRFoqGw/hInjfBsvNynzl55hs+yZlyBmnOb
         dFWhoyiLagk6tFnFNCg9StUU87j6kwn4TMmfKJzc/YHadii5pEHEsjadU64gAHz5QRLc
         Zdgg==
X-Forwarded-Encrypted: i=1; AJvYcCUc8d55T4+/sXNquQWjebNmlBt+50w5Ao7vfA0T+yBJFUx7/58//iJdSckIiczEsFSEhAzR0KIDjwRI9JJRFAue@lists.infradead.org
X-Gm-Message-State: AOJu0YxjexwXRGJWJnsu2BPNdfgKkZZSEbPVLRl/G+in66ahMYiY5m8D
	zG/KUBbXD4Pngqm9MYNMDqfpVXyWgKhkymxOsyYJ0vT8XwWSiVRp3b4PZspAiJ0lgK5VX7jgnae
	9wQxuruZiEABCr/aa0lHseMaO9A5mIlO5chKrEm763ddx9Tlzgf3Lj2tSADiO476NR8WsJxOv6t
	T7Aw==
X-Gm-Gg: ASbGncsDYsP9W5YYAmbGmFDo/PHEWSx6EeA5p3StmGX1AWY2S64NGSUG/d568+W2d6A
	xZ9lBhJuQ69cUJlZuGAPc0jrmcbI14CG3N6jZQoRboXbb1IsyJ8NGi6lsvkS4vjxEfoXweyuClu
	JzDGnCXktTPakmuJn57XjWCF78J81QZJS8pxykoQtwSdtg/OZZ6+DoCQxT4BUXBGVMLH7Ezuy2+
	ag4Ig50LJ08JK+xUhErSmsJG9xwKwbUfoXpz2XQasbSHY9ce1yPcsL0sgQlyWXCsV40rPGyaAnA
	Qyp01t+kKshofh+SklDxq2AZLd2w0+0XQA6aBApcmEhUu+SKOHyjKL4eEd3ph3b1qBowQRMUHvZ
	KTappGSkF462pgE2bdUUsP5yuGx0EpZelrA==
X-Received: by 2002:a05:622a:1a22:b0:4ee:d9a:8877 with SMTP id d75a77b69052e-4ee5894f754mr301719891cf.72.1764176352833;
        Wed, 26 Nov 2025 08:59:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFFNJfMA5YGMK2a1B1clwXb0TeWG0h5ObbcP6jqY2pgY5UGsCXOEnBRMkFRRZT8Gb+jB2+8g==
X-Received: by 2002:a05:622a:1a22:b0:4ee:d9a:8877 with SMTP id d75a77b69052e-4ee5894f754mr301719411cf.72.1764176352359;
        Wed, 26 Nov 2025 08:59:12 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3a81sm42398811f8f.26.2025.11.26.08.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:59:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 17:58:47 +0100
Subject: [PATCH 4/8] regulator: bd718x7: Constify pointers to
 'regulator_desc' wrap struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v1-4-eeec378144d4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1101;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hS8RVWi3XaF10PpDUVAlrbmypT/xVq1XUUFF7etuthE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzHUTLtRuGEhkFoXFkaki8FZ9a2VF5tTfLOBZ
 RYcGLx2w4eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaScx1AAKCRDBN2bmhouD
 17Q3EACROfWHE+jjlQlJ5WoREWxGSbBZfoYvYbjXZLbkFP37lg1HeD5Vkc+nHsWHcb7p2vBadA8
 tmuad3RDqYNM8in/+QBkmYtWM2xcSB7xBICZ6QP9j/2bQUOFohJ8K1b4eerzzdWoeIB3mLddLA9
 p9wMxec2iqA7SwUTH9QLRh8aRYcSwIldtsJDUqBEHbtta1O9P0cmpl9kSYhEZKJmyIL3B3HHMZR
 ytWr6UzkcmmoNuQJkPyyG0qx+6hCCu6oK7o1rrwD72oekhi6B7Mb8iGwsXXLy0YVQQBYdITHijD
 d0Hv29u5Sf6ATxURSfth81Lfx3auxgN5NuHRv3t3lTMTU7D7h9FuleMfHGvMiVUOYdHVZJ1rel8
 becxFcHQ2Pzp/sYccUtffpem+pLMHXwdi5W9rF2WT/pjdPlR2CjAl++bsAm8yRIN7lzPwaW6LM8
 0uDdOq+GF+L/vHaLTL0S+WgV5Lzy8cf72u0lic1NGKhk1uoMSGcQ/WtgONpBotBfZULKlYdhE6k
 LG2yrmz/3vYyTUBR39ZgOKdhRceXWOKlVAw/hIQ/RU/lNRkPbBGyXvUgYE31B46QLJBLzpEXrVG
 SkYC1a5w0HpZnJmoMzVcnwfEklJynTM/RLyZHQcAGA1/RUFkCFK9O7WZXgrxgNjG5UvUmRad9wZ
 y944thVw+3wXbyg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: KtFbNFwRH6ua2UzssHV7VxOtNcxmaREu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDEzOCBTYWx0ZWRfX9pvrOqO40jm/
 LlGIT+ksLXgRwspjSgltALtjUd6i2I7EKRAwI6DzyAGxmuXXuoLJ7wVjwFUcUXXljLBVSu4gn/h
 5hwP+7sD0qt+qTbQIS6VrJu5eznhR74NMiSrXmsh6SRTvoVdsOTZ1XJcH/gla5j3tLqoiQ+oCRF
 oIY7cYBVuwsxI/lnYeK1qF+/BIhzuS+6820ujqLxflaB9SezsGFWjkFWhH8q5WZ60tzCqMCEwgv
 r0b5s4RbQLjYt6MiObL3+ZMakfNT7IegN9LLMfnU6WM9x4mDZDBZ++pISTs+nElXlVYbqmTn3eF
 pqaMnf6zJ6jiS5Bo+O/ilOiRUpLN+3v7K+so1FRk6NSz1SlfPe3rO51sdZc09XxuV+k9FXuRUo+
 6HBSn2IbW5WQNB5Y8weXqcVZGOmY8g==
X-Authority-Analysis: v=2.4 cv=N5Qk1m9B c=1 sm=1 tr=0 ts=692731e1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9MRJ1adic_HRPEocbcUA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: KtFbNFwRH6ua2UzssHV7VxOtNcxmaREu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_085914_328283_7EC4B5CF 
X-CRM114-Status: GOOD (  16.95  )
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
 drivers/regulator/bd718x7-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/bd718x7-regulator.c b/drivers/regulator/bd718x7-regulator.c
index ea9c4058ee6a..1b5997c8482e 100644
--- a/drivers/regulator/bd718x7-regulator.c
+++ b/drivers/regulator/bd718x7-regulator.c
@@ -698,9 +698,9 @@ static int buck_set_hw_dvs_levels(struct device_node *np,
 			    const struct regulator_desc *desc,
 			    struct regulator_config *cfg)
 {
-	struct bd718xx_regulator_data *data;
+	const struct bd718xx_regulator_data *data;
 
-	data = container_of(desc, struct bd718xx_regulator_data, desc);
+	data = container_of_const(desc, struct bd718xx_regulator_data, desc);
 
 	return rohm_regulator_set_dvs_levels(&data->dvs, np, desc, cfg->regmap);
 }

-- 
2.48.1


