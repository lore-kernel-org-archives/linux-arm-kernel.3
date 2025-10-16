Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668EDCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 05:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2qH6VhWxn/zSPj4QiRAg7fr+LOmrENATveDxzpql1NE=; b=KESlmj9B8JM0tXS6p3mJ8Jsz2F
	Vo3nN6LtuCPk/pGTNrkBgKILGoA0b1L2iDjGLA7ubeAjbdNStNEhnRy6P4pwRjUIJJ9Sjvkt7m9kG
	yrnEYMB2+E0fpvR4h0xwqNwob2SKYeLNNZvqRio7lkSJ13iKpZlSsl3COOh8MTdkCT9VH/zhG46P/
	XlCSPy0w2IuJdI48kjQnPq2JH1nwCFdUS+5cpsVGtuOz3IBftjzfS96vGz+MK0Z9gYTWKAxu+CqTz
	lavT4FGTbgpgO0LaIoOiq4TGgftn8XUaTCBf57T55msFRWhizDLUDaFX+dm5R85ENy6m9HDGsUFrC
	49f0WlNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Grz-00000003X1U-3r6u;
	Thu, 16 Oct 2025 05:49:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Grs-00000003WyM-4282
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 05:49:42 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FIpE9w004267
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 05:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2qH6VhWxn/zSPj4QiRAg7fr+LOmrENATveDxzpql1NE=; b=m81feyo6I4wy14fa
	vDxIv6S4Kx70RenBoHStBcCrCVxZKgtkxkVgGE2XCfE1MR6hsh0837OTrpJqKz8A
	LzGvenBIslaUmCOcn4HLZNKdlm5tMSVua09F34ToSZVqlqfmetiBG/gMmzvsIz87
	TXUVvRnnBH6c6bPVNRmbTVheienPYQCJhDCisdRtLioUAsw9jy7g0BJF3AGKBtTH
	NgWn3BcQWDBuVzd1ir2uVdDU0e0sV3yWMxcfBenMwdT9Lw+E+PkmBCydFNY78FOe
	UE5uYNKeaezP7Wo6FltbsQziiDVrg3zTdDFq2WEW91XoFFPDFetg20etBslbu0Ha
	2YlXRQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1akcph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 05:49:40 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so305171a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 22:49:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760593779; x=1761198579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2qH6VhWxn/zSPj4QiRAg7fr+LOmrENATveDxzpql1NE=;
        b=OZgRz9PryTjZvmfjgQU2qa40Sc3WOmmgMthl9N89Hct+AE2xKdouFEQsme7bP9qfpg
         LNKNCy1UnX8d2UzxMnfJOMhWiFGpMyTd0MvOXhTi0a92IaQ4GrBncHmwfdJhJdctzd0E
         kHIwpwqCq4aYOgwd62j+4y7AHUqTg9Ok7jKjj87+lfyrUrRkfqE2zNWLPQwSpSyqYjdl
         koEtS8XCCKtNLh2QIl/DOuFEu3qwyRucovNAiK/yNchhuz5WDwB3xP8Ov1l+UBELNrye
         UXRF6aP0e0eWzjfjIodu8C7WRzyXLzLtQ2zkd4CKge0nb8zW3LQDjltSpdD683PoXhsW
         wNpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvPrxJbVMlntVxuieXQ7qCD6z4R3sd57x57SVeAPMZ5rJ6oIeWI+mbCCOWGpuJZG79ohE7av/bl0/Wf0ADHs3F@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/r7gKzCrzU0esPpRmrU1o+e3Yn2G6U6IM6DeUGaxEhqhbnU+/
	TYcu4o3febppC80Z3N31Y2LYkFTth5xATN+hrYgle0oHwANpNTzZq4xRzIY24IneoXnum6hMcfg
	1VSSikkPPBFRIaiiIPtAUgesthCPQviyphQyPMV/BpeLFkdp1Qf1NegHArA5wlB7V6JBYLhowVW
	XYdg==
X-Gm-Gg: ASbGncvawJCDR9xjx2rxFwqpcUukZEmnA/u7wMvUQU84oRAVotd6IwxGtXxBAiNk7OF
	jW3Awv8MsmCoou5TyyttllA2s0g4SZC1GvmOJjbStufqO2QnQ8xtgAhk90qZC1bLwEQaOOIUZX1
	uDB203lTKWHjt+wPuHTmnkrC9kGiz8THgOIzD4bob+Xur6J4uK502hn6W0vwvmbTHzaJXyCtJHz
	vah5fDwN8d9KcNGQ0FsjM3uHg9Se4dA5CUNgoV3mUmPH8o55JJ2Y+ZifX5h2KBqyDmnS0oRJ+h7
	0vpVEVweXiT7rwgVB0Wmy3mlaKYOp4Afdb9+ixJZxelvWpVZRgtCimMK9GFhJI3/Ho7DY3nq9Wp
	+Zkbb5qdFgDHLCrdnrPCUoh9Wcj7B/ypgk+PZrVP7/mmV8mqcBZRT1hRp
X-Received: by 2002:a05:6a20:3956:b0:303:8207:eb56 with SMTP id adf61e73a8af0-32da8190b86mr40594280637.5.1760593779333;
        Wed, 15 Oct 2025 22:49:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmVMJqs5myDekEs1weATUcEB745Ezwf7VIYkJxL0o0kB0t9wE0sg1HPpjPEoaEhME6eIJSLw==
X-Received: by 2002:a05:6a20:3956:b0:303:8207:eb56 with SMTP id adf61e73a8af0-32da8190b86mr40594226637.5.1760593778447;
        Wed, 15 Oct 2025 22:49:38 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e1336sm20657931b3a.59.2025.10.15.22.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 22:49:37 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 22:49:31 -0700
Subject: [PATCH v5 2/3] coresight-tnoc: add platform driver to support
 Interconnect TNOC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-itnoc-v5-2-d7ca2b1cc6df@oss.qualcomm.com>
References: <20251015-itnoc-v5-0-d7ca2b1cc6df@oss.qualcomm.com>
In-Reply-To: <20251015-itnoc-v5-0-d7ca2b1cc6df@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760593774; l=6708;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=0cctjiu4mUm5N0O/l2W3akr4wwL/nWN7vsCpgeUxUnI=;
 b=4AI4jftccxMdbwejc/RS0ENJOefJ558kTnR9ih77dqJhTcw0f82HTh14/DAhJ3ugoOGpCL2Sv
 GxghJn+tSEeDovOUHcHln+pj/ikgLQ66iMLY4yzh6uYmaA0wYsin9tH
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68f08774 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=pUju2gecW9X7egxZnGUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: S6r8wUHToe4laPYXTVw7sbgcK_zCLIvt
X-Proofpoint-ORIG-GUID: S6r8wUHToe4laPYXTVw7sbgcK_zCLIvt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfX0SUvYLshPmuh
 mxRwMuiSaoBq450V5fVPOtdCP6SxBgrNkd3f2L0MRmdqSPgluEvduih/AwFaiwMxa6IC2FaT4vQ
 /lRYRK4sg7hKt6HYFDa3pZvePc/xxjXwromcaR9M4PBf3/8aUHOYi1H0vYNYSSOiS/MQ1wpC64d
 EWug9Qb8xM5wWy83drvXu4Hnfafy2XY9AW5fUAqreCJp4w3QiZVYWceeQVNawRVtVz8/fZG+7W4
 +CBEHsX+WiMb1obCPtL9OKBRRqfHYOW11QOr4U5pruqEG4w+2L3y/xvn/i38U2cC++sFhd4iW+8
 Gi0XP/meAcj/aS0vQL9Nt5pxo4yi8DFHZ7DAsERYGL5TzjyPSSwG8dgP6vdfqwME2FthQIxsJzF
 MmsukgTjZ4W51p5u6GkAcu8NSDAVqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_224941_014533_BCDF1A3F 
X-CRM114-Status: GOOD (  27.92  )
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

This patch adds platform driver support for the CoreSight Interconnect
TNOC, Interconnect TNOC is a CoreSight link that forwards trace data
from a subsystem to the Aggregator TNOC. Compared to Aggregator TNOC,
it does not have aggregation and ATID functionality.

Key changes:
- Add platform driver `coresight-itnoc` with device tree match support.
- Refactor probe logic into a common `_tnoc_probe()` function.
- Conditionally initialize ATID only for AMBA-based TNOC blocks.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Reviewed-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 113 ++++++++++++++++++++++++---
 1 file changed, 102 insertions(+), 11 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index d542df46ea39314605290311f683010337bfd4bd..5be882300d79bc0173aa6a19d7da1d48c4aaca9c 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -34,6 +34,7 @@
  * @base:      memory mapped base address for this component.
  * @dev:       device node for trace_noc_drvdata.
  * @csdev:     component vitals needed by the framework.
+ * @pclk:	APB clock if present, otherwise NULL
  * @spinlock:  serialize enable/disable operation.
  * @atid:      id for the trace packet.
  */
@@ -41,8 +42,9 @@ struct trace_noc_drvdata {
 	void __iomem		*base;
 	struct device		*dev;
 	struct coresight_device	*csdev;
+	struct clk		*pclk;
 	spinlock_t		spinlock;
-	u32			atid;
+	int			atid;
 };
 
 DEFINE_CORESIGHT_DEVLIST(trace_noc_devs, "traceNoc");
@@ -51,6 +53,12 @@ static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
 {
 	u32 val;
 
+	/* No valid ATID, simply enable the unit */
+	if (drvdata->atid == -EOPNOTSUPP) {
+		writel(TRACE_NOC_CTRL_PORTEN, drvdata->base + TRACE_NOC_CTRL);
+		return;
+	}
+
 	/* Set ATID */
 	writel_relaxed(drvdata->atid, drvdata->base + TRACE_NOC_XLD);
 
@@ -124,6 +132,11 @@ static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
 {
 	int atid;
 
+	if (!dev_is_amba(drvdata->dev)) {
+		drvdata->atid = -EOPNOTSUPP;
+		return 0;
+	}
+
 	atid = coresight_trace_id_get_system_id();
 	if (atid < 0)
 		return atid;
@@ -149,8 +162,21 @@ static struct attribute *coresight_tnoc_attrs[] = {
 	NULL,
 };
 
+static umode_t trace_id_is_visible(struct kobject *kobj,
+				   struct attribute *attr, int idx)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	if (attr == &dev_attr_traceid.attr && drvdata->atid < 0)
+		return 0;
+
+	return attr->mode;
+}
+
 static const struct attribute_group coresight_tnoc_group = {
 	.attrs = coresight_tnoc_attrs,
+	.is_visible = trace_id_is_visible,
 };
 
 static const struct attribute_group *coresight_tnoc_groups[] = {
@@ -158,9 +184,8 @@ static const struct attribute_group *coresight_tnoc_groups[] = {
 	NULL,
 };
 
-static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
+static int _tnoc_probe(struct device *dev, struct resource *res)
 {
-	struct device *dev = &adev->dev;
 	struct coresight_platform_data *pdata;
 	struct trace_noc_drvdata *drvdata;
 	struct coresight_desc desc = { 0 };
@@ -173,16 +198,20 @@ static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
 	pdata = coresight_get_platform_data(dev);
 	if (IS_ERR(pdata))
 		return PTR_ERR(pdata);
-	adev->dev.platform_data = pdata;
+	dev->platform_data = pdata;
 
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
 	if (!drvdata)
 		return -ENOMEM;
 
-	drvdata->dev = &adev->dev;
+	drvdata->dev = dev;
 	dev_set_drvdata(dev, drvdata);
 
-	drvdata->base = devm_ioremap_resource(dev, &adev->res);
+	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, NULL);
+	if (ret)
+		return ret;
+
+	drvdata->base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(drvdata->base))
 		return PTR_ERR(drvdata->base);
 
@@ -195,20 +224,31 @@ static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
 	desc.ops = &trace_noc_cs_ops;
 	desc.type = CORESIGHT_DEV_TYPE_LINK;
 	desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_MERG;
-	desc.pdata = adev->dev.platform_data;
-	desc.dev = &adev->dev;
+	desc.pdata = pdata;
+	desc.dev = dev;
 	desc.access = CSDEV_ACCESS_IOMEM(drvdata->base);
 	desc.groups = coresight_tnoc_groups;
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev)) {
-		coresight_trace_id_put_system_id(drvdata->atid);
+		if (drvdata->atid > 0)
+			coresight_trace_id_put_system_id(drvdata->atid);
 		return PTR_ERR(drvdata->csdev);
 	}
-	pm_runtime_put(&adev->dev);
 
 	return 0;
 }
 
+static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
+{
+	int ret;
+
+	ret = _tnoc_probe(&adev->dev, &adev->res);
+	if (!ret)
+		pm_runtime_put(&adev->dev);
+
+	return ret;
+}
+
 static void trace_noc_remove(struct amba_device *adev)
 {
 	struct trace_noc_drvdata *drvdata = dev_get_drvdata(&adev->dev);
@@ -236,7 +276,58 @@ static struct amba_driver trace_noc_driver = {
 	.id_table	= trace_noc_ids,
 };
 
-module_amba_driver(trace_noc_driver);
+static int itnoc_probe(struct platform_device *pdev)
+{
+	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	int ret;
+
+	pm_runtime_get_noresume(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+
+	ret = _tnoc_probe(&pdev->dev, res);
+	pm_runtime_put(&pdev->dev);
+	if (ret)
+		pm_runtime_disable(&pdev->dev);
+
+	return ret;
+}
+
+static void itnoc_remove(struct platform_device *pdev)
+{
+	struct trace_noc_drvdata *drvdata = platform_get_drvdata(pdev);
+
+	coresight_unregister(drvdata->csdev);
+	pm_runtime_disable(&pdev->dev);
+}
+
+static const struct of_device_id itnoc_of_match[] = {
+	{ .compatible = "qcom,coresight-itnoc" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, itnoc_of_match);
+
+static struct platform_driver itnoc_driver = {
+	.probe = itnoc_probe,
+	.remove = itnoc_remove,
+	.driver = {
+		.name = "coresight-itnoc",
+		.of_match_table = itnoc_of_match,
+		.suppress_bind_attrs = true,
+	},
+};
+
+static int __init tnoc_init(void)
+{
+	return coresight_init_driver("tnoc", &trace_noc_driver, &itnoc_driver, THIS_MODULE);
+}
+
+static void __exit tnoc_exit(void)
+{
+	coresight_remove_driver(&trace_noc_driver, &itnoc_driver);
+}
+module_init(tnoc_init);
+module_exit(tnoc_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Trace NOC driver");

-- 
2.34.1


