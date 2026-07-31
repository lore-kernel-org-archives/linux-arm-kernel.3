Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8BBC5516D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 17:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=if13ED8uLC8+wndoRg3A8dWG/gXqM5pkQpFeNofv1tU=; b=XSKHd7G8sC2jHoOgo5Dr64NS2X
	lFAJ47/VmdN39lxte+hAMxydyH+mx0IqUZpJ7peb8Z3ZvINHIpwo8ocRfem/cuWZSINJ6zwN3smAE
	JYtc21+wqpDUzH4Mr/m0/N2KQBioXjtvxMYptDo3MtzJv1tYyZ12U9C00as9dET5RcrhNGk8BHcWv
	JZksaazcClGJK6c8kzI4Wq6InfBFYyWMYiR9iRnfokNuqJIDIQ2BHD0DQISvxQv/aUpWWZfd8WKWN
	xsLLx+hYgg9xOhOEmM40ECyYbUH426NkE6Fwgf3fY2VAHSk0GME8p/4JaJLnyvuc9kZk+oIZlodV+
	Xy2Ttndg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wprPx-0000000DIb1-1lLF;
	Fri, 31 Jul 2026 17:53:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wprPo-0000000DIXW-0DMt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 17:53:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3A6020E3;
	Fri, 31 Jul 2026 10:52:54 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0634B3F66F;
	Fri, 31 Jul 2026 10:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785520379; bh=p67MsNaPk2h2uveTN+qhhWyzAkeVkIvVQissMGf3+Wg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aAsFZ9QnjIDlFlrz0bk+eB4doJq3eMwGgTCxEOwpyZfCCKpa3NGfpK+TIbVOjL7Qz
	 Wc2uXSi3GfPm/UD9qmty9oA5wDi5flu3PYRSgMEyojYe0roUPssFRxb5R1ItpqDQt1
	 sMagzjLpkK6Repf1J7kcgNWTv9pzB/SMYKn7NgYY=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com,
	will@kernel.org
Cc: james.morse@arm.com,
	fenghuay@nvidia.com,
	linux-arm-kernel@lists.infradead.org,
	andre.przywara@arm.com,
	gshan@redhat.com,
	tan.shaopeng@jp.fujitsu.com,
	sdonthineni@nvidia.com,
	jonathan.cameron@oss.qualcomm.com,
	Zeng Heng <zengheng4@huawei.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH 1/6] arm_mpam: resctrl: Pick classes for use as MBM counters
Date: Fri, 31 Jul 2026 18:52:38 +0100
Message-ID: <20260731175243.904730-2-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731175243.904730-1-ben.horgan@arm.com>
References: <20260731175243.904730-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_105300_168735_1688CC32 
X-CRM114-Status: GOOD (  16.02  )
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

From: James Morse <james.morse@arm.com>

resctrl has two types of bandwidth counters, NUMA-local and global. MPAM
can only count globally; either using MSC at the L3 cache or in the memory
controllers. When global and local equate to the same thing continue just
to call it global.

Pick the corresponding MPAM classes to back the MBM counters. As resctrl
requires all monitors to be at the L3 cache, we can only use the counters
at the memory controllers when they have the same topology as the L3 cache
and the traffic they see if the same. In particular, for the bandwidth
counters at the memory controllers to be exposed to resctrl it is required
there is a single L3 cache and a single NUMA node as otherwise cross NUMA
traffic will be counted at the wrong instance.

Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Zeng Heng <zengheng4@huawei.com>
Tested-by: Fenghua Yu <fenghuay@nvidia.com>
Tested-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
---
Changes since rfc v1:
Move finding any_mon_comp into monitor boilerplate patch
Move mpam_resctrl_get_domain_from_cpu() into monitor boilerplate
Remove free running check
Trim commit message

Changes since v3:
Extra paragraph in commit message

Changes since v4:
Commit message tag ordering
New sentence in block comment (Fenghua)

Changes since v5:
Add Gavin's R-b & T-b
---
 drivers/resctrl/mpam_resctrl.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 226ff6f532fa..0fce9703b869 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -606,6 +606,16 @@ static bool cache_has_usable_csu(struct mpam_class *class)
 	return true;
 }
 
+static bool class_has_usable_mbwu(struct mpam_class *class)
+{
+	struct mpam_props *cprops = &class->props;
+
+	if (!mpam_has_feature(mpam_feat_msmon_mbwu, cprops))
+		return false;
+
+	return true;
+}
+
 /*
  * Calculate the worst-case percentage change from each implemented step
  * in the control.
@@ -983,6 +993,24 @@ static void mpam_resctrl_pick_counters(void)
 				break;
 			}
 		}
+
+		if (class_has_usable_mbwu(class) &&
+		    topology_matches_l3(class) &&
+		    traffic_matches_l3(class)) {
+			pr_debug("class %u has usable MBWU, and matches L3 topology and traffic\n",
+				 class->level);
+
+			/*
+			 * An MSC measures bandwidth for a path determined by
+			 * its location in hardware. We can't distinguish
+			 * traffic by destination so we don't know if it's
+			 * staying on the same NUMA node. Hence, we can't
+			 * calculate mbm_local except when we only have one L3
+			 * and it's equivalent to mbm_total and so always use
+			 * mbm_total.
+			 */
+			counter_update_class(QOS_L3_MBM_TOTAL_EVENT_ID, class);
+		}
 	}
 }
 
-- 
2.43.0


