Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F83D767FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 12:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3XYtkw+nSvqnasmCmZa85drCB060RxRk2PJNPFTL4O8=; b=o0WM8mc36Dr+mJnVkQ1OlgBHqK
	PcWj+6MbGDt24q92JIEznhKM0WEsVfyFhzBE3ykoZCqZ9YrjEzDOldDEE3KYX17bvOLoQrQGanyy9
	F676iASzDnoKrAYInhS60P4NDgDU0Zubu0azea4oF/ADLyRcT5GMJ9xR0CbJRqB4BtsOkYBhInc3t
	+kNWUDLC+VW20UGsyUfeFpA41G5VkMQ45hgJVzR9uKEQJtHz2AfApu/G8TlI6YU8p2Mlj+HLCCxzz
	52dGBFl/Q6ZW5FAV2raukGorC4qzMXUBlAnfdlTttFNq0hqe8lShKNQwwcGs++u3Ek0zRwIhJm6Lp
	v1DcbtiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZMU-0000000AGUL-0Wja;
	Fri, 19 Dec 2025 12:13:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZMM-0000000AGR1-20bi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 12:13:27 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJB41KC3939222
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 12:13:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3XYtkw+nSvqnasmCmZa85drCB060RxRk2PJNPFTL4O8=; b=iNr1hU4l7X6cHnFT
	R7c593Nb9OPsn7XLVFIX9mAzJlNGcLSRLtyQ5/xhSn+o8gAX6i1WWJPcH2nrIJC9
	sK7d+oVdvt6HZrHvHaHcImGOvrzHL5v8nGvoB6wAGJ7RiopmUadqdqPnbPnMXHsC
	TvaYJR2iMNIgMzeIfqsWZAbnKHZeidsDSS3IpmfzpI6TfEeHRLS+lRFD8aWWwPvr
	GpB6XSVysekBH1rB3g68Lt1Jl/1+lozdlht/PUuKFQQgSRIWyjDYLFocJg0eWjBh
	So4Ao3ZgurCNH5OdyGpUk8ow9QLo7v7lcKIZvfYOsdCF4MINyUvlJLzoxqgC2riD
	OsoJeA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2c2kky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 12:13:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6ff3de05so43914221cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 04:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766146405; x=1766751205; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3XYtkw+nSvqnasmCmZa85drCB060RxRk2PJNPFTL4O8=;
        b=ItXYhJnYXBn00pPl6jlVG2ZHsF2dSrzK3jj/dhH7EhYwRCtGNdnnHEXxbGriUDdhkS
         vB49p9HMJcFVD4OZ2TqTsyd9XfnMQPTC5jTxWu2y4xAe6r/khtP6xSQb8tI45+GyZGdW
         KVKbf7ZQ2ICnEFyG6fatB8qFwH3dC2njpE+L55AsZw0SWX1uhk+4HHNMm0+zXO95h977
         D0aWSXfsq4ZcRN+QVsQk2Gw8SlFblY7yT24oSYeicGxXBfGO3DciuRHEezqYQ3Pga/UA
         ruiHn8PLPdfYTOPUAfML/Iuutb057BI/SjiVU3GsauRGcbndaBc7aP1nLBjKZzKMuFJ4
         qhGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766146405; x=1766751205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3XYtkw+nSvqnasmCmZa85drCB060RxRk2PJNPFTL4O8=;
        b=gnd5GtfhKr1ccORQPvC72UOZ/Ha436g+g8EayE0lOwmkdlgP2bCwJxibBilNCR7ok6
         TAn4KwG7Cofpf9M2bJTPXZ1YfumVLnJzfBh2yA82jz6teYhD/H2skxANTSDrglBm4BMj
         K2o8VPruNCk09T48CC2FD3I+qMxT2ZH1U1Pgqnf1V7+2lnWmH8WmxoYy7ixdDSbR4yTh
         dVVxM7jxV/Fe3Ikhdq/ZaGOG/ByxrMeENyvP82/vNwrUa5brV6qF+BtC2Yigdi8tFmZp
         f9/rHhreyJuxWhJCGVqSWp4uZbgDEtZZmbbX3aqZ8xFVOxPWNj+rRI6aegeRBj8uO4CX
         Ajjg==
X-Forwarded-Encrypted: i=1; AJvYcCVJFZnceTt21dHMjbaDUjDKbcsawVzt7u94x8aGrtsmxnvZVWQ8QBiNyREumdxma2gyJmpAgtf6ygkT9lm+FnxQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh09Z1fKGRFBZFR3xNqqhIvhRyQYiPOduSE6WJOR6y98HC/2X3
	O8MKNPlo5wkHlPtZKqCpfy9zJRGpHZ2Z5+rGGQA8cvp57kUMEm/nvu1EQRnSL8tf6Gui+7oaa1h
	K3E79CgY26RfmOxBf8bTz85Ky4hTuBPmtzU907QjF5kuZ/9vtOqhY508BUaeI5TO9OSegH9vRjm
	Tnkg==
X-Gm-Gg: AY/fxX6rrU/AtAuThMoKPXkYwkhqIMUP1CbIHf00CPP1b5Lb+hCrJxDpHHuoetG7ZkN
	N8MczOZ57I+CKRh9pt5MqxyViit9p+YXIzYy+VQ5jq+aN6dKcwucJpA6eeb4ktv7yFD216yYARW
	9i1OO9+2jZVVK3lXzNGYWzyvN9xVGCDEWQ/U7Y0gTEbgi05TRNrYGdqYjbssqATZrY02i3FGpV8
	0SYkiGcdJTSWyrAg0CuazcgNjQWc7jnAEYEYxZB4J9DDp7RlCak7M++X8UIzOdnr5ipnPF5jDOx
	6MSjkIV4HpuYnPKvCoQyvHrJE15NMFNBz6RaNVwaVDaSvvT+ZaiAk6CvxKf9gPVn8xvwNIqNzbJ
	3V6J9GohPXJgrCeVvD5j1ePnGDid00jezaFI1Q2cUkmltPcdvGwTeWejIQnxlmNRxXk+i
X-Received: by 2002:a05:622a:5983:b0:4ee:4128:bec0 with SMTP id d75a77b69052e-4f4abdca2ddmr32270211cf.69.1766146405165;
        Fri, 19 Dec 2025 04:13:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMGQ+d3otw2nAPUGtegOYZpq5fCuoKczEdq05H59+XN5udCj/HZS+Tj+OrbXthiwOmCJlIYQ==
X-Received: by 2002:a05:622a:5983:b0:4ee:4128:bec0 with SMTP id d75a77b69052e-4f4abdca2ddmr32269731cf.69.1766146404760;
        Fri, 19 Dec 2025 04:13:24 -0800 (PST)
Received: from [127.0.1.1] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f48606sm220309466b.62.2025.12.19.04.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 04:13:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 13:13:14 +0100
Subject: [PATCH v3 3/3] gpio: zynq: Simplify with device_get_match_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-gpio-of-match-v3-3-6b84194a02a8@oss.qualcomm.com>
References: <20251219-gpio-of-match-v3-0-6b84194a02a8@oss.qualcomm.com>
In-Reply-To: <20251219-gpio-of-match-v3-0-6b84194a02a8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1412;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SAxPbvwDZoBTjv6FbalCU3GUYht4QxIdHt0ObCI8jYY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpRUFdS1h4j4pt1sNkG+hGyJGJFGsvNTcB3blMZ
 rNX8gjvmSKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUVBXQAKCRDBN2bmhouD
 18zpD/9AiimGe5xpPQ48Kpf9MK48t1Iv5LXlngybCeYtF63egJQgavqmurypnZmJ5UsqdmpZNeI
 VNpeXZ+sie8aJrF6q8zsfX5lASEvujZg5t5KuguPsC6mBrXw7TOai3MUAkcwQKTrJA2DEedVwS6
 eoBY4OuLB6+vlDlVq2hV+7Ny5eq50BYT9TUOtMxmY9aFDSDISUUFPMS2IhvazmrTQC6WRUbpr3E
 swDTycu2CyZacncDe+/pN3eaObaNkd/3usuGktzd2qgKiDQkrNNj6fiv+D7KRs/8+SMsnxiuAJ5
 E8qtAtjqyIP+mAjYBQ/Wy2848YdmPoe/X/GTZ7wNsr6AquG2QpbYlvCtaMY1Jf0+Be3zqNQiXNg
 zE31249qxQK4t4vtUhTwbF83DsF1I1zLW/Wil4wDnTAX0sUn0zmBjzmFfh/lW1kzRCDe6xCjDIy
 GXXZP766qt1J7syee9eXYS1R2Nrqd1+ei5kO8d2MrFceF5E4WtJ7oehCBlw50eN7s5jQLSI/jkc
 cTZf7StzG97LFhTe02ucaJ0wqCi3PX+BD1YF+trrU8SGrna2x/febfv/VjTmIuNbHTrCNg8bC1W
 IcZf3O4Ykv9AyR8cd6KCS+LKc99dWOgzR9dO3f9ZrApkMWbuyjPg1BnUSUX+quQDjDLSJ4njy2m
 0JwSRIcLkfPXXxQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: hRdZNK1zTqz0xBR_9K8gn8xUAp3OtFfq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEwMSBTYWx0ZWRfXxpe6O0kXe4Os
 6+UP33NHDtLKFxqNXv3cEIkqW5kDBX0zzhT+EnCEv3DylCQd8GjpiBC81dzXjhfmmqVdFW37uBp
 mMv2L8yiIiAZmap3GyuCy5RfAtwHJMroSknWD8Jo2Am3FZRgtQqnq/NF9nY9bfUsrOp+++QIuyD
 z/g9VpQpYYeF3nkm8lcDyBlijn+ysg3mQCWHs7+sKXXWnduGfWdAs6Og6zmjMYc71BPGNGWhBh2
 RYLobBCbBAqr5I+KwZqTUJHXsIbtgHmmnoOtL3h0ssguBKd3ej5OnBpg2rom82vQMaY45aTpkSC
 RZK+g4KDDJLekMkPzZKfkggg6sMNecOMk1BbSJV23OV1gQd92eJ6ZeEAqXsvqgVexpH72qflzw3
 onA8MJqjuogObv3gf33/DmT6q2/ugTwhnMx9JRPRjVWTJzttV6gR49oct7e8yvOVRpu/Pyawr2T
 2L/dxgASNzHHovZQL+Q==
X-Authority-Analysis: v=2.4 cv=feSgCkQF c=1 sm=1 tr=0 ts=69454166 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ZCGY6Re1LpNA-TmytnoA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: hRdZNK1zTqz0xBR_9K8gn8xUAp3OtFfq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_041326_526545_4146F776 
X-CRM114-Status: GOOD (  15.85  )
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
simplified with device_get_match_data().

While changing the error message, switch to dev_err_probe() so error
path is a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpio/gpio-zynq.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 97780c57ab56..571e366624d2 100644
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
-		return -EINVAL;
-	}
-	gpio->p_data = match->data;
+	gpio->p_data = device_get_match_data(&pdev->dev);
+	if (!gpio->p_data)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "device_get_match_data() failed\n");
+
 	platform_set_drvdata(pdev, gpio);
 
 	gpio->base_addr = devm_platform_ioremap_resource(pdev, 0);

-- 
2.51.0


