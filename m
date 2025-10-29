Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E252CCCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 07:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z1vyOpOhp4uD5m84f0sJub6GwUG0B1xwG+9pVCSYuwI=; b=IBMELat6h1IBNVuKagjzIItKak
	cEN//MZXFAa/qdaayjBoJujAA133O3bfmjippOB2f/ARGTl7paj0NmwgyDeLpsTKdE1qSW2QNDEcy
	4lt/LWXHD93j70DuKugVw78wF4opbBjREQVejNobvvZzVaZbQmFoQeVrJzsbynqAB3lqV+ofdt37p
	9/TXVKX2CPjVYYe9Sj7QjASgOr8+I3iNLZCtpnXpZfrVScVPJUfxNLZecdzkFsIjeNMtzk0RrgtNF
	VA0bpYuBVeRKGPJrSWf7k3dC+SX/LRT8jzMsgT20blPdyeuPlTO51b6ccBnEWjbrUp9YfI+anzxFz
	DJVMu6pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE13e-00000000Aww-0g92;
	Wed, 29 Oct 2025 07:57:26 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE13Z-00000000AvJ-46g5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 07:57:24 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=z1vyOpOhp4uD5m84f0sJub6GwUG0B1xwG+9pVCSYuwI=;
	b=G8u1pPmy1fO2CL371jWqpD3qax41pRC3q692WFthDSvTFEGBGEfdqp93EKbEsFHDco9m7lPEg
	VIRGQq9RsxpaYg0AhQc1dDuThF4fs/P4Kf98IMGnBf/vGWAgeyDWLMj/U1PJsKTTaHgGIZSaA18
	4ZiLQs9zEfQLbAb/Y6ubeHs=
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4cxKM55ZVvz12LFQ;
	Wed, 29 Oct 2025 15:56:33 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 073C7180491;
	Wed, 29 Oct 2025 15:57:11 +0800 (CST)
Received: from huawei.com (10.50.87.109) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 29 Oct
 2025 15:57:09 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <ben.horgan@arm.com>, <james.morse@arm.com>
CC: <amitsinght@marvell.com>, <baisheng.gao@unisoc.com>,
	<baolin.wang@linux.alibaba.com>, <carl@os.amperecomputing.com>,
	<catalin.marinas@arm.com>, <dakr@kernel.org>, <dave.martin@arm.com>,
	<david@redhat.com>, <dfustini@baylibre.com>, <fenghuay@nvidia.com>,
	<gregkh@linuxfoundation.org>, <gshan@redhat.com>, <guohanjun@huawei.com>,
	<jeremy.linton@arm.com>, <jonathan.cameron@huawei.com>, <kobak@nvidia.com>,
	<lcherian@marvell.com>, <lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<lpieralisi@kernel.org>, <peternewman@google.com>, <quic_jiles@quicinc.com>,
	<rafael@kernel.org>, <robh@kernel.org>, <rohit.mathew@arm.com>,
	<scott@os.amperecomputing.com>, <sdonthineni@nvidia.com>,
	<sudeep.holla@arm.com>, <tan.shaopeng@fujitsu.com>, <will@kernel.org>,
	<xhao@linux.alibaba.com>, <wangkefeng.wang@huawei.com>,
	<sunnanyong@huawei.com>, <zengheng4@huawei.com>
Subject: [PATCH v2] arm64/mpam: Clean MBWU monitor overflow bit
Date: Wed, 29 Oct 2025 15:56:55 +0800
Message-ID: <20251029075655.3284280-1-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251017185645.26604-25-james.morse@arm.com>
References: <20251017185645.26604-25-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.87.109]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_005722_690594_5AF53235 
X-CRM114-Status: GOOD (  18.01  )
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

The MSMON_MBWU register accumulates counts monotonically forward and
would not automatically cleared to zero on overflow. The overflow portion
is exactly what mpam_msmon_overflow_val() computes, there is no need to
additionally subtract mbwu_state->prev_val.

Before invoking write_msmon_ctl_flt_vals(), the overflow bit of the
MSMON_MBWU register must first be read to prevent it from being
inadvertently cleared by the write operation.

Finally, use the overflow bit instead of relying on counter wrap-around
to determine whether an overflow has occurred, that avoids the case where
a wrap-around (now > prev_val) is overlooked. So with this, prev_val no
longer has any use and remove it.

CC: Ben Horgan <ben.horgan@arm.com>
Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 drivers/resctrl/mpam_devices.c  | 22 +++++++++++++++++-----
 drivers/resctrl/mpam_internal.h |  3 ---
 2 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 0dd048279e02..db4cec710091 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1039,7 +1039,6 @@ static void write_msmon_ctl_flt_vals(struct mon_read *m, u32 ctl_val,
 		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, ctl_val | MSMON_CFG_x_CTL_EN);

 		mbwu_state = &m->ris->mbwu_state[m->ctx->mon];
-		mbwu_state->prev_val = 0;

 		break;
 	default:
@@ -1062,6 +1061,16 @@ static u64 mpam_msmon_overflow_val(enum mpam_device_features type)
 	}
 }

+static bool read_msmon_mbwu_is_overflow(struct mpam_msc *msc)
+{
+	u32 ctl;
+
+	ctl = mpam_read_monsel_reg(msc, CFG_MBWU_CTL);
+	return ctl & (MSMON_CFG_x_CTL_OFLOW_STATUS |
+		      MSMON_CFG_MBWU_CTL_OFLOW_STATUS_L) ?
+		      true : false;
+}
+
 /* Call with MSC lock held */
 static void __ris_msmon_read(void *arg)
 {
@@ -1069,6 +1078,7 @@ static void __ris_msmon_read(void *arg)
 	bool config_mismatch;
 	struct mon_read *m = arg;
 	u64 now, overflow_val = 0;
+	bool mbwu_overflow = false;
 	struct mon_cfg *ctx = m->ctx;
 	bool reset_on_next_read = false;
 	struct mpam_msc_ris *ris = m->ris;
@@ -1091,6 +1101,7 @@ static void __ris_msmon_read(void *arg)
 			reset_on_next_read = mbwu_state->reset_on_next_read;
 			mbwu_state->reset_on_next_read = false;
 		}
+		mbwu_overflow = read_msmon_mbwu_is_overflow(msc);
 	}

 	/*
@@ -1103,8 +1114,10 @@ static void __ris_msmon_read(void *arg)
 	config_mismatch = cur_flt != flt_val ||
 			  cur_ctl != (ctl_val | MSMON_CFG_x_CTL_EN);

-	if (config_mismatch || reset_on_next_read)
+	if (config_mismatch || reset_on_next_read) {
 		write_msmon_ctl_flt_vals(m, ctl_val, flt_val);
+		mbwu_overflow = false;
+	}

 	switch (m->type) {
 	case mpam_feat_msmon_csu:
@@ -1138,10 +1151,9 @@ static void __ris_msmon_read(void *arg)
 		mbwu_state = &ris->mbwu_state[ctx->mon];

 		/* Add any pre-overflow value to the mbwu_state->val */
-		if (mbwu_state->prev_val > now)
-			overflow_val = mpam_msmon_overflow_val(m->type) - mbwu_state->prev_val;
+		if (mbwu_overflow)
+			overflow_val = mpam_msmon_overflow_val(m->type);

-		mbwu_state->prev_val = now;
 		mbwu_state->correction += overflow_val;

 		/* Include bandwidth consumed before the last hardware reset */
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 4f25681b56ab..8837c0cd7b0c 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -226,9 +226,6 @@ struct msmon_mbwu_state {
 	bool		reset_on_next_read;
 	struct mon_cfg	cfg;

-	/* The value last read from the hardware. Used to detect overflow. */
-	u64		prev_val;
-
 	/*
 	 * The value to add to the new reading to account for power management,
 	 * and shifts to trigger the overflow interrupt.
--
2.25.1


