Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CF4CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tgKCHfUmztrSWVKtHdc3pQd1aPvk/aywUlMe/qhMzDY=; b=LPBLBZlcvSi63kAOxWxD8+9l3S
	eGlHk/9PdT78dmKjjV3RYOv/cARqMHSj8yY3fMRelz+y9pdAg6i8Edeoz/3CY4H+JfK6LB6hHWFo8
	ko8Kanw3zjm+2XLbL3qGR6AhL9u39qusuqkT+O5rMcA5jCtYZfD6+gJ/ZUMxe0Wr4lAwUcP5ZDHW2
	MDV6VeYaj+ZjNthnWshBvbkpCET1XNSnRJX9KdLKOvklev0TpFeJ5E/9JMaeAeFLYlOxZ1BkorB65
	UZDkCSEhSei6AiqKrZDbf7jxrd0imUSkyaSaSP7n3SDNDnXBkVKRd0Xdcisyk5EmTqvnYIz9EJvV0
	y1t3ybIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphmO-00000003ztK-3w2a;
	Sat, 23 Aug 2025 06:31:08 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSNM-00000002i9o-2tpD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 14:04:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 60E9DA558B8;
	Fri, 22 Aug 2025 14:04:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5975C4CEED;
	Fri, 22 Aug 2025 14:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755871455;
	bh=fedKWDUCFw6sDYSvu9stQDvSI1wsHoWAuIqdks8aTTU=;
	h=From:To:Cc:Subject:Date:From;
	b=lCGeFWmNalegk6Ivok+cS6qPc446TA+WpF0a17y4MMUmH75owIr3qn1ONLF2ZnY4s
	 dWv8EAo5M/HWVRNp1RFZ2WPJPmVUe3ofMq76VyqhzgyxrTjNsAZLsvajA5V/pE+1Fe
	 7u/xymksvDxH0dx7mja+y8TRFv4I8ozpSn+RclnurYx19xh+mjAzYxJT220jS701xO
	 YdqW/+GqdQaaLQ+QBtl7P5T8BCZuST+2KjaVZF0fgUYh2os/fz1yQBZ1ZkDPnBIWEL
	 H5KeX8HRjGdCTcN4Qh/syN15j6OHrGLMsxd9GonmYR0Za4UI2wthKgQe9HRMYeZgjY
	 cp2PI6yqFTx9A==
From: Will Deacon <will@kernel.org>
To: stable@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Marc Zyngier <maz@kernel.org>
Subject: [STABLE] [PATCH] KVM: arm64: Fix kernel BUG() due to bad backport of FPSIMD/SVE/SME fix
Date: Fri, 22 Aug 2025 15:04:02 +0100
Message-Id: <20250822140402.2688-1-will@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_070416_856767_5260B520 
X-CRM114-Status: GOOD (  13.53  )
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

Upstream commit fbc7e61195e2 ("KVM: arm64: Unconditionally save+flush
host FPSIMD/SVE/SME state") relies on interrupts being disabled during
fpsimd_save_and_flush_cpu_state() so that a softirq cannot be taken
while the host floating point context is being saved and potentially try
to use kernel-mode NEON.

Unfortunately, stable kernels without 9b19700e623f ("arm64: fpsimd: Drop
unneeded 'busy' flag") leave interrupts enabled in
fpsimd_save_and_flush_cpu_state() and so the BUG_ON(!may_use_simd()) in
kernel_neon_begin() has been observed to trigger in real-world usage:

 |  kernel BUG at arch/arm64/kernel/fpsimd.c:1904!
 |  Internal error: Oops - BUG: 00000000f2000800 [#1] PREEMPT SMP
 |
 |  Call trace:
 |   kernel_neon_begin+0xdc/0x12c
 |   ...
 |   crypto_aead_decrypt+0x5c/0x6c
 |   seqiv_aead_decrypt+0x88/0x9c
 |   crypto_aead_decrypt+0x5c/0x6c
 |   esp_input+0x280/0x364
 |   xfrm_input+0x6ac/0x16f8
 |   ...
 |   net_rx_action+0x13c/0x31c
 |   handle_softirqs+0x124/0x3d0
 |   __do_softirq+0x14/0x20
 |   ____do_softirq+0x10/0x20
 |   call_on_irq_stack+0x3c/0x74
 |   do_softirq_own_stack+0x1c/0x2c
 |   __irq_exit_rcu+0x54/0xb4
 |   irq_exit_rcu+0x10/0x1c
 |   el1_interrupt+0x38/0x58
 |   el1h_64_irq_handler+0x18/0x24
 |   el1h_64_irq+0x68/0x6c
 |   fpsimd_save+0xe4/0x130
 |   kvm_arch_vcpu_load_fp+0x2c/0x58
 |   kvm_arch_vcpu_load+0x88/0x26c
 |   kvm_sched_in+0x2c/0x3c

Given that 9b19700e623f ("arm64: fpsimd: Drop unneeded 'busy' flag") is
not a fix in its own right, has non-trivial dependencies and is a
reasonably invasive change to the in-kernel use of fpsimd, opt instead
for a simple fix to use the softirq-safe {get,put}_cpu_fpsimd_context()
helpers in fpsimd_save_and_flush_cpu_state().

Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Lee Jones <lee@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: <stable@vger.kernel.org> # 5.15.y, 6.1.y and 6.6.y
Fixes: 806d5c1e1d2e ("KVM: arm64: Unconditionally save+flush host FPSIMD/SVE/SME state") # 6.6.y
Fixes: 04c50cc23a49 ("KVM: arm64: Unconditionally save+flush host FPSIMD/SVE/SME state") # 6.1.y
Fixes: 5289ac43b69c ("KVM: arm64: Unconditionally save+flush host FPSIMD/SVE/SME state") # 5.15.y
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/fpsimd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index a1e0cc5353fb..d0d836448a76 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1876,10 +1876,10 @@ void fpsimd_save_and_flush_cpu_state(void)
 	if (!system_supports_fpsimd())
 		return;
 	WARN_ON(preemptible());
-	__get_cpu_fpsimd_context();
+	get_cpu_fpsimd_context();
 	fpsimd_save();
 	fpsimd_flush_cpu_state();
-	__put_cpu_fpsimd_context();
+	put_cpu_fpsimd_context();
 }
 
 #ifdef CONFIG_KERNEL_MODE_NEON
-- 
2.51.0.rc2.233.g662b1ed5c5-goog


