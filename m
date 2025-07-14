Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04434C83F21
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 11:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JBloXy11ldnukoq6hlp5/baShktB2M2+SyKDrlih00w=; b=GQz9EXHwIk1/o/oFdNgfH+2hVy
	x10JQAWf/6A9ppdF2+2ow2rNgr6R54oOSa6eX3LdZThSaarpb9JO44xDBUGodBJftRaL3pToQrnbC
	zNCVnBFhwA+11H/mnaJYICfDW4HGwT2oFAQJ0nC8LoHtbnzERETu20DMtUGS88c5Oxs8dMMRYv6zH
	La0iHPnuCCXlO8vh1/NiPNXd6Rg26VvO/+D5BWi6m7QbD8/wM4MiOQcglwCf5ApeT/Ujq3Afxxcmk
	xZ6TovDoBnM6GMkztrCnkHgsl6AXlvrufg5HGppFgnjY16MJc+uijjeKur3YXubtnmtiJqyGbvLge
	ZGuIudBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubHJC-000000021ez-44d1;
	Mon, 14 Jul 2025 11:25:22 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubHGj-000000021RT-1B4I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 11:22:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 852C4A56F0D;
	Mon, 14 Jul 2025 11:22:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31133C4CEED;
	Mon, 14 Jul 2025 11:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752492168;
	bh=eupN5HxOGmkNc6Cw38VhHgDtAG0xIE1iOkot5oZjUsY=;
	h=From:Date:Subject:To:Cc:From;
	b=sCRc4uDGr1GQfCSwBB6l/HLI1O3njulL2xrtgZ0DGT8bPoxcqX+Bg9sc6j71ZP2Mn
	 kX2VJ7uJPeeWREbAl/Mf2PNrJPhUjoSx+fpqpxLtoPg3NWpthbue5I4NFoaraEfVHJ
	 Trw2hjMsNMJPLG0TO7yFxCiwuZtl5gpCchnYee8KGFj4LPVDMRNOUIhh/UTY47vy+R
	 Ch+Sb+byjf5pgxKlMGetMO4yy3p623PBGD1+oT6WzmvWsl91ZbIzrFjuL0w+um2yl9
	 utFEWzT7YtqSqM0lwVhfZWScF1NwEDH0ecjufF4w1fCJ2XP0W0hxv0tq1zi/kMxXjF
	 6a+yyL3ieR0oA==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 14 Jul 2025 12:21:27 +0100
Subject: [PATCH v2] arm64/gcs: Don't call gcs_free() when releasing
 task_struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-arm64-gcs-release-task-v2-1-8a83cadfc846@kernel.org>
X-B4-Tracking: v=1; b=H4sIADfodGgC/3WNyw6CMBBFf8XM2jFtLTVx5X8YFn0M0IBgZgjRE
 P7dSty6PCe5564gxJkErocVmJYseRoLmOMBYufHljCnwmCUqZTTCj0/nMU2CjIN5IVw9tLjWV1
 ScKrxOlgo4ydTk197+F4X7rLME7/3n0V/7S9pqn/JRaPGysaQoknBanfriUcaThO3UG/b9gGil
 KfevQAAAA==
X-Change-ID: 20250610-arm64-gcs-release-task-307db60fa1b4
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=2024; i=broonie@kernel.org;
 h=from:subject:message-id; bh=eupN5HxOGmkNc6Cw38VhHgDtAG0xIE1iOkot5oZjUsY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBodOiG/3RE8umgKHyexaxCTtokEiAZNAKiXsr7i
 GT4UAh59D+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaHTohgAKCRAk1otyXVSH
 0O28B/4obCY4pUwxBTPWO9pFk0szGkgyIClyInyNfoLM3PHfgdRBCbSitvja06qJCMG99mvyARS
 L9sGhNUFiOctWMBlThdrPL3+AdqWoa5+uMo6v2ycHOWN2ymDB35ltHv5CUMk/qIWIZDkefJmt1q
 Uqp4Bmrgpit8jbHNFKNDEiWhLLUSPOlRz6dGrKvaplIq9v42/+X862XtmvbUAJnZaUS9/640m2c
 L6MijVPyx9xZm97yKd4ouyrzVei1HtvoiQN6jnZfuwNgn+rMThZORYmhn9fhaQziLSAUeVu0v15
 891M7H9Eq7/DdtxAksZWEGd6eTChdmXQnppL6LYIcyk1d399
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_042249_453308_AE784F52 
X-CRM114-Status: GOOD (  11.97  )
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

Currently we call gcs_free() when releasing task_struct but this is
redundant, it attempts to deallocate any kernel managed userspace GCS
which should no longer be relevant and resets values in the struct we're
in the process of freeing.

By the time arch_release_task_struct() is called the mm will have been
disassociated from the task so the check for a mm in gcs_free() will
always be false, for threads that are exiting leaving the mm active
deactivate_mm() will have been called previously and freed any kernel
managed GCS.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Changes in v2:
- Remove stale comment in gcs_free().
- Link to v1: https://lore.kernel.org/r/20250625-arm64-gcs-release-task-v1-1-54cbdc2db416@kernel.org
---
 arch/arm64/kernel/process.c | 1 -
 arch/arm64/mm/gcs.c         | 6 ------
 2 files changed, 7 deletions(-)

diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 5954cec19660..5dcfab9ce012 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -341,7 +341,6 @@ void flush_thread(void)
 void arch_release_task_struct(struct task_struct *tsk)
 {
 	fpsimd_release_task(tsk);
-	gcs_free(tsk);
 }
 
 int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
diff --git a/arch/arm64/mm/gcs.c b/arch/arm64/mm/gcs.c
index 5c46ec527b1c..6e93f78de79b 100644
--- a/arch/arm64/mm/gcs.c
+++ b/arch/arm64/mm/gcs.c
@@ -157,12 +157,6 @@ void gcs_free(struct task_struct *task)
 	if (!system_supports_gcs())
 		return;
 
-	/*
-	 * When fork() with CLONE_VM fails, the child (tsk) already
-	 * has a GCS allocated, and exit_thread() calls this function
-	 * to free it.  In this case the parent (current) and the
-	 * child share the same mm struct.
-	 */
 	if (!task->mm || task->mm != current->mm)
 		return;
 

---
base-commit: 86731a2a651e58953fc949573895f2fa6d456841
change-id: 20250610-arm64-gcs-release-task-307db60fa1b4

Best regards,
--  
Mark Brown <broonie@kernel.org>


