Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9A7C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 12:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OVia1H0zcOtVojQIeyu4YAQ40nY/t8MaBOxDDz1oE3w=; b=TSNC1iab0k9ngAkCiEZwVhAUTA
	rVGBoIMTlY+hfOFuIKBloLo6j1FSTGHvhDOzjbqL0ct+4/ULkAhbDHnDCpyz068QVulY31o31e97/
	R1WJLf0Bo/DmsYT5DB2gHQ/985x5VuxqHXvZVfVeW7sYkB0ZRRF4ACbRQWFvZYee9Humiz+tuK/Z4
	sXkiRgTsV5KPvd01moKiSMhmBwnxTx9sYe13+RORQOSU1Ki1s+TKboX7lnLHYsHcPKCMhUWMKFRrl
	v2sp8ZanpwanF7iAPO6hgJtC0nTRK21DU6ybHqMYfadsREoQQ9H0L/vy0MNINCjmqXPYcBTolKp+C
	gS/HJDoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfeXe-00000003Czw-2buZ;
	Wed, 05 Feb 2025 12:30:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfeKY-00000003A3g-2mv6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 12:16:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 001CF1007;
	Wed,  5 Feb 2025 04:16:58 -0800 (PST)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EC1643F63F;
	Wed,  5 Feb 2025 04:16:31 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>,
	Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Graham Woodward <graham.woodward@arm.com>
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v1 09/11] perf arm-spe: Set sample flags with supplement info
Date: Wed,  5 Feb 2025 12:15:53 +0000
Message-Id: <20250205121555.180606-10-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205121555.180606-1-leo.yan@arm.com>
References: <20250205121555.180606-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_041634_858525_7DBAB18C 
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

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index 12761c39788f..e1419aeed75c 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -470,6 +470,26 @@ static void arm_spe__sample_flags(struct arm_spe_queue *speq)
 
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


