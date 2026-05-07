Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12DDFCD343B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 06:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tavSIncRGrNJHQl5vLDBA/vQ3CjL1RwZuizxVlTGWb4=; b=Vtx/vDG0sUMoZacbP822gW6pY5
	hIratVs0XKkTsczp1qu39DfQBkFppPBYc+7rc3tYAI4ne2mDVOM48RmysxYGYot3fVvrC/I00IY4I
	DRiP0dN6l2DbabR1rLgjlwHyrMJoqd8IQdltLwCLfS57qd0iWlOXke+zUuMVWVyWlYjBaNc0DDATI
	3v8dncPX3kqjz9Wh8jqIBmP/F0jBxNThsUTJgeDVf+5Smhja4W3vXu/qFNoXMLbUunrJlspSIOU3m
	ts1ZSpOTxYFCP5VIv72CKDXRCY+/QoVeizHdcqQTjVsrp7DYi+isFRnoerPHecYyIqr534oNi1L8W
	Rs5/AyGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKsMm-00000002uiI-2o5E;
	Thu, 07 May 2026 06:37:48 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKsMk-00000002ufI-2bEe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 06:37:47 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=tavSIncRGrNJHQl5vLDBA/vQ3CjL1RwZuizxVlTGWb4=;
	b=QAaXfvgfLZBcV5BuOemObCVuRQ+f+oq8VPQg5mps2gajMvSf9mdtLduIsVnJfz+o4v/Nr1phE
	AUWDc1lq1tm8/oggeKyIt97d0NaMkNg9NlRQsqwuswGsrdWXu2kCj5/gkZjoB+3gE9yelqv/2rZ
	vdelzoC3s8JiXrWP6eVM0JM=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4gB2SS3HJYzpT04;
	Thu,  7 May 2026 14:30:48 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 310A020226;
	Thu,  7 May 2026 14:37:39 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 7 May 2026 14:37:38 +0800
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Thu, 7 May 2026 14:37:38 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<namhyung@kernel.org>, <mark.rutland@arm.com>,
	<alexander.shishkin@linux.intel.com>, <jolsa@kernel.org>,
	<irogers@google.com>, <adrian.hunter@intel.com>, <james.clark@arm.com>,
	<john.g.garry@oracle.com>, <will@kernel.org>, <mike.leach@arm.com>,
	<linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <jic23@kernel.org>, <leo.yan@linux.dev>, <robin.murphy@arm.com>,
	<linuxarm@huawei.com>, <hejunhao3@huawei.com>, <prime.zeng@hisilicon.com>,
	<fanghao11@huawei.com>, <wangzhou1@hisilicon.com>, <wangyushan12@huawei.com>
Subject: [RFT PATCH v2 1/7] perf stat: Check color's length instead of the pointer
Date: Thu, 7 May 2026 14:37:31 +0800
Message-ID: <20260507063737.3542950-2-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260507063737.3542950-1-wangyushan12@huawei.com>
References: <20260507063737.3542950-1-wangyushan12@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_233747_282793_AC00A793 
X-CRM114-Status: GOOD (  11.25  )
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

Color string returned by metric_threshold_classify__color() is never
NULL, check the presence of *color will always return true.

Fix this by change the checks against length of *color.

Fixes: 37b77ae95416 ("perf stat: Change color to threshold in print_metric")
Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
---
 tools/perf/builtin-script.c    | 2 +-
 tools/perf/util/stat-display.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/builtin-script.c b/tools/perf/builtin-script.c
index c8ac9f01a36b..58cd5cd377a6 100644
--- a/tools/perf/builtin-script.c
+++ b/tools/perf/builtin-script.c
@@ -2111,7 +2111,7 @@ static void script_print_metric(struct perf_stat_config *config __maybe_unused,
 	perf_sample__fprintf_start(NULL, mctx->sample, mctx->thread, mctx->evsel,
 				   PERF_RECORD_SAMPLE, mctx->fp);
 	fputs("\tmetric: ", mctx->fp);
-	if (color)
+	if (strlen(color))
 		color_fprintf(mctx->fp, color, fmt, val);
 	else
 		printf(fmt, val);
diff --git a/tools/perf/util/stat-display.c b/tools/perf/util/stat-display.c
index 993f4c4b8f44..74cba80c24b0 100644
--- a/tools/perf/util/stat-display.c
+++ b/tools/perf/util/stat-display.c
@@ -474,7 +474,7 @@ static void print_metric_std(struct perf_stat_config *config,
 		do_new_line_std(config, os);
 
 	n = fprintf(out, " # ");
-	if (color)
+	if (strlen(color))
 		n += color_fprintf(out, color, fmt, val);
 	else
 		n += fprintf(out, fmt, val);
@@ -607,7 +607,7 @@ static void print_metric_only(struct perf_stat_config *config,
 	if (mlen < strlen(unit))
 		mlen = strlen(unit) + 1;
 
-	if (color)
+	if (strlen(color))
 		mlen += strlen(color) + sizeof(PERF_COLOR_RESET) - 1;
 
 	color_snprintf(str, sizeof(str), color ?: "", fmt ?: "", val);
-- 
2.33.0


