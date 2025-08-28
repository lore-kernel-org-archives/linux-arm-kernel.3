Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DB0CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 10:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wKIdXBVxutyc8Yt4qrD8SDHqVrhzt82FltAq6xGnVQ0=; b=RDdhhG/70iNMBDtEaRPQuspZU4
	28FhD2XlFY0AtQ4SLAirh4EfuwTVjB/96DSioH0gzUiMVsB3Ko9MbzbgA1BBjvGRDtgODXRzj9Q70
	1Rgp/ehRcafLpbeiaZns9YPykEHArtoJUTg3qu9dqZ38e6zT/GyQDSIESzGtYKPpshwKvCa2vwyG/
	oKk4NI55WcavlCl5gIaIf3HEekobfBtdqPbCDZQ8EWcJ+LcMECs4FS6dSJ5nOclewN4tNBqNam1hr
	wINgJ2eQ72HyyJhOTj2rXQ14xzxw4kdkkXCH94WmDSPOiUg4oFRkQuHoO5k6Ro2qUcTcgYE8N1XjG
	2w3Dks8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZnG-000000018PZ-07cv;
	Thu, 28 Aug 2025 10:23:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urYup-00000000xkZ-07wI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 09:27:32 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S6ixTG031064
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 09:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wKIdXBVxutyc8Yt4qrD8SDHqVrhzt82FltAq6xGnVQ0=; b=cqPaEDs3JrHzjMkU
	S6HU1E20b4XpzBlBTHrY+mEBv4YUG0NqhHeEhOYzxxCmYC1qo7LsDH1Gc07iAEws
	z/rrgIuzz7FXeMM9Le8+vE04S7iKXnINpVG+zwvJV6+JhFwonMG5zpIL2Z8X6H7E
	19LojccQOcLSYviTshB+fEaZaoSFmVtXQ3wLd2iPQoewNi/QCfmqsnLaa9f/MqLX
	9MDxEsWunOqbjNlLC+vcw3bcOqEh9y3fQO367n2qFZumXFqNuwS8MBJwupwLh9hj
	aUGqg/ndzHbdEMJpfpecIvCKlbalbXWzrYd2/vcMxvhj8IRWYE4Fb9B9enS4BCrO
	lKRV2w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xpyw2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 09:27:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24457ef983fso16264555ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 02:27:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756373249; x=1756978049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wKIdXBVxutyc8Yt4qrD8SDHqVrhzt82FltAq6xGnVQ0=;
        b=tg7hS8iZrzQmh7cL45n0w9qNym6ko76xtBI7miMXb5nOs4c7pIdtGL9+nuAb4EcCfb
         sBEPR2SvXFw3TWCdoxXWRqy0hzXjWaNy82h0JKyUiRAKXOZZMK+P/DxmAOzvtvypi/yz
         R0fNG7S3O1Qfa9mRKt3LWeDmBGXweIXJqVYNi8AXywvNW3ubh0yPm+PqIFvnb7Ari91n
         /i77h7m9sUYBD98XabnnxTiwoCxanthbiHm6km+C2jED4dsymwWoya+ZbNTQ9NLQU0ZG
         08I2FRF810FbjKYlGeAQdViKaYHaS+7qNKPZ24X8PqBKrQltaVAy63iwQrH+KSWiLC3M
         M58w==
X-Forwarded-Encrypted: i=1; AJvYcCXQ2AeOV93JK17E/n1/A0aNDpKfIFw3gChYKzepBqIzaCwuH4D33iQCxS8rUBloRaltq0HZTyFeTYpoAYMB3eAx@lists.infradead.org
X-Gm-Message-State: AOJu0YwW7lNFx4qMs9iGdKJoh3epI1cJxhhGO24+yhcFfc4f1vJSth3i
	dWmeA7yllhAo2FQTQpZXHTBPX3F/y3kriSYDhFn+XthZ104RhlkygGC7dTlnTkuzBxboSaD4fLM
	QgBYaORmOWVhnGyV6gKpyMA7QCsL061m2Et/SuVXLyiyGkNsNJC1GUv0GXxGmsEiioBaCZsVkNw
	WvTw==
X-Gm-Gg: ASbGncu8sQFDghbS+cRLzYwMqcjWQazYGOn9PlqW0/xZPgtG0ViJDDgSXHw/RfcnhnK
	Cq5wtikwSa+B5Gh46F3YUkvyRUqmON5sgURj/y9Lg4671/xhDvqCfjc8BBVtM03xXc23W70gAGB
	98Jhl55SyfBNbbTY3QmfBevLRgvgzPPI7e/YmG0bKEZFeLYzoXHL4dPI6S2mVuXu73Rwaa5XRhZ
	VUsdjuBxxAuRGgpgVGoxaw9H4WWYgo3FeqzxO0R1qVPKVbhBQpMHbV/xf3mpJIDXTLXA6Ddt+EX
	5NJnR8yHuZfw1EijHr0CwgT7x8KrVldHfCMS6NrLxLy7I9/tdlR1y0JUAaqQN8NscEkiwsQnguV
	DQPiY6dKL/Ljxg4d5alSV0g==
X-Received: by 2002:a17:903:943:b0:234:b743:c7a4 with SMTP id d9443c01a7336-2462eeb75edmr278218605ad.38.1756373249437;
        Thu, 28 Aug 2025 02:27:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8bhrS/FHtm9K9UqNFSs1oYSrwJND1nV5qQFHIBImBkF0Oz12krvGLgAxPoglax5tDS/693g==
X-Received: by 2002:a17:903:943:b0:234:b743:c7a4 with SMTP id d9443c01a7336-2462eeb75edmr278218465ad.38.1756373248954;
        Thu, 28 Aug 2025 02:27:28 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246ed91ee20sm92497015ad.136.2025.08.28.02.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 02:27:28 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 02:27:23 -0700
Subject: [PATCH v3 2/3] coresight-tnoc: add platform driver to support
 Interconnect TNOC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-itnoc-v3-2-f1b55dea7a27@oss.qualcomm.com>
References: <20250828-itnoc-v3-0-f1b55dea7a27@oss.qualcomm.com>
In-Reply-To: <20250828-itnoc-v3-0-f1b55dea7a27@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756373245; l=7284;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=Z1eZnevWYnpyIWyKbJ9mcPze0cP6MZDj2l5bPS/eoB8=;
 b=nAWlBA6HM/gtRZPVJfqqW6BAai6jca5mXaH+6xDBN0pEgZT/mWyyMrmD1X74QIykxkiSoeO4b
 6NLb6TAq4fkBvCmg8WgK4KpBzdjqQFLGLen0v53MUOx6H/VABzcfQnB
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Authority-Analysis: v=2.4 cv=KOlaDEFo c=1 sm=1 tr=0 ts=68b02102 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=YgsqhSH9U0MoioIrZkcA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: qBwoomwyzo1YDb6p4mUWThgQpX1QRV6t
X-Proofpoint-ORIG-GUID: qBwoomwyzo1YDb6p4mUWThgQpX1QRV6t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX0zWaqxAP6jAY
 +EltburncGi+Ll1c/URTbTvKtwehgRkL+H7aMp3jJtOm0Ab1VMLchDjdoHn0utRLCMjz1/onBCb
 3gDI1fqW5e2kURSAOl72wIeCKeBOFoQC3PLEg2wEhQtT09FAtt2DxFR7+Xc5/UHq8lC9LWmh2MJ
 rF0ACD4eub7b15R2wBVTugqjeL6JeofUBwVtw7L2BJpTG47sAiOkq9pB9WGtknJh6HGpoYT1SYj
 MHac8albBvRbPH33KlrEhKG1QGmaaFt96ThLPxoPe+jtoFsDJemBGopekq/EzB69Eafv3037tLC
 ULfUDE5nYzu6eGEi9kkTU6S8BWQmrqNUJ+S8Y86llpsZ9U325+P9Jb/iFx+zc/ZAPbzcug1XNlD
 bYHAfPvv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_022731_084660_1A8980B3 
X-CRM114-Status: GOOD (  28.78  )
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
 drivers/hwtracing/coresight/coresight-tnoc.c | 116 ++++++++++++++++++++++++---
 1 file changed, 103 insertions(+), 13 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index d542df46ea39314605290311f683010337bfd4bd..ca96c3e66d683d6c1d1215b1b48d2f7b7f58d5b0 100644
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
@@ -51,12 +53,17 @@ static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
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
 	 * - Set the FLAG packets to 'FLAG' packets
 	 * - Set the FREQ packets to 'FREQ_TS' packets
@@ -68,8 +75,8 @@ static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
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


