Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A3E8C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 14:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oS4cP/37BKCIxr7wTECjEXBITtQEyQd6aYA2V5M7cZg=; b=4+lIHtXRDHY6nL7Es7poJJay9V
	GZByqUoEZhL97kl7/claxR1eR7yMvqz+Cv8HwvJhGBeZKmJcvVA6w73akRMZwiGdQ3u8Yt6wjrkrj
	xDa5HfUu7QVqdloxEDoBOtLnCOexMIY98To6GUfq0X3n1IK1qgnfi70TX/HuBrwYHuNjB1yOymkKB
	ZloV2xlr97ZW/2nlJCaK+/y4X8XpVulvIV1kmXwmVPDoAgE2qwMivcZ+oLC8c0F7rnmobyPRNEIUy
	s1rHMgpFo/XIY/HgwWDBfz/qJJqu1fTWPFTg/kVR/LDOeEejdAiK5t3AI1u9YBOtA8Xhfno/RIsQL
	M6mUrq3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuY19-00000006C3C-0CqN;
	Tue, 18 Mar 2025 14:34:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuXzR-00000006Bqg-18JL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 14:32:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02E4313D5;
	Tue, 18 Mar 2025 07:32:28 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B08503F694;
	Tue, 18 Mar 2025 07:32:18 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Cc: mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH Resend] perf/arm-cmn: Remove CMN-600 DTC domain special case
Date: Tue, 18 Mar 2025 14:32:10 +0000
Message-Id: <67985e39f53b56385d79a4f1264cf7f9cacedb58.1742308248.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_073221_351110_4B81F59A 
X-CRM114-Status: UNSURE (   8.49  )
X-CRM114-Notice: Please train this message.
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

The special case for trying to infer the DTC domain for DTC-adjacent
nodes on CMN-600 is fragile and buggy - currently resulting in subtly
messed up DTC counter allocation - and the theoretical benefit it
offers to a tiny minority of use-cases arguably doesn't outweigh the
inconsistency it offers to others anyway. Just get rid of it.

Fixes: ab33c66fd8f1 ("perf/arm-cmn: Enable per-DTC counter allocation")
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm-cmn.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index ef959e66db7c..582f0c0e1783 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -2166,13 +2166,6 @@ static int arm_cmn_init_dtcs(struct arm_cmn *cmn)
 
 	cmn->xps = arm_cmn_node(cmn, CMN_TYPE_XP);
 
-	if (cmn->part == PART_CMN600 && cmn->num_dtcs > 1) {
-		/* We do at least know that a DTC's XP must be in that DTC's domain */
-		dn = arm_cmn_node(cmn, CMN_TYPE_DTC);
-		for (int i = 0; i < cmn->num_dtcs; i++)
-			arm_cmn_node_to_xp(cmn, dn + i)->dtc = i;
-	}
-
 	for (dn = cmn->dns; dn->type; dn++) {
 		if (dn->type == CMN_TYPE_XP)
 			continue;
-- 
2.39.2.101.g768bb238c484.dirty


