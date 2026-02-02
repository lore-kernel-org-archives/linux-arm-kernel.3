Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EFFE73158
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 13:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DaIRa8+hj7hUcUtCLpq5uVaY4q/WBE+WwNIl0Oyop/g=; b=iApjsIJm3N/ucApVCq6WrYAN0u
	56wEyDKg1rYb2xFj6bme1Ad+E/Oatv1oDUq/ej5QoGjm06QEv6o6dr05rCi/zFKE5LgDFDEwN2CFP
	64QXqA1RWGWAaTkRfRFBlV3+aeQmxm7wGBfibuP28kYrujN0evAccJw0xXNiFAWSN39MTjpMKtynB
	SuzZiJSb7eubHqv9H4FghLV8DBA563Mf4tr3bMAl1E3P4eFKnDyQoNwB3V1XXzSguzi9fALNeImZH
	cK6rKY9VioSBRt8SqhbJYqzjiIgDWg6LLAXMs0mPU4h5IPZizCtOTisqBibAZbkLo2fFxpxsMqqN2
	KWIq5HmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmtcF-00000004z3o-1Sfr;
	Mon, 02 Feb 2026 13:05:19 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmtcD-00000004z3K-03zi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 13:05:18 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-48071615686so34733665e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 05:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770037514; x=1770642314; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DaIRa8+hj7hUcUtCLpq5uVaY4q/WBE+WwNIl0Oyop/g=;
        b=MEBrRMaO7Xx4Wzzk+DPXnXnNerdbr4fXYAuo12bBzgv+KAM1RbDMKM3mYAAPPxuFEJ
         NmKreJ4ExsTS+an69hqVqVhDth4kcGi3QbZ2gthsrlo53PEggTq4fW9PonFJcpy6POEf
         +N7xVqlqkmRA/LFOhWBlQoHZq5ZKqxK1pTKtEzquduAS/7WVAdORgmLoJAUpSqLhFngt
         xlb3GqD/TEPOj2K3++OdjqnS21HQHAr/Nw15xUwAnVGWHMyP9fl3XKg6yasUkbm7jJYb
         eGk7pKRSlzac1rypDLhSvIqW8B18CVW4y1l8Rht/NrjG6ifDmkK0yTKXNeSQrF+kA8NB
         MW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770037514; x=1770642314;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DaIRa8+hj7hUcUtCLpq5uVaY4q/WBE+WwNIl0Oyop/g=;
        b=rYEKc/4hihxcinElOUofB32dafozSgWcE8WpIhvClZ3mWTzqdMW5n2dqZUHizn1CSJ
         lkB29YQ/d6q2Xvb/Xlxpv/NyFS53JwECL+5T+ydmvkHlsRJot1ogU459yGg6XMOdVvfS
         BN196k90r8aE1104oHs5hqVp97SL4UNJMiHXgwCIoOIQFTdtiul5VLSJ2S1mP5EYFcUy
         f0RNrrbJ2ibtXUZrl7Q40vrn4XYtrzgM7BDXc2FJJsKYWraz+NMR0TV8OdewYrNyYSTo
         IOjtNlY8qbIsPA4JrwvjzFO8uCIRsiF3kx4ddlYBTNGlX/V7cX1Qh+kb06NvSvwj5Ow4
         gKYw==
X-Forwarded-Encrypted: i=1; AJvYcCUxic8QRwlJBev0X5StAyDdFyvRiiHTxLIKlowkr8PIYSe6dCtniRd60X8z4Uv4GtLc71EdIxNpjthWT2v26r73@lists.infradead.org
X-Gm-Message-State: AOJu0YwjsppgWkCB4LTrVDH/bwL4GW/MP3Igv6w+lK9T4uWdf2M515o/
	qYPEjPaAIUUpw1xCpnN7NVIkMur9d7tZvScQb0TCIZ7uY1Nj66GANpDhrcmS4YOxUXk2UwH2Tv3
	uyw==
X-Received: from wmnv9.prod.google.com ([2002:a05:600c:4449:b0:477:9976:8214])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a00a:b0:480:69b6:dfed
 with SMTP id 5b1f17b1804b1-482db47d0d1mr157567225e9.24.1770037514308; Mon, 02
 Feb 2026 05:05:14 -0800 (PST)
Date: Mon,  2 Feb 2026 13:04:24 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260202130513.49436-1-tabba@google.com>
Subject: [PATCH v1] KVM: arm64: nv: Use kvm_phys_size() for VNCR invalidation range
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, qperret@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_050517_095918_B5AFBD29 
X-CRM114-Status: GOOD (  12.74  )
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

KVM: arm64: nv: Use kvm_phys_size() for VNCR invalidation range

Protected mode uses `pkvm_mappings` of the union inside `struct kvm_pgtable`.
This aliases `ia_bits`, which is used in non-protected mode.

Attempting to use `pgt->ia_bits` in kvm_nested_s2_unmap() and
kvm_nested_s2_wp() results in reading mapping pointers or state as a
shift amount. This triggers a UBSAN shift-out-of-bounds error:

    UBSAN: shift-out-of-bounds in arch/arm64/kvm/nested.c:1127:34
    shift exponent 174565952 is too large for 64-bit type 'unsigned long'
    Call trace:
     __ubsan_handle_shift_out_of_bounds+0x28c/0x2c0
     kvm_nested_s2_unmap+0x228/0x248
     kvm_arch_flush_shadow_memslot+0x98/0xc0
     kvm_set_memslot+0x248/0xce0

Fix this by using kvm_phys_size() to determine the IPA size. This helper
is independent of the software page table representation and works
correctly for both protected and non-protected modes, as it derives the
size directly from VTCR_EL2.

Fixes: 7270cc9157f47 ("KVM: arm64: nv: Handle VNCR_EL2 invalidation from MMU notifiers")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
Based on Linux 6.19-rc8
---
 arch/arm64/kvm/nested.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index cdeeb8f09e72..eb9666ba15b4 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1108,7 +1108,7 @@ void kvm_nested_s2_wp(struct kvm *kvm)
 			kvm_stage2_wp_range(mmu, 0, kvm_phys_size(mmu));
 	}
 
-	kvm_invalidate_vncr_ipa(kvm, 0, BIT(kvm->arch.mmu.pgt->ia_bits));
+	kvm_invalidate_vncr_ipa(kvm, 0, kvm_phys_size(&kvm->arch.mmu));
 }
 
 void kvm_nested_s2_unmap(struct kvm *kvm, bool may_block)
@@ -1124,7 +1124,7 @@ void kvm_nested_s2_unmap(struct kvm *kvm, bool may_block)
 			kvm_stage2_unmap_range(mmu, 0, kvm_phys_size(mmu), may_block);
 	}
 
-	kvm_invalidate_vncr_ipa(kvm, 0, BIT(kvm->arch.mmu.pgt->ia_bits));
+	kvm_invalidate_vncr_ipa(kvm, 0, kvm_phys_size(&kvm->arch.mmu));
 }
 
 void kvm_nested_s2_flush(struct kvm *kvm)

base-commit: 18f7fcd5e69a04df57b563360b88be72471d6b62
-- 
2.53.0.rc1.225.gd81095ad13-goog


