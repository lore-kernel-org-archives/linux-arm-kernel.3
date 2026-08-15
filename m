Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E874EC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 15:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VIGYBxx3euzCMRtT0VmyBTeKi/RO8C4HV/kmXozWY7E=; b=aI1hkEPfA6v+twESQTg8aMJwNX
	nCrhJg0A2ZC76CmFVfUU7rzBRjJp2JTa1paclDyxUYfw8F7gXh80v6QHA0D8D0C4XQrDZ8aefgZ5B
	glzw3F2CCCDmR8YFohsX3ZInrfr5vpnUyISGAlzVWFJ50D8j4BQfSZ/sW8FtN/P7A2e9aHp5wef6x
	V8JzlFewOznpDLoQ8eLaBGXuSDeLT4kd3doB1Z3IAEQywZKzOvajBtYIbvUOzDr4wwBvOh4WKycaN
	kyCo0kF3k2truQ4D/P5GfST505+DYRbCpX/rpQWUnoa6ou6b7Ln7yKoEu6iGvrA26CQh7Uy4eGxk8
	G+iy2K2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvGJF-00000003ujF-1shK;
	Sat, 15 Aug 2026 15:28:33 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvGJB-00000003uit-1b14
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 15:28:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=VIGYBxx3euzCMRtT0VmyBTeKi/RO8C4HV/kmXozWY7E=; b=
	naGFWC8KHfoTEn2VTHYt0rrLxZT9j1CWE5TvBGDhR0jAouU/fZUcIW5yOKa1cWt8wGnvI8uqa7JAE
	kwGmr7tl8cSwLoC++A8dzILBHSGCz9E925ax74YX3sjBcH9ayNvUGnLHUYEfIzDzUK1+CurgWJCLV
	5X4Kd2ThHu5R3FMcp//KFT2aO6jdiJpWbETUNnb+3DxActkqvUw1phbk+8jWV4sOVZSqMcO445FOr
	Aj2eY6peqiUA30e+L1ZJPBVwibZZl4y48j9Bko6GraKpYqeUoDh6MpXHS6kmwcWWz45G+eocihuKu
	yXjhB/Y19T6EUVHZVcGX0MkUu6etZS0jHg==;
Received: from [179.135.28.2] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wvGJ1-002cMn-AO; Sat, 15 Aug 2026 17:28:19 +0200
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	robin.murphy@arm.com,
	gshan@redhat.com,
	kernel-dev@igalia.com,
	kernel@gpiccoli.net,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Mark Brown <broonie@kernel.org>,
	Ryan Houdek <sonicadvance1@gmail.com>
Subject: [PATCH] arm64/kernel: Expose the running CPU of a native task in TPIDRRO_EL0
Date: Sat, 15 Aug 2026 12:19:32 -0300
Message-ID: <20260815152759.2046231-1-gpiccoli@igalia.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_082829_427104_B1FBDE49 
X-CRM114-Status: GOOD (  24.87  )
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

The register TPIDRRO_EL0 has 2 meanings / usages today, depending on
the mode userspace is running:

- For native/arm64 mode, this register is always 0 from the userspace
  perspective. In the kernel, it is used during ventry (entry.S) as
  a scratch register, related to KPTI (stashes x30 in fact).

- For 32-bit compat tasks, this register holds the TLS userspace pointer,
  and is not used for KPTI or anything else in entry.S. This is ABI and
  userspace can count on having a valid TLS pointer there.

Happens that other operating systems follow a similar approach than 32-bit
compat mode, even for arm64: in both Windows[0] and MacOS (xnu/darwin)[1],
this register is used to hold the running CPU of the current task, hence
offering a very fast / non-syscall way for a given task to figure its
running CPU id.

Given that we are zeroing this register on Linux for arm64 native tasks,
we hereby propose the change of doing the same as other OSes. The use
cases for this are related to gaming on Linux. We have mainly two
distinct, yet related, cases for this change:

- Windows can run natively on arm64. So, arm64 native applications could
  run on Linux through the usage of Wine. But...these applications easily
  could attempt a read to this register to perform operations related to
  their running CPUs. As Wine cannot ever trap a register read, these
  apps would be deemed broken / incompatible with Linux.

- Emulation SW like FEX would greatly benefit from this feature. They
  could use this register to compose the emulation of the x86 RDTSCP
  instruction for example.

Not only the specific cases above, but this is useful for regular native
arm64 applications as a way of fast introspection, more or less like
vDSO getcpu() approach but with way less code and supported by the ARM
specification[2].

Care is taken on the implementation to avoid messing with the 32-bit
compat case. This was tested both for native 64-bit applications and
32-bit compat TLS reads in a rpi3 HW.

[0] https://learn.microsoft.com/en-us/cpp/build/arm64-windows-abi-conventions?view=msvc-170#system-registers
[1] https://github.com/apple-oss-distributions/xnu/blob/main/osfmk/arm64/cswitch.s#L170 (set_thread_registers macro)
[2] https://support.arm.com/documentation/ddi0601/2026-06/AArch64-Registers/TPIDRRO-EL0--EL0-Read-Only-Software-Thread-ID-Register

Assisted-by: LLM
Cc: Mark Brown <broonie@kernel.org>
Cc: Ryan Houdek <sonicadvance1@gmail.com>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---


Hi folks, thanks in advance for your reviews and suggestions!

I would like to specially highlight the very interesting work from Mark Brown
adding a vDSO getcpu() to Linux/arm64, which seemed quite complete at V3:
https://lore.kernel.org/r/20200819121318.52158-1-broonie@kernel.org/

At the same time that vDSO is pretty nifty (and common) as a means of
optimizing the applications' getcpu() operation, I think worth to clarify this
is not exactly the goal of this patch. In other words, the patch does indeed
benefit that use case, but our main concern is the compatibility of Windows
ARM64 native applications running through Wine on Linux, and the potential
of x86 direct emulation on ARM64 (or other architecture combinations). The
goal **is** to have the register TPIDRRO_EL0 holding the current task's CPU.

Some prior discussion about this is at MLs too, from 2020, but led to nowhere:
https://lore.kernel.org/r/20200601070311.GA8601@willie-the-truck/

I would like to also mention that I'm in no way an expert on arm64 architecture,
hence I relied in studying the code and "pair-programming" with LLM in order
to validate my ideas and patches. Hence, I appreciate extra care on review
since I might be missing some relevant corner case, and if that's the case,
my apologies in advance for the extra burden.
Cheers,

Guilherme


 arch/arm64/kernel/entry.S   | 19 +++++++++++++++++++
 arch/arm64/kernel/process.c |  8 ++++++--
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index e0db14e9c843..fe42dfc4f4f1 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -409,6 +409,25 @@ alternative_else_nop_endif
 
 	msr	elr_el1, x21			// set up the return data
 	msr	spsr_el1, x22
+
+	/*
+	 * Save the CPU number into tpidrro_el0 before returning to EL0:
+	 *
+	 * For native tasks, we stash the running CPU of the task in the
+	 * tpidrro_el0 register; at this moment, tsk is valid and we're
+	 * almost ready to get back to EL0. For the 32-bit compat tasks,
+	 * tpidrro_el0 carries the TLS pointer and must survive every kernel
+	 * exit intact - so we test TIF_32BIT and skip the write accordingly.
+	 */
+
+	.if	\el == 0
+	ldr	w0, [tsk, #TSK_TI_FLAGS]
+	tbnz	w0, #TIF_32BIT, .Lskip_tpidrro_\@
+	ldr	w0, [tsk, #TSK_TI_CPU]
+	msr	tpidrro_el0, x0
+.Lskip_tpidrro_\@:
+	.endif
+
 	ldp	x0, x1, [sp, #16 * 0]
 	ldp	x2, x3, [sp, #16 * 1]
 	ldp	x4, x5, [sp, #16 * 2]
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 581f80e9b9b7..80c2d9cdedd8 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -533,8 +533,12 @@ static void tls_thread_switch(struct task_struct *next)
 
 	if (is_compat_thread(task_thread_info(next)))
 		write_sysreg(next->thread.uw.tp_value, tpidrro_el0);
-	else
-		write_sysreg(0, tpidrro_el0);
+
+	/*
+	 * About the native/64-bit case: notice we don't need to update
+	 * tpidrro_el0 here, since it is refreshed at every EL1->EL0
+	 * transition at kernel exit.
+	 */
 
 	write_sysreg(*task_user_tls(next), tpidr_el0);
 	if (system_supports_tpidr2())
-- 
2.50.1


