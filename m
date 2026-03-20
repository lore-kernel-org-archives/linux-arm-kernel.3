Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F7A109879F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 15:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iSU9d+Wrgg2F2KJbG+F9qFbyNLQaAw0pZ/wYphwwj80=; b=DmJa7fNlYdygmv66fUKa09408f
	p9fYNd8saqPKjdhy1Og1HtcgavPEIaV80G2IbrdNAx6uGDmd+9E2NNwl4cI0yL1KjlyfBuVQywP10
	8OcxxUNmPaN+ALXE/orghrUIVpQn6tm6x0DiMZDRV4N9h6j5ETqhvKw4a4gkDd9OhRkE6jPhnS4he
	Z0IEb6knI63TxNKcDusfxwY29TgdNTbr5fOFZmjQ7yD49FxezI5TzxKnWJhREvBbaTJW/q77Dldi6
	c6qziWu92h1rmSBEilkkCp9YY6YtF9rHsZNa8If61IeejUxzuVCNQCmaFRtLETObF2tEnMHXPzNYc
	mWeKr3cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3c4X-0000000D3mX-49bf;
	Fri, 20 Mar 2026 15:47:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3c4U-0000000D3ko-4A7s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 15:47:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D25F444E5;
	Fri, 20 Mar 2026 15:47:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0843C4CEF7;
	Fri, 20 Mar 2026 15:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774021653;
	bh=1YCIRlzvccz0o7Yp+gHCS/xf6jY6fB4+9eaW9ZuF5O4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fw7pKAYbdzdWgsBoGLn/pE6Ky0mApfADe597sxloct0VOLhkI6uh0fFrtmAFtzsvI
	 HzFWVHbS57a07mg68mDVkUrtYJuHVqb1LOtP0FG5BibtgDa+Hv6ycW7NqQPYQ4PplY
	 KjQ/chDNGqFnJxnXbZhXnpAAk1MOHP3VsB7gTyTEty6k/vNpKMM/STuF536sGo4p67
	 vmlDJvA+z9Ivh/EtHR+/Nyi6A1oUQUEs2EoGYzVSqv/iKwV679D7u4xGvPzYfFzk/N
	 PRBVcGvsZOl1dblC0NMrCOfsaGZk61pZ9dA1is8mEWLWVf9h+lJeWiv4pZTNkstELp
	 HqZL2Du4kc4iw==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 20 Mar 2026 15:44:15 +0000
Subject: [PATCH v8 2/2] arm64/sve: Disable TIF_SVE on syscall once per
 second
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-arm64-sve-trap-mitigation-v8-2-8bf116c8e360@kernel.org>
References: <20260320-arm64-sve-trap-mitigation-v8-0-8bf116c8e360@kernel.org>
In-Reply-To: <20260320-arm64-sve-trap-mitigation-v8-0-8bf116c8e360@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: Mark Rutland <Mark.Rutland@arm.com>, 
 Ryan Roberts <Ryan.Roberts@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-db13a
X-Developer-Signature: v=1; a=openpgp-sha256; l=2697; i=broonie@kernel.org;
 h=from:subject:message-id; bh=1YCIRlzvccz0o7Yp+gHCS/xf6jY6fB4+9eaW9ZuF5O4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpvWwQk8La/rwzGdEW7tZNW+j6qERjnRYi476yP
 rk1yBlp0FWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCab1sEAAKCRAk1otyXVSH
 0MnwB/9dJOh5WieStSHuudcz4Jesfz699a5guOYhmjrXqQQ+enriUxPl9v2T2rcWwGUeqpym4rJ
 SkERTDGcBtrXGlZZDIrZGc4lnJozjkF9qgfizi9lonA2GzedSsmnk3T3QW2mv9Zi1vVwAFItsA4
 bBSjfAPof/llpQcZVf66CoPSDzhf9frhTDaq7vK/iJotuqhO52UpEcF22nktMuHXOWH0hdUEaVW
 UYyOmT2JnfRAoHCI25c6GjI5vCvbfvmRcs1D+c/SgxeIc5WecZOh2AQc7tNeQqq6nPXpE+maPHA
 8AXtLJ/MF9EB115m/dk6p48f8w1XYCeDKNMP7WN66TARLEI8
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_084735_083928_C9FFF3B7 
X-CRM114-Status: GOOD (  17.89  )
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

Our syscall ABI requires that when performing a syscall the portions of
the Z registers not shared with the V registers, the P and FFR registers
are reset to 0.  Since we have no way of monitoring EL0 SVE usage this
is implemented by changing the in register values on every syscall for
tasks which have SVE enabled, for systems with 128 bit SVE vector
lengths this has been benchmarked as a 6% overhead.

We currently support disabling SVE for userspace tasks when loading the
floating point state from memory during a syscall, allowing tasks that
use SVE infrequently to avoid this overhead, but this may not help CPU
bound tasks if they are not fortunate enough to block or be scheduled
during a syscall.  This is done whenever the state is loaded from a
second after the last time the task generate a SVE access trap.

Extend this mechanism to also apply during syscall entry, disabling SVE
instead of flushing the live registers when we perform a syscall a
second after the last time a SVE access trap was taken.  This adds an
additional memory access and branch for tasks using SVE and means that
CPU bound tasks actively using SVE will take extra SVE access traps (at
most one per second) but will allows CPU bound tasks that infrequently
use SVE to avoid the overhead of flushing the registers on syscall.

On a system with 128 bit SVE vectors fp-pidbench shows a roughly 4.5%
improvement compared to baseline after having used SVE, for a roughly
0.4% overhead when SVE is used between each syscall.  Obviously this is
very much a microbenchmark.

This is purely a performance optimisation, there should be no functional
change.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kernel/entry-common.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 3625797e9ee8..a7b7ec66f084 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -234,8 +234,18 @@ static inline void fpsimd_syscall_enter(void)
 	if (test_thread_flag(TIF_SVE)) {
 		unsigned int sve_vq_minus_one;
 
-		sve_vq_minus_one = sve_vq_from_vl(task_get_sve_vl(current)) - 1;
-		sve_flush_live(true, sve_vq_minus_one);
+		/*
+		 * Ensure that tasks that don't block in a syscall
+		 * also get a chance to drop TIF_SVE.
+		 */
+		if (unlikely(time_after(jiffies,
+					current->thread.sve_timeout))) {
+			clear_thread_flag(TIF_SVE);
+			sve_user_disable();
+		} else {
+			sve_vq_minus_one = sve_vq_from_vl(task_get_sve_vl(current)) - 1;
+			sve_flush_live(true, sve_vq_minus_one);
+		}
 	}
 
 	/*

-- 
2.47.3


