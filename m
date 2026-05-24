Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75DB7CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 15:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NM1d+x3ZEOkfi/top3uQVI3R3Gs2qSxV34vfqPt1/8E=; b=wxPQB6PH9Xe8fmbjQ/V5VgVq+t
	EC6kXxocOd/m/2wp7b8KNrvDujOvyGnDXZEbPSOZBSJfBNpmANxTA1kzQSWPcSg/5whxNf0TUJoyB
	Rxe4Uz+aPjJl4BzAFlxQZ0zmANa2EAhXYPpGOOebvtxaj8mEGHz4UOTio6U02jMRfhIUHLfhjROzh
	qdk3vUwClXl9n94L/aB8XGXtaVEIXYqrcONkEggDJ2G9CG26adn2Nsim3YuQN8vvRgqwuY11NEop5
	aXW+6lX3B6OquPOV9jvBbCZPs2B1xKQaWnD3Y/N1Nw0PpLgfh/6rBjd2rNugyftU5rR+8jmZ3DfkE
	D+v1dS4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRAvG-0000000FC5F-2sGF;
	Sun, 24 May 2026 15:39:26 +0000
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com ([50.112.246.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRAuz-0000000FC0v-40Ws
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 15:39:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1779637149; x=1811173149;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NM1d+x3ZEOkfi/top3uQVI3R3Gs2qSxV34vfqPt1/8E=;
  b=rs9rFUMrIC1fb5zMMhWuIMGQxPynJ56vqxioUXbT+bhhbiC2bxbD7MHh
   mUnvSdONwJy6NtBoz/FA4B11Ff3Lzru1Q2E9F/+gXFGCuck0RRjfklTOI
   VQEUGGXbeBlqVaJz6VmHJRsVPdNtc+xJ8qdMekxJTJO3VaS0nRxoUybb4
   bGwiyKwSWk/xnL7y8mKgscYgIdXMkiyDcjodU/G8wPJOfFI0P0vSr4A1r
   k1A3dR+exxmvS99H7rxzTbkjbBhLL8SQrsRCbEVr7e4zPY7dZHlCCV+S5
   u1Y9lu1wD34RDUfuYH53yqPeTbtoih3TvJtbefl4EHjdfHBhk30XWmh4J
   A==;
X-CSE-ConnectionGUID: 1M/LgooGTmWRFVaRNORNQw==
X-CSE-MsgGUID: OhByuXCaT3qYp/2APDOchg==
X-IronPort-AV: E=Sophos;i="6.24,166,1774310400"; 
   d="scan'208";a="20184346"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 15:39:04 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:6170]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.8.249:2525] with esmtp (Farcaster)
 id a00ae900-5922-41c7-bf0c-abb183f9615f; Sun, 24 May 2026 15:39:03 +0000 (UTC)
X-Farcaster-Flow-ID: a00ae900-5922-41c7-bf0c-abb183f9615f
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sun, 24 May 2026 15:39:02 +0000
Received: from dev-dsk-avivb-1b-e28f450e.eu-west-1.amazon.com (10.15.33.9) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sun, 24 May 2026 15:39:00 +0000
From: Aviv Bakal <avivb@amazon.com>
To: <robin.murphy@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<avivb@amazon.com>, <zeev@amazon.com>, <blakgeof@amazon.com>
Subject: [PATCH v3 1/2] perf/arm-cmn: Move struct arm_cmn_hw_event into struct hw_perf_event
Date: Sun, 24 May 2026 18:38:47 +0300
Message-ID: <20260524153848.16334-2-avivb@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260524153848.16334-1-avivb@amazon.com>
References: <20260504133923.23373-1-avivb@amazon.com>
 <20260524153848.16334-1-avivb@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.15.33.9]
X-ClientProxiedBy: EX19D033UWC004.ant.amazon.com (10.13.139.225) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_083910_042926_94658F1C 
X-CRM114-Status: GOOD (  17.06  )
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

In order to increase CMN_MAX_DIMENSION beyond 12 (required for meshes
larger than 12x12, such as Graviton5), the arm_cmn_hw_event struct must
grow. Since it is overlaid on the beginning of hw_perf_event via an
unsafe cast, increasing its size would violate the static_assert that
guards against overflowing into the 'target' field.

Resolve this by moving struct arm_cmn_hw_event into the hw_perf_event
union as a proper named member, eliminating the cast in to_cmn_hw() and
making the size reservation explicit. Set CMN_MAX_DIMENSION to 14 to
accommodate larger mesh topologies.

Signed-off-by: Aviv Bakal <avivb@amazon.com>
---
 drivers/perf/arm-cmn.c     | 26 +-------------------------
 include/linux/perf_event.h | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+), 25 deletions(-)

diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index f5305c8fdca4..3443b819afed 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -31,13 +31,8 @@
 #define CMN_CHILD_NODE_ADDR		GENMASK(29, 0)
 #define CMN_CHILD_NODE_EXTERNAL		BIT(31)
 
-#define CMN_MAX_DIMENSION		12
-#define CMN_MAX_XPS			(CMN_MAX_DIMENSION * CMN_MAX_DIMENSION)
 #define CMN_MAX_DTMS			(CMN_MAX_XPS + (CMN_MAX_DIMENSION - 1) * 4)
 
-/* Currently XPs are the node type we can have most of; others top out at 128 */
-#define CMN_MAX_NODES_PER_EVENT		CMN_MAX_XPS
-
 /* The CFG node has various info besides the discovery tree */
 #define CMN_CFGM_PERIPH_ID_01		0x0008
 #define CMN_CFGM_PID0_PART_0		GENMASK_ULL(7, 0)
@@ -148,7 +143,6 @@
 #define CMN_DT_PMSRR_SS_REQ		BIT(0)
 
 #define CMN_DT_NUM_COUNTERS		8
-#define CMN_MAX_DTCS			4
 
 /*
  * Even in the worst case a DTC counter can't wrap in fewer than 2^42 cycles,
@@ -595,24 +589,6 @@ static void arm_cmn_debugfs_init(struct arm_cmn *cmn, int id)
 static void arm_cmn_debugfs_init(struct arm_cmn *cmn, int id) {}
 #endif
 
-struct arm_cmn_hw_event {
-	struct arm_cmn_node *dn;
-	u64 dtm_idx[DIV_ROUND_UP(CMN_MAX_NODES_PER_EVENT * 2, 64)];
-	s8 dtc_idx[CMN_MAX_DTCS];
-	u8 num_dns;
-	u8 dtm_offset;
-
-	/*
-	 * WP config registers are divided to UP and DOWN events. We need to
-	 * keep to track only one of them.
-	 */
-	DECLARE_BITMAP(wp_idx, CMN_MAX_XPS);
-
-	bool wide_sel;
-	enum cmn_filter_select filter_sel;
-};
-static_assert(sizeof(struct arm_cmn_hw_event) <= offsetof(struct hw_perf_event, target));
-
 #define for_each_hw_dn(hw, dn, i) \
 	for (i = 0, dn = hw->dn; i < hw->num_dns; i++, dn++)
 
@@ -622,7 +598,7 @@ static_assert(sizeof(struct arm_cmn_hw_event) <= offsetof(struct hw_perf_event,
 
 static struct arm_cmn_hw_event *to_cmn_hw(struct perf_event *event)
 {
-	return (struct arm_cmn_hw_event *)&event->hw;
+	return &event->hw.cmn;
 }
 
 static void arm_cmn_set_index(u64 x[], unsigned int pos, unsigned int val)
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 48d851fbd8ea..c38576a8e338 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -119,6 +119,7 @@ struct perf_branch_stack {
 };
 
 struct task_struct;
+struct arm_cmn_node;
 
 /*
  * extra PMU register associated with an event
@@ -200,6 +201,27 @@ struct hw_perf_event {
 			u64	conf;
 			u64	conf1;
 		};
+#ifdef CONFIG_ARM_CMN
+/* Some implementations use a mesh larger than the architectural max of 12 */
+#define CMN_MAX_DIMENSION		14
+#define CMN_MAX_XPS			(CMN_MAX_DIMENSION * CMN_MAX_DIMENSION)
+#define CMN_MAX_NODES_PER_EVENT		CMN_MAX_XPS
+#define CMN_MAX_DTCS			4
+		struct arm_cmn_hw_event { /* arm_cmn */
+			/*
+			 * CMN PMU event state overlaid on hw_perf_event.
+			 * Must fit before the 'target' field.
+			 */
+			struct arm_cmn_node	*dn;
+			u64			dtm_idx[DIV_ROUND_UP(CMN_MAX_NODES_PER_EVENT * 2, 64)];
+			s8			dtc_idx[CMN_MAX_DTCS];
+			u8			num_dns;
+			u8			dtm_offset;
+			DECLARE_BITMAP(wp_idx, CMN_MAX_XPS);
+			bool			wide_sel;
+			int			filter_sel;
+		} cmn;
+#endif
 	};
 	/*
 	 * If the event is a per task event, this will point to the task in
-- 
2.47.3


