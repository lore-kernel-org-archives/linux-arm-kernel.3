Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E3C6E99048
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 07:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5P8NXaOriPkPC2q0IRIWz9wKZcBWfE5/xl+XEf1jVQ4=; b=w4yVmd1CNd2SUiQuECOja4Apr4
	l6EJ0LqytEB/9atQaQW11LHr655V3jybuW0pi+Pc9DJTshCA5W+m6iszQ7naGZdgZsa+mh9d7Bl0C
	+uzpRWn7ETWZBjuv4L5ymGwIKzirjSdEQnOdTsYAqxr85dI9jS/52+7cDizhB8PlDdzFLnZ4NSxni
	k0OPDucUN7QISY1XbjitgSPP2z+uvZKaAKQpkUvwgo5oRXu+NHNLK5Zx+b0vEPvTk4ho9zIbInt+G
	OPoquMZdXQ9CKiRtOup+po90oudTNEzgKVlYaTznb6RUdisAg6tcapc5L9bR9Rkt4qBU26hOvyAgm
	JSKbYv5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB5zy-0000000BiDV-3FRL;
	Fri, 10 Apr 2026 07:09:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB5zv-0000000BiCP-3km4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 07:09:49 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639Mu2wq3934972
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 07:09:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5P8NXaOriPkPC2q0IRIWz9wKZcBWfE5/xl+
	XEf1jVQ4=; b=TDZJbw28P7WvcFvFthM1dYWl7MpKJOVzb/nmk83ywwpePZQIurg
	pQLwORmoW6gH15oGMA/yBgtVtZfW62pBWog+rqSyHM0d9S3k1Ty6dTKBndlAA8wN
	R9NQULd1MQ/+WUaYDgr7LL4Ron4es66rYcDkNXbXeTB9hcE8FMd91Sd3Y8FGLlxG
	Y26FYG+IcdWTJlMpY70fWiopkb4gka6ARm7t74lZi7zmbW8B3BpkwV0CNZkHM0E+
	1EdwVtLLVU9p3FNnIv1rEIBWucMvFFvqBZuVsE8HFYBvbvaowQWv26dChumtmMwM
	u+l+9lBe2BI70nrzr3l+d4uxN6RDLQuqI7g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ded5say47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 07:09:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d831e8083so49721131cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 00:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775804984; x=1776409784; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5P8NXaOriPkPC2q0IRIWz9wKZcBWfE5/xl+XEf1jVQ4=;
        b=duPfaz4QhRr79fBdLn/3bo68hXoxkMDuu1HzTPCpDSWT+EeIYpn0UV4Lmlzmy3YSoC
         aKMyf2d89NDljiJIwL7swihUK4t9FhtI0LjLqOz7C4RQ6Eiz3Jypffg+rLxXVhv4PDIr
         G8U8WDNrXbVyA4M8ek6rEdUXYNTUp/lgRs6yqSNe29QCwU3yzlYtfji8cyzn2g6uIfqs
         kowTh1RWrE1kYJpF5Wq9gtrIk0lWpqnRwsH+TXJSIbQ0FWgCUEgAU8MTlUr/n3m/ux35
         FEjurcSWEAYhsOtTQEQMEm4n6tlCk+3S2JxB/WI9IahuwjkrbbiREdjwtZb6nYWFSSTc
         N9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775804984; x=1776409784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5P8NXaOriPkPC2q0IRIWz9wKZcBWfE5/xl+XEf1jVQ4=;
        b=hW226tHimWbCjVbohjidXqF/pXvD2Ovx6e93Wv5oa5bneQSvTdqnWe6sDf7OdTFSev
         OWySI5D4DXKnrj6CpoEyDg8ctoYKAwL4YhOVT56JlZQLdU9xy7mR0BhtDwv7zmqVT4Gt
         84p2B199/qUknTiT5Ds3DNlnrbc0l/Gbrk43xDKMj9wYC1J7ozA+Pe/lQJleuf87x6yR
         1Xb6sAea5ghYu85kVzoSKhJpv0il5RdiQHkGQXB+gj4ze0bBGQ1fEblkDwkMbWbswVRl
         w8XydWhQams7IkNsTFanpmkt9x5WHcsg3Pp/SQCL9S59R0kimPgmmAv8InKBGMLYFF2Z
         SNFg==
X-Forwarded-Encrypted: i=1; AJvYcCWmWpl/JuLRjGFbJZjGLfmXv4OcGM0I0xkTeEDHey0zWesn0aVwBUuD4qKZsiQnHV/R34YgDyrZakBPSDNwjkYp@lists.infradead.org
X-Gm-Message-State: AOJu0YytaTgDmF/5PiblMbRA7k/kvKBUVX4e83n/wJk6Zb8Z7XemSM/h
	YqiKklbkbhF0EsIgyZORH2qVAQTu9lXJkbGZpg6HNG/23zfDj5FM+WD7oqdqR0SLqbor+ZT3w8t
	GhtwThSChcFTljZnecEwa8uU++YxRvcNhibDwuPETNkY8Uz2FnlyO9Q8qrtKmoEaQooDhKjdirU
	baRg==
X-Gm-Gg: AeBDiesaHLnOLKyiCzwAXdfYO1RArukA+iqy5r5nfG0lSO840B9nqlAhO9OI9o/603n
	6OpuuzJuQUPGBYfC6CFR/TifeZiWNyfOD0OyTriLG+rZo+Xraar7cJCACfNGKkHtSD5DCZSrqql
	kUr0JYEA3jRisbsVApCFqw6jZjQA3aw7i4mendQ5koivxJ/kI07ZN9Sqtz+YqJysz18EhEpWRSm
	ddSo4tDYFkCDTSofQwbfRkvuJbgkib/E1B8mYaBZa/fW21nboJcW9Cnar/kruE5zxdy8fxNJzB7
	ifM578n3moVmah4Xc9s5Y85OCc5onnrtZsXx3bHk0daWugNjfEkEzknxi0ITAzGwTVd3MyXjavK
	2CyuqpKrDJQDsKQyh7I4HX1+xEo/bG2k9CZwouLO1e++1zProgw==
X-Received: by 2002:a05:622a:834f:b0:50d:aa99:7bbf with SMTP id d75a77b69052e-50dd5c0be6bmr27268971cf.43.1775804984529;
        Fri, 10 Apr 2026 00:09:44 -0700 (PDT)
X-Received: by 2002:a05:622a:834f:b0:50d:aa99:7bbf with SMTP id d75a77b69052e-50dd5c0be6bmr27268711cf.43.1775804984031;
        Fri, 10 Apr 2026 00:09:44 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:7d6c:c663:fa06:9ee8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e50289sm5338689f8f.28.2026.04.10.00.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 00:09:43 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Frank Wunderlich <linux@fw-web.de>, Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] pinctrl: mediatek: moore: implement gpio_chip::get_direction()
Date: Fri, 10 Apr 2026 09:09:35 +0200
Message-ID: <20260410070935.9540-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: MjI8vHHmzG_wXndjhJiTsfKC4GORf1BQ
X-Proofpoint-GUID: MjI8vHHmzG_wXndjhJiTsfKC4GORf1BQ
X-Authority-Analysis: v=2.4 cv=Ko59H2WN c=1 sm=1 tr=0 ts=69d8a239 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=gdeKHt93fcZDdug0Yb8A:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA2NCBTYWx0ZWRfXyv+DWmWpQIrK
 OSAlusInAz4g8sW+IBbShUtUsACY4IoZf6FgIakYBEKKpWl//n8yBcOsY1B7aSR60nWqea08xuF
 o6OC1XciLqiblIiUw2eHFAaBOeiIqr4UtzGzk/A5YHqVWwSszkF/iV+yf8hsTvSIa2JD1abIeMu
 ieJktLTyXxA/eZCEWgc7+2k1WAizZKUGN5tjT2bSiBtxYr7uFZYtWsxWbhCxr7SZGfqVHNBjP+K
 JT0D+NxILSFCHGrVWw6qPQmE7MQ4011QdXUB36uh6oXCOIJ0r2z3Gpi5WUVIcxjTNa+aZvaCOA7
 X2+N56tPFuEVOiP0LtXL4PdPOsfmnT3/wlWXJ1oHjAr9eB2fH29BGKBbn41O1QE/c1OcWp/mpg9
 oRgxcnRKIzHOheEIMZDvX4JW44GcM9g0gUoHG2akXDCpoGXP1x0YPpiEUS2VyYw1L8ijBnMKKZb
 WXRwhASCe8HC7klvwHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_000948_044004_F8B0B8CE 
X-CRM114-Status: GOOD (  13.94  )
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

If the gpio_chip::get_direction() callback is not implemented by the GPIO
controller driver, GPIOLIB emits a warning.

Implement get_direction() for the GPIO part of pinctrl-moore.

Fixes: 471e998c0e31 ("gpiolib: remove redundant callback check")
Fixes: e623c4303ed1 ("gpiolib: sanitize the return value of gpio_chip::get_direction()")
Reported-by: Frank Wunderlich <linux@fw-web.de>
Closes: https://lore.kernel.org/all/20260409132724.126258-1-linux@fw-web.de/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/mediatek/pinctrl-moore.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index 70f608347a5f6..071ba849e5322 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -520,6 +520,23 @@ static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 	return pinctrl_gpio_direction_output(chip, gpio);
 }
 
+static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
+{
+	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
+	const struct mtk_pin_desc *desc;
+	int ret, dir;
+
+	desc = (const struct mtk_pin_desc *)&hw->soc->pins[offset];
+	if (!desc->name)
+		return -ENOTSUPP;
+
+	ret = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DIR, &dir);
+	if (ret)
+		return ret;
+
+	return dir ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+}
+
 static int mtk_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
 {
 	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
@@ -566,6 +583,7 @@ static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
 	chip->parent		= hw->dev;
 	chip->request		= gpiochip_generic_request;
 	chip->free		= gpiochip_generic_free;
+	chip->get_direction	= mtk_gpio_get_direction;
 	chip->direction_input	= pinctrl_gpio_direction_input;
 	chip->direction_output	= mtk_gpio_direction_output;
 	chip->get		= mtk_gpio_get;
-- 
2.47.3


