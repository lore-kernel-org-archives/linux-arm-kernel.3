Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0982C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 14:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=53rr3CDYuzgx9l4SobdsL5u30FzC6mU+cVM3ZptSU04=; b=dhRGIxCEiBVze+fgW9r2vc1Mps
	Fe+k+4jWgtRFard1IMejFHkkpGRJ4TqyR0m4MwrP6AyIMtmvS26FBhU2ANoslb0vcR0xHd0qyyE5e
	Offvanurzue0daDy36QuojspNTs8a8Al6xPEGSsuqGyL4lReIHbJ8i6gxMIb2R5c+SOFrdzlgi0hw
	Jrv2rNSeanTE+oDODFMjEyq3+ZLrqt1Fc4oaGbdke2vwgTauWVmco9cQj6hEN0n5XPN/GHWtYfTk8
	mBS+yRHuuUbVknZquVJHPctErjMvveAimaFYtzUYGcl+95biPBLa3bqLArFPcEPMaxW3xZnrw7dcf
	qH4vT1ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg31L-00000006c5j-02rj;
	Thu, 06 Feb 2025 14:38:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2ns-00000006Yzq-30Q4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 14:24:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1C0E1063;
	Thu,  6 Feb 2025 06:24:49 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B28253F63F;
	Thu,  6 Feb 2025 06:24:25 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Cc: mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	ilkka@os.amperecomputing.com
Subject: [PATCH] perf/arm-cmn: Minor event type housekeeping
Date: Thu,  6 Feb 2025 14:24:04 +0000
Message-Id: <ef46a47fc4ab909093f14b2b4289a4835836ab6c.1738851844.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_062428_797629_1CE77828 
X-CRM114-Status: GOOD (  12.41  )
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

While handling RN-D nodes under the functionally-identical RN-I type
works fine for perf tool users using the "rnid_" event aliases, and that
is the documented and expected ABI, there's little reason not to be
permissive and accept the actual RN-D type as an additional encoding for
the same events as well. This may be convenient for other tooling
generating event configs directly from its own topology data.

In the RN-I event mood, it also seems as good a time as any to clean up
a forgotten macro for CCLA_RNI events which ended up being unnecessary.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm-cmn.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index ef959e66db7c..d4fe30ff225b 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -802,8 +802,6 @@ static umode_t arm_cmn_event_attr_is_visible(struct kobject *kobj,
 	CMN_EVENT_ATTR(_model, ccha_##_name, CMN_TYPE_CCHA, _event)
 #define CMN_EVENT_CCLA(_name, _event)				\
 	CMN_EVENT_ATTR(CMN_ANY, ccla_##_name, CMN_TYPE_CCLA, _event)
-#define CMN_EVENT_CCLA_RNI(_name, _event)				\
-	CMN_EVENT_ATTR(CMN_ANY, ccla_rni_##_name, CMN_TYPE_CCLA_RNI, _event)
 #define CMN_EVENT_HNS(_name, _event)				\
 	CMN_EVENT_ATTR(CMN_ANY, hns_##_name, CMN_TYPE_HNS, _event)
 
@@ -1798,6 +1796,9 @@ static int arm_cmn_event_init(struct perf_event *event)
 	} else if (type == CMN_TYPE_XP &&
 		   (cmn->part == PART_CMN700 || cmn->part == PART_CMN_S3)) {
 		hw->wide_sel = true;
+	} else if (type == CMN_TYPE_RND) {
+		/* Secretly permit this as an alias for "rnid" events */
+		type = CMN_TYPE_RNI;
 	}
 
 	/* This is sufficiently annoying to recalculate, so cache it */
-- 
2.39.2.101.g768bb238c484.dirty


