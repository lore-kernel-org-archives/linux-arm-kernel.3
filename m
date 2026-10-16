Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5269DCCA46C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wa+JLue+OfiSvWD8WXzPhAWJqmoMTr/tdQ2LKdyRqmw=; b=DtL7QOFjAWVquejZLi3jqCubsf
	j2T7NakH8A0exB4RalmMMR+nwT47hOo2kAs+6Z4sET6Oii0ZOsqGkKUuCtE3Kij76SsMK7OXLczPr
	/2uX16u9kNYGh9MlxYqzmVIeD5Y+OsOJ77oDM9DNhOxcsOAvIJ15IQB23qLSDMbQ7TrdZKG2lCmsk
	J47a5Nf2o09M56VdhWPSkjrzJqsllLdx885M+bWVVPUyyFuMDxZJExsbseRYKa84nMwZLE1ZzQEsG
	l75qGE3my9lYTfbtAXq20/9FTErxCC7w/Z6ltmWaCCdJDtl44bGGRF1cPKl/8uA69fByM8sw5mYCz
	QsCzLZTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDX-00000003TvA-3Uer;
	Fri, 16 Oct 2026 16:55:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDJ-00000003Tk5-2vPL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 16:55:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 936FB1516;
	Fri, 16 Oct 2026 09:55:21 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CFC63F7B4;
	Fri, 16 Oct 2026 09:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169724; bh=Nph8rVqtGI3EDRlPDWoX+ktitTsVVlbL02jWjnR1dNA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=W9gYqHGCXwgMoJjKwGAAzbghiIKUIZh2sRTxoSgbcOs2+y0wCArV0nHjshjNR2nyg
	 YhA+xg+dc9DZh2mWqN5FXxd8vx4xdM1sGPCzDq8uY8DoTD1mm2OS5HvHZRAjL5S4yC
	 IIs16Tqr8jaaop7UmwRs1nVN+HLIx2lAe/kpZyZA=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:05 +0100
Subject: [PATCH v2 07/23] coresight: trbe: Publish the session after
 successful enable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-7-3f57cf3199b1@arm.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=2521;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=Nph8rVqtGI3EDRlPDWoX+ktitTsVVlbL02jWjnR1dNA=;
 b=V+vG3b4fwpgP+lSYbv31bGij4E8lKBJP9R1e0trH06hG9NssqXsGsqfriqky2OTcj+5E3aZ+L
 8wioiHOnznuDrKEGikEK2i1MNlJ5v0venoxTJ7PLALQqgckd1lVno9u
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_095527_215475_EB8D73CF 
X-CRM114-Status: GOOD (  13.47  )
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

arm_trbe_enable() records the session buffer and perf mode before
__arm_trbe_enable() can fail. CoreSight skips the sink disable callback
when sink enable fails, leaving that session state published even though
tracing did not start.

Install buf->cpudata temporarily for the buffer setup helpers, then call
__arm_trbe_enable() before assigning cpudata->buf and cpudata->mode.
Clear the temporary buffer association if setup fails; the inner helper
still truncates and ends the AUX transaction.

After successful enable, retain the buffer association across AUX
transactions and clear it in arm_trbe_disable().

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 979d0fa84c1c7b448c1ce5cd7a37dff8845795ef..9dfc6bb7afb4c42dfdec643ee7e4f2f193e2b70c 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -69,6 +69,7 @@ struct trbe_buf {
 	int nr_pages;
 	void **pages;
 	bool snapshot;
+	/* CPU used to configure this buffer. */
 	struct trbe_cpudata *cpudata;
 };
 
@@ -137,6 +138,7 @@ struct trbe_save_state {
  * @trbe_align		- Software alignment used for the TRBPTR_EL1.
  * @cpu			- CPU this TRBE belongs to.
  * @mode		- Mode of current operation. (perf/disabled)
+ * @buf			- Buffer configuration retained for the enabled session.
  * @drvdata		- TRBE specific drvdata
  * @errata		- Bit map for the errata on this TRBE.
  */
@@ -1033,17 +1035,24 @@ static int arm_trbe_enable(struct coresight_device *csdev, enum cs_mode mode,
 	struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
 	struct perf_output_handle *handle = path->handle;
 	struct trbe_buf *buf = etm_perf_sink_config(handle);
+	int ret;
 
 	WARN_ON(cpudata->cpu != smp_processor_id());
 	WARN_ON(cpudata->drvdata != drvdata);
 	if (mode != CS_MODE_PERF)
 		return -EINVAL;
 
-	cpudata->buf = buf;
-	cpudata->mode = mode;
+	/* Buffer helpers need the CPU association while setting up tracing. */
 	buf->cpudata = cpudata;
+	ret = __arm_trbe_enable(buf, handle);
+	if (ret) {
+		buf->cpudata = NULL;
+		return ret;
+	}
 
-	return __arm_trbe_enable(buf, handle);
+	cpudata->buf = buf;
+	cpudata->mode = mode;
+	return 0;
 }
 
 static int arm_trbe_disable(struct coresight_device *csdev)

-- 
2.34.1


