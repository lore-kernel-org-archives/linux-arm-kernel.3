Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798C5C19777
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 13:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zhAy6jIyWdvXyOoqQdLrI9lIZr3yAaWgV+daihzgUeo=; b=1k2T+ra8QoS8VFGsipnAeeJSAn
	xCBZ76yy5632/0jYQPH14KOavttUwYQbhCmB789Ix3GAi+RCkPm4QlRl24zFeZRmAMcz2iorJuny9
	w6zK6nfeWcsw8zIp3oaTJJlqptPn5Adv4diUKHJ1bqJr3z12SXgoK5vqqBlS935vjUR/ZDFvRLEru
	aE7UqKwwq57bHjC546s9AxXIxPOI6qMSrmCQDxj237c8bbARBaAeeJzFVy0Asm6u8CryOgEykwqDf
	BCcLS1IQgU8USKc3WSjaZPBWDLRzLgD5YSdBvMCyppdfJEazjKQb0ZbbEmsPX82TTs9CqXk4PkOfm
	z6xEG/Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHP8-00000003pY4-3eib;
	Wed, 26 Feb 2025 13:24:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnFFK-00000003QAK-47l3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 11:06:36 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QA2kGQ015804;
	Wed, 26 Feb 2025 11:06:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zhAy6jIyWdvXyOoqQdLrI9lIZr3yAaWgV+daihzgUeo=; b=SvfS5qnfxJF2oZzy
	xzq1wTE1h2WEKAhRf7aTC5dJmR9oCcj3vU4i0iAUOK917ZFiTo0jILbxuQGPHFVN
	qxkRDoFFHDXiWbsJSCk7qLVYtvM+hmMZfKN7dAPczNkBaJ+8yX3BCAEt9UJYpUGC
	Z368BZ+KsTfuAtiVwTwwX2nvEwYFnqUlwxs8oYyOOhxpiihVYxjrG3PxOlc/7dxA
	dd+QxY5pSoyuuZ5wpsI4qHh8R2uIjnbhpndtga5g1OFd4pD67Sm8twNWm3GieVaV
	cwPZh1eFBKCZ/d2pWqotIMbwcLo7Vqkw6kJ62ORTLHCgVtx+hCvFpDo3AtL9zpl1
	zMrO0A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prnhq80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 11:06:28 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51QB6RQM012987
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 11:06:27 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 26 Feb 2025 03:06:20 -0800
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Date: Wed, 26 Feb 2025 19:05:51 +0800
Subject: [PATCH v2 2/5] coresight: add coresight Trace NOC driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250226-trace-noc-driver-v2-2-8afc6584afc5@quicinc.com>
References: <20250226-trace-noc-driver-v2-0-8afc6584afc5@quicinc.com>
In-Reply-To: <20250226-trace-noc-driver-v2-0-8afc6584afc5@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <kernel@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740567972; l=9704;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=fXNjSONmCAabHmnfKn/QyPfEQCzYBYciP1vudtbPH/Y=;
 b=phxGAhWtAdgIrgZ2UQmFA01C8vIPn3bmVpeGs8jvMIbsedqmH8WUnQpfbiX23YI6OZOR/dQ1B
 CQg/8uOwbsZC60oGvAU3o5k0rlWltJHBHcQAbNuo+5tzgBwrI8SDXeC
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -LhF7aYCtjkfHeLQlG3oolL01FCOV2Jn
X-Proofpoint-ORIG-GUID: -LhF7aYCtjkfHeLQlG3oolL01FCOV2Jn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_02,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_030635_146286_88864EF0 
X-CRM114-Status: GOOD (  25.25  )
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

Add driver to support Coresight device Trace NOC(Network On Chip).
Trace NOC is an integration hierarchy which is a replacement of
Dragonlink configuration. It brings together debug components like
TPDA, funnel and interconnect Trace Noc.

It sits in the different subsystem of SOC and aggregates the trace
and transports to QDSS trace bus.

Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
---
 drivers/hwtracing/coresight/Kconfig          |  13 ++
 drivers/hwtracing/coresight/Makefile         |   1 +
 drivers/hwtracing/coresight/coresight-tnoc.c | 190 +++++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tnoc.h |  53 ++++++++
 4 files changed, 257 insertions(+)

diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
index 06f0a7594169c5f03ca5f893b7debd294587de78..6cfd160f09d383ab5f5aa276fa57496a52c8f961 100644
--- a/drivers/hwtracing/coresight/Kconfig
+++ b/drivers/hwtracing/coresight/Kconfig
@@ -247,4 +247,17 @@ config CORESIGHT_DUMMY
 
 	  To compile this driver as a module, choose M here: the module will be
 	  called coresight-dummy.
+
+config CORESIGHT_TNOC
+	tristate "Coresight Trace Noc driver"
+	help
+	  This driver provides support for Trace NoC component.
+	  Trace NoC is a interconnect that is used to collect trace from
+	  various subsystems and transport it QDSS trace sink.It sits in
+	  the different tiles of SOC and aggregates the trace local to the
+	  tile and transports it another tile or to QDSS trace sink eventually.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called coresight-tnoc.
+
 endif
diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
index 4ba478211b318ea5305f9f98dda40a041759f09f..60b729979f19c8f8848c77c290605132dba1a991 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -34,6 +34,7 @@ obj-$(CONFIG_CORESIGHT_SINK_TPIU) += coresight-tpiu.o
 obj-$(CONFIG_CORESIGHT_SINK_ETBV10) += coresight-etb10.o
 obj-$(CONFIG_CORESIGHT_LINKS_AND_SINKS) += coresight-funnel.o \
 					   coresight-replicator.o
+obj-$(CONFIG_CORESIGHT_TNOC) += coresight-tnoc.o
 obj-$(CONFIG_CORESIGHT_SOURCE_ETM3X) += coresight-etm3x.o
 coresight-etm3x-y := coresight-etm3x-core.o coresight-etm-cp14.o \
 		     coresight-etm3x-sysfs.o
diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
new file mode 100644
index 0000000000000000000000000000000000000000..fad8e61f05ef25989aba1be342c547f835e8953a
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -0,0 +1,190 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/amba/bus.h>
+#include <linux/io.h>
+#include <linux/coresight.h>
+#include <linux/of.h>
+
+#include "coresight-priv.h"
+#include "coresight-tnoc.h"
+#include "coresight-trace-id.h"
+
+static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
+{
+	u32 val;
+
+	/* Set ATID */
+	writel_relaxed(drvdata->atid, drvdata->base + TRACE_NOC_XLD);
+
+	/* Config sync CR */
+	writel_relaxed(0xffff, drvdata->base + TRACE_NOC_SYNCR);
+
+	/* Set frequency value */
+	writel_relaxed(drvdata->freq_req_val, drvdata->base + TRACE_NOC_FREQVAL);
+
+	/* Set Ctrl register */
+	val = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
+
+	if (drvdata->flag_type == FLAG_TS)
+		val = val | TRACE_NOC_CTRL_FLAGTYPE;
+	else
+		val = val & ~TRACE_NOC_CTRL_FLAGTYPE;
+
+	if (drvdata->freq_type == FREQ_TS)
+		val = val | TRACE_NOC_CTRL_FREQTYPE;
+	else
+		val = val & ~TRACE_NOC_CTRL_FREQTYPE;
+
+	val = val | TRACE_NOC_CTRL_PORTEN;
+	writel_relaxed(val, drvdata->base + TRACE_NOC_CTRL);
+
+	dev_dbg(drvdata->dev, "Trace NOC is enabled\n");
+}
+
+static int trace_noc_enable(struct coresight_device *csdev, struct coresight_connection *inport,
+			    struct coresight_connection *outport)
+{
+	struct trace_noc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+
+	spin_lock(&drvdata->spinlock);
+	if (csdev->refcnt == 0)
+		trace_noc_enable_hw(drvdata);
+
+	csdev->refcnt++;
+	spin_unlock(&drvdata->spinlock);
+
+	return 0;
+}
+
+static void trace_noc_disable_hw(struct trace_noc_drvdata *drvdata)
+{
+	writel_relaxed(0x0, drvdata->base + TRACE_NOC_CTRL);
+	dev_dbg(drvdata->dev, "Trace NOC is disabled\n");
+}
+
+static void trace_noc_disable(struct coresight_device *csdev, struct coresight_connection *inport,
+			      struct coresight_connection *outport)
+{
+	struct trace_noc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+
+	spin_lock(&drvdata->spinlock);
+	if (--csdev->refcnt == 0)
+		trace_noc_disable_hw(drvdata);
+
+	spin_unlock(&drvdata->spinlock);
+	dev_info(drvdata->dev, "Trace NOC is disabled\n");
+}
+
+static const struct coresight_ops_link trace_noc_link_ops = {
+	.enable		= trace_noc_enable,
+	.disable	= trace_noc_disable,
+};
+
+static const struct coresight_ops trace_noc_cs_ops = {
+	.link_ops	= &trace_noc_link_ops,
+};
+
+static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
+{
+	int atid;
+
+	atid = coresight_trace_id_get_system_id();
+	if (atid < 0)
+		return atid;
+
+	drvdata->atid = atid;
+
+	drvdata->freq_type = FREQ_TS;
+	drvdata->flag_type = FLAG;
+	drvdata->freq_req_val = 0;
+
+	return 0;
+}
+
+static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
+{
+	struct device *dev = &adev->dev;
+	struct coresight_platform_data *pdata;
+	struct trace_noc_drvdata *drvdata;
+	struct coresight_desc desc = { 0 };
+	int ret;
+
+	desc.name = coresight_alloc_device_name(&trace_noc_devs, dev);
+	if (!desc.name)
+		return -ENOMEM;
+	pdata = coresight_get_platform_data(dev);
+	if (IS_ERR(pdata))
+		return PTR_ERR(pdata);
+	adev->dev.platform_data = pdata;
+
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	drvdata->dev = &adev->dev;
+	dev_set_drvdata(dev, drvdata);
+
+	drvdata->base = devm_ioremap_resource(dev, &adev->res);
+	if (!drvdata->base)
+		return -ENOMEM;
+
+	spin_lock_init(&drvdata->spinlock);
+
+	ret = trace_noc_init_default_data(drvdata);
+	if (ret)
+		return ret;
+
+	desc.ops = &trace_noc_cs_ops;
+	desc.type = CORESIGHT_DEV_TYPE_LINK;
+	desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_MERG;
+	desc.pdata = adev->dev.platform_data;
+	desc.dev = &adev->dev;
+	desc.access = CSDEV_ACCESS_IOMEM(drvdata->base);
+	drvdata->csdev = coresight_register(&desc);
+	if (IS_ERR(drvdata->csdev))
+		return PTR_ERR(drvdata->csdev);
+
+	pm_runtime_put(&adev->dev);
+
+	return 0;
+}
+
+static void trace_noc_remove(struct amba_device *adev)
+{
+	struct trace_noc_drvdata *drvdata = dev_get_drvdata(&adev->dev);
+
+	coresight_trace_id_put_system_id(drvdata->atid);
+	coresight_unregister(drvdata->csdev);
+}
+
+static struct amba_id trace_noc_ids[] = {
+	{
+		.id     = 0x000f0c00,
+		.mask   = 0x000fff00,
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(amba, trace_noc_ids);
+
+static struct amba_driver trace_noc_driver = {
+	.drv = {
+		.name   = "coresight-trace-noc",
+		.owner	= THIS_MODULE,
+		.suppress_bind_attrs = true,
+	},
+	.probe          = trace_noc_probe,
+	.remove		= trace_noc_remove,
+	.id_table	= trace_noc_ids,
+};
+
+module_amba_driver(trace_noc_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Trace NOC driver");
diff --git a/drivers/hwtracing/coresight/coresight-tnoc.h b/drivers/hwtracing/coresight/coresight-tnoc.h
new file mode 100644
index 0000000000000000000000000000000000000000..b6bd1ef659897d8e0994c5e8514e8cbdd16eebd8
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-tnoc.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#define TRACE_NOC_CTRL	0x008
+#define TRACE_NOC_XLD	0x010
+#define TRACE_NOC_FREQVAL	0x018
+#define TRACE_NOC_SYNCR	0x020
+
+/* Enable generation of output ATB traffic.*/
+#define TRACE_NOC_CTRL_PORTEN	BIT(0)
+/* Writing 1 to issue a FREQ or FREQ_TS packet*/
+#define TRACE_NOC_CTRL_FREQTSREQ	BIT(5)
+/* Sets the type of issued ATB FLAG packets. 0: 'FLAG' packets; 1: 'FLAG_TS' packets.*/
+#define TRACE_NOC_CTRL_FLAGTYPE		BIT(7)
+/* sets the type of issued ATB FREQ packets. 0: 'FREQ' packets; 1: 'FREQ_TS' packets.*/
+#define TRACE_NOC_CTRL_FREQTYPE		BIT(8)
+DEFINE_CORESIGHT_DEVLIST(trace_noc_devs, "traceNoc");
+
+/**
+ * struct trace_noc_drvdata - specifics associated to a trace noc component
+ * @base:	memory mapped base address for this component.
+ * @dev:	device node for trace_noc_drvdata.
+ * @csdev:	component vitals needed by the framework.
+ * @spinlock:	only one at a time pls.
+ * @atid:	id for the trace packet.
+ * @freqtype:	0: 'FREQ' packets; 1: 'FREQ_TS' packets.
+ * @flagtype:	0: 'FLAG' packets; 1: 'FLAG_TS' packets.
+ * @freq_req_val:	 set frequency values carried by 'FREQ' and 'FREQ_TS' packets.
+ */
+struct trace_noc_drvdata {
+	void __iomem		*base;
+	struct device		*dev;
+	struct coresight_device	*csdev;
+	spinlock_t		spinlock; /* lock for the drvdata. */
+	u32			atid;
+	u32			freq_type;
+	u32			flag_type;
+	u32			freq_req_val;
+};
+
+/* freq type */
+enum freq_type {
+	FREQ,
+	FREQ_TS,
+};
+
+/* flag type */
+enum flag_type {
+	FLAG,
+	FLAG_TS,
+};

-- 
2.34.1


