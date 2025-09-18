Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B42CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 16:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6XkDG2MBr6JDTs9mC4djXIW8BJr+M/bEaN2bZch/c0s=; b=jEna2bT20oZd1ciqxk+j/gNv7I
	8aue0P181licVhPFOlsU/x3IIrR2XJeFtLAKuAYFlkrnMck23cr7tBAO5K7tGlpWHMYV7M8jY83Yp
	MyppBPqITq1tmfRGpcDJt1ycsTbR2R+F+bjZqjyfHT4k5RSoFug0INEAp+i2eU4gGBB90rpQf9O+J
	mMJAKZqxfGme3woVVYcXycBu3erILnEly0xK0r8crx3FyayMTxd4QZ7QRgJquBIpnxwazPj9d7/jZ
	PUSvkaBDcI2vgTjWGLQjIdSY0kLkZFfcPFopCamEOfbZOXal0yYC1jhCeo1lU0BK1rkLG108FLdK9
	98YteK5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHS4-00000000cYi-2EAy;
	Thu, 18 Sep 2025 16:25:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHS1-00000000cXx-2jJ1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 16:25:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79777176C;
	Thu, 18 Sep 2025 09:25:32 -0700 (PDT)
Received: from 010265703453.cambridge.arm.com (010265703453.cambridge.arm.com [10.1.33.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A7FB73F673;
	Thu, 18 Sep 2025 09:25:39 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Cc: mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] perf/arm-cmn: Fix CMN S3 DTM offset
Date: Thu, 18 Sep 2025 17:25:31 +0100
Message-Id: <f1248eedc2d082c80f5299747acedc8decb94c70.1758212731.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_092541_726045_C1137E46 
X-CRM114-Status: GOOD (  12.16  )
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

CMN S3's DTM offset is different between r0px and r1p0, and it
turns out this was not a error in the earlier documentation, but
does actually exist in the design. Lovely.

Cc: stable@vger.kernel.org
Fixes: 0dc2f4963f7e ("perf/arm-cmn: Support CMN S3")
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm-cmn.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index 50695b95fbfd..6698f0ec94e9 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -65,7 +65,7 @@
 /* PMU registers occupy the 3rd 4KB page of each node's region */
 #define CMN_PMU_OFFSET			0x2000
 /* ...except when they don't :( */
-#define CMN_S3_DTM_OFFSET		0xa000
+#define CMN_S3_R1_DTM_OFFSET		0xa000
 #define CMN_S3_PMU_OFFSET		0xd900
 
 /* For most nodes, this is all there is */
@@ -233,6 +233,9 @@ enum cmn_revision {
 	REV_CMN700_R1P0,
 	REV_CMN700_R2P0,
 	REV_CMN700_R3P0,
+	REV_CMNS3_R0P0 = 0,
+	REV_CMNS3_R0P1,
+	REV_CMNS3_R1P0,
 	REV_CI700_R0P0 = 0,
 	REV_CI700_R1P0,
 	REV_CI700_R2P0,
@@ -425,8 +428,8 @@ static enum cmn_model arm_cmn_model(const struct arm_cmn *cmn)
 static int arm_cmn_pmu_offset(const struct arm_cmn *cmn, const struct arm_cmn_node *dn)
 {
 	if (cmn->part == PART_CMN_S3) {
-		if (dn->type == CMN_TYPE_XP)
-			return CMN_S3_DTM_OFFSET;
+		if (cmn->rev >= REV_CMNS3_R1P0 && dn->type == CMN_TYPE_XP)
+			return CMN_S3_R1_DTM_OFFSET;
 		return CMN_S3_PMU_OFFSET;
 	}
 	return CMN_PMU_OFFSET;
-- 
2.34.1


