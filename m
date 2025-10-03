Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7510CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 18:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yGlO3r2y9cso13s7bNZE9rxRZQJoqWCTjEidrnXMOJE=; b=GjKiPnSkPPUUapIGY7nUtbsBM/
	yRM1xEIHXCZDXpSpzFSlxV2ECYP0h96/nCjCmKAdm5xJNPfIy3/9enQCHPtGyFEebsiQbYfUE1D6H
	4RAS6WVGUHRpSB1h1OfW+HEI9p7lycUn0jI/reUZg8dFt0sLQUFxO4oAm+CktinpI/nW8A9QDCv0Q
	RtKI/BHgfuTotrcOtFYaRb96kwoxl391XckIaIEwGPwWzyRCWnqKEkjL/4tSClyWWjCPKb4QihwFi
	8sIByhGODXwHRPk2zWlY8baScXpbukSYQjc3VW1OVzJUXTGs622OdNKSD3Rt0ukEGkXD0jCsLWucl
	J9qtGtIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4kgj-0000000CwEz-3MtG;
	Fri, 03 Oct 2025 18:39:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4kgh-0000000CwEs-3VHl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 18:39:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EE06E60215;
	Fri,  3 Oct 2025 18:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF493C4CEF5;
	Fri,  3 Oct 2025 18:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759516766;
	bh=X9mbfiVpyjaBvKvtq2HzUowGHUTbwmVHntwpOYm/1Gg=;
	h=From:To:Cc:Subject:Date:From;
	b=Vqzg5aJIIQKstWacrTpClrbSUuMLXJQvF5dn+/YO6mvOi/qoRJF8UEwl3Km7r0503
	 WFyjBONDyLy9bWPiztFlUHfWBVLGj2fKsIcTNV4PuayC3pBup3Q5VDOUfZLyja2LkP
	 qFXuzWvSkxkq/XKREug/3rQEkEygOuCgyc00W58aDW3LUuYttawncbiFBiMH/YqJnE
	 KfX/oa3KvZNWceuRQdFijYeLaLYH/2QGSmJqHCnmu3oIwidM9FgMyqhLwcF9vVbIIt
	 7F6zrOvdiloooJIh1ApKIsRBJLVdZZeftwPJJ3KMThuu6On4MWakenIQOcbiXYcCus
	 2A3YTXH9OG3DA==
From: Will Deacon <will@kernel.org>
To: stable@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	Kenneth Van Alstyne <kvanals@kvanals.org>
Subject: [STABLE 5.15.y] [PATCH] KVM: arm64: Fix softirq masking in FPSIMD register saving sequence
Date: Fri,  3 Oct 2025 19:39:17 +0100
Message-Id: <20251003183917.4209-1-will@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Stable commit 23249dade24e ("KVM: arm64: Fix kernel BUG() due to bad
backport of FPSIMD/SVE/SME fix") fixed a kernel BUG() caused by a bad
backport of upstream commit fbc7e61195e2 ("KVM: arm64: Unconditionally
save+flush host FPSIMD/SVE/SME state") by ensuring that softirqs are
disabled/enabled across the fpsimd register save operation.

Unfortunately, although this fixes the original issue, it can now lead
to deadlock when re-enabling softirqs causes pending softirqs to be
handled with locks already held:

 | BUG: spinlock recursion on CPU#7, CPU 3/KVM/57616
 |  lock: 0xffff3045ef850240, .magic: dead4ead, .owner: CPU 3/KVM/57616, .owner_cpu: 7
 | CPU: 7 PID: 57616 Comm: CPU 3/KVM Tainted: G           O       6.1.152 #1
 | Hardware name: SoftIron SoftIron Platform Mainboard/SoftIron Platform Mainboard, BIOS 1.31 May 11 2023
 | Call trace:
 |  dump_backtrace+0xe4/0x110
 |  show_stack+0x20/0x30
 |  dump_stack_lvl+0x6c/0x88
 |  dump_stack+0x18/0x34
 |  spin_dump+0x98/0xac
 |  do_raw_spin_lock+0x70/0x128
 |  _raw_spin_lock+0x18/0x28
 |  raw_spin_rq_lock_nested+0x18/0x28
 |  update_blocked_averages+0x70/0x550
 |  run_rebalance_domains+0x50/0x70
 |  handle_softirqs+0x198/0x328
 |  __do_softirq+0x1c/0x28
 |  ____do_softirq+0x18/0x28
 |  call_on_irq_stack+0x30/0x48
 |  do_softirq_own_stack+0x24/0x30
 |  do_softirq+0x74/0x90
 |  __local_bh_enable_ip+0x64/0x80
 |  fpsimd_save_and_flush_cpu_state+0x5c/0x68
 |  kvm_arch_vcpu_put_fp+0x4c/0x88
 |  kvm_arch_vcpu_put+0x28/0x88
 |  kvm_sched_out+0x38/0x58
 |  __schedule+0x55c/0x6c8
 |  schedule+0x60/0xa8

Take a tiny step towards the upstream fix in 9b19700e623f ("arm64:
fpsimd: Drop unneeded 'busy' flag") by additionally disabling hardirqs
while saving the fpsimd registers.

Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Lee Jones <lee@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org
Cc: <stable@vger.kernel.org> # 5.15.y
Fixes: 23249dade24e ("KVM: arm64: Fix kernel BUG() due to bad backport of FPSIMD/SVE/SME fix")
Reported-by: Kenneth Van Alstyne <kvanals@kvanals.org>
Link: https://lore.kernel.org/r/010001999bae0958-4d80d25d-8dda-4006-a6b9-798f3e774f6c-000000@email.amazonses.com
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/fpsimd.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index fc51cdd5aaa7..db1ed940a6dc 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1300,13 +1300,17 @@ static void fpsimd_flush_cpu_state(void)
  */
 void fpsimd_save_and_flush_cpu_state(void)
 {
+	unsigned long flags;
+
 	if (!system_supports_fpsimd())
 		return;
 	WARN_ON(preemptible());
-	get_cpu_fpsimd_context();
+	local_irq_save(flags);
+	__get_cpu_fpsimd_context();
 	fpsimd_save();
 	fpsimd_flush_cpu_state();
-	put_cpu_fpsimd_context();
+	__put_cpu_fpsimd_context();
+	local_irq_restore(flags);
 }
 
 #ifdef CONFIG_KERNEL_MODE_NEON
-- 
2.51.0.618.g983fd99d29-goog


