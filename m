Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A37E8C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 19:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2UfgdYArLbLRaVF+gVLZgCc2K2xBsMkDWPu1tT0X9T0=; b=xrR4/nXaD6kPWjG63B4Zd8Rxoh
	Z59rmXavs6oeKXlc21Q4HVrU9RA8N/A4vJCSIS7nA3sYm+L8oD7Ume4CBUEHJIjzdKU+HvTbcV8Zz
	Ts407pZt0pSvCwyVajbSFc66VUhcFH+K9M+DV+Hn3JNoRyNl8DZlrg/7Mblm/GtDemteWw6AW3rwV
	7+gKxF0YP82zkoLDAKL/qLXZAFgeL3mClXC6PD6XRTJhcK+yve3fCIjtysL508IMyyoZ3gCuza5Tz
	oRQzB5E8WQltFbg+p9lgAMgozI/tyNQwayal1duUz+KXHoxzqFxllQ+09PnFI5fhjgQOMwq/JeL4o
	R5PQm0hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVEWn-0000000Fbjl-2FSM;
	Fri, 27 Jun 2025 19:14:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVD6C-0000000FQpU-2NLb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 17:42:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 333351655;
	Fri, 27 Jun 2025 10:42:34 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 369433F66E;
	Fri, 27 Jun 2025 10:42:50 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Cc: mark.rutland@arm.com,
	ilkka@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	Arnd Bergmann <arnd@kernel.org>
Subject: [PATCH] perf/arm-cmn: Reduce stack usage during discovery
Date: Fri, 27 Jun 2025 18:42:39 +0100
Message-Id: <e7dd41bf0f1b098e2e4b01ef91318a4b272abff8.1751046159.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_104252_643752_43274076 
X-CRM114-Status: GOOD (  14.85  )
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

Arnd reports that Clang's aggressive inlining of arm_cmn_discover() can
lead to stack frame size warnings, and while we could simply prevent
such inlining to hide the issue, it seems more productive to actually
heed the warning and do something about the overall stack footprint.
The xp_region array is already rather large, and CMN_MAX_XPS might only
grow larger in future, however it only serves as a convenience to save
repeating the first level's worth of register reads in the second pass
of discovery. There's no performance concern here, and it only takes a
small tweak to the flow to re-extract the offsets instead of stashing
them, so let's just do that and save several hundred bytes of stack.

Reported-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm-cmn.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index 031d45d0fe3d..02ffc8d09328 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -2245,12 +2245,11 @@ static enum cmn_node_type arm_cmn_subtype(enum cmn_node_type type)
 
 static int arm_cmn_discover(struct arm_cmn *cmn, unsigned int rgn_offset)
 {
-	void __iomem *cfg_region;
+	void __iomem *cfg_region, __iomem *xp_region;
 	struct arm_cmn_node cfg, *dn;
 	struct arm_cmn_dtm *dtm;
 	enum cmn_part part;
 	u16 child_count, child_poff;
-	u32 xp_offset[CMN_MAX_XPS];
 	u64 reg;
 	int i, j;
 	size_t sz;
@@ -2302,11 +2301,12 @@ static int arm_cmn_discover(struct arm_cmn *cmn, unsigned int rgn_offset)
 	cmn->num_dns = cmn->num_xps;
 
 	/* Pass 1: visit the XPs, enumerate their children */
+	cfg_region += child_poff;
 	for (i = 0; i < cmn->num_xps; i++) {
-		reg = readq_relaxed(cfg_region + child_poff + i * 8);
-		xp_offset[i] = reg & CMN_CHILD_NODE_ADDR;
+		reg = readq_relaxed(cfg_region + i * 8);
+		xp_region = cmn->base + (reg & CMN_CHILD_NODE_ADDR);
 
-		reg = readq_relaxed(cmn->base + xp_offset[i] + CMN_CHILD_INFO);
+		reg = readq_relaxed(xp_region + CMN_CHILD_INFO);
 		cmn->num_dns += FIELD_GET(CMN_CI_CHILD_COUNT, reg);
 	}
 
@@ -2332,11 +2332,12 @@ static int arm_cmn_discover(struct arm_cmn *cmn, unsigned int rgn_offset)
 	cmn->dns = dn;
 	cmn->dtms = dtm;
 	for (i = 0; i < cmn->num_xps; i++) {
-		void __iomem *xp_region = cmn->base + xp_offset[i];
 		struct arm_cmn_node *xp = dn++;
 		unsigned int xp_ports = 0;
 
-		arm_cmn_init_node_info(cmn, xp_offset[i], xp);
+		reg = readq_relaxed(cfg_region + i * 8);
+		xp_region = cmn->base + (reg & CMN_CHILD_NODE_ADDR);
+		arm_cmn_init_node_info(cmn, reg & CMN_CHILD_NODE_ADDR, xp);
 		/*
 		 * Thanks to the order in which XP logical IDs seem to be
 		 * assigned, we can handily infer the mesh X dimension by
-- 
2.39.2.101.g768bb238c484.dirty


