Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72333C5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 11:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iSsTtarhuQa/+w5hFVU5E7D0K2j1DMzYFWHnF5TkviI=; b=FrJmTqyu+41Vj6A9Qw1h1oBr7n
	rKgXuJix04T1ffpZgrxGlKXGsOIR4hdJ7CsVGT5rX9Gpkajw0GnNBWjmiGFR1g7AL1W0lLlPmy/DF
	VGfguFhr4r6U8pfP930GYHxQ48x/SqwWheUN3hiwsPjcXEydyHv+ZwpbaWpdvEjBjkUYGD240JhqF
	P6ub2CX3jdvcm97RVYs0hgO+gQh1pALIVJTHk9SZVT8L6MVfd+R7q6PRpGGkgkfByq8xNaKkUScWq
	3AeBPJAc5pekjw39e0/hdFjYRWuibP67r5Ht56cj4cF7ndCTJRYP+50bLAONXpuCJVcgyJNMcdi2U
	ePlR/VaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwe1s-00000009bNI-1sMp;
	Wed, 19 Aug 2026 11:00:20 +0000
Received: from mail-m32105.qiye.163.com ([220.197.32.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwe1o-00000009bMa-0oFO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 11:00:19 +0000
Received: from localhost.localdomain (unknown [122.224.147.158])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4a8ff1e52;
	Wed, 19 Aug 2026 18:54:56 +0800 (GMT+08:00)
From: Shouping Wang <allen.wang@hj-micro.com>
To: will@kernel.org,
	robin.murphy@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mark.rutland@arm.com,
	peter.du@hj-micro.com,
	andy.xu@hj-micro.com,
	allen.wang@hj-micro.com
Subject: [PATCH] perf/arm-cmn: Fix {wp_dev_sel2, wp_dev_sel} limited to 0/1 when MXP_MULTIPLE_DTM_EN is TRUE
Date: Wed, 19 Aug 2026 18:54:43 +0800
Message-ID: <20260819105443.668784-1-allen.wang@hj-micro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa019a8ee1e09d8kunmc5bd91ee17deb6
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGUIYVhoYS0IeQkJJSE9LGFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKSUlVSUlPVUpPTFVKTkNZV1kWGg8SFR0UWUFZT0tIVU
	pLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=cP82gNpUdVxwehtiohki+VsHpHr6hsZKe0W9I+ovXh975iifoKxStVJZuvPQu+91Dxdw0F/9rEpRhtnxLAQaoKBm99VCIG4qTvJUH5pEg+9nAE62op0WOWb5Eo9KGWpbx5wozkoU+siYtOuJlZKlWJEXzM9PMo1H+WbK11cK7ns=; c=relaxed/relaxed; s=default; d=hj-micro.com; v=1;
	bh=iSsTtarhuQa/+w5hFVU5E7D0K2j1DMzYFWHnF5TkviI=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_040018_391007_44F140C1 
X-CRM114-Status: GOOD (  10.05  )
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

When MXP_MULTIPLE_DTM_EN is TRUE, each DTM will monitor at most
two device ports. In this case, {wp_dev_sel2, wp_dev_sel} will
only use values 2'b00 and 2'b01 per DTM.

Previously the setting allowed values beyond the supported range
per DTM, which could cause each DTM to select invalid ports when
MXP_MULTIPLE_DTM_EN is TRUE.

Fix this by applying `dev %= 2` to clamp the selection value to
the valid range when MXP_MULTIPLE_DTM_EN is TRUE.

Fixes: 60d1504070c2 ("perf/arm-cmn: Support new IP features")
Signed-off-by: Shouping Wang <allen.wang@hj-micro.com>
---
 drivers/perf/arm-cmn.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index 40c05c519a1d..13ccbf2a7345 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -1392,6 +1392,7 @@ static void arm_cmn_claim_wp_idx(struct arm_cmn_dtm *dtm,
 
 static u32 arm_cmn_wp_config(struct perf_event *event, int wp_idx)
 {
+	struct arm_cmn *cmn = to_cmn(event->pmu);
 	u32 config;
 	u32 dev = CMN_EVENT_WP_DEV_SEL(event);
 	u32 chn = CMN_EVENT_WP_CHN_SEL(event);
@@ -1404,6 +1405,9 @@ static u32 arm_cmn_wp_config(struct perf_event *event, int wp_idx)
 	if (is_cmn600)
 		grp &= 1;
 
+	if (cmn->multi_dtm)
+		dev %=  2;
+
 	config = FIELD_PREP(CMN_DTM_WPn_CONFIG_WP_DEV_SEL, dev) |
 		 FIELD_PREP(CMN_DTM_WPn_CONFIG_WP_CHN_SEL, chn) |
 		 FIELD_PREP(CMN_DTM_WPn_CONFIG_WP_GRP, grp) |
-- 
2.43.0


