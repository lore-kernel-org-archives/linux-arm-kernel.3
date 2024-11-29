Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18B0D6EBEE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 08:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hwK0u3BDz4JlMfro/VGLkYMMzwJ+Jq9tpfKws9wnPec=; b=Q0Pz01awKedz4L4+dVwqi8jWeq
	/2Ux5dtXStUNF7ak9lHOyUR796EAOJKFVFZRYOEx+BawsU1F8FqucFZlJX1WtAhQPCU2Yu5MGkEe2
	Thz9wAkFWEnChnp8YdqVhQBl6k0ZmstL7cAO/C//Do9OvEortSDyuX0UZ5ZfQEcm5NxzYNDOYys3m
	1Kd/CsFHJiPx6R7di3lDSWU3DpvA4qAC0vtI6a23MNytTcjTAPSh3Zft+drLPfO+H7rK2bR9zfk0i
	q4eybYJsyEcvO2e+kyjsOpx0zaKAr0AHO9UV5bpeaT/WtWIWgn2JGZaLEmws1suF+Q3GolrlU2xYW
	ApT4+Tvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGwlI-0000000HFLE-0zKN;
	Fri, 29 Nov 2024 08:54:04 +0000
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174] helo=mx0b-0016f401.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGwfc-0000000HEAX-2qfH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 08:48:13 +0000
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AT7tswO006327;
	Fri, 29 Nov 2024 00:47:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=h
	wK0u3BDz4JlMfro/VGLkYMMzwJ+Jq9tpfKws9wnPec=; b=fePRVRmDQ2g5n2GUP
	4571nOSTETQAZ7LK5o7lOFsJNEoxlcNKHraTzeXFw9iVpQTAgsbjU2y6Pd7UR2xD
	c3wTrKNE/VSBH9QKBuVS/gbHwIx5+96FBs7q6ocgVreCmp05Vi7qGGFA/VTqhz23
	gyRfFEM337lY6mJhyo7AAxk5NiqdjE4MHjj91OguEHNT3t4CHqEOpST2psyDoyb/
	ZxVLwwZufYCBX/2PGs+TiFUl+QJq1mH6kKfnYqLjrx19Znmn2X2JS1laXPRh62UA
	IF41XiG9Ey5OJzJP8V3MR1wDvQmmU5aQyuBhBQcyzpiq+Si4HxBcwP/fCEHorf2Y
	QiZSA==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 43771jgbmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 00:47:58 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 29 Nov 2024 00:47:56 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 29 Nov 2024 00:47:56 -0800
Received: from virtx40.. (unknown [10.28.34.196])
	by maili.marvell.com (Postfix) with ESMTP id A0CEC5C68F3;
	Fri, 29 Nov 2024 00:47:52 -0800 (PST)
From: Linu Cherian <lcherian@marvell.com>
To: <suzuki.poulose@arm.com>, <mike.leach@linaro.org>, <james.clark@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <coresight@lists.linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <corbet@lwn.net>, <devicetree@vger.kernel.org>, <sgoutham@marvell.com>,
        <gcherian@marvell.com>, Linu Cherian <lcherian@marvell.com>
Subject: [PATCH v12 4/8] coresight: tmc: Enable panic sync handling
Date: Fri, 29 Nov 2024 14:17:10 +0530
Message-ID: <20241129084714.3057080-5-lcherian@marvell.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241129084714.3057080-1-lcherian@marvell.com>
References: <20241129084714.3057080-1-lcherian@marvell.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: -8NK-FRTqcIepntApVWuxj4S9y7t2PaS
X-Proofpoint-GUID: -8NK-FRTqcIepntApVWuxj4S9y7t2PaS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_004812_726877_98B30E3A 
X-CRM114-Status: GOOD (  22.03  )
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

- Get reserved region from device tree node for metadata
- Define metadata format for TMC
- Add TMC ETR panic sync handler that syncs register snapshot
  to metadata region
- Add TMC ETF panic sync handler that syncs register snapshot
  to metadata region and internal SRAM to reserved trace buffer
  region.

Signed-off-by: Linu Cherian <lcherian@marvell.com>
Reviewed-by: James Clark <james.clark@arm.com>
---
 .../hwtracing/coresight/coresight-tmc-core.c  | 14 ++++
 .../hwtracing/coresight/coresight-tmc-etf.c   | 80 +++++++++++++++++++
 .../hwtracing/coresight/coresight-tmc-etr.c   | 73 +++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h   | 66 +++++++++++++++
 4 files changed, 233 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 248989833b20..1e3938ec12cb 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -444,6 +444,20 @@ static void tmc_get_reserved_region(struct device *parent)
 
 	drvdata->resrv_buf.paddr = res.start;
 	drvdata->resrv_buf.size  = resource_size(&res);
+
+	if (of_tmc_get_reserved_resource_by_name(parent, "metadata", &res))
+		return;
+
+	drvdata->crash_mdata.vaddr = memremap(res.start,
+					       resource_size(&res),
+					       MEMREMAP_WC);
+	if (IS_ERR_OR_NULL(drvdata->crash_mdata.vaddr)) {
+		dev_err(parent, "Metadata memory mapping failed\n");
+		return;
+	}
+
+	drvdata->crash_mdata.paddr = res.start;
+	drvdata->crash_mdata.size  = resource_size(&res);
 }
 
 /* Detect and initialise the capabilities of a TMC ETR */
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index d4f641cd9de6..0f9155a10ac2 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
@@ -590,6 +590,81 @@ static unsigned long tmc_update_etf_buffer(struct coresight_device *csdev,
 	return to_read;
 }
 
+static int tmc_panic_sync_etf(struct coresight_device *csdev)
+{
+	u32 val;
+	struct tmc_crash_metadata *mdata;
+	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+
+	mdata = (struct tmc_crash_metadata *)drvdata->crash_mdata.vaddr;
+
+	/* Make sure we have valid reserved memory */
+	if (!tmc_has_reserved_buffer(drvdata) ||
+	    !tmc_has_crash_mdata_buffer(drvdata))
+		return 0;
+
+	tmc_crashdata_set_invalid(drvdata);
+
+	CS_UNLOCK(drvdata->base);
+
+	/* Proceed only if ETF is enabled or configured as sink */
+	val = readl(drvdata->base + TMC_CTL);
+	if (!(val & TMC_CTL_CAPT_EN))
+		goto out;
+	val = readl(drvdata->base + TMC_MODE);
+	if (val != TMC_MODE_CIRCULAR_BUFFER)
+		goto out;
+
+	val = readl(drvdata->base + TMC_FFSR);
+	/* Do manual flush and stop only if its not auto-stopped */
+	if (!(val & TMC_FFSR_FT_STOPPED)) {
+		dev_dbg(&csdev->dev,
+			 "%s: Triggering manual flush\n", __func__);
+		tmc_flush_and_stop(drvdata);
+	} else
+		tmc_wait_for_tmcready(drvdata);
+
+	/* Sync registers from hardware to metadata region */
+	mdata->tmc_sts = readl(drvdata->base + TMC_STS);
+	mdata->tmc_mode = readl(drvdata->base + TMC_MODE);
+	mdata->tmc_ffcr = readl(drvdata->base + TMC_FFCR);
+	mdata->tmc_ffsr = readl(drvdata->base + TMC_FFSR);
+
+	/* Sync Internal SRAM to reserved trace buffer region */
+	drvdata->buf = drvdata->resrv_buf.vaddr;
+	tmc_etb_dump_hw(drvdata);
+	/* Store as per RSZ register convention */
+	mdata->tmc_ram_size = drvdata->len >> 2;
+
+	/* Other fields for processing trace buffer reads */
+	mdata->tmc_rrp = 0;
+	mdata->tmc_dba = 0;
+	mdata->tmc_rwp = drvdata->len;
+	mdata->trace_paddr = drvdata->resrv_buf.paddr;
+
+	mdata->version = CS_CRASHDATA_VERSION;
+
+	/*
+	 * Make sure all previous writes are ordered,
+	 * before we mark valid
+	 */
+	dmb(sy);
+	mdata->valid = true;
+	/*
+	 * Below order need to maintained, since crc of metadata
+	 * is dependent on first
+	 */
+	mdata->crc32_tdata = find_crash_tracedata_crc(drvdata, mdata);
+	mdata->crc32_mdata = find_crash_metadata_crc(mdata);
+
+	tmc_disable_hw(drvdata);
+
+	dev_dbg(&csdev->dev, "%s: success\n", __func__);
+out:
+	CS_UNLOCK(drvdata->base);
+	return 0;
+}
+
 static const struct coresight_ops_sink tmc_etf_sink_ops = {
 	.enable		= tmc_enable_etf_sink,
 	.disable	= tmc_disable_etf_sink,
@@ -603,6 +678,10 @@ static const struct coresight_ops_link tmc_etf_link_ops = {
 	.disable	= tmc_disable_etf_link,
 };
 
+static const struct coresight_ops_panic tmc_etf_sync_ops = {
+	.sync		= tmc_panic_sync_etf,
+};
+
 const struct coresight_ops tmc_etb_cs_ops = {
 	.sink_ops	= &tmc_etf_sink_ops,
 };
@@ -610,6 +689,7 @@ const struct coresight_ops tmc_etb_cs_ops = {
 const struct coresight_ops tmc_etf_cs_ops = {
 	.sink_ops	= &tmc_etf_sink_ops,
 	.link_ops	= &tmc_etf_link_ops,
+	.panic_ops	= &tmc_etf_sync_ops,
 };
 
 int tmc_read_prepare_etb(struct tmc_drvdata *drvdata)
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 8bca5b36334a..fb944a68a11c 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1814,6 +1814,74 @@ static int tmc_disable_etr_sink(struct coresight_device *csdev)
 	return 0;
 }
 
+static int tmc_panic_sync_etr(struct coresight_device *csdev)
+{
+	u32 val;
+	struct tmc_crash_metadata *mdata;
+	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+
+	mdata = (struct tmc_crash_metadata *)drvdata->crash_mdata.vaddr;
+
+	if (!drvdata->etr_buf)
+		return 0;
+
+	/* Being in RESRV mode implies valid reserved memory as well */
+	if (drvdata->etr_buf->mode != ETR_MODE_RESRV)
+		return 0;
+
+	if (!tmc_has_crash_mdata_buffer(drvdata))
+		return 0;
+
+	CS_UNLOCK(drvdata->base);
+
+	/* Proceed only if ETR is enabled */
+	val = readl(drvdata->base + TMC_CTL);
+	if (!(val & TMC_CTL_CAPT_EN))
+		goto out;
+
+	val = readl(drvdata->base + TMC_FFSR);
+	/* Do manual flush and stop only if its not auto-stopped */
+	if (!(val & TMC_FFSR_FT_STOPPED)) {
+		dev_dbg(&csdev->dev,
+			 "%s: Triggering manual flush\n", __func__);
+		tmc_flush_and_stop(drvdata);
+	} else
+		tmc_wait_for_tmcready(drvdata);
+
+	/* Sync registers from hardware to metadata region */
+	mdata->tmc_ram_size = readl(drvdata->base + TMC_RSZ);
+	mdata->tmc_sts = readl(drvdata->base + TMC_STS);
+	mdata->tmc_mode = readl(drvdata->base + TMC_MODE);
+	mdata->tmc_ffcr = readl(drvdata->base + TMC_FFCR);
+	mdata->tmc_ffsr = readl(drvdata->base + TMC_FFSR);
+	mdata->tmc_rrp = tmc_read_rrp(drvdata);
+	mdata->tmc_rwp = tmc_read_rwp(drvdata);
+	mdata->tmc_dba = tmc_read_dba(drvdata);
+	mdata->trace_paddr = drvdata->resrv_buf.paddr;
+	mdata->version = CS_CRASHDATA_VERSION;
+
+	/*
+	 * Make sure all previous writes are ordered,
+	 * before we mark valid
+	 */
+	dmb(sy);
+	mdata->valid = true;
+	/*
+	 * Below order need to maintained, since crc of metadata
+	 * is dependent on first
+	 */
+	mdata->crc32_tdata = find_crash_tracedata_crc(drvdata, mdata);
+	mdata->crc32_mdata = find_crash_metadata_crc(mdata);
+
+	tmc_disable_hw(drvdata);
+
+	dev_dbg(&csdev->dev, "%s: success\n", __func__);
+out:
+	CS_UNLOCK(drvdata->base);
+
+	return 0;
+}
+
 static const struct coresight_ops_sink tmc_etr_sink_ops = {
 	.enable		= tmc_enable_etr_sink,
 	.disable	= tmc_disable_etr_sink,
@@ -1822,8 +1890,13 @@ static const struct coresight_ops_sink tmc_etr_sink_ops = {
 	.free_buffer	= tmc_free_etr_buffer,
 };
 
+static const struct coresight_ops_panic tmc_etr_sync_ops = {
+	.sync		= tmc_panic_sync_etr,
+};
+
 const struct coresight_ops tmc_etr_cs_ops = {
 	.sink_ops	= &tmc_etr_sink_ops,
+	.panic_ops	= &tmc_etr_sync_ops,
 };
 
 int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index d2261eddab71..d76e83fc840b 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -12,6 +12,7 @@
 #include <linux/miscdevice.h>
 #include <linux/mutex.h>
 #include <linux/refcount.h>
+#include <linux/crc32.h>
 
 #define TMC_RSZ			0x004
 #define TMC_STS			0x00c
@@ -76,6 +77,9 @@
 #define TMC_AXICTL_AXCACHE_OS	(0xf << 2)
 #define TMC_AXICTL_ARCACHE_OS	(0xf << 16)
 
+/* TMC_FFSR - 0x300 */
+#define TMC_FFSR_FT_STOPPED	BIT(1)
+
 /* TMC_FFCR - 0x304 */
 #define TMC_FFCR_FLUSHMAN_BIT	6
 #define TMC_FFCR_EN_FMT		BIT(0)
@@ -94,6 +98,9 @@
 
 #define TMC_AUTH_NSID_MASK	GENMASK(1, 0)
 
+/* Major version 1 Minor version 0 */
+#define CS_CRASHDATA_VERSION	(1 << 16)
+
 enum tmc_config_type {
 	TMC_CONFIG_TYPE_ETB,
 	TMC_CONFIG_TYPE_ETR,
@@ -131,6 +138,25 @@ enum tmc_mem_intf_width {
 #define CORESIGHT_SOC_600_ETR_CAPS	\
 	(TMC_ETR_SAVE_RESTORE | TMC_ETR_AXI_ARCACHE)
 
+/* TMC metadata region for ETR and ETF configurations */
+struct tmc_crash_metadata {
+	uint32_t crc32_mdata;	/* crc of metadata */
+	uint32_t crc32_tdata;	/* crc of tracedata */
+	uint32_t version;	/* 31:16 Major version, 15:0 Minor version */
+	uint32_t valid;         /* Indicate if this ETF/ETR was enabled */
+	uint32_t tmc_ram_size;  /* Ram Size register */
+	uint32_t tmc_sts;       /* Status register */
+	uint32_t tmc_mode;	/* Mode register */
+	uint32_t tmc_ffcr;	/* Formatter and flush control register */
+	uint32_t tmc_ffsr;	/* Formatter and flush status register */
+	uint32_t reserved32;
+	uint64_t tmc_rrp;       /* Ram Read pointer register */
+	uint64_t tmc_rwp;       /* Ram Write pointer register */
+	uint64_t tmc_dba;	/* Data buffer address register */
+	uint64_t trace_paddr;	/* Phys address of trace buffer */
+	uint64_t reserved64[3];
+};
+
 enum etr_mode {
 	ETR_MODE_FLAT,		/* Uses contiguous flat buffer */
 	ETR_MODE_ETR_SG,	/* Uses in-built TMC ETR SG mechanism */
@@ -205,6 +231,8 @@ struct tmc_resrv_buf {
  *		retention (after crash) only when ETR_MODE_RESRV buffer
  *		mode is enabled. Used by ETF for trace data retention
  *		(after crash) by default.
+ * @crash_mdata: Reserved memory for storing tmc crash metadata.
+ *		 Used by ETR/ETF.
  */
 struct tmc_drvdata {
 	struct clk		*pclk;
@@ -231,6 +259,7 @@ struct tmc_drvdata {
 	struct etr_buf		*sysfs_buf;
 	struct etr_buf		*perf_buf;
 	struct tmc_resrv_buf	resrv_buf;
+	struct tmc_resrv_buf	crash_mdata;
 };
 
 struct etr_buf_operations {
@@ -356,6 +385,43 @@ static inline bool tmc_has_reserved_buffer(struct tmc_drvdata *drvdata)
 	return false;
 }
 
+static inline bool tmc_has_crash_mdata_buffer(struct tmc_drvdata *drvdata)
+{
+	if (drvdata->crash_mdata.vaddr &&
+	    drvdata->crash_mdata.size)
+		return true;
+	return false;
+}
+
+static inline void tmc_crashdata_set_invalid(struct tmc_drvdata *drvdata)
+{
+	struct tmc_crash_metadata *mdata;
+
+	mdata = (struct tmc_crash_metadata *)drvdata->crash_mdata.vaddr;
+
+	if (tmc_has_crash_mdata_buffer(drvdata))
+		mdata->valid = false;
+}
+
+static inline uint32_t find_crash_metadata_crc(struct tmc_crash_metadata *md)
+{
+	unsigned long crc_size;
+
+	crc_size = sizeof(struct tmc_crash_metadata) -
+		offsetof(struct tmc_crash_metadata, crc32_tdata);
+	return crc32_le(0, (void *)&md->crc32_tdata, crc_size);
+}
+
+static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
+						struct tmc_crash_metadata *md)
+{
+	unsigned long crc_size;
+
+	/* Take CRC of configured buffer size to keep it simple */
+	crc_size = md->tmc_ram_size << 2;
+	return crc32_le(0, (void *)drvdata->resrv_buf.vaddr, crc_size);
+}
+
 struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
-- 
2.34.1


