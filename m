Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FB3C88E71
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 12:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WuWnwqCNPKyd10mfaIbh/UnI7VkNA3SDAFQEGvpGt+w=; b=bfKYOlWf+lUMIjTm5+WDDgM35x
	II9JUXUhi+6pdsCI1J9Ch6G52BXLl5+F4OkiXnY7UyP0hZee/GLlYUift2VUtFNhmpUGAIZOPlBXI
	4kYG7KUP+S519F+0Q1ywUnJBrj1WwLx7NX7rEbR5Zyn4JewYFSuHY7uVhDMF5jsXD1Q8J8KOLBYqU
	FD6Iv9MSWPwHHjqpB75CJQ54hEoEJDiErma6pwOiXi9YVAYU4Jg77kPoAUAiFE6mLGsByRCVUyX6j
	6JJ8HNpDsOtCSXy9Layc5R4khOyetWNySR+URQhPvUJGWbwZ4ZiWIhfks4Mt6Ab/idKhOoh+j8JrO
	WigHlLSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x655K-00000003LRb-0EwM;
	Mon, 14 Sep 2026 11:42:54 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x654z-00000003LBu-2DUR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 11:42:39 +0000
Received: from h183.csg.ci.i.u-tokyo.ac.jp (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 68EBfjs3084060
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 14 Sep 2026 20:41:51 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=WuWnwqCNPKyd10mfaIbh/UnI7VkNA3SDAFQEGvpGt+w=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1789386111; v=1;
        b=L+jO2MBbTPmA0boMnNUJKCuAb66bZMkmvzRSK5uqaAxQQJ/WYom8stRBV6WA4+YS
         jmOZ0CrK/AKOZhLqBVbrMhL7nM2AuISLCw46d7Bslb1MDHb1e3DJe3x334zeEGVO
         3R/bJ5RaRhH94P091FQTsMys7oIwc7agGI5zGASDpuUi5IpvvS8vL871LlTIcgd6
         EjMugZwKCMLrutpQWMJbIQOfQtotuMuezB7nUqhsQFM6etG8HtPyEPi1usY9z/6r
         G+QPDlRrzj7VD7Qug4gvNOrKGAxaNVCKsZugusCZ7dJ2qK/jVzCOBMRDMegil5fZ
         GZnJMaTR48NIqAqDakifQw==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Mon, 14 Sep 2026 20:40:40 +0900
Subject: [PATCH v10 01/20] KVM: arm64: Serialize repeated vCPU
 initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-hybrid-v10-1-92788053a691@rsg.ci.i.u-tokyo.ac.jp>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2195;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=b0gpHADGjg7FmvYTFl6eo7SpNdkhqRjVujNp+tm+UG4=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ9byu1m5z9P7hBI2RW46sSD4puuv14HWBy23KvTK57Ytk
 eF7vbe7o5SFQYyLQVZMkSWlaDe3RnTtp8KE+BaYOaxMIEMYuDgFYCJWSYwMt9/XXen4MrH92b9X
 jRb35qWUftH1e2R/KDp8EsPx0nAbHUaGSc8fPHKp/K+UnyRs89NjlZLJrqKsDO9Lz6vSE3/vSPZ
 hBAA=
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_044233_847807_F4187A5A 
X-CRM114-Status: GOOD (  11.04  )
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
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/arm.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index ccae82c1242b..8eff03c32418 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1670,29 +1670,26 @@ static int __kvm_vcpu_set_target(struct kvm_vcpu *vcpu,
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
@@ -1708,6 +1705,8 @@ static int kvm_vcpu_set_target(struct kvm_vcpu *vcpu,
 	if (ret)
 		return ret;
 
+	guard(mutex)(&vcpu->kvm->arch.config_lock);
+
 	if (!kvm_vcpu_initialized(vcpu))
 		return __kvm_vcpu_set_target(vcpu, init);
 

-- 
2.55.0


