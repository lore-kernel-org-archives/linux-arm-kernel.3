Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A14C44528
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 05:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mUQHRYBlGhx5jURjlXWULskvPAxw9G3BCiuXa0uo3a8=; b=XAeLdXtNDbIVF464iasqi546Zo
	wu+1sc+7Q1XJk+XRTS1WI8vgDHf+F/5cNTcPCySIeDjxg1FszoOqIgUZDHHjDxiHD40yUa22vwJ+k
	40VzGg5gc/g0hgW4CDu14BrZL19T0WTip6TSjIe8Q03zB+cztf8Wr9sssg+5L93dr2DogigEZBDro
	bGhoo1H/A664Tz/fPBGxXtMZbpFQDRUIxbdksImifmfBhFBrJWqw7q9fQv+O89Dpx7HNkdAB4ws40
	/UfjI0mc09eEBr++WfM2533UueB18Eq1kuGI1O9gf5iGyupI4c1VhsGod85pwXnWaktYS5W6kZwvf
	Ii5FrZ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlgil-00000005s5z-2IEr;
	Mon, 20 Jul 2026 05:39:19 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlgiZ-00000005rx6-0diM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 05:39:09 +0000
Received: from h183.csg.ci.i.u-tokyo.ac.jp (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 66K5c7on075973
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 20 Jul 2026 14:38:26 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=mUQHRYBlGhx5jURjlXWULskvPAxw9G3BCiuXa0uo3a8=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1784525906; v=1;
        b=D6b/WSqHVovJK4Q19o97DKJGiP5FZ3aAp1jwFdZSVC1NUzq6XL6sV+0VPW3PRyTE
         BP7g5aVoJWrq2AnqRWPNEw9QVi97Wyub8d3dgYwntZGD9ePfu7E73HdgytX2jSQB
         U01UJcWXDFO8NO32aEJtd3S5MBM5U7rJR2yXZBwI0uwgncWUN/u7GxehqDWAPvxZ
         6qayUI9WJKUGzvOekrn7d66lM3/QlfFBsxhL4Gjp01YwJqda5ZfYGKWjSeJ8gbbB
         GOU9L9dWXvpA799uD1CubWPGFL9waYBe1xmVUmJ9ObKtMb/+aYnkSqMJC/oKA/qg
         asjkra+9gF9PHWDfqoJscQ==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Mon, 20 Jul 2026 14:37:59 +0900
Subject: [PATCH v9 05/16] KVM: arm64: PMU: Keep implemented counter mask
 EL-independent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-hybrid-v9-5-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1527;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=s242nEr/47FPc5ZwVePZZQB+vYSDHKir8Bpuzgyr/Yg=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ1bsFrep77uTlWZPWFb33eD2WsXbO9RNPbrL2q7OffNCu
 rNizkH1jlIWBjEuBlkxRZaUot3cGtG1nwoT4ltg5rAygQxh4OIUgIlc3s/I0CH5ybX8QPeuRves
 iL69hQtmyl2x1lD4fN4898qsq3MmKTL8U4qd6bfF+Umxr6uMs+OFianbt+Wp35W9uWl2e95Fzjg
 +ZgA=
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_223907_485634_D1EAC1DA 
X-CRM114-Status: GOOD (  10.93  )
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
---
 arch/arm64/kvm/pmu-emul.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index b4b877f31097..5281d37634a0 100644
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


