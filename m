Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01977D10F58
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 16:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ni05CwIOiBtKGEsCmDpTC2t6vdZsZgyw/pxO+a6J8sA=; b=zwtETw2RQIkRSOahguDIOVVd1o
	bKYvkmm7igtU3SYApI6kj+wEmoGQtKu2ni0U+taq2DxgPGJn43JEWI8YPU8uxO30VRsxXrnW4H8DP
	Kf5P3Oell9AWKie26xOVDExRVbcrSgcmWQ45r+7N8H0/NybLGDtojYHhf+R5FWgk176oF7xm6CoFH
	BqLbd1Q6Is8cTnexeUTMtqzAlnzpIw8+ZR0bxCtvN4ufIogk4JHfNiVLtuhRHSDMQAFseM9wn04XN
	CWsvRgb3iBgimye99QSegYvjGrxfwi7TwW870edpQFZhaUZvKSs/PQFlrE12bntTzikdL1AesvrnW
	kQgyXD0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHw8-0000000FDn6-3XWT;
	Wed, 26 Nov 2025 16:00:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHw2-0000000FDhj-3IU3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 16:00:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A832944053;
	Wed, 26 Nov 2025 16:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60AEEC4CEF8;
	Wed, 26 Nov 2025 16:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764172801;
	bh=lG82/RXgkPqZWZ9aTc82QWQFUkM4bvI4ZqnGwoup1FM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tsHZeA3DuZqbjciM77jiElM91agDFeS851U5NSeB1UqRqSVMsvpzz3hLdtwAEVMAX
	 JTQTNmdNELRr6ZAWia7dtpfCy9fRbgtOqKcS/ID+/AuxzwyRm9GFr/sVjbDV6zU9Hj
	 XO4LQS/HhcYIO0O8CB+HupwfvSwgL6Uwm5A5oY9cUmXC9LLOd1j62m7zXQ2nPOu6/A
	 oqmgGz/rn780uUSXLMBmHgoE2llN6wwXFHxu/1b9DKyDa1BGCwS66A8MpvrH1tN8uH
	 dPqIZNcS5WBs2Y/o1jbCz4iJAaHliZNd+w4tYk8qUtrJXdGZv7KiXsHTVMbIoWZmmb
	 IdiAAGD/32Nog==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vOHvz-00000008WrH-0wRD;
	Wed, 26 Nov 2025 15:59:59 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH v2 4/5] KVM: arm64: Report optional ID register traps with a 0x18 syndrome
Date: Wed, 26 Nov 2025 15:59:50 +0000
Message-ID: <20251126155951.1146317-5-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251126155951.1146317-1-maz@kernel.org>
References: <20251126155951.1146317-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, ben.horgan@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_080002_860438_6236966F 
X-CRM114-Status: GOOD (  14.04  )
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
end-up trapping into KVM and that FEAT_IDST is not implemented in the
guest. Otherwise, just make them UNDEF.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 2ca6862e935b5..7705f703e7c6d 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -82,6 +82,16 @@ static bool write_to_read_only(struct kvm_vcpu *vcpu,
 			"sys_reg write to read-only register");
 }
 
+static bool idst_access(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
+			const struct sys_reg_desc *r)
+{
+	if (kvm_has_feat_enum(vcpu->kvm, ID_AA64MMFR2_EL1, IDS, 0x0))
+		return undef_access(vcpu, p, r);
+
+	kvm_inject_sync(vcpu, kvm_vcpu_get_esr(vcpu));
+	return false;
+}
+
 enum sr_loc_attr {
 	SR_LOC_MEMORY	= 0,	  /* Register definitely in memory */
 	SR_LOC_LOADED	= BIT(0), /* Register on CPU, unless it cannot */
@@ -3399,9 +3409,9 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_CCSIDR_EL1), access_ccsidr },
 	{ SYS_DESC(SYS_CLIDR_EL1), access_clidr, reset_clidr, CLIDR_EL1,
 	  .set_user = set_clidr, .val = ~CLIDR_EL1_RES0 },
-	{ SYS_DESC(SYS_CCSIDR2_EL1), undef_access },
-	{ SYS_DESC(SYS_GMID_EL1), undef_access },
-	{ SYS_DESC(SYS_SMIDR_EL1), undef_access },
+	{ SYS_DESC(SYS_CCSIDR2_EL1), idst_access },
+	{ SYS_DESC(SYS_GMID_EL1), idst_access },
+	{ SYS_DESC(SYS_SMIDR_EL1), idst_access },
 	IMPLEMENTATION_ID(AIDR_EL1, GENMASK_ULL(63, 0)),
 	{ SYS_DESC(SYS_CSSELR_EL1), access_csselr, reset_unknown, CSSELR_EL1 },
 	ID_FILTERED(CTR_EL0, ctr_el0,
-- 
2.47.3


