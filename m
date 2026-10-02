Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E78FCA5FE2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 17:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W7KuXMUkqdS13mSuUqFqhhqNyiwMk20/+kp83pZwCSk=; b=NqpNZHstjIg6gKb3UPmYs29hoT
	+Bw7C8UKPuqKcROLYOP6xorfnqUerM581etIpdS6Sciw4PojeyZuyGRAzG6KQ+2eLLnQ0UxPKYE/Z
	B+AcUyBDyvJfLv8WOc6d8sIMK/LvdbJu/3OgN6QHdSCZ4MEAYbkzYzj1/oMr1+yDJSt0oVWhlnqCr
	4MCF9XRFxa22ZK2ygP2EuF16xg7mI+m7Y4YI6tCdt3vSMdaBNYazRo8pLPEvJ6lAusoNwYVKN2Zd6
	n6X2idqm/MqGp2V0EgVN5hlnPQjqjaPJJstly5sT/DOL2rpXFB9RsSeIW7gbQyZiaVc3WjGFwlGmk
	wksq/X7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChF0-0000000CBNg-1tPi;
	Fri, 02 Oct 2026 17:40:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChEw-0000000CBGI-12P0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 17:40:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72AD42F;
	Fri,  2 Oct 2026 10:40:06 -0700 (PDT)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C7E093F85F;
	Fri,  2 Oct 2026 10:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790962809; bh=9Xh6aw7K4Zy0sKzHeFLnO3JiqMdnflcNr2mIAPe6rbE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GMIWSKk1EnUuqCNJAT1ouElXOtGKPc8KfZTd7wX7/iG58IBIkZZp6LzkTtLJF/RmE
	 pKIE7aGm9YtaEvg90do7AoMk7oy/nk8ewBP9mBou1PYPMcbeW4rHdoF88F5a3wS9FZ
	 ybdBt36mLahxpezUb6KjjcTQwjeo/QEZwKOOvwRY=
From: James Morse <james.morse@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Gavin Shan <gshan@redhat.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 07/27] arm_mpam: Initialize all of struct mon_read in mpam_restore_mbwu_state()
Date: Fri,  2 Oct 2026 18:39:20 +0100
Message-ID: <20261002173941.292319-8-james.morse@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002173941.292319-1-james.morse@arm.com>
References: <20261002173941.292319-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_104010_328406_51242F5E 
X-CRM114-Status: GOOD (  11.77  )
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

From: Ben Horgan <ben.horgan@arm.com>

m->err and *m->val may be read before initialization in __ris_msmon_read()
when called from mpam_restore_mbwu_state().

Initialize the whole struct mon_read in mpam_restore_mbwu_state() and fix
the spelling of mbwu in the name.

Fixes: 41e8a14950e1 ("arm_mpam: Track bandwidth counter state for power management")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Tested-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: James Morse <james.morse@arm.com>
Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_devices.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index a3d58a51dc73..2369f814de48 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1655,7 +1655,7 @@ static int mpam_restore_mbwu_state(void *_ris)
 {
 	int i;
 	u64 val;
-	struct mon_read mwbu_arg;
+	struct mon_read mbwu_arg;
 	struct mpam_msc_ris *ris = _ris;
 	struct msmon_mbwu_state *mbwu_state;
 	struct mpam_msc *msc = ris->vmsc->msc;
@@ -1672,14 +1672,17 @@ static int mpam_restore_mbwu_state(void *_ris)
 			continue;
 		}
 
-		mwbu_arg.ris = ris;
-		mwbu_arg.ctx = &mbwu_state->cfg;
-		mwbu_arg.type = mpam_msmon_choose_counter(class);
-		mwbu_arg.val = &val;
+		val = 0;
+		mbwu_arg = (struct mon_read) {
+			.ris = ris,
+			.ctx = &mbwu_state->cfg,
+			.type = mpam_msmon_choose_counter(class),
+			.val = &val,
+		};
 
 		mbwu_state->reset_on_next_read = true;
 
-		__ris_msmon_read_locked(&mwbu_arg);
+		__ris_msmon_read_locked(&mbwu_arg);
 
 		mpam_mon_sel_unlock(msc);
 	}
-- 
2.53.0


