Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139CEC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 11:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZW/Tdj3bVLx1UwE3X/hNQWAdAvY+Hiob2QqqnLyGvfE=; b=yAhdYjyZgx9JhI3G1JDqDNjDl3
	oZH7dyoHIxb2iF2g/h+rKv8G/4ok5AVtgl+iRRHetruDIP7O3VwhECfhMPS7HszJq7a3PbYBJtAsZ
	gVYbiAjB0mfktkGqJkcL6jB1XKjcZocq2ao6kbWkt/bx6arqx7CT/MMSiB9tmb0SpCE2YHybHnCty
	gZjA/r3xKIKMxW36mFma6jD8UvKJ4GU3pWdvsmkysT0wJrKVMI61KOsuDupQ5/enDPLMY9pXh1iQK
	ZelccFjKCaD9n/Z4dA7JlefRHbDhW/kyiCtGHDAq2clFXl+R+1CwUKIRhrf8M8AfGcGJLXbpWGN7b
	RKb2CV6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FY3-0000000HKFN-493e;
	Sun, 20 Sep 2026 11:17:31 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FXq-0000000HK4Y-2GP7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 11:17:23 +0000
Received: from [192.168.10.153] (p865013-ipoe.ipoe.ocn.ne.jp [153.242.222.12])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 68KBG36T088236
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 20 Sep 2026 20:16:10 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=ZW/Tdj3bVLx1UwE3X/hNQWAdAvY+Hiob2QqqnLyGvfE=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1789902971; v=1;
        b=DZ7tb1Zg7KJa7r9NzOcrdVSkBeYjnnHwOMG/8kMHjjYtgwSxzHF53V29mspJ0tEr
         43zUWR1U/DxM7/AwCtqitnPnYdtAE/WOA2lW2VvQJbzk5oAwIbX0HucRH3/Xuilr
         PRIruXe/v04gCEvdJHFHWWtb8+hIDGN/aQnJqYAemIZKjAVZIRyEkobgwoc6m69P
         pSMjp4wIuNx6Iud63Cs3nV7QUDggBRa41RzEkLL21HFgBAXN9Q9i2E8XFL8m//Vq
         zG9m8wJ28I/8bMBa6fohZU78V3SsARSwpSEurQPL5KWJGaEfBzr0IZKIYJmDLp5W
         5k65ECzCRmKoUn9OUYKqDg==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Sun, 20 Sep 2026 20:15:47 +0900
Subject: [PATCH v11 06/21] KVM: arm64: PMU: Keep implemented counter mask
 EL-independent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-hybrid-v11-6-03618771b0e1@rsg.ci.i.u-tokyo.ac.jp>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1575;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=OkvBLyzd2QOHEMuSfHYwvhh6JbY910F/L4YLee/eXFI=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ9b6A+nXOiXZp7lr/YvNnvj95sVnjqpq9dVP8yzKXaZ+2
 lDsfL+no5SFQYyLQVZMkSWlaDe3RnTtp8KE+BaYOaxMIEMYuDgFYCJxcgz/NCL+829oKJn7QtpR
 9uUCT96dh3+xsz+QNFx9SCp914OV7YwMbwI0OAINj9Vv2sIltv9Rh9eXs9e+cRrfv2AvVmZdYCT
 GAQA=
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_041718_800257_6A2C56F2 
X-CRM114-Status: GOOD (  10.98  )
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


