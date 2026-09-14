Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3FCC88E71
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZW/Tdj3bVLx1UwE3X/hNQWAdAvY+Hiob2QqqnLyGvfE=; b=rKdc2WWBJ0JWNAq2KahdlSF7is
	vqyxbojUsoOCfqKyAryWTC50jQ0MdL25UURUJeni+flDE0Y0M6pxX2NSBpWDVTCijBT38HDiDlo5h
	aqT2HOMFNGmUI9JIZ1zTzry72ci5KXWr4N2yx9SXcUh/do3CwppRP0FHZ2Tgezd18EFv5qHV2Wn9D
	7X+6VXl0eDYqQ2G20+H2LUesXMTx1io/T2/cqukn3v3niy1woujfhi8vzKxY+L3zuU2JpmTKMeryF
	WqVI0FpAGi2d1zOX7W7QVUcoghW7renQGckXtvZMz76smj2Jviq6dgoek82TFE9m2lFFRZEeVaOQw
	5AkG5hJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x655Q-00000003Lbd-1bbJ;
	Mon, 14 Sep 2026 11:43:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x655C-00000003LLt-3Xfu
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 14 Sep 2026 11:42:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZW/Tdj3bVLx1UwE3X/hNQWAdAvY+Hiob2QqqnLyGvfE=; b=cKuiO0tnGBpAQQXcWCUyFNk3v3
	Nx85alwkPgWbptU4HDoGZeMy2B2pzNxicZwG4KFkdFSoJzOcJ+8PBU7TNoWQbXGbcxlyZpxdWlGwG
	cydhvh09HPF3KEjZT+Way3dkClJivr1o3YESnd49b+228r8PE6GKxpa4L93INTSJOb34uHbWsqpBB
	X9tLr/e0snkLySfIQDxvXW95pDv0bT2P5GPuSAgR3+B1g3oTXiFZgkK77150iVS4v8lqo4w7yMcx6
	2Hz0tfUwSp6PjaccIr37RSYxN/RVYoG86ZrZW0lYApV8G4hSMpxOdKCNg7UbyFeqpfRdlvZnO+s5X
	Z7qCXlDg==;
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6558-00000005YCo-14no
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 11:42:45 +0000
Received: from h183.csg.ci.i.u-tokyo.ac.jp (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 68EBfjs7084060
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 14 Sep 2026 20:41:53 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=ZW/Tdj3bVLx1UwE3X/hNQWAdAvY+Hiob2QqqnLyGvfE=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1789386113; v=1;
        b=MlGSDuk7SKaQ8izN+dOvH2xaoA9UX8xpYXL54GdL6gVXgk+Sq1cdZsXlFr+sLJP0
         Qe4q4XvQ4br61fjmjNFy4z7DjrTMs0gCmj9wensbeYGIcITJFSa7mU8/Qi0myRfU
         b9PAuytGmopZpYAeJ0nHvUSkEdSn57IlXAcjoEl+Tol6GOyvu1eWFC5M/9S3k7FZ
         wvPNHtlvKvTAqPUdMqQ4z2dKSUIyzssHDTjkRT2prvxaheGDWEPIBfhHx/LYqYYq
         HkfaSzTIqoy8egRkA8s78Sd9FwkSksEJONbzUR60ZuRilx01PxhWTTz6y5FayXLJ
         fOdGInMWdYRNYywdreF6TA==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Mon, 14 Sep 2026 20:40:44 +0900
Subject: [PATCH v10 05/20] KVM: arm64: PMU: Keep implemented counter mask
 EL-independent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-hybrid-v10-5-92788053a691@rsg.ci.i.u-tokyo.ac.jp>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1575;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=OkvBLyzd2QOHEMuSfHYwvhh6JbY910F/L4YLee/eXFI=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ9byu7kxU0pKhNqKfzIrGPgYPXZkDytU2X3GR0hBudl7l
 fsKI8GOUhYGMS4GWTFFlpSi3dwa0bWfChPiW2DmsDKBDGHg4hSAiWSdYvgfu6urzehA/b9Ej2Wc
 EZt6MzLvM9hH8/1S7+cQfRv428OZkeG4yDxhmwD9dP2QzfzbXz1ed6Fyv0aEouSxt2U256pfXGU
 CAA==
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_124243_017482_78D13C32 
X-CRM114-Status: GOOD (  10.74  )
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

kvm_pmu_implemented_counter_mask() derives the counter count from
kvm_vcpu_read_pmcr(). For a nested vCPU outside EL2, PMCR_EL0.N reflects
MDCR_EL2.HPMN instead of the VM-wide counter count.

Consequently, processing a PMU reload while the saved context is L2 can
clear and fail to recreate state for counters reserved for EL2.

Build the implemented counter mask from nr_pmu_counters instead. Keep
the EL-dependent HPMN restriction in
kvm_pmu_accessible_counter_mask(), where it controls guest access.

Fixes: 600f6fa5c90c ("KVM: arm64: Let kvm_vcpu_read_pmcr() return an EL-dependent value for PMCR_EL0.N")
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/pmu-emul.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 950b7a349659..a5ccb6ae44d5 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -317,12 +317,12 @@ u64 kvm_pmu_accessible_counter_mask(struct kvm_vcpu *vcpu)
 
 u64 kvm_pmu_implemented_counter_mask(struct kvm_vcpu *vcpu)
 {
-	u64 val = FIELD_GET(ARMV8_PMU_PMCR_N, kvm_vcpu_read_pmcr(vcpu));
+	u64 n = vcpu->kvm->arch.nr_pmu_counters;
 
-	if (val == 0)
+	if (n == 0)
 		return BIT(ARMV8_PMU_CYCLE_IDX);
 	else
-		return GENMASK(val - 1, 0) | BIT(ARMV8_PMU_CYCLE_IDX);
+		return GENMASK(n - 1, 0) | BIT(ARMV8_PMU_CYCLE_IDX);
 }
 
 static void kvm_pmc_enable_perf_event(struct kvm_pmc *pmc)

-- 
2.55.0


