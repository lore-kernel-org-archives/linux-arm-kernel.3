Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E55D7497D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 10:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xf6jTbUm0qoyYu8gm8niL1dyfimxXVsufFdZ/b8qih8=; b=OcqXltrkQ1o6dNwBIauAFU38rU
	io4m+qOVvI0ZwgTIMRCi0egUq3mkwnPiQHY1bVYHK2aeNN3kIOC0iefIEZM+g40R9lGkTRIYV82Ui
	iDn/QMGSggC9rZG94KDnP9AIkyUa3NZPTWYZUfRlzo+gGO/NkV36ecSwyh5JxbvqukXZcVaY2zm1j
	2OkiP8gk8n/tcRH4YXHO48kQqaQH7ETVweTSJcOSx5ymKK7JUORATQqUeR3lS9avD+OvR+vrrLbnY
	4SAYmtjNuLxbG/hraw2ynQtYmHKtXc6PKu7v2HHF2rCo+hM7B7NaHnl8KYcMMS57if0pE3L79CTtn
	XRQGMUlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXT2-0000000A2ae-0USZ;
	Fri, 19 Dec 2025 10:12:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXSz-0000000A2Yw-3Orb
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 19 Dec 2025 10:12:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=xf6jTbUm0qoyYu8gm8niL1dyfimxXVsufFdZ/b8qih8=; b=K/wadkwJwces5X6boj1dXgArMe
	4rc+zdf0a+TNiDZLvXfEIT+9wCKW7lvGpkCwPPcR9tUUsvOaG3BI0mnqi7JB0yNsZ1fnwWo4PKSei
	L22N89uhLsl9r475tgWJA1yws3qnbmlVQWGpMaZSLslTzIWMGT3VEkBcICh4f6A+2A2Jem83hsVum
	FssAbwxnkXeeSeQ9hw076Jqnpr8ODyOvLfAGoVfhTj9AEkyCDTXzCSomoea83Wv7ZFqtbT/kCIUbs
	WU61yNu4aO9111YnPyIpXMSd0bslk5FPObd8sRJouGIWdlNum3dbfDqjQWyV9cTu/3NETMNlluDdc
	kQjD1GeQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWbU-0000000AYdh-1uZA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 09:16:54 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cA4x3319088
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xf6jTbUm0qoyYu8gm8niL1dyfimxXVsufFdZ/b8qih8=; b=ffOtTXfujRW6VmN/
	cfHoFdkk+8CHUBWVmPYKg7o8aE7I1ZuY8N4fnbHjpVU2Nh0uygRMsrcM1wkikVZx
	FX7euVdaCfOcr8vjTQsvI9p1KEk4TuDwY1sDBIP6svocPwu5EYBfTXePCV8su1N4
	LYdShGzy5H6y5ofL4W9pybFjdIdWUWegsiwDdcDVX7E/+OEMwAsJi+Z3/WpcnXqW
	AWSC+C8d+ozmpjLR4n9M/xcQxsci8VahzdRJyT0M5w5l7xFHxiakjBUulzCeAqNN
	fV5mvY7/8oFNlsx/JeysK83h7gg5Df46wqlSs9WtgE/zaBt5QnDllvK0d2w4q07L
	HyWNcA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2et7qq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:12:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f35f31000cso19700821cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 02:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766139125; x=1766743925; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xf6jTbUm0qoyYu8gm8niL1dyfimxXVsufFdZ/b8qih8=;
        b=iKvzAioLJVXhrfYdwJJ+KDEhcRj1XyKiqWQnv9c41IXLz/yRc+dm8c15dKebix1EmQ
         AXluFCrf1uQE8QbqmCnC8LXPjFhGlhTg6u94eCidyypDQvqu/BZ3oFzrofFyHY2YLk2R
         NM/Q/LwEszishldJ44Wwyn4WFb+GX5exjfkQUfqXh1x+ymdzZ1CdRsF2/bqjDbZiVos8
         liBH59LKqGcldBx2AyMsG9AnbZp5+ebZ8kWTyuYOf54FWTN7Q9CxJjwA1+o+vGkABn4z
         ub4puIHdj188lueTdsCNzUTrnuMBL7qMkO7Zxzi+c16Id9ccpwRhdQ1TmVzzKbFtHzGV
         49jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766139125; x=1766743925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xf6jTbUm0qoyYu8gm8niL1dyfimxXVsufFdZ/b8qih8=;
        b=SiPEc3sZhr27mbDhCx5WMfOqZhsGyhYYWs1V6Ct/qOrholgpzQo6FEkC4I0P7HBOkq
         C/zIcGo1GEUi+U+6NBteh2hoclIPbvdPJ8TjdvW5uxaHOozb/cgHvaKYMgjeXsWZf2C5
         R9uLBVK7b7ouAeu3OGoPc0Vp/OfFejKpj6mC+PcgNtlyFCpfZjCR1jaQsbZdTT0p91GE
         2nq3PtVu946qxPZMgVo5Trx36HMCxJG70yo5uAGFrJER/o62S61kWX2g9LbGJy3k2eKn
         phHyyNeQqptTt9brW15TRZDkYQib+8Twiro7Uc1xkEal2cTQFs3P1CEhEgaMJRUJnntt
         BkOA==
X-Forwarded-Encrypted: i=1; AJvYcCWXi3F5BYE4EiJO0eLpJpYD/PGRbiTIlB2ptnKK7X1CKLVnf7B7FSL1Qr92pf7qlrr3tgW7TBu8O2EeQiWec9Zz@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3Kppvm1FNgeWsWYzUg2K6+hGG15UF23gY1MNdDtUnYp0zv7Hn
	lbQt1PGbdYf8YkWR9UurKYIrBja+1AiA6upFGNj3vUrl8SrruKh8h7bc+omlJNpxul0oVdwuWqz
	PafgMegIlScwPgvjbdZ2DUJ0AcZVkh0WrN4d7pJzadbBi3nhALhxgkjoyAhVJ3H/looNh1VEBQc
	bPWQ==
X-Gm-Gg: AY/fxX70VghNfKfNuoOUtnspjhfgoTaq3TuVeRCn8diBeG7UruR1y4M2xp1+QZR0ZHp
	IkAL4boekmLhs9wcMjBPeFkZS4Ktm+D+eAvi3oYbuVdui6aDmb6c+tnqJBV4hmnXNZWoSZtDZ+f
	HcRh4vg2oScANGL1XuMuCUY3T7wO1Xsi1XpiIzIcBWnRuyhZmZgTALWH0sWPrGf7dRxi8CaLdYh
	XiRCbGhdTieP+YlxcyIP4uqZugbR+njIm588TyLbq443d0GW8yv47p8hPc5wvZCm/Wz3awQDZDq
	IG+OiImnkrn82JfiunsMo6EpmN7XaDT1NiK7J5XH4uetrI5jdZKM2YD3D2rlvT4UhKVZ1Wso83W
	5vZHsJ29OWfhoRsGuebFDLpHhgi1HE+bPyoNuj5+pEBoqCNLeFMQnOIdnY/lXAKANKGFj
X-Received: by 2002:a05:622a:4d06:b0:4eb:a3e0:2fef with SMTP id d75a77b69052e-4f4abd608a4mr31870871cf.39.1766139124683;
        Fri, 19 Dec 2025 02:12:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGGDTlX0iU36lVyLN46KKkoi/rMtiwt+794nHbi6MbHilGuWk3Az/XiiMKPtVYE7ZtJKns2Yg==
X-Received: by 2002:a05:622a:4d06:b0:4eb:a3e0:2fef with SMTP id d75a77b69052e-4f4abd608a4mr31870641cf.39.1766139124235;
        Fri, 19 Dec 2025 02:12:04 -0800 (PST)
Received: from [127.0.1.1] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ae2dbesm197282666b.29.2025.12.19.02.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:12:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 11:11:52 +0100
Subject: [PATCH v2 3/3] gpio: zynq: Simplify with
 of_device_get_match_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-gpio-of-match-v2-3-5c65cbb513ac@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1283;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=bWc6AXEQzSRq4zuby2A5YtN+WTOqqPth6RtesjMEyLw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpRSTttsAJdpejjeAUj4NiuzzKgYQZACMFLFx+C
 +szUIlcq5uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUUk7QAKCRDBN2bmhouD
 19d/D/9ZlneV6zdxdZpH6ooBKxvcs2CfFE4DmO2P6QlNgRQFQngc0HtgVS9m7dRDcQeHfG6yrbO
 Vh9Rzj/M5JyX8L/WBMguqLMiyRlFoNpkaUFAz+dNZzmrDfKl/MBveRe0PQQv4Lju73CzKa+imn2
 jcMHjgbnI64nDc6uvBL602+zdp3QtvV9lC+5j4FCxgqP6YPuW2GC/EDfhliHNS7BXWB9xLjHtQz
 hRsv23l0QVX9IRN9hqCpHMJIXLjJbP/IDwF5YdVcWOC+oI2LNNWrMzgQh+RSJzDn2AHXN69mSx/
 hXIeGz+2ISormsVP6vbw2GcsduTBMSsHnfBoOEnMkbQjRS93Ug9YPULPNW7WZx1thrufKKeHwnC
 xAc+07Ui3nN/M2BzVG5WBAoknrjCwel6npD4XsBkCsIOcvbW6SVhNLiLSfbekXKjbHLHJvgzZpZ
 Qhsl+/Dpo00lHz4g1OTF3GjXiQHKjU6FLX7MYYLdekNym444BwaQVusQe319Ed3R8gTXZTAC1b7
 hJSokvPN0cidBPcOAuPxxdYXQaNDgJgeQ7mE/3OYgEZfqJ9wLGk+qSYaKkRbOga3ZJ9uNM7OlGh
 W+zi+8HzSLNECK+gOiziR410YSFabLi6BeSuRF4vVxd0yt/d6U+MbdLcdvH6+c57e1VZS6g0Nmv
 VNNg20P3w5Ech0w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: Kgo6R7k24g3JYna2wD2mHz4Xfx5BATgD
X-Proofpoint-ORIG-GUID: Kgo6R7k24g3JYna2wD2mHz4Xfx5BATgD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4NCBTYWx0ZWRfX4jOemFUpnUpD
 OnIrNLtIyuZT4cdTjNwNnZ6qfaKMc976Nr5xG9hrnSp55IlvhSOOcLXvulAugniNXZStf3RwVvZ
 iZiIbLboHX12haFKdON8Wu34LM6KvJyLFPgm0m4wc/N3KDsyEPJsKpiQb8nui65G9cfTnsfzSCU
 fRikO13J5tRcSGTC6frz/jXGumKUnwx6A/0b4cEV4VCGggfgOmxaEc8l/qVdpvx+mFqjiTl0CAz
 E33gdlwgjm9mIsnRQSVfvFuhCOCzsWGPiH6dhzTBKh99z+7MhlrOgILvewzpWuKIS5Ssh1cET5V
 xiVCETaOWX8JWtLc6dW1sps/BTfqVx66fhK+x8rjyny0NmJgyG8YNEbOstY3P52pKGg7OMyqFgl
 7HrZj8eNCXJ0c+SQJsUXrbCLIB+4RT3x2LWn4gD0W2XarBObIz7o0C2SE+IUmcHQaFEpqi8D6w5
 vZbW/6TQbOcw2MW22Lw==
X-Authority-Analysis: v=2.4 cv=Tp7rRTXh c=1 sm=1 tr=0 ts=694524f5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=lsN0KVCTPuDBfKR-m84A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_091652_944049_C5988805 
X-CRM114-Status: GOOD (  15.76  )
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
 drivers/gpio/gpio-zynq.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 97780c57ab56..d69773318888 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -903,18 +903,16 @@ static int zynq_gpio_probe(struct platform_device *pdev)
 	struct zynq_gpio *gpio;
 	struct gpio_chip *chip;
 	struct gpio_irq_chip *girq;
-	const struct of_device_id *match;
 
 	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
 	if (!gpio)
 		return -ENOMEM;
 
-	match = of_match_node(zynq_gpio_of_match, pdev->dev.of_node);
-	if (!match) {
-		dev_err(&pdev->dev, "of_match_node() failed\n");
+	gpio->p_data = device_get_match_data(&pdev->dev);
+	if (!gpio->p_data) {
+		dev_err(&pdev->dev, "of_device_get_match_data() failed\n");
 		return -EINVAL;
 	}
-	gpio->p_data = match->data;
 	platform_set_drvdata(pdev, gpio);
 
 	gpio->base_addr = devm_platform_ioremap_resource(pdev, 0);

-- 
2.51.0


