Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D22D6101A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 14:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UCqbHDu/zeH/gewCZC+csS/Fj0NjNsLtugcXm6v5/3U=; b=ZqlZz/YdhozJEwPWL23C+DRNJT
	bJp8zPowbhEgZ8bpIMedmEUF8E8/nEEMcPad9LeYCZDLKOxuChnzGJg3Pfo70YDf7YWbiGyZgdJps
	EyPSVL2GusmZq+pQsrUpC+z6lGxG1Nnt9jQhK7mr9s//FiUn7ZS7GmdKSqTtRXfe96fIGq1s3pZwA
	4wstuEdW3S8gvYG9urlGCblG1SHv1de9269oIve+4yB07GhxL7lzGCcntXZ+48kiRSjPrpAl0miNj
	PAP6ffrFaJevHDPZlvYuDp5kRXHaufBRV6e9YZOA6DzZid7rtoYx6TBpQiEkQoYK1nY659sW9enok
	Z3ORALzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlSkA-00000000Cge-42qs;
	Thu, 29 Jan 2026 14:11:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlSk7-00000000CgI-2PO2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 14:11:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21A3F153B;
	Thu, 29 Jan 2026 06:11:24 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.85])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BF4BE3F632;
	Thu, 29 Jan 2026 06:11:29 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Cc: mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH] perf/arm-cmn: Reject unsupported hardware configurations
Date: Thu, 29 Jan 2026 14:11:22 +0000
Message-Id: <bb47722fc593baf1e1cc0f944089592a4ec708da.1769695523.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_061131_653175_C51B5F7B 
X-CRM114-Status: GOOD (  10.56  )
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

So far we've been fairly lax about accepting both unknown CMN models
(at least with a warning), and unknown revisions of those which we
do know, as although things do frequently change between releases,
typically enough remains the same to be somewhat useful for at least
some basic bringup checks. However, we also make assumptions of the
maximum supported sizes and numbers of things in various places, and
there's no guarantee that something new might not be bigger and lead
to nasty array overflows. Make sure we only try to run on things that
actually match our assumptions and so will not risk memory corruption.

Cc: stable@vger.kernel.org
Fixes: 7819e05a0dce ("perf/arm-cmn: Revamp model detection")
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm-cmn.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index 2903e01f951f..24fec53ceccc 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -2422,6 +2422,15 @@ static int arm_cmn_discover(struct arm_cmn *cmn, unsigned int rgn_offset)
 			arm_cmn_init_node_info(cmn, reg & CMN_CHILD_NODE_ADDR, dn);
 			dn->portid_bits = xp->portid_bits;
 			dn->deviceid_bits = xp->deviceid_bits;
+			/*
+			 * Logical IDs are assigned from 0 per node type, so as
+			 * soon as we one bigger than expected, we can assume
+			 * there are more than we can cope with.
+			 */
+			if (dn->logid > CMN_MAX_NODES_PER_EVENT) {
+				dev_err(cmn->dev, "Invalid node number: %d\n", dn->logid);
+				return -ENODEV;
+			}
 
 			switch (dn->type) {
 			case CMN_TYPE_DTC:
@@ -2499,6 +2508,10 @@ static int arm_cmn_discover(struct arm_cmn *cmn, unsigned int rgn_offset)
 		cmn->mesh_x = cmn->num_xps;
 	cmn->mesh_y = cmn->num_xps / cmn->mesh_x;
 
+	if (max(cmn->mesh_x, cmn->mesh_y) > CMN_MAX_DIMENSION) {
+		dev_err(cmn->dev, "Invalid mesh size: %dx%d\n", cmn->mesh_x, cmn->mesh_y);
+		return -ENODEV;
+	}
 	/* 1x1 config plays havoc with XP event encodings */
 	if (cmn->num_xps == 1)
 		dev_warn(cmn->dev, "1x1 config not fully supported, translate XP events manually\n");
-- 
2.39.2.101.g768bb238c484.dirty


