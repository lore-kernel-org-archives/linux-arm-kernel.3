Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2063F4BB6B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 18:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DitVAqt2W7BtSWDInWdyQeL6ANzecOicylNEOZcx3tE=; b=4HQwCXiYGkZivqcqAPGhoMT4ek
	Loij1nzM1wM2E7rE2yF//bnkk5fJf0Ar7h9a5y2VJylj3kvh51zxJv1D65xP0g7nvdQyhLzY1ksTP
	6l8ruc6lHeR5Je83elRoFq/eR4WBWWc9t8G2JmyYtXelydoTImmfGMufSwfgKhZRZeP5K3AsM17qT
	9n9nX751qOcIwQlT83fptd96BoqYtKTUTz8kCFqVrs3EhWJuFiZIUNBI25hY4/rDqfMHoTWElCA82
	F4fYaeXqazSiI/aBQxn8H8YWzvsBXQTB1Mfzp/hY/w0TRWW5r//JYACQvSBkmhxJTDU1gDWZUs0dU
	ASs2v2hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwip-00000002acz-3PKT;
	Tue, 24 Feb 2026 18:01:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwij-00000002aXY-2btX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 18:01:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF164165C;
	Tue, 24 Feb 2026 10:01:10 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7FF2A3F59E;
	Tue, 24 Feb 2026 10:01:11 -0800 (PST)
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
	catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	kvmarm@lists.linux.dev,
	zengheng4@huawei.com,
	linux-doc@vger.kernel.org
Subject: [PATCH v5 40/41] arm_mpam: Quirk CMN-650's CSU NRDY behaviour
Date: Tue, 24 Feb 2026 17:57:19 +0000
Message-ID: <20260224175720.2663924-41-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224175720.2663924-1-ben.horgan@arm.com>
References: <20260224175720.2663924-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_100117_800061_91B8761F 
X-CRM114-Status: GOOD (  14.95  )
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

CMN-650 is afflicted with an erratum where the CSU NRDY bit never clears.
This tells us the monitor never finishes scanning the cache. The erratum
document says to wait the maximum time, then ignore the field.

Add a flag to indicate whether this is the final attempt to read the
counter, and when this quirk is applied, ignore the NRDY field.

This means accesses to this counter will always retry, even if the counter
was previously programmed to the same values.

The counter value is not expected to be stable, it drifts up and down with
each allocation and eviction. The CSU register provides the value for a
point in time.

Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since v3:
parentheses in macro
---
 Documentation/arch/arm64/silicon-errata.rst |  3 +++
 drivers/resctrl/mpam_devices.c              | 12 ++++++++++++
 drivers/resctrl/mpam_internal.h             |  6 ++++++
 3 files changed, 21 insertions(+)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index 1aa3326bb320..65ed6ea33751 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -214,6 +214,9 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | SI L1           | #4311569        | ARM64_ERRATUM_4311569       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | CMN-650         | #3642720        | N/A                         |
++----------------+-----------------+-----------------+-----------------------------+
++----------------+-----------------+-----------------+-----------------------------+
 | Broadcom       | Brahma-B53      | N/A             | ARM64_ERRATUM_845719        |
 +----------------+-----------------+-----------------+-----------------------------+
 | Broadcom       | Brahma-B53      | N/A             | ARM64_ERRATUM_843419        |
diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 48a233875a9a..9182c8fcf003 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -691,6 +691,12 @@ static const struct mpam_quirk mpam_quirks[] = {
 	.iidr_mask  = MPAM_IIDR_MATCH_ONE,
 	.workaround = T241_MBW_COUNTER_SCALE_64,
 	},
+	{
+	/* ARM CMN-650 CSU erratum 3642720 */
+	.iidr       = MPAM_IIDR_ARM_CMN_650,
+	.iidr_mask  = MPAM_IIDR_MATCH_ONE,
+	.workaround = IGNORE_CSU_NRDY,
+	},
 	{ NULL } /* Sentinel */
 };
 
@@ -1003,6 +1009,7 @@ struct mon_read {
 	enum mpam_device_features	type;
 	u64				*val;
 	int				err;
+	bool				waited_timeout;
 };
 
 static bool mpam_ris_has_mbwu_long_counter(struct mpam_msc_ris *ris)
@@ -1249,6 +1256,10 @@ static void __ris_msmon_read(void *arg)
 		if (mpam_has_feature(mpam_feat_msmon_csu_hw_nrdy, rprops))
 			nrdy = now & MSMON___NRDY;
 		now = FIELD_GET(MSMON___VALUE, now);
+
+		if (mpam_has_quirk(IGNORE_CSU_NRDY, msc) && m->waited_timeout)
+			nrdy = false;
+
 		break;
 	case mpam_feat_msmon_mbwu_31counter:
 	case mpam_feat_msmon_mbwu_44counter:
@@ -1386,6 +1397,7 @@ int mpam_msmon_read(struct mpam_component *comp, struct mon_cfg *ctx,
 			.ctx = ctx,
 			.type = type,
 			.val = val,
+			.waited_timeout = true,
 		};
 		*val = 0;
 
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 1443a1dd996e..195ab821cc52 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -226,6 +226,7 @@ enum mpam_device_quirks {
 	T241_SCRUB_SHADOW_REGS,
 	T241_FORCE_MBW_MIN_TO_ONE,
 	T241_MBW_COUNTER_SCALE_64,
+	IGNORE_CSU_NRDY,
 	MPAM_QUIRK_LAST
 };
 
@@ -251,6 +252,11 @@ struct mpam_quirk {
 				 FIELD_PREP_CONST(MPAMF_IIDR_REVISION,    0)	 | \
 				 FIELD_PREP_CONST(MPAMF_IIDR_IMPLEMENTER, 0x36b))
 
+#define MPAM_IIDR_ARM_CMN_650	(FIELD_PREP_CONST(MPAMF_IIDR_PRODUCTID,   0)	 | \
+				 FIELD_PREP_CONST(MPAMF_IIDR_VARIANT,     0)	 | \
+				 FIELD_PREP_CONST(MPAMF_IIDR_REVISION,    0)	 | \
+				 FIELD_PREP_CONST(MPAMF_IIDR_IMPLEMENTER, 0x43b))
+
 /* The values for MSMON_CFG_MBWU_FLT.RWBW */
 enum mon_filter_options {
 	COUNT_BOTH	= 0,
-- 
2.43.0


