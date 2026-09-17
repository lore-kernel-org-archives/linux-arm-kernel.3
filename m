Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EF6C982D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 14:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uaruAprQnKNGgAKG2ptX65xfypwitP7tXcad0wF0ZmM=; b=kRWEpmHyD6qri05T4zNVZunCJh
	8HotfW7+VcTLZYv9KjZLNxmerX1UziIKziwR3TnK8l2R/pgFrbS8jFHlf0LKPBazk6Wm4tLcyG5F0
	WM8Afe2m/faaRxE2+IOcw1FqR64Yboh+LAlsXL1glFGH/d2flFTa9WaXh+5guz0DLCTym6zBMfuao
	xgatraAGkzkfOSKL7Yn9wT5jdbq/4YFJqztdC0AmwABUZszuRI5AIXf53AjZh7O4IeXwNpLKiX3zR
	3MJ+h33oT12YTyuhlea3LTOqsoG5PijuiCSrny7ftyPvfSobSM+om9lgNnkg3HNLk48TPKuJVB2PR
	zDaPoPPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DXe-0000000BbHC-1bL0;
	Thu, 17 Sep 2026 14:56:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DXZ-0000000BbBO-0z7x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 14:56:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A1C11476;
	Thu, 17 Sep 2026 07:56:40 -0700 (PDT)
Received: from e134344.cambridge.arm.com (unknown [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B27F83F86F;
	Thu, 17 Sep 2026 07:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789657004; bh=RpO8zOr6jZcL27MkYikOaNk4efDL6B/6X8Hi1ZdtHW4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RX3NAQJ0exD9uuKhKEmGyYyBarHOBOm6jXMVcpW4qKypNCf+oC51ZYTS2oWr9i8mM
	 YhDlcEtzy7C559IwRUVmxfNTHYkAVXzGFCw/0ds4Ll1l/S5LC614axefrxOzgieozW
	 W8QVDlmV9qsvb5VVc9Ouwt2dY9+LgBsUwMEB1mfQ=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dave.martin@arm.com,
	andre.przywara@arm.com,
	Gavin Shan <gshan@redhat.com>
Subject: [PATCH v2 10/12] arm_mpam: Don't loop forever if there is the maximum possible amount of PARTIDs
Date: Thu, 17 Sep 2026 15:56:15 +0100
Message-ID: <20260917145617.2202986-11-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917145617.2202986-1-ben.horgan@arm.com>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_075645_318631_8DABC87C 
X-CRM114-Status: GOOD (  10.89  )
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
---
 drivers/resctrl/mpam_devices.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index cdc2d9d19e19..10fc5168699b 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1754,7 +1754,7 @@ static int mpam_save_mbwu_state(void *arg)
  */
 static int mpam_reset_ris(void *arg)
 {
-	u16 partid, partid_max;
+	u16 partid_max;
 	struct mpam_config reset_cfg = {};
 	struct mpam_msc_ris *ris = arg;
 
@@ -1764,7 +1764,7 @@ static int mpam_reset_ris(void *arg)
 	spin_lock(&partid_max_lock);
 	partid_max = mpam_partid_max;
 	spin_unlock(&partid_max_lock);
-	for (partid = 0; partid <= partid_max; partid++)
+	for (u32 partid = 0; partid <= partid_max; partid++)
 		mpam_reprogram_ris_partid(ris, partid, &reset_cfg);
 
 	return 0;
@@ -1811,7 +1811,6 @@ static int __write_config(void *arg)
 
 static void mpam_reprogram_msc(struct mpam_msc *msc)
 {
-	u16 partid;
 	bool reset;
 	struct mpam_config *cfg;
 	struct mpam_msc_ris *ris;
@@ -1835,7 +1834,7 @@ static void mpam_reprogram_msc(struct mpam_msc *msc)
 		arg.comp = ris->vmsc->comp;
 		arg.ris = ris;
 		reset = true;
-		for (partid = 0; partid <= mpam_partid_max; partid++) {
+		for (u32 partid = 0; partid <= mpam_partid_max; partid++) {
 			cfg = &ris->vmsc->comp->cfg[partid];
 			if (!bitmap_empty(cfg->features, MPAM_FEATURE_LAST))
 				reset = false;
-- 
2.43.0


