Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBBBD767FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 12:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cpKuuYddT/35x9durSm7BfkKTaEQ/oAbHtPUZNiF0xc=; b=YqixYiNlx9rKOkD/xuxRBF+KMQ
	X/W2FxUm+uJl8GRH9uz7F8/PzUHhxnNi9A5a+eNoAn54buOLOzjwFJnGuxKeZwILnZPDyb6I5Q40v
	RC459YgI8aacVkpqZiSt4UBOcF/eE+Clr6rMVD51PWZcRhjJ/+DioFcpr5ih8pwhiyeyUD6kpdFCX
	0aeGLUc3Qk/LxVstD9YI4rpMZ3CIlmLadvQlMsAPanmS+G3mavHr3r42StTAHAX3CNwu5+scP++TF
	Kq0IgmJ453wHDdtqqR+g0VLL/UfyM/85Kl/cEbQpQVUDcAdlRg9q/+WI7wmhFm1by39bD+AqMcicr
	9/lOZFcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZMN-0000000AGRI-03Ys;
	Fri, 19 Dec 2025 12:13:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZMJ-0000000AGPp-1RAB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 12:13:24 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBJpo34153892
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 12:13:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cpKuuYddT/35x9durSm7BfkKTaEQ/oAbHtPUZNiF0xc=; b=hSY/UlyjNX3LRsgs
	PbgGdzteVcbM+wm0pe5N8oujULHxWNRFD3VEyHkYEDH8575IUn6m44szYkj1U7tN
	qzJfBevMwpd8xcykmXD2ciGEDDaXVW+ekq/Lq/a+GVpiKC2iyq1ACaesX+horS0o
	rzt9V+WUFbKhwConG4kDKz4/a3uwmwuLlGeKT/OpSuCGHNWqLxZIsg/R3DP6Cd1V
	zdn26rt4yua6hWgLHDln1PUvQMIFs4/RbmCR366AomVye452LsPe+HUbgmFMHfCq
	cyeYFKJvs5NbI60BwDA34PDkffbd/E5x1G3lyEoI6uUk54roeP4ZzfP6dmjHtwuv
	BPVldw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ctm5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 12:13:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6ceab125so39321931cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 04:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766146402; x=1766751202; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cpKuuYddT/35x9durSm7BfkKTaEQ/oAbHtPUZNiF0xc=;
        b=C6sLScrdMD6JFm1LfKTPbTk8UEgcjmfhS+TirQilY8IQmtKrmHJY9ZQIyFSkkRkii6
         mLqPYdbmsOZXLMS4okFQKQ/V9fnBQipONmF4Iz3sbTKvF8Mdkq4cHURSiMXKxTZpM4Ml
         hkgB22HUH9xvljBbs6zyCamBr4EI8DDDiin77J1PcL/dZedFpRpX2eUYu81JSErG934J
         kMmzLgoTQvPwN4WTgTxBBSRO/fr/8fvtrZiCzh4ZWcS9wRfvBtVi2PFoyTZaf5pKlukq
         RKxVwxXnRj6ss78U0OhD3xZhD+UlyGFGSmGi7QrXPkFIQi0QxgdN32PCyD2fckwZRag3
         jLHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766146402; x=1766751202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cpKuuYddT/35x9durSm7BfkKTaEQ/oAbHtPUZNiF0xc=;
        b=pnHSufcioIl3yyEI8GnSl3lcoFoJXg5jQP+6ntx7cA3N3cp3Wk5oRbBR1A+6dVAiGk
         wwrPAtfuMPd7/PhnmMpIsMNTjETSmQP0rhyyOgpeb+6lzQizmQ1N9c1iZ8nSZJ7owv1u
         pQ/z9pPQaLHGgE7EdIdNmKa++OktqSUSI2Lt7qWPerp8BC6+7LKQ5Ax4mtYu4vw9ZCAr
         ORkt8cA+h43kn4KJsImVjoo4NyMxucIfswrPDeJra71kXLVpC+eOlT01/RmBKKAOZlIy
         T90kJma/eqI0Z1LV28n74IZFCvTyoE+V00z0vrQtG2S1umNd6R63cy5wAYsqq5iy6SBD
         k2kQ==
X-Forwarded-Encrypted: i=1; AJvYcCUisryFcB+DTlJRYHSbKHqoC0gjdJTcXOMF//xpj+htYR7fOCPEUsf4STCYam2HN3VZXEYr0GZk4+XajF9rdOVL@lists.infradead.org
X-Gm-Message-State: AOJu0Yynzg4LFNqmLLCHgjaX6DvJb9svDhMr+ylBk02egFlRJY2rUp4s
	/ywfwjr5q2CYGS+8aObWHH5JV/OPRPbQ4NUqhldJMD46+cGFMoStmwcBGRsG2hNSntP95NqSplU
	C15mhkGsnEPGlZpd44bqU9yPsv7qZS070h3c0/eVtKrNODbNsRSENjVWJ2GC5SmzJRkA/gtMQIm
	iH1w==
X-Gm-Gg: AY/fxX6VuAzqreGasU+ZjhXAcNNppV5Op/KC9f7/Fg/IOBRn4C9TkvkBsimkGCecz6G
	YOpQjRTdzcr7GArd6rsbqhr7iTITqr2G+YQz7U5l2ZH8lOTwCXfEuLncdRnSLzomIxD2hqreRbI
	JGXINulNYKBoB48m9xbMKjdvm2Tm0ZeGsCGsyAbTadqv8azW3PEFGcrdnRPDj6MDUzJsI353D+q
	kxDR7m81kYKGCztbVQfMrWTt9DhWfE6wWZ3vMY+tXF0PDWJ0hnzkASfzwBa1KdkT7xDat6QtBZt
	jtYA9a/zvP85U4wzhNuV3PJxUEVfx7+CWUgsGwp+7LY7uND+JLw96uX8SyN+m62M+nEMFygc0+n
	jeaSIDkAsg+ojkygrSK4gEYzXmXlbJr4eYtcgvfAYUcQOeIb5UXXsS7p5UA8lBpq6ELz4
X-Received: by 2002:ac8:584c:0:b0:4f3:4379:1ba8 with SMTP id d75a77b69052e-4f4abcd08edmr29079181cf.10.1766146401704;
        Fri, 19 Dec 2025 04:13:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMZuy6OJt454wVzJl9NiQKiuM8hDeZh6vCyymsGnhdSh6+zZ4FAuhdp9gWq5mTNSCE8zMgzA==
X-Received: by 2002:ac8:584c:0:b0:4f3:4379:1ba8 with SMTP id d75a77b69052e-4f4abcd08edmr29078941cf.10.1766146401288;
        Fri, 19 Dec 2025 04:13:21 -0800 (PST)
Received: from [127.0.1.1] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f48606sm220309466b.62.2025.12.19.04.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 04:13:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 13:13:12 +0100
Subject: [PATCH v3 1/3] gpio: aspeed: Simplify with device_get_match_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-gpio-of-match-v3-1-6b84194a02a8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1473;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ALFcaNrjkTb0yqu5k4foi4OvdSHKHGr16rJMG/50MO0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpRUFb0KKYMqc0n6u3g4Eb8w6rsjVgT9ppWrE4X
 /pWcHDcPV2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUVBWwAKCRDBN2bmhouD
 1w0PEACHjq8HZk2ogKTIKiT0XzhFTKeRnhQNUWlXhuuIdHw57FqpYXNOlyB5uI3W2PjErBp2hmw
 fnDSESZEL8yPbc1PaIl9MM2fdzw2qfcmLeDUxqHaz+/jX6YPG917XRga+q2uY0kOdV52fP6v5Or
 jXSJftdeIbmj/ogFmMQdMLOUXTVnlSrmH33MidZtlIT6tjdzq/B5o8Rc0gW4jL91klUL9zdHg/T
 MRphban9QNoHJvL7DAynuv5fkX6LzwpoLc5Cfg7x3TiwFAuey2NghjJP+UPwVe/IX05ZUZBWWNV
 MgsVrxcsSew1ui9D73QsT9aOzfxaYpDfZkTEifq/nH7SE+dJGVHUy/M12Ef9KPlFVR6eezKV5GT
 MpvsQxYtTPM1yv+6akJBVKbfv9BxQMakzIgcMrk23xW3yeVGDkcZxbQxWdur4FsBeVkqrxl9prI
 UUAYRkCMl3M4Que1OQSCVXV0a+h8/JVb4JnE5F+7H4/+bG6CQ8b941/2+sFASknoxXFYLnOHI11
 WOK5/7TDxj2UZlqUEcFZnMZRt7UK5xdIT5443y6XCJ/EmeEsrluxnRuRFa/zRr+fkVgpMOK5hh5
 RvFaz7cORvl24YOswZO6O2ELRaFLt3zPubfd+gvabUntk8hM3WVC0hGBJiLUizRAzurDx7gisee
 /jIQTovdion8pAQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: rRd2f7kYXuC3zJ0S51doYOEobMVWALIz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEwMSBTYWx0ZWRfX9ykR6P1RX9hv
 2c0j3v3y3iYXVLPpVpefmvxuIwndvFwqziRxQ0oq34GMbTUtHTbVCOX2cxTreBm16soUE1IzIvT
 +OqoFCkcIP7Dm0F2Gshv31Rhk/33ZBgSrrnGm8ZABlhP4hhebyyf5aeq/Y8EsJ4SWl3x+7I1F5E
 x0ZmtZj3Yy/bbW6QACn/vc8DIWka9rDTbT3SGIl0wxjIJXl/3njgAggtZ6kAxO8vw90fFIj7HBY
 lVqpHYWKdRVFC1ppeT+yHuMedyet1zP1fe70cCncwDaHBKL9sMCMRb/9f0WYLeM9Tbww6TACbc/
 58E1YilNxn4VA6sxwsbZXLQkiIXn03Bs7elWpqg3cDiGjSztPZXXGRh8Ni16M1OvbCv9Fd0dD52
 7aN216ptUjJ2dShbDrZt2xlww2f856OxYLwNEbmPVrYKBAU44L+3kIs3pfG/ktMWMlPLbWC1g3Z
 2zPNog7WrsXpgFjfXmw==
X-Proofpoint-ORIG-GUID: rRd2f7kYXuC3zJ0S51doYOEobMVWALIz
X-Authority-Analysis: v=2.4 cv=Lp2fC3dc c=1 sm=1 tr=0 ts=69454162 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=AxvInAFV_DmKQgZoSDEA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_041323_389196_6807F06B 
X-CRM114-Status: GOOD (  15.40  )
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


