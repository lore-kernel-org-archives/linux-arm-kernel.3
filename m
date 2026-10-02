Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC23ECA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 17:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x84MT/H+0RiUwiZgP2LT8qCjYkeU95gapw/4pD6Pkr4=; b=H8kVrHTHDGm9IrtUEqCVQzZKSe
	vHSxXhjKJC3JkPmQYLp4yDMjsOKRHkL6Toi1luVyQzv44z2Xc19YPMPW/NMrGJVSxxgbO9dGqvVLa
	VxoLR0Kdlu7Tp3esm3JtnfrICXkvYXrErnrbx+SvJmHc++V4zZxhhnLDYpEtbc81Lo3Klb9e2jIIT
	wV5ItrRIpncLTJVLNS3HHS1g20FlK47X1x0jpaYVQWSPdhGzhIM0e4DZEXz9BzT+Om6JC7clwOQv/
	1SFFfbri4Dd8V270jOR75in97F0iLk9q5fZXEfBHp8Nx8+7fe3/+nQiD7bwLVQTf3+oU/KytswCHg
	iJ8gyIrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChF5-0000000CBWP-3lqs;
	Fri, 02 Oct 2026 17:40:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChF0-0000000CBME-3KBF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 17:40:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67AB8143D;
	Fri,  2 Oct 2026 10:40:10 -0700 (PDT)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD4683F85F;
	Fri,  2 Oct 2026 10:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790962813; bh=jiUcB6Ia70sGz40GpXsNl4VxyMwTd56HDrRJrxLENOk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tQ5bxWeosuPVJi80jF8O6e4Uq3NBSx0Qzs6f/7mvHbJFV2FM5Kx253RGAuNQvKR4n
	 m1Zel7U82ASQoQ4u53shT7piU7VqPTrIJvjY15P+S7D9So8mv7E/PXR0T9wnXnVM7p
	 D+5zcIFwb2M/jFADAAhNDwPEqKFNpR3OrgN6hPXs=
From: James Morse <james.morse@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Gavin Shan <gshan@redhat.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 10/27] arm_mpam: Don't loop forever if there is the maximum possible amount of PARTIDs
Date: Fri,  2 Oct 2026 18:39:23 +0100
Message-ID: <20261002173941.292319-11-james.morse@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002173941.292319-1-james.morse@arm.com>
References: <20261002173941.292319-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_104014_880660_5619AC0C 
X-CRM114-Status: GOOD (  12.08  )
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

From: Ben Horgan <ben.horgan@arm.com>

On a theoretical platform with the maximum possible number of usable
PARTIDs, 0XFFFF, the loops iterating over PARTID in mpam_reset_ris() and
mpam_reprogram_ris() will never reach their termination condition leading
to a system hang when register the cpu hotplug handlers when MPAM is
enabling.

Fix these loops.

Fixes: f188a36ca241 ("arm_mpam: Reset MSC controls from cpuhp callbacks")
Fixes: 09b89d2a72f3 ("arm_mpam: Allow configuration to be applied and restored during cpu online")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Tested-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: James Morse <james.morse@arm.com>
Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_devices.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 2369f814de48..67545df984fa 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1760,7 +1760,7 @@ static int mpam_save_mbwu_state(void *arg)
  */
 static int mpam_reset_ris(void *arg)
 {
-	u16 partid, partid_max;
+	u16 partid_max;
 	struct mpam_config reset_cfg = {};
 	struct mpam_msc_ris *ris = arg;
 
@@ -1770,7 +1770,7 @@ static int mpam_reset_ris(void *arg)
 	spin_lock(&partid_max_lock);
 	partid_max = mpam_partid_max;
 	spin_unlock(&partid_max_lock);
-	for (partid = 0; partid <= partid_max; partid++)
+	for (u32 partid = 0; partid <= partid_max; partid++)
 		mpam_reprogram_ris_partid(ris, partid, &reset_cfg);
 
 	return 0;
@@ -1817,7 +1817,6 @@ static int __write_config(void *arg)
 
 static void mpam_reprogram_msc(struct mpam_msc *msc)
 {
-	u16 partid;
 	bool reset;
 	struct mpam_config *cfg;
 	struct mpam_msc_ris *ris;
@@ -1841,7 +1840,7 @@ static void mpam_reprogram_msc(struct mpam_msc *msc)
 		arg.comp = ris->vmsc->comp;
 		arg.ris = ris;
 		reset = true;
-		for (partid = 0; partid <= mpam_partid_max; partid++) {
+		for (u32 partid = 0; partid <= mpam_partid_max; partid++) {
 			cfg = &ris->vmsc->comp->cfg[partid];
 			if (!bitmap_empty(cfg->features, MPAM_FEATURE_LAST))
 				reset = false;
-- 
2.53.0


