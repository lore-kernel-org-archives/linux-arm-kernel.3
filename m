Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6ABD41C22
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 10:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CTVWHQr8QqD4O3yE8paC6Rmoy43hLsT5yuKJw7dLA9k=; b=0qtRk+ao60LyW/SW1h6QzmhZgg
	cxXoM/jtig4EtULSTxH3VHchlZXgnh8GcZOlWu5xvp9ogCJChFXwHRnytV6WfA2SfOhD+Gmiz4eBs
	WTmBYbPKOt3zgyp2BfkqEwHXdPFPdOtqPrPiLQrMirmBBTR4UoJLWeBMHVc+S+tdjNYUvw89HHYvD
	MZ6M3OQQvyAevIxOUvMFF+ccdDpG/T4VpKgdbsjKyQROqLmo64ia2UI9JcmrLPithuMiCEcpvxXvu
	CxhnotymRmHuFAyjAweZaHGnF5pZn8hmMOaa9mZIB5REEvy8Mn31EXX0h8RssjTukIqiHPzp4KAkC
	DqIOWS6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTeCe-0000000GUst-2Z9k;
	Thu, 11 Dec 2025 10:47:20 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTeCa-0000000GUoJ-11yP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 10:47:17 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-47777158a85so9004095e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 02:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765450034; x=1766054834; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CTVWHQr8QqD4O3yE8paC6Rmoy43hLsT5yuKJw7dLA9k=;
        b=Eh0gygnIwWLMOYmCjDSmJTfcDAR8PU4aAkifUM1o7n0wLHlxuVpn4J/XYb2wkhfBET
         o11TuaCEEhsKxK0WOJPChQs7eNlCwW12V1vtzlU3oMZIIvIXcGzb/No+b4GQXMdLSP5x
         xUvtJUBpMZp7YHR908dVtpsP/RzatpH1582xeaK6EH9xBPPpjIJSx9oQLBgQyhVDvDW4
         MlIhwp/YTaHFNoWlDPand06DF9IjkBJhHJfzo11RXBtUcH4ISjpV6+g5FGO4VvMBurUf
         vCd17ZlWRHEPO6bNaElPgaF0QnsUc9xRbNwGnX3xqKCMv1n5pSoZubY7iNHGMAVIWdSn
         Mf4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765450034; x=1766054834;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CTVWHQr8QqD4O3yE8paC6Rmoy43hLsT5yuKJw7dLA9k=;
        b=V1mjD2jJvx1EX4h6prAqM2xWjDWIZ1PXhN5okHzzPH+H4VT83Z3CLAF4XuPPDP0Gdn
         hIe1kFaL3vyuU2yYUd0ZBzm6E3MotfLYdyEefkNuH+F95CoBYPGVkrfH5JTpc7fg6efx
         NwQ1MU7ZklDDUFRfFAZyxxEmKmkHo+kRg5iZVqzIE3T6MW5woa6XtTojNQLGEekULGR4
         7MroyTTWULULekx4E+aCnGztwhBA7MfS83mxotcOUX3jVTYIxO1jnQI6y5URRBFM9Sou
         OMxv7BbFf7oURHHKM5bxoplYq1VjTnS2EgQBQ5Zf0NefRIKZg8LXEB3FTurbAR/Oq7HT
         GFnw==
X-Forwarded-Encrypted: i=1; AJvYcCWCur24CDlVXWHz2mIxTgUQBFtmvCv8conFVoNMjQnGTF4rG35DkSMvbss7dvYh7rpdqJ/0cw/jwBG3BLrRj2Qp@lists.infradead.org
X-Gm-Message-State: AOJu0YwSWlqRhblievY5byZKykLWfdIe8eJ/N0EaDvaomgEaH5HAYZbD
	yNNM91+Tot/IRV65vllHWWjD3pYTsv2dA4a3tQiZeO81iST2i1oe/7g0slX9Bd/qQe4SCk2QMCB
	Cmg==
X-Google-Smtp-Source: AGHT+IG9Wdc6xtUTDC6bCCBmVcC2gl7D2XJ0tfkZf2BkoPOzH02VeYq7F+cCcJyhuhK4THfPpeXXBJVa7Q==
X-Received: from wmjl2.prod.google.com ([2002:a7b:c342:0:b0:477:1022:3342])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b22:b0:47a:819f:3acf
 with SMTP id 5b1f17b1804b1-47a8375a9d0mr61731505e9.10.1765450034355; Thu, 11
 Dec 2025 02:47:14 -0800 (PST)
Date: Thu, 11 Dec 2025 10:47:04 +0000
In-Reply-To: <20251211104710.151771-1-tabba@google.com>
Mime-Version: 1.0
References: <20251211104710.151771-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251211104710.151771-5-tabba@google.com>
Subject: [PATCH v6 4/9] KVM: arm64: Introduce helper to calculate fault IPA offset
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_024716_297005_A4273C47 
X-CRM114-Status: GOOD (  13.66  )
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
2.52.0.223.gf5cc29aaa4-goog


