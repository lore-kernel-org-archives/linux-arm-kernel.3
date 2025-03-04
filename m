Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159F2C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Zdl3m0pBbzgVL8J5acPwWHWdz4qmJzVwAJGbgXmMDM=; b=BtgHFjREFJtRpAK71WOKrNdQCH
	AwkHqJU1ZskxE5QBtFieaOTgXqF9mFMGtZf1VbjFA2RBp6Sa7YxNwu6C5e/G5VnAsahmZ09aQf1lW
	eMU/afoHQPc/4K9sHO5TCkmLw2GQ+wsC6ihoQ9PBygwCtuvSbn0zymAAvGPnwB1ZHaoBsKAoz7Og1
	h3MBpt3EaD6R7G78/bO1t1Sc8pgkoJU6ZIGXeqeDgwE0RK5QGwhCbjp4/qwndE830E/Gq2tCIk+ql
	RhZ/vxlvLz7ygrnxHE+Q8oA9TCMtDabX+ul4nookN+/FZlFwmO7jWMQv/CZ3IbQr3QRnr8hZ30q/k
	ICIezuTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR5T-00000004Xmp-3wpe;
	Tue, 04 Mar 2025 12:09:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpQD5-00000004M3G-111E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 11:13:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A67FFFEC;
	Tue,  4 Mar 2025 03:13:28 -0800 (PST)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ABDAC3F5A1;
	Tue,  4 Mar 2025 03:13:12 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Graham Woodward <graham.woodward@arm.com>,
	Paschalis.Mpeis@arm.com,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v4 10/12] perf arm-spe: Set sample flags with supplement info
Date: Tue,  4 Mar 2025 11:12:38 +0000
Message-Id: <20250304111240.3378214-11-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304111240.3378214-1-leo.yan@arm.com>
References: <20250304111240.3378214-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_031315_375605_975E5369 
X-CRM114-Status: GOOD (  10.30  )
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

Based on the supplement information in the record, this commit sets the
sample flags for conditional branch, function call, return.  It also
sets events in flags, such as mispredict, not taken, and in transaction.

Reviewed-by: Ian Rogers <irogers@google.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index 0e8e05c87fd7..daecf9e1017a 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -484,6 +484,26 @@ static void arm_spe__sample_flags(struct arm_spe_queue *speq)
 
 		if (record->type & ARM_SPE_BRANCH_MISS)
 			speq->flags |= PERF_IP_FLAG_BRANCH_MISS;
+
+		if (record->type & ARM_SPE_BRANCH_NOT_TAKEN)
+			speq->flags |= PERF_IP_FLAG_NOT_TAKEN;
+
+		if (record->type & ARM_SPE_IN_TXN)
+			speq->flags |= PERF_IP_FLAG_IN_TX;
+
+		if (record->op & ARM_SPE_OP_BR_COND)
+			speq->flags |= PERF_IP_FLAG_CONDITIONAL;
+
+		if (record->op & ARM_SPE_OP_BR_CR_BL)
+			speq->flags |= PERF_IP_FLAG_CALL;
+		else if (record->op & ARM_SPE_OP_BR_CR_RET)
+			speq->flags |= PERF_IP_FLAG_RETURN;
+		/*
+		 * Indirect branch instruction without link (e.g. BR),
+		 * take it as a function return.
+		 */
+		else if (record->op & ARM_SPE_OP_BR_INDIRECT)
+			speq->flags |= PERF_IP_FLAG_RETURN;
 	}
 }
 
-- 
2.34.1


