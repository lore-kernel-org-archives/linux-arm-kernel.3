Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA3BCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 12:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cImJsAweHgFKioboFNl2oSzG/5IDjBZZwddm+qkdJKQ=; b=DKXxQYMPweD76ruuDGRTPBgKHz
	TfmiRgsYJEcSp7CrEqaqNDOn5Bb2tYG9XCqiyr1AIkWuH6bdmemU3z5V/2BhEA1oBuxqI16BvVA/K
	FMFMX6fQmoFoOnv/5tE0SYXzBm7vz39+Bs/Uzf6j6Nc8khS7TYZMMgt96G+2p/qvy64Zvosl+eD+b
	OILfNiIHq+jLcUiyJmkDzgsBUKeMClGmoYdQGyRCxacIqM1AclcpstgbhxqdoXrHYzIaIcfrEs3EA
	gaDaqTIl2dddRGbY/TEaoLRM+qhJPdhMJbQNCbWhoYqQRCw2wJZgUmg5sAWn/ULjGfKS6itlFQOCe
	XPLCc16Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoLQ0-0000000AQgu-0M6M;
	Tue, 19 Aug 2025 12:26:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoJZN-0000000A7xR-0hQM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 10:27:58 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90YiQ021768
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 10:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cImJsAweHgFKioboFNl2oSzG/5IDjBZZwddm+qkdJKQ=; b=YssduXWzAuALRbLC
	WNing4pNcgkCNJIxh1kbSVqMUccako0b3Cj9gOHmeXLrd9g/88BdGdbOBN1Cmkn+
	xLs3u2uxbHCTwIQLWUrytmL4jWus7bcQi8ROVv7uIxRR1jjeZF9lNdSS5WO1K2nG
	Islk9TiLYy/wAZIG9IRNZMqFNVW3+9YigVg0XDyGbPDiI/kGjEJaF0wfNWPGZYLb
	VsbCcLz1MJu2JYga+uqzctvYR9ya858Gd4QzeV0i3A3pEdzaj1wcOMdLG1cVETHH
	0htPJBUx5V8HwLaicUHpvMel9NZ1X8DXGqOMCUJXkvhZCFMKEUSkuGaUiFVAvdws
	u298tA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48m71cjvrm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 10:27:56 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b4750376ca8so914002a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 03:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755599276; x=1756204076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cImJsAweHgFKioboFNl2oSzG/5IDjBZZwddm+qkdJKQ=;
        b=GHH+IIsnQDgda4SpImVyByY6i5dB4YZSIRjp8oaPtMDyI1r2Nq9ejFSjp6Q+zcHjc/
         Dab0UBJGoTX9Y3YmVmhyqnhWC6foxLO7R5ePMkjHbdp6vnssqkKQQtlDQ9D6ZKt69w/8
         acre39y7/6915HI9w0ZcGIfLel2pzn+din2QsBCKfNesK690vwIoj2sUoSmQFLWhvD5x
         tqgAOBnSIpEnfUcsLAkcW+YUYnHhZhguGvD5cfw9j1CvodmofGQkAyxkRlLpPwM1o+Zm
         5AEZ5uRruEOSQJpN21ToYMl6GJ3UAjr6l0thH3PLjxdS3cePChX6e2dtWpaqp7JWyjPJ
         yoOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrTB+u5zJqm1mKrmOvrqcoYx51+zMOhqTC7tauIKljgFE+c4CTFHnQZXMbTPAGLqSe/M/JKFh1hzg26+RRpJFl@lists.infradead.org
X-Gm-Message-State: AOJu0YwPwy0+Fr1qL5W4yzZhYcDbGdsiFO6XDvN1tXzmveHNa8/EruXH
	TgTIA4JwLafr3NxlbUogHX3xJt2UCGuDMsQkD5+knIstchMS1zRwHSCHn2Up2gqY4XEuutqzql9
	avRTJTDRkEUWSMP/ll26bIjURGov9bxTeTH6nostRJ659gHaccceHnGdH9kJ3DVP7G48viW1Kd4
	QPtQ==
X-Gm-Gg: ASbGnct5wJB13Fd/mS7YXVgorg/LJ3Gfp4PNZk5EsbevwONTjxOiBCSxkOHbQWMc9zb
	HyCDoB1QCXNiPmwJUAZ8bcls8Ndykxd43V3gIVXWKXXUVjcrrRx8VVtY4tGkfWb6fXrQykY3dPn
	fS/nLT9eyp2rect4kBiG5qgfYSNZt7q/KgvHsEe54y3YLYDL6Cs39HfOyTFhGT0Jh5jlLEPbK8A
	IgsCS7kySUf345IROjfqH2ccs3jcoww+GD336chR7/3kLhuG7TdUftbzRoLQTBvraQxjTU/a7tm
	mv7T8TfWXhFF5sr91fupDT7WVTT47Y8tPW8qzcfo8B2XTu4HohN1bbddBs1IgS1TLw2eXWyzxgK
	TXlkY3rdTSJ2cwUQYzVRegw==
X-Received: by 2002:a05:6a20:3d07:b0:23e:19fd:e18f with SMTP id adf61e73a8af0-2430d42de0fmr2739841637.35.1755599275482;
        Tue, 19 Aug 2025 03:27:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6GGIZhxrnmD9roD8ShgJeEsO3lov+BMPjiKwTc0CsQQuDH53U0AS/ChsScRIhHH/GKUGPgA==
X-Received: by 2002:a05:6a20:3d07:b0:23e:19fd:e18f with SMTP id adf61e73a8af0-2430d42de0fmr2739808637.35.1755599274967;
        Tue, 19 Aug 2025 03:27:54 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3237e3eef8fsm2499643a91.18.2025.08.19.03.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 03:27:54 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 03:27:44 -0700
Subject: [PATCH v2 2/3] coresight-tnoc: add platform driver to support
 Interconnect TNOC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-itnoc-v2-2-2d0e6be44e2f@oss.qualcomm.com>
References: <20250819-itnoc-v2-0-2d0e6be44e2f@oss.qualcomm.com>
In-Reply-To: <20250819-itnoc-v2-0-2d0e6be44e2f@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755599271; l=7467;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=XO9D6AwhUNAnacAZyuMr3vcbzQlze7wwXSgBjm1UkaA=;
 b=ZlUiRoSRBBukIvPcZLBxJbhHLQf6Cy8WzWkVJGbcJBK/MhJvZpBxH4ihhyf9kUzrx3zgA7Nj/
 NV/v1ngkFWWApBZBipPi8XEIi33vZmbmYYirK25LZdBVXVv4eJQZjU0
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-ORIG-GUID: UCcmV35i5V-CBaM7PnuaH2h4Z8S_7ESH
X-Proofpoint-GUID: UCcmV35i5V-CBaM7PnuaH2h4Z8S_7ESH
X-Authority-Analysis: v=2.4 cv=IvQecK/g c=1 sm=1 tr=0 ts=68a451ac cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=vZzgk5nmo-DiXalhxAsA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDE0NyBTYWx0ZWRfX3m3uu3rp/KnH
 Ay2FspJJMkCcwtcUBMS6lbxW7J+tdvKW4rhI2zf3QHs2nJ+s8Z/alcT2UMUm4XYw5W02DVYXC49
 dZIegFks0GA0sIeR5EnWvkW+hnSA3Rl142YlKbmJ2Z+pZehGdsInJz253PHjsCn8lCL/48VJy7r
 WqS/NcvsVZtu29n/yCOYw9ovoSTeeNsy6py/b9tqxeOwTMLRRp2KUkF0y97AKAzvBa7Wdldq8uE
 d26a5KRGSAybI2GTfx8SlQrxScpF/buVLdhb2Gu/b9eF0c5bdT6Dzntfgd/2a7S/hxOhKtriswB
 8BXIM92JjymkXOtarqqiTv4kzfHQL87sdrcXqYByrezML/BWqIg/E+Rp2Hza5NcBO7GGZZCeP3D
 qpgaJKbV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508180147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_032757_225127_EF6F79D7 
X-CRM114-Status: GOOD (  29.52  )
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
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 124 +++++++++++++++++++++++----
 1 file changed, 107 insertions(+), 17 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index d542df46ea39314605290311f683010337bfd4bd..407595e893096d8011dfcefd74cca742d9b96695 100644
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
@@ -51,25 +53,30 @@ static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
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
 
 	/* Set the data word count between 'SYNC' packets */
 	writel_relaxed(TRACE_NOC_SYNC_INTERVAL, drvdata->base + TRACE_NOC_SYNCR);
-
 	/* Set the Control register:
-	 * - Set the FLAG packets to 'FLAG' packets
-	 * - Set the FREQ packets to 'FREQ_TS' packets
-	 * - Enable generation of output ATB traffic
-	 */
+		* - Set the FLAG packets to 'FLAG' packets
+		* - Set the FREQ packets to 'FREQ_TS' packets
+		* - Enable generation of output ATB traffic
+		*/
 
 	val = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
 
 	val &= ~TRACE_NOC_CTRL_FLAGTYPE;
 	val |= TRACE_NOC_CTRL_FREQTYPE;
 	val |= TRACE_NOC_CTRL_PORTEN;
-
 	writel(val, drvdata->base + TRACE_NOC_CTRL);
+
 }
 
 static int trace_noc_enable(struct coresight_device *csdev, struct coresight_connection *inport,
@@ -124,6 +131,11 @@ static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
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
@@ -149,8 +161,21 @@ static struct attribute *coresight_tnoc_attrs[] = {
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
@@ -158,9 +183,8 @@ static const struct attribute_group *coresight_tnoc_groups[] = {
 	NULL,
 };
 
-static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
+static int _tnoc_probe(struct device *dev, struct resource *res)
 {
-	struct device *dev = &adev->dev;
 	struct coresight_platform_data *pdata;
 	struct trace_noc_drvdata *drvdata;
 	struct coresight_desc desc = { 0 };
@@ -173,16 +197,20 @@ static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
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
 
@@ -195,20 +223,31 @@ static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
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
@@ -236,7 +275,58 @@ static struct amba_driver trace_noc_driver = {
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


