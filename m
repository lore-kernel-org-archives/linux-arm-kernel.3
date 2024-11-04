Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679B4D132C8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 13:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zp5y0+Rq0WHrDia4bvFK9Du9WgLZRQc3oKl++fsdJMA=; b=dZAv2w634iuC9FpSuXgN2pJDB/
	NnDDKBL9AsTMmLqi86lM9iaUWMx8f4GYgN2UE3GrVE5cNrz8918w+mEJAckzHOeg4IjLQ+QWFJFbo
	RXl82e/rxVdhtL2mlzZIYPycLgXs9zBszqr301omcyExhWfrwqbCEoj/tg1fI3CmbPb2x/5FE53v3
	Z2qvKU//gnn6w4L4AGqPrGWekLvjys92P7/WSgjTIwBYbH72xFGd0P/w1oo4LvdwLfepep+uMzEzT
	R32L4XzFu8vXpb9gmRfXrtP3vxoZH3gw2A+gSgRfVekyWkbnB/ZmxHxi/PYNGAYb6FR3Yhg2i3u4g
	WPTyj/3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xSC-0000000Dvz9-3OFW;
	Mon, 04 Nov 2024 13:49:12 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xBu-0000000DsJ4-3sbK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 13:32:25 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-a9a157d028aso341744766b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 05:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730727140; x=1731331940; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zp5y0+Rq0WHrDia4bvFK9Du9WgLZRQc3oKl++fsdJMA=;
        b=LNef2bE//T3EQwzTP+pDoTPwWkLKCB/cD2S8+8QSseiMmMg6iEPNZK69r/aDLLogBj
         xAbPdrlOizxnUcAh06UbPk97+UrTdLEGnTxZpDnygGIvnXpw3MmuWjKF0x3qTyyOt1uI
         2d3qoEWGXR7RjtzAFdoJIiUydyNkDohCdgDD1HxX2QTV14ABdAwS2Eerj0WGX+n6v95k
         m7Sn9CU8EsKB9kuTB2BJM5nCDTu/LJVSrGaR/61y/pJ6A64HS5SLiyhACyMWjkSF9xP1
         KpwnjjI+v7l8ZUayHTirDle+d/DwRxYW0AqpBxVH9iZ01gwxjjF0wV2y6O5r9VbmUUtY
         kBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730727140; x=1731331940;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zp5y0+Rq0WHrDia4bvFK9Du9WgLZRQc3oKl++fsdJMA=;
        b=u7LCvwtA9s3uA1jHTsPTcIIVTNc/nyThE04pWPdo0UDw2LS6qtxwnFpuM2zT7BCGfg
         8iPTOWgHBo5EH+eAT8PxApzARkTebjLYAhjdtsD6wAhEApBcFNsdhviEL4Jmjj9REqvE
         NPeqLOBPJgc9BsjGD8gm5muSdTeNk0gjLyNraoUH3gPVWSRO0W3j+0i2zlFROo2+xUEI
         1sr0b14WKrPeyznAYKsYreg1b7tXd5aq/ZfoY0+Ba+MsI9taHKeK/3dtOOjOEFx2Iktj
         YQx7WngX2Tw67T6vPfTyS5MvGU2qyMwQ1NuFap9gw2ardATJ+0Ri6h76XIoCeIQLkcOD
         0Rlw==
X-Forwarded-Encrypted: i=1; AJvYcCUe0l1InmJU/sjqIMTnm4t+H3SgaU2WIosjGJEJimcbw564px+qgO2io7M7smE2MkFLfUp7nvT70YI5jfCaM+od@lists.infradead.org
X-Gm-Message-State: AOJu0Ywxu0SIL/ye+u3wPRYp3D+oR67pC0AQEUjnJSGxeuJPGzARaHLa
	EaUCtq62So1THbIgOPYfnUGJ/ThiC8FIeM44mmgcIMFgTJJAfA4slcZFQe7I1JgZInv3jdns4CZ
	UIiQb+Q==
X-Google-Smtp-Source: AGHT+IGu3UcssODTNd0NubVJlZtWwwslOS4Fc2l45eu0iucEanXM8xQBrQzJXKGVO4SXDuAu4FLnrjRPKE4G
X-Received: from big-boi.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:129])
 (user=qperret job=sendgmr) by 2002:a17:906:ca0b:b0:a99:f617:af50 with SMTP id
 a640c23a62f3a-a9e6581e0ebmr285966b.10.1730727139947; Mon, 04 Nov 2024
 05:32:19 -0800 (PST)
Date: Mon,  4 Nov 2024 13:31:51 +0000
In-Reply-To: <20241104133204.85208-1-qperret@google.com>
Mime-Version: 1.0
References: <20241104133204.85208-1-qperret@google.com>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241104133204.85208-6-qperret@google.com>
Subject: [PATCH 05/18] KVM: arm64: Pass walk flags to kvm_pgtable_stage2_mkyoung
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_053223_003976_52E38F1D 
X-CRM114-Status: GOOD (  15.46  )
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

kvm_pgtable_stage2_mkyoung currently assumes that it is being called
from a 'shared' walker, which will not be true once called from pKVM.
To allow for the re-use of that function, make the walk flags one of
its parameters.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/include/asm/kvm_pgtable.h | 4 +++-
 arch/arm64/kvm/hyp/pgtable.c         | 7 +++----
 arch/arm64/kvm/mmu.c                 | 3 ++-
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 03f4c3d7839c..442a45d38e23 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -669,6 +669,7 @@ int kvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size);
  * kvm_pgtable_stage2_mkyoung() - Set the access flag in a page-table entry.
  * @pgt:	Page-table structure initialised by kvm_pgtable_stage2_init*().
  * @addr:	Intermediate physical address to identify the page-table entry.
+ * @flags:	Flags to control the page-table walk (ex. a shared walk)
  *
  * The offset of @addr within a page is ignored.
  *
@@ -677,7 +678,8 @@ int kvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size);
  *
  * Return: The old page-table entry prior to setting the flag, 0 on failure.
  */
-kvm_pte_t kvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr);
+kvm_pte_t kvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr,
+				     enum kvm_pgtable_walk_flags flags);
 
 /**
  * kvm_pgtable_stage2_test_clear_young() - Test and optionally clear the access
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index b11bcebac908..fa25062f0590 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1245,15 +1245,14 @@ int kvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
 					NULL, NULL, 0);
 }
 
-kvm_pte_t kvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr)
+kvm_pte_t kvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr,
+				     enum kvm_pgtable_walk_flags flags)
 {
 	kvm_pte_t pte = 0;
 	int ret;
 
 	ret = stage2_update_leaf_attrs(pgt, addr, 1, KVM_PTE_LEAF_ATTR_LO_S2_AF, 0,
-				       &pte, NULL,
-				       KVM_PGTABLE_WALK_HANDLE_FAULT |
-				       KVM_PGTABLE_WALK_SHARED);
+				       &pte, NULL, flags);
 	if (!ret)
 		dsb(ishst);
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 0f7658aefa1a..27e1b281f402 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1708,6 +1708,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 /* Resolve the access fault by making the page young again. */
 static void handle_access_fault(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa)
 {
+	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_HANDLE_FAULT | KVM_PGTABLE_WALK_SHARED;
 	kvm_pte_t pte;
 	struct kvm_s2_mmu *mmu;
 
@@ -1715,7 +1716,7 @@ static void handle_access_fault(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa)
 
 	read_lock(&vcpu->kvm->mmu_lock);
 	mmu = vcpu->arch.hw_mmu;
-	pte = kvm_pgtable_stage2_mkyoung(mmu->pgt, fault_ipa);
+	pte = kvm_pgtable_stage2_mkyoung(mmu->pgt, fault_ipa, flags);
 	read_unlock(&vcpu->kvm->mmu_lock);
 
 	if (kvm_pte_valid(pte))
-- 
2.47.0.163.g1226f6d8fa-goog


