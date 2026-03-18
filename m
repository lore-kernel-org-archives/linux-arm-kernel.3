Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F0A103E197
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wLLxodPgUna6xOFFd7raB4j0oW+JF4izMioltCMu+UA=; b=3EtLqXC1TMIjyyk8cmKnvfheTP
	kn3TTiWygGIDugle2Mt+WZ4ajgXTMw/RvVi1ZAy6nMyG0Px7aXXmVE9+FEPJhOhzYtm7uyhbj19i7
	z+GGX5wn4nHD95vtuT2hjUp2DprCIucbnsjAr2QEndhupvg++tLq6XKl7b4wWkmzWzd/xu4bpHyII
	QsXdHC5NVO5JKfYZ9XkyQp7Bg4mrjwXPYa1l+nwAK87D6ATgPnFGXEsBZWQ1s39M0VRW1HVfE7X/3
	7Aj4R2/WhCqmLgxQhM76WvvGFVRajn3vysC7eAfxxMJbDaGkMoRe6dEUFzorR//mt1R3zfcRCGV0W
	A6fEKayw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tEx-00000008oeR-1X54;
	Wed, 18 Mar 2026 15:55:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tEr-00000008oZg-3Ylf
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Mar 2026 15:55:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=wLLxodPgUna6xOFFd7raB4j0oW+JF4izMioltCMu+UA=; b=jxRGrQglsJU6YU5NCGzO+rNMAE
	n6T8jAwhNA9KCAuv25hyNVbH6sxngmce8v749t1tF3keQDbXQJc0hxFM1fK+OAR8fSVUkVhhr4YOd
	1v7yCUrvtvYuDf52PNPVxjaJtQzIjgUjhXThKL0n11cHHlykOeYA3HzAidqz+rA5wizYKZu17THA8
	Bbn8Let4d71Ng6+ZLLJbfvaiGtxo1Nu7Xl18F8u0vBil/1g8XB2SM7sKY+PZEyIrRF0grR99D4KQW
	yRAIkJG7cDxNwe+yIwYZO5VnmdPpNoERTSYc+SUHmoJwRaY6LtelHOIR/84/FmiF61J646/FVZr9U
	ASaxaxdg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tEo-0000000BdTX-2cWJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:55:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7CB692008;
	Wed, 18 Mar 2026 08:55:07 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.61.122])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 26D703F73B;
	Wed, 18 Mar 2026 08:55:10 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
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
	Steven Price <steven.price@arm.com>
Subject: [PATCH v13 13/48] kvm: arm64: Don't expose unsupported capabilities for realm guests
Date: Wed, 18 Mar 2026 15:53:37 +0000
Message-ID: <20260318155413.793430-14-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260318155413.793430-1-steven.price@arm.com>
References: <20260318155413.793430-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_155514_832518_FBB36F56 
X-CRM114-Status: GOOD (  12.51  )
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

From: Suzuki K Poulose <suzuki.poulose@arm.com>

RMM v1.0 provides no mechanism for the host to perform debug operations
on the guest. So limit the extensions that are visible to an allowlist
so that only those capabilities we can support are advertised.

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Steven Price <steven.price@arm.com>
---
Changes since v10:
 * Add a kvm_realm_ext_allowed() function which limits which extensions
   are exposed to an allowlist. This removes the need for special casing
   various extensions.
Changes since v7:
 * Remove the helper functions and inline the kvm_is_realm() check with
   a ternary operator.
 * Rewrite the commit message to explain this patch.
---
 arch/arm64/kvm/arm.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 9b17bdfaf0c2..ddbf080e4f55 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -357,6 +357,25 @@ static bool kvm_has_full_ptr_auth(void)
 		(apa + api + apa3) == 1);
 }
 
+static bool kvm_realm_ext_allowed(long ext)
+{
+	switch (ext) {
+	case KVM_CAP_IRQCHIP:
+	case KVM_CAP_ARM_PSCI:
+	case KVM_CAP_ARM_PSCI_0_2:
+	case KVM_CAP_NR_VCPUS:
+	case KVM_CAP_MAX_VCPUS:
+	case KVM_CAP_MAX_VCPU_ID:
+	case KVM_CAP_MSI_DEVID:
+	case KVM_CAP_ARM_VM_IPA_SIZE:
+	case KVM_CAP_ARM_PTRAUTH_ADDRESS:
+	case KVM_CAP_ARM_PTRAUTH_GENERIC:
+	case KVM_CAP_ARM_RMI:
+		return true;
+	}
+	return false;
+}
+
 int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 {
 	int r;
@@ -364,6 +383,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	if (is_protected_kvm_enabled() && !kvm_pkvm_ext_allowed(kvm, ext))
 		return 0;
 
+	if (kvm && kvm_is_realm(kvm) && !kvm_realm_ext_allowed(ext))
+		return 0;
+
 	switch (ext) {
 	case KVM_CAP_IRQCHIP:
 		r = vgic_present;
-- 
2.43.0


