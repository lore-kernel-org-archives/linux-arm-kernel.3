Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75E6CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 13:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/gRvTL7eqf9iXQ5TP4AZFk4roVkKeI9IWY56mWKesQk=; b=DLcEb72BJNRdN/o8GClBWCv2zp
	aUcvV5eP7NPLaR03xTSmwwA0F6ojaDHude5t+WvdshwVRK1zVgvCgpE0r67w565sVHqCGVf79t3/a
	BR5xzrCeD4YUkT/uooZoEr2u0maOBLnSxc5gTP82+l5J5kt0LtdME5jKHRAWN71+QJ8FheEqSzXEi
	kAKIPLxhjVa0Ys3zK5dpWhzGJPCqCl0k78ey97Vu4ekxpjv5JS9UfXSzveXblbVdJoAseupOoyFrr
	ThijsoEWeCcPu0Q2pCKKj7jBPiLg8r2tRx5MXIHHvxTuzP2UkJLJvsEGwvtoL8UL9B2YrjG0wcZ8y
	gcxqedeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZ3z-000000032eQ-2vyV;
	Wed, 22 Oct 2025 13:39:39 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZ3w-000000032cp-2aVG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 13:39:38 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4cs9BD26RTzJsbZ;
	Wed, 22 Oct 2025 21:34:28 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id CDDD018006C;
	Wed, 22 Oct 2025 21:39:19 +0800 (CST)
Received: from huawei.com (10.50.87.109) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 22 Oct
 2025 21:39:18 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <james.morse@arm.com>
CC: <amitsinght@marvell.com>, <baisheng.gao@unisoc.com>,
	<baolin.wang@linux.alibaba.com>, <bobo.shaobowang@huawei.com>,
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
	<sudeep.holla@arm.com>, <tan.shaopeng@fujitsu.com>, <will@kernel.org>,
	<xhao@linux.alibaba.com>, <zengheng4@huawei.com>,
	<wangkefeng.wang@huawei.com>
Subject: [PATCH mpam mpam/snapshot/v6.14-rc1] arm64/mpam: Fix MBWU monitor overflow handling
Date: Wed, 22 Oct 2025 21:39:13 +0800
Message-ID: <20251022133913.629859-1-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251017185645.26604-25-james.morse@arm.com>
References: <20251017185645.26604-25-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.87.109]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_063936_802556_6927B271 
X-CRM114-Status: GOOD (  11.26  )
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

Bandwidth counters need to run continuously to correctly reflect the
bandwidth. When reading the previously configured MSMON_CFG_MBWU_CTL,
software must recognize that the MSMON_CFG_x_CTL_OFLOW_STATUS bit may
have been set by hardware because of the counter overflow.

The existing logic incorrectly treats this bit as an indication that the
monitor configuration has been changed and consequently zeros the MBWU
statistics by mistake.

Also fix the handling of overflow amount calculation. There's no need to
subtract mbwu_state->prev_val when calculating overflow_val.

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 drivers/resctrl/mpam_devices.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 0dd048279e02..06f3ec9887d2 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1101,7 +1101,8 @@ static void __ris_msmon_read(void *arg)
 	clean_msmon_ctl_val(&cur_ctl);
 	gen_msmon_ctl_flt_vals(m, &ctl_val, &flt_val);
 	config_mismatch = cur_flt != flt_val ||
-			  cur_ctl != (ctl_val | MSMON_CFG_x_CTL_EN);
+			 (cur_ctl & ~MSMON_CFG_x_CTL_OFLOW_STATUS) !=
+			 (ctl_val | MSMON_CFG_x_CTL_EN);
 
 	if (config_mismatch || reset_on_next_read)
 		write_msmon_ctl_flt_vals(m, ctl_val, flt_val);
@@ -1138,8 +1139,9 @@ static void __ris_msmon_read(void *arg)
 		mbwu_state = &ris->mbwu_state[ctx->mon];
 
 		/* Add any pre-overflow value to the mbwu_state->val */
-		if (mbwu_state->prev_val > now)
-			overflow_val = mpam_msmon_overflow_val(m->type) - mbwu_state->prev_val;
+		if (mbwu_state->prev_val > now &&
+		   (cur_ctl & MSMON_CFG_x_CTL_OFLOW_STATUS))
+			overflow_val = mpam_msmon_overflow_val(ris);
 
 		mbwu_state->prev_val = now;
 		mbwu_state->correction += overflow_val;
-- 
2.25.1


