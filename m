Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F58C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FL+6HXbWXh+iDk/TrAVnA6F0WnMwzZyRgHabDYWNTs4=; b=ZFl1wqEtF2auz7R7FhC5enwgaL
	GuAJ/UUSomc2sKF1NWj8PN5KQZJ99BcwuabmOX6U4jkIDpIZuCgcrtzkeX9Pdw3MZIkPeavhtVgXG
	5qSFSVWwVppW4gpooSFr+vK0venMSmAbuNF781ZVxqpJgWz8u3eID3PP+kIVPLDui0HvMa+MH/GRR
	auK/kT+UBn6FTvezW1JkEILjnxwSEoXfVlbOo6gcuSIbR9LqQ6H3D5ZDD2cm9+B8yKsX1pl8WV3xq
	uMD5LHrSVNBe+wDgPCBeY+PnSSSsp6RfFj0kI3Z51/lWeQXnp0sQIrX5VNyW9riMwvm9aCVtYofSl
	VbAETdpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ql4-0000000613A-1p8E;
	Tue, 15 Sep 2026 10:51:26 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Qkz-00000006125-2r0g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 10:51:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=FL+6HXbWXh+iDk/TrAVnA6F0WnMwzZyRgHabDYWNTs4=; b=OJlYNW0CUWdE0HaXJoqLHvtXpg
	VwYxLEa3cDkCFrWKlmxtWY5hFQ7dAlUbWKA9T59NSfa0nBuESAAKp0TGDgEYJcylXdKyI87/wDKrN
	FxNieQTktRsprYKWBNGLYFphw7nKYyfuvAs7cEKJKqGcNQGUgo9xXCqLEuPiLmxhv1z3vkTWuiKUI
	FCx9XFnYgZKaovH0Z+nwv6WRTXOnVN7DjEBymKsKn267KKnOsipeMexeqh1T7z662Rf8r5hnraG3Y
	Ej1xcTRG9JMh4mZVFKD27kuy5EZvnBRY/RO+bzR3bP9Cej8bg0fzMVTvUeb71KbFyGLmFNkugD3m/
	kA3z5zPQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x6Qkn-004L4t-0C;
	Tue, 15 Sep 2026 10:51:10 +0000
From: Breno Leitao <leitao@debian.org>
Date: Tue, 15 Sep 2026 03:51:05 -0700
Subject: [PATCH v2] arm64/sve: Don't zero the SVE state buffer when the SVE
 state is live
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-b4-arm64-sve-acc-memset-v2-1-14b7ab9c71bd@debian.org>
X-B4-Tracking: v=1; b=H4sIABgjqWoC/3WNQQ6CMBBFr0Jm7RhaShFX3sOwKGWEMYGaFhsN4
 e4WjEuXL/n/vQUCeaYA52wBT5EDuymBPGRgBzP1hNwlBplLnddCYKvQ+FErDJHQWIsjjYFmLJQ
 sTVfq6lRWkN4PTzd+7eZr8+XwbO9k5023LQYOs/PvPR3FtvtV1N9KFCgwNbQmpWRRF5eOWjbT0
 fkemnVdP8JYmyHRAAAA
X-Change-ID: 20260911-b4-arm64-sve-acc-memset-3425ad567857
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: rmikey@meta.com, kas@kernel.org, usama.arif@linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel-team@meta.com, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2475; i=leitao@debian.org;
 h=from:subject:message-id; bh=trxelnov8Sfi++Tk3mF45/JptIEUcraXfpyfn0BOGpw=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqqSMa8G3X4zFwpaQAvP0/Q7gLylF9LFvpaIDUa
 7KKxnIpAoqJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaqkjGgAKCRA1o5Of/Hh3
 bTPGEACUE2a2Mk3/AxEpkD8NXuS3g15y/3zI6EvkIj5zScREazsHzBHwV4e/RNmYDx1xlXi6rQE
 P9ide2CqjLlQjZUWFQXp3e/kInnutEckmEoXMWRpgtHi9NalpXmwLK1h+Xn+oLCZ/YwdjBRpWQG
 OLQiXyqu7HbHkQlsSE9zanIdTqVBlOFZE6N8dt9I9tgPW/1M9WLUfG0FQHs+QFF17k2yZMFVRdz
 qqidHHuofHpCohr43jdkgP1mcFAE9W/WUzCoi8xVXi1zlZEw5MTNHOwaTwePf0trRwlBbTf6F7L
 VQ9Q2st2Q9lClMUWtRTVY+B4O0+bQxUC+s77jsR4dRsJ1TMGQx99VLFSY9Z21ec5TeKpU3KXlLg
 327S/bF9f/3aBkAZDrMFbdN5lMb4kR2GS3L/Jg+siIbHH45UfEE4suV/mGxEfANRrry5ipMkXvg
 Ehs712x6gru4HgMpSlC4lcWp3eJfwEitBNjyFAQASaPXzrQcFuzWeNroT10JjsEE/QKASFGGkRE
 h7N2yvw73YR+ia2VzlqKRJszQQCCJXkLA3QZaAZAStHlpPjvcIvESbtu/2orrgLghjYfbPQtpwQ
 mluUQGB9oSWv8fg+iQGGaDpIuFNZDGz3ONFF4tY6f305W8dY2WsZGgtaWOhfXGx2Pwl93hAUEes
 UAwGm384dbH852g==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_035121_735054_C651D9BC 
X-CRM114-Status: GOOD (  13.59  )
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

Currently do_sve_acc() always zeroes current->thread.sve_state. This is
not necessary in the common case, and avoiding the zeroing has a
measurable impact on some benchmarks.

In the common case where the task is not preempted and its state is not
altered by a tracer, do_sve_acc() will observe that TIF_FOREIGN_FPSTATE
is clear. In such cases, only the live register values matter, and the
in-memory copy is stale regardless of whether it is saved in
FP_STATE_FPSIMD format or FP_STATE_SVE format.

It is worth skipping the zeroing because the SVE state is discarded on
syscall entry, so userspace that mixes SVE and syscalls re-traps
constantly. A fleet profile of arm64 hosts running services whose
memset() is SVE shows the memset under do_sve_acc() accounting for 29%
of the trap handling cost.

Measured on a 72-core Neoverse V2 (SVE VL 128, sve_state_size 546,
performance governor) with perf bench sched pipe pinned to one CPU, and
SVE operation on write, so that each loop also takes an SVE access trap.

	* -0.99% kernel instructions
	* -1.38% kernel cycles
	* -1.12% wall clock

Signed-off-by: Breno Leitao <leitao@debian.org>
---
Changes in v2:
- Rewrote the commit message using Mark's suggested wording: what
  matters is that the in-memory copy is stale whenever the state is
  live, not the format it was last saved in
- Link to v1:
  https://patch.msgid.link/20260914-b4-arm64-sve-acc-memset-v1-1-67866e442393@debian.org
---
 arch/arm64/kernel/fpsimd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index e7f1682a3059b..324c9799b0511 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1316,7 +1316,7 @@ void do_sve_acc(unsigned long esr, struct pt_regs *regs)
 		return;
 	}
 
-	sve_alloc(current, true);
+	sve_alloc(current, false);
 	if (!current->thread.sve_state) {
 		force_sig(SIGKILL);
 		return;
@@ -1341,6 +1341,7 @@ void do_sve_acc(unsigned long esr, struct pt_regs *regs)
 		sve_flush_live();
 		fpsimd_bind_task_to_cpu();
 	} else {
+		memset(current->thread.sve_state, 0, sve_state_size(current));
 		fpsimd_to_sve(current);
 		current->thread.fp_type = FP_STATE_SVE;
 		fpsimd_flush_task_state(current);

---
base-commit: f2bfbc3554ca6919484030729424b9dee2942d24
change-id: 20260911-b4-arm64-sve-acc-memset-3425ad567857

Best regards,
--  
Breno Leitao <leitao@debian.org>


