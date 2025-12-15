Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB241D5B16E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 13:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KaitDtZvJnhIr1BMl0UdU657ys+0GzfIH7vfV7X8DXo=; b=kBewZfhV0mLRuwO0vLWyRxIs6t
	UXxambIzNekI8Z1taKZ4p+9QyPGu9OSL27FtOufxuVjzi27Z2iPI/8D5r/2n1A+oe0D5JVpwupX10
	8K23eOQRMEPTYdiCBQvgKo47SiNiFgKCGoOg3OTocqI+8Q1HevRZdUal1GG2a3DAq6pOQ7Gi7/KFW
	TdgC8U/HVJlnNs/euD1qpgc24ZzoOS365pCbt2RzW9ycaNN5dDwlmcRpPd7XADCZajz9rScNkpKFs
	QTUyM6uGg0I06CJw6LnwmYONa2y4jBpGQp/QvYwKl7pgXQsMcv6TBOhnXYQDxXC8u3dMjZul7nDRQ
	bZJRVZUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV8GM-00000003fNa-02Sj;
	Mon, 15 Dec 2025 13:05:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV8GG-00000003fLF-1Xca
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 13:05:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3BFF0165C;
	Mon, 15 Dec 2025 05:05:04 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.95])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5DBFB3F73B;
	Mon, 15 Dec 2025 05:05:10 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Cc: mark.rutland@arm.com,
	suzuki.poulose@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH 3/3] perf/arm_dsu: Allow standard cycles events
Date: Mon, 15 Dec 2025 13:05:00 +0000
Message-Id: <1a7d3708fec84fd292d6e8414e65984b020f99ad.1765802897.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1765802897.git.robin.murphy@arm.com>
References: <cover.1765802897.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_050512_439428_7E5B376D 
X-CRM114-Status: GOOD (  10.84  )
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

Since we do not use the divide-by-64 option, there should be no
significant difference between the dedicated cycle counter and the
standard cycles event. Since using the latter on DSU-120 now has
the side-effect of allowing multiple cycles events to be scheduled
simultaneously (beneficial for multiple cycle-based metrics), there
seems little reason not to allow the same on older DSUs as well.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm_dsu_pmu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/perf/arm_dsu_pmu.c b/drivers/perf/arm_dsu_pmu.c
index 56c592f0dae3..32b0dd7c693b 100644
--- a/drivers/perf/arm_dsu_pmu.c
+++ b/drivers/perf/arm_dsu_pmu.c
@@ -284,9 +284,8 @@ static int dsu_pmu_get_event_idx(struct dsu_hw_events *hw_events,
 	unsigned long *used_mask = hw_events->used_mask;
 
 	if (evtype == DSU_PMU_EVT_CYCLES && dsu_pmu->has_pmccntr) {
-		if (test_and_set_bit(DSU_PMU_IDX_CYCLE_COUNTER, used_mask))
-			return -EAGAIN;
-		return DSU_PMU_IDX_CYCLE_COUNTER;
+		if (!test_and_set_bit(DSU_PMU_IDX_CYCLE_COUNTER, used_mask))
+			return DSU_PMU_IDX_CYCLE_COUNTER;
 	}
 
 	idx = find_first_zero_bit(used_mask, dsu_pmu->num_counters);
-- 
2.39.2.101.g768bb238c484.dirty


