Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84FDDC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 20:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQCc/J3slFii+FB3U4czPZEn85qAGM4i8Rl7L3PhiHk=; b=G5QXHVgqjE4vpUipEdTj71sbZ4
	Nxx7jO4flYwDNY8SPARRZ9/ytZaOkc/A2x9nx6p9cvpbr0yDiT+ZvVE0bggQNvJB7fCZRlHut+f8t
	p2NzV5wCBBJJqFIDnZkX0CNoRF7tLX0Utnev9oXRr1w3y52AyXlZDWvr5X9WRxsQ7PJRpbAXONnwi
	K9GTbZehb+1AT1sKczXB019Wu+8DrooUMrK7n+FbA8fubXdL9KwclQ8VdBe0VGYGw9OSTkJL5YXcm
	oRMB3sjSRu7wk5273oDmmlOlZWPTsIHuEOh0kE1t7oZfwiTHKqD+Zg9MdX7eQ23ZD1iXEBuAQNWAl
	RktcTFjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaJyf-0000000Fkx2-1L8E;
	Fri, 11 Jul 2025 20:04:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaIe4-0000000FXh9-1X2K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 18:38:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8592F2247;
	Fri, 11 Jul 2025 11:38:41 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D4CA3F778;
	Fri, 11 Jul 2025 11:38:49 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Rohit Mathew <rohit.mathew@arm.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Zeng Heng <zengheng4@huawei.com>,
	Lecopzer Chen <lecopzerc@nvidia.com>,
	Carl Worth <carl@os.amperecomputing.com>,
	shameerali.kolothum.thodi@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	lcherian@marvell.com,
	bobo.shaobowang@huawei.com,
	tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com,
	Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>,
	peternewman@google.com,
	dfustini@baylibre.com,
	amitsinght@marvell.com,
	David Hildenbrand <david@redhat.com>,
	Rex Nie <rex.nie@jaguarmicro.com>,
	Dave Martin <dave.martin@arm.com>,
	Koba Ko <kobak@nvidia.com>,
	James Morse <james.morse@arm.com>
Subject: [RFC PATCH 33/36] arm_mpam: Use long MBWU counters if supported
Date: Fri, 11 Jul 2025 18:36:45 +0000
Message-Id: <20250711183648.30766-34-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250711183648.30766-1-james.morse@arm.com>
References: <20250711183648.30766-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_113852_498778_BCE1A6D6 
X-CRM114-Status: GOOD (  19.45  )
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

From: Rohit Mathew <rohit.mathew@arm.com>

If the 44 bit (long) or 63 bit (LWD) counters are detected on probing
the RIS, use long/LWD counter instead of the regular 31 bit mbwu
counter.

Only 32bit accesses to the MSC are required to be supported by the
spec, but these registers are 64bits. The lower half may overflow
into the higher half between two 32bit reads. To avoid this, use
a helper that reads the top half twice to check for overflow.

Signed-off-by: Rohit Mathew <rohit.mathew@arm.com>
[morse: merged multiple patches from Rohit]
Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/platform/arm64/mpam/mpam_devices.c  | 89 ++++++++++++++++++---
 drivers/platform/arm64/mpam/mpam_internal.h |  8 +-
 2 files changed, 86 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/arm64/mpam/mpam_devices.c b/drivers/platform/arm64/mpam/mpam_devices.c
index 774137a124f8..ace69ac2d0ee 100644
--- a/drivers/platform/arm64/mpam/mpam_devices.c
+++ b/drivers/platform/arm64/mpam/mpam_devices.c
@@ -989,6 +989,48 @@ struct mon_read {
 	int				err;
 };
 
+static bool mpam_ris_has_mbwu_long_counter(struct mpam_msc_ris *ris)
+{
+	return (mpam_has_feature(mpam_feat_msmon_mbwu_63counter, &ris->props) ||
+		mpam_has_feature(mpam_feat_msmon_mbwu_44counter, &ris->props));
+}
+
+static u64 mpam_msc_read_mbwu_l(struct mpam_msc *msc)
+{
+	int retry = 3;
+	u32 mbwu_l_low;
+	u64 mbwu_l_high1, mbwu_l_high2;
+
+	mpam_mon_sel_lock_held(msc);
+
+	WARN_ON_ONCE((MSMON_MBWU_L + sizeof(u64)) > msc->mapped_hwpage_sz);
+	WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
+
+	mbwu_l_high2 = __mpam_read_reg(msc, MSMON_MBWU_L + 4);
+	do {
+		mbwu_l_high1 = mbwu_l_high2;
+		mbwu_l_low = __mpam_read_reg(msc, MSMON_MBWU_L);
+		mbwu_l_high2 = __mpam_read_reg(msc, MSMON_MBWU_L + 4);
+
+		retry--;
+	} while (mbwu_l_high1 != mbwu_l_high2 && retry > 0);
+
+	if (mbwu_l_high1 == mbwu_l_high2)
+		return (mbwu_l_high1 << 32) | mbwu_l_low;
+	return MSMON___NRDY_L;
+}
+
+static void mpam_msc_zero_mbwu_l(struct mpam_msc *msc)
+{
+	mpam_mon_sel_lock_held(msc);
+
+	WARN_ON_ONCE((MSMON_MBWU_L + sizeof(u64)) > msc->mapped_hwpage_sz);
+	WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
+
+	__mpam_write_reg(msc, MSMON_MBWU_L, 0);
+	__mpam_write_reg(msc, MSMON_MBWU_L + 4, 0);
+}
+
 static void gen_msmon_ctl_flt_vals(struct mon_read *m, u32 *ctl_val,
 				   u32 *flt_val)
 {
@@ -1045,6 +1087,7 @@ static void read_msmon_ctl_flt_vals(struct mon_read *m, u32 *ctl_val,
 static void clean_msmon_ctl_val(u32 *cur_ctl)
 {
 	*cur_ctl &= ~MSMON_CFG_x_CTL_OFLOW_STATUS;
+	*cur_ctl &= ~MSMON_CFG_x_CTL_OFLOW_STATUS_L;
 }
 
 static void write_msmon_ctl_flt_vals(struct mon_read *m, u32 ctl_val,
@@ -1067,7 +1110,11 @@ static void write_msmon_ctl_flt_vals(struct mon_read *m, u32 ctl_val,
 	case mpam_feat_msmon_mbwu:
 		mpam_write_monsel_reg(msc, CFG_MBWU_FLT, flt_val);
 		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, ctl_val);
-		mpam_write_monsel_reg(msc, MBWU, 0);
+		if (mpam_ris_has_mbwu_long_counter(m->ris))
+			mpam_msc_zero_mbwu_l(m->ris->vmsc->msc);
+		else
+			mpam_write_monsel_reg(msc, MBWU, 0);
+
 		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, ctl_val | MSMON_CFG_x_CTL_EN);
 
 		mbwu_state = &m->ris->mbwu_state[m->ctx->mon];
@@ -1082,8 +1129,13 @@ static void write_msmon_ctl_flt_vals(struct mon_read *m, u32 ctl_val,
 
 static u64 mpam_msmon_overflow_val(struct mpam_msc_ris *ris)
 {
-	/* TODO: scaling, and long counters */
-	return GENMASK_ULL(30, 0);
+	/* TODO: implement scaling counters */
+	if (mpam_has_feature(mpam_feat_msmon_mbwu_63counter, &ris->props))
+		return GENMASK_ULL(62, 0);
+	else if (mpam_has_feature(mpam_feat_msmon_mbwu_44counter, &ris->props))
+		return GENMASK_ULL(43, 0);
+	else
+		return GENMASK_ULL(30, 0);
 }
 
 /* Call with MSC lock held */
@@ -1125,10 +1177,24 @@ static void __ris_msmon_read(void *arg)
 		now = FIELD_GET(MSMON___VALUE, now);
 		break;
 	case mpam_feat_msmon_mbwu:
-		now = mpam_read_monsel_reg(msc, MBWU);
-		if (mpam_has_feature(mpam_feat_msmon_mbwu_hw_nrdy, rprops))
-			nrdy = now & MSMON___NRDY;
-		now = FIELD_GET(MSMON___VALUE, now);
+		/*
+		 * If long or lwd counters are supported, use them, else revert
+		 * to the 32 bit counter.
+		 */
+		if (mpam_ris_has_mbwu_long_counter(ris)) {
+			now = mpam_msc_read_mbwu_l(msc);
+			if (mpam_has_feature(mpam_feat_msmon_mbwu_hw_nrdy, rprops))
+				nrdy = now & MSMON___NRDY_L;
+			if (mpam_has_feature(mpam_feat_msmon_mbwu_63counter, rprops))
+				now = FIELD_GET(MSMON___LWD_VALUE, now);
+			else
+				now = FIELD_GET(MSMON___L_VALUE, now);
+		} else {
+			now = mpam_read_monsel_reg(msc, MBWU);
+			if (mpam_has_feature(mpam_feat_msmon_mbwu_hw_nrdy, rprops))
+				nrdy = now & MSMON___NRDY;
+			now = FIELD_GET(MSMON___VALUE, now);
+		}
 
 		if (nrdy)
 			break;
@@ -1421,8 +1487,13 @@ static int mpam_save_mbwu_state(void *arg)
 		cur_ctl = mpam_read_monsel_reg(msc, CFG_MBWU_CTL);
 		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
 
-		val = mpam_read_monsel_reg(msc, MBWU);
-		mpam_write_monsel_reg(msc, MBWU, 0);
+		if (mpam_ris_has_mbwu_long_counter(ris)) {
+			val = mpam_msc_read_mbwu_l(msc);
+			mpam_msc_zero_mbwu_l(msc);
+		} else {
+			val = mpam_read_monsel_reg(msc, MBWU);
+			mpam_write_monsel_reg(msc, MBWU, 0);
+		}
 
 		cfg->mon = i;
 		cfg->pmg = FIELD_GET(MSMON_CFG_MBWU_FLT_PMG, cur_flt);
diff --git a/drivers/platform/arm64/mpam/mpam_internal.h b/drivers/platform/arm64/mpam/mpam_internal.h
index fc705801c1b6..4553616f2f67 100644
--- a/drivers/platform/arm64/mpam/mpam_internal.h
+++ b/drivers/platform/arm64/mpam/mpam_internal.h
@@ -178,7 +178,6 @@ enum mpam_device_features {
 	mpam_feat_msmon_csu,
 	mpam_feat_msmon_csu_capture,
 	mpam_feat_msmon_csu_hw_nrdy,
-
 	/*
 	 * Having mpam_feat_msmon_mbwu set doesn't mean the regular 31 bit MBWU
 	 * counter would be used. The exact counter used is decided based on the
@@ -457,6 +456,8 @@ int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 cache_level,
 #define MSMON_CSU_CAPTURE       0x0848  /* last cache-usage value captured */
 #define MSMON_MBWU              0x0860  /* current mem-bw usage value */
 #define MSMON_MBWU_CAPTURE      0x0868  /* last mem-bw value captured */
+#define MSMON_MBWU_L		0x0880  /* current long mem-bw usage value */
+#define MSMON_MBWU_CAPTURE_L	0x0890  /* last long mem-bw value captured */
 #define MSMON_CAPT_EVNT         0x0808  /* signal a capture event */
 #define MPAMF_ESR               0x00F8  /* error status register */
 #define MPAMF_ECR               0x00F0  /* error control register */
@@ -674,7 +675,10 @@ int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 cache_level,
  */
 #define MSMON___VALUE          GENMASK(30, 0)
 #define MSMON___NRDY           BIT(31)
-#define MSMON_MBWU_L_VALUE     GENMASK(62, 0)
+#define MSMON___NRDY_L		BIT(63)
+#define MSMON___L_VALUE		GENMASK(43, 0)
+#define MSMON___LWD_VALUE	GENMASK(62, 0)
+
 /*
  * MSMON_CAPT_EVNT - Memory system performance monitoring capture event
  *                  generation register
-- 
2.39.5


