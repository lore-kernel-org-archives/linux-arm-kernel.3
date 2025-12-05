Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA5CD374A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 22:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J4s1VhrWYXm+LWHEaeqYiZiRmXodr76yOzAMYrz9j/w=; b=OO8k8DM8DKMuG10+JD0KyQuI3I
	EjsCqV0cHh0V0libLVr6HObdC4KaMMOxgHbGlyDjGdWrBdNVQkAubxzwhJgRuvCwbO4Esy2vfKclx
	dsM8TYHXq2lxcD5Qfq5iGtYE7DoFBMiL9R5oE5rbkKn2PXf0VkWmWixMu33FFQT5H2r8+ZV6kjwxc
	NSIjCcYkmJbDON75/dm34ax3J6AFBrzEhQTX4lrDspGieRBjp8pv9TJyMcExH2/5lVPp1w472P/ng
	JdMV/+Jkdlc3JodCaE4sLZjQxl3irhzyOWRK04+k92h7cftxbjvvHM6K3VhzdTOm9GMNsXtY5LgCE
	kCTX65Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdsn-0000000A7oZ-1MkK;
	Fri, 05 Dec 2025 22:02:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdsm-0000000A7nV-1Ao2
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 05 Dec 2025 22:02:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=J4s1VhrWYXm+LWHEaeqYiZiRmXodr76yOzAMYrz9j/w=; b=Kok8EHA3lNpw41ZKvLDqslsGwc
	CjSbmKslriqcIitFPYKtyCrhYnDVYG9BYDVsB+lRR2Nc022kIdGKJy0EonubMPeCKjXWPR/ab+S/q
	I/a/7f/YnevgZcp9e5TdNQyP1HvhK2fCT+HjqymhEYNgXVfZ3h0Vb262F78U83GHfy8Ht2Meco8lY
	oy/k9vosTmt32XQ1X0Jte4gA/EH/C4L2EohnZ6Zxxh39B5hghrHVHJa1AS2CcKoED42O/j2gR4MAf
	Uh8v7/7W5h/+5uFZq97O0UDRidVJ0IXRsbgsaLtL+7wZFSJH/n4ZbgL7Fx4UPR0RDRqoiQs6vhGUx
	AvjPhG0A==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRd0l-00000006t11-3rOk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 21:06:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B26D1C0A;
	Fri,  5 Dec 2025 14:01:51 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F040B3F740;
	Fri,  5 Dec 2025 14:01:54 -0800 (PST)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: James Morse <james.morse@arm.com>,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com,
	lcherian@marvell.com,
	bobo.shaobowang@huawei.com,
	tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com,
	Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>,
	peternewman@google.com,
	dfustini@baylibre.com,
	amitsinght@marvell.com,
	David Hildenbrand <david@kernel.org>,
	Dave Martin <dave.martin@arm.com>,
	Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	fenghuay@nvidia.com,
	baisheng.gao@unisoc.com,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Gavin Shan <gshan@redhat.com>,
	Ben Horgan <ben.horgan@arm.com>,
	rohit.mathew@arm.com,
	reinette.chatre@intel.com,
	Punit Agrawal <punit.agrawal@oss.qualcomm.com>
Subject: [RFC PATCH 37/38] arm_mpam: Add workaround for T241-MPAM-6
Date: Fri,  5 Dec 2025 21:59:00 +0000
Message-Id: <20251205215901.17772-38-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251205215901.17772-1-james.morse@arm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_210646_621100_4612E387 
X-CRM114-Status: GOOD (  19.19  )
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

The registers MSMON_MBWU_L and MSMON_MBWU return the number of
requests rather than the number of bytes transferred.

Bandwidth resource monitoring is performed at the last level cache,
where each request arrive in 64Byte granularity. The current
implementation returns the number of transactions received at the
last level cache but does not provide the value in bytes. Scaling
by 64 gives an accurate byte count to match the MPAM specification
for the MSMON_MBWU and MSMON_MBWU_L registers. This patch fixes
the issue by reporting the actual number of bytes instead of the
number of transactions from __ris_msmon_read().

Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
Signed-off-by: James Morse <james.morse@arm.com>
---
 Documentation/arch/arm64/silicon-errata.rst |  2 ++
 drivers/resctrl/mpam_devices.c              | 24 +++++++++++++++++++--
 drivers/resctrl/mpam_internal.h             |  1 +
 3 files changed, 25 insertions(+), 2 deletions(-)

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
index 5ba0aa703807..c17a6fdea982 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -684,6 +684,12 @@ static const struct mpam_quirk mpam_quirks[] = {
 	.iidr_mask  = MPAM_IIDR_MATCH_ONE,
 	.workaround = T241_FORCE_MBW_MIN_TO_ONE,
 	},
+	{
+	/* NVIDIA t241 erratum T241-MPAM-6 */
+	.iidr       = MPAM_IIDR_NVIDIA_T421,
+	.iidr_mask  = MPAM_IIDR_MATCH_ONE,
+	.workaround = T241_MBW_COUNTER_SCALE_64,
+	},
 	{ NULL }, /* Sentinel */
 };
 
@@ -1140,7 +1146,7 @@ static void write_msmon_ctl_flt_vals(struct mon_read *m, u32 ctl_val,
 	}
 }
 
-static u64 mpam_msmon_overflow_val(enum mpam_device_features type)
+static u64 __mpam_msmon_overflow_val(enum mpam_device_features type)
 {
 	/* TODO: implement scaling counters */
 	switch (type) {
@@ -1155,6 +1161,17 @@ static u64 mpam_msmon_overflow_val(enum mpam_device_features type)
 	}
 }
 
+static u64 mpam_msmon_overflow_val(enum mpam_device_features type,
+				   struct mpam_msc *msc)
+{
+	u64 overflow_val = __mpam_msmon_overflow_val(type);
+
+	if (mpam_has_quirk(T241_MBW_COUNTER_SCALE_64, msc))
+		overflow_val *= 64;
+
+	return overflow_val;
+}
+
 static void __ris_msmon_read(void *arg)
 {
 	u64 now;
@@ -1245,13 +1262,16 @@ static void __ris_msmon_read(void *arg)
 			now = FIELD_GET(MSMON___VALUE, now);
 		}
 
+		if (mpam_has_quirk(T241_MBW_COUNTER_SCALE_64, msc))
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
index 01882f0acee2..108a8373901c 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -224,6 +224,7 @@ struct mpam_props {
 enum mpam_device_quirks {
 	T241_SCRUB_SHADOW_REGS,
 	T241_FORCE_MBW_MIN_TO_ONE,
+	T241_MBW_COUNTER_SCALE_64,
 	MPAM_QUIRK_LAST,
 };
 
-- 
2.39.5


