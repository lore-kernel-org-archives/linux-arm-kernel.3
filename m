Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EFCC982E6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 11:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GWp1qZjKZJDBgpGF1xqb2F0C/RBOoHyL11jPLC8n4jE=; b=dVw+Q4m2NOUhqKQgh/9oeb84bv
	C5GXXeM0gJGh8UNLIn+jKoPrd98pWyGFbx/ug65AXC6ubxbYzgXgQ//apFbB41fII+gj9g+MCdbSs
	pi+pE8J0TsWoyT8QlYeObIbzL/IEa01XHhWr5eLAdlTf7BXCe0QUk81yJ2wbTcVJ5XYTvacmqzs27
	WQjIo6UVZKOZBNLAkkw/0zLO4IKR7OtpMidZkqxLnMb1w/IVYgDSJfdpnFrmcN5rUzeaQLsYLUNww
	Q8W/3bXCE+p1k81JTw0qMHI1bULYTPKglfJI0lqsaM7wunNzQqtjH200ENOCADtJm2VaLFdF3sgPz
	P4IEA4DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FY4-0000000HKFs-0lWi;
	Sun, 20 Sep 2026 11:17:32 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FXr-0000000HK6B-3WhI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 11:17:23 +0000
Received: from [192.168.10.153] (p865013-ipoe.ipoe.ocn.ne.jp [153.242.222.12])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 68KBG36c088236
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 20 Sep 2026 20:16:15 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=GWp1qZjKZJDBgpGF1xqb2F0C/RBOoHyL11jPLC8n4jE=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1789902975; v=1;
        b=oIHGjcGoZs8L8idyNxvQRy4DBmOkG1C+oz6eKCuD2GT+YGuCFF4A60sdJgGVnQZN
         PP+AeuXNFbNOW2SG456aYFwD1DRuhuy0y6OokG3I+1drSG7NyvEswH+Cq5Dnx4rC
         KoQi36jDonppgWwNMOdUNvbnvgkKm9sP1FzsJrVh7vVSzAoCMpFGMsCGMZImXL9b
         JPKvgdqLr5EaoZ0vDw9n+qrmHerbWxhi7ZAUIp/o9ZpI6y58cUuzFE9ulpMxy6UV
         tnp8ft2FIep8yluOYwFc8ZypmFrSmYdC8PDYYpZ5FpzomBvVx4+x2mnkSsCIZDjR
         69pOg41qFlH74QY+iV8iqQ==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Sun, 20 Sep 2026 20:15:56 +0900
Subject: [PATCH v11 15/21] KVM: arm64: Don't clear vcpu->cpu in
 kvm_arch_vcpu_put()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-hybrid-v11-15-03618771b0e1@rsg.ci.i.u-tokyo.ac.jp>
References: <20260920-hybrid-v11-0-03618771b0e1@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260920-hybrid-v11-0-03618771b0e1@rsg.ci.i.u-tokyo.ac.jp>
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
        Steffen Eiden <seiden@linux.ibm.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Fuad Tabba <fuad.tabba@linux.dev>, Mark Rutland <mark.rutland@arm.com>,
        Sean Christopherson <seanjc@google.com>,
        Shannon Zhao <shannon.zhao@linaro.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Fuad Tabba <fuad.tabba@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2532;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=Wo4YX+JLn2zPeTcpRRl6wn6Y1qLLImnsb8pkey2lNzQ=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ9b6A3mKc0N+9P78tqUzc2vVk7nLwm4m1dgWR/9iWT+rK
 TqmU62go5SFQYyLQVZMkSWlaDe3RnTtp8KE+BaYOaxMIEMYuDgFYCL7DBj+h6Wn3HuesGXSm685
 Au+T6j1jlD5J3rF6Pefceyb2C7cLzzP8D7198Pr5eFbf2qK0BzZ/Ko4sk/lx4/4EZq/qHsvQo0u
 VmQA=
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_041720_111119_16469860 
X-CRM114-Status: GOOD (  15.06  )
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
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/arm.c   |  1 -
 arch/arm64/kvm/reset.c | 16 +++++++++++-----
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 997f24f5fb91..55b07926ce2e 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -767,7 +767,6 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 	kvm_arm_vmid_clear_active();
 
 	vcpu_clear_on_unsupported_cpu(vcpu);
-	vcpu->cpu = -1;
 }
 
 static void __kvm_arm_vcpu_power_off(struct kvm_vcpu *vcpu)
diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index adcb460a5287..db794d50fa18 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -178,7 +178,8 @@ static void kvm_vcpu_reset_sve(struct kvm_vcpu *vcpu)
 void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_reset_state reset_state;
-	bool loaded;
+	struct kvm_vcpu *running;
+	bool loaded = false;
 
 	spin_lock(&vcpu->arch.mp_state_lock);
 	reset_state = vcpu->arch.reset_state;
@@ -188,10 +189,16 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 	/* Reset PMU outside of the non-preemptible section */
 	kvm_pmu_vcpu_reset(vcpu);
 
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
@@ -218,7 +225,6 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 
 	if (loaded)
 		kvm_arch_vcpu_load(vcpu, smp_processor_id());
-	preempt_enable();
 }
 
 u32 kvm_get_pa_bits(struct kvm *kvm)

-- 
2.55.0


