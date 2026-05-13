Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92716CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 13:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VK3YbekhHos1bExmZ3ie912+0QPjU2RA1RcRm/aMPsM=; b=nSTj0+O0qVECCZnxxVpCebc6Ke
	ohj1LHMd9g9BkaiZ/e0VzJqbOQ2BJYZl0eeuiCJHjRhmQny5ls6xaYgDwlKpRQcFc/UIGasL4/94I
	jG7lkoac0JlYd+UnGcAAyqqaEb54H6SUcf88aWAgbfbqk+9/Vy0Etgy9+Dra/3HTj5TdMNRt2iks9
	766vPXBMBGgvPtW9UYczIUDog4d81a8ify2vpKKlmQjfw2nMcyQAmkTnOZNXwtxfrc6GCbg1dzmGC
	HVRT8OB64LHswDVg8YMrWzKyrKqGeSi896FkZToqkI1l61a8O47JsIeVudYVphk3HiCVYV16X8sHF
	izu2i1PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9VV-00000002g3n-43ui;
	Wed, 13 May 2026 13:20:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9VJ-00000002fns-2Vk6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 13:20:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89420302F;
	Wed, 13 May 2026 06:19:54 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.68.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF49F3F836;
	Wed, 13 May 2026 06:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778678399; bh=pdkklLRRuh8jpebEmABwIniFvM5F63CVv216wQw07qQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jGFld3Pgr6RdqUSNxJNkWVT0q+0QcxKFHxIbCcjVQ7dJCqbCo3hFJJRobKUUp6tdr
	 O8JNu8xXv3PSD0k4eRwr00dD3pMqkGXytE5XwJk6e+KWYX7rewyhSBypV/TJBZLQsZ
	 1N0F5bWNLPWfD5Wfxh9lpO24zduw2yPC3khj5dMo=
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
Subject: [PATCH v14 18/44] arm64: RMI: Activate realm on first VCPU run
Date: Wed, 13 May 2026 14:17:26 +0100
Message-ID: <20260513131757.116630-19-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513131757.116630-1-steven.price@arm.com>
References: <20260513131757.116630-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_062001_793281_504C999B 
X-CRM114-Status: GOOD (  13.54  )
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

Use kvm_arch_vcpu_run_pid_change() to check if this is the first time
the realm guest has run. If this is the first run then activate the
realm.

Before the realm can be activated it must first be created, this is a
stub in this patch and will be filled in by a later patch.

Signed-off-by: Steven Price <steven.price@arm.com>
---
Changes since v12:
 * Fix commit message
 * Change realm_state checks to be >= REALM_STATE_ACTIVE to avoid a dead
   guest being revived by kvm_activate_realm().
---
 arch/arm64/include/asm/kvm_rmi.h |  1 +
 arch/arm64/kvm/arm.c             |  6 +++++
 arch/arm64/kvm/rmi.c             | 39 ++++++++++++++++++++++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
index 06ba0d4745c6..8bd743093ccf 100644
--- a/arch/arm64/include/asm/kvm_rmi.h
+++ b/arch/arm64/include/asm/kvm_rmi.h
@@ -63,6 +63,7 @@ void kvm_init_rmi(void);
 u32 kvm_realm_ipa_limit(void);
 
 int kvm_init_realm(struct kvm *kvm);
+int kvm_activate_realm(struct kvm *kvm);
 void kvm_destroy_realm(struct kvm *kvm);
 void kvm_realm_destroy_rtts(struct kvm *kvm);
 
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 41d35b2d1dee..eb2b61fe1f0a 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1018,6 +1018,12 @@ int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu *vcpu)
 			return ret;
 	}
 
+	if (kvm_is_realm(vcpu->kvm)) {
+		ret = kvm_activate_realm(kvm);
+		if (ret)
+			return ret;
+	}
+
 	mutex_lock(&kvm->arch.config_lock);
 	set_bit(KVM_ARCH_FLAG_HAS_RAN_ONCE, &kvm->arch.flags);
 	mutex_unlock(&kvm->arch.config_lock);
diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
index 5b00ccca4af3..849111817af7 100644
--- a/arch/arm64/kvm/rmi.c
+++ b/arch/arm64/kvm/rmi.c
@@ -167,6 +167,45 @@ void kvm_realm_destroy_rtts(struct kvm *kvm)
 	realm_tear_down_rtt_range(realm, 0, (1UL << ia_bits));
 }
 
+static int realm_ensure_created(struct kvm *kvm)
+{
+	/* Provided in later patch */
+	return -ENXIO;
+}
+
+int kvm_activate_realm(struct kvm *kvm)
+{
+	struct realm *realm = &kvm->arch.realm;
+	int ret;
+
+	if (kvm_realm_state(kvm) >= REALM_STATE_ACTIVE)
+		return 0;
+
+	if (!irqchip_in_kernel(kvm)) {
+		/* Userspace irqchip not yet supported with realms */
+		return -EOPNOTSUPP;
+	}
+
+	guard(mutex)(&kvm->arch.config_lock);
+	/* Check again with the lock held */
+	if (kvm_realm_state(kvm) >= REALM_STATE_ACTIVE)
+		return 0;
+
+	ret = realm_ensure_created(kvm);
+	if (ret)
+		return ret;
+
+	/* Mark state as dead in case we fail */
+	kvm_set_realm_state(kvm, REALM_STATE_DEAD);
+
+	ret = rmi_realm_activate(virt_to_phys(realm->rd));
+	if (ret)
+		return -ENXIO;
+
+	kvm_set_realm_state(kvm, REALM_STATE_ACTIVE);
+	return 0;
+}
+
 void kvm_destroy_realm(struct kvm *kvm)
 {
 	struct realm *realm = &kvm->arch.realm;
-- 
2.43.0


