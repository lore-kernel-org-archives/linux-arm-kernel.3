Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2E7FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2wLsw9nGyw43qdgk/7w4u2+YPwhp18IN4nTEToE9F3Y=; b=jMhj0SfJWAhTmve9qQFL8okFHb
	LYohrUSjSU9jwPOyEy1Ir+m8woh/cq4YjjDdR16gGwoM6eXkpVb2T/ZnfftUSsl73hni1Zdt9jxkY
	HbveUk2/gze3O5Y87jZ5KnVyG7iWQylZcOTu57tirTi1SYmpke1iAYcv5G2k9vfGdJoXrZNZl315F
	oYRptZekUJkjkuzieNrNa4hLYjFsPxefxLZBOm5bZjXrUfjIZrJ8qPA0ZNRdL1uM09awPLZln+TvP
	LrDU96OOJArRJF2pSnBHnylJpVElynKO3jGrrDygQkdOK2U+txrhyHN3x/4EAS9qM1lo89dafTBCb
	M+YJDLeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIEF-0000000Glb3-0gF3;
	Tue, 05 May 2026 16:02:35 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIEC-0000000GlZY-1s9T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 16:02:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=2wLsw9nGyw43qdgk/7w4u2+YPwhp18IN4nTEToE9F3Y=; b=FB2KVSMqpbICkJnzCRWeGNbgng
	ZvX6EP4GNEyiNzKh/qHDCA1ipaWNbObphRvLdNOPcTi3UMjKLVQhrOLVQHha6wgSR3vaa3YP+XIit
	F3awJeA9pq7MHxi8BL/1afC7kIeLuBl0WrdlGk7Bkg02tlCnxBReqMxGJPN34eI4oAteEUcTIMte1
	MDBYJiMMgRex+foKnhJIHSbOlpmiMRkImwSvO95U/erbDy+rUTByASJJfW8ZuGNTY883/uYQoB04p
	U/4awfxXJA6HZ4MF62rPRMZEzJ0/L9OVbA/6xdpdx81oZ3RMuXFHjOuxNGAju7wXkxfQKjNPRdFns
	gnM814pA==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wKIE6-002vJ4-2r;
	Tue, 05 May 2026 16:02:27 +0000
From: Breno Leitao <leitao@debian.org>
Date: Tue, 05 May 2026 09:02:13 -0700
Subject: [PATCH] arm64/fpsimd: ptrace: zero target's fpsimd_state, not the
 tracer's
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-fix_ptrace-v1-1-36ac1f6d0bfb@debian.org>
X-B4-Tracking: v=1; b=H4sIAIUU+mkC/yXMQQqDMBAF0KsMf20gChGSq0gpcZzYcWElsRIQ7
 15sl2/zThTJKgWBTmQ5tOh7RaC2IfArrrMYnRAIne1666wzSetz23NkMe3IcXLesfWChrBlSVp
 /2fD4u3zGRXi/B1zXF78XopVuAAAA
X-Change-ID: 20260505-fix_ptrace-1bcad595c09e
To: Oleg Nesterov <oleg@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel-team@meta.com, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.16-dev-453a6
X-Developer-Signature: v=1; a=openpgp-sha256; l=2116; i=leitao@debian.org;
 h=from:subject:message-id; bh=IUePtTvQ2uwrE6aC1G7IWe8HsA67uQUPK38IVnbXGkQ=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBp+hSO7GZIc4/Lkdia4lLzVLAru8vqS+wiBEY0r
 flINyBU37eJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCafoUjgAKCRA1o5Of/Hh3
 bXrfD/4v9pniIS+MUjOPPhAPYVwngnhfpi6cdZCo2aJA22+Tbnm+lf0KjJCkolNPJ9P4Eqbqqbc
 OESHJljjd21SrorgJ2vLXevuzCFQC3CM/+h3y/Da3dpDEcom05rQPvDfQSvnotYSWo3MAIPRj3U
 tRIBCqJLYakhLeTLMn5/bJ2aOyHUTLJoolOZXqeSF/sblfo9rFw1b7GQ71JfBJJ96qqTIAB4H+W
 QI49HCHVfUcllHfDBPM4gjdSulJUfpSal18SlRTBEl1jvYyJEzPIvwh7yw+Uv6bGIWKMP2jGJzv
 vc//Vb5FrfvsGJRfPcu3iuA2MAYybE8U9LYbtKy7zC+/b0F76zqI0TyG8lVCNzIBGrbKn4zRU+L
 sMZYh5WJjCm3YZQtF8rETRzYTU+tWjYbggRts+3Dhi92sgGJgvZQyuZvdbKmHCtEZ59+NU+btpT
 FbS4YwKJ6AWfbHCW2TnkcREGSyiMDxVSONOFundB7XGhbGDdthuHTW8sHMF9emuCZk6dRxRTY88
 DkapqO983BzOV6fcAbeEewN7DzYgXPdTREeFGMsYVZUBPbdpOSo1F1ZNVFm78GIMn49lJhBFCFE
 wHjJ/cJ4azaLZE9WAvQKNOz+p5U9Bdtk0RhLS/IN97+8OaoRtUTuQfETd1Cgb2Nn0YrWVtJUKLI
 ahFpCFMTTNt9bGg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_090232_493932_CA4796F7 
X-CRM114-Status: GOOD (  12.05  )
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

sve_set_common() is the backend for PTRACE_SETREGSET(NT_ARM_SVE) and
PTRACE_SETREGSET(NT_ARM_SSVE). Every write in the function operates on
the tracee (target) - except a single memset that uses current instead,
zeroing the tracer's saved V0-V31 / FPSR / FPCR shadow on every ptrace
SETREGSET call.

The memset is meant to give the tracee a defined zero register image
before the user-supplied payload is copied in (for partial writes,
header-only writes, and FPSIMD<->SVE format switches). Aiming it at
current both denies the tracee that clean slate and silently corrupts
the tracer.

Due to FPSIMD lazy save/restore the wipe only takes effect when the
tracer's CPU FPSIMD binding is dropped after the memset; the next
return to userspace then reloads V0-V31, FPSR and FPCR as zero. No
signal is raised and ptrace() returns success.

Reproducible on an arm64 kernel with SVE: a single-threaded tracer that
loads a known pattern into V0-V31, issues PTRACE_SETREGSET(NT_ARM_SVE)
on a child, and reads V0-V31 back observes them all zeroed within tens
of thousands of iterations when a sibling thread keeps stealing the
FPSIMD CPU binding.

Fixes: 316283f276eb ("arm64/fpsimd: ptrace: Consistently handle partial writes to NT_ARM_(S)SVE")
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 arch/arm64/kernel/ptrace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index ba5eab23fd900..4d08598e2891d 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -983,8 +983,8 @@ static int sve_set_common(struct task_struct *target,
 	}
 
 	/* Always zero V regs, FPSR, and FPCR */
-	memset(&current->thread.uw.fpsimd_state, 0,
-	       sizeof(current->thread.uw.fpsimd_state));
+	memset(&target->thread.uw.fpsimd_state, 0,
+	       sizeof(target->thread.uw.fpsimd_state));
 
 	/* Registers: FPSIMD-only case */
 

---
base-commit: 9d0d467c3572e93c5faa2e5906a8bbcd70b24efd
change-id: 20260505-fix_ptrace-1bcad595c09e

Best regards,
--  
Breno Leitao <leitao@debian.org>


