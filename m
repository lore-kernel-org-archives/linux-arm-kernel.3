Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2778AD59F7F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 23:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d9yz6JEZM/M3oYsI3bP24hTLibROwJdYADwtV7Jk1nQ=; b=c3V6zztUh2Z0C2TylV6KlR3vMl
	3MGns9rzrkwSgQAaA0ues0yZR2XhvQ82B3nJ7V38X9pVfuMlSjp9Uy9hBt1oFo16BmPYzJQyk0oR3
	WwkXw4oyFZVyvayg2En/mNt1lMufzKOd5r+Zv7qmZlFCbZtL2zOnFGRTcrbBxvfbftS/Hb3QuRBEx
	S6iAgDWz3PMAUhh0e+jvtCJGuk272Z0VuM6XSxfQlCwU+Z7A2PFKK4Ef9QnGDaxYgh9GggV65aD1W
	bsh8DC/51jp3I0IYdYCeeUrrLQi50lSRdHvWcJx2eAHt2fJIX2s/pMMJIu2T1p9CgPk0yosSEqwHq
	+AUe/w1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8pN4-000000052JF-0Tdn;
	Wed, 06 Nov 2024 23:23:30 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8pKu-000000051uo-0PvJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 23:21:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6F51FA44794;
	Wed,  6 Nov 2024 23:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75ED4C4CEC6;
	Wed,  6 Nov 2024 23:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730935275;
	bh=v0JKX5IwqEZCely79v6+Qi7NArjB8yIgCjKT3A9QR1k=;
	h=From:Date:Subject:To:Cc:From;
	b=N22rTv7T/f4RrX2t/6HrlOb2N4tQnSUrWrVk5du6PWBKvzPkXPRDe37t1H9QObFFx
	 9EfFX629HsCAD3tgbqdJIRYQvG8KMP7Xa1hOhbiywzjVyMmjRwqa3+dazq9juoMPbm
	 evR50FHrXoQS/1XBPLLapkPjd7YHNaIebzcTQmzvkBdomrmO3QLT4EhcbkSlR7wOfN
	 IC8rE25y/VUOj/23gQB7942qUF9bXk+sJQUdyebJfSxuwoS+ngFDPWkINlXVQaI8xl
	 qHLO3N6BA6ZdMYfhjdwe6WFdUPTcqorbgCkDii9OFMFLKL86POKdMPtlhOEBqS8WG8
	 E5RW9fy5h6soQ==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 06 Nov 2024 23:20:51 +0000
Subject: [PATCH] arm64/ptrace: Zero FPMR on streaming mode entry/exit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241106-arm64-ptrace-fpmr-sm-v1-1-c28429da37d3@kernel.org>
X-B4-Tracking: v=1; b=H4sIANL5K2cC/x3MQQqAIBBA0avErBtQ06KuEi2kxpqFJWNEEN09a
 fkW/z+QSZgyDNUDQhdnPvYCXVcwb35fCXkpBqOM1Vq16CW2FtMpfiYMKQrmiNY1vQquN66zUNI
 kFPj+t+P0vh8eFvILZgAAAA==
X-Change-ID: 20241106-arm64-ptrace-fpmr-sm-45390f592574
To: Oleg Nesterov <oleg@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=2693; i=broonie@kernel.org;
 h=from:subject:message-id; bh=v0JKX5IwqEZCely79v6+Qi7NArjB8yIgCjKT3A9QR1k=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnK/noo9Br3v5fpH+eL1u9o3cQlJbT9iDlag0KwZOR
 R35tWkGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZyv56AAKCRAk1otyXVSH0E4CB/
 4u6knMTpqMANM3wlZLlyF8m0EYBuUKsqbjIW1dOZvoyucLPD8RIJkp2R6i9yboXiF44MNw2IjzS7HT
 El/BRvtJ7W1dPFFpK+erZXzEuN5LI6jD069NUhbXicIuov/h+6fhn21j/Wrgih/2/iCVRdtLdsYAnU
 gfkN7602fme2WAoxTe6Yz8lO5mt+MSTR3fNl/4Ru8FKUMkDiam3SiauQ3fKMIj2XL1PowIbygRu5wQ
 N3L0DerTy9vBQlXQOrfY9/PXmzFE830FGtRtOdkxM8NiXecqUceyU1Sw/OkJYvD64hhPB3bI4v9ief
 OhI1R0cO03MFxOnjufdIXKygDddcee
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_152116_297644_2941AAD5 
X-CRM114-Status: GOOD (  12.89  )
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

When FPMR and SME are both present then entering and exiting streaming mode
clears FPMR in the same manner as it clears the V/Z and P registers.
Since entering and exiting streaming mode via ptrace is expected to have
the same effect as doing so via SMSTART/SMSTOP it should clear FPMR too
but this was missed when FPMR support was added. Add the required reset
of FPMR.

Since changing the vector length resets SVCR a SME vector length change
implemented via a write to ZA can trigger an exit of streaming mode and
we need to check when writing to ZA as well.

Fixes: 4035c22ef7d4 ("arm64/ptrace: Expose FPMR via ptrace")
Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: stable@vger.kernel.org
---
 arch/arm64/kernel/ptrace.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index b756578aeaeea1d3250276734520e3eaae8a671d..f242df53de2992bf8a3fd51710d6653fe82f7779 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -876,6 +876,7 @@ static int sve_set_common(struct task_struct *target,
 			  const void *kbuf, const void __user *ubuf,
 			  enum vec_type type)
 {
+	u64 old_svcr = target->thread.svcr;
 	int ret;
 	struct user_sve_header header;
 	unsigned int vq;
@@ -903,8 +904,6 @@ static int sve_set_common(struct task_struct *target,
 
 	/* Enter/exit streaming mode */
 	if (system_supports_sme()) {
-		u64 old_svcr = target->thread.svcr;
-
 		switch (type) {
 		case ARM64_VEC_SVE:
 			target->thread.svcr &= ~SVCR_SM_MASK;
@@ -1003,6 +1002,10 @@ static int sve_set_common(struct task_struct *target,
 				 start, end);
 
 out:
+	/* If we entered or exited streaming mode then reset FPMR */
+	if ((target->thread.svcr & SVCR_SM) != (old_svcr & SVCR_SM))
+		target->thread.uw.fpmr = 0;
+
 	fpsimd_flush_task_state(target);
 	return ret;
 }
@@ -1099,6 +1102,7 @@ static int za_set(struct task_struct *target,
 		  unsigned int pos, unsigned int count,
 		  const void *kbuf, const void __user *ubuf)
 {
+	u64 old_svcr = target->thread.svcr;
 	int ret;
 	struct user_za_header header;
 	unsigned int vq;
@@ -1175,6 +1179,10 @@ static int za_set(struct task_struct *target,
 	target->thread.svcr |= SVCR_ZA_MASK;
 
 out:
+	/* If we entered or exited streaming mode then reset FPMR */
+	if ((target->thread.svcr & SVCR_SM) != (old_svcr & SVCR_SM))
+		target->thread.uw.fpmr = 0;
+
 	fpsimd_flush_task_state(target);
 	return ret;
 }

---
base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
change-id: 20241106-arm64-ptrace-fpmr-sm-45390f592574

Best regards,
-- 
Mark Brown <broonie@kernel.org>


