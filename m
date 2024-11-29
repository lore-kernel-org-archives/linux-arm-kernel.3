Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377AFD6EBEC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 08:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jhZfoulccbSEP5jaHjGVukhPUlldLkd+xjUngroTrR0=; b=VJjuMMoKIX2ESdXRt3uwnuaxSh
	6bDeRDaVCYRpTdW5qKzJH7QLQ2Im14Sgzf4npRGZ5B3nyiYWOfA9sBUG07GkqMwc4XAG3ejPaPS4H
	5V0Ax31dEsHOe9JLvunrZdZ5duY9QxnGXQrprdTRYvCflAdAzpuSEVikl1c0rGlfZHZRyCH77459k
	QPyIdgC7Bbx/6T2qd1PH41nHwciVypHnbuKhCNzeJaMHReUE5zZNvwcRjO1eT4Hp+h3pcbIOfy/Eq
	fmLJRM/Y8VWu+wyVbBU3U8zCOlfxmSd0M67OrclDqrWgRPB2VjuwQs6v7gnS5ueRz4XZK17cvI7lk
	txiVvqYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGwjN-0000000HF1s-2pyc;
	Fri, 29 Nov 2024 08:52:05 +0000
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGwfP-0000000HE6r-1HMp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 08:48:00 +0000
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AT8i1Ea032099;
	Fri, 29 Nov 2024 00:47:53 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=j
	hZfoulccbSEP5jaHjGVukhPUlldLkd+xjUngroTrR0=; b=TnQljqPCDhrAmJ9am
	tUfDjKU5TRN3NiuFEGNb3HaHwUEYPT13Dg5gJ4s8oH8aRfuRBZVnZu/4hV9/LQB2
	AqGszbcamgIzA5bEnthS9VDdrgvXhdKf8T+ee7QHCjH4GBdTUprqyHQw0g+cHB5P
	u26JG7ssolerg3neInUtYNzgl9ST7vl0/s5abRhCYChqjBnvsFuo9XMW6mD9kyfv
	TE1E36STLXn7bTojmCbiRsYurHZZB4C0qp8i74SGAdRFHgdK9Wv7glx8d+Xg8ztJ
	lCKRpA0DDeppCtcLFjJnCYlXDNKRJJYd3A2WAI/EdQsdUbZxcLDbGdtM++lpTjWO
	O2o5Q==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 437abyg07n-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 00:47:52 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 29 Nov 2024 00:47:52 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 29 Nov 2024 00:47:52 -0800
Received: from virtx40.. (unknown [10.28.34.196])
	by maili.marvell.com (Postfix) with ESMTP id 1795B5C68F3;
	Fri, 29 Nov 2024 00:47:47 -0800 (PST)
From: Linu Cherian <lcherian@marvell.com>
To: <suzuki.poulose@arm.com>, <mike.leach@linaro.org>, <james.clark@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <coresight@lists.linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <corbet@lwn.net>, <devicetree@vger.kernel.org>, <sgoutham@marvell.com>,
        <gcherian@marvell.com>, Linu Cherian <lcherian@marvell.com>
Subject: [PATCH v12 3/8] coresight: core: Add provision for panic callbacks
Date: Fri, 29 Nov 2024 14:17:09 +0530
Message-ID: <20241129084714.3057080-4-lcherian@marvell.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241129084714.3057080-1-lcherian@marvell.com>
References: <20241129084714.3057080-1-lcherian@marvell.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: U2LgqEuLpPDdhKfXeIuOcWuTGcl_k84W
X-Proofpoint-GUID: U2LgqEuLpPDdhKfXeIuOcWuTGcl_k84W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_004759_455232_77D12024 
X-CRM114-Status: GOOD (  18.22  )
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

Panic callback handlers allows coresight device drivers to sync
relevant trace data and trace metadata to reserved memory
regions so that they can be retrieved later in the subsequent
boot or in the crashdump kernel.

Signed-off-by: Linu Cherian <lcherian@marvell.com>
Reviewed-by: James Clark <james.clark@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 42 ++++++++++++++++++++
 include/linux/coresight.h                    | 12 ++++++
 2 files changed, 54 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index ea38ecf26fcb..8c5fb66911a5 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -19,6 +19,7 @@
 #include <linux/property.h>
 #include <linux/delay.h>
 #include <linux/pm_runtime.h>
+#include <linux/panic_notifier.h>
 
 #include "coresight-etm-perf.h"
 #include "coresight-priv.h"
@@ -1378,6 +1379,36 @@ const struct bus_type coresight_bustype = {
 	.name	= "coresight",
 };
 
+static int coresight_panic_sync(struct device *dev, void *data)
+{
+	int mode;
+	struct coresight_device *csdev;
+
+	/* Run through panic sync handlers for all enabled devices */
+	csdev = container_of(dev, struct coresight_device, dev);
+	mode = coresight_get_mode(csdev);
+
+	if ((mode == CS_MODE_SYSFS) || (mode == CS_MODE_PERF)) {
+		if (panic_ops(csdev))
+			panic_ops(csdev)->sync(csdev);
+	}
+
+	return 0;
+}
+
+static int coresight_panic_cb(struct notifier_block *self,
+			       unsigned long v, void *p)
+{
+	bus_for_each_dev(&coresight_bustype, NULL, NULL,
+				 coresight_panic_sync);
+
+	return 0;
+}
+
+static struct notifier_block coresight_notifier = {
+	.notifier_call = coresight_panic_cb,
+};
+
 static int __init coresight_init(void)
 {
 	int ret;
@@ -1390,11 +1421,20 @@ static int __init coresight_init(void)
 	if (ret)
 		goto exit_bus_unregister;
 
+	/* Register function to be called for panic */
+	ret = atomic_notifier_chain_register(&panic_notifier_list,
+					     &coresight_notifier);
+	if (ret)
+		goto exit_perf;
+
 	/* initialise the coresight syscfg API */
 	ret = cscfg_init();
 	if (!ret)
 		return 0;
 
+	atomic_notifier_chain_unregister(&panic_notifier_list,
+					     &coresight_notifier);
+exit_perf:
 	etm_perf_exit();
 exit_bus_unregister:
 	bus_unregister(&coresight_bustype);
@@ -1404,6 +1444,8 @@ static int __init coresight_init(void)
 static void __exit coresight_exit(void)
 {
 	cscfg_exit();
+	atomic_notifier_chain_unregister(&panic_notifier_list,
+					     &coresight_notifier);
 	etm_perf_exit();
 	bus_unregister(&coresight_bustype);
 }
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index c13342594278..2e63f7614551 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -335,6 +335,7 @@ enum cs_mode {
 #define link_ops(csdev)		csdev->ops->link_ops
 #define helper_ops(csdev)	csdev->ops->helper_ops
 #define ect_ops(csdev)		csdev->ops->ect_ops
+#define panic_ops(csdev)	csdev->ops->panic_ops
 
 /**
  * struct coresight_ops_sink - basic operations for a sink
@@ -404,11 +405,22 @@ struct coresight_ops_helper {
 	int (*disable)(struct coresight_device *csdev, void *data);
 };
 
+
+/**
+ * struct coresight_ops_panic - Generic device ops for panic handing
+ *
+ * @sync	: Sync the device register state/trace data
+ */
+struct coresight_ops_panic {
+	int (*sync)(struct coresight_device *csdev);
+};
+
 struct coresight_ops {
 	const struct coresight_ops_sink *sink_ops;
 	const struct coresight_ops_link *link_ops;
 	const struct coresight_ops_source *source_ops;
 	const struct coresight_ops_helper *helper_ops;
+	const struct coresight_ops_panic *panic_ops;
 };
 
 static inline u32 csdev_access_relaxed_read32(struct csdev_access *csa,
-- 
2.34.1


