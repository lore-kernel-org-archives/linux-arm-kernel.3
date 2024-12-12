Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11634E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 15:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y7L9yMmJ5aTCZdUcF/ir4P0mH3+A1/6Rg2eTmdlssCI=; b=qToXhEZoR8CgAJ5lwSsNsI4t5U
	chVs2fAklHbkeRwXRthaagxKMb4wcshTRJRWQYcvCOjg9uKG/BHNtdZwPfunKiT7ZZIynzjz4KYC+
	pdsL0N7EWuef/QZzc588NyDLjr+U78GnsVFRZ+ZUnC2HhEi3ibZBmSay1cW74f49+9hgoj3kXIp0+
	9vNZhZTcsq4onDQWSbJgHjnCtM9mpMlp/kI5s0z+6DFvxECMLGkcZuIIlvQkOBioYleedMyoQu5as
	Jc7vJI297DXdfbXmB21DjPq8JhMxsTs2TWGBCdzM1D/g7IT94U28nfuU45SgAoXDFlwqbLusI68L2
	7dYTWvIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlLr-00000000nYX-44XV;
	Thu, 12 Dec 2024 15:43:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlIj-00000000mvQ-20em
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 15:40:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1936176C;
	Thu, 12 Dec 2024 07:40:56 -0800 (PST)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E0E123F720;
	Thu, 12 Dec 2024 07:40:27 -0800 (PST)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Zeng Heng <zengheng4@huawei.com>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	James Morse <james.morse@arm.com>
Subject: [RFC PATCH 3/6] arm_mpam: Delete unused function resctrl_arch_set_rmid()
Date: Thu, 12 Dec 2024 15:39:57 +0000
Message-Id: <20241212154000.330467-4-Dave.Martin@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241212154000.330467-1-Dave.Martin@arm.com>
References: <20241212154000.330467-1-Dave.Martin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_074029_561777_14160A7C 
X-CRM114-Status: UNSURE (   9.23  )
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


