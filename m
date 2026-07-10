Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3AEDC44506
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 11:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JuirHxy2JdcdOWMIyjetVaMm5INIuwHNGdnNKrdLT4k=; b=W8ntLAEiqnIMrduo9g+tH7cBV3
	gYu5ie1tJJDFXNR2XWZAUhzQJi5XKz9xI7MsExaWS9qInmt7xDOzDm0/BxYXiY23YRnANlYwG4pAu
	t0dCh0REeDH5vrm9wFRRPUoEOPSLwMWD8LiTUpiZe0H9b4fEEd+qtxyQS/Yo2iYSNF8QBNeqVeNR+
	XxC+JM8cM6+lfz10pS4CYyxppgfulF5OPmdMSRvpvEIm+FFXiQG0uUVo4Vx6RLF5RbRdrFIZIN4jG
	YA/rsB1FTY07MXYjpcpAykoR6qrKQK5sAdCz4MQrrIL7BvXP8m60LGYG14o1sgXiw//iZcqcul2P8
	b3OZTTPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9D2-00000004nWV-2kRr;
	Fri, 10 Jul 2026 11:15:56 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9Cy-00000004nSy-1pbm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 11:15:56 +0000
Received: from h183.csg.ci.i.u-tokyo.ac.jp (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 66ABEvsJ024946
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 10 Jul 2026 20:15:10 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=JuirHxy2JdcdOWMIyjetVaMm5INIuwHNGdnNKrdLT4k=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1783682110; v=1;
        b=YF7wA/hxobu26go9W+0X6qeajGIxufeutjM/XKC6Fj0OKeRZ++6yfnLkbNwTQwoa
         TN0hXICa8KtUg+Rt0WDP8V3bxT3Dx48bu/ub3HpwNbYyVJpUc8JtPwVlQXcIBESs
         PrhqKjJtF/i5YucfX0XiE6ZujYXfJapozDYv27dWOUSirL+nGwmIjmAvLdJV8fbr
         RamAqUWIMVHZV5oTvvvlLMpByr07Y/0Ai5xfehpIpoAJ4NGPDfoOfKNn1+rgNByx
         /kgoQps9mlV7RSwDV3Nza+r1c3LmVxAkhs0/mzDSYtHdZCMgIxqbaiUFw2db0HC7
         mX6Q5vU1UW0MXnD7PZwbtw==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Fri, 10 Jul 2026 20:14:59 +0900
Subject: [PATCH v8 05/11] KVM: arm64: Don't clear vcpu->cpu in
 kvm_arch_vcpu_put()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-hybrid-v8-5-621409f3a592@rsg.ci.i.u-tokyo.ac.jp>
References: <20260710-hybrid-v8-0-621409f3a592@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260710-hybrid-v8-0-621409f3a592@rsg.ci.i.u-tokyo.ac.jp>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
X-Mailer: b4 0.16-dev-925f5
X-Developer-Signature: v=1; a=openpgp-sha256; l=2455;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=M8lM3x/ufgUWZRiJ1lSqB1wM8VCxi9Kmy0/qLfUXi4A=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ1bAFfOf/WuY+N2dX9fcMMm29rz3OP/4/YST0Smnf3wOt
 VxnXHyno5SFQYyLQVZMkSWlaDe3RnTtp8KE+BaYOaxMIEMYuDgFYCIzVzL8T8nW5bLyupylpbby
 ac1Fn9tPvv1LWOazrfqBw/ISkYhgZkaG56dXXj+w5WKCr3Qfc+DyzsP/JR8t7chP4d/ocfOHzoq
 jDAA=
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_041552_719649_42298B96 
X-CRM114-Status: GOOD (  15.23  )
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

From: Oliver Upton <oupton@kernel.org>

commit e9b152cb957c ("arm/arm64: kvm: Set vcpu->cpu to -1 on vcpu_put")
reset vcpu->cpu in order for the VGIC to determine if there was any vCPU
running at the time of access. The VGIC has gone through an entire
rewrite since then, and with commit 7d450e282171 ("KVM: arm/arm64:
vgic-new: Add userland access to VGIC dist registers") the user
accessors just grab all vCPU mutexes instead.

Drop this remaining vestige such that kvm_arch_vcpu_load() can properly
detect a CPU migration. While at it, rework kvm_reset_vcpu() to do a
much more pedantic check that the provided vCPU is actually what's
running on the present CPU.

Signed-off-by: Oliver Upton <oupton@kernel.org>
Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 arch/arm64/kvm/arm.c   |  1 -
 arch/arm64/kvm/reset.c | 16 +++++++++++-----
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 29f48f2c63ec..58d0783f254d 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -734,7 +734,6 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 	kvm_arm_vmid_clear_active();
 
 	vcpu_clear_on_unsupported_cpu(vcpu);
-	vcpu->cpu = -1;
 }
 
 static void __kvm_arm_vcpu_power_off(struct kvm_vcpu *vcpu)
diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index b963fd975aac..6bfb21f00444 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -190,7 +190,8 @@ static void kvm_vcpu_reset_sve(struct kvm_vcpu *vcpu)
 void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_reset_state reset_state;
-	bool loaded;
+	struct kvm_vcpu *running;
+	bool loaded = false;
 	u32 pstate;
 
 	spin_lock(&vcpu->arch.mp_state_lock);
@@ -198,10 +199,16 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 	vcpu->arch.reset_state.reset = false;
 	spin_unlock(&vcpu->arch.mp_state_lock);
 
-	preempt_disable();
-	loaded = (vcpu->cpu != -1);
-	if (loaded)
+	guard(preempt)();
+
+	running = kvm_get_running_vcpu();
+	if (running) {
+		if (KVM_BUG_ON(running != vcpu, vcpu->kvm))
+			return;
+
+		loaded = true;
 		kvm_arch_vcpu_put(vcpu);
+	}
 
 	if (!kvm_arm_vcpu_sve_finalized(vcpu)) {
 		if (vcpu_has_feature(vcpu, KVM_ARM_VCPU_SVE))
@@ -269,7 +276,6 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 
 	if (loaded)
 		kvm_arch_vcpu_load(vcpu, smp_processor_id());
-	preempt_enable();
 }
 
 u32 kvm_get_pa_bits(struct kvm *kvm)

-- 
2.55.0


