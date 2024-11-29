Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEEB4D6EBEF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 08:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=21kcCC4Smv5M4GOcnSr0R7RJpoCmXkh5cyl0TDtNyts=; b=CCDGtknpgluycbgstwcwfCtKML
	236kHK4Rl6bRNNkyYW7GJuL2HcoODkAG6GbJ7IBppzYbTkEZOYR/OxFDzUci2QhMYMidusYk4ah5c
	rCeSD/8DMoI9R5HBnICYaJxI3AnB/bFcF73Lu/z8BngAuloqiWsm6tt1sMwyszmYoTJW6Xdt0Ar3+
	d9S6G/DTH8EfnUJy6QPsoocrjmLyv13dedOCLlnhU57b/sGcN5/mIRHxV3iOlgRb/47QkedahOsFt
	kQS3iSAfjSMhC/pQsgnfLP8NOLhQUsxphM52zinuGBiyxw2Oy2hobFmcdx56Iuo9m81xW4yeEMXsa
	hDx2X7Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGwmG-0000000HFaW-07Hs;
	Fri, 29 Nov 2024 08:55:04 +0000
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGwfd-0000000HEAs-1XUW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 08:48:14 +0000
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AT8iGAb000646;
	Fri, 29 Nov 2024 00:48:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=2
	1kcCC4Smv5M4GOcnSr0R7RJpoCmXkh5cyl0TDtNyts=; b=FlaG5HtKluWjgNWuS
	Ce5ZmUzypM3ujAKE7huwKLu1XPvF+5BGoZWGtZU3PDhZx3lQZnTP12d/MNBHAUHU
	25m8p+pCX55xTVebMpH2XAz7GN99eQkn2Jvfsvf9g+YoYb/mxxkHVPnIseMQWsZa
	qoJmQkKg8f75L1Xiux7lXI77xs7HLMzDW5FtrM7HjRqbw9rw8oq1MMa2ynA9Cm+u
	fF/tH3PLUgtydxulNODbEagO1HN5Ib6SMpMF6gNPLMgzv8wBRPMBhu7pDZtDArGD
	aceylsa3ct0FcMAg6XbsgS4EH1/W8DIJuKaN8kt8TFdwbBsVIVCcauknKHoJGjRx
	cO2Gg==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 437abyg08c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 00:48:07 -0800 (PST)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 29 Nov 2024 00:48:06 -0800
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 29 Nov 2024 00:48:06 -0800
Received: from virtx40.. (unknown [10.28.34.196])
	by maili.marvell.com (Postfix) with ESMTP id 47E705C68FD;
	Fri, 29 Nov 2024 00:48:02 -0800 (PST)
From: Linu Cherian <lcherian@marvell.com>
To: <suzuki.poulose@arm.com>, <mike.leach@linaro.org>, <james.clark@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <coresight@lists.linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <corbet@lwn.net>, <devicetree@vger.kernel.org>, <sgoutham@marvell.com>,
        <gcherian@marvell.com>, Linu Cherian <lcherian@marvell.com>
Subject: [PATCH v12 6/8] coresight: tmc: Stop trace capture on FlIn
Date: Fri, 29 Nov 2024 14:17:12 +0530
Message-ID: <20241129084714.3057080-7-lcherian@marvell.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241129084714.3057080-1-lcherian@marvell.com>
References: <20241129084714.3057080-1-lcherian@marvell.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: YKU2osOU5z6IVZ4c3Tg_4GQzNdWAFIJx
X-Proofpoint-GUID: YKU2osOU5z6IVZ4c3Tg_4GQzNdWAFIJx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_004813_518568_899708A9 
X-CRM114-Status: GOOD (  16.64  )
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

Configure TMC ETR and ETF to flush and stop trace capture
on FlIn event based on sysfs attribute,
/sys/bus/coresight/devices/tmc_etXn/stop_on_flush.

Signed-off-by: Linu Cherian <lcherian@marvell.com>
---
 .../hwtracing/coresight/coresight-tmc-core.c  | 31 +++++++++++++++++++
 .../hwtracing/coresight/coresight-tmc-etf.c   | 12 ++++---
 .../hwtracing/coresight/coresight-tmc-etr.c   | 12 ++++---
 drivers/hwtracing/coresight/coresight-tmc.h   |  2 ++
 4 files changed, 47 insertions(+), 10 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 5f3789314c4d..3d3a2df4303b 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -540,9 +540,40 @@ static ssize_t buffer_size_store(struct device *dev,
 
 static DEVICE_ATTR_RW(buffer_size);
 
+static ssize_t stop_on_flush_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct tmc_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	return sprintf(buf, "%#x\n", drvdata->stop_on_flush);
+}
+
+static ssize_t stop_on_flush_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t size)
+{
+	int ret;
+	u8 val;
+	struct tmc_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	ret = kstrtou8(buf, 0, &val);
+	if (ret)
+		return ret;
+	if (val)
+		drvdata->stop_on_flush = true;
+	else
+		drvdata->stop_on_flush = false;
+
+	return size;
+}
+
+static DEVICE_ATTR_RW(stop_on_flush);
+
+
 static struct attribute *coresight_tmc_attrs[] = {
 	&dev_attr_trigger_cntr.attr,
 	&dev_attr_buffer_size.attr,
+	&dev_attr_stop_on_flush.attr,
 	NULL,
 };
 
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index 0f9155a10ac2..bdc3a7e9ba06 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
@@ -19,6 +19,7 @@ static int tmc_set_etf_buffer(struct coresight_device *csdev,
 static int __tmc_etb_enable_hw(struct tmc_drvdata *drvdata)
 {
 	int rc = 0;
+	u32 ffcr;
 
 	CS_UNLOCK(drvdata->base);
 
@@ -32,10 +33,12 @@ static int __tmc_etb_enable_hw(struct tmc_drvdata *drvdata)
 	}
 
 	writel_relaxed(TMC_MODE_CIRCULAR_BUFFER, drvdata->base + TMC_MODE);
-	writel_relaxed(TMC_FFCR_EN_FMT | TMC_FFCR_EN_TI |
-		       TMC_FFCR_FON_FLIN | TMC_FFCR_FON_TRIG_EVT |
-		       TMC_FFCR_TRIGON_TRIGIN,
-		       drvdata->base + TMC_FFCR);
+
+	ffcr = TMC_FFCR_EN_FMT | TMC_FFCR_EN_TI | TMC_FFCR_FON_FLIN |
+		TMC_FFCR_FON_TRIG_EVT | TMC_FFCR_TRIGON_TRIGIN;
+	if (drvdata->stop_on_flush)
+		ffcr |= TMC_FFCR_STOP_ON_FLUSH;
+	writel_relaxed(ffcr, drvdata->base + TMC_FFCR);
 
 	writel_relaxed(drvdata->trigger_cntr, drvdata->base + TMC_TRG);
 	tmc_enable_hw(drvdata);
@@ -225,7 +228,6 @@ static int tmc_enable_etf_sink_sysfs(struct coresight_device *csdev)
 		used = true;
 		drvdata->buf = buf;
 	}
-
 	ret = tmc_etb_enable_hw(drvdata);
 	if (!ret) {
 		coresight_set_mode(csdev, CS_MODE_SYSFS);
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 18752f58dfa6..e64b98c8f44c 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1060,7 +1060,7 @@ static void tmc_sync_etr_buf(struct tmc_drvdata *drvdata)
 
 static int __tmc_etr_enable_hw(struct tmc_drvdata *drvdata)
 {
-	u32 axictl, sts;
+	u32 axictl, sts, ffcr;
 	struct etr_buf *etr_buf = drvdata->etr_buf;
 	int rc = 0;
 
@@ -1106,10 +1106,12 @@ static int __tmc_etr_enable_hw(struct tmc_drvdata *drvdata)
 		writel_relaxed(sts, drvdata->base + TMC_STS);
 	}
 
-	writel_relaxed(TMC_FFCR_EN_FMT | TMC_FFCR_EN_TI |
-		       TMC_FFCR_FON_FLIN | TMC_FFCR_FON_TRIG_EVT |
-		       TMC_FFCR_TRIGON_TRIGIN,
-		       drvdata->base + TMC_FFCR);
+	ffcr = TMC_FFCR_EN_FMT | TMC_FFCR_EN_TI | TMC_FFCR_FON_FLIN |
+		TMC_FFCR_FON_TRIG_EVT | TMC_FFCR_TRIGON_TRIGIN;
+	if (drvdata->stop_on_flush)
+		ffcr |= TMC_FFCR_STOP_ON_FLUSH;
+	writel_relaxed(ffcr, drvdata->base + TMC_FFCR);
+
 	writel_relaxed(drvdata->trigger_cntr, drvdata->base + TMC_TRG);
 	tmc_enable_hw(drvdata);
 
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 2ece44e09911..589087682626 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -218,6 +218,7 @@ struct tmc_resrv_buf {
  * @pid:	Process ID of the process that owns the session that is using
  *		this component. For example this would be the pid of the Perf
  *		process.
+ * @stop_on_flush: Stop on flush trigger user configuration.
  * @buf:	Snapshot of the trace data for ETF/ETB.
  * @etr_buf:	details of buffer used in TMC-ETR
  * @len:	size of the available trace for ETF/ETB.
@@ -249,6 +250,7 @@ struct tmc_drvdata {
 	spinlock_t		spinlock;
 	pid_t			pid;
 	bool			reading;
+	bool			stop_on_flush;
 	union {
 		char		*buf;		/* TMC ETB */
 		struct etr_buf	*etr_buf;	/* TMC ETR */
-- 
2.34.1


