Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124BCC4451B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 06:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W4lqbbuFRL8zkHdtyIDwRkuJmQS4zljitCYbt4eFEpU=; b=uPG/oxKz+ZNkTW9YHOyhY0XnH9
	zibi4zmGzZOTyrpeFjraAV0AdERMQafzdLkxXpvhRjU5LdAbqfUzISaVRof16ixsrqU9a024iM2n5
	r3XY4FUMbD3B4sRsCl0Spn6cEneJO5c12e5po3hZH2FPNgfPGY7nJqGCmGJJWVKRDt+rXbohhbU8R
	gjNphClq+h7XbbJFztCT9C6K91wl5O6ElmV9WAcaBncnPZLLFr+2NTsSrk9N+Ga8ed+uG8kMZJJnp
	l/u5zFpEGZ0MPnrxBFuyG/ZD21NvtQQHhcYO3tOL3x61JDTbWLK4ntdjNcjUHBYsOqQSaIQ1fI/T1
	5HlCsLTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlgil-00000005s53-0rQI;
	Mon, 20 Jul 2026 05:39:19 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlgiW-00000005ruR-26Yo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 05:39:08 +0000
Received: from h183.csg.ci.i.u-tokyo.ac.jp (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 66K5c7oj075973
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 20 Jul 2026 14:38:25 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=W4lqbbuFRL8zkHdtyIDwRkuJmQS4zljitCYbt4eFEpU=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1784525905; v=1;
        b=FjP2Zp/gShL+KSdp17onx0WTPALVsK0YZkJSLbAHoGXn67MFLivI0gGT/lbQEZWk
         1OTRjgJVtX/Cr4u0gJvYsYiQGfsDGm56wjMOC/FkJ0zVTZMp6FBghXTfn0go2lxU
         yn//GSzCNfOjb2owuSH25gD2PZ1dKi7AdhlAt16SLmWm9sCSMsKj0IKQp3jOSUK6
         m4alfzGyQJg5oxh86XVKklL//pjBcdEGy0xMtq6uRFXrH0VNcrhUoGbT0zY3c1NN
         O4zStZHqi4B9zl177zBuF81j2NaT8zR5MGLDIczZgVQU/IVnr36xedlhA68Sbo22
         S8e5EOp61Ph97PjdbQgWPg==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Mon, 20 Jul 2026 14:37:55 +0900
Subject: [PATCH v9 01/16] KVM: arm64: Serialize repeated vCPU
 initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-hybrid-v9-1-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2147;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=B/aTTBwSppIIw7reVtSzRCsQnZmIJ/JGamCuAzhFrHE=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ1bsFqeYJVcEshYYc1SJLGk5GHSwSutY5GzVvw19XP/yt
 5y7sNS6o5SFQYyLQVZMkSWlaDe3RnTtp8KE+BaYOaxMIEMYuDgFYCIP9Bj+ym2ouDvLa29bkRGX
 +KmyeGa2p0/jLG72XejufW2vZjxRhZHh0jTR06ZXvzTefuA1Mavej/PskiSuGbyu87e1Tv2Y8lC
 WGwA=
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_223904_765539_310B28D4 
X-CRM114-Status: GOOD (  11.29  )
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

The initial KVM_ARM_VCPU_INIT path holds config_lock while resetting the
vCPU, but repeated initialization of an existing vCPU does not. As a
result, reset_mdcr() can race with VM-wide PMU configuration and
overwrite MDCR_EL2 with a stale counter count.

Take config_lock around the repeated-init checks and reset. The vCPU
ioctl already holds vcpu->mutex, matching the established lock ordering.

Fixes: c8823e51b534 ("KVM: arm64: Fix MDCR_EL2.HPMN reset value")
Closes: https://sashiko.dev/#/patchset/20260710-hybrid-v8-0-621409f3a592@rsg.ci.i.u-tokyo.ac.jp?part=1
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 arch/arm64/kvm/arm.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 50adfff75be8..a06ea39f57b1 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1652,29 +1652,26 @@ static int __kvm_vcpu_set_target(struct kvm_vcpu *vcpu,
 {
 	unsigned long features = init->features[0];
 	struct kvm *kvm = vcpu->kvm;
-	int ret = -EINVAL;
+	int ret;
 
-	mutex_lock(&kvm->arch.config_lock);
+	lockdep_assert_held(&kvm->arch.config_lock);
 
 	if (test_bit(KVM_ARCH_FLAG_VCPU_FEATURES_CONFIGURED, &kvm->arch.flags) &&
 	    kvm_vcpu_init_changed(vcpu, init))
-		goto out_unlock;
+		return -EINVAL;
 
 	bitmap_copy(kvm->arch.vcpu_features, &features, KVM_VCPU_MAX_FEATURES);
 
 	ret = kvm_setup_vcpu(vcpu);
 	if (ret)
-		goto out_unlock;
+		return ret;
 
 	/* Now we know what it is, we can reset it. */
 	kvm_reset_vcpu(vcpu);
 
 	set_bit(KVM_ARCH_FLAG_VCPU_FEATURES_CONFIGURED, &kvm->arch.flags);
 	vcpu_set_flag(vcpu, VCPU_INITIALIZED);
-	ret = 0;
-out_unlock:
-	mutex_unlock(&kvm->arch.config_lock);
-	return ret;
+	return 0;
 }
 
 static int kvm_vcpu_set_target(struct kvm_vcpu *vcpu,
@@ -1690,6 +1687,8 @@ static int kvm_vcpu_set_target(struct kvm_vcpu *vcpu,
 	if (ret)
 		return ret;
 
+	guard(mutex)(&vcpu->kvm->arch.config_lock);
+
 	if (!kvm_vcpu_initialized(vcpu))
 		return __kvm_vcpu_set_target(vcpu, init);
 

-- 
2.55.0


