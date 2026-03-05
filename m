Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBCEF513E1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 21:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pgZIxx9eLQfleV3COI3H9DXbp3fax2/aDjoFoxNcevs=; b=IzKVkOFrotM+kVUk/Gkgesrqio
	fjCOZFuZrYta/YagvGVxHcGlzXkTixZOUMIXPJrbRdnjX2JggizzOxEcVlrJd0tYzUznIJbt39WLd
	q5jCEdGdu7YZ6rxtwAT+fAuWDF9Lk5XIoVLSYSdMAY5DpLGwijU57B1kxCmC1PvKUZ+1c9KBOW7mD
	kcrTTF2aAMET1JQj0QGg20iJuaWXV63UFpq/aI56s+PB9SW4/61A2rAIQtsk3A3elJL+SF2aJNW+a
	21ABT2Fav0oISeDQdG7DpCMzvtEEeLak94nrP0IBhAOIX54z1xfZLjpbIHKpAt1fsLqPGUZancGgl
	CGSKXA4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyGWt-00000002bcH-1Eza;
	Thu, 05 Mar 2026 21:46:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyGWo-00000002bSh-0Hig
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 21:46:43 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625Kmaes2267229
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 21:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pgZIxx9eLQfleV3COI3H9DXbp3fax2/aDjoFoxNcevs=; b=bvnfZbaaoSTnNtHJ
	QLu3/Je1kxQ2NwEeQVij7O2D+9K1jEBlNqTe7grsTCNYOGAuAFRocrNLDemddCp+
	Brczs2v4ky3Pzpq7muaILKAVG6pTtyalgnmT3S1DUowfPFQJ4RZhwmtKxUFKPvqa
	QAKPMwPTSE7joWXqNnYLCYZjwGydwEsJBakCtU8ayRP3foURvgKRM0pAAHf9DZBQ
	/E+3mKo+18ProDWtpfS3nFk3garSSlTFjVKU/3Zv6adS42u6pekPj33QYBrQMTMc
	yIYg6wMPkER/m+2G2NCIONv31IYeS4v4V96I6mxI7g2OmpuX4br73S0vmBBDK7WN
	5uQ9ZQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq380u83b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 21:46:40 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a08e6cd15so241767416d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 13:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772747200; x=1773352000; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pgZIxx9eLQfleV3COI3H9DXbp3fax2/aDjoFoxNcevs=;
        b=VZcDVRfj7AHJJUAg+/qC6Wdl09ls01JIcfp7JdjFj+x6zCoif3dyJPe3iXcgQYKRNF
         jYyPDFCDts/5UaJ67f1ElpzijvzY07foATiaJ1wyqm/QSNsqNNw4wnUDndiZq+k9AoIq
         gbupRUh7UXNI2PyREUPpf2r7wRWu6qJrcdRgSyd9wT7VmOhXdsgV1ipyjJsBq4dojtR+
         6nvHTMG2L/iiDWspZJPg3K0vR9hYzWES5UJ5CkE+CtX5UpPnMORyfiZSQ0qsuEg4inOx
         G/LjEloez6IkwrgVKjdkubfJixL3RB8uOpUTE9O4mJAKplKcNY/xBeOk+alAbHm9/Aqb
         Jr3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772747200; x=1773352000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pgZIxx9eLQfleV3COI3H9DXbp3fax2/aDjoFoxNcevs=;
        b=CDq3UZ+V+4C687QC4EqQ3n+NFk5/qQJYr5W3G8NhdIg4GWEobzV0/MXIxrQvtlAy8G
         dF0uJTqet3wEMhqs/QeUDqR/PMamnkwaYEBELpSZsSVbn4Q3gA4IuSTYFBHLj5+6HoRX
         qpawG41rMFNr/AG/1BNCBhsWHY3mSKGh21nr8bWFDYO6A+acsh8tQwdsN/KkFZH9l+Bh
         KJaEDSDUaJ+8iU0flcGpA0ATQTU16fM7hvCVGjNa6YWk0hptCt5Is3z2qnaotmGCbSpf
         2T3voyDZKs4Yq+6HHa6xkTmwjIE7yyebQeRFEs9IcSxi2c1nHsbuWyXpXtBdE8V/wLXH
         Bteg==
X-Forwarded-Encrypted: i=1; AJvYcCUNac/4dfTg5V9o9ucyUl9JIjv9OxF2eOB/5J3k87kp31zZAAmicyMTqwz5kvZOkeel26UD0JfiALkPy01pxwYa@lists.infradead.org
X-Gm-Message-State: AOJu0YzHuw/MD4jutMo60byABTMlLaQlEJY1Mb47005wY7jZK5Dc4k8O
	Dlh0WQ/HIAOzBOH7Fh2qQTy6t1TwLOWyiqVGAKHaSTmZCxio0wULkQgTUqHxmI3kOoYr1i2+jSW
	QOxtfbEclJ+Do969UkZRbE3RcfMmcPwKQuUnuuVibL44x7I2VyJIwFXfov22vjULWGIYsF/wwXh
	Pk8w==
X-Gm-Gg: ATEYQzzWPLxjpWPTQPkmeeN1HnQSHn4TOQzRxi+K3hygBnTqzOAuvGl/RZDkIkE1N8P
	1l7nDtaOq5GqYDapMn+kmWRn3Y5AMLInwEgOLPw8RSDRy/5vzm2KjbEUjvnKn4NsLilsocv+MXB
	/BbHxSnHgopaom4Mv+rG3BBpnM1RGF3jcaEJMiQJuj3MG0JATr7/W9MpRPNv4DHhTnRaixZmlk1
	vEvmfMAdNdacwji/KAIivBU1fxVSvMIW7QCTHAlga/vQLM2Z+ICWMzJf3LFHeKbojexPOHOUl0g
	sVRmNF/Hz9JWuCAJxqWLrIyY2j+1iBs0C4LWqmpMMuENuYCRkf4Y9/yI1aoN9agYZ22h+x8NrWp
	Si8HqPXFxdamy86XQy72wQDVFY+E/t7QKxAhiSLrAnLs0
X-Received: by 2002:a05:620a:7016:b0:8ca:4288:b168 with SMTP id af79cd13be357-8cd6d437779mr3217185a.42.1772747200195;
        Thu, 05 Mar 2026 13:46:40 -0800 (PST)
X-Received: by 2002:a05:620a:7016:b0:8ca:4288:b168 with SMTP id af79cd13be357-8cd6d437779mr3212985a.42.1772747199687;
        Thu, 05 Mar 2026 13:46:39 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a58dasm28571575f8f.27.2026.03.05.13.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 13:46:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 22:45:49 +0100
Subject: [PATCH v2 10/10] platform/chrome: cros_usbpd_logger: Simplify with
 devm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-workqueue-devm-v2-10-66a38741c652@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2676;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=KKE0bInc4S8yLhSPSFu/FMkb8dRGE2OpkgkDbv0pcmo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqfmhjGldKQP5o21zPRfDRDP+tGkXe48E0j3pE
 6xnUGNmWe2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaan5oQAKCRDBN2bmhouD
 18WOD/4v7VpFEZzjp0sl26+pDvHQyMyN1WAQj3Vsl3sQmb9jimlUvI1QOVLIuvMNOKKBU7VTVZB
 P+9vnO/+LOEYm89+Jr59jeey5RNqtDUlwk2VjinTcgW2sqYZiAMYQEOdehNCahgQCwBHX1eOkQo
 Qxytd1zdJAUblIz7+q5TfeXZ/WbOr0rLPKZUlMIOYqethUDTLCz9kyCCxeE3G2JpWuSxcEMBExd
 /ZWbCbxe85dFWg4JFCMUfH3N4ZaZPsBvasQLh0BRYusq6/7d0KrqAVxbe5vUA66X6MT/7I7pEDG
 /BDpfmkyMAG/349ekOnqQ9sZ9wMNf5b7acHa5NBm6N1/td0khdgFCwWzK9/UZ6YP/8MllnhU5vI
 7cBRVz2rR1eNDnpzD/SsRRKpuFC3BAM2gEuXzTPKSEfhfa4rTnvfHX4LbjDUpB5lPtm3KBJpTmL
 FQsF4DyfRnKSCZ5OfJd90X/TW8sjpSLe3JrRdwFjPjgfWkwfMFa9kU5Ut4FdxGSOz/ToEOulLx5
 atvPr3JE06SlX10hhzkWmxgRBYpg0OJV9ov3R6evSxpSrJ96YndLn/2uttJyh2avyAbNv+T2hQg
 i1Ar+ZOQSn+81ns4U7+yR/vRmmOZSXetZmXHbbY7yQV7i3GRywDQhoTIWPvUqoZMqyYJOxLns+l
 HZeQV+6JaRutfYw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=I5Johdgg c=1 sm=1 tr=0 ts=69a9f9c0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=_A9l7huuyFcfbLupPaEA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: sHN9QzgBrMyVaN7SaNOXOUvRCflLnsgn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE4NSBTYWx0ZWRfXyy8WVniz9Hyq
 fLbV69IKIii3vGRWNBkDQZiQod/8H9RgITH8uYdgvoz/3o4iQYNDrDSxBacDBSxeuAWfMWpGJjk
 nzr8uC1zOsJLMezbqh4G1KvCrRqEycbESewcY4a/FlVoDi8tF9ssnSgQ3HcRvji0OKv2AHdzs3m
 /Rs5JVTretk3Vev9lyrZYpqGSPUoHTJ+NnpCUtfzIfUX7tRuCpeHIpCP3reK2IVAuTqaBRg+Huj
 3hYKRpugUKGSekdVOk0UvwUdR0KPPMJM48qtLt1wlroRCf3kU2ainweWMbCPtFHn6fkCFsOkQfP
 jG3r0tOkuJ52KU/twBxE8Yac4w05xLrmybxj0Q+yc7K0BG2jJ6/tGGineJARdjTOTks9rPW3+Di
 N3q3i/at6g7BxZXuwr78BqkllRGNJBQAkL2qyOmB7AOdQ8SXX249W3nO0NehtUhLbGm/tf8IILr
 4EIWtQM0RVjAzQPvjAg==
X-Proofpoint-GUID: sHN9QzgBrMyVaN7SaNOXOUvRCflLnsgn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_06,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_134642_283560_793A21AB 
X-CRM114-Status: GOOD (  20.37  )
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

Change is not equivalent in the workqueue itself: use non-legacy API
which does not set (__WQ_LEGACY | WQ_MEM_RECLAIM).  The workqueue is
used to update logs, thus there is no point to run it for memory
reclaim.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Use devm_alloc_ordered_workqueue(), mention this in commit msg
---
 drivers/platform/chrome/cros_usbpd_logger.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/chrome/cros_usbpd_logger.c b/drivers/platform/chrome/cros_usbpd_logger.c
index 7ce75e2e039e..d343e1ab6f08 100644
--- a/drivers/platform/chrome/cros_usbpd_logger.c
+++ b/drivers/platform/chrome/cros_usbpd_logger.c
@@ -5,6 +5,7 @@
  * Copyright 2018 Google LLC.
  */
 
+#include <linux/devm-helpers.h>
 #include <linux/ktime.h>
 #include <linux/math64.h>
 #include <linux/mod_devicetable.h>
@@ -199,6 +200,7 @@ static int cros_usbpd_logger_probe(struct platform_device *pd)
 	struct cros_ec_dev *ec_dev = dev_get_drvdata(pd->dev.parent);
 	struct device *dev = &pd->dev;
 	struct logger_data *logger;
+	int ret;
 
 	logger = devm_kzalloc(dev, sizeof(*logger), GFP_KERNEL);
 	if (!logger)
@@ -210,25 +212,20 @@ static int cros_usbpd_logger_probe(struct platform_device *pd)
 	platform_set_drvdata(pd, logger);
 
 	/* Retrieve PD event logs periodically */
-	INIT_DELAYED_WORK(&logger->log_work, cros_usbpd_log_check);
-	logger->log_workqueue =	create_singlethread_workqueue("cros_usbpd_log");
+	logger->log_workqueue =	devm_alloc_ordered_workqueue(dev, "cros_usbpd_log", 0);
 	if (!logger->log_workqueue)
 		return -ENOMEM;
 
+	ret = devm_delayed_work_autocancel(dev, &logger->log_work, cros_usbpd_log_check);
+	if (ret)
+		return ret;
+
 	queue_delayed_work(logger->log_workqueue, &logger->log_work,
 			   CROS_USBPD_LOG_UPDATE_DELAY);
 
 	return 0;
 }
 
-static void cros_usbpd_logger_remove(struct platform_device *pd)
-{
-	struct logger_data *logger = platform_get_drvdata(pd);
-
-	cancel_delayed_work_sync(&logger->log_work);
-	destroy_workqueue(logger->log_workqueue);
-}
-
 static int __maybe_unused cros_usbpd_logger_resume(struct device *dev)
 {
 	struct logger_data *logger = dev_get_drvdata(dev);
@@ -263,7 +260,6 @@ static struct platform_driver cros_usbpd_logger_driver = {
 		.pm = &cros_usbpd_logger_pm_ops,
 	},
 	.probe = cros_usbpd_logger_probe,
-	.remove = cros_usbpd_logger_remove,
 	.id_table = cros_usbpd_logger_id,
 };
 

-- 
2.51.0


