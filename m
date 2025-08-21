Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E12CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 02:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qF0NqksTmsFEMXYPOijW2W+Po4z2kEGBRHxGZcBCgsM=; b=mCKqKd3FbiWEQ4xzx7Dec26urO
	TiC4V03+gqRIuYqAiCP8mwii2P6KGi8wcv6dS/M+GrHXS0ka/9KS9YJnoAK70wFzkdfTCF1zKjn0K
	maerDd0IGP6S2Tt5DtE931JkSK/XBr8KlsZ26uw2raq+UEgFO140TpkETgLY6gxF42Mq+EiglwQwM
	tWNeQi3aDE6GLk5t0zSe6YJVk2mM5FBAzJjQUPL3EN4/m/PNI7KZ8+CF4d+OCkhqm61QDbB5Omgb0
	2eOGEARgCAABGMl8v5c6olfdQC4aF1DyAfsRivI1vl5e/n4BWwxmNXeeNtDmzLmQG1oVvNfO+IB82
	ZrIA7S4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upHsT-00000001JkX-0zWK;
	Fri, 22 Aug 2025 02:51:41 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upCP7-00000000bZV-0Cpw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 21:01:02 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-246364842e7so2025265ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 14:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755810060; x=1756414860; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=qF0NqksTmsFEMXYPOijW2W+Po4z2kEGBRHxGZcBCgsM=;
        b=HI7Y1ZZKEfjZ65/u/ZjAMM6TgWtgn4lWvdcqV7Tpygkg/KqnxfF8k5nZsxbV+JwSwL
         xdUnFq1DJf+CRqIp2iYMsSk6zVXVEPcRcWR86veJUTCMMuxACJ73MZ0CKDr3rhf+qNRi
         blZJe/BMXkKz/JYStqr0RNvKVvHlMNQaWQTk7xs9BHn0jGcvTyc2Ar5zAiJIiw3a72R/
         1Lsp4+XmGfOg9Zd73fqc6KQAMl5UN8bFfqF/mmBSjDrkQH9bVbY/Z4ZkQzscai+gqH02
         WKd2JrMRj9Tt7PgAbLjkYX+0B03r5vNjdNH/me7NYpVBKNiQo1cKXpAA8lszQMCamiGL
         Tc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755810060; x=1756414860;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qF0NqksTmsFEMXYPOijW2W+Po4z2kEGBRHxGZcBCgsM=;
        b=DQhCfT27kEtx6giCpJK5TLkbfQEaE0pqO4hpTQl2js8/Hk8nOzETyj6XLlXQ4tiLg9
         4vmY/sf8l3XBkOl2K9oJtHqgX1sTlGRCWpdEq+HsUyU5rgBja0kfjAgFxmp6awu30YRU
         mxfZmKzNxZQh2+NEXZIoPlM6xzJ0pdVwZyNHY/GwGNVXozRCIlDhDYZN7vbicESpnEaX
         N29EPDm4FMdbYoFtj+qGUpNAdfy1MWlIceKePjWZ2x+BVh/fdpSdG2dnZ0i+G14GrOG4
         mQEEFqgskzXaLiKOxVxRFejuT+UZbGZa3POqAejAW8MTa/ecG5D3deBhLilVK00URjDf
         B6Pg==
X-Gm-Message-State: AOJu0Yy86sdpIBvcGwlsiZ5PLBg+XNKgp4eKEVa6WOaoJvSW83cSfb+q
	gtqziWLPmN2VjrJk6E3Lvh2FEiMDNKaRrkKCj8B362D9LSPoAx2fFIc+2UgbnZu9FAemfAd64oU
	hjYye3g==
X-Google-Smtp-Source: AGHT+IG5Izpq2Sl1N9Hzv50wRfJpmndOfATaks3Z+gYK79D4NeWWn/zwR5Uaz/7EA8M4H+pgD0lOKvSxa0c=
X-Received: from plgv17.prod.google.com ([2002:a17:902:e8d1:b0:23c:7695:dcc5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ce01:b0:240:52c8:2556
 with SMTP id d9443c01a7336-2462ef44433mr9049685ad.39.1755810059747; Thu, 21
 Aug 2025 14:00:59 -0700 (PDT)
Date: Thu, 21 Aug 2025 14:00:34 -0700
In-Reply-To: <20250821210042.3451147-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250821210042.3451147-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250821210042.3451147-9-seanjc@google.com>
Subject: [RFC PATCH 08/16] KVM: arm64: Add helper to get permission fault
 granule from ESR
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sean Christopherson <seanjc@google.com>, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_140101_089922_8822F9FD 
X-CRM114-Status: GOOD (  13.51  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Extract KVM's code for getting the granule for a permission fault into a
standalone API that takes in a raw ESR, so that KVM can get the granule
from a local copy of the ESR instead of re-retrieving the value from the
vCPU.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/include/asm/esr.h         | 6 ++++++
 arch/arm64/include/asm/kvm_emulate.h | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/esr.h b/arch/arm64/include/asm/esr.h
index e1deed824464..5bb99cfd184a 100644
--- a/arch/arm64/include/asm/esr.h
+++ b/arch/arm64/include/asm/esr.h
@@ -8,6 +8,7 @@
 #define __ASM_ESR_H
 
 #include <asm/memory.h>
+#include <asm/pgtable-hwdef.h>
 #include <asm/sysreg.h>
 
 #define ESR_ELx_EC_UNKNOWN	UL(0x00)
@@ -478,6 +479,11 @@ static inline bool esr_fsc_is_permission_fault(unsigned long esr)
 	       (esr == ESR_ELx_FSC_PERM_L(0));
 }
 
+static inline u64 esr_fsc_perm_fault_granule(unsigned long esr)
+{
+	return BIT(ARM64_HW_PGTABLE_LEVEL_SHIFT(esr & ESR_ELx_FSC_LEVEL));
+}
+
 static inline bool esr_fsc_is_access_flag_fault(unsigned long esr)
 {
 	esr = esr & ESR_ELx_FSC;
diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index fa8a08a1ccd5..8065f54927cb 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -455,7 +455,7 @@ u64 kvm_vcpu_trap_get_perm_fault_granule(const struct kvm_vcpu *vcpu)
 	unsigned long esr = kvm_vcpu_get_esr(vcpu);
 
 	BUG_ON(!esr_fsc_is_permission_fault(esr));
-	return BIT(ARM64_HW_PGTABLE_LEVEL_SHIFT(esr & ESR_ELx_FSC_LEVEL));
+	return esr_fsc_perm_fault_granule(esr);
 }
 
 static __always_inline bool kvm_vcpu_abt_issea(const struct kvm_vcpu *vcpu)
-- 
2.51.0.261.g7ce5a0a67e-goog


