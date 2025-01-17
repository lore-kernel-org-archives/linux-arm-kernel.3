Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50417C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 15:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y7L9yMmJ5aTCZdUcF/ir4P0mH3+A1/6Rg2eTmdlssCI=; b=ChXIjNhsAiRiN5lSoi45tel024
	fdQpfuRtgq9CFFejrE5uS8XZbk2pLeTwljDDTpNTrqzyy3Y4GCDQAab6a9th8RLEII7XcM/U3faH0
	pEqb9LeUivd9lG/BCJydUuZfpVsDdzaSoKTMnLNplxWym4WeYai+wjDrPPwpKsoKkcpzMaMRri6ui
	HgF5pUSJi6ezcmn5ouzHYZaOjuxrS//sfb2dLwSSt0i2ZvPgGy7qB8M9VRIcUATAcwQGZOW3C429I
	gFHc0dJoxd4sc3NDED1DYIEuxo+fo9nAKnfrhXK51Vca0EPh4IGHyYefydmwRnwChrbP/YsipsiZw
	Kfmh64nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYo2M-00000000ZtF-321k;
	Fri, 17 Jan 2025 15:13:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYnzr-00000000ZET-1GoX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 15:10:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 801AC2247;
	Fri, 17 Jan 2025 07:11:22 -0800 (PST)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6159F3F73F;
	Fri, 17 Jan 2025 07:10:53 -0800 (PST)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Zeng Heng <zengheng4@huawei.com>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	James Morse <james.morse@arm.com>
Subject: [RFC PATCH v2 02/11] arm_mpam: Delete unused function resctrl_arch_set_rmid()
Date: Fri, 17 Jan 2025 15:10:12 +0000
Message-Id: <20250117151033.1517882-3-Dave.Martin@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117151033.1517882-1-Dave.Martin@arm.com>
References: <20250117151033.1517882-1-Dave.Martin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_071055_381225_6FB702AF 
X-CRM114-Status: UNSURE (   9.62  )
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

The function resctrl_arch_set_rmid() appears to have been left
behind after earlier refactoring and is now unused.

To avoid needing to answer awkward questions about how this
function should apply partition ID namespace remappings, just get
rid of it.

No functional change.

Signed-off-by: Dave Martin <Dave.Martin@arm.com>

---

I'm assuming here that there are no pending branches that implement /
use this function.

When moving tasks between monitoring groups, resctrlfs currently
extracts the CLOSID from struct rdtgroup and passes it explicitly
to resctrl_arch_set_closid_rmid(), so there seems to be no need for
a separate helper that doesn't overwrite the arch's control
partition identifier.
---
 arch/arm64/include/asm/mpam.h | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/arch/arm64/include/asm/mpam.h b/arch/arm64/include/asm/mpam.h
index e5f385767174..df725d2d9d05 100644
--- a/arch/arm64/include/asm/mpam.h
+++ b/arch/arm64/include/asm/mpam.h
@@ -93,20 +93,6 @@ static inline u64 mpam_get_regval(struct task_struct *tsk)
 #endif
 }
 
-static inline void resctrl_arch_set_rmid(struct task_struct *tsk, u32 rmid)
-{
-#ifdef CONFIG_ARM64_MPAM
-	u64 regval = mpam_get_regval(tsk);
-
-	regval &= ~MPAM1_EL1_PMG_D;
-	regval &= ~MPAM1_EL1_PMG_I;
-	regval |= FIELD_PREP(MPAM1_EL1_PMG_D, rmid);
-	regval |= FIELD_PREP(MPAM1_EL1_PMG_I, rmid);
-
-	WRITE_ONCE(task_thread_info(tsk)->mpam_partid_pmg, regval);
-#endif
-}
-
 static inline void mpam_thread_switch(struct task_struct *tsk)
 {
 	u64 oldregval;
-- 
2.34.1


