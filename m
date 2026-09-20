Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA22C982EA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 11:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i/QeXKEqHAmjxrcuUmzijfCUmr4/OEoPNf94l/24Kws=; b=F9V6wbyTwkbzyZSx+DhXLyqB7J
	Ev1AZxmYP/U6S1+k60l8V3c1zMA6gOZcGK9e48Q5uwof+4T4dYontSG2tT8LS+SCjUCvpd6CfH3ae
	v+cf434+v5XAyLYED9c+vVXMcruIiWOIJKbGTe4JSktcQ8FZQk3XwNJGKj3CKHmoO7CcXNle8dzMN
	hgqje8Too2piyrjDRR9r3SRa2LTuNSHs0NRMil7Z8pERC5iiCDkWVPiKg3ijq8fCpMc5QiZdz1myV
	VCv9BigVY9Dxba5Y2pMmG3cvRxmGhFIGBD/oWno1zldd3/FxHbTdMAIz85PpCZXo6JvwD80sJCgkK
	mIZZkA0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FY3-0000000HKDB-1F9I;
	Sun, 20 Sep 2026 11:17:31 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FXp-0000000HK4V-2cao
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 11:17:20 +0000
Received: from [192.168.10.153] (p865013-ipoe.ipoe.ocn.ne.jp [153.242.222.12])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 68KBG36Y088236
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 20 Sep 2026 20:16:13 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=i/QeXKEqHAmjxrcuUmzijfCUmr4/OEoPNf94l/24Kws=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1789902973; v=1;
        b=v40m8Vk5FFKUowHiXoH90N9t7gq2Nju2moBwKNMF0xQsiDBtxawY59XgHU3IjmAC
         9yU6DWwRRbxLSSBf52Ocnuv2X8SOBWccIBeSTWzM+KypIbrnNNtT+1JjXho2qKXW
         0AbHPvOyekSoR3DnLFMFQm+tK1U/fcq0JPUU554Tzs7RLswC6kWVxkm4Koqe5OH1
         +VLPR9p0mmAVCESSEIj3u9yyjGlgi3khNMU8MecQBOla2Z1Zt7Zm1ImbZH2RtiQr
         bsVdxpK3ORAvOrNt8qWgUGCxflGmrepbzqd/gwwf77cWaxeo7wOReGCsNu6s1uSA
         I0QOxHc3SjGg0fwsbxLhIw==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Sun, 20 Sep 2026 20:15:52 +0900
Subject: [PATCH v11 11/21] KVM: arm64: PMU: Recreate events after userspace
 event writes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-hybrid-v11-11-03618771b0e1@rsg.ci.i.u-tokyo.ac.jp>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2412;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=6LLUznzO4H71nxemjRzGDOIgWidAJRt3Eg0+EfeUiB0=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ9b6A9lq2m9e1C2vl1fuF/VoCf+qfjIzIZqpwuI5z0oJu
 YmCoc86SlkYxLgYZMUUWVKKdnNrRNd+KkyIb4GZw8oEMoSBi1MAJuI3gZFhD++U1cs+xfPHn/F8
 eMjx/Fnm4uesVZMcL+/dMVs/NGiGPcM/o4pbi1OXOcQbiUrclZsol1/guEX91V3eEqMYP9WGfmk
 mAA==
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_041717_891547_3BF76BA1 
X-CRM114-Status: GOOD (  13.89  )
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
index 6786311e9b7d..5a44bd5530ff 100644
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


