Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121D7CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 15:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OM+aek63KshBI7hyeeN0uRjl+1PTjRhNpn2CMK6lGR0=; b=eMnyydC314MQKlKrRN1CAKRkAx
	fZa5sHHjQoI0zHQB9Wb2Sbu6w1nGcd/4M/ZHPHPfeWjWyGKRCHYlqwja0PyW3BfCtjAH920peC9fh
	hr66CxAKwR1FkASxdPppwIBVkVreYJPw5f+rUVUKLuNybo4v20Udpz5VgrLUNK2b8N8tIxn3XvoUS
	G1qFS6xx9S1RDeCENtFeNiHc3XMfr4IPCnRraQNE/XALHCPz889BoSlWQ9JgHI49LmWngTtCKIYF7
	SnsoVg5oSK0yUnopVHVnYEpHZ6LMq3CJ1St+IF7DGrwQEf58Yz1BJy5tIVdUV5aC57tTS2at9eJ07
	w5KUJDUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHkKF-00000003Lyn-2o15;
	Fri, 16 Oct 2026 15:58:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHkKD-00000003LxO-06TO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 15:58:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3E96143D;
	Fri, 16 Oct 2026 08:58:24 -0700 (PDT)
Received: from e133894.cambridge.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 31D933F673;
	Fri, 16 Oct 2026 08:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792166308; bh=zlp77XtcOpCoZwKyRQ9G7ktiBIGzseumsEE1qryiWyw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WeN7FDmgfZ8dt5LaUAdcp0uPejbqXo+CQQcMJ2UZ84tQc/pnvNTcRtVaw9qMhlZSk
	 0tN+XSlSpzseY+UdGzJ7m9cwamL2nv6OqmrzWGc9EXshGtlrfYPXEeuat3szV5e8H2
	 NkJxcqdE54QOTPqEhRndu9Yz/Abg69BfhM9pkRFI=
From: Sascha Bischoff <sascha.bischoff@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org
Cc: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	peter.maydell@linaro.org,
	lpieralisi@kernel.org,
	timothy.hayes@arm.com,
	fuad.tabba@linux.dev
Subject: [PATCH 03/16] KVM: arm64: gic-v5: Share CoreSight ID register emulation
Date: Fri, 16 Oct 2026 16:57:28 +0100
Message-Id: <20261016155741.979985-4-sascha.bischoff@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016155741.979985-1-sascha.bischoff@arm.com>
References: <20261016155741.979985-1-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_085829_158533_D822420E 
X-CRM114-Status: GOOD (  14.16  )
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

The GICv5 IRS and ITS expose the same CoreSight identification register
block. Move the register-value switch into a shared helper and describe
the contiguous ID register range with one register-region descriptor.

This keeps the IRS behaviour unchanged while giving the ITS MMIO
emulation a helper it can reuse when it is added in the following commit.

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 arch/arm64/kvm/vgic/vgic-irs-v5.c  | 72 ++----------------------------
 arch/arm64/kvm/vgic/vgic-v5.c      | 34 ++++++++++++++
 arch/arm64/kvm/vgic/vgic.h         |  1 +
 include/linux/irqchip/arm-gic-v5.h |  2 +
 4 files changed, 41 insertions(+), 68 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-irs-v5.c b/arch/arm64/kvm/vgic/vgic-irs-v5.c
index 1874c3c289a6e..63571dc58546c 100644
--- a/arch/arm64/kvm/vgic/vgic-irs-v5.c
+++ b/arch/arm64/kvm/vgic/vgic-irs-v5.c
@@ -520,38 +520,9 @@ static void vgic_v5_mmio_write_irs_ist(struct kvm_vcpu *vcpu, gpa_t addr,
 static unsigned long vgic_v5_coresight_read(struct kvm_vcpu *vcpu,
 					    gpa_t addr, unsigned int len)
 {
-	const size_t offset = addr & (SZ_64K - 1);
+	u32 offset = addr & (SZ_64K - 1);
 
-	switch (offset) {
-	case GICV5_CORESIGHT_DEVARCH:
-		return GICV5_CORESIGHT_DEVARCH_VAL;
-	case GICV5_CORESIGHT_PIDR4:
-		return GICV5_CORESIGHT_PIDR4_JEP106_CONT;
-	case GICV5_CORESIGHT_PIDR5:
-		return GICV5_CORESIGHT_PIDR5_RES0;
-	case GICV5_CORESIGHT_PIDR6:
-		return GICV5_CORESIGHT_PIDR6_RES0;
-	case GICV5_CORESIGHT_PIDR7:
-		return GICV5_CORESIGHT_PIDR7_RES0;
-	case GICV5_CORESIGHT_PIDR0:
-		return GICV5_CORESIGHT_PIDR0_PART_0;
-	case GICV5_CORESIGHT_PIDR1:
-		return GICV5_CORESIGHT_PIDR1_DES_0_PART_1;
-	case GICV5_CORESIGHT_PIDR2:
-		return GICV5_CORESIGHT_PIDR2_DES_1;
-	case GICV5_CORESIGHT_PIDR3:
-		return GICV5_CORESIGHT_PIDR3_REVAND_CMOD;
-	case GICV5_CORESIGHT_CIDR0:
-		return GICV5_CORESIGHT_CIDR0_VAL;
-	case GICV5_CORESIGHT_CIDR1:
-		return GICV5_CORESIGHT_CIDR1_VAL;
-	case GICV5_CORESIGHT_CIDR2:
-		return GICV5_CORESIGHT_CIDR2_VAL;
-	case GICV5_CORESIGHT_CIDR3:
-		return GICV5_CORESIGHT_CIDR3_VAL;
-	default:
-		return 0;
-	}
+	return vgic_v5_handle_guest_coresight_idreg_read(offset);
 }
 
 static unsigned long vgic_v5_mmio_uaccess_read_irs_status(struct kvm_vcpu *vcpu,
@@ -905,43 +876,8 @@ static const struct vgic_register_region vgic_v5_irs_registers[] = {
 
 	/* CoreSight identification registers */
 	REGISTER_DESC_WITH_LENGTH(GICV5_CORESIGHT_DEVARCH,
-				  vgic_v5_coresight_read, vgic_mmio_write_wi, 4,
-				  VGIC_ACCESS_32bit),
-	REGISTER_DESC_WITH_LENGTH(GICV5_CORESIGHT_PIDR4,
-				  vgic_v5_coresight_read, vgic_mmio_write_wi, 4,
-				  VGIC_ACCESS_32bit),
-	REGISTER_DESC_WITH_LENGTH(GICV5_CORESIGHT_PIDR5,
-				  vgic_v5_coresight_read, vgic_mmio_write_wi, 4,
-				  VGIC_ACCESS_32bit),
-	REGISTER_DESC_WITH_LENGTH(GICV5_CORESIGHT_PIDR6,
-				  vgic_v5_coresight_read, vgic_mmio_write_wi, 4,
-				  VGIC_ACCESS_32bit),
-	REGISTER_DESC_WITH_LENGTH(GICV5_CORESIGHT_PIDR7,
-				  vgic_v5_coresight_read, vgic_mmio_write_wi, 4,
-				  VGIC_ACCESS_32bit),
-	REGISTER_DESC_WITH_LENGTH(GICV5_CORESIGHT_PIDR0,
-				  vgic_v5_coresight_read, vgic_mmio_write_wi, 4,
-				  VGIC_ACCESS_32bit),
-	REGISTER_DESC_WITH_LENGTH(GICV5_CORESIGHT_PIDR1,
-				  vgic_v5_coresight_read, vgic_mmio_write_wi, 4,
-				  VGIC_ACCESS_32bit),
-	REGISTER_DESC_WITH_LENGTH(GICV5_CORESIGHT_PIDR2,
-				  vgic_v5_coresight_read, vgic_mmio_write_wi, 4,
-				  VGIC_ACCESS_32bit),
-	REGISTER_DESC_WITH_LENGTH(GICV5_CORESIGHT_PIDR3,
-				  vgic_v5_coresight_read, vgic_mmio_write_wi, 4,
-				  VGIC_ACCESS_32bit),
-	REGISTER_DESC_WITH_LENGTH(GICV5_CORESIGHT_CIDR0,
-				  vgic_v5_coresight_read, vgic_mmio_write_wi, 4,
-				  VGIC_ACCESS_32bit),
-	REGISTER_DESC_WITH_LENGTH(GICV5_CORESIGHT_CIDR1,
-				  vgic_v5_coresight_read, vgic_mmio_write_wi, 4,
-				  VGIC_ACCESS_32bit),
-	REGISTER_DESC_WITH_LENGTH(GICV5_CORESIGHT_CIDR2,
-				  vgic_v5_coresight_read, vgic_mmio_write_wi, 4,
-				  VGIC_ACCESS_32bit),
-	REGISTER_DESC_WITH_LENGTH(GICV5_CORESIGHT_CIDR3,
-				  vgic_v5_coresight_read, vgic_mmio_write_wi, 4,
+				  vgic_v5_coresight_read, vgic_mmio_write_wi,
+				  GICV5_CORESIGHT_IDREGS_SIZE,
 				  VGIC_ACCESS_32bit),
 };
 
diff --git a/arch/arm64/kvm/vgic/vgic-v5.c b/arch/arm64/kvm/vgic/vgic-v5.c
index 91810fbd99afa..18184020e188b 100644
--- a/arch/arm64/kvm/vgic/vgic-v5.c
+++ b/arch/arm64/kvm/vgic/vgic-v5.c
@@ -1601,3 +1601,37 @@ int vgic_v5_irs_restore_ists(struct kvm *kvm, struct kvm_device_attr *attr)
 
 	return ret;
 }
+
+unsigned long vgic_v5_handle_guest_coresight_idreg_read(u32 offset)
+{
+	switch (offset) {
+	case GICV5_CORESIGHT_DEVARCH:
+		return GICV5_CORESIGHT_DEVARCH_VAL;
+	case GICV5_CORESIGHT_PIDR4:
+		return GICV5_CORESIGHT_PIDR4_JEP106_CONT;
+	case GICV5_CORESIGHT_PIDR5:
+		return GICV5_CORESIGHT_PIDR5_RES0;
+	case GICV5_CORESIGHT_PIDR6:
+		return GICV5_CORESIGHT_PIDR6_RES0;
+	case GICV5_CORESIGHT_PIDR7:
+		return GICV5_CORESIGHT_PIDR7_RES0;
+	case GICV5_CORESIGHT_PIDR0:
+		return GICV5_CORESIGHT_PIDR0_PART_0;
+	case GICV5_CORESIGHT_PIDR1:
+		return GICV5_CORESIGHT_PIDR1_DES_0_PART_1;
+	case GICV5_CORESIGHT_PIDR2:
+		return GICV5_CORESIGHT_PIDR2_DES_1;
+	case GICV5_CORESIGHT_PIDR3:
+		return GICV5_CORESIGHT_PIDR3_REVAND_CMOD;
+	case GICV5_CORESIGHT_CIDR0:
+		return GICV5_CORESIGHT_CIDR0_VAL;
+	case GICV5_CORESIGHT_CIDR1:
+		return GICV5_CORESIGHT_CIDR1_VAL;
+	case GICV5_CORESIGHT_CIDR2:
+		return GICV5_CORESIGHT_CIDR2_VAL;
+	case GICV5_CORESIGHT_CIDR3:
+		return GICV5_CORESIGHT_CIDR3_VAL;
+	default:
+		return 0;
+	}
+}
diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
index c33cdd7098df5..66044232ae025 100644
--- a/arch/arm64/kvm/vgic/vgic.h
+++ b/arch/arm64/kvm/vgic/vgic.h
@@ -388,6 +388,7 @@ int vgic_v5_probe(const struct gic_kvm_info *info);
 void vgic_v5_reset(struct kvm_vcpu *vcpu);
 int vgic_v5_init(struct kvm *kvm);
 int kvm_vgic_v5_irs_init(struct kvm *kvm, unsigned int nr_spis);
+unsigned long vgic_v5_handle_guest_coresight_idreg_read(u32 offset);
 void vgic_v5_teardown(struct kvm *kvm);
 int vgic_v5_map_resources(struct kvm *kvm);
 void vgic_v5_set_ppi_ops(struct kvm_vcpu *vcpu, u32 vintid);
diff --git a/include/linux/irqchip/arm-gic-v5.h b/include/linux/irqchip/arm-gic-v5.h
index 299e75bc95255..a4879774124f8 100644
--- a/include/linux/irqchip/arm-gic-v5.h
+++ b/include/linux/irqchip/arm-gic-v5.h
@@ -498,6 +498,8 @@
 #define GICV5_CORESIGHT_CIDR1		0xfff4
 #define GICV5_CORESIGHT_CIDR2		0xfff8
 #define GICV5_CORESIGHT_CIDR3		0xfffc
+#define GICV5_CORESIGHT_IDREGS_SIZE	\
+	(GICV5_CORESIGHT_CIDR3 + 4 - GICV5_CORESIGHT_DEVARCH)
 
 #define GICV5_CORESIGHT_DEVARCH_VAL			\
 	(FIELD_PREP(GENMASK(31, 21), 0x23b) |		\
-- 
2.34.1


