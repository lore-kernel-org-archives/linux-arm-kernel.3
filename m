Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38FD3F513E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 21:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AH50fw9QTtdpPbt41EGIzTuypwuiZyQQHwG7B4PGWqg=; b=ypCvY0cLlFWX1a52CIAJ0reidA
	2Ydi/aaW4HnZV+ivHKDoZrwTzaVKa97mzEt39T7Pd6cuVqjQGrRBeM/rL9WheupO1bdJdxcjWQw89
	/8KteZZN0DL257UspOQCyNuf3EIQbz830kGXO8SRQLzNUMOi5saKiWZjab2Qi4OKl5ejTAlPNGDlz
	6sKxKRYntlps/sTUpZLHKoFMEOvz8eSvShqXmwZIXv7pdX+VRczTBnb/sNk/jWNPtFazv7xUA52E+
	jZerN0so5vcEniHTAaEE3nPpxJ6xVYbWMsFj/RNV5pOxhtu0S/0LPD8/6oGPD10PSFGK7Ojf1+VkK
	8YDJIjGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyGWg-00000002bIm-35rw;
	Thu, 05 Mar 2026 21:46:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyGWc-00000002bCI-3Y0c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 21:46:32 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625KmWGW3725809
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 21:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AH50fw9QTtdpPbt41EGIzTuypwuiZyQQHwG7B4PGWqg=; b=WFSxdaViIVPBNC+X
	9bqAQeOpl9vGXSUUioaKpINGyFSaBj1czQ0kQkCk8MAiZaNmcE7wHL7+fV2sSzvQ
	6+x6p53n81WDEWEXo0Nv8GVfz/Bq6O3kyYYQTrRB5tyQjxBDwKMW+0/9IXoQz2Y6
	d4BwliZ31/MTimweCNxGsU/+OJhDIJazRYQ9e0jeS9F19EGb9kvDa4WRvV90AKH6
	2VVrNet5cmq2/CEVpkYGWwoO80ZawsyODj/naisE4DyT4Ns4KkPWvMc1KeARrEeT
	q79E+dOAggE0iGVpm+VqfUmpaIxDya2l8W/S/L/z/yRp6GtTChefieGrRO/pVVkG
	7QkkbQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq85dj4ht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 21:46:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c71500f274so914053685a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 13:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772747189; x=1773351989; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AH50fw9QTtdpPbt41EGIzTuypwuiZyQQHwG7B4PGWqg=;
        b=amfyNzaC9uLpfJ0KzDy9K6n9KWjGSU7CKGFzTtr9eqE8QFV4zKIYJ36vl6GrRwnG8w
         KspIDNa03CpTrmPTgh5x5oVmwmH4mDXOU4ldlX6H0GBjrtrDeVJLYdCPZvIRoMXj4FGc
         y6EF0WFZmzrrdoIMpZAWurqqJXlMkTm2m0mpCt4dvs0Ksw+qU1bFqc35D/clyZIeRYLX
         2x0MY4H7ikph/Z+74cx239jS5xTDDY/c29QGZCMZp+HV9sn8WtL/p5Pt9MyHJ/9CQpgZ
         LWwN3TRt43edDc1/KLoyXnyC9k0ZsH4Of2aZCoiIJZa68dhvYu3yODRk6ke541LjPBSV
         gWFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772747189; x=1773351989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AH50fw9QTtdpPbt41EGIzTuypwuiZyQQHwG7B4PGWqg=;
        b=EB4zOAlLSMEW0fNqJB90Y2uxixMzm+2qiaYftf9psO5aQ95pPwV7nW/0YehZ3fMS27
         sW9Pqb1BxKQ7azbH9XlXxXkbYtXM7xfI335Awg80U7YW7gu4AN5dM/EMKapuChDgIgen
         VgsJvB0rtMt3ZCSDG0uGS+C8JaWrX/jvGKT9n0N/K2nbCyjGAk4hXVa/W/IiiGoO7Aa+
         +mAbdGdt9gwjY4fxVNKuxJdADetupj6uX348pHa7xnNMb6zPsH2vh7nKla3FvMwh1AQf
         RqD8DrjVt4Xhu8+o+sJDjp1Q/WBTLYlJoojoQ4nX3/7GZ3CzT74fVvoqmk32AMPUlsOX
         OapQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1PVLY2Srs0dKwYE0z3wHsNahNttcQQcE+WnJ0IkGSwXmqmQ6KwtIK5WABFkYqlV9swU7Lufkk5dLKiJd5tVDH@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7qPbUvhn4BODYFLCwAw6JolYSLMSMRBff+eOeY/4iiywqHJK2
	BO83qKr6puOi0Kid7KvpEDEwqHo954pltfj3EnbXGOZeEOCwb5WupSxrU8j6Fq7pDGzm+ZbZNBT
	sQ34+tHN7B/g4epm4mWFr9SFn0zhE5zqMtuFQX2mFo4PRUgC3Y+TEKPUgN3zv9sYA5qr1EJnMcy
	9rdg==
X-Gm-Gg: ATEYQzxePxwnR4EMXC9CzIpB4zK6Fs6TR3ZHzWnAlwU0a80WD/lcuJo2X3xtAHjtrwK
	USwP08rVfeYVaFlexbcIvKnaXR5TgkKlDyVOOksPvDgIdwf/maxtpQhi35fVmR1iygL6c7GgZwI
	/UfxQNKq7Op5FBZnv+gX2F3QFZlH6u7eyDX9qwlnCnbvQPVPAcbOnuPDvUmCyP/Oy7EkXNOIuuO
	2gFWABI6+DYEev2Ra7qFD4dzUagL3UFSajDR+4s/x0LZxxG5BuRSEluL+jTrVNZwYVR3llPWy75
	K8o0AFbsxB0xCzk2enoeIaEDryIyggPjCVRWPMPBVFsfzWZJYEy8qiCayBVz0x7HYxz0ri8bOCb
	KsROhSaU6MFgfoKm/Viv2MmkBrnrvcF9we+/PLRV2nb2u
X-Received: by 2002:a05:620a:1726:b0:8cb:4fa5:d47a with SMTP id af79cd13be357-8cd6d494e49mr2329485a.77.1772747189108;
        Thu, 05 Mar 2026 13:46:29 -0800 (PST)
X-Received: by 2002:a05:620a:1726:b0:8cb:4fa5:d47a with SMTP id af79cd13be357-8cd6d494e49mr2326485a.77.1772747188622;
        Thu, 05 Mar 2026 13:46:28 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a58dasm28571575f8f.27.2026.03.05.13.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 13:46:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 22:45:45 +0100
Subject: [PATCH v2 06/10] power: supply: ipaq_micro: Simplify with devm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-workqueue-devm-v2-6-66a38741c652@oss.qualcomm.com>
References: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
In-Reply-To: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
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
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, driver-core@lists.linux.dev,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3021;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=G2Qaq1IYTDtA8nYq8hb67ozAR45iYXNAROMWtKf03Uw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqfmdS1zMtD2UaoQRfaiq5mLP0QlOTpilY/8TD
 J4ztu2IWgOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaan5nQAKCRDBN2bmhouD
 13BxD/0YZqo0vRusnBrySJI4j7j0qBvMSBLl9ERMwbH5zZQFXisFq0V0/yim2m6aeuWG3sue54q
 cQyLvmbMOtlHEjhHsJW0gAP7otcp1O0SfR3ykSEKToa0wZY7+zGXm7wnrXKcTsXhcddZj9Ywk7G
 k8pxhlb6R/iKHlXjSedxxBM2U3iicVf9s043yF+9ADEZTF2SsoruyLdMui8TCO60ILt39gQjuqx
 9inYM98ZePPGSQtHGfvmONO7Gu1D+EvkseMIaO+YIhDzEMAJUAmew+WPrK567ES5pxsJ/GIg9ul
 ND9JhEpU12ZAB7EKrHhCcxcFQOn6vDEvL5ZJ4rtl/Ts+C8ufpzL1pVEuldmRhFHjG17dv3Mm1hU
 qG4oztSBnPshts2d6Nc/Y4uayRlpNpeK+7SrP2f/PrWGQdd5KdFo5Iu1uJnwGMsiExW0MLOT2eI
 43o7eDO7M+jC3NfI7za2SVUY8POdUyx/ba5BPcXUmJd5RpRiyOgPbEIZeRhYhkxSm6zNITQjBIQ
 7tVjG3QlahgAPAcbxe0FiplwIwhYBRcso/cJGY5XD8IFB9T8+OH6y3pOed4UM7DNe3E2zT03P08
 8/si+s74GY7hTw3HR+7C9YKGWQeAGDNHcOFKDrfcLEjPqmN4Od/VOYDbfizGIxxbX4sM4VQDDfi
 JSVXiCJBbZxkykw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: dxmib-Bveis9tg-aXRqegf4xjzWWevcc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE4NSBTYWx0ZWRfX5cpm1+5nPl08
 wVjbUoqCwd39LRpZKo5B82JqVewWzXNJv5iuHN3du371q8279DaclmXNvkIL/Q7C0qNUbP6bHl6
 eu9hIpWKyMntSfQH6fEwrY80DbWaOhvF+Zqs8EJcPk3urCdNhmAOX1GTks8KqBgJEz0uivfsgiB
 xBmPGLUVxb/kZ1LCpvnhXUNUXdIS9LyhtExs0lbfMLzPYkusINquwfN8SP2ZMNO4XbRt8ZuyMRT
 C7NLxVtQmzsHMNuIFlb8cazoqQzyCoeUDLcoZ0TbJ1dziRVSw/2/KTn7VsbKP4xwGL2toieW3FT
 qXmDXlAosHNVmuHBoNJdFtZvTowohj8uYtm8nKSHVbziy4mlrNWpSiVWYwJ8U4tCKYFoy7tbrkZ
 0XJeJoYTRMMa/guc4cIDyJX7WcdBEw8gYxSgjvcRIHow8ts1kDtBCB+1zxjUZJFI7ayE2v9KoPb
 G7Qp0BS3WHLjhoH6/ZA==
X-Authority-Analysis: v=2.4 cv=aOb9aL9m c=1 sm=1 tr=0 ts=69a9f9b5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=PkD0MmKtpR7JdVUpc-MA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: dxmib-Bveis9tg-aXRqegf4xjzWWevcc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_06,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603050185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_134631_086605_41A17054 
X-CRM114-Status: GOOD (  18.32  )
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


