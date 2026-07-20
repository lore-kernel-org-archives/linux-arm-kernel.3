Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F7DC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 06:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0hksgsoHb+5DPEqDI69vVoWioOdWpzFWo2XEINBkKEY=; b=sqVMWyFR/ycmjy1A1815bbjwod
	YwQsBWyghIWwPzahz2DYox5fXqw47QGBEdmV0EKKVlLs7nFuJwoS/Z9k0ECQUDnlDQedtev00ksgn
	6D/j4/Wag0t85DwDw1qHpeOuC5oUtFiifAYbGykAUY3cZgR2it2lltr2UbKcsc/DhL3Hhbx2K7w2Z
	bHcFKLZYkQFVon0agrsNB3WYJtmJ8887Ngp+Arkc72nDhNb4z+ONqsaTHcSP9a+IAYuouP/FnGS56
	xccy5yvhowlKP4FK9cCZn+dASB6rUYClSBAwUzA8FXD4NotaSosn+G/Qo8tnH9FnAKcw3IdDNLFLM
	VdlHCm2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlgik-00000005s2N-17dy;
	Mon, 20 Jul 2026 05:39:18 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlgiV-00000005ruM-4BHp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 05:39:07 +0000
Received: from h183.csg.ci.i.u-tokyo.ac.jp (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 66K5c7ol075973
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 20 Jul 2026 14:38:25 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=0hksgsoHb+5DPEqDI69vVoWioOdWpzFWo2XEINBkKEY=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1784525906; v=1;
        b=KR9J/1LsfcCUHiMKtSXTbiglekYsTdFxmUTKfBN55AS3aEINv6Zv7uLbXeoND/tQ
         l6KYch1zNeOAzBqeI6GLTxYhk2ipCxNMldf9dSHxe2QBEa3KDNLTq8ggkCM6LGC8
         jvllIlTKUkZ4GajUWKNaX9xxYcEC3e6cWc/8JYo6vLDHbfVba32+o/MGxLwA5Ic0
         x8KCZu4IWmDazK5jEb7xM055vqqzghw2I+ey/rMrk/7IMpIKNcvT8lUSLaxboOAC
         DcmrbrJphLS3jNQNMS3Ev9h7VJsSS39Ldps22jVT18l/zL9/8p5gbzyqv4F9AdsB
         vojYUpqc+eLoLvjkgmZszg==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Mon, 20 Jul 2026 14:37:57 +0900
Subject: [PATCH v9 03/16] KVM: arm64: PMU: Freeze counter count after first
 run
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-hybrid-v9-3-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1114;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=8DcNWD473O5mxKX4hIYKD0DwQc9QDM6rn/VJdtyi9jg=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ1bsFpdWCZXNC13nb33sknhDYZrRs2Sm3+/el3NfSjvy3
 zRLJWZyRykLgxgXg6yYIktK0W5ujejaT4UJ8S0wc1iZQIYwcHEKwETaWRgZ5u/ee9gnmnfj3v6J
 b7mDJJRMom8/c/N4wBYteE73ZW3zcoY/POq3P779e25nZtBbjySrZw5aOhuLKjJOumSvPmAU+eA
 bGwA=
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_223904_434841_E86A74DF 
X-CRM114-Status: GOOD (  10.50  )
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

PMU configuration is VM-scoped, but SET_NR_COUNTERS can be issued
through any vCPU. Checking only whether that vCPU's PMU has been
initialized allows userspace to change the counter count through an idle
sibling after another vCPU has run.

Reject the attribute once any vCPU has run. This keeps the VM-wide
implemented counter mask and the PMCR_EL0.N value stable after guest
execution begins.

Fixes: b7628c797376 ("KVM: arm64: Allow userspace to limit the number of PMU counters for EL2 VMs")
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 arch/arm64/kvm/pmu-emul.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index b5df6843dbcd..b4b877f31097 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -1087,6 +1087,9 @@ static int kvm_arm_pmu_v3_set_nr_counters(struct kvm_vcpu *vcpu, unsigned int n)
 {
 	struct kvm *kvm = vcpu->kvm;
 
+	if (kvm_vm_has_ran_once(kvm))
+		return -EBUSY;
+
 	if (!kvm->arch.arm_pmu)
 		return -EINVAL;
 

-- 
2.55.0


