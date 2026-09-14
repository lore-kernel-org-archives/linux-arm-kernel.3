Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0B8C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pX0Gstc1Ertc6iL8yk+ZMEZK0QXPWozbpjP8Gohxns0=; b=gzcNTkTk2y8FsFbnMRQCRENZX+
	7oBQ6uhMdr6vq37GP6JxhJG6Ethe+fW+A6jjl5ERRhlHHof0ZDIpSpga85ug2/M4pO9S9CfQhMoyz
	Q9zAwMJRggDk/1y9kJm8c6Sb0tkefRE1UvUXjycZ725PaPP/bdZ8aM4L19Nj60SV5WepsVNtsj/Lf
	MpeR/R4yqdL3L9w+lpfIyF5jHfFP/CQUwGG50u6Z5IVlEy5bQkbJwhBB3qjQe8+5WwjFyxi5kq/yp
	hE8+NV9Tk7fbugJCWuQ60APqUKaeFqpDWEZOXMuEsq/4L/yHEKD1rWpKBiFdtBh8bUPCeBmGaU4J1
	3Nrgwn0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x655H-00000003LO3-34xS;
	Mon, 14 Sep 2026 11:42:51 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x654z-00000003LAZ-18dO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 11:42:37 +0000
Received: from h183.csg.ci.i.u-tokyo.ac.jp (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 68EBfjsC084060
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 14 Sep 2026 20:41:54 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=pX0Gstc1Ertc6iL8yk+ZMEZK0QXPWozbpjP8Gohxns0=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1789386115; v=1;
        b=l1W2v5Qx5rUm34g40Gh2o61QKWZqK2Y+nTZKFig9EJSc8cALPd/FBzaHWRREOoJ3
         1ePP/8d6B/IZjWU9cE9ucQQGKGJEMHCZ9rwUVzgQW1HUrUKFrVqFTBpM+vmQBGSB
         HuGhNOikoDsNu0BS1fcjzLfPJ7GYxzIP42kofrnRYZjere+8I3lg3+CFBMKXKCs/
         Cc4zJnat1sa8LduRkFCAAPyMJ1quf9CTXwwxecK5DRqa8drAtXuSyCIpgpMh30XO
         j0RIGZM7GvtqkkXU5254kCFlUMhEB49Ti/XcapCR3Yw2LBYpkT9DxnfPsbwG0wSU
         tREZpVFN1wBbCHScovTRdA==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Mon, 14 Sep 2026 20:40:49 +0900
Subject: [PATCH v10 10/20] KVM: arm64: PMU: Recreate events after userspace
 event writes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-hybrid-v10-10-92788053a691@rsg.ci.i.u-tokyo.ac.jp>
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
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2412;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=XEN5pHk3w1/hxMK0z6EV+BLRLbCPDz0QttuLY+8Ci0A=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ9byu4WfNi16ZDB1rtfCxjPn9Axa4m7e2N197uej7W+9j
 zkVyi4U6ShlYRDjYpAVU2RJKdrNrRFd+6kwIb4FZg4rE8gQBi5OAZhI6mqG/2XM37lspd8VF1yZ
 cqHSePLC3X8SUvccvJS97e9KlZPreHsZGVprXZoMGxpf7DqX9Xa5s/e1nBciZQvWei5U/L1ggqa
 AAT8A
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_044233_721528_9FC65D5D 
X-CRM114-Status: GOOD (  13.50  )
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

KVM_SET_ONE_REG writes to PMEVTYPERn_EL0 and PMCCFILTR_EL0 use the
generic raw system register assignment. If a backing perf event already
exists, it keeps its old event selection and privilege filters.

Add a setter that preserves the raw userspace register value and
requests deferred event recreation. This rebuilds the event on the vCPU
thread without changing values returned by KVM_GET_ONE_REG or applying
guest-write masking.

Fixes: 9feb21ac57d5 ("arm64: KVM: Add access handler for event type register")
Closes: https://sashiko.dev/#/patchset/20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp?part=6
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 arch/arm64/kvm/sys_regs.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 2754b743da01..a5c121482c71 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1334,6 +1334,15 @@ static int set_pmreg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r, u64 va
 	return 0;
 }
 
+static int set_pmu_evtyper(struct kvm_vcpu *vcpu,
+			   const struct sys_reg_desc *r, u64 val)
+{
+	__vcpu_assign_sys_reg(vcpu, r->reg, val);
+	kvm_pmu_request_recreate(vcpu);
+
+	return 0;
+}
+
 static int get_pmreg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r, u64 *val)
 {
 	u64 mask = kvm_pmu_implemented_counter_mask(vcpu);
@@ -1584,7 +1593,7 @@ static int set_pmcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
 /* Macro to expand the PMEVTYPERn_EL0 register */
 #define PMU_PMEVTYPER_EL0(n)						\
 	{ PMU_SYS_REG(PMEVTYPERn_EL0(n)),				\
-	  .reset = reset_pmevtyper,					\
+	  .reset = reset_pmevtyper, .set_user = set_pmu_evtyper,	\
 	  .access = access_pmu_evtyper, .reg = (PMEVTYPER0_EL0 + n), }
 
 /* Macro to expand the AMU counter and type registers*/
@@ -3833,7 +3842,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	 * in 32bit mode. Here we choose to reset it as zero for consistency.
 	 */
 	{ PMU_SYS_REG(PMCCFILTR_EL0), .access = access_pmu_evtyper,
-	  .reset = reset_val, .reg = PMCCFILTR_EL0, .val = 0 },
+	  .reset = reset_val, .reg = PMCCFILTR_EL0, .val = 0,
+	  .set_user = set_pmu_evtyper },
 
 	EL2_REG_VNCR(VPIDR_EL2, reset_unknown, 0),
 	EL2_REG_VNCR(VMPIDR_EL2, reset_unknown, 0),

-- 
2.55.0


