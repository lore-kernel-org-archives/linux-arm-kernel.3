Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6F5CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 12:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mGPow9uYZcyplKdtloG6JtHsQk8oKSo/auiUuDeSVTQ=; b=oV2K+KvEJW4LG82Q6s1t/FhFUS
	v1C2Tjcl2ljuqLdwjpgf/rmdbXChNMhYCdv8/nan/E+G8YC9sbtjxYXQbfY4BSnwUh/IH/yszW+b6
	SFK+BVOz53rwm2ftSuajAdJTBIfuwqB1p892tx+V+7fPsBxDi7y4VU+ES035pmaDLJ1WIMwDCJJ7k
	Jf1/i/SG2TNdLZIwApo4bgaXekIG/CprkhzkNbKRLVfWCbX2JQxqEAYpsvPFnH7bYwBWhDv/0FieC
	6LzUeDCrwrKtARG11iUbB5XVELGwNZ2AZeT3DxNDQVTV4xdcIJZe+GluKPb2Xz7S2YN21rTNrG8Ex
	L4/W/+AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHLjB-0000000HKn2-1GYs;
	Fri, 07 Nov 2025 12:38:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHLj6-0000000HKi0-2oQv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 12:38:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BB3B1515;
	Fri,  7 Nov 2025 04:37:52 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1C0413F66E;
	Fri,  7 Nov 2025 04:37:54 -0800 (PST)
From: Ben Horgan <ben.horgan@arm.com>
To: james.morse@arm.com
Cc: amitsinght@marvell.com,
	baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com,
	bobo.shaobowang@huawei.com,
	carl@os.amperecomputing.com,
	catalin.marinas@arm.com,
	dakr@kernel.org,
	dave.martin@arm.com,
	david@redhat.com,
	dfustini@baylibre.com,
	fenghuay@nvidia.com,
	gregkh@linuxfoundation.org,
	gshan@redhat.com,
	guohanjun@huawei.com,
	jeremy.linton@arm.com,
	jonathan.cameron@huawei.com,
	kobak@nvidia.com,
	lcherian@marvell.com,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lpieralisi@kernel.org,
	peternewman@google.com,
	quic_jiles@quicinc.com,
	rafael@kernel.org,
	robh@kernel.org,
	rohit.mathew@arm.com,
	scott@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	sudeep.holla@arm.com,
	tan.shaopeng@fujitsu.com,
	will@kernel.org,
	xhao@linux.alibaba.com,
	Ben Horgan <ben.horgan@arm.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Subject: [PATCH 29/33] arm_mpam: Probe for long/lwd mbwu counters
Date: Fri,  7 Nov 2025 12:34:46 +0000
Message-ID: <20251107123450.664001-30-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251107123450.664001-1-ben.horgan@arm.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_043800_822784_A9AE029C 
X-CRM114-Status: GOOD (  11.87  )
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

From: Rohit Mathew <rohit.mathew@arm.com>

mpam v0.1 and versions above v1.0 support optional long counter for
memory bandwidth monitoring. The MPAMF_MBWUMON_IDR register has fields
indicating support for long counters.

Probe these feature bits.

The mpam_feat_msmon_mbwu feature is used to indicate that bandwidth
monitors are supported, instead of muddling this with which size of
bandwidth monitors, add an explicit 31 bit counter feature.

Signed-off-by: Rohit Mathew <rohit.mathew@arm.com>
[ morse: Added 31bit counter feature to simplify later logic ]
Signed-off-by: James Morse <james.morse@arm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Tested-by: Fenghua Yu <fenghuay@nvidia.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Peter Newman <peternewman@google.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since v3:
Only set the exact counter length that is supported
---
 drivers/resctrl/mpam_devices.c  | 34 +++++++++++++++++++++------------
 drivers/resctrl/mpam_internal.h |  3 +++
 2 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index eea082dfcddc..e93f2e919a85 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -783,25 +783,35 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 				dev_err_once(dev, "Counters are not usable because not-ready timeout was not provided by firmware.");
 		}
 		if (FIELD_GET(MPAMF_MSMON_IDR_MSMON_MBWU, msmon_features)) {
-			bool hw_managed;
+			bool has_long, hw_managed;
 			u32 mbwumon_idr = mpam_read_partsel_reg(msc, MBWUMON_IDR);
 
 			props->num_mbwu_mon = FIELD_GET(MPAMF_MBWUMON_IDR_NUM_MON, mbwumon_idr);
-			if (props->num_mbwu_mon)
+			if (props->num_mbwu_mon) {
 				mpam_set_feature(mpam_feat_msmon_mbwu, props);
 
-			if (FIELD_GET(MPAMF_MBWUMON_IDR_HAS_RWBW, mbwumon_idr))
-				mpam_set_feature(mpam_feat_msmon_mbwu_rwbw, props);
+				if (FIELD_GET(MPAMF_MBWUMON_IDR_HAS_RWBW, mbwumon_idr))
+					mpam_set_feature(mpam_feat_msmon_mbwu_rwbw, props);
 
-			/* Is NRDY hardware managed? */
-			hw_managed = mpam_ris_hw_probe_hw_nrdy(ris, MBWU);
-			if (hw_managed)
-				mpam_set_feature(mpam_feat_msmon_mbwu_hw_nrdy, props);
+				has_long = FIELD_GET(MPAMF_MBWUMON_IDR_HAS_LONG, mbwumon_idr);
+				if (has_long) {
+					if (FIELD_GET(MPAMF_MBWUMON_IDR_LWD, mbwumon_idr))
+						mpam_set_feature(mpam_feat_msmon_mbwu_63counter, props);
+					else
+						mpam_set_feature(mpam_feat_msmon_mbwu_44counter, props);
+				} else
+					mpam_set_feature(mpam_feat_msmon_mbwu_31counter, props);
 
-			/*
-			 * Don't warn about any missing firmware property for
-			 * MBWU NRDY - it doesn't make any sense!
-			 */
+				/* Is NRDY hardware managed? */
+				hw_managed = mpam_ris_hw_probe_hw_nrdy(ris, MBWU);
+				if (hw_managed)
+					mpam_set_feature(mpam_feat_msmon_mbwu_hw_nrdy, props);
+
+				/*
+				 * Don't warn about any missing firmware property for
+				 * MBWU NRDY - it doesn't make any sense!
+				 */
+			}
 		}
 	}
 
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 7c99d4f3dc9c..f3bf26b7fdaf 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -162,6 +162,9 @@ enum mpam_device_features {
 	mpam_feat_msmon_csu_xcl,
 	mpam_feat_msmon_csu_hw_nrdy,
 	mpam_feat_msmon_mbwu,
+	mpam_feat_msmon_mbwu_31counter,
+	mpam_feat_msmon_mbwu_44counter,
+	mpam_feat_msmon_mbwu_63counter,
 	mpam_feat_msmon_mbwu_capture,
 	mpam_feat_msmon_mbwu_rwbw,
 	mpam_feat_msmon_mbwu_hw_nrdy,
-- 
2.43.0


