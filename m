Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608D1D1D478
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 17:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gfVPE3WuOJH1FlL4NzmNhme1ZuISleYPeQf77AQQbuA=; b=BjN+AvkkM6Pn+gRMfbZRzzjLgT
	2aHslEZw8QRkGDFpO4jpG75CP8nw8sCVXOmGF3Cod3jRoDyNkrJzTimtGNUU75UcMxf0pRtsKe3Ro
	mpVkctUpVADdjuDTGu3uk65cOGc5Ykhq7NLcGtIPVrKNR+FtiGMbMs+ajCHJcsnba9wIXVsWzmmYU
	ri7o0fi5yhUAvLXntndTAaWUtJEM0lcZXkwXkzueZmOGhaUQaQ2y+BlT/1awP+Ky6x0YfmMp+yMXD
	82wGPqhVOql7UAOKoos/0gpAo0UUGRcx0wxRmHCIebSewumIys4WwVoG1+37Lbi+AnT+vBstKdhxk
	13KhGDQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtsO-00000000PXz-2s2T;
	Thu, 08 Jan 2026 17:32:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtsH-00000000PQo-1sly
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 17:32:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3CDFA44454;
	Thu,  8 Jan 2026 17:32:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14A4DC16AAE;
	Thu,  8 Jan 2026 17:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767893560;
	bh=Znr7Dku9zVifoLC2dRkdX2LnqvsmlDNxYYJnQTiGVbs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mUoS13e1hLDfT4trH8rc84ThYzVTyq/TYhZm3BuQFFsQImi1R7eNpIpa9MBrsg/+G
	 CTjWLcDqWVgDnVwCdZbpv0DL/G1GyJh/K9+Uej7vbN7lU/J37Qb+Vhq+IPormQ+bcu
	 JbJiB25vPh4hoRL5Pdsbg1NBD8pGpHjMJOFvv8l40fxpYKl/WfUNUZfaf/tzrGxQt2
	 /N8ulW8wXR0nPTzojpEdxbWqHfH9TsUCkJjlUgHlAhE2O75OnjUQfLSQqs5eITVgxH
	 sSSzaxXBHY2EB8CSalZtaPm/kBgTGOrpmUjnZChjQkRR6Di5FUi5VjWMM/6H/HiiWI
	 2rFh1doEL6ivw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vdtsE-00000000W9F-0iLY;
	Thu, 08 Jan 2026 17:32:38 +0000
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
Subject: [PATCH v4 8/9] KVM: arm64: pkvm: Report optional ID register traps with a 0x18 syndrome
Date: Thu,  8 Jan 2026 17:32:32 +0000
Message-ID: <20260108173233.2911955-9-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108173233.2911955-1-maz@kernel.org>
References: <20260108173233.2911955-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, ben.horgan@arm.com, yaoyuan@linux.alibaba.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_093242_057161_1C5C3A0D 
X-CRM114-Status: GOOD (  12.58  )
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
index b197f3eb272c1..06d28621722ee 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -347,6 +347,18 @@ static bool pvm_gic_read_sre(struct kvm_vcpu *vcpu,
 	return true;
 }
 
+static bool pvm_idst_access(struct kvm_vcpu *vcpu,
+			    struct sys_reg_params *p,
+			    const struct sys_reg_desc *r)
+{
+	if (kvm_has_feat(vcpu->kvm, ID_AA64MMFR2_EL1, IDS, IMP))
+		inject_sync64(vcpu, kvm_vcpu_get_esr(vcpu));
+	else
+		inject_undef64(vcpu);
+
+	return false;
+}
+
 /* Mark the specified system register as an AArch32 feature id register. */
 #define AARCH32(REG) { SYS_DESC(REG), .access = pvm_access_id_aarch32 }
 
@@ -477,6 +489,9 @@ static const struct sys_reg_desc pvm_sys_reg_descs[] = {
 
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


