Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00C0D65528
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 10:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0vgehLfKuOaUaDSTV0Xa/FhqidrQttcDucSmSlBzZ9Y=; b=Yod5qTy+Aw1CrSUlXETxV5r6X2
	hcR78E0G2bSft8bndj3EuYfX9gZ7mXqel1hNorxcP7LGSVGjFBgfHogV7SL0vAp9GPWTfdCLPFct4
	j0gH6Va5UhgiNksDiwjsgH+HSpHggjrYTW691B2N6C63EvYm9ji4peHTDHH46+8ehWuS2JLhcQu02
	sgmii1/10ZNxHIvJaoIb/UOagyutGMCRWtZpYf60HRyffySkE6EEy8bKbbbDJBFnUy3aCr8I5eCLf
	5+ASgyaN/ZB27On03zYEqcWeO7ATrFofxl3KBoCrTm+t28Pht43uNGh3ht619eoU88NKsgCb/5T2f
	R2hA4R4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoXS-00000006XW3-3KC3;
	Wed, 17 Dec 2025 10:13:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoXL-00000006XNM-02ao
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 10:13:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4EDAA1517;
	Wed, 17 Dec 2025 02:13:31 -0800 (PST)
Received: from e122027.arm.com (unknown [10.57.45.201])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CFB1D3F73B;
	Wed, 17 Dec 2025 02:13:33 -0800 (PST)
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
	Vishal Annapurve <vannapurve@google.com>
Subject: [PATCH v12 23/46] arm64: RMI: Add a VMID allocator for realms
Date: Wed, 17 Dec 2025 10:11:00 +0000
Message-ID: <20251217101125.91098-24-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217101125.91098-1-steven.price@arm.com>
References: <20251217101125.91098-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_021339_222584_3CA51469 
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

The RMM v1.0 spec requires that the host manage the VMIDs of realm
guests. Add a basic allocator and assign a unique VMID to the guest when
creating the realm descriptor.

Signed-off-by: Steven Price <steven.price@arm.com>
---
New patch for v12.
NOTE: RMM v2.0 will remove the requirement for the host to manage VMIDs
---
 arch/arm64/kvm/rmi.c | 48 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
index 18edc7eeb5fa..ede6c250bcfb 100644
--- a/arch/arm64/kvm/rmi.c
+++ b/arch/arm64/kvm/rmi.c
@@ -600,6 +600,42 @@ static int realm_create_rd(struct kvm *kvm)
 	return r;
 }
 
+/* Protects access to rmi_vmid_bitmap */
+static DEFINE_SPINLOCK(rmi_vmid_lock);
+static unsigned long *rmi_vmid_bitmap;
+
+static int rmi_vmid_init(void)
+{
+	unsigned int vmid_count = 1 << kvm_get_vmid_bits();
+
+	rmi_vmid_bitmap = bitmap_zalloc(vmid_count, GFP_KERNEL);
+	if (!rmi_vmid_bitmap) {
+		kvm_err("%s: Couldn't allocate rmi vmid bitmap\n", __func__);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int rmi_vmid_reserve(void)
+{
+	int ret;
+	unsigned int vmid_count = 1 << kvm_get_vmid_bits();
+
+	spin_lock(&rmi_vmid_lock);
+	ret = bitmap_find_free_region(rmi_vmid_bitmap, vmid_count, 0);
+	spin_unlock(&rmi_vmid_lock);
+
+	return ret;
+}
+
+static void rmi_vmid_release(unsigned int vmid)
+{
+	spin_lock(&rmi_vmid_lock);
+	bitmap_release_region(rmi_vmid_bitmap, vmid, 0);
+	spin_unlock(&rmi_vmid_lock);
+}
+
 static int realm_unmap_private_page(struct realm *realm,
 				    unsigned long ipa,
 				    unsigned long *next_addr)
@@ -903,6 +939,7 @@ static int realm_init_ipa_state(struct kvm *kvm,
 
 static int realm_ensure_created(struct kvm *kvm)
 {
+	struct realm *realm = &kvm->arch.realm;
 	int ret;
 
 	switch (kvm_realm_state(kvm)) {
@@ -916,7 +953,13 @@ static int realm_ensure_created(struct kvm *kvm)
 		return -EBUSY;
 	}
 
+	ret = rmi_vmid_reserve();
+	if (ret < 0)
+		return ret;
+	realm->vmid = ret;
 	ret = realm_create_rd(kvm);
+	if (ret)
+		rmi_vmid_release(realm->vmid);
 	return ret;
 }
 
@@ -1307,6 +1350,8 @@ void kvm_destroy_realm(struct kvm *kvm)
 		realm->rd = NULL;
 	}
 
+	rmi_vmid_release(realm->vmid);
+
 	for (i = 0; i < pgd_size; i += RMM_PAGE_SIZE) {
 		phys_addr_t pgd_phys = kvm->arch.mmu.pgd_phys + i;
 
@@ -1342,5 +1387,8 @@ void kvm_init_rmi(void)
 	if (WARN_ON(rmi_features(0, &rmm_feat_reg0)))
 		return;
 
+	if (rmi_vmid_init())
+		return;
+
 	/* Future patch will enable static branch kvm_rmi_is_available */
 }
-- 
2.43.0


