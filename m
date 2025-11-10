Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F5FCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 13:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JB5qwwMZxO407X97+Vf/KcwBIUQMngdzvKz1itKcTdc=; b=nbiOdX0ru4mD6qBrlyBZKLoTUs
	+zrznM/EFm9OPCO0Wc+GAG5KFSf583J2YYir5eYfNqBWy37O3uk6f/l8Xhz9QzfIJB4lK8uMQR8R7
	bCM/EJ7t3nghG2jfJYxiQq4rXOAZ/r2eMRHDHMm0QvCQZbD9B2SjtSPwPBuvJqaKohK39ss+l3/AN
	9dGS58TAPzFPUsdV2hfpplGpomfmW5rIjYmeqZ6M1p0M4KTZo/hQrMh5qoEYBrlehRbA7k02YFV5X
	ajEwbpzAwZplPR6sRyYFFwsPhb1yCCSyChW69Dn3Dl027L0J0ovdYLbO6BCB7pf1SQisks3oNwlJS
	vKb6wQsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISDE-00000005VvR-0sOM;
	Mon, 10 Nov 2025 13:45:40 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISD7-00000005Vpq-1N7D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 13:45:34 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-42b2b642287so1010509f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 05:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762782331; x=1763387131; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JB5qwwMZxO407X97+Vf/KcwBIUQMngdzvKz1itKcTdc=;
        b=A8fE6/0g2zQ4mdapMg3YSUfe/UNhfu1oAawvyacqYRahEvYbTA7zE2cbLeyluamXnN
         w+W2zY4z4OyrIe6sDlX3fD3Tl6artqVSdX4SePCHMXMSyvtkB3K56TheAcycJ+Cx+Bq2
         YutoHBytuQYXOhLkRa0rcjECJYdrMvuDLHWItbhupBF/geA3e+JpSKEo/Od6prvRLHeV
         0uKgnmwOyDKZc15QQOSl4SwNLKqyE0nX3CyvD0bMw3+wEuGARY60TJ+cYs01mUPhLEsS
         325RJzLmLSIlDTzyslFAcWjJ1N/z8eQdDxI+IKl9dlNFAJ/VkQD0DUb2DveyW4h2H7lH
         bQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762782331; x=1763387131;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JB5qwwMZxO407X97+Vf/KcwBIUQMngdzvKz1itKcTdc=;
        b=MH3bkDOQafXn/mLxgglOY89p3Xu3Ule9TxmdIgd9Wz6bbEM8xN9PeUTInKnubRqeEC
         5qObiGTAbQDBeKje1YqwRSbmHUcmjjgbbA8W8BaQ5zzzBue2fW+B41fqsvbK8T/RLDUD
         7lKX8ZnljWHhW4d2u7oVZ4Szal5Odf65k+dq5a6JWcoI/jE+w7tC5C6LucND2hGAapvO
         wdaT8ikvhb1bL+8PO2vtVC5DmiNcypM23l8tyn20gKty9Tn2AmuyDxGgeig5OGWTjUaO
         pvtqXuEnV8oFuwc9fm6yFI4Q3NzzCoRkLCawo+sCw40uwBZapp1NxqQI4tI5K83ycGcb
         T5MQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7N9yuPZtaJBTxav+12znL39nfvLNZfyKacR/HsdD3HyeS9mTqZEz+zTPNedaYddujbcLlon3HaFlFIcCbRu5F@lists.infradead.org
X-Gm-Message-State: AOJu0YzMg72M7fOa73w86pFm58d/lnsUlBnRS4KKktFZ+GxvCl9rPwsU
	7bb02ULSakxN8NXr6akrc07fKBXDvp0iz9RXzfJUIcEfWBgC3TPJzHCnI0hKl70QbO5XtBFsXKd
	AwA==
X-Google-Smtp-Source: AGHT+IEz2iBL2qKm5t7JV1HboE0FBN8eENcDqbMVwHtPM4RwpFQ0TU+Dbwo3BB7GseTu/jEADGZ85DZurw==
X-Received: from wrur5.prod.google.com ([2002:a05:6000:1b85:b0:429:c8a6:4f61])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:5d07:0:b0:429:cce9:9b76
 with SMTP id ffacd0b85a97d-42b2dc4aaccmr6293392f8f.50.1762782330778; Mon, 10
 Nov 2025 05:45:30 -0800 (PST)
Date: Mon, 10 Nov 2025 13:45:21 +0000
In-Reply-To: <20251110134525.3768197-1-tabba@google.com>
Mime-Version: 1.0
References: <20251110134525.3768197-1-tabba@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251110134525.3768197-5-tabba@google.com>
Subject: [PATCH v3 4/8] KVM: arm64: Introduce helper to calculate fault IPA offset
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_054533_399168_D7077512 
X-CRM114-Status: GOOD (  14.39  )
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

This 12-bit FAR fault IPA offset mask is hard-coded as 'GENMASK(11, 0)'
in several places to reconstruct the full fault IPA.

Introduce FAR_TO_FIPA_OFFSET() to calculate this value in a shared
header and replace all open-coded instances to improve readability.

No functional change intended.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_arm.h         | 2 ++
 arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c | 2 +-
 arch/arm64/kvm/inject_fault.c            | 2 +-
 arch/arm64/kvm/mmu.c                     | 4 ++--
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
index 1da290aeedce..73abe697bc2d 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -343,6 +343,8 @@
 #define PAR_TO_HPFAR(par)		\
 	(((par) & GENMASK_ULL(52 - 1, 12)) >> 8)
 
+#define FAR_TO_FIPA_OFFSET(far) ((far) & GENMASK_ULL(11, 0))
+
 #define ECN(x) { ESR_ELx_EC_##x, #x }
 
 #define kvm_arm_exception_class \
diff --git a/arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c b/arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c
index 78579b31a420..43d7dfa2c517 100644
--- a/arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c
+++ b/arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c
@@ -44,7 +44,7 @@ int __vgic_v2_perform_cpuif_access(struct kvm_vcpu *vcpu)
 
 	/* Build the full address */
 	fault_ipa  = kvm_vcpu_get_fault_ipa(vcpu);
-	fault_ipa |= kvm_vcpu_get_hfar(vcpu) & GENMASK(11, 0);
+	fault_ipa |= FAR_TO_FIPA_OFFSET(kvm_vcpu_get_hfar(vcpu));
 
 	/* If not for GICV, move on */
 	if (fault_ipa <  vgic->vgic_cpu_base ||
diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
index dfcd66c65517..c9bbce017dee 100644
--- a/arch/arm64/kvm/inject_fault.c
+++ b/arch/arm64/kvm/inject_fault.c
@@ -258,7 +258,7 @@ void kvm_inject_size_fault(struct kvm_vcpu *vcpu)
 	unsigned long addr, esr;
 
 	addr  = kvm_vcpu_get_fault_ipa(vcpu);
-	addr |= kvm_vcpu_get_hfar(vcpu) & GENMASK(11, 0);
+	addr |= FAR_TO_FIPA_OFFSET(kvm_vcpu_get_hfar(vcpu));
 
 	__kvm_inject_sea(vcpu, kvm_vcpu_trap_is_iabt(vcpu), addr);
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 7cc964af8d30..5b159cf0d203 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1959,7 +1959,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 
 		/* Falls between the IPA range and the PARange? */
 		if (fault_ipa >= BIT_ULL(VTCR_EL2_IPA(vcpu->arch.hw_mmu->vtcr))) {
-			fault_ipa |= kvm_vcpu_get_hfar(vcpu) & GENMASK(11, 0);
+			fault_ipa |= FAR_TO_FIPA_OFFSET(kvm_vcpu_get_hfar(vcpu));
 
 			return kvm_inject_sea(vcpu, is_iabt, fault_ipa);
 		}
@@ -2059,7 +2059,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 		 * faulting VA. This is always 12 bits, irrespective
 		 * of the page size.
 		 */
-		ipa |= kvm_vcpu_get_hfar(vcpu) & GENMASK(11, 0);
+		ipa |= FAR_TO_FIPA_OFFSET(kvm_vcpu_get_hfar(vcpu));
 		ret = io_mem_abort(vcpu, ipa);
 		goto out_unlock;
 	}
-- 
2.51.2.1041.gc1ab5b90ca-goog


