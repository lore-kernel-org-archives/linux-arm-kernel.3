Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB1CC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 14:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IxW0OHq2Sp5SvoMVf2HzXUwBYWbvXZ9Qo5dxoB+FPVg=; b=e5LRFGtytYg0YRqd/Az8e9e9SG
	NnYz3MsjmMRFulkf/mY7P4Nm/DhOR11uB8dWmIvDnCQHWB2FRT+8wu8LxMMddTJzmq3VWdfNSOlfV
	Kymdn9iHhgBF3tq04CS7z4iVk++7NMn4xCyrBBp8RbMXKTAbhtp754/HN6M4vITgwDwBC985b3ONU
	0m5gGSr5btNyVjzrp7lUPHoeNQUtXlKJ4eVSjiAFwQoYHSLYrJz1HZbmOX4Z1j6o12LaOBlbuwtUS
	D8X3yqsHKLvTBPII/zmuVHgk3ywh/wiwgb/ExUkMwfAH+tLD5kRkEKxi4Z8KZYB9Kr2n4NsbNGD7J
	0F5A2HHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DYO-0000000BbyZ-0ggI;
	Thu, 17 Sep 2026 14:57:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DXc-0000000BbCx-0Ffp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 14:56:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C1AF204C;
	Thu, 17 Sep 2026 07:56:44 -0700 (PDT)
Received: from e134344.cambridge.arm.com (unknown [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3498B3F86F;
	Thu, 17 Sep 2026 07:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789657007; bh=KXTRQ8B7NuAawelRtl9Xn3/aug9ykZjYKPq/c2H+xsk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oPUjhHv+ZnTx+s/GIzhBl8HFTp7A2OJXfiOf8PRsemafBk3jxN/BJL3O5/VRupQzP
	 sM/0n+Iw7M81TLFQq7DnHmf4vQ7J2uDd7mc/MqOYIPAYWKFI+tB8lMcS/qI93gce/S
	 DxZLgXcvdN0blyQDKgW5MX+YIBItWPP0KufNMBEc=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dave.martin@arm.com,
	andre.przywara@arm.com,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2 12/12] arm_mpam: resctrl: Don't stop early when tearing down a class
Date: Thu, 17 Sep 2026 15:56:17 +0100
Message-ID: <20260917145617.2202986-13-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917145617.2202986-1-ben.horgan@arm.com>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_075648_136198_A95B1634 
X-CRM114-Status: GOOD (  13.38  )
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

An MPAM class can back more than one control and more than one
monitor. mpam_resctrl_teardown_class() iterates through all the controls
but stops if it finds a match which means classes backing more than one
class aren't torn down. The same for monitors, in which case the mbwu
counters will be leaked.

Stop terminating the loops early.

As we are already changing mpam_resctrl_teardown_class() remove the
misleading comment. It doesn't call resctrl_exit() and isn't required to do
so as the only caller does it first.

Fixes: fb481ec08699 ("arm_mpam: resctrl: Call resctrl_init() on platforms that can support resctrl")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since v1:

New patch
---
 drivers/resctrl/mpam_resctrl.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 321741a702fe..9cec5843e8fa 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1943,10 +1943,6 @@ static void mpam_resctrl_teardown_mon(struct mpam_resctrl_mon *mon, struct mpam_
 	mon->mbwu_idx_to_mon = NULL;
 }
 
-/*
- * The driver is detaching an MSC from this class, if resctrl was using it,
- * pull on resctrl_exit().
- */
 void mpam_resctrl_teardown_class(struct mpam_class *class)
 {
 	struct mpam_resctrl_res *res;
@@ -1957,17 +1953,14 @@ void mpam_resctrl_teardown_class(struct mpam_class *class)
 	might_sleep();
 
 	for_each_mpam_resctrl_control(res, rid) {
-		if (res->class == class) {
+		if (res->class == class)
 			res->class = NULL;
-			break;
-		}
 	}
 	for_each_mpam_resctrl_mon(mon, eventid) {
 		if (mon->class == class) {
 			mon->class = NULL;
 
 			mpam_resctrl_teardown_mon(mon, class);
-			break;
 		}
 	}
 }
-- 
2.43.0


