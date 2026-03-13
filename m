Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FABC105F7AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 14:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7hmrc7E4N1O33Dgmjo3wpHwaqQJ3tUam2wicpgCLnlA=; b=L2m0vqCkBXe/J5fT61+du/H7TJ
	Dfq80BeSmnIcJD8ore7hF8hJsxNBanEwjB82V3btczk9XAgXwdIYnsEutwXkICQESegOeXzdSuPOl
	nl+woNbO3efqahwKq9PUncMlta58YEYihAPHCfqKDF4iuXI6p9zEIcn+cWX6Zl4PH5bzoFPPo/hJT
	V7c8zwV3m5Q2TvRwFRQ15gzi5cPB6R/HTFbplTpzrfrPdmiCQ2TIbn7LugBZ6awEjtYwDlQwws101
	XnkOrQDM5b7SZ/EuVk5CHo38gHWVtCq7OCnLNyAAIso9ucfO+Hh8l5eoUTe+UR3HGC1orR0kh7DD3
	9A7XhEnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13mi-00000000QLE-32t6;
	Fri, 13 Mar 2026 14:46:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13mf-00000000QJf-1mGl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 14:46:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B1D91E7D;
	Fri, 13 Mar 2026 07:46:30 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 861153F7BD;
	Fri, 13 Mar 2026 07:46:32 -0700 (PDT)
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
Subject: [PATCH v6 01/40] arm_mpam: Ensure in_reset_state is false after applying configuration
Date: Fri, 13 Mar 2026 14:45:38 +0000
Message-ID: <20260313144617.3420416-2-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313144617.3420416-1-ben.horgan@arm.com>
References: <20260313144617.3420416-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_074637_512516_8165908D 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
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

From: Zeng Heng <zengheng4@huawei.com>

The per-RIS flag, in_reset_state, indicates whether or not the MSC
registers are in reset state, and allows avoiding resetting when they are
already in reset state. However, when mpam_apply_config() updates the
configuration it doesn't update the in_reset_state flag and so even after
the configuration update in_reset_state can be true and mpam_reset_ris()
will skip the actual register restoration on subsequent resets.

Once resctrl has a MPAM backend it will use resctrl_arch_reset_all_ctrls()
to reset the MSC configuration on unmount and, if the in_reset_state flag
is bogusly true, fail to reset the MSC configuration. The resulting
non-reset MSC configuration can lead to persistent performance restrictions
even after resctrl is unmounted.

Fix by clearing in_reset_state to false immediately after successful
configuration application, ensuring that the next reset operation
properly restores MSC register defaults.

Fixes: 09b89d2a72f3 ("arm_mpam: Allow configuration to be applied and restored during cpu online")
Signed-off-by: Zeng Heng <zengheng4@huawei.com>
Acked-by: Ben Horgan <ben.horgan@arm.com>
[Horgan: rewrite commit message to not be specific to resctrl unmount]
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Subject was originally:
arm_mpam: Fix MPAM reset on resctrl unmount by clearing in_reset_state
---
 drivers/resctrl/mpam_devices.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 1eebc2602187..0fd6590a9b5c 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2692,6 +2692,7 @@ int mpam_apply_config(struct mpam_component *comp, u16 partid,
 					 srcu_read_lock_held(&mpam_srcu)) {
 			arg.ris = ris;
 			mpam_touch_msc(msc, __write_config, &arg);
+			ris->in_reset_state = false;
 		}
 		mutex_unlock(&msc->cfg_lock);
 	}
-- 
2.43.0


