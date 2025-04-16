Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333C3C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 14:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g75HuV0HR1OVY5dfE2rrX9CT/iUi5E0di6NT8MyBd2c=; b=hOOXWcW7TKFBVEZcXqXDepo4ot
	Jbf5yR3vmvnFhhFk26F/yeRc59YJOlJ0XlKDWmnzbBWoN/xeAw4sWUqsA4jJGVTWSlKzGaGy3LUZV
	wVJwhCHzfwUAbLI2Z6fXYu0+lcL390/oOSFT8nJdCoiT6A2xaTKeqixl9Jl4kzlB/+mHzXVdlYDFb
	tyXG7iiv/JzdDyh9eHTohfXjZW+dvW5D6c8Gx8uBo/ww9n2GBfbn15DkASok6YHdRb4X9VtT4KW6f
	xxHgSRfmi8ZUejC4YgCwMy8VSbGpmkoAn7+9SnbRHuJAbm/JOZdlVOsLTrczd+8sHb23Dve2K1Uq7
	LjMJcH1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u53xX-00000009vt3-2waq;
	Wed, 16 Apr 2025 14:41:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u535L-00000009i1U-2Xi5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 13:45:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18F8C1E7D;
	Wed, 16 Apr 2025 06:45:49 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.90.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A35123F59E;
	Wed, 16 Apr 2025 06:45:46 -0700 (PDT)
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
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
Subject: [PATCH v8 30/43] arm64: RME: Prevent Device mappings for Realms
Date: Wed, 16 Apr 2025 14:41:52 +0100
Message-ID: <20250416134208.383984-31-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416134208.383984-1-steven.price@arm.com>
References: <20250416134208.383984-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_064551_692165_29D0ECB9 
X-CRM114-Status: GOOD (  13.06  )
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

Physical device assignment is not yet supported by the RMM, so it
doesn't make much sense to allow device mappings within the realm.
Prevent them when the guest is a realm.

Signed-off-by: Steven Price <steven.price@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
---
Changes from v6:
 * Fix the check in user_mem_abort() to prevent all pages that are not
   guest_memfd() from being mapped into the protected half of the IPA.
Changes from v5:
 * Also prevent accesses in user_mem_abort()
---
 arch/arm64/kvm/mmu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 29bab7a46033..b861747ea1b3 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1185,6 +1185,10 @@ int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
 	if (is_protected_kvm_enabled())
 		return -EPERM;
 
+	/* We don't support mapping special pages into a Realm */
+	if (kvm_is_realm(kvm))
+		return -EPERM;
+
 	size += offset_in_page(guest_ipa);
 	guest_ipa &= PAGE_MASK;
 
@@ -1775,6 +1779,15 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	if (exec_fault && device)
 		return -ENOEXEC;
 
+	/*
+	 * For now we shouldn't be hitting protected addresses because they are
+	 * handled in private_memslot_fault(). In the future this check may be
+	 * relaxed to support e.g. protected devices.
+	 */
+	if (vcpu_is_rec(vcpu) &&
+	    kvm_gpa_from_fault(kvm, fault_ipa) == fault_ipa)
+		return -EINVAL;
+
 	/*
 	 * Potentially reduce shadow S2 permissions to match the guest's own
 	 * S2. For exec faults, we'd only reach this point if the guest
-- 
2.43.0


