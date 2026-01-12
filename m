Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B0ACF45AE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 17:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7KbcYMY84wB/VsXRT3Y1oqaHuAR00lpi0YigWDk+sqE=; b=f5ioBdPOA0t1WIbR2g7LF7Gu23
	mUgN6ljzWKl3tyxr6TPW0rkF4RnrdML7u1T41kNU9KKTcueGXGHvlZZftBLJ+J0SOkkcAmoR06/VK
	vLkwjFehVfD/MbTAAZee5gyKU9BBluQez62crVJJFskwN13oSLmJEYWBQPvTeuC+j+KOWLp55gK8V
	tRH9Yi9IU8cgfk0zZv+fw9atzcwA3LTbPOocjsKmkCWSzbU7krA6ZaN2bZtfJB77grUUsUgb2KqFP
	JCX2WG1Ci+B6srdo5P1BHGSTjeFlzRweB1evXBANNibNQ6vMW0rT7nvwle9kIu7CgaUSQT6Poef55
	jt2lSp8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLKn-00000005oh7-3Liy;
	Mon, 12 Jan 2026 17:04:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLKl-00000005odf-0OhM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 17:04:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD5DD1516;
	Mon, 12 Jan 2026 09:03:55 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 500183F694;
	Mon, 12 Jan 2026 09:03:57 -0800 (PST)
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
	kvmarm@lists.linux.dev
Subject: [PATCH v3 46/47] arm_mpam: Add workaround for T241-MPAM-6
Date: Mon, 12 Jan 2026 16:59:13 +0000
Message-ID: <20260112165914.4086692-47-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112165914.4086692-1-ben.horgan@arm.com>
References: <20260112165914.4086692-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_090403_319426_457D162F 
X-CRM114-Status: GOOD (  19.40  )
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

From: Shanker Donthineni <sdonthineni@nvidia.com>

The registers MSMON_MBWU_L and MSMON_MBWU return the number of requests
rather than the number of bytes transferred.

Bandwidth resource monitoring is performed at the last level cache, where
each request arrive in 64Byte granularity. The current implementation
returns the number of transactions received at the last level cache but
does not provide the value in bytes. Scaling by 64 gives an accurate byte
count to match the MPAM specification for the MSMON_MBWU and MSMON_MBWU_L
registers. This patch fixes the issue by reporting the actual number of
bytes instead of the number of transactions from __ris_msmon_read().

Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since rfc:
MPAM_IIDR_NVIDIA_T421 -> MPAM_IIDR_NVIDIA_T241
Don't apply workaround to MSMON_MBWU_LWD
---
 Documentation/arch/arm64/silicon-errata.rst |  2 ++
 drivers/resctrl/mpam_devices.c              | 26 +++++++++++++++++++--
 drivers/resctrl/mpam_internal.h             |  1 +
 3 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index b18bc704d4a1..e810b2a8f40e 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -250,6 +250,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | NVIDIA         | T241 MPAM       | T241-MPAM-4     | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
+| NVIDIA         | T241 MPAM       | T241-MPAM-6     | N/A                         |
++----------------+-----------------+-----------------+-----------------------------+
 +----------------+-----------------+-----------------+-----------------------------+
 | Freescale/NXP  | LS2080A/LS1043A | A-008585        | FSL_ERRATUM_A008585         |
 +----------------+-----------------+-----------------+-----------------------------+
diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 884ca6a6d8f3..7409cb7edab4 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -685,6 +685,12 @@ static const struct mpam_quirk mpam_quirks[] = {
 	.iidr_mask  = MPAM_IIDR_MATCH_ONE,
 	.workaround = T241_FORCE_MBW_MIN_TO_ONE,
 	},
+	{
+	/* NVIDIA t241 erratum T241-MPAM-6 */
+	.iidr       = MPAM_IIDR_NVIDIA_T241,
+	.iidr_mask  = MPAM_IIDR_MATCH_ONE,
+	.workaround = T241_MBW_COUNTER_SCALE_64,
+	},
 	{ NULL } /* Sentinel */
 };
 
@@ -1146,7 +1152,7 @@ static void write_msmon_ctl_flt_vals(struct mon_read *m, u32 ctl_val,
 	}
 }
 
-static u64 mpam_msmon_overflow_val(enum mpam_device_features type)
+static u64 __mpam_msmon_overflow_val(enum mpam_device_features type)
 {
 	/* TODO: implement scaling counters */
 	switch (type) {
@@ -1161,6 +1167,18 @@ static u64 mpam_msmon_overflow_val(enum mpam_device_features type)
 	}
 }
 
+static u64 mpam_msmon_overflow_val(enum mpam_device_features type,
+				   struct mpam_msc *msc)
+{
+	u64 overflow_val = __mpam_msmon_overflow_val(type);
+
+	if (mpam_has_quirk(T241_MBW_COUNTER_SCALE_64, msc) &&
+	    type != mpam_feat_msmon_mbwu_63counter)
+		overflow_val *= 64;
+
+	return overflow_val;
+}
+
 static void __ris_msmon_read(void *arg)
 {
 	u64 now;
@@ -1251,13 +1269,17 @@ static void __ris_msmon_read(void *arg)
 			now = FIELD_GET(MSMON___VALUE, now);
 		}
 
+		if (mpam_has_quirk(T241_MBW_COUNTER_SCALE_64, msc) &&
+		    m->type != mpam_feat_msmon_mbwu_63counter)
+			now *= 64;
+
 		if (nrdy)
 			break;
 
 		mbwu_state = &ris->mbwu_state[ctx->mon];
 
 		if (overflow)
-			mbwu_state->correction += mpam_msmon_overflow_val(m->type);
+			mbwu_state->correction += mpam_msmon_overflow_val(m->type, msc);
 
 		/*
 		 * Include bandwidth consumed before the last hardware reset and
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 7b4566814945..1680d1036472 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -225,6 +225,7 @@ struct mpam_props {
 enum mpam_device_quirks {
 	T241_SCRUB_SHADOW_REGS,
 	T241_FORCE_MBW_MIN_TO_ONE,
+	T241_MBW_COUNTER_SCALE_64,
 	MPAM_QUIRK_LAST
 };
 
-- 
2.43.0


