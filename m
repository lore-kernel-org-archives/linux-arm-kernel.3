Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 642CAF33805
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 06:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vpu164nWx4WQH4ej/oGZKppmfZaoPsbjbattGAiYgSg=; b=q9oZ2nPDAsJ5tXaKWjayEuF8ke
	KV/iE1K3ClTdSdnDjnS7oSc+NIrpx/DWod8tWEmw2yal3wrll91E1jEQvhZnkYsctV6o02b94mgEE
	lTxn0rNMsW5MrbJkzi/QqBtDEFUp4q3u+0iCpoPNQr0OTXFSVmFKrBwbz7YBfzYuKPV2Z3pQQLFh8
	txI6D1R209WXTacV3lQVh8CpL1Dd/kg1bYaVfmbt6AhEvO93az7h5tBHZzgzJB0dZahroZMm1aylI
	l/pNYEkbaIfDXE03al8phKOYsLutMiRnje34B6SNtMNTwtEEeCWkHtiDsd0axNCzQpWG3y+Ben2bI
	i5t0TYuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2O3u-00000005VNU-1ZBM;
	Tue, 17 Mar 2026 06:37:54 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2O3r-00000005VMr-1t8g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 06:37:53 +0000
Received: from h205.csg.ci.i.u-tokyo.ac.jp (h205.csg.ci.i.u-tokyo.ac.jp [133.11.54.205])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 62H6aoNl004343
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 17 Mar 2026 15:37:00 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=Vpu164nWx4WQH4ej/oGZKppmfZaoPsbjbattGAiYgSg=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1773729421; v=1;
        b=Uv38ahS0027vqQrbNp5ZXxqFQJvRmc6zUg9PFzYvYXNYliRYhrmFcZqez911WSTt
         YU8glRax61lZJrhDsMgPp8n07hqRkpqTbop74N4FLPE7dvMCz8MowA8r4mALFVsO
         JGxcOisqxHRHL/++Ft1vC3ztegZmSIsu65KH0sBBAiCTzo5VQbEbdYh/vFljChNf
         10/G+rd9RyrEaBDP27L5GmSCyjcVrdwp3L48ejT9N3fVaGgcDHt35bj3BEfO1ZCe
         ySAt1VbtwJXS5bKI9CT3i/P0BcIpRCSkl8TBS1aZPj97/9wj6wCFUGF5Ip4r7ZwW
         aoVywVNUh42j4C8eys+HQg==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Tue, 17 Mar 2026 15:36:49 +0900
Subject: [PATCH v4 1/4] KVM: arm64: PMU: Add kvm_pmu_enabled_counter_mask()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-hybrid-v4-1-bd62bcd48644@rsg.ci.i.u-tokyo.ac.jp>
References: <20260317-hybrid-v4-0-bd62bcd48644@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260317-hybrid-v4-0-bd62bcd48644@rsg.ci.i.u-tokyo.ac.jp>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
X-Mailer: b4 0.15-dev-5ab4c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_233751_941699_B3ECE832 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
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

This function will be useful to enumerate enabled counters.

Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 arch/arm64/kvm/pmu-emul.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index b03dbda7f1ab..59ec96e09321 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -619,18 +619,24 @@ void kvm_pmu_handle_pmcr(struct kvm_vcpu *vcpu, u64 val)
 	}
 }
 
-static bool kvm_pmu_counter_is_enabled(struct kvm_pmc *pmc)
+static u64 kvm_pmu_enabled_counter_mask(struct kvm_vcpu *vcpu)
 {
-	struct kvm_vcpu *vcpu = kvm_pmc_to_vcpu(pmc);
-	unsigned int mdcr = __vcpu_sys_reg(vcpu, MDCR_EL2);
+	u64 mask = 0;
 
-	if (!(__vcpu_sys_reg(vcpu, PMCNTENSET_EL0) & BIT(pmc->idx)))
-		return false;
+	if (__vcpu_sys_reg(vcpu, MDCR_EL2) & MDCR_EL2_HPME)
+		mask |= kvm_pmu_hyp_counter_mask(vcpu);
 
-	if (kvm_pmu_counter_is_hyp(vcpu, pmc->idx))
-		return mdcr & MDCR_EL2_HPME;
+	if (kvm_vcpu_read_pmcr(vcpu) & ARMV8_PMU_PMCR_E)
+		mask |= ~kvm_pmu_hyp_counter_mask(vcpu);
+
+	return __vcpu_sys_reg(vcpu, PMCNTENSET_EL0) & mask;
+}
+
+static bool kvm_pmu_counter_is_enabled(struct kvm_pmc *pmc)
+{
+	struct kvm_vcpu *vcpu = kvm_pmc_to_vcpu(pmc);
 
-	return kvm_vcpu_read_pmcr(vcpu) & ARMV8_PMU_PMCR_E;
+	return kvm_pmu_enabled_counter_mask(vcpu) & BIT(pmc->idx);
 }
 
 static bool kvm_pmc_counts_at_el0(struct kvm_pmc *pmc)

-- 
2.53.0


