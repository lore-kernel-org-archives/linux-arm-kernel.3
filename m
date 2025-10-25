Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C5CCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 09:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lKlFKPFWui0rBF7JkALPT4rV4/6BtprmXI6qCc+ucnA=; b=mMfSPaJdGKRfYb035tTEye5QbA
	8w89ylidxG+udW1TXX3Veocwnr+Pn4wiasoo7m6ydZj5Annz3bpKOxei0TJeao0UlwbDeOUiHUWXq
	dzYi0mTxsND+c6E7e0WU/1tOrKTmNf2R4a2SVyzIq4pDmKsrZgAcypBMtLoXZ4QpbTv1/vnMSfOZd
	0WGglcrGzCPdEKGMLkftYd29iTO1/bYQ6hvanmmKVswoMhFgwhDQoU71mFMFJT5lJdaR0/cWjaWYX
	xOj1gDahhlHSCb8EX1/6de76v4KLv4JX8h7ELrlAzssMKP7JQbPPaMHfrcGqC7X/qiOsDpduY0+d6
	/Epv4n3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCafj-0000000BB2l-2AwW;
	Sat, 25 Oct 2025 09:34:51 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCaff-0000000BB2N-1Yoz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 09:34:49 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=lKlFKPFWui0rBF7JkALPT4rV4/6BtprmXI6qCc+ucnA=;
	b=pI2Ce4vySPQvfHaznAABDEnVBnVP5iKVw+xG5yvYh+bN0vv24/CP7qMoFWYrpqHsj4RYoRu3X
	z+fZXrVao8Lu/FXvBQzyK53O5TTEzH7KrybEvJkIUlmqabHGNXmO4OIA1AuIUmiQNXe9URANqOy
	cc8GcvVx4i33G4OQvyLozkU=
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4ctvjW3FDSz1prLt;
	Sat, 25 Oct 2025 17:34:07 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 3FCA6180087;
	Sat, 25 Oct 2025 17:34:34 +0800 (CST)
Received: from huawei.com (10.50.87.109) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 25 Oct
 2025 17:34:32 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <ben.horgan@arm.com>, <james.morse@arm.com>
CC: <zengheng4@huawei.com>, <amitsinght@marvell.com>,
	<baisheng.gao@unisoc.com>, <baolin.wang@linux.alibaba.com>,
	<carl@os.amperecomputing.com>, <catalin.marinas@arm.com>, <dakr@kernel.org>,
	<dave.martin@arm.com>, <david@redhat.com>, <dfustini@baylibre.com>,
	<fenghuay@nvidia.com>, <gregkh@linuxfoundation.org>, <gshan@redhat.com>,
	<guohanjun@huawei.com>, <jeremy.linton@arm.com>,
	<jonathan.cameron@huawei.com>, <kobak@nvidia.com>, <lcherian@marvell.com>,
	<lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<lpieralisi@kernel.org>, <peternewman@google.com>, <quic_jiles@quicinc.com>,
	<rafael@kernel.org>, <robh@kernel.org>, <rohit.mathew@arm.com>,
	<scott@os.amperecomputing.com>, <sdonthineni@nvidia.com>,
	<sudeep.holla@arm.com>, <sunnanyong@huawei.com>, <tan.shaopeng@fujitsu.com>,
	<wangkefeng.wang@huawei.com>, <will@kernel.org>, <xhao@linux.alibaba.com>
Subject: [PATCH] arm64/mpam: Clean MBWU monitor overflow bit
Date: Sat, 25 Oct 2025 17:34:28 +0800
Message-ID: <20251025093428.1379218-1-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <a3e95937-b0c7-020e-d52d-7189d2540f8f@huawei.com>
References: <a3e95937-b0c7-020e-d52d-7189d2540f8f@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.87.109]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_023448_034669_2609C170 
X-CRM114-Status: GOOD (  13.93  )
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
inadvertently cleared by the write operation. Then, before updating the
monitor configuration, the overflow bit should be cleared to zero.

Finally, use the overflow bit instead of relying on counter wrap-around
to determine whether an overflow has occurred, that avoids the case where
a wrap-around (now > prev_val) is overlooked.

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 drivers/resctrl/mpam_devices.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 0dd048279e02..575980e3a366 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1062,6 +1062,21 @@ static u64 mpam_msmon_overflow_val(enum mpam_device_features type)
 	}
 }
 
+static bool read_msmon_mbwu_is_overflow(struct mpam_msc *msc)
+{
+	u32 ctl;
+	bool overflow;
+
+	ctl = mpam_read_monsel_reg(msc, CFG_MBWU_CTL);
+	overflow = ctl & MSMON_CFG_x_CTL_OFLOW_STATUS ? true : false;
+
+	if (overflow)
+		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, ctl &
+				     ~MSMON_CFG_x_CTL_OFLOW_STATUS);
+
+	return overflow;
+}
+
 /* Call with MSC lock held */
 static void __ris_msmon_read(void *arg)
 {
@@ -1069,6 +1084,7 @@ static void __ris_msmon_read(void *arg)
 	bool config_mismatch;
 	struct mon_read *m = arg;
 	u64 now, overflow_val = 0;
+	bool mbwu_overflow = false;
 	struct mon_cfg *ctx = m->ctx;
 	bool reset_on_next_read = false;
 	struct mpam_msc_ris *ris = m->ris;
@@ -1091,6 +1107,7 @@ static void __ris_msmon_read(void *arg)
 			reset_on_next_read = mbwu_state->reset_on_next_read;
 			mbwu_state->reset_on_next_read = false;
 		}
+		mbwu_overflow = read_msmon_mbwu_is_overflow(msc);
 	}
 
 	/*
@@ -1138,8 +1155,8 @@ static void __ris_msmon_read(void *arg)
 		mbwu_state = &ris->mbwu_state[ctx->mon];
 
 		/* Add any pre-overflow value to the mbwu_state->val */
-		if (mbwu_state->prev_val > now)
-			overflow_val = mpam_msmon_overflow_val(m->type) - mbwu_state->prev_val;
+		if (mbwu_overflow)
+			overflow_val = mpam_msmon_overflow_val(m->type);
 
 		mbwu_state->prev_val = now;
 		mbwu_state->correction += overflow_val;
-- 
2.25.1


