Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51ECC44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 16:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SAIVlEr31WQx9EnxWoGa4RNJtUHYXoOzg4fSM6fPbMo=; b=3Gdl+q6YPUUu5cDNXB9YOAzZCC
	yoCZV0hckfpRf0KBXAfbQXyIbRepXewvNIIrV3nWfyyxVoAF4NGmfuRBjd16TCtjUG+Rj4swGhB/9
	mjKjFz8wADXavG82G1RUNbkv9D1TZut05J96FWEpewQFX+JLqSCMnquWRwefj2t3n6Ck9tBQdTXwJ
	O5fRIuVAM1YQuRfCsfU2xZyD6DfZW1FalHkSJD9Fh8xhltoGssDXCzJNM/KpkvF9iYOm6dH6XFCc1
	tVnJ5pADrZaGsHD4Mq0EYXP6jddbSQuhplBJXHwk2cPAWDN9bJDvt9L5H5BMjPf1H6B63geRvmETA
	oFx+6MLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh8bX-0000000FSFW-0JYM;
	Tue, 07 Jul 2026 16:25:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh8bU-0000000FSE9-4A5j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 16:25:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D5021BB0;
	Tue,  7 Jul 2026 09:24:54 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DD50E3F7B4;
	Tue,  7 Jul 2026 09:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783441498; bh=320vb514VMRuX0HcK72x1IEBtMbYsHSG6/Sv1CUpemA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FaCRC7GLFV/wvMTnxywobQgZ1nX0sQlmvGXXLsv+LrVNzT2IXGn7gMMCIRNm0sLss
	 J15BiB9GG5Ok5oN3VpIDIDPcD8FBKNccdbf18gpkNwNZG8SzkjN/TUzaDLytiTN658
	 kwXybSIhut/x0XAJI/wPkzuz8lkT8+KXnCndubRM=
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
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v5 1/5] arm_mpam: resctrl: Pick classes for use as MBM counters
Date: Tue,  7 Jul 2026 17:24:36 +0100
Message-ID: <20260707162440.12132-2-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707162440.12132-1-ben.horgan@arm.com>
References: <20260707162440.12132-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_092501_191932_3E53B2C7 
X-CRM114-Status: GOOD (  16.58  )
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
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
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


