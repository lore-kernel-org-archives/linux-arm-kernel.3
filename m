Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F441D1F9A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 09:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MkIdtdDPTs+HsHm23FxtvSLGLzuoUf7m3e8S82AOBsk=; b=B7pSqHyx7q9RQO7l7HRlYUgmac
	UhwlXNPVWf+S8y5urR+b3Rrw2bCeTkTCWyB8Qk7bH/5mM3W4N3gHvJqJz03eoUHQh0BO73ae4XD+l
	Z1cZPgHeMKVNcBQKTEAKlz/lRGjWxQEbYpjEzzPoArtUfdNYWsZ1bgkEtdEoR5Y8xdcKnxVZnq3e4
	BiXc+OPrb0BBUApuBttwBlwB82qRKL53sR58AHAYAEv8My5E0KNSCFUIbET2OpL3cwlcxZG1f0kNw
	kzM5wQ22SujYm2K9h+jPn8p8l2gnMNbGh3cUMuU3QWAdQ3MTU1I5znHYL0OuEUGY25z7zhqjN7Fd7
	7SrHRGJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR5x7-00000007mxb-1KFX;
	Thu, 04 Dec 2025 09:48:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR5x1-00000007mqn-1NSM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 09:48:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CD69E44464;
	Thu,  4 Dec 2025 09:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEC8AC4CEFB;
	Thu,  4 Dec 2025 09:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764841717;
	bh=AnEvmpTr3N6uKP3Ug85RiyieiVqnPxJy70xw+6xKC30=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EpHdCmRaO82yJfpohRIB3I+ZAGxhJfwktHJCuHDL0bIcNI2ZeeRS7XQqpQzHdP3Kd
	 shP0hP8+9TTrGVfLWKic/L2Xn+gikkz1gPsWd78chwoFrWkVzOScIcfpF9MMVGPtBg
	 UtFHoORw2q6xdyABQ1CxP755byIARAOCzo3dT1Plbah/tpb6xUYw3HzG+BXH8djHTP
	 9oKrfiLZ0NBo8XIQZPZevPonX+XBf6U2GI1iqe+V+1RAnu7A7qpDzi0uaB+nmCiVlP
	 +ApMAPjSxoold1i+5ksscwlKU/EY8QUk4YfkL9WfjS7Y6yLeIGcFr9ymDjoedL4F/E
	 3nN3AguUApbFQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vR5wx-0000000AP90-3zzH;
	Thu, 04 Dec 2025 09:48:36 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>
Subject: [PATCH v3 8/9] KVM: arm64: pkvm: Report optional ID register traps with a 0x18 syndrome
Date: Thu,  4 Dec 2025 09:48:05 +0000
Message-ID: <20251204094806.3846619-9-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251204094806.3846619-1-maz@kernel.org>
References: <20251204094806.3846619-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, ben.horgan@arm.com, yaoyuan@linux.alibaba.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_014839_417325_14C26D6C 
X-CRM114-Status: GOOD (  12.67  )
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

With FEAT_IDST, unimplemented system registers in the feature ID space
must be reported using EC=0x18 at the closest handling EL, rather than
with an UNDEF.

Most of these system registers are always implemented thanks to their
dependency on FEAT_AA64, except for a set of (currently) three registers:
GMID_EL1 (depending on MTE2), CCSIDR2_EL1 (depending on FEAT_CCIDX),
and SMIDR_EL1 (depending on SME).

For these three registers, report their trap as EC=0x18 if they
end-up trapping into KVM and that FEAT_IDST is implemented in the guest.
Otherwise, just make them UNDEF.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 876b36d3d4788..efc36645f4b5a 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -347,6 +347,18 @@ static bool pvm_gic_read_sre(struct kvm_vcpu *vcpu,
 	return true;
 }
 
+static bool pvm_idst_access(struct kvm_vcpu *vcpu,
+			    struct sys_reg_params *p,
+			    const struct sys_reg_desc *r)
+{
+	if (kvm_has_feat_enum(vcpu->kvm, ID_AA64MMFR2_EL1, IDS, NI))
+		inject_undef64(vcpu);
+	else
+		inject_sync64(vcpu, kvm_vcpu_get_esr(vcpu));
+
+	return false;
+}
+
 /* Mark the specified system register as an AArch32 feature id register. */
 #define AARCH32(REG) { SYS_DESC(REG), .access = pvm_access_id_aarch32 }
 
@@ -472,6 +484,9 @@ static const struct sys_reg_desc pvm_sys_reg_descs[] = {
 
 	HOST_HANDLED(SYS_CCSIDR_EL1),
 	HOST_HANDLED(SYS_CLIDR_EL1),
+	{ SYS_DESC(SYS_CCSIDR2_EL1), .access = pvm_idst_access },
+	{ SYS_DESC(SYS_GMID_EL1), .access = pvm_idst_access },
+	{ SYS_DESC(SYS_SMIDR_EL1), .access = pvm_idst_access },
 	HOST_HANDLED(SYS_AIDR_EL1),
 	HOST_HANDLED(SYS_CSSELR_EL1),
 	HOST_HANDLED(SYS_CTR_EL0),
-- 
2.47.3


