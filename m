Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1E5103E197
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZAaZlck7TSKDIJM9kp/ER/TWwJyMXWcTGrRZ4s4Y7rA=; b=ajZn44qq3WDS6NPVSMNn/0vZGA
	P8xIUa5ZoMHET7HPaQsGnBDzeCm1yJQB4U46chR6T6xEM3YhTxa+/W/MdL9wpeeo0LRBx39Q7U8Wb
	gHRODpLxv5M+6w1K+AAkCBMqTpIZK8Oz4z2jm7HsYp4llzk3+NIrJ1VqpmMfcnipxUTEAcRXVuf9v
	ci1o6Qr1Eg6zt4VGozAR0BRUpd7g36nm9Nx7tSOZhvjGkM3nEjfn+vH3RBntTY9FBB4rxbHb6TaJ5
	gPpVcQuTMqumSgetUPTXrcsjf8uekwU6/K0HGaetfUlgRa31JJOrK862Ww3+xQKz3OHY5i7NY8ESM
	x+sG9usw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tFp-00000008paM-0bH9;
	Wed, 18 Mar 2026 15:56:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tFV-00000008pEl-2mMP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:55:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C95722103;
	Wed, 18 Mar 2026 08:55:50 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.61.122])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A90973F73B;
	Wed, 18 Mar 2026 08:55:53 -0700 (PDT)
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
Subject: [PATCH v13 25/48] arm64: RMI: Set RIPAS of initial memslots
Date: Wed, 18 Mar 2026 15:53:49 +0000
Message-ID: <20260318155413.793430-26-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260318155413.793430-1-steven.price@arm.com>
References: <20260318155413.793430-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_085557_752257_12ADC864 
X-CRM114-Status: GOOD (  11.79  )
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

The memory which the realm guest accesses must be set to RIPAS_RAM.
Iterate over the memslots and set all gmem memslots to RIPAS_RAM.

Signed-off-by: Steven Price <steven.price@arm.com>
---
New patch for v12.
---
 arch/arm64/kvm/rmi.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
index b48f4e12e4e0..38349c7b34f4 100644
--- a/arch/arm64/kvm/rmi.c
+++ b/arch/arm64/kvm/rmi.c
@@ -883,12 +883,44 @@ static int realm_set_ipa_state(struct kvm_vcpu *vcpu,
 	return ret;
 }
 
+static int realm_init_ipa_state(struct kvm *kvm,
+				unsigned long gfn,
+				unsigned long pages)
+{
+	return ripas_change(kvm, NULL, gfn_to_gpa(gfn), gfn_to_gpa(gfn + pages),
+			    RIPAS_INIT, NULL);
+}
+
 static int realm_ensure_created(struct kvm *kvm)
 {
 	/* Provided in later patch */
 	return -ENXIO;
 }
 
+static int set_ripas_of_protected_regions(struct kvm *kvm)
+{
+	struct kvm_memslots *slots;
+	struct kvm_memory_slot *memslot;
+	int idx, bkt;
+	int ret = 0;
+
+	idx = srcu_read_lock(&kvm->srcu);
+
+	slots = kvm_memslots(kvm);
+	kvm_for_each_memslot(memslot, bkt, slots) {
+		if (!kvm_slot_has_gmem(memslot))
+			continue;
+
+		ret = realm_init_ipa_state(kvm, memslot->base_gfn,
+					   memslot->npages);
+		if (ret)
+			break;
+	}
+	srcu_read_unlock(&kvm->srcu, idx);
+
+	return ret;
+}
+
 int kvm_arm_rmi_populate(struct kvm *kvm,
 			 struct kvm_arm_rmi_populate *args)
 {
@@ -1206,6 +1238,10 @@ int kvm_activate_realm(struct kvm *kvm)
 			return ret;
 	}
 
+	ret = set_ripas_of_protected_regions(kvm);
+	if (ret)
+		return ret;
+
 	ret = rmi_realm_activate(virt_to_phys(realm->rd));
 	if (ret)
 		return -ENXIO;
-- 
2.43.0


