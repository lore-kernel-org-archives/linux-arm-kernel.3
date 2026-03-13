Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E7F105F7AF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 14:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MZdBkoEoPCzW07wZZMNvgoxvnFHidGDaxyR082n8zKc=; b=lMy6P4LuCvQq/XkjM2ouLLuUhN
	IZwD75BtdIUpGbv9gEbKP5M8u1TPzmRHptjPRaPnXN8IQfZ9Hhiqmz4H/48s1x3PEeUNvEBGRTSOU
	VYCv1vWiCAU0nlIaTtddb4NgIqTPXUNPp37vguicFd1ebkMFjL8TyK4oIz3ItAjYwLvhnhXtgSoUG
	0fixCzjH86TuFDHRfECEaWgN5E9W69naKWQ3D3K0YR45ifgDrOgR0/KFswVGyvhG2kogeXQ/iKHpe
	kWXN/APm02Ei9roiU3K9k/fM+xUasoxmSDAtXYVY+Qxgv+O4926JsOKFYOUkge4LNvDsNgWHvVO0j
	fDBthQZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13o6-00000000RYO-26wp;
	Fri, 13 Mar 2026 14:48:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13o0-00000000RS9-45nK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 14:48:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AB3822C7;
	Fri, 13 Mar 2026 07:47:54 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A88F33F7BD;
	Fri, 13 Mar 2026 07:47:56 -0700 (PDT)
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
Subject: [PATCH v6 21/40] arm_mpam: resctrl: Hide CDP emulation behind CONFIG_EXPERT
Date: Fri, 13 Mar 2026 14:45:58 +0000
Message-ID: <20260313144617.3420416-22-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313144617.3420416-1-ben.horgan@arm.com>
References: <20260313144617.3420416-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_074801_354579_855F08BB 
X-CRM114-Status: GOOD (  12.35  )
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

When CDP is not enabled, the 'rmid_entry's in the limbo list,
rmid_busy_llc, map directly to a (PARTID,PMG) pair and when CDP is enabled
the mapping is to two different pairs. As the limbo list is reused between
mounts and CDP disabled on unmount this can lead to stale mapping and the
limbo handler will then make monitor reads with potentially out of range
PARTID. This may then cause an MPAM error interrupt and the driver will
disable MPAM.

No problems are expected if you just mount the resctrl file system
once with CDP enabled and never unmount it. Hide CDP emulation behind
CONFIG_EXPERT to protect the unwary.

Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Adding this ugliness in the hope of avoiding patch churn and extra
reviewer work. I am looking into the resctrl changes needed to fix this.
---
 drivers/resctrl/mpam_resctrl.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 903d1a0f564f..cab3e9ccb5c7 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -82,6 +82,18 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 	u32 partid_i = RESCTRL_RESERVED_CLOSID, partid_d = RESCTRL_RESERVED_CLOSID;
 	int cpu;
 
+	if (!IS_ENABLED(CONFIG_EXPERT) && enable) {
+		/*
+		 * If the resctrl fs is mounted more than once, sequentially,
+		 * then CDP can lead to the use of out of range PARTIDs.
+		 */
+		pr_warn("CDP not supported\n");
+		return -EOPNOTSUPP;
+	}
+
+	if (enable)
+		pr_warn("CDP is an expert feature and may cause MPAM to malfunction.\n");
+
 	/*
 	 * resctrl_arch_set_cdp_enabled() is only called with enable set to
 	 * false on error and unmount.
-- 
2.43.0


