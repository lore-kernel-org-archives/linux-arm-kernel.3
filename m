Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A8DC43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 10:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ccqq1qUvXleK1gCp35AxM5d+eMHG5Aas2iW2dgCZeys=; b=ZvD7KX5HxAyWOtLa9gZ+RM5vQs
	BnuVMG4XbhAj88P7yn5UgCHQtWjvMCpgasitC5FE989szdB2XcK5W5OmfSRkajQ+tN01x55xL6p+D
	t59jaTYDWBdew9+Km64NSjCqKp4b8v+3PC4AaO3e7n32yODDkmRZngscCGA9U2m2xFEmksHRaIoCp
	rtBIUVIhmkqap8K4paBbFidkzA3FG34VFrXXUirOXJ+M4ymCTxTOjLJJAcRl8a7rSO21mLT5LaIac
	D71cVrHBrscZWypCFn1bjgIY4R6ufVcWx5+SX3xl5pAEMd/DQtSB0URSGA1DDw2lrOmysiCrZAVgD
	8ObkR2Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVq3-0000000GgBf-2sp2;
	Tue, 30 Jun 2026 10:37:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVpy-0000000Gg93-2lHs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 10:37:09 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9n0qY1613515
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 10:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ccqq1qUvXleK1gCp35AxM5d+eMHG5Aas2iW2dgCZeys=; b=WpVntv6JLBY3v36o
	YM+/IO9SsbQUJrDEWB75l1+osDf5YEOBSVQK+f85Jc/29AeKVCXDxa7knRLJKwYO
	tiVPgVWeMYJYkPPne6M07kzXsXY5C+8yV6tqPUs19ZEMdxPAGQKNSMkEJNb1nHqm
	CvBPswjcrbneDm6rzeQnFi/BslNMn3p9Syyv647nOIhV8wx55hCzn2ZUYy7dE8cI
	vdG6R0eD/5iQfWLiNcyR3xlNOEl442xU4jlBwvtifzbPVPcKDYyqvF8N0Bs6mtmD
	bdKGbUMxqpsJR11ZM9+Dl+j1hdqiN4jjuTWjVkAm+BCu1tPszehxuRYYYKqx7Dfp
	cHoM7Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3x1cubt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 10:37:05 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84786d85ec2so1198652b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 03:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782815824; x=1783420624; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ccqq1qUvXleK1gCp35AxM5d+eMHG5Aas2iW2dgCZeys=;
        b=GCiyeOPS2TAToFhiJd5RJ0p1ldgZaCCJdo3R57J3B1ZJp0nOLAWw7XGw+wltt6UZkc
         TdA0Z5A56y7uMZLX0uBx5RIEu013muRYznw6tThKAzZYoWAimJnG69axjvGMxks/UXN/
         HEKtzA4/cdC/wyNr0sD9RGGD6t57qlFRZoeyM3YXJpXVciO+eM4AUV+/eTgluEpd3/mc
         6MYPthmn7AEYRR5u06zmUdxgAfShkEnnd83wZQFn9h74A6TJsebYN/B/jJU0I/w1t/0Z
         toCbNRZSReUy0qiTLfOgTgmsXbp+CZjBYjSTtBNzgHRMo9XcpmZyimT7MOlE7Ht/jfsW
         ocpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782815824; x=1783420624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ccqq1qUvXleK1gCp35AxM5d+eMHG5Aas2iW2dgCZeys=;
        b=mFHox2ZiBcdVAEtJp4gzqEwlnt4qr2v2EAYNC9Sub/TT8XEd0LTsbNDJX6dn1IJSCn
         K8CUx8CDYsTdWTzWF50ZjzHYxbyHQPhNqOozrXaX4csZKNOX8eC+WA+Yjg1WQE+eQLs/
         Vyt6RV1c0mpGWaP7LkiNwlKh9nET1hWBi2obygGTxpgR++SuzacVv8gwCVDi7g6lcUlL
         3xqRJyh+V7N+aDXOygKW5Wt/LuEwu7NcEiR5fTJcNy+TTGDjQKlkCDVRJ1GVEQazU4ul
         tCNGmCz62nBnMJoJtSS2i1nXs3kdv1TQL6SRgip12HSz6ad27JOuyQ68lw1wUTtMcXDb
         xEOg==
X-Forwarded-Encrypted: i=1; AHgh+RoaJEbeB/NT2K8COjHhPVnZImA0NTBo256DcFqjJhqUZ+lRit0b3NSy2wdILPBOAmi0ThvJ92ncuHZ8xiEWCgqP@lists.infradead.org
X-Gm-Message-State: AOJu0YwsMhPgI8gTFUQDz2ybhsA/htkOtqnsI1LB7Ad6ZnwtRb5pxeSG
	uUXtQBQWFLrXbdo6qShKvkaqE7JivqYNbg9I6TtQTrO5jCQkV+AoBUB9PrM5sasv+K3vNDOKJBo
	RbpHwBciYL5A8EliN2fE5QvXDZUfNjiD70AklaUmHetVco6OkK2kWX3cvH3o5DVGe0wBdYiYkH0
	ACpw==
X-Gm-Gg: AfdE7cnigd0WmF77j4kNLK+2pBDpZsNRJX0lVtOK+IbkyK5thq0Ab0+snUsB3lElueW
	3IoZKuQ6UlVG7VAHqFx8uROe4ARLf32hCKq/meMVLYb5GjlIuTmKcME/TA5kOjymy7LFb8BxAV/
	QQGHqz6OLmsr4iVRziaDJeqMrGiVOMDqa/OflICNEvX+VzgURXcTaAn3I/MoAhcP1hZSKa8cfDB
	ny5xgipbWm9jO+yMj3OPSidsREc/EldeeFLNRJD2+Nhv2TWH54dI3Ufs1zYBQ2UijUfzvIQueII
	OAjNzyjJc6QloBAHpJDFUKzV4eqFirD8y9uAiKezyoxhMB8l++1SEiqKfRXsZeFCakKJC5W9hBP
	BqIDqL92lr2HZ3LbG9iiWSr/foqwpBfhuvrY8EibRHR5jkmeP4EVGpqiGKABeV/UFoEoFA/e/ww
	==
X-Received: by 2002:a05:6a00:3391:b0:847:8f0d:cc0a with SMTP id d2e1a72fcca58-847aded7b04mr104123b3a.41.1782815824473;
        Tue, 30 Jun 2026 03:37:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:3391:b0:847:8f0d:cc0a with SMTP id d2e1a72fcca58-847aded7b04mr104078b3a.41.1782815823968;
        Tue, 30 Jun 2026 03:37:03 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cf9b8sm1677581b3a.28.2026.06.30.03.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 03:37:03 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 18:36:04 +0800
Subject: [PATCH v3 2/5] coresight: tnoc: Add AG tnoc standalone compatible
 to the platform driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-fix-tracenoc-probe-issue-v3-2-7201e1841e94@oss.qualcomm.com>
References: <20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com>
In-Reply-To: <20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782815804; l=4471;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=33uEo4UJgPbPMMZuq8e5HQE+sJ6R6/JGUnMwJkekCsc=;
 b=nNrbjemV8d+J6IgHPQfdSuHPIpGliTr9spJ+rmcrEEJfxdY9BFmrgGSbniTFeKZZUQzBMNTRC
 5dgo2C1vWTcAw4iG0Ggrg1ThVtoCRTwPfdQcBtLMLXQt2rj4fqUf6cO
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfX5cPG3qvV8Vkz
 Yey3NNQxy3OqFS38Wj1MkVlSYkulH9wv4mj+slC+jj3Cs4dQwnttnMRsFfopD/sEGvnI5dJ7hti
 dTNB0cVcjU4w8lK2Z4euT45XclDs1REHghHHw2XSvlqxpx9FCl8bSt73S/IEA2SEeBUjkMXb3W5
 9ygJk1e/Jb1T8BU0vTG3HEPPUPe1aqA/pXqlEzrLli74/OPzZMgdAlIlXgUkVK5rk8+HozrlCjG
 2FeuwlPP/G1dw+whwq2RAvjhgxJT2Q3bQllH4XPtlKGbbpInaawgPLoqqDc4nMxaJeKFywFgQll
 8EwjfKGBvhQ/Ei2M3RqQVuVb8ldgtYhmzVkYZo96fi0PCEj2fxVCp3k0DNPD+eByX3cWDY99A0k
 GQJF1mvMSaZdOT+svVLSJOWAjykOw9u5w7GEvdA+jmtK1QfS3nk/uyJYiRtv6PSGGWfNyRc7qxB
 osqq5B8osK9Y22PqRDQ==
X-Proofpoint-ORIG-GUID: mNH_5WXOIdaTND1T-bpPZe1qqdd-8WxB
X-Proofpoint-GUID: mNH_5WXOIdaTND1T-bpPZe1qqdd-8WxB
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a439c51 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=H-CQmrK-EWR9bHiRmqcA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfXxiScD46Q0IVh
 DBHggCqbDcLPwHHSXSa6FsdVIZNzOv+T2j/aWgYQfarKYECXMoBdacN8VOIuhmJqcPhsNhZYtar
 zW0t1CqbpvgDOL5iJQBgNx1DP+Teijc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_033706_821024_E5AC0F62 
X-CRM114-Status: GOOD (  20.95  )
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
 drivers/hwtracing/coresight/coresight-tnoc.c | 35 ++++++++++++++--------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 9e8de4323d28..8237467faba7 100644
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
@@ -295,7 +295,7 @@ static int itnoc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static void itnoc_remove(struct platform_device *pdev)
+static void tnoc_platform_remove(struct platform_device *pdev)
 {
 	struct trace_noc_drvdata *drvdata = platform_get_drvdata(pdev);
 
@@ -304,7 +304,7 @@ static void itnoc_remove(struct platform_device *pdev)
 }
 
 #ifdef CONFIG_PM
-static int itnoc_runtime_suspend(struct device *dev)
+static int tnoc_runtime_suspend(struct device *dev)
 {
 	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
 
@@ -313,7 +313,7 @@ static int itnoc_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int itnoc_runtime_resume(struct device *dev)
+static int tnoc_runtime_resume(struct device *dev)
 {
 	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
 
@@ -321,35 +321,36 @@ static int itnoc_runtime_resume(struct device *dev)
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


