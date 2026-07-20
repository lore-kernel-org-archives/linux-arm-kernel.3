Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F63C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 05:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zeko5Okd0jmlXlufon0CsSK3pmAlC49DCGY0aE+GABo=; b=bEAjxmmnH46ldFwtKds4mxkGx2
	iCXOzs0v8xu2vD8Q1U82Ehd5TXIXerZRKCf7GIgV6eBAOxhbIg74KZZDl8xYKJWfM2DyC1wxz1BIb
	kDR9BNFxJuA9I6GAzhT6KVd8PEjIKPYPPcHSA+xuDxBlUy1x/lQHyfvNkUgYnwabMcM9QCcbTmz+Y
	8IMrhyF26e6vsVfvFxhwoaDrKMhLxeoQkPcpRYOdckDtfg0XjW/qMSBx0YO9z7ysZFvlzt63Zd8PM
	ZlYGrgDlZqPhOcHAxXGYyEoXnFrKZHpyuSPZV2Y7yuwhaYSkP4OlKbOERxWXBK4oSYGFnea1i5zvG
	Z9tT7wHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlgiZ-00000005rxV-0Jv4;
	Mon, 20 Jul 2026 05:39:07 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlgiV-00000005ruJ-43B2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 05:39:05 +0000
Received: from h183.csg.ci.i.u-tokyo.ac.jp (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 66K5c7os075973
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 20 Jul 2026 14:38:28 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=Zeko5Okd0jmlXlufon0CsSK3pmAlC49DCGY0aE+GABo=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1784525908; v=1;
        b=WnMAJ3dIkHmkuiqDCsnt4MjIe9dqnfg2ATTdY+MRDFkvitOqigwxPPug/AXXn1I2
         FqxrK+zXqUw9yoKz+WGlVI6zm409Iy9PJCaQG56UmEUu+YI+I8b0nQ1Y66+gNZGI
         R3Mwc/E5hA7KJ/UzL/onFdVhQpgs3F6EUpG9HnUHWxUktYi1D4tv+qJQptD8X6zV
         wnzjiJ1ZoTPLAg1U/9ZLU5FandWDVNcanAkQNxtCs9sd/LNZM+PihluvfJhfs7i9
         et5b8v7RNH1/uzTvCicaSrcaYnqio4jsxz7kN5ke9JYK+FKLJJB4qWo7zr8ZJpI4
         3400pJYncgK0vr5CwQngfA==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Mon, 20 Jul 2026 14:38:04 +0900
Subject: [PATCH v9 10/16] KVM: arm64: Don't clear vcpu->cpu in
 kvm_arch_vcpu_put()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-hybrid-v9-10-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
References: <20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
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
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Steffen Eiden <seiden@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
X-Mailer: b4 0.16-dev-925f5
X-Developer-Signature: v=1; a=openpgp-sha256; l=2455;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=aa7MZ4VKOeuhZU18cZFCsTpkNsElv6XslXDKEEI3kxo=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ1bsFi/eHTc/Baje89v/bsb3GysZA5O/TYl8ufORy8mcd
 qbDDzr2dJSyMIhxMciKKbKkFO3m1oiu/VSYEN8CM4eVCWQIAxenAEzkmCDDfxfVpheSr1QDuDW+
 d7alOl5MOsYULLvYTcPxatjp1ODc+Qz/DByfKZo+y17MoDfHpXbxL/3jp559e9n1U/PajBCR58x
 POQE=
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_223904_426334_849EDF93 
X-CRM114-Status: GOOD (  14.54  )
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
index a06ea39f57b1..72ce79ce4d5e 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -749,7 +749,6 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
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


