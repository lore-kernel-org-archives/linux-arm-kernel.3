Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4FFCD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FQxSeTfFg+E642sncTSuXTh0O9YVry3IQnZGeflbPPM=; b=kJjnUPuRYfnlwt2NSFdX9Q1bHC
	HqMDKm4568q+ocuu4Fk0h6EG/BQMAZYc9BtbZKnkm85UrJOPDQ2OB/Ork1q7jDx3T2Yk/uQHzvF9w
	yhhFCYWbH5v2Rhp/4VKzY0F2uLEl0hqTBxb7wHoxowgu/6T5688DBTiPr4aBokrHcdf1re7XRno/U
	PK1Mcc43avfAIYzEp5EDfZX8bfXFbP+/wdMXsyqeFUNS0E45NXaD6jRqystO1sob8Y9rNgGRuHAYf
	MGgGAyHqu7qIdY2xBdiK2Wj+mzOzZDijCH7tnQPjdY3L4M/VQ+68fy+zEkNu0/WRRtF+/rH3mRN7Y
	4o5WHk4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMgG-000000026eX-3feq;
	Tue, 19 May 2026 15:48:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMgE-000000026cu-3LY5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:48:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1FFDA244C;
	Tue, 19 May 2026 08:48:20 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 241A23F632;
	Tue, 19 May 2026 08:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779205705; bh=R8TqSvxEdtBwfrKxIo4gN/zriFxD7ndmTmUy3uLuH/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u8jQBVn4+46nL849BkXPYfv8wn1qoUgz7xQkLuLJ1Vnzpv/6e8ghZTuXbbd+vxvV4
	 s7q2noaTJGKZ0sob7AlNsHiynYqdOkmQhiGTrZs+GyIuZu1LLYwNTY7rrBsDThj34U
	 /1GlcJghktVPLsy7Fdaw1nJCZAgSYnJLfyEOwMwk=
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com,
	mike.leach@arm.com,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	leo.yan@arm.com,
	jie.gan@oss.qualcomm.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v7 03/13] coresight: etm4x: introduce ETM_MAX_SEQ_TRANSITIONS
Date: Tue, 19 May 2026 16:48:02 +0100
Message-Id: <20260519154812.254884-4-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260519154812.254884-1-yeoreum.yun@arm.com>
References: <20260519154812.254884-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_084826_960256_B9318EF3 
X-CRM114-Status: GOOD (  12.24  )
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

According to IHI006H Embedded Trace Macrocell Architecture
Specification [0], n could be 0-2 for TCRSEQEVR<n> when
TCRIDR5.NUMSEQSTATE is 0b100.

Therefore, introduce ETM_MAX_SEQ_TRANSITIONS macro and apply this
in TCRSEQEVR<n> relevant fields.

Link: https://developer.arm.com/documentation/ihi0064/latest/ [0]
Suggestedby: Leo Yan <leo.yan@arm.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-cfg.c | 2 +-
 drivers/hwtracing/coresight/coresight-etm4x.h     | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
index c302072b293a..e1a59b434505 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
@@ -76,7 +76,7 @@ static int etm4_cfg_map_reg_offset(struct etmv4_drvdata *drvdata,
 	} else if ((offset & GENMASK(11, 4)) == TRCSEQEVRn(0)) {
 		/* sequencer state control registers */
 		idx = (offset & GENMASK(3, 0)) / 4;
-		if (idx < ETM_MAX_SEQ_STATES) {
+		if (idx < ETM_MAX_SEQ_TRANSITIONS) {
 			reg_csdev->driver_regval = &drvcfg->seq_ctrl[idx];
 			err = 0;
 		}
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 89d81ce4e04e..60e08ab085c5 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -614,6 +614,7 @@ static inline u32 etm4_res_sel_pair(u8 res_sel_idx)
 #define ETM_MAX_NR_PE			8
 #define ETMv4_MAX_CNTR			4
 #define ETM_MAX_SEQ_STATES		4
+#define ETM_MAX_SEQ_TRANSITIONS		(ETM_MAX_SEQ_STATES - 1)
 #define ETM_MAX_EXT_INP_SEL		4
 #define ETM_MAX_EXT_INP			256
 #define ETM_MAX_EXT_OUT			4
@@ -877,7 +878,7 @@ struct etmv4_config {
 	u32				vipcssctlr;
 	u8				seq_idx;
 	u8				syncfreq;
-	u32				seq_ctrl[ETM_MAX_SEQ_STATES];
+	u32				seq_ctrl[ETM_MAX_SEQ_TRANSITIONS];
 	u32				seq_rst;
 	u32				seq_state;
 	u8				cntr_idx;
@@ -928,7 +929,7 @@ struct etmv4_save_state {
 	u32	trcvissctlr;
 	u32	trcvipcssctlr;
 
-	u32	trcseqevr[ETM_MAX_SEQ_STATES];
+	u32	trcseqevr[ETM_MAX_SEQ_TRANSITIONS];
 	u32	trcseqrstevr;
 	u32	trcseqstr;
 	u32	trcextinselr;
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


