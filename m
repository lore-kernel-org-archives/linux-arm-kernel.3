Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28986CD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 15:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pSC5buztseIGAVNRdGIei6M/8t/YgVJT65pbqV4irrc=; b=NnXlvcuvwODQGR5L+9Uhz9/Lxs
	XfqSdwcuNnlOQmXIxV7GyCoJsVYzISf1PKelffmrsi8lC+0s+c2EuEJX7ibyQApRngTP9MlNxlu+j
	vz1j/Q/pgFhShx7k2nIpAH9BaNFHfhNpvR7VCAgtf8NgPQSIO/u69IBhMD3SvIHMMB5Scs5Adw475
	dW4xf078SFVwVf2rmcngFr/8nU3oKc3Fpr45Zl0cFmBpHmCjtyhT2znGXRkM9M8NpayXe89OZVXQ4
	FsjzKvv0KB0qhTprDUoeQyVlVDbwepWCA2fUIAlPyUgQxh/JGkV6eWRXQpyVuFDcig3zvl5w642Hy
	n5KCPhrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSlh-0000000E58A-2njk;
	Mon, 11 May 2026 15:42:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSlf-0000000E56r-0Wm7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 15:42:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A74532BC4;
	Mon, 11 May 2026 08:41:56 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AB6D13F836;
	Mon, 11 May 2026 08:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778514121; bh=CGFdMXTo+81h7UBgS6WP6D+kCuc8CPMftY7945gx7xo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XLXY9jD4ILYWWjsXhybjKuNvkBuivi9PRgLSlN8W2EkfbGWyyKfw9E6W4jWsHbdtU
	 P/eZPjRiJjWjJAeMoH7x9Hhb4CV39WcrDHPYGK+vK7I1/e/xeqtvHVvJM4p1vPQ1u1
	 lW2bBFZjZ1oFlssuwdvmU8hgP7TwTIRC+9uuqDIA=
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
	jonathan.cameron@huawei.com,
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
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Subject: [PATCH v3 1/5] arm_mpam: resctrl: Pick classes for use as mbm counters
Date: Mon, 11 May 2026 16:41:43 +0100
Message-ID: <20260511154147.557481-2-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511154147.557481-1-ben.horgan@arm.com>
References: <20260511154147.557481-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_084203_242779_01D30705 
X-CRM114-Status: GOOD (  13.44  )
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

resctrl has two types of counters, NUMA-local and global. MPAM can only
count global either using MSC at the L3 cache or in the memory controllers.
When global and local equate to the same thing continue just to call it
global.

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


