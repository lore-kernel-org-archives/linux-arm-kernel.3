Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F1FCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 21:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C2rQSJVvjpA3TIcOEEbzxe+P6jyCaAHuQ+JLxMjjLCU=; b=EuGexw9dMwGUdFFSzHgy2otjK3
	bGICDSDG0l8FVagfMogvyvp/kM7y28ttUb4gV7/9HOPvcxYsFMlfvOAEFitJ46AT66qRldxABFlrZ
	mPDcfAFx6+Hlt0lmKjZr5I1FV9MjD5mGU1VkL8TECdhIOGsOvGCQXv9t2k1PmYNr+VFiU+ca257Vk
	aJqCArIzDriIRLIr7i4+rngrCyZoV2TzIUZBSQkYHNWl0x/RmdIXYRbxioeIgrLnZdJnFxcwAzwK7
	hWIUVK42ZFT3KUOE/cDAZqev/2O+aJUFMGydwp8qf9FWNQu/nK5ZZIXX1TKgbvM1zQlv1I/WnmfYn
	BJKd9KLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPoPz-00000005ple-1FFK;
	Wed, 20 May 2026 21:25:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPoPr-00000005pjC-31T2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 21:25:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 378AB490F;
	Wed, 20 May 2026 14:25:16 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4FC9B3F632;
	Wed, 20 May 2026 14:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779312321; bh=r8V64ma/khBLpgBDTKurOIXVzyLkvQSiYa1X5F8HYgI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BfVqcWi2iypOGgh/kELrHZhCLrFfa4opMGa8AvEaIT1pmaQu19iDt+KYgwiRY7Gdv
	 PGfdR8O3Vh78XPZHnVf3Zimc+/iQ5HHlZwUR5RqDdYKW3G/XhqwX0m6mYalWDHvX11
	 Lr47kzYgdUHpFeoACSyuIfKhC/wqvelN1Bk5nM/c=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: amitsinght@marvell.com,
	baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com,
	carl@os.amperecomputing.com,
	dave.martin@arm.com,
	david@kernel.org,
	dfustini@baylibre.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	james.morse@arm.com,
	jic23@kernel.org,
	kobak@nvidia.com,
	lcherian@marvell.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	peternewman@google.com,
	punit.agrawal@oss.qualcomm.com,
	quic_jiles@quicinc.com,
	reinette.chatre@intel.com,
	rohit.mathew@arm.com,
	scott@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	tan.shaopeng@fujitsu.com,
	xhao@linux.alibaba.com,
	zengheng4@huawei.com,
	x86@kernel.org,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v4 1/5] arm_mpam: resctrl: Pick classes for use as MBM counters
Date: Wed, 20 May 2026 22:24:54 +0100
Message-ID: <20260520212458.1797221-2-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520212458.1797221-1-ben.horgan@arm.com>
References: <20260520212458.1797221-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_142524_022019_4363E40A 
X-CRM114-Status: GOOD (  16.63  )
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

Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Zeng Heng <zengheng4@huawei.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since rfc v1:
Move finding any_mon_comp into monitor boilerplate patch
Move mpam_resctrl_get_domain_from_cpu() into monitor boilerplate
Remove free running check
Trim commit message

Changes since v3:
Extra paragraph in commit message
---
 drivers/resctrl/mpam_resctrl.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 226ff6f532fa..f70fa65d39e4 100644
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
@@ -983,6 +993,22 @@ static void mpam_resctrl_pick_counters(void)
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
+			 * We can't distinguish traffic by destination so
+			 * we don't know if it's staying on the same NUMA
+			 * node. Hence, we can't calculate mbm_local except
+			 * when we only have one L3 and it's equivalent to
+			 * mbm_total and so always use mbm_total.
+			 */
+			counter_update_class(QOS_L3_MBM_TOTAL_EVENT_ID, class);
+		}
 	}
 }
 
-- 
2.43.0


