Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B037C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 01:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tgOSSppSHeyCQQrXCGuCdT6GPj1V3cln/qe0vnrJEJA=; b=Tb0YxxUt3e63EuuEXYEG5FL1W0
	bbrdOOsXTzyf21nZbGJuvnOnEmqB9jtkszL9V4UxSiH4O7CLC9GDNYg3LJ2jA+yMnAhR6gFUK5VPs
	sDRt3Y66utgNVikaR0FSDjflNA/JIvjmtiHUE7SBoCNPb9aSc+SvG+nTOf5OFXDakkNCovDRkv2Jp
	o15KPFk05OTaaTkPGyoSZsgCLQwTPK/rWYjUs0MDQnPgbVkbSX8h85OFf08zf4Nw2r3qIC81gdErP
	qqBUux3j8xWafqBVxo5JYDw+bp/stTIzBgDnOGW7iENm0Mg7GhhjSR0zwKlflM0ChB7+zVf9Nywox
	a1knaABA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wek9q-00000000Tb7-21i9;
	Wed, 01 Jul 2026 01:54:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wek9l-00000000TZi-2X8Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 01:54:30 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UNM2gU3413700
	for <linux-arm-kernel@lists.infradead.org>; Wed, 1 Jul 2026 01:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tgOSSppSHeyCQQrXCGuCdT6GPj1V3cln/qe0vnrJEJA=; b=o5EZ128SMcw4GUHj
	lP90HOxkso3lbUvP20Jgu4xk7NpIujDz5aY5xqz9yTM2ESCqg9mIpth9plJqGgkY
	TiC69bkh7zAlQgSmePqJSRT/BMFr0SXlb75hM6T5mAV9UakfBltTw9879Fnl+GuY
	YSDisxHzI3yQ2jGOZSgEvEP38+uAYj731sZuj5Ww3wjq2Ude2H//fbDB5xJR8wdP
	ypCg35Du8LmuIr6H+mu3gXJbV2zhTZScYxEVJDq2NV52P51wCFc+E6BhuiRKu5bp
	3Wn4nVUJe8dmKUMVcG9b6uu0xRHb0OHNQqIxByfSlR34f1oZ98qrEPFdmh33vfP9
	ai70RA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4hfya0pc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 01:54:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c9d8549d55so1617825ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 18:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782870868; x=1783475668; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tgOSSppSHeyCQQrXCGuCdT6GPj1V3cln/qe0vnrJEJA=;
        b=QyjaHp7gfVcQ9VEm0O5Gd3DhE/fFelZBrRANkAly3sodydYkuw8SxzhI0b9sq3X1cK
         oGY8Jc1009kfOOZuuLW6eGN/ZzB4GXdH3CHM/EDkmEMhrn853oeG0C4kgjxN6y62gm66
         lyrKMCg8H77LiNgtt/b5BiZMaFUIEquQDJ4Dsu6bw9R98W6c+iK/5QqjRmp4ZpPvDKX4
         g/SLwIPJ81M5znBpCCoYrEztWPPRh1RHjjaGA8MALAm5pCkvODBCYXCLh83fdAzQlzCB
         ZVtqu1X11oDBRjWfVuLkiBEl+QRfNGnCdAjR9ldmB0M2r1BI4QdhE5KF0jBj1+1MzuNa
         PILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782870868; x=1783475668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tgOSSppSHeyCQQrXCGuCdT6GPj1V3cln/qe0vnrJEJA=;
        b=jyAQ9KwPyZRXZs7JxbSWSm9VA1SbtnbzW3aSLxtQ/jU4znLRhT8N6W08bYDoDmzsi5
         lgel3i8Z2y1iFbe72Ly9jAwWTy8oO1I4YNsMv1/s9hjw2yjyMCBGPF7thJ3vUHuwbLqb
         9/tnnpKSsn6rOb5kBxwxMOFfBaYlO14ZaRPAQa6ba7tjnzUiG4ESkeGP7kEo75cSeJxu
         6yUQvnctFLwuQr5xU1Na0YmENmMU8/at5wAyMs/jRq7UR1SQ3GzUiK0+K0xcDdHiJitl
         ki7lmuuWn7LMMtM/yaC9Jr4ibrAJG4oRNf9C0MuETvdDiQInikSaiTdKA3cLpz7VOsFY
         iy8g==
X-Forwarded-Encrypted: i=1; AHgh+Rr0lhdmtUsnRptdnFe4XpustbqAO3SXD0n+jAzCVKICiqDt9zT2hhXAD6YaWyvIjHJbgFEozJlJlMjmDTN4WokK@lists.infradead.org
X-Gm-Message-State: AOJu0YzORtT96LGnd2VF3RfQI9PZghIdwEotA41f8zj5VVX+qcFY4kSP
	foFyE0Eu3Av18VgOofqmf592nREGJP4vy3RskvrRvkCc8O3OoEN2vNYPb6CkoC0pq9y5S7h/UTt
	9guzIoxx5r0bSlFdDSWI8XnVwwVIV7MG20Xa5/WEUQ3PtkmI4x/cWz1dHcgPHzxt6/+CTbFSBb1
	hDsA==
X-Gm-Gg: AfdE7ckjsaWNQ9NmVe9OQ5eU4489b47XLi2afhj7xxkfoRk2JvYifvPsopbFF5Ymt+E
	QLx6gWBIJQ7u/qe6nm+GgrnG8tdPerJV2vdwhh54iP6lxUxcR+YMZa+ZZZNueEd8k92fq9IRjQS
	XjhK6JrPiX66tkh50AQJPPiWDxzUuCYmdntHNbspXOJVt3z7z7pQm+E46EGZILHr3s11FzL3NFf
	nOA1IFICMl59NJMFD0cSJbVZttnMB0sebp2jAhu7k/6j2alh488apKXyDfKavd1m4Kdqm5+/7Q/
	pF8v0d777n7MK0AYyp2yeVzOOFIOuTUBVKzIhzumoi7B2q/DVrL8tFtvw02gqA8UkOsM8y5j5LP
	y7BgM479HmnkQfUkvGjeNb7UKxv7P7o0s7EF6vwxZpc/uAnhG5ub/O67D3f6akqsrUlfiCx9AKA
	==
X-Received: by 2002:a17:902:ce06:b0:2c9:a5e9:c26e with SMTP id d9443c01a7336-2ca5a552e0bmr24064925ad.13.1782870867683;
        Tue, 30 Jun 2026 18:54:27 -0700 (PDT)
X-Received: by 2002:a17:902:ce06:b0:2c9:a5e9:c26e with SMTP id d9443c01a7336-2ca5a552e0bmr24064595ad.13.1782870867202;
        Tue, 30 Jun 2026 18:54:27 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a7102esm23040315ad.6.2026.06.30.18.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 18:54:26 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 09:53:42 +0800
Subject: [PATCH v4 2/5] coresight: tnoc: add AG tnoc standalone compatible
 to the platform driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-fix-tracenoc-probe-issue-v4-2-aefab449a470@oss.qualcomm.com>
References: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
In-Reply-To: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782870847; l=4552;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=jPUYlzMEHul9CNoXVAyvw1WxSAWNAF1m3Kd9igZDHK4=;
 b=OEqkorXAE2d8ScPpY78cyBhpnWxbNw8WGkA7mG5v1VHqkug/8+KCAMspKvF+rul3OJeFxzTkX
 kLcJShiMV6iCxwnZGsJjEz9rb7WJd/1fb3OFFV+u87mJbJXNm3N76lr
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=J5OaKgnS c=1 sm=1 tr=0 ts=6a447354 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=H-CQmrK-EWR9bHiRmqcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: rJDEq9dUoHo1HJC7xhcGQXExcVDUVuPY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDAxOCBTYWx0ZWRfX2N7G4XzxDY1e
 QF9WQc6ARDOpA6Lp+MguEjQoKH2UyjlypTUyfPMooRteK/qxorkgYWSxKL4hzCZOEpZ+GMwrP6G
 p+vUHgL83R7/0tFoMtxHqp2zNW4LWOQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDAxOCBTYWx0ZWRfXyoPqrY8f8Tth
 ug2xbpHEPo1aXCJvbMlPLREWeg2/KRKA5eWl4M4y/g+voy+UYg5GO8ajQxqU4Ralxk2UL2xw5g1
 ttzXj4dlyaQQ0gWGT/aGoZgyYVEVN63IeazXwhh8lzGW6B1slB5A2oVjCtjm/c+pDJNS0lmqa01
 utgdhmZwVLIkkfAtrQeVqh6j7vODu7KDxhGhAbXhWyK3AIOXENsqLjADLoCR1PDZKiVPFww5LJ1
 bbWVjMsNVwN8JAqsKSa1Wl0dZWJthveTduwMEwRu2oynSMUWaQJpN+5XOI2a4DRRmEqzebonrQk
 qfwaS+NwGxYYILwWvBGL4IjZ+b+/oApd2k5gwoCv82X3uETqWKgY7kOVGjPV6ORNsZIcUnBIO+x
 0qI5cvUababd0mf3TTR4f9MsiefqaorBx4TpCMXU3hDe/Blr0c1o9e6iY+hbZSNeLomVPxDbU0t
 P4GhmdNPSPA4TgkTv+g==
X-Proofpoint-GUID: rJDEq9dUoHo1HJC7xhcGQXExcVDUVuPY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_185429_766879_A75D2977 
X-CRM114-Status: GOOD (  21.51  )
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

The Aggregator TNOC can be described either as an AMBA device using the
"qcom,coresight-tnoc", "arm,primecell" compatible or as a standalone
platform device using the new "qcom,coresight-agtnoc" compatible. The
latter avoids the AMBA bus and the associated peripheral-ID probing.

Add "qcom,coresight-agtnoc" to the platform driver's match table so the
Aggregator TNOC can probe through the platform driver, and rename the
platform driver and its callbacks from the "itnoc"-specific names to
generic "tnoc" names, since the driver now serves both the Interconnect
and Aggregator TNOC. The platform driver name is updated to
"coresight-tnoc" accordingly.

Restrict the ATID-unsupported handling to the Interconnect TNOC. The
previous check disabled ATID for every non-AMBA device, which would
wrongly cover the standalone Aggregator TNOC. Only "qcom,coresight-itnoc"
lacks aggregation and ATID functionality, so key the check on that
compatible and let every other form allocate a trace ID.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 37 +++++++++++++++-------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 9e8de4323d28..4ccd5f38b92a 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -130,7 +130,7 @@ static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
 {
 	int atid;
 
-	if (!dev_is_amba(drvdata->dev)) {
+	if (of_device_is_compatible(drvdata->dev->of_node, "qcom,coresight-itnoc")) {
 		drvdata->atid = -EOPNOTSUPP;
 		return 0;
 	}
@@ -278,7 +278,7 @@ static struct amba_driver trace_noc_driver = {
 	.id_table	= trace_noc_ids,
 };
 
-static int itnoc_probe(struct platform_device *pdev)
+static int tnoc_platform_probe(struct platform_device *pdev)
 {
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	int ret;
@@ -295,16 +295,18 @@ static int itnoc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static void itnoc_remove(struct platform_device *pdev)
+static void tnoc_platform_remove(struct platform_device *pdev)
 {
 	struct trace_noc_drvdata *drvdata = platform_get_drvdata(pdev);
 
 	coresight_unregister(drvdata->csdev);
 	pm_runtime_disable(&pdev->dev);
+	if (drvdata->atid > 0)
+		coresight_trace_id_put_system_id(drvdata->atid);
 }
 
 #ifdef CONFIG_PM
-static int itnoc_runtime_suspend(struct device *dev)
+static int tnoc_runtime_suspend(struct device *dev)
 {
 	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
 
@@ -313,7 +315,7 @@ static int itnoc_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int itnoc_runtime_resume(struct device *dev)
+static int tnoc_runtime_resume(struct device *dev)
 {
 	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
 
@@ -321,35 +323,36 @@ static int itnoc_runtime_resume(struct device *dev)
 }
 #endif
 
-static const struct dev_pm_ops itnoc_dev_pm_ops = {
-	SET_RUNTIME_PM_OPS(itnoc_runtime_suspend, itnoc_runtime_resume, NULL)
+static const struct dev_pm_ops tnoc_dev_pm_ops = {
+	SET_RUNTIME_PM_OPS(tnoc_runtime_suspend, tnoc_runtime_resume, NULL)
 };
 
-static const struct of_device_id itnoc_of_match[] = {
+static const struct of_device_id tnoc_of_match[] = {
 	{ .compatible = "qcom,coresight-itnoc" },
+	{ .compatible = "qcom,coresight-agtnoc" },
 	{}
 };
-MODULE_DEVICE_TABLE(of, itnoc_of_match);
+MODULE_DEVICE_TABLE(of, tnoc_of_match);
 
-static struct platform_driver itnoc_driver = {
-	.probe = itnoc_probe,
-	.remove = itnoc_remove,
+static struct platform_driver tnoc_platform_driver = {
+	.probe = tnoc_platform_probe,
+	.remove = tnoc_platform_remove,
 	.driver = {
-		.name = "coresight-itnoc",
-		.of_match_table = itnoc_of_match,
+		.name = "coresight-tnoc",
+		.of_match_table = tnoc_of_match,
 		.suppress_bind_attrs = true,
-		.pm = &itnoc_dev_pm_ops,
+		.pm = &tnoc_dev_pm_ops,
 	},
 };
 
 static int __init tnoc_init(void)
 {
-	return coresight_init_driver("tnoc", &trace_noc_driver, &itnoc_driver);
+	return coresight_init_driver("tnoc", &trace_noc_driver, &tnoc_platform_driver);
 }
 
 static void __exit tnoc_exit(void)
 {
-	coresight_remove_driver(&trace_noc_driver, &itnoc_driver);
+	coresight_remove_driver(&trace_noc_driver, &tnoc_platform_driver);
 }
 module_init(tnoc_init);
 module_exit(tnoc_exit);

-- 
2.34.1


