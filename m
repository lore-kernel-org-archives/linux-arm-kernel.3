Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3D9C88E70
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iyM9QAloEsP9dHXX9S9zolMEUPTEvUttQXAYPXDanF8=; b=XSDYyTI1WpD87CaLXfkSMmu4ML
	9QSKdP9r4WvG/DO40Vp4qRDNacvUdxSIIPHPKW0xml4AxPkvLTltdTcV2ZdHCYIeoDDcuBuT41KdO
	n+NWNDZN8SbDSfVZfvGyZ5Rmn4apJfw8Zr6V0QXFDCjlZqNKKOmQApWHoePo1z/VvjNJhLPfVJDBq
	IxT4oqMQTR1VIAA4mxMnJmHP4q9FCuUtdDwvXrFWe+ouJ/VUV1kIHcwweZk4ImKICRbLTaGS+3axt
	LDo+pVVdpd3ypmNAlJjJgLEoKr/ZmeDZNcRMaJGMzB9TU8Gp9kyidaDTWTFkcPitBWHvuvSR/FPv+
	u0TZqW9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x655N-00000003LWl-2HVD;
	Mon, 14 Sep 2026 11:42:57 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6550-00000003LCU-022F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 11:42:40 +0000
Received: from h183.csg.ci.i.u-tokyo.ac.jp (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 68EBfjs4084060
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 14 Sep 2026 20:41:52 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=iyM9QAloEsP9dHXX9S9zolMEUPTEvUttQXAYPXDanF8=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1789386112; v=1;
        b=egksfB0gxWoRjuLMTmZOQYY/j0vinTsqdC2eTNFmQaStNsiEJyYBUd8CfVXpnxTY
         hN8ucEmXV7j617JiRIJktJAqHR7lfdarobfzgnzTzcdcBA3VMvGngdgSBQKYxfeX
         gMLRiETVRscgir9gRYGawiXJ2wXk0d0Dl59n41nenXjpt17K+RZUr5MN7D03Q72g
         7VTp4Dbnx+6zF+ZrqsCd9b3DDeRtlq8WrcKbxTPE836LnlKjW1Vb6Bd7otCjD7MH
         ICDzHU+s/+iOrXMVwzA2tjtXQHb5WOK/eC2Nr7rDw2mPPFCP+kxlx48cRaxj22ui
         WunabyaDzq14EqMmlBoxVw==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Mon, 14 Sep 2026 20:40:41 +0900
Subject: [PATCH v10 02/20] KVM: arm64: PMU: Stop updating MDCR_EL2.HPMN
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-hybrid-v10-2-92788053a691@rsg.ci.i.u-tokyo.ac.jp>
References: <20260914-hybrid-v10-0-92788053a691@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260914-hybrid-v10-0-92788053a691@rsg.ci.i.u-tokyo.ac.jp>
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
        Steffen Eiden <seiden@linux.ibm.com>, Fuad Tabba <tabba@google.com>,
        Shannon Zhao <shannon.zhao@linaro.org>,
        Andrew Jones <drjones@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
        Fuad Tabba <fuad.tabba@linux.dev>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2373;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=ZwHCND4TvpKjwaPcx6aqpVFdzyPHWHl27WcGIFnygC4=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ9byu9msy+7w37rQk/JOVmXCrDszPjxXmyv8guvFeb/Yv
 2EV3Y4LO0pZGMS4GGTFFFlSinZza0TXfipMiG+BmcPKBDKEgYtTACbylYfhn0nA593TK5YlPV9R
 pPHWVrrgZ7Op07q/TQsnp3/NTn51zYaR4coRnfuJ3wq2TlW+e2/qG+uWmNVvL8duTl7+Zcnl/99
 3hXIDAA==
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_044234_727023_632C439A 
X-CRM114-Status: GOOD (  12.16  )
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

KVM allows userspace to write any value to MDCR_EL2.HPMN. However,
kvm_arm_set_nr_counters() rewrites HPMN for every vCPU whenever
userspace changes the PMU or its counter count. This can discard a
value previously restored with KVM_SET_ONE_REG.

The architecture only defines HPMN's value on warm reset. Stop
rewriting it after vCPU initialization and update nr_pmu_counters
directly instead. reset_mdcr() continues to initialize HPMN from the
counter count current at KVM_ARM_VCPU_INIT.

Fixes: c8823e51b534 ("KVM: arm64: Fix MDCR_EL2.HPMN reset value")
Closes: https://sashiko.dev/#/patchset/20260706-hybrid-v8-0-de459617b59d%40rsg.ci.i.u-tokyo.ac.jp?part=6
Assisted-by: Codex:gpt-5.5
Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/pmu-emul.c | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 5b1af7e2176f..832dd145af2a 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -1035,30 +1035,12 @@ u8 kvm_arm_pmu_get_max_counters(struct kvm *kvm)
 	return bitmap_weight(arm_pmu->cntr_mask, ARMV8_PMU_MAX_GENERAL_COUNTERS);
 }
 
-static void kvm_arm_set_nr_counters(struct kvm *kvm, unsigned int nr)
-{
-	kvm->arch.nr_pmu_counters = nr;
-
-	/* Reset MDCR_EL2.HPMN behind the vcpus' back... */
-	if (test_bit(KVM_ARM_VCPU_HAS_EL2, kvm->arch.vcpu_features)) {
-		struct kvm_vcpu *vcpu;
-		unsigned long i;
-
-		kvm_for_each_vcpu(i, vcpu, kvm) {
-			u64 val = __vcpu_sys_reg(vcpu, MDCR_EL2);
-			val &= ~MDCR_EL2_HPMN;
-			val |= FIELD_PREP(MDCR_EL2_HPMN, kvm->arch.nr_pmu_counters);
-			__vcpu_assign_sys_reg(vcpu, MDCR_EL2, val);
-		}
-	}
-}
-
 static void kvm_arm_set_pmu(struct kvm *kvm, struct arm_pmu *arm_pmu)
 {
 	lockdep_assert_held(&kvm->arch.config_lock);
 
 	kvm->arch.arm_pmu = arm_pmu;
-	kvm_arm_set_nr_counters(kvm, kvm_arm_pmu_get_max_counters(kvm));
+	kvm->arch.nr_pmu_counters = kvm_arm_pmu_get_max_counters(kvm);
 }
 
 /**
@@ -1136,7 +1118,7 @@ static int kvm_arm_pmu_v3_set_nr_counters(struct kvm_vcpu *vcpu, unsigned int n)
 	if (n > kvm_arm_pmu_get_max_counters(kvm))
 		return -EINVAL;
 
-	kvm_arm_set_nr_counters(kvm, n);
+	kvm->arch.nr_pmu_counters = n;
 	return 0;
 }
 

-- 
2.55.0


