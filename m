Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25512CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 12:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CTxDonXT+6eYT4U1PVsH18r6PVutyauEFHAYgV8gNkg=; b=tX0BiMOmeqDciiG8YCoRojdje6
	tLY6AGeCwIoRuymRTYqI97BWLCkJO6VPI7mdrEI7FkhAmTT62JQI/lqIOjFWxPnR3+4Cdn5PEDLDS
	iwxznY1Wkw+ODtBjR9GNht59lEDPqBBgTI/owBy8awrxemDLTKE1Qe53gLktTZ27nd0SvG9J05p1u
	hLPOvjeA3eF1k4HQWa0e9FIuwNtlLD2l4X6FczfnjSuX2UiphPOH+qUlr9z0FwJrlSPmUQLfXclPI
	c7SHPehCvzyY+8H4Bo9LnYY7nCUDF4GS96bCUhndy7/u4wFmDlyxbA8MN/qxP3rr/5HHmuJ68sveX
	dpNKsTLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHLj4-0000000HKg7-3Tx7;
	Fri, 07 Nov 2025 12:37:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHLj1-0000000HKbQ-1Qr2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 12:37:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E7161A2D;
	Fri,  7 Nov 2025 04:37:47 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DC06C3F66E;
	Fri,  7 Nov 2025 04:37:49 -0800 (PST)
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
	Zeng Heng <zengheng4@huawei.com>
Subject: [PATCH 28/33] arm_mpam: Consider overflow in bandwidth counter state
Date: Fri,  7 Nov 2025 12:34:45 +0000
Message-ID: <20251107123450.664001-29-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251107123450.664001-1-ben.horgan@arm.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_043755_535214_019EE662 
X-CRM114-Status: GOOD (  16.49  )
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

Use the overflow status bit to track overflow on each bandwidth counter
read and add the counter size to the correction when overflow is detected.

This assumes that only a single overflow has occurred since the last read
of the counter. Overflow interrupts, on hardware that supports them could
be used to remove this limitation.

Cc: Zeng Heng <zengheng4@huawei.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_devices.c  | 24 ++++++++++++++++++++++--
 drivers/resctrl/mpam_internal.h |  3 ++-
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 2d1cef824b8e..eea082dfcddc 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -986,11 +986,18 @@ static void write_msmon_ctl_flt_vals(struct mon_read *m, u32 ctl_val,
 	}
 }
 
+static u64 mpam_msmon_overflow_val(enum mpam_device_features type)
+{
+	/* TODO: scaling, and long counters */
+	return BIT_ULL(hweight_long(MSMON___VALUE));
+}
+
 static void __ris_msmon_read(void *arg)
 {
 	u64 now;
 	bool nrdy = false;
 	bool config_mismatch;
+	bool overflow;
 	struct mon_read *m = arg;
 	struct mon_cfg *ctx = m->ctx;
 	struct mpam_msc_ris *ris = m->ris;
@@ -1012,13 +1019,20 @@ static void __ris_msmon_read(void *arg)
 	 * This saves waiting for 'nrdy' on subsequent reads.
 	 */
 	read_msmon_ctl_flt_vals(m, &cur_ctl, &cur_flt);
+	overflow = cur_ctl & MSMON_CFG_x_CTL_OFLOW_STATUS;
+
 	clean_msmon_ctl_val(&cur_ctl);
 	gen_msmon_ctl_flt_vals(m, &ctl_val, &flt_val);
 	config_mismatch = cur_flt != flt_val ||
 			  cur_ctl != (ctl_val | MSMON_CFG_x_CTL_EN);
 
-	if (config_mismatch)
+	if (config_mismatch) {
 		write_msmon_ctl_flt_vals(m, ctl_val, flt_val);
+		overflow = false;
+	} else if (overflow) {
+		mpam_write_monsel_reg(msc, CFG_MBWU_CTL,
+				      cur_ctl & ~MSMON_CFG_x_CTL_OFLOW_STATUS);
+	}
 
 	switch (m->type) {
 	case mpam_feat_msmon_csu:
@@ -1038,7 +1052,13 @@ static void __ris_msmon_read(void *arg)
 
 		mbwu_state = &ris->mbwu_state[ctx->mon];
 
-		/* Include bandwidth consumed before the last hardware reset */
+		if (overflow)
+			mbwu_state->correction += mpam_msmon_overflow_val(m->type);
+
+		/*
+		 * Include bandwidth consumed before the last hardware reset and
+		 * a counter size increment for each overflow.
+		 */
 		now += mbwu_state->correction;
 		break;
 	default:
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 1f2b04b7703e..7c99d4f3dc9c 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -209,7 +209,8 @@ struct msmon_mbwu_state {
 	struct mon_cfg	cfg;
 
 	/*
-	 * The value to add to the new reading to account for power management.
+	 * The value to add to the new reading to account for power management,
+	 * and overflow.
 	 */
 	u64		correction;
 
-- 
2.43.0


