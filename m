Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 220F2D78786
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 14:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mJ7RnbCsbqZV6SdekFc9SD1k8esD4C11UGzA5IGxZCQ=; b=tZgDuxVpDKvswFy5hUrXtYOHXo
	mUAY3PxH5+onIZAaHmnXCXOjruO+Ofbo+jPm4X8kkbxaq+FYZEyJPNDBgwkfh4YdDch3s8cvcW1TQ
	V+WWANsYcLAkzlJj0O6aelsi9lNjnGh30Kkr46agacQ/YQXvifrJZ2VdEWHCFD8bsuCH66T/BcUZa
	ENrnlWRdGCy0gKXYdrTCOLGi+Z3XKe2LfRsJt9D93TJg9oVOd3TfC8iprPm5ud0z6uIyz3ZdhrEof
	VRIk5YwLkv9YDTj8+O8/QRnTp8pzo19WeK5p/xNPAat3AbGj1+Yo5dyy2y6BAlzMsYf5cQ9iEFJm6
	E302eBfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbaY-0000000APzK-07hM;
	Fri, 19 Dec 2025 14:36:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbaM-0000000APpq-0KC9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 14:36:04 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBlBDO3976809
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 14:36:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mJ7RnbCsbqZV6SdekFc9SD1k8esD4C11UGzA5IGxZCQ=; b=Hnl+K3EYmUsBTOLP
	WKUR+pd29tzWcTrxfDnWjJym0NAIJMvzCAZo1XoIju72SabnOeH+Si/DSk7wWt9D
	oZMehEmfq4xBDwNtTOglEuyRmwgPGYyHIZ7vthx9Cp3LxdC5KHis5lVk+IbGd1AG
	ElFm+04c/XROzRn2bGmyaScKWTM3gcIW8QQFbwXq0V33Q2hFtJKWFfT23mz07ZNN
	1mJGKMxg3R6Rkdy8l9mIR42LL+sQ8vIvQIlYW7l0INl85Z3iYZgIVtFrNda77bWh
	ZjlQAfFoHLQPLMmUG5GeGzRg4E5HV7BLzPrqmLb5/JTr8N3JPKG6ipoSyi13Pn+m
	3fN/xA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2fjw2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 14:36:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f4ab58098eso25376941cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 06:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766154960; x=1766759760; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mJ7RnbCsbqZV6SdekFc9SD1k8esD4C11UGzA5IGxZCQ=;
        b=GZ22mZ0Uzd71ebRIj7D63G/zgFGHCVWtPHvrmsP598ZYpJ8h7ZbJSjhe5sueOylVaQ
         vs0C+5vT5ekicYIjUe+cBPpbVUVbwapZ6FGTpGbqrM60I5Fzjsja/yqX7atRyFDoViOJ
         tJKkOXDolwp5tOmiRrZ0tkPjWIJ+eXJhNZZA1BC9AZvklKAifJE4nLO1qhR8gzvxPYWA
         o7YNGO02xhQN7mIW9pZ1LxiDGihagQSPoTxySzYOPCUOD4nTvEm+X9oeBPDvDXBrwpf8
         2GY+99A7JbqiHnCvPkyV7JLz5A5rRQ/cQwBl8ueVvA96pR0S2BjjW/qBIcrjKmiR0yDI
         eFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766154960; x=1766759760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mJ7RnbCsbqZV6SdekFc9SD1k8esD4C11UGzA5IGxZCQ=;
        b=HFhhsmQf3fc6Fraq7TodcCuClqJxgq4za2S7i8uqoUC6lHQvyNxmWy6gdfpeqhoMDs
         RCH3qlwDtvmXn8Irw9PaCwoAjUtU9kRqiOzE4WOqgqBMf5NCVqc6POdjalbNP+bCKtCG
         uCYErEVxlzj0lMGC9cAuMYsa6aIGu+lFG+GpCbtCOAN7J6nwqaaclcdJJnt4Y5St1nQJ
         Ki9ZZzElJVHCHAEqfDnKjNnJfj/cf8BacwRHEM8AfQ5emkLPAcYsGbS+b3E876Ioe+8O
         lvPikzVnRRcvvJdoDSrZ3vcgw6E6DuhAeOweE2iXyQCWqPom10CPmIGSomU6JQsEc6hH
         h+VQ==
X-Forwarded-Encrypted: i=1; AJvYcCWveEix7CqOfUuFguGcgphZUseFqydmWs0uBZgC574dxcjI1WP7Dv3XarEJQEWRlVuF1/OvlsRAR1r8kflG1GhH@lists.infradead.org
X-Gm-Message-State: AOJu0YyvtOHcFHL6bUiOokvrd1lT7Ft5j57vFf5+Xd7HtWkMkvAWgPZd
	WrAmr0n4nAMepFXsh9eZxJ/mpuknP6fYZha397ZpxsUYIqxghqP9V3kzESYAgHWXBsQWBAn6vrn
	QCTQ5pr0f5E0yRw88xuprF1RGcM/i/dnLXnmUF2BwuEVSTsSGewZi5j3ucmjmH9FWTPz4pw1b5N
	z1rg==
X-Gm-Gg: AY/fxX6uH9iaQiHb5VMq95HQcfhbyWmloGjM0vcOV7Dj1T0USanU22LhuFertQ+Aqfb
	Wltwkoag3Gel/dkZwoMLbbEaa/THKQN44C+Bvo0JUIU9dHBy6l5D2k2U5Nk1Xf+FiN2c4BcfUtq
	lh6Oscy75XoOUC115FHPQypPyW04kzGEx96gruvvNnn11sBqk+F8Q2vs8+xQc4euuXfVY5son4S
	pfskuwoqdydSp3kg/F03j0ZraaTjZj3rYkx6DWiTIwWkq7mBxDEWvqkQ1Ps6v6IEJhp932wM621
	S1Ms27SkSJ82FSwjFnoGvDDVAbCtjYOZf9AKJ5UPQ2dgDNOUEGBiyW4uiHn1xPsNynhN9isLyHA
	L8EY+lkWWfcFZQvstwHEVxIUqd6dXjMcHIxRv3xAFJ61rrUX0bw90w7wHei4ZosgS7PgA
X-Received: by 2002:a05:622a:64b:b0:4ee:4128:bec1 with SMTP id d75a77b69052e-4f4abcd0634mr42477711cf.1.1766154960544;
        Fri, 19 Dec 2025 06:36:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE14Hdyk6PYivkSsJrsYsK8HqoPfU/tUKnkUGbL/VoSc0mjAxe4s8KppQKyl06O0O0KHLdlBw==
X-Received: by 2002:a05:622a:64b:b0:4ee:4128:bec1 with SMTP id d75a77b69052e-4f4abcd0634mr42477181cf.1.1766154960101;
        Fri, 19 Dec 2025 06:36:00 -0800 (PST)
Received: from [127.0.1.1] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ab7f86sm245145966b.17.2025.12.19.06.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 06:35:59 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 15:31:52 +0100
Subject: [PATCH 3/5] iio: adc: qcom-spmi-rradc: Simplify with dev_err_probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-iio-dev-err-probe-v1-3-bd0fbc83c8a0@oss.qualcomm.com>
References: <20251219-iio-dev-err-probe-v1-0-bd0fbc83c8a0@oss.qualcomm.com>
In-Reply-To: <20251219-iio-dev-err-probe-v1-0-bd0fbc83c8a0@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Heiko Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1783;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Wr5/vHqfZ3Gkfva2+k6ouaLP7uADJ4+N3dLFOeSScgE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpRWLGmaXpsHKPVC+KP0GNHBF5FoyjkihTiGxVO
 0Wee7mEOLWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUVixgAKCRDBN2bmhouD
 1+tgEACJ9D5sTugYsbqYRRJ6CCQ3oNlqtf0R6GLUE4ytsf+XShS+0sC96+5R0EPmCZpzonwX3st
 rWjZ69pIrqkt8vi4/NGrDPo+3Adjwd+2aLuHyS3q5Zw2Mc1d6E+ZTr5VZuBvmK2h0A/+cLZOPaO
 LGen8z3hLH9M++ar0raTYwYjDOcIXvy/glGwyDie9kEZ0JFaLnCnQHv90k5gUAKx3G3V0zNHs4t
 jVLznzV0/bHuDILNvP3IC7IJIWbHSuj9uucQ452vB0a62/l9JI1Q/1UwDWU4oqSH8b7Nl+J+/j0
 ZmpCOAxvxAAttvndseS8PXRQcwhYfFublNu/KXHm8PcaDvkoPbtSP/9i/dOu1iUvznZfTwSdC9s
 5Smcy3zfm3Bkh4XKngX0bmVZN+5u2QFQAR6x4FrvtIMUKsn39QYc5nz9Iu8GE5RSIHZdPyK8NuP
 yWhRFxNJ6oX2Q1dPpYJO8vcm5MGfYVZC7+N2rCgl5u9M1NPv/8qmnFo+3/rdI5V/h2f4wXQcqII
 kkH49dB7Alz57gNeRKF27a5Gf/kY0/Fev/xjxyf77JZ+p+OUIDtgPgXX7/Oo9vWSkmWez62IGUM
 DRPR+FwkGYwPEUhasoSN5DCf5E0a+8HWt2Gm+zAX0hsAOUYNptE4rAXqrrr5Xxe1umf1ksteQNc
 q+XIrxE906tgOgg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=NODYOk6g c=1 sm=1 tr=0 ts=694562d1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=AYNcBwFTG3nuAf8aWDwA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: xUgzsI81qdLHdX2nfUyjHjUQcK3ENh9r
X-Proofpoint-GUID: xUgzsI81qdLHdX2nfUyjHjUQcK3ENh9r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEyMiBTYWx0ZWRfX120m+3UOFLV2
 lyXXazi6cjnNk5UwxS0IIDeyRqRQX26UEqQbo0wDzoy7yTvooji/9+MTQab1T856B5XdraMsrll
 UEqwAnplwxKy5w7m/9kohN3B+ZdcssEG9rvvGTIzfsDPWO73EMfJ7Z+nbyZ4z1bXGbYdjnAY0Eu
 YY2bFBBQOzH5W1gEtJtLCG/7MwhEp6kz56+IOG7Qz0IvI1NhOmidA6SkHZZTPaaxRNFVh8v+3jX
 YMUEJlvGwZwfL5+yuid2y3Cr5M0gjpj3zI4Oy49LsrlpdzDmx34k28rNK69tbr/XE2Czn/jBzSD
 bCiz7lCYu3QAorsMjLZ2chHbNTAVMPuM8s35KlsZVe9WpGJ/RVOdnT24RcGJMfbv8L3HwKtSJBg
 JjxOWNRN8ucDP3MQR6QRQ913pspNiXWR3Cji/J9wQmf0HLjLOF9x9Pr8EzJSSGK/64bLPIUsO7A
 U2ETxM1kZ35PxPs2USw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_05,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_063603_621595_D56F81AA 
X-CRM114-Status: GOOD (  15.60  )
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

Use dev_err_probe() to make error code handling simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/iio/adc/qcom-spmi-rradc.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/iio/adc/qcom-spmi-rradc.c b/drivers/iio/adc/qcom-spmi-rradc.c
index b245416bae12..8e75665204d1 100644
--- a/drivers/iio/adc/qcom-spmi-rradc.c
+++ b/drivers/iio/adc/qcom-spmi-rradc.c
@@ -934,20 +934,15 @@ static int rradc_probe(struct platform_device *pdev)
 
 	chip = iio_priv(indio_dev);
 	chip->regmap = dev_get_regmap(pdev->dev.parent, NULL);
-	if (!chip->regmap) {
-		dev_err(dev, "Couldn't get parent's regmap\n");
-		return -EINVAL;
-	}
+	if (!chip->regmap)
+		return dev_err_probe(dev, -EINVAL, "Couldn't get parent's regmap\n");
 
 	chip->dev = dev;
 	mutex_init(&chip->conversion_lock);
 
 	ret = device_property_read_u32(dev, "reg", &chip->base);
-	if (ret < 0) {
-		dev_err(chip->dev, "Couldn't find reg address, ret = %d\n",
-			ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Couldn't find reg address\n");
 
 	batt_id_delay = -1;
 	ret = device_property_read_u32(dev, "qcom,batt-id-delay-ms",
@@ -975,10 +970,9 @@ static int rradc_probe(struct platform_device *pdev)
 
 	/* Get the PMIC revision, we need it to handle some varying coefficients */
 	chip->pmic = qcom_pmic_get(chip->dev);
-	if (IS_ERR(chip->pmic)) {
-		dev_err(chip->dev, "Unable to get reference to PMIC device\n");
-		return PTR_ERR(chip->pmic);
-	}
+	if (IS_ERR(chip->pmic))
+		return dev_err_probe(dev, PTR_ERR(chip->pmic),
+				     "Unable to get reference to PMIC device\n");
 
 	switch (chip->pmic->subtype) {
 	case PMI8998_SUBTYPE:

-- 
2.51.0


