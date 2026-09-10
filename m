Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C373C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 11:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JtP12fD9RNAVyfG5BtMp8f1T+aWMSPi7iFymj737lEo=; b=pFvb/6aryo1XCskM9j+hnHxMPY
	E/idA7wLHhEy0u6STVK8vVAFLlarqRYn1plhXH5t+d11lvIbLzX3CS8CBj05sho7rabjh0kGaJftM
	p17OqmVDegkgw1Ja06nPTzwYvEElFPWsqb9OF4iiRyLC8NlMzC5WeMvLm7TQJYzxfhc2yTDn4hWIJ
	UVZaVihzZxOQNoRrgO1oFVAu+Sh3ExH3YA42YEbIyzfTdmDYDZ7weRXgcugVScSsF9l5jcj6VQ5rz
	2YvSfeTVAcAVUdwkDvvaFSc8mjK4geEcrJfwEhQJDK2XWs2BR9TKig8r0VEWXMVJtKzhNiADGqX/J
	o0TSNgmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dEl-0000000EFyM-2MSj;
	Thu, 10 Sep 2026 11:46:39 +0000
Received: from mail-m103131191167.xmail.ntesmail.com ([103.131.191.167])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dEc-0000000EFs0-2tvH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 11:46:33 +0000
Received: from localhost.localdomain (unknown [122.224.147.158])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d496048e;
	Thu, 10 Sep 2026 19:46:13 +0800 (GMT+08:00)
From: Shouping Wang <allen.wang@hj-micro.com>
To: robin.murphy@arm.com,
	will@kernel.org
Cc: mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	peter.du@hj-micro.com,
	andy.xu@hj-micro.com,
	allen.wang@hj-micro.com
Subject: [PATCH v2] perf/arm-cmn: Fix wp_dev_sel2 setting for multi-DTM configurations
Date: Thu, 10 Sep 2026 19:46:01 +0800
Message-ID: <20260910114601.165237-1-allen.wang@hj-micro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2fb3bda7-cd64-4dc0-99f8-c0fda8d42cf9@arm.com>
References: <2fb3bda7-cd64-4dc0-99f8-c0fda8d42cf9@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa08b23c9a409d8kunm705001594eab80
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZH0kZVkoaTU5CSB1OSRpLSlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKSUlVSUlPVUpPTFVKTkNZV1kWGg8SFR0UWUFZT0tIVU
	JCSU5LVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=eCDGr7sur2hFENqnVzpUbneaLM6v6XGlzZ9IlGCCuAhQXla7vsuVMdg1br0rpq6NvxqmyunxGvyKK5dpNP9F60rDT6u2UaTXABD4G8IZpYdKNGKvtWQHC/ePus3uc1fPABj6AQJLYjY21+8b1zNw4YLmHJfvaFPPka2k16PqRVw=; c=relaxed/relaxed; s=default; d=hj-micro.com; v=1;
	bh=JtP12fD9RNAVyfG5BtMp8f1T+aWMSPi7iFymj737lEo=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_044631_574114_BCAA836A 
X-CRM114-Status: GOOD (  11.85  )
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

Fix this by only setting CMN_DTM_WPn_CONFIG_WP_DEV_SEL2 when
!multi_dtm.

Fixes: 60d1504070c2 ("perf/arm-cmn: Support new IP features")
Signed-off-by: Shouping Wang <allen.wang@hj-micro.com>
---

Changes in v2:
- Made the setting of CMN_DTM_WPn_CONFIG_WP_DEV_SEL2 conditional on
  !multi_dtm, instead of clamping with dev %= 2.
- Refactored is_cmn600 to use cmn->part directly.
- Updated the commit message.

Link to v1: https://lore.kernel.org/lkml/20260819105443.668784-1-allen.wang@hj-micro.com/

 drivers/perf/arm-cmn.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index 6e5cc4086a9e..7e7590381171 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -1393,13 +1393,14 @@ static void arm_cmn_claim_wp_idx(struct arm_cmn_dtm *dtm,
 
 static u32 arm_cmn_wp_config(struct perf_event *event, int wp_idx)
 {
+	struct arm_cmn *cmn = to_cmn(event->pmu);
 	u32 config;
 	u32 dev = CMN_EVENT_WP_DEV_SEL(event);
 	u32 chn = CMN_EVENT_WP_CHN_SEL(event);
 	u32 grp = CMN_EVENT_WP_GRP(event);
 	u32 exc = CMN_EVENT_WP_EXCLUSIVE(event);
 	u32 combine = CMN_EVENT_WP_COMBINE(event);
-	bool is_cmn600 = to_cmn(event->pmu)->part == PART_CMN600;
+	bool is_cmn600 = cmn->part == PART_CMN600;
 
 	/* CMN-600 supports only primary and secondary matching groups */
 	if (is_cmn600)
@@ -1407,8 +1408,11 @@ static u32 arm_cmn_wp_config(struct perf_event *event, int wp_idx)
 
 	config = FIELD_PREP(CMN_DTM_WPn_CONFIG_WP_DEV_SEL, dev) |
 		 FIELD_PREP(CMN_DTM_WPn_CONFIG_WP_CHN_SEL, chn) |
-		 FIELD_PREP(CMN_DTM_WPn_CONFIG_WP_GRP, grp) |
-		 FIELD_PREP(CMN_DTM_WPn_CONFIG_WP_DEV_SEL2, dev >> 1);
+		 FIELD_PREP(CMN_DTM_WPn_CONFIG_WP_GRP, grp);
+
+	if (!cmn->multi_dtm)
+		config |= FIELD_PREP(CMN_DTM_WPn_CONFIG_WP_DEV_SEL2, dev >> 1);
+
 	if (exc)
 		config |= is_cmn600 ? CMN600_WPn_CONFIG_WP_EXCLUSIVE :
 				      CMN_DTM_WPn_CONFIG_WP_EXCLUSIVE;
-- 
2.43.0


