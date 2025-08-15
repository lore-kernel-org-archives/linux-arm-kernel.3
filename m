Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DEBCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 15:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P+1xR4+o01om//MpBsIgArjxaTmVwUJRAsyjVTpgj+Q=; b=vFovIZZU3/XEsRIwvTJztHnJvA
	Yf8HkMooLgeQ3GmY8TbLHO54x31qrZmN4vz5tuQHotpgSLxzzmXrwDeQa906Cbjkg2UiwzO0+H2jx
	GCSMBU0wj7qx0TDL2m8Hp2CAnURqUrZDbpJ4fVbCcgYyevSKgclWWIIRedQtSIh4XuULhkRJT6Qul
	fr48PiHt5gi7BOHgY8VQx3jiUzGkXqX/9fBLTLyu90rFEK6lAEoHS6KH+ZMWYQjQCdJIzdTRahvVW
	pbZvZd7rliTaZFmSBtW/sbEQGH1MElD/TBcN24OyXYEnA+eCuP3kBFSUYMdpg9AU6m8uzWgZdu3vi
	zn5xVtPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umwir-00000002t99-0xst;
	Fri, 15 Aug 2025 15:52:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umuKG-00000002ZQ5-1GKD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 13:18:33 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57F9liI4016780
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 13:18:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P+1xR4+o01om//MpBsIgArjxaTmVwUJRAsyjVTpgj+Q=; b=G1gtG4h2YC2I6wcw
	Xo/gDgyQXtASW21p+ds4xvg9/hJ2pXOzvkpvZZcdQ23SZa9RE2wBG7R3X/zGve1A
	78DZQdWBqWwDIlyTXtmvSmmaefc9BnAUXzrm5T66xLgG4lqSbSvs82oDoGwyh5vB
	BMjAJhCbKjAzLI9Q/xoIavzb15WqdGZwCFBopa4vvuo39cfqm9QfhMJpcU+ED9hx
	nd6w2cGJJoX/WeUW51ugPVRlaRZz6xSvxdci1bftGpuwZKpLvtuNVgj6WKLjQXae
	cI9eAcE+f5xR7uGsQEsh4goMorZHlVSJdTsWbiZeZpaL+ififf06km8fQgnfKFYU
	/183DQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g9qa263u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 13:18:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24458027f67so39043965ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 06:18:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755263911; x=1755868711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P+1xR4+o01om//MpBsIgArjxaTmVwUJRAsyjVTpgj+Q=;
        b=E0VRz3gR3xDrNR5fR+vqT1Uxo1iC7rroFaWy756FO2BzG9w1XHo7xwddC21PnoXI74
         87/cv3bhcQu7/7jsZDCVdgS25jRdttrocIyyQkx4vXf0/4HLnhx9g48PXp2qoaKq0QaS
         gOrCVJqNazDrCyUp6wBvWCnfbp49IEQpuW23dJmYdYcIX/6x91tctkWvHkU2Xp6ZRLRD
         fBkpO56ig8JmULp5yjhvuqdOYSn2vb/l3T8HtcuoYo6iqg7DjGkdOB0QyuwW7ELuYb0R
         LfW7pLjtOMhnEWXJ3aoJMcsYMRU/xf/lKw2oRDjv0cLto4KcsPWlT/zjomyDnVV8nwBs
         OXIA==
X-Forwarded-Encrypted: i=1; AJvYcCU2u5nSh2+KjUj+n7B2oD65D4l6NKSeUiCdjEce2nik5VfW7uMtLw3tcq1ibMBeRhmC5rBZoDt8pO9WkdxVSVpV@lists.infradead.org
X-Gm-Message-State: AOJu0Yxki5I9kUiSLfDLTPxU9TRbwzDv8EiJEMd+AZ/AAEafkkgCrQIF
	7Jp/kJrkF/2KVjXgJNwB0YFewnkexedUJeflpb4yw9xVoZ+srf41t74lfamFNMCxS0ABGL0kr6t
	lfdhX5YLDUb9MkgEv6J24Mgahh8M5PjJUIHIYlD6GfaOFQCjhQsW82ltv8LN1Ucbgjk+z3pI+qm
	kOmg==
X-Gm-Gg: ASbGncuDGMzYGyji69gcaAop2SJ9UWOge/MQzsZKE5m2jDvUdYl3aQhsmqocGMzKQD1
	gt9DXN+BL24RxqjQEHdI7oqOtrlRxXUTPGKLr2ULTCkBMiF/vZZq4nB/llzoCyMUS4KxYB2twBX
	IqASxwEyp6xnGkPwANr8n4aSJAHimr2rs9N9Yh9uIb7m5U/egzSNgU8HAX9sQon3XFXvURXDpkp
	jBFCT38srgNahKJeaFS45IIm5A5xIfTsY8+cx7FzXGEFGuuzcmYNZ6KKQncP9ICrTL7Y1gSwf8s
	vZIdGsANorRCo/jWuA4/V2Qf1WEYv374p2mZTk3fuaE98HsR9QkP/JCKmQDGLedf1kbfaCUteF0
	8KaY3k4I/HENOU2xNiKuI4w==
X-Received: by 2002:a17:903:b07:b0:234:f580:9ed with SMTP id d9443c01a7336-2446d713eb7mr24836285ad.21.1755263910749;
        Fri, 15 Aug 2025 06:18:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcH7yvzGJchx+kvT15d5YUpCxm84lyr0HWzPwSrVOLgR0FHjLigyUlx+TqREmE1ZxD1F5/+g==
X-Received: by 2002:a17:903:b07:b0:234:f580:9ed with SMTP id d9443c01a7336-2446d713eb7mr24835925ad.21.1755263910295;
        Fri, 15 Aug 2025 06:18:30 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d7944e6sm1256386a12.54.2025.08.15.06.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 06:18:30 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 06:18:13 -0700
Subject: [PATCH 2/3] coresight-tnoc: add platform driver to support
 Interconnect TNOC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-itnoc-v1-2-62c8e4f7ad32@oss.qualcomm.com>
References: <20250815-itnoc-v1-0-62c8e4f7ad32@oss.qualcomm.com>
In-Reply-To: <20250815-itnoc-v1-0-62c8e4f7ad32@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755263906; l=7610;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=h3BCc5LPt2vD2oa0GKj6H4bBZnHTi5frgwQGvlfz1zI=;
 b=L6M1QO3uxWCvsmlpAc7nM/HnmxBagv9W0cZsbsZBPJCSwwVXLss7mP6acRlSf2VThYC6pSqcJ
 gVp+CKtKrozD0olcJbQAsOrXzL3YxGhzVLZgKtZTe2IaW3IUWK+D6UH
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Authority-Analysis: v=2.4 cv=CNMqXQrD c=1 sm=1 tr=0 ts=689f33a7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=CwSfzSRg63tsHDaJLfgA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: Of0d-SDiVWUDGjhZ5fiwO-l3BkJfexgL
X-Proofpoint-ORIG-GUID: Of0d-SDiVWUDGjhZ5fiwO-l3BkJfexgL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE2NCBTYWx0ZWRfX+71gtZvGKPtX
 wQigAUjjeyrkvXaaO5kAD/o541YTSe6H5wEzFOAzCEuM3GHLv/jUniKQcWdjXpP/7891bMKhbPS
 K4aq98Wq3WtYDM84dwv7P9tqlui7TU8+wDGkMs7k4Xc0mMk0K9dv4EEzjQdpysdGdralhMkmtl9
 qRWmMV+geCZouG/8K4C65Tp4eVYhU2EQcf6Npljhus/Y51AD5ZarIdgVDGSsbb9aJMCSlwod5H1
 ZFlYW6Eh/Xqu0JZeAQq5pVeG6hBKPSkdFJlbZmBc1cX64liueerzTlZvsderBcR/hSxsq0N1uA8
 I8VhA/u0GYIT1FMd5hBVNeEnxVCQseia6h+T8G8p7iZtvVLuDi8V5CrD7nB4QYEHSwmk8IzsypQ
 LqeJgpoM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_061832_364456_AE7CBF16 
X-CRM114-Status: GOOD (  28.67  )
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
 drivers/hwtracing/coresight/coresight-tnoc.c | 153 +++++++++++++++++++--------
 1 file changed, 106 insertions(+), 47 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index d542df46ea39314605290311f683010337bfd4bd..aa6f48d838c00d71eff22c18e34e00b93755fd82 100644
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
@@ -41,6 +42,7 @@ struct trace_noc_drvdata {
 	void __iomem		*base;
 	struct device		*dev;
 	struct coresight_device	*csdev;
+	struct clk		*pclk;
 	spinlock_t		spinlock;
 	u32			atid;
 };
@@ -51,25 +53,27 @@ static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
 {
 	u32 val;
 
-	/* Set ATID */
-	writel_relaxed(drvdata->atid, drvdata->base + TRACE_NOC_XLD);
-
-	/* Set the data word count between 'SYNC' packets */
-	writel_relaxed(TRACE_NOC_SYNC_INTERVAL, drvdata->base + TRACE_NOC_SYNCR);
-
-	/* Set the Control register:
-	 * - Set the FLAG packets to 'FLAG' packets
-	 * - Set the FREQ packets to 'FREQ_TS' packets
-	 * - Enable generation of output ATB traffic
-	 */
-
-	val = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
-
-	val &= ~TRACE_NOC_CTRL_FLAGTYPE;
-	val |= TRACE_NOC_CTRL_FREQTYPE;
-	val |= TRACE_NOC_CTRL_PORTEN;
-
-	writel(val, drvdata->base + TRACE_NOC_CTRL);
+	if (drvdata->atid) {
+		/* Set ATID */
+		writel_relaxed(drvdata->atid, drvdata->base + TRACE_NOC_XLD);
+
+		/* Set the data word count between 'SYNC' packets */
+		writel_relaxed(TRACE_NOC_SYNC_INTERVAL, drvdata->base + TRACE_NOC_SYNCR);
+		/* Set the Control register:
+		 * - Set the FLAG packets to 'FLAG' packets
+		 * - Set the FREQ packets to 'FREQ_TS' packets
+		 * - Enable generation of output ATB traffic
+		 */
+
+		val = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
+
+		val &= ~TRACE_NOC_CTRL_FLAGTYPE;
+		val |= TRACE_NOC_CTRL_FREQTYPE;
+		val |= TRACE_NOC_CTRL_PORTEN;
+		writel(val, drvdata->base + TRACE_NOC_CTRL);
+	} else {
+		writel(0x1, drvdata->base + TRACE_NOC_CTRL);
+	}
 }
 
 static int trace_noc_enable(struct coresight_device *csdev, struct coresight_connection *inport,
@@ -120,19 +124,6 @@ static const struct coresight_ops trace_noc_cs_ops = {
 	.link_ops	= &trace_noc_link_ops,
 };
 
-static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
-{
-	int atid;
-
-	atid = coresight_trace_id_get_system_id();
-	if (atid < 0)
-		return atid;
-
-	drvdata->atid = atid;
-
-	return 0;
-}
-
 static ssize_t traceid_show(struct device *dev,
 			    struct device_attribute *attr, char *buf)
 {
@@ -158,13 +149,12 @@ static const struct attribute_group *coresight_tnoc_groups[] = {
 	NULL,
 };
 
-static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
+static int _tnoc_probe(struct device *dev, struct resource *res, bool has_id)
 {
-	struct device *dev = &adev->dev;
 	struct coresight_platform_data *pdata;
 	struct trace_noc_drvdata *drvdata;
 	struct coresight_desc desc = { 0 };
-	int ret;
+	int ret, atid = 0;
 
 	desc.name = coresight_alloc_device_name(&trace_noc_devs, dev);
 	if (!desc.name)
@@ -173,42 +163,61 @@ static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
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
 
 	spin_lock_init(&drvdata->spinlock);
 
-	ret = trace_noc_init_default_data(drvdata);
-	if (ret)
-		return ret;
+	if (has_id) {
+		atid = coresight_trace_id_get_system_id();
+		if (atid < 0)
+			return atid;
+	}
+
+	drvdata->atid = atid;
 
 	desc.ops = &trace_noc_cs_ops;
 	desc.type = CORESIGHT_DEV_TYPE_LINK;
 	desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_MERG;
-	desc.pdata = adev->dev.platform_data;
-	desc.dev = &adev->dev;
+	desc.pdata = pdata;
+	desc.dev = dev;
 	desc.access = CSDEV_ACCESS_IOMEM(drvdata->base);
-	desc.groups = coresight_tnoc_groups;
+	if (has_id)
+		desc.groups = coresight_tnoc_groups;
 	drvdata->csdev = coresight_register(&desc);
-	if (IS_ERR(drvdata->csdev)) {
+	if (IS_ERR(drvdata->csdev) && has_id) {
 		coresight_trace_id_put_system_id(drvdata->atid);
 		return PTR_ERR(drvdata->csdev);
 	}
-	pm_runtime_put(&adev->dev);
 
 	return 0;
 }
 
+static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
+{
+	int ret;
+
+	ret = _tnoc_probe(&adev->dev, &adev->res, true);
+	if (!ret)
+		pm_runtime_put(&adev->dev);
+
+	return ret;
+}
+
 static void trace_noc_remove(struct amba_device *adev)
 {
 	struct trace_noc_drvdata *drvdata = dev_get_drvdata(&adev->dev);
@@ -236,7 +245,57 @@ static struct amba_driver trace_noc_driver = {
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
+	ret = _tnoc_probe(&pdev->dev, res, false);
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


