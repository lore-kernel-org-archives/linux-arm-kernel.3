Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 869ACD65526
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 10:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLZkbtoUhhuIQcBZuZ85OQNyTVuj+RVLafKhAbG4xW0=; b=a3WztBIJ/eh5e+VxCfXGQUPRRe
	gMqY0PwOHsmsfcyTiX7IbSryMypBwRaMjIj/qN/uuwU8T/92gv/IdXc76LbiNIgNclFrDvUUDKaIM
	yAm9EAjsal2+hNBMDXrpYACeGlJ8eonQvLwDHsi5Oxc/E0doA+bmyR586b/UM+OfXV3jButOKdrdn
	oeifTomOjKrVSZr7r9QO54Tds16gJsCRYKD/sKwlr0VeFVyOe1BTYFmj2YGFXoTAb+qYwMI+jSPpI
	+B8wBfEUlej66nP9lt8gHQpfKyI8N3lLCxQQ/mowUg3imw5TAS4N4l/MQpkYPrfIDyPlr9lq54llB
	V15XMU4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoYi-00000006Yut-3tuN;
	Wed, 17 Dec 2025 10:15:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoYi-00000006Ysp-0EQj
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 17 Dec 2025 10:15:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=oLZkbtoUhhuIQcBZuZ85OQNyTVuj+RVLafKhAbG4xW0=; b=Si/nhRO1FmSnEA91V+b4XFoKrp
	Jk4ZMOXUWRMhatNOc8Gn9rZLCy9oNGDEnEEvYE5xmApQPTAABlQ4lyfP4jX9CT452TSCs9NefDB87
	FSAnBK0wTHysgLCPNExwDeYy7yucMk8uSePKDrDEaKJgzQDWtdVdz5UAIpO3knF0C066uHCFPbceL
	e7utb3BICb3i+Q2SR9C5sfLZmZ2lS4ZL/JJxciRs01Dv7IgKA95HX5M6FL2I/8XgQgJXKXJWaVAYh
	nqAfGajZBUY1yF1CmfIZHSuITvJVjzAtptLcsIHeGixO/EmNLzTGVfFwX8gY9tRDYzByoRiPZf85V
	giTe1/Rw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVnhB-00000006UHa-17QR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 09:19:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 455FF1688;
	Wed, 17 Dec 2025 02:14:52 -0800 (PST)
Received: from e122027.arm.com (unknown [10.57.45.201])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B79DC3F73B;
	Wed, 17 Dec 2025 02:14:54 -0800 (PST)
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
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
	Steven Price <steven.price@arm.com>
Subject: [PATCH v12 40/46] arm64: RMI: Initialize PMCR.N with number counter supported by RMM
Date: Wed, 17 Dec 2025 10:11:17 +0000
Message-ID: <20251217101125.91098-41-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217101125.91098-1-steven.price@arm.com>
References: <20251217101125.91098-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_091946_369605_25946E6D 
X-CRM114-Status: GOOD (  10.13  )
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Provide an accurate number of available PMU counters to userspace when
setting up a Realm.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Steven Price <steven.price@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Reviewed-by: Joey Gouly <joey.gouly@arm.com>
---
 arch/arm64/include/asm/kvm_rmi.h | 1 +
 arch/arm64/kvm/pmu-emul.c        | 3 +++
 arch/arm64/kvm/rmi.c             | 5 +++++
 3 files changed, 9 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
index f36d3c845836..39770d9e9fcb 100644
--- a/arch/arm64/include/asm/kvm_rmi.h
+++ b/arch/arm64/include/asm/kvm_rmi.h
@@ -88,6 +88,7 @@ struct realm_rec {
 void kvm_init_rmi(void);
 u32 kvm_realm_ipa_limit(void);
 u32 kvm_realm_vgic_nr_lr(void);
+u8 kvm_realm_max_pmu_counters(void);
 
 u64 kvm_realm_reset_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu, u64 val);
 
diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 41331f883780..6604aa982d02 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -1014,6 +1014,9 @@ u8 kvm_arm_pmu_get_max_counters(struct kvm *kvm)
 {
 	struct arm_pmu *arm_pmu = kvm->arch.arm_pmu;
 
+	if (kvm_is_realm(kvm))
+		return kvm_realm_max_pmu_counters();
+
 	/*
 	 * PMUv3 requires that all event counters are capable of counting any
 	 * event, though the same may not be true of non-PMUv3 hardware.
diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
index 5f3164539bfe..4e1c7bc2f52a 100644
--- a/arch/arm64/kvm/rmi.c
+++ b/arch/arm64/kvm/rmi.c
@@ -92,6 +92,11 @@ u32 kvm_realm_vgic_nr_lr(void)
 	return u64_get_bits(rmm_feat_reg0, RMI_FEATURE_REGISTER_0_GICV3_NUM_LRS);
 }
 
+u8 kvm_realm_max_pmu_counters(void)
+{
+	return u64_get_bits(rmm_feat_reg0, RMI_FEATURE_REGISTER_0_PMU_NUM_CTRS);
+}
+
 u64 kvm_realm_reset_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu, u64 val)
 {
 	u32 bps = u64_get_bits(rmm_feat_reg0, RMI_FEATURE_REGISTER_0_NUM_BPS);
-- 
2.43.0


