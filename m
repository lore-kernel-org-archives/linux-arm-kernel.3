Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E3F103E19B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cxu9u5UCqJDe0egQZIG2oFJb94RcO1QIknq+IvSKm/Y=; b=TiI6dsxQMlX9OLbHTnHIdefRlR
	3obQ6ReRRKeda+ZWr8Mqh8ZHOW1cqoMUMjoMI4S7bSgfYR+wilWzryAmEDxvL2Gz/1MQAHAN4s4Lb
	x1Q067B8CqAzJgWcJ2bdNFWuCoLRQCqRXMK1+IFLWsuwoIhMOU4VPFDfFKWKOo3vPaf70o5ctbXpY
	7Rjx2f2plHDV6GiKtIX1/Sfjg46NHdXZbGG203ocX5HDh983XU4oc0fTCtpn6fEkGZctDLZ3kEVSp
	hJnpXLltUnjt0RKX2d9isyHoVXszQdtKRRjJkF4kOR5i3cDMUKvGSEDqgTPIZI3kmWUngoTPoKiTk
	3FlxD7LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tF8-00000008oou-1sxw;
	Wed, 18 Mar 2026 15:55:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tF4-00000008ojW-0utA
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Mar 2026 15:55:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Cxu9u5UCqJDe0egQZIG2oFJb94RcO1QIknq+IvSKm/Y=; b=c4pvyIuT/E2LueAPH8BI56PgyY
	Tai69Y2wmXBTloOZoaAATafZetcwtn1iZPMsV/8Zb9asYwyFckdhV6HBz523kYMFp+kRi5egkeZRU
	0i9t5uSs+SRqqk+ZRrp+QZdZZ8hU40TMNkLfnexsp1i32ONONh/i/lNpU47idrqL9x1o4A0CeROU0
	gzkd9Cv5UsQi81/DdMjPyweiGNvlmtisb0+7tnpTLTNws36U+bTde7dbu9bkM8IkCOa7y8no0PmuE
	hUjdvRu73qMN68kurWqdF5AJA/7JsHtu+12VTw9NbS10Xc1HCfODVpaxwYogYAzq1gGpbUFOtwNb6
	tI/L+3bw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tF0-0000000BdX2-2Tbp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:55:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7DFB1C2B;
	Wed, 18 Mar 2026 08:55:18 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.61.122])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 85DF23F73B;
	Wed, 18 Mar 2026 08:55:21 -0700 (PDT)
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
Subject: [PATCH v13 16/48] arm64: RMI: Activate realm on first VCPU run
Date: Wed, 18 Mar 2026 15:53:40 +0000
Message-ID: <20260318155413.793430-17-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260318155413.793430-1-steven.price@arm.com>
References: <20260318155413.793430-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_155527_083462_E6D6C9D9 
X-CRM114-Status: GOOD (  13.08  )
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
index 16a297f3091a..6c13847480f7 100644
--- a/arch/arm64/include/asm/kvm_rmi.h
+++ b/arch/arm64/include/asm/kvm_rmi.h
@@ -67,6 +67,7 @@ void kvm_init_rmi(void);
 u32 kvm_realm_ipa_limit(void);
 
 int kvm_init_realm_vm(struct kvm *kvm);
+int kvm_activate_realm(struct kvm *kvm);
 void kvm_destroy_realm(struct kvm *kvm);
 void kvm_realm_destroy_rtts(struct kvm *kvm);
 
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index b79b58802b33..c8e51ed009c0 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -998,6 +998,12 @@ int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu *vcpu)
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
index 1fd2c18f7381..937fababf960 100644
--- a/arch/arm64/kvm/rmi.c
+++ b/arch/arm64/kvm/rmi.c
@@ -366,6 +366,45 @@ void kvm_realm_destroy_rtts(struct kvm *kvm)
 	WARN_ON(realm_tear_down_rtt_range(realm, 0, (1UL << ia_bits)));
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
+	WRITE_ONCE(realm->state, REALM_STATE_DEAD);
+
+	ret = rmi_realm_activate(virt_to_phys(realm->rd));
+	if (ret)
+		return -ENXIO;
+
+	WRITE_ONCE(realm->state, REALM_STATE_ACTIVE);
+	return 0;
+}
+
 void kvm_destroy_realm(struct kvm *kvm)
 {
 	struct realm *realm = &kvm->arch.realm;
-- 
2.43.0


