Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30FFCD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 13:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wR+dg2z5xPevn3j00gbFOQf15e3Yd+rVguSZXSpNo8A=; b=hbGhK85sUb08K3IzW2M2qmuqBQ
	sHgzJJtJwFlTOrhSIsKcbucFIpZobNd2BjjuIgTpAv4CD7TR5Sithdc9vBDPTB8eX3IRiyY07fe/u
	UZc7BGH0xtd1J+GBW4zXPOW0cqc1Bjx22VGVowVwIGoW8/z6QJpCjOsiiLvb9lAx2/9QMWPr0eS24
	1GwfUqU4qD79ymJrG/AWwJjX7YZ+W0cpyhjVbJzawZqOya2MR0spNHdZa+Ur4eSX/iXtgDYDLBt3C
	U0KolQAk9cdDssQa0hB5EmLeZ8k8Sbp6M9+9HklTMC6sr+4MJGt++uViF971F7kRsSb6UOw05tXBL
	kYzooTVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9WU-00000002hMH-3OIg;
	Wed, 13 May 2026 13:21:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9WT-00000002hJa-0ugk
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 May 2026 13:21:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=wR+dg2z5xPevn3j00gbFOQf15e3Yd+rVguSZXSpNo8A=; b=C/pohMvzI2goIguKcTSPlHdE0n
	TPvmvR/h1b3tCbKO27TsKPaUy6CJRSWcxDr3SxaeupNLWA9iPkDYY+qtABA5ZrgmUCtWBfpqIKjFS
	zNPX21Wf8EYbDEg92gH4lHvaH4ZRxxvKhkOdbfrsoFZwcclExAbqNhmikh7Y+AdbBgeYp6mx8ogFF
	6D74NcAbx+4UB7VlbBE5gtPby8PbS2bPXQNHbQOM7qqhvhVykP4USF8TuoDpzG0rL9L9T/oj4GDPY
	3inmuZKbACtDl80xY/bwVlHuiblys2DFALfPSzCgCnI7cuiNghPjIk8eIRkPWT55Lk6eX8YcMBAac
	E/ABKNSA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9WP-0000000HZUh-1hST
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 13:21:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14F15237B;
	Wed, 13 May 2026 06:21:03 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.68.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3AB123F836;
	Wed, 13 May 2026 06:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778678468; bh=AGAamD6VoIFRCmb/el0xi5xZ2tVCik2TcY2FHSabeFI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fcp6LyGDXY8rAfpfPMcg1VKr56+0eS8yNeRxsNK8A9tAVrJBqAMTqSWpW+BE8WTnS
	 chejmPzUEckQrdQSR82X7Ct7Ska5fC8/ipEfxgK/l+4l6FO0mf39OXpOVJ3f5rbaZG
	 0yGeJT7uPc/H85Wy4SMtX40s7kkOgdgCdF90Su7g=
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>,
	WeiLin.Chang@arm.com,
	Lorenzo.Pieralisi2@arm.com
Subject: [PATCH v14 31/44] KVM: arm64: Validate register access for a Realm VM
Date: Wed, 13 May 2026 14:17:39 +0100
Message-ID: <20260513131757.116630-32-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513131757.116630-1-steven.price@arm.com>
References: <20260513131757.116630-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_142110_026989_3F00830E 
X-CRM114-Status: GOOD (  15.72  )
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

The RMM only allows setting the GPRS (x0-x30) and PC for a realm
guest. Check this in kvm_arm_set_reg() so that the VMM can receive a
suitable error return if other registers are written to.

The RMM makes similar restrictions for reading of the guest's registers
(this is *confidential* compute after all), however we don't impose the
restriction here. This allows the VMM to read (stale) values from the
registers which might be useful to read back the initial values even if
the RMM doesn't provide the latest version. For migration of a realm VM,
a new interface will be needed so that the VMM can receive an
(encrypted) blob of the VM's state.

Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Reviewed-by: Joey Gouly <joey.gouly@arm.com>
Signed-off-by: Steven Price <steven.price@arm.com>
---
Changes since v5:
 * Upper GPRS can be set as part of a HOST_CALL return, so fix up the
   test to allow them.
---
 arch/arm64/kvm/guest.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index 332c453b87cf..e6682019ef6d 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -73,6 +73,25 @@ static u64 core_reg_offset_from_id(u64 id)
 	return id & ~(KVM_REG_ARCH_MASK | KVM_REG_SIZE_MASK | KVM_REG_ARM_CORE);
 }
 
+static bool kvm_realm_validate_core_reg(u64 off)
+{
+	/*
+	 * Note that GPRs can only sometimes be controlled by the VMM.
+	 * For PSCI only X0-X6 are used, higher registers are ignored (restored
+	 * from the REC).
+	 * For HOST_CALL all of X0-X30 are copied to the RsiHostCall structure.
+	 * For emulated MMIO X0 is always used.
+	 * PC can only be set before the realm is activated.
+	 */
+	switch (off) {
+	case KVM_REG_ARM_CORE_REG(regs.regs[0]) ...
+	     KVM_REG_ARM_CORE_REG(regs.regs[30]):
+	case KVM_REG_ARM_CORE_REG(regs.pc):
+		return true;
+	}
+	return false;
+}
+
 static int core_reg_size_from_offset(const struct kvm_vcpu *vcpu, u64 off)
 {
 	int size;
@@ -716,12 +735,34 @@ int kvm_arm_get_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 	return kvm_arm_sys_reg_get_reg(vcpu, reg);
 }
 
+/*
+ * The RMI ABI only enables setting some GPRs and PC. The selection of GPRs
+ * that are available depends on the Realm state and the reason for the last
+ * exit.  All other registers are reset to architectural or otherwise defined
+ * reset values by the RMM, except for a few configuration fields that
+ * correspond to Realm parameters.
+ */
+static bool validate_realm_set_reg(struct kvm_vcpu *vcpu,
+				   const struct kvm_one_reg *reg)
+{
+	if ((reg->id & KVM_REG_ARM_COPROC_MASK) == KVM_REG_ARM_CORE) {
+		u64 off = core_reg_offset_from_id(reg->id);
+
+		return kvm_realm_validate_core_reg(off);
+	}
+
+	return false;
+}
+
 int kvm_arm_set_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 {
 	/* We currently use nothing arch-specific in upper 32 bits */
 	if ((reg->id & ~KVM_REG_SIZE_MASK) >> 32 != KVM_REG_ARM64 >> 32)
 		return -EINVAL;
 
+	if (kvm_is_realm(vcpu->kvm) && !validate_realm_set_reg(vcpu, reg))
+		return -EINVAL;
+
 	switch (reg->id & KVM_REG_ARM_COPROC_MASK) {
 	case KVM_REG_ARM_CORE:	return set_core_reg(vcpu, reg);
 	case KVM_REG_ARM_FW:
-- 
2.43.0


