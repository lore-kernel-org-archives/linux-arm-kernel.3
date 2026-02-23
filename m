Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE97E98DF6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 07:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AH50fw9QTtdpPbt41EGIzTuypwuiZyQQHwG7B4PGWqg=; b=EBsKkgXG32LW23AXLcqEu4KGIS
	yx+slZI/lE6Y2rv4tqskym0Z5FYBaN6tU4IV5mObL470T1qpMrqpYtqXEELle9uOxVwWsZuu8hrM5
	c4jE6EA0+YAD5ES4r3f3hSgxg8Lj/KnCCpW+H/jM/2+UUaYDNbVtPh71agdKNTn0ew0xX1cMP064t
	k4MGQ6BbmeJ+Wfr9g9gGDCRg0tqLEWtqDSVE48B4l5eRcQeLkrvyu8EFxrUK3MCRaueAWWRwWXSSE
	xRHNkcL9PAYt/g8ie0xZNqLBzyz+b7+9fUeVduuudEvozsIkGHOK+Pkzv0JzwtJiRCbEh4AX4feV4
	xRsBRPpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuQMN-0000000HMpV-1XrE;
	Mon, 23 Feb 2026 07:28:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuQMG-0000000HMgs-1n7H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 07:27:57 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MNQ6wl2061057
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 07:27:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AH50fw9QTtdpPbt41EGIzTuypwuiZyQQHwG7B4PGWqg=; b=IPkQwJkV2xswGPCh
	rc3S7O5B9GNV14vX4IX8goHyV0CQK1YBxQHVtKRzM7s59ilh+7WdzmyNwk0bPXo1
	4BtOGKkxBBhQecc+toLDIAgYgKgx5oOC+N9otwEZFgVfHQKJtSlX9txYMWJQJHxD
	xUHTNr7LClPUIZveXVZbDiFmTfdb21XbH410rYJS3nv4+71vAyTjwE8jCfPA9ziA
	b61Lq5jOuNoK1GnE5TKO9/QABCXAQPfFymvBkzuQlukp0j0gJb4u22iIvLXz0rHw
	f9xG75AOu5gdH4B2LSoLOVXpfvnCRMMZE/DnZy3j34HbXdOgUxLXgx54prbFk90E
	yuSbgw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wausag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 07:27:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8ca3ef536ddso5007253285a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Feb 2026 23:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771831675; x=1772436475; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AH50fw9QTtdpPbt41EGIzTuypwuiZyQQHwG7B4PGWqg=;
        b=aWGJ74BZU2286jBgFnuhRAeIyBDo0REwH52W0rP6YE4vL/r/aimihp/A2Cu6Ob5H6d
         7pCgrfzO4aBWxUUrvDcLxSr/CMeXwjeuev66lA8e9Rxr0is8Ji6ebIpWYzp1aUOQ6F9t
         rS2aYfsgKxJ2kOmIRlmkkwZpG1MeJMp4ILozI+uEkUJ/NngFhHsJ2JUEW07jxmf5mNKG
         HjgLJMdL79BWkqL1Np+blwVZO4xAKZn9nYtoVjP+oRw3pP38fcP+skT2Di8gZRzm/tAH
         u7s0XOV6GjCFnLOOfwg5TVtkB+d3qLoqYJ483Av2VAhs5V6zRhIloyxNWkn433Um4lDF
         HAiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771831675; x=1772436475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AH50fw9QTtdpPbt41EGIzTuypwuiZyQQHwG7B4PGWqg=;
        b=KFcojR69DsS9Qjw2hy9/Xyy4S/9Eq11gkJlLnWtd/la1/e4X56nZ/5x6Uwu3jVNPoz
         rxg53ONSanGpv0NHtIw31FcahUYl8QIseHb5osDMBYRPMqR/IcrkyepxFDsSK3aNDw49
         sS85wyetU0vR9AR1vhw89ggu/NLtKrOUHZGLNvOAhUvGtCtyXEHqZ2X2XV9NLpNx4E/g
         Odw4IcDDvnZAaEzBLAr7qfgEbnVg7deIWaclyUE1n+4k06crvBh4YfxpaDK+U2DFy+i9
         ZdUq1Q9n8vMWngivV7gBbMMLtP5MSdY7h0kBB7pIY98yCqYriFLvPFtQlyEsTghsCMg6
         /hqw==
X-Forwarded-Encrypted: i=1; AJvYcCVZHfgqBIB4cx8DSTPq3Y7jidG3X8Hp1eWAObJmT1FU4R3C4mfyKT5d0zsBAgnuL4DNVcOBEftUDAyAoNlAOfkq@lists.infradead.org
X-Gm-Message-State: AOJu0YxZu001DK7b1tinPhvpbubHVTeJhIa5HGsjw4MC9lgpOKTysp0s
	bCVsCzoRbopl27v3gAeXZcazM0V0KlqSO/ALAmNHAACttCKZgymFIcKDQYAKkH+CtE/8pmeoV73
	ST9ainlC1CG14ZuSr3PG5HkXdjSXBJHqns937T0NRwO1Im25FcthY8muTmNxyQCsrOWDmm369o5
	0R/A==
X-Gm-Gg: AZuq6aIeWNZF/5hFiBx4LACNrGH4PQwyrEoz29hfUjH2bibsIPd9R/GiWGHVEhpfV00
	e+/JMIL3CNPIN4tVBaTeZm7qPZW8fvf3Qo42Q8dQGm70FN2TtuLQywCT7s8yfTNm3vLiohC9JDI
	CaTHBZ4NZhqaalBSpZmUGak+1DHK9Vvu6/UenqrqpFDLVrvEXVMWXtnrjP2I/UaKQ3bs1q3jAoT
	7GMbS4JQREzyYSayys8h0kJT/yAQgARBnVU4JH70x4EJc+UN+0T+0ehv736AccjmM196T0gbwub
	AVNTJCnt+8cSpMpkyv6PgX2UmAsBrx5+k4ZLkcUUY9CwgPZh5U9SUJgBHdHWy3ZnrhT5fs+yT/g
	s9may7CtJwuypTNsHP/45Ec1CY5GiUEITPmDC9MSfEzi9cA==
X-Received: by 2002:a05:620a:25c7:b0:8c6:ed3d:be60 with SMTP id af79cd13be357-8cb8ca8926emr880336885a.71.1771831674952;
        Sun, 22 Feb 2026 23:27:54 -0800 (PST)
X-Received: by 2002:a05:620a:25c7:b0:8c6:ed3d:be60 with SMTP id af79cd13be357-8cb8ca8926emr880334085a.71.1771831674487;
        Sun, 22 Feb 2026 23:27:54 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9ff5sm18550286f8f.4.2026.02.22.23.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 23:27:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 08:27:33 +0100
Subject: [PATCH 5/9] power: supply: ipaq_micro: Simplify with devm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-workqueue-devm-v1-5-10b3a6087586@oss.qualcomm.com>
References: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
In-Reply-To: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Tejun Heo <tj@kernel.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Tobias Schrammm <t.schramm@manjaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: driver-core@lists.linux.dev, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3021;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=G2Qaq1IYTDtA8nYq8hb67ozAR45iYXNAROMWtKf03Uw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnAFqVbGd+Oyd+isBnLp3Irn3IzZIFzgrOBn+8
 5TEkaEct86JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZwBagAKCRDBN2bmhouD
 1/PbEACD32lwshZ2ZGTfWR2j4TEzEqcr5UkWKivQj4l2BDJ3b0cx3v9UXC+uQpxEwQRsNqj0BvG
 I1fbqNt2AyWmkGgU5CQ/mctWF9CLx35r8IK/9NdFjOqcFxht4uwjb6upeBsp+J9Pv4HEfYA0wAN
 KTA7ic+gakOj5ORF0AX0XB+z9UwqeB8IbQrIH7214fJQfuMgYgOooGihxSqfiOsUPuOZ9ls5/dM
 epmwdKvIbeyOiwRprJ77lkVrp+OMFQXa7Z3PUu0SZkkyFzbd7PZxw1z192ZbcfxAarusRPDYPy3
 wg9eYXwcNtW8bxgrkKEeFuuHIQYLM/XjrlvnAGGRttd3REFDczgFmq2NJxW17OOVDZeYCMfKj4U
 x50tsh+z6Y0ziwp0yrkLamVu++cpOHEeoets78gt/cg4eSkEFdA7Bm6o1PBYHVqPrYUMwYO3uzw
 jTyOPwQM3T2UT6UB95Cz2t5+dDzKC/lSPReC0bsI+qBURe6pUl4SOcPr44WISrvlDFn+uxccMAP
 cZ9tGiPuZpEGR4H7DnWR1quOQzOJwWZEQ/EbBXRzQS0zF1KAcc0gxH1sTluqtgGKh/1LOGDmNJk
 ILB2rMYlea2r74+WwfmYhcO0zntsIz41R1A3mBVMXjAxQHSN1RCq0uN/1cASc2WbfdgyvfjfE/z
 84W99rJwWh793pg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=KJVXzVFo c=1 sm=1 tr=0 ts=699c017b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=PkD0MmKtpR7JdVUpc-MA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA2NCBTYWx0ZWRfX/oghm4Xt/ZmS
 on2k873bU4cSuTlxkebwYTN8wSgsTeHyCsKWr0js4037xNNhwZHcX7n0efkx5+HJo3bYNkm3W7/
 h+7Lb1FaEm/oek7EYvyLGxcp4mluxve9cj0uQNubfHJBRkRx5Us3OUZCk1E2Bes4uDoC+lwj7Yo
 gkjZDii6zm2YM5GZ5kwyJe2YzdSflBUpY2K6VMRKsj6zaSEwWWEbC1uhPKrLVNnR0CboRfTP/ke
 buBGGVIBNPxuB3jJZ30TXVwfchiZZoDqSyiC1Bl6agUhtLjQJVB9mvw4gN6SbrHRsnLh/sB/2dx
 JNddiqVVK7vB7oJkhgnesmcNVv7wcFit3E75oZIc9nBAvaBsXPiv5W21tV5BO985h6OS88rZbha
 0gDQpX1UA6ul6oGjWQYAs9JhGqD/JbQYEoyCLQbCIpM36JSGJMNSkp1sPvK47hmpIqlZpivEqym
 uVBbApFc+4VqsGAeGgw==
X-Proofpoint-ORIG-GUID: cy6g0VEJYtHLeN7Q-2cshFXKl4AYcS7k
X-Proofpoint-GUID: cy6g0VEJYtHLeN7Q-2cshFXKl4AYcS7k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_232756_497917_E843B7AD 
X-CRM114-Status: GOOD (  18.15  )
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

Simplify the driver by using devm interfaces, which allow to drop
probe() error paths and the remove() callback.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/power/supply/ipaq_micro_battery.c | 50 ++++++++++---------------------
 1 file changed, 16 insertions(+), 34 deletions(-)

diff --git a/drivers/power/supply/ipaq_micro_battery.c b/drivers/power/supply/ipaq_micro_battery.c
index ff8573a5ca6d..5e3fe3852d0e 100644
--- a/drivers/power/supply/ipaq_micro_battery.c
+++ b/drivers/power/supply/ipaq_micro_battery.c
@@ -7,6 +7,7 @@
  * Author : Linus Walleij <linus.walleij@linaro.org>
  */
 
+#include <linux/devm-helpers.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
@@ -232,49 +233,31 @@ static int micro_batt_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	mb->micro = dev_get_drvdata(pdev->dev.parent);
-	mb->wq = alloc_workqueue("ipaq-battery-wq",
-				 WQ_MEM_RECLAIM | WQ_PERCPU, 0);
+	mb->wq = devm_alloc_workqueue(&pdev->dev, "ipaq-battery-wq",
+				      WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (!mb->wq)
 		return -ENOMEM;
 
-	INIT_DELAYED_WORK(&mb->update, micro_battery_work);
+	ret = devm_delayed_work_autocancel(&pdev->dev, &mb->update, micro_battery_work);
+	if (ret)
+		return ret;
+
 	platform_set_drvdata(pdev, mb);
 	queue_delayed_work(mb->wq, &mb->update, 1);
 
-	micro_batt_power = power_supply_register(&pdev->dev,
-						 &micro_batt_power_desc, NULL);
-	if (IS_ERR(micro_batt_power)) {
-		ret = PTR_ERR(micro_batt_power);
-		goto batt_err;
-	}
+	micro_batt_power = devm_power_supply_register(&pdev->dev,
+						      &micro_batt_power_desc,
+						      NULL);
+	if (IS_ERR(micro_batt_power))
+		return PTR_ERR(micro_batt_power);
 
-	micro_ac_power = power_supply_register(&pdev->dev,
-					       &micro_ac_power_desc, NULL);
-	if (IS_ERR(micro_ac_power)) {
-		ret = PTR_ERR(micro_ac_power);
-		goto ac_err;
-	}
+	micro_ac_power = devm_power_supply_register(&pdev->dev,
+						    &micro_ac_power_desc, NULL);
+	if (IS_ERR(micro_ac_power))
+		return PTR_ERR(micro_ac_power);
 
 	dev_info(&pdev->dev, "iPAQ micro battery driver\n");
 	return 0;
-
-ac_err:
-	power_supply_unregister(micro_batt_power);
-batt_err:
-	cancel_delayed_work_sync(&mb->update);
-	destroy_workqueue(mb->wq);
-	return ret;
-}
-
-static void micro_batt_remove(struct platform_device *pdev)
-
-{
-	struct micro_battery *mb = platform_get_drvdata(pdev);
-
-	power_supply_unregister(micro_ac_power);
-	power_supply_unregister(micro_batt_power);
-	cancel_delayed_work_sync(&mb->update);
-	destroy_workqueue(mb->wq);
 }
 
 static int __maybe_unused micro_batt_suspend(struct device *dev)
@@ -303,7 +286,6 @@ static struct platform_driver micro_batt_device_driver = {
 		.pm	= &micro_batt_dev_pm_ops,
 	},
 	.probe		= micro_batt_probe,
-	.remove		= micro_batt_remove,
 };
 module_platform_driver(micro_batt_device_driver);
 

-- 
2.51.0


