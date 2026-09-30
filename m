Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B28CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 23:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OeIJ3O0U+r0Rl3V651EIIueM+T9lKIRL2Db35zQlHz8=; b=chYcA2dgQYb5U8Ptty5Nkc6lTB
	kM7dwLnzAEO3jiOE/xS6DnzSlz0mN4UO8E4MQHdrqJCLHaNkb+ptgG+JcJhadRpEPNdZzrxkfHnDp
	S1XXYK7vJN4Jm0k1sh2WuI2XnY7jJRNtAdjp5qN6W9jNlf+EOt98VnFsEJSfhJkk6no1Sc3JTQ8+1
	HM972ZiTQ6psRGQFXp6zOXp11F/DvisPo9TIjacnzxG4TJvTJxLcrwyq8XcwVlBtsIdKadZ9Z5PM9
	3R6YWJNwIUhZY9okqJ+9ltHzLRsLtb42wleCVjHde3zN3ImSy3+k15fQ62c8QVSJ9wZahYW7GAlWQ
	sM6v1rXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC3Sz-00000007QzC-1X50;
	Wed, 30 Sep 2026 23:12:01 +0000
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com ([50.112.246.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC3Sq-00000007Qxa-1ieS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 23:11:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790809912; x=1822345912;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OeIJ3O0U+r0Rl3V651EIIueM+T9lKIRL2Db35zQlHz8=;
  b=Ecajmj7enHTaJsJG0xDn4PAOe2nU4z6BB8ws0jTBWFCWmkBmbGBN93Wg
   jonUGy/RP1Zd5ZVhsjX/AjftU0JUNihignF46lYzRvX2dnMlm4bIjU2j3
   hn67hX5p8mQxWtXQhRqIAHi5WwHE/FfQlwIHaR+Rk5d2MJfhtWhqlXe6v
   4F+Ojv3EOK0xlgbHqG3rGmrVLOvTK4gfi4C2OZ8tVi1gyeRUpJZas6KCN
   qh9Gju2KpkxtBaHJ0/6y+O5edSSf6zLHakTN06cVgdELScL5Z82ExP2xG
   b5EchgT50U/Ged/t+hEJ77fx3zUucBs7JC39OGm6+CzKzoB+8+OdlIfK2
   w==;
X-CSE-ConnectionGUID: iP5fGfNTS/qNGjiL1G1XrQ==
X-CSE-MsgGUID: Vd6MpAqzTaKdq5m82A39yQ==
X-IronPort-AV: E=Sophos;i="6.27,133,1787011200"; 
   d="scan'208";a="29861899"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 23:11:49 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:10475]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.43.208:2525] with esmtp (Farcaster)
 id 83cd9eaf-0b34-4051-8754-af499e1c55f9; Wed, 30 Sep 2026 23:11:49 +0000 (UTC)
X-Farcaster-Flow-ID: 83cd9eaf-0b34-4051-8754-af499e1c55f9
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Wed, 30 Sep 2026 23:11:48 +0000
Received: from u34cccd802f2d52.amazon.com (10.106.239.10) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Wed, 30 Sep 2026 23:11:47 +0000
From: Haris Okanovic <harisokn@amazon.com>
To: <robin.murphy@arm.com>, <mark.rutland@arm.com>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<harisokn@amazon.com>
Subject: [PATCH v2 1/2] perf/arm-cmn: Don't schedule events on a CPU which no longer owns the PMU
Date: Wed, 30 Sep 2026 18:11:26 -0500
Message-ID: <20260930231127.3094040-2-harisokn@amazon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930231127.3094040-1-harisokn@amazon.com>
References: <20260930231127.3094040-1-harisokn@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.106.239.10]
X-ClientProxiedBy: EX19D037UWC004.ant.amazon.com (10.13.139.254) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_161152_502508_5EFA92D0 
X-CRM114-Status: GOOD (  14.36  )
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

perf_event_open() can latch cmn->cpu and then install the event after a
migration has already moved the PMU. The driver has no locking -- it
relies on all events living in one CPU's context -- so such an event
races the owning CPU and can corrupt the shared DTC and DTM state,
giving wrong counts. arm_cmn_event_add() now rejects an event which is
not on the owning CPU.

arm_cmn_migrate() now claims cmn->cpu before migrating, so that events
it reinstalls via perf_pmu_migrate_context() still pass that check.

Signed-off-by: Haris Okanovic <harisokn@amazon.com>
---
 drivers/perf/arm-cmn.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index 5378fba916cf5..a5593e5821925 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -2112,6 +2112,9 @@ static int arm_cmn_event_add(struct perf_event *event, int flags)
 	enum cmn_node_type type = CMN_EVENT_TYPE(event);
 	unsigned int input_sel, i = 0;
 
+	if (cmn->cpu != smp_processor_id())
+		return -ENOENT;
+
 	if (type == CMN_TYPE_DTC) {
 		while (cmn->dtc[i].cycles)
 			if (++i == cmn->num_dtcs)
@@ -2245,12 +2248,12 @@ static int arm_cmn_commit_txn(struct pmu *pmu)
 
 static void arm_cmn_migrate(struct arm_cmn *cmn, unsigned int cpu)
 {
-	unsigned int i;
+	unsigned int i, old = cmn->cpu;
 
-	perf_pmu_migrate_context(&cmn->pmu, cmn->cpu, cpu);
+	cmn->cpu = cpu;
+	perf_pmu_migrate_context(&cmn->pmu, old, cpu);
 	for (i = 0; i < cmn->num_dtcs; i++)
 		irq_set_affinity(cmn->dtc[i].irq, cpumask_of(cpu));
-	cmn->cpu = cpu;
 }
 
 static int arm_cmn_pmu_online_cpu(unsigned int cpu, struct hlist_node *cpuhp_node)
-- 
Haris Okanovic
AWS Graviton


