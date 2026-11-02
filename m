Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9ABF606EEB8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jywsf+mt;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Yq44rYbu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SxDeP+VVrehaEoxAacbpEcDKEnQestaQVUxckwi1z4Q=; b=jywsf+mtyHUxKD
	71soNvsgrsRQNcITWVBLo1e1/kw0SJw67qaOv+EfAGiHJC9d+UmxHgwfZ+8gxI1RjnOyXCwpcVhVh
	q60Yd6WBnyhneqBBNszcf/qc5jI6hWNwUOKCjcdUT3Dq2rGFKsR1uE3nlrt9VpDCLJhjHeyVCyScy
	ZwD3Moo0a+RtDTGkhzxu7t9WuasszBl9KaQpHH/7vljzdxEOLU9qKw02aRGFEVLfx6/OpX1GSdx5V
	sISvlAmzGyFMJpg2roxr4RGGK7dJWCV38a6NBkzA4aKEo8JwgF2Sdy/F8Dc/8BwSJJAMbFZkVRoS9
	QRLWeAoX2iOc4rE7+F8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxyH-000000008o1-43OR;
	Mon, 02 Nov 2026 19:45:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxxx-000000008Qg-0kqe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 19:45:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D4CC16A3;
	Mon,  2 Nov 2026 11:45:09 -0800 (PST)
Received: from e133894.cambridge.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D98B63F673;
	Mon,  2 Nov 2026 11:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793648712; bh=amDiy+/ROWpP26/w1KGH5V47ch5HrMmB725iyWflZog=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yq44rYbu5yvylisult486QxQUL3jSeYkEcobdMl251Kz5R75syCv5ICA26XR9Dd0i
	 7BMBMo1ZiSBQJNTRKH/bLIOzbDQqQzIPywdNUneIPtGis2al1NtHvgNzYqcbV8DAFy
	 9pT5++s+Os+RyAFJrjy1V4llCOme+aHHj/7z5mAM=
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
Subject: [PATCH v2 02/16] KVM: arm64: vgic: Pass opaque device pointer to ITS MMIO callbacks
Date: Mon,  2 Nov 2026 19:44:40 +0000
Message-Id: <20261102194454.4086911-3-sascha.bischoff@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261102194454.4086911-1-sascha.bischoff@arm.com>
References: <20261102194454.4086911-1-sascha.bischoff@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_114513_316628_2F5F0CC8 
X-CRM114-Status: GOOD (  15.20  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The ITS MMIO callbacks currently take a struct vgic_its pointer,
which ties them to the GICv3 ITS. GICv5 needs to use the same MMIO
dispatch path with a different device structure.

Pass an opaque device pointer to the callbacks and cast it in the
GICv3 handlers. This does not change GICv3 behaviour.

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 arch/arm64/kvm/vgic/vgic-its.c  | 55 +++++++++++++++++----------------
 arch/arm64/kvm/vgic/vgic-mmio.h |  6 ++--
 2 files changed, 32 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index 34c1c89bfbfe1..c6e069af7c614 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -386,10 +386,10 @@ static int its_sync_lpi_pending_table(struct kvm_vcpu *vcpu)
 	return ret;
 }
 
-static unsigned long vgic_mmio_read_its_typer(struct kvm *kvm,
-					      struct vgic_its *its,
+static unsigned long vgic_mmio_read_its_typer(struct kvm *kvm, void *dev,
 					      gpa_t addr, unsigned int len)
 {
+	struct vgic_its *its = dev;
 	const struct vgic_its_abi *abi = vgic_its_get_abi(its);
 	u64 reg = GITS_TYPER_PLPIS;
 
@@ -408,10 +408,10 @@ static unsigned long vgic_mmio_read_its_typer(struct kvm *kvm,
 	return extract_bytes(reg, addr & 7, len);
 }
 
-static unsigned long vgic_mmio_read_its_iidr(struct kvm *kvm,
-					     struct vgic_its *its,
+static unsigned long vgic_mmio_read_its_iidr(struct kvm *kvm, void *dev,
 					     gpa_t addr, unsigned int len)
 {
+	struct vgic_its *its = dev;
 	u32 val;
 
 	val = (its->abi_rev << GITS_IIDR_REV_SHIFT) & GITS_IIDR_REV_MASK;
@@ -419,11 +419,11 @@ static unsigned long vgic_mmio_read_its_iidr(struct kvm *kvm,
 	return val;
 }
 
-static int vgic_mmio_uaccess_write_its_iidr(struct kvm *kvm,
-					    struct vgic_its *its,
+static int vgic_mmio_uaccess_write_its_iidr(struct kvm *kvm, void *dev,
 					    gpa_t addr, unsigned int len,
 					    unsigned long val)
 {
+	struct vgic_its *its = dev;
 	u32 rev = GITS_IIDR_REV(val);
 
 	if (rev >= NR_ITS_ABIS)
@@ -433,7 +433,7 @@ static int vgic_mmio_uaccess_write_its_iidr(struct kvm *kvm,
 }
 
 static unsigned long vgic_mmio_read_its_idregs(struct kvm *kvm,
-					       struct vgic_its *its,
+					       void *dev,
 					       gpa_t addr, unsigned int len)
 {
 	switch (addr & 0xffff) {
@@ -1496,17 +1496,18 @@ static u64 vgic_sanitise_its_cbaser(u64 reg)
 	return reg;
 }
 
-static unsigned long vgic_mmio_read_its_cbaser(struct kvm *kvm,
-					       struct vgic_its *its,
+static unsigned long vgic_mmio_read_its_cbaser(struct kvm *kvm, void *dev,
 					       gpa_t addr, unsigned int len)
 {
+	struct vgic_its *its = dev;
 	return extract_bytes(its->cbaser, addr & 7, len);
 }
 
-static void vgic_mmio_write_its_cbaser(struct kvm *kvm, struct vgic_its *its,
+static void vgic_mmio_write_its_cbaser(struct kvm *kvm, void *dev,
 				       gpa_t addr, unsigned int len,
 				       unsigned long val)
 {
+	struct vgic_its *its = dev;
 	/* When GITS_CTLR.Enable is 1, this register is RO. */
 	if (its->enabled)
 		return;
@@ -1564,10 +1565,11 @@ static void vgic_its_process_commands(struct kvm *kvm, struct vgic_its *its)
  * protects our ring buffer variables, so that there is only one user
  * per ITS handling commands at a given time.
  */
-static void vgic_mmio_write_its_cwriter(struct kvm *kvm, struct vgic_its *its,
+static void vgic_mmio_write_its_cwriter(struct kvm *kvm, void *dev,
 					gpa_t addr, unsigned int len,
 					unsigned long val)
 {
+	struct vgic_its *its = dev;
 	u64 reg;
 
 	if (!its)
@@ -1588,25 +1590,25 @@ static void vgic_mmio_write_its_cwriter(struct kvm *kvm, struct vgic_its *its,
 	mutex_unlock(&its->cmd_lock);
 }
 
-static unsigned long vgic_mmio_read_its_cwriter(struct kvm *kvm,
-						struct vgic_its *its,
+static unsigned long vgic_mmio_read_its_cwriter(struct kvm *kvm, void *dev,
 						gpa_t addr, unsigned int len)
 {
+	struct vgic_its *its = dev;
 	return extract_bytes(its->cwriter, addr & 0x7, len);
 }
 
-static unsigned long vgic_mmio_read_its_creadr(struct kvm *kvm,
-					       struct vgic_its *its,
+static unsigned long vgic_mmio_read_its_creadr(struct kvm *kvm, void *dev,
 					       gpa_t addr, unsigned int len)
 {
+	struct vgic_its *its = dev;
 	return extract_bytes(its->creadr, addr & 0x7, len);
 }
 
-static int vgic_mmio_uaccess_write_its_creadr(struct kvm *kvm,
-					      struct vgic_its *its,
+static int vgic_mmio_uaccess_write_its_creadr(struct kvm *kvm, void *dev,
 					      gpa_t addr, unsigned int len,
 					      unsigned long val)
 {
+	struct vgic_its *its = dev;
 	u32 cmd_offset;
 	int ret = 0;
 
@@ -1630,10 +1632,10 @@ static int vgic_mmio_uaccess_write_its_creadr(struct kvm *kvm,
 }
 
 #define BASER_INDEX(addr) (((addr) / sizeof(u64)) & 0x7)
-static unsigned long vgic_mmio_read_its_baser(struct kvm *kvm,
-					      struct vgic_its *its,
+static unsigned long vgic_mmio_read_its_baser(struct kvm *kvm, void *dev,
 					      gpa_t addr, unsigned int len)
 {
+	struct vgic_its *its = dev;
 	u64 reg;
 
 	switch (BASER_INDEX(addr)) {
@@ -1652,11 +1654,11 @@ static unsigned long vgic_mmio_read_its_baser(struct kvm *kvm,
 }
 
 #define GITS_BASER_RO_MASK	(GENMASK_ULL(52, 48) | GENMASK_ULL(58, 56))
-static void vgic_mmio_write_its_baser(struct kvm *kvm,
-				      struct vgic_its *its,
+static void vgic_mmio_write_its_baser(struct kvm *kvm, void *dev,
 				      gpa_t addr, unsigned int len,
 				      unsigned long val)
 {
+	struct vgic_its *its = dev;
 	const struct vgic_its_abi *abi = vgic_its_get_abi(its);
 	u64 old, entry_size, table_type;
 	u64 reg, *regptr, clearbits = 0;
@@ -1711,10 +1713,10 @@ static void vgic_mmio_write_its_baser(struct kvm *kvm,
 	}
 }
 
-static unsigned long vgic_mmio_read_its_ctlr(struct kvm *vcpu,
-					     struct vgic_its *its,
+static unsigned long vgic_mmio_read_its_ctlr(struct kvm *vcpu, void *dev,
 					     gpa_t addr, unsigned int len)
 {
+	struct vgic_its *its = dev;
 	u32 reg = 0;
 
 	mutex_lock(&its->cmd_lock);
@@ -1727,10 +1729,11 @@ static unsigned long vgic_mmio_read_its_ctlr(struct kvm *vcpu,
 	return reg;
 }
 
-static void vgic_mmio_write_its_ctlr(struct kvm *kvm, struct vgic_its *its,
+static void vgic_mmio_write_its_ctlr(struct kvm *kvm, void *dev,
 				     gpa_t addr, unsigned int len,
 				     unsigned long val)
 {
+	struct vgic_its *its = dev;
 	mutex_lock(&its->cmd_lock);
 
 	/*
@@ -1776,8 +1779,8 @@ static void vgic_mmio_write_its_ctlr(struct kvm *kvm, struct vgic_its *its,
 	.uaccess_its_write = uwr,				\
 }
 
-static void its_mmio_write_wi(struct kvm *kvm, struct vgic_its *its,
-			      gpa_t addr, unsigned int len, unsigned long val)
+static void its_mmio_write_wi(struct kvm *kvm, void *dev, gpa_t addr,
+			      unsigned int len, unsigned long val)
 {
 	/* Ignore */
 }
diff --git a/arch/arm64/kvm/vgic/vgic-mmio.h b/arch/arm64/kvm/vgic/vgic-mmio.h
index 38ed730d68ac3..c3b6d3e752d8d 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio.h
+++ b/arch/arm64/kvm/vgic/vgic-mmio.h
@@ -13,13 +13,13 @@ struct vgic_register_region {
 	union {
 		unsigned long (*read)(struct kvm_vcpu *vcpu, gpa_t addr,
 				      unsigned int len);
-		unsigned long (*its_read)(struct kvm *kvm, struct vgic_its *its,
+		unsigned long (*its_read)(struct kvm *kvm, void *dev,
 					  gpa_t addr, unsigned int len);
 	};
 	union {
 		void (*write)(struct kvm_vcpu *vcpu, gpa_t addr,
 			      unsigned int len, unsigned long val);
-		void (*its_write)(struct kvm *kvm, struct vgic_its *its,
+		void (*its_write)(struct kvm *kvm, void *dev,
 				  gpa_t addr, unsigned int len,
 				  unsigned long val);
 	};
@@ -28,7 +28,7 @@ struct vgic_register_region {
 	union {
 		int (*uaccess_write)(struct kvm_vcpu *vcpu, gpa_t addr,
 				     unsigned int len, unsigned long val);
-		int (*uaccess_its_write)(struct kvm *kvm, struct vgic_its *its,
+		int (*uaccess_its_write)(struct kvm *kvm, void *dev,
 					 gpa_t addr, unsigned int len,
 					 unsigned long val);
 	};
-- 
2.34.1


