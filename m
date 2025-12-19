Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F04D74970
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 10:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3IDPx0z9gonIKpAudg1HfQLLk1WHlUCJuXDV7vFQm18=; b=h3SzHR3YwBBbjB5rVJQcCinGW7
	Iy0cFrr4nWueFb28FJ+4dxqb8gpI55aCFxA0U0YkSh/7g/gsQ6Y5VdWnTSBZI/QtVBjVqa8XkHAKD
	pMHSTkZdDsnPu7V1ZReGVekFs4jyCSb2GtgVzqAZNHhKar65TjbqGoUdgv7JNDdK+TpjQvF3miwo1
	9AhikzWdDbX+YNxPYtvDNCgZ9bIU9/j+oMortYkMarMptFtiRpgWS4W8GN7IeObk+S8U9zpJKacLI
	MKjPfE+3QxwAMnUckOVI9GyO5WhFvfQQlRlMOx37OCin7N9WkkfTvEJRroesZ5glnxj//xzi3qOge
	6tyOFfhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXT1-0000000A2Zp-29Hq;
	Fri, 19 Dec 2025 10:12:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXSy-0000000A2YT-0oDp
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 19 Dec 2025 10:12:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=3IDPx0z9gonIKpAudg1HfQLLk1WHlUCJuXDV7vFQm18=; b=hTkmoSjwuf2EbKE1WEBzFKzgrB
	2Pugq7tNPS1801eqddGn/Rdizfl/Q8i7o0FoSDvdwW0uEap7t8wHbccK2wd+JAxcc9rnKXMlnV+p7
	Ippyin3aqW5i+sk7JNZm2yovaZBK7Rk3p3lHAfAgIhpR9C/+7YUmxtbmUbCIM2PzWr6bTRE0Cdu/k
	HjoF8gOISwK2VAkh/Q2RkPWqqMRD7vywJnVRVWFou+aI5Y9JyQD85/5iITZtL4qYAJy6bkz5gfd67
	pp8KekGuEqTZvdjslbCi9CDKqOrJ6T34V+EXx/WePJgtvNNFbgCYbCAyrCR63ZqdtgJijFWX+Eg4m
	OHHvVlsg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWbS-0000000AYdC-3oHt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 09:16:52 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4c8Pd3975650
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3IDPx0z9gonIKpAudg1HfQLLk1WHlUCJuXDV7vFQm18=; b=Dfb6VnVocYk2+T/k
	LWkQWiOsZbC5NpilKGZAmHw1z42Sq2p9K4E06H5gd793Xw7OHM5cCCCvUxY+2Tg3
	oBfDCRDwjRd68Yg3BOSc4jXxx12xKdpK3MNxSVQHxugTHkK7x+BXzZ7oFIaZ84xB
	ZTcdSaJovlVJYSBlMjxebTNVT5UT0/Kfo+u3ZI/4ox/8vopyK1p2/+LzuWHk/R3Q
	W3L4ycnd7dRYriVZN6nANEtfCx1UIdDN1Uc2KWiZ7ynEXRFzRXo/k/EyvxTpxDG0
	EbXBBo7GDru8OdToSlXziNniFUJe5T3w16e8MvzzNDkt/yIYYa7xM6f3uCwRYqkv
	847IEA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2fj6na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:12:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edb6a94873so29753791cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 02:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766139122; x=1766743922; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3IDPx0z9gonIKpAudg1HfQLLk1WHlUCJuXDV7vFQm18=;
        b=gOWl4sPRwsuWP602LVVVuDM1lWpSExyf7+D2dd+fqbGzAjHEwKb2NwXvlppqwUKHaK
         YlvtUEiSQMoZDm1AvrZYmp1mZzBuOtxFDSWRT2MYT/nf1j5dZP2eCqWVbJHml9ba5XmB
         jwOGltD4irdgFH5PXUseCUOfYs+5p8GZoB2MKc8sYhSZqC8sYf+C0QThERQigdGJV2Yg
         ReiffjQ1yJNRSJ1uZC2kbhN+jSC0VgXlJqu/QpBene2rAac+HdFXGk2Fb6W8MHBNcNqO
         aM0+Ju9EJKKkRbuGSaoDwAcnI4PNaH8/hJDeaVW+kHC/qJ0uK1/3v2P2atAOdqthOn9/
         XxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766139122; x=1766743922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3IDPx0z9gonIKpAudg1HfQLLk1WHlUCJuXDV7vFQm18=;
        b=vjZsFa7OKJ+X2eJ8d3Ons2ZogvcTOOrJ4vMnsK2145fgPVbIwaF0DPCUY42Oq6JClt
         Ez1D1j5ZKl19+tpGpH6xWqxdi16ZYiUlffDPGB1Uyhuuqf1U6o4wZVdF8gU7Z4JF4jnB
         m6Lpf2/V41JfXVnvyAqYkSoGEUWbKGaOat2yAdem/tD326GU6oXOKNOd7D+HUI5yFGJ8
         //ylhhJA1h+lvWEfNMnljg261V9mU1XYvfm0R3qxpkAyzr5hUjksOzmt6UFcB8zI8Rtb
         m0JWEukqleFW4VRg8Wnw5gvshCHxb0maNF1YKzSx4rc3xxUOm9Fkn1FWvwGd1v6jHtKR
         zjcg==
X-Forwarded-Encrypted: i=1; AJvYcCXbHImY4e/XmaJ6Soieqa3tBENJfneAoePHHg3U0ul+X7v3WxnsqLZf5Sm2mc9iCS8KvkrDbDp0m2noWUH127SA@lists.infradead.org
X-Gm-Message-State: AOJu0YzpYPiHmbFZkEeM7Y6diwB+NKYPANPuFz5ooBS1DR3/DhW4lVz3
	IJg4llEL+paod1OXboV6fH7UJVivErHzaPax/ORlKBtpnBhHLQCuLiT1w3FH6IutJPkGkKCzDJd
	AcDpEkWeYVHQQrPW3q+cGUZkzcZhgOgrVsNmRwZFCh2RGaTXnqRLGli+Gb6B5cK+qZSC442XmMV
	aEL0NSOfBY/w==
X-Gm-Gg: AY/fxX47Mc1B4KhXq6J5k4kHcV5lgGGJ0tAl5vZIOH+gQJ7g++Zu6T3OUIQ5PXihIsS
	lTrlsR4sLmol29E8fXq+XKwCKieyQR4ssuIRfUFotca23n7ZrgVUddxr2qzNvO4997DfLmMOEg/
	8APhcSw68Sl2kDezPM3PUfoVprAuapXzvz0x/shMmywgDRsseq7oNS7EiShweD5xHVmsRhdsIC2
	/qH0O15HaOO8N7xCushN4P83aQ6dp+VT61EoafMiVIrEh6U3WsC7h24B9E9PdU1rEQD0MvQ27xC
	C1LPozbzI6BXpJ6zHFdoayF8D3M3Ah6TZgl1Re29Ih2kyVhhJpHzHs2sNhiCHC+B5MRdrciLRrK
	T4A2bKUVvBnNz57EIjFUpxKqUJEvruhfhFq6YAMPqf32AXBfPIcQSjqErI1YfG19/FRG9
X-Received: by 2002:ac8:5742:0:b0:4ed:66df:8023 with SMTP id d75a77b69052e-4f4abd06713mr31926311cf.30.1766139121831;
        Fri, 19 Dec 2025 02:12:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0l97mx7gRpuBGwVkELAb9IZ++QtMUYrYZc71BAUyZzA/39KQ8GeAH6JeAS+KeFjHkPHqXug==
X-Received: by 2002:ac8:5742:0:b0:4ed:66df:8023 with SMTP id d75a77b69052e-4f4abd06713mr31926031cf.30.1766139121314;
        Fri, 19 Dec 2025 02:12:01 -0800 (PST)
Received: from [127.0.1.1] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ae2dbesm197282666b.29.2025.12.19.02.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:12:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 11:11:50 +0100
Subject: [PATCH v2 1/3] gpio: aspeed: Simplify with
 of_device_get_match_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-gpio-of-match-v2-1-5c65cbb513ac@oss.qualcomm.com>
References: <20251219-gpio-of-match-v2-0-5c65cbb513ac@oss.qualcomm.com>
In-Reply-To: <20251219-gpio-of-match-v2-0-5c65cbb513ac@oss.qualcomm.com>
To: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Michal Simek <michal.simek@amd.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1476;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5qG992duprd04+w1UB0QY0FMcY8BPgFL5D7DrXqV7f0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpRSTsHKBoTukEuIPZTVcHUflKv4jxU/jlrejPj
 o+LyWzJA92JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUUk7AAKCRDBN2bmhouD
 1x2hD/9m6Mjy9pvXxQcUsoScFVlVTm2XUP8CZNDyTxQFBeRTYCvdYGz6sUinXcE1aLbjsjp8dge
 nJViBjuaMMgRHw7MazkKB6rZkuYS2qWw7BVroOiKvzFCiAUl5R+GUXB7MyFC2SoYjNddrXC5hRv
 HMhco53HKj8uhLDSXpd/nidu02HGOyPmytRbFqpXL3wTFwv+2mc4ylcmjqpCUVGmsxmMchd8+TV
 f5RQi490gJSx/ORDN9Px1XHP17O04KaX7lezsS0lJusuCHPYJ6G4vbN7G8EDx2ynBlOaGOkUw5F
 R91hcnmqBx9FywIhbHxtOxmh5tMMRteRV/hibT3YXPQ3jte2lRvqGrJdz/lDY/INLXiWxG3Pn9h
 C+NjTopoPbdRCoIa/SFOwrvgHSj+cn4Ft+x4JRdCVojJgNX3fb0VBZIYncM9h5NIIgU8+8G+7vX
 vCA7nyv8l9wZKtsQQgg2wPtPdOVHBtXsw85n3GoXgIU6p+TbRZAZS093M8hY8pMuN36Grz3ygh0
 tgRFetNcDp4PAfRviDpZULwldfbgDiGEa65/IhvgDNY91kQc9UhRqDLWSM05mWas0GKduyzYRuu
 lJ75UZiOtwGScCI1AlLeOeE//DzFel59LsF2yCCppnXNeReU2eyc7r3HlGNjzFyCbmdFuf9YPjd
 GcDDNhb/+sLkiqg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=NODYOk6g c=1 sm=1 tr=0 ts=694524f2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=AxvInAFV_DmKQgZoSDEA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: af0Uo6db7cLntUPDmgLLJ4PkSt0pk_3R
X-Proofpoint-GUID: af0Uo6db7cLntUPDmgLLJ4PkSt0pk_3R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4NCBTYWx0ZWRfX5chluvgbBGQ/
 66mvNfqdL/5QOL4u46L6jcRpJovOhfRvYBH9W/7t89DfQdQDYIxb3I57mMO9B3EGEohJPL4nXFP
 X79X9J0j17qOY7wAqhdI9cAns84nvhtJve1XStqtvuJ6WpRURlvaZFqUzaVveooMhLeotKHGVNb
 c/U2CGIegL+B+g9oWksGZRjHP5ffFczva6YOB75WFYs5y2HwjYtcuMuWZEJhoiV+qFiUX+btuF/
 YMCIuOuOkKomPTEWAd01/wjQTQBjZrSDc05ZsYgLaYkY1FD6k52fBwBeRGWB/TfckgFMy2DYhBP
 Ud0fLcjqKprJ3774CISaQYZTMia/QXO6k8dgAL0npVjOORj5xuS3x0piNysfntLglGQsYOfC4fn
 EByidhR5QkyxnuVsg9gjjHWYEmc5W0LVPyUoQcr+5f2td04AzxFZJt9W9JYoJXMrZ6THN1dtKzu
 9SM77FsfjPZkqNemzzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_091651_240040_7BC085C7 
X-CRM114-Status: GOOD (  14.84  )
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

Driver's probe function matches against driver's of_device_id table,
where each entry has non-NULL match data, so of_match_node() can be
simplified with of_device_get_match_data().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpio/gpio-aspeed.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index cbdf781994dc..9115e56a1626 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -1302,7 +1302,6 @@ MODULE_DEVICE_TABLE(of, aspeed_gpio_of_table);
 
 static int aspeed_gpio_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *gpio_id;
 	struct gpio_irq_chip *girq;
 	struct aspeed_gpio *gpio;
 	int rc, irq, i, banks, err;
@@ -1320,8 +1319,8 @@ static int aspeed_gpio_probe(struct platform_device *pdev)
 
 	raw_spin_lock_init(&gpio->lock);
 
-	gpio_id = of_match_node(aspeed_gpio_of_table, pdev->dev.of_node);
-	if (!gpio_id)
+	gpio->config = device_get_match_data(&pdev->dev);
+	if (!gpio->config)
 		return -EINVAL;
 
 	gpio->clk = devm_clk_get_enabled(&pdev->dev, NULL);
@@ -1331,8 +1330,6 @@ static int aspeed_gpio_probe(struct platform_device *pdev)
 		gpio->clk = NULL;
 	}
 
-	gpio->config = gpio_id->data;
-
 	if (!gpio->config->llops->reg_bit_set || !gpio->config->llops->reg_bit_get ||
 	    !gpio->config->llops->reg_bank_get)
 		return -EINVAL;

-- 
2.51.0


