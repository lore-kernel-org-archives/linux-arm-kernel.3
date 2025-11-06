Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B3ACCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 14:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hQotLZ7bYQhnw+F+e2EgZGDV56Lv1I3QeSzBHAS6ry4=; b=SjTjR4kA8inon0FQQqgTVRJpTt
	/2WV7IfZTVv0DfYDWdkl/S9JyMTdzPpBMzdJghRCXrxAZfWEoE/KYA1rydxV5DZ0cZNa3SiQGssE2
	Pm1KoA83t3YKM3E9VxU4Ow3tOzaW4oc/Yqbog7bIdwzdbL/BKG43PZVq8xcGh6UgVoZ8KSlKGZ86u
	TKlt+6tc7jjUaSyrN6ZnLC8sTargHFUsUr6v/KVKEopAj3ztOXsnSuI8J0ZpU/RZKX+qGxCYKUpYf
	XSmmRgeTm3T0gSkzePPp7P0jipNaic9feGKAx8bv0qgNEvD12ITQxQaWVFr/8eZrwp45Ik9XjoImd
	07da95Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH1Dt-0000000FiU2-0TtP;
	Thu, 06 Nov 2025 14:44:25 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH1Dq-0000000FiS2-2sE7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 14:44:23 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-471001b980eso8138825e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 06:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762440260; x=1763045060; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hQotLZ7bYQhnw+F+e2EgZGDV56Lv1I3QeSzBHAS6ry4=;
        b=MT/L9M1Su1WH5CCUxcENgTqGoVSruweWbli0oH9tK1+paf7A6eGZgrOmDZm7DhU4ze
         6Qxbvx8n0LkNAiUwpSNoH9H6I7uDIlbG0y6H0RIVYPuAzx2KzRBPaggBPNNwPO2TK6Tb
         AcQuVbwbrX2vfo7b1Iyrku1RDQgghlVCbDICIBRacmW+sZT3gt6POqh0oj8baYTDNUrw
         7tcf29OOSpJcAs7zvj5gVJ7kJFglzfd6WF4+hHmP1BK1T8yw9HY5RSGrhkvQzqlOugAK
         IPoQt7dgE4CqumSTIs0TCCc+sMWL8mMyHCsKNpiAuW+/+r9FFkBAIddVSgiEGm7AStml
         89rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762440260; x=1763045060;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hQotLZ7bYQhnw+F+e2EgZGDV56Lv1I3QeSzBHAS6ry4=;
        b=nQ1jDZ2hZ8HVwaHYvj3gfD9f0eZ8TlzeT7sgxHKgt7l4qwJvwR9vYWLd3Y+i4nk6+i
         pAPv5EWUcwF1YrHJfDHZOhyZGEu8hgP6wK5MK9V3+M1gz+OBfGW1FhgifARBjDxR5LuN
         X5vFbhwiNqYV+dZJVo4DkE5yFQw0b9YTzqIVNfOMqhVek2w1tD10lLofugDmLGzmzR8g
         MMGNbP/ZH7rTXa8ozrloSRqPgntjUQTJwIyNl8Mn351yNHhP0234vAJ12n2axMNDGEfD
         vf01QZN2gN9T5BZN6H/557vd3mabAjxSw/wJh39gqW11YUp2hHj8Eac8nEjUCNuXY14n
         X1vw==
X-Forwarded-Encrypted: i=1; AJvYcCXO0k72co9zN3PdqPyy8rBlWaPOY9+/gZW8rxff/hr34TFIX/8kN2hgBodwlWlzZQuVFgtfLphir1r7ruRalesi@lists.infradead.org
X-Gm-Message-State: AOJu0YydklRvVzbi0pAOSMncSBsnV8Z0lWO4y15jkTmMZgdmaBQfFIVb
	AQ9kIzLc1JjlqZjXJyJRI7IBue3DDGAkOmw3r7kk4lOUQFu+E3iTOmTkcvjgfHQLSrII9JD6lDR
	cKA==
X-Google-Smtp-Source: AGHT+IG54VtmRITeyRodrpFjnkmMn9aKcd2SfV26fNYyANDC22/WKNUNo00I7Z8tR3a3z6jTuMfxSnvpDw==
X-Received: from wmfu16.prod.google.com ([2002:a05:600c:1390:b0:46f:aa50:d716])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:5291:b0:471:9da:5232
 with SMTP id 5b1f17b1804b1-4775cdc8eb1mr74506725e9.15.1762440260497; Thu, 06
 Nov 2025 06:44:20 -0800 (PST)
Date: Thu,  6 Nov 2025 14:44:14 +0000
In-Reply-To: <20251106144418.2847443-1-tabba@google.com>
Mime-Version: 1.0
References: <20251106144418.2847443-1-tabba@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251106144418.2847443-3-tabba@google.com>
Subject: [PATCH v2 2/5] KVM: arm64: Fix Trace Buffer trap polarity for
 protected VMs
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_064422_731873_311A53AD 
X-CRM114-Status: GOOD (  12.82  )
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

The E2TB bits in MDCR_EL2 control trapping of Trace Buffer system
register accesses. These accesses are trapped to EL2 when the bits are
clear.

The trap initialization logic for protected VMs in pvm_init_traps_mdcr()
had the polarity inverted. When a guest did not support the Trace Buffer
feature, the code was setting E2TB. This incorrectly disabled the trap,
potentially allowing a protected guest to access registers for a feature
it was not given.

Fix this by inverting the operation.

Fixes: f50758260bff ("KVM: arm64: Group setting traps for protected VMs by control register")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 8d06a246dfd1..f6f8996c4f97 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -118,7 +118,7 @@ static void pvm_init_traps_mdcr(struct kvm_vcpu *vcpu)
 		val |= MDCR_EL2_TTRF;
 
 	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, TraceBuffer, IMP))
-		val |= MDCR_EL2_E2TB_MASK;
+		val &= ~MDCR_EL2_E2TB_MASK;
 
 	/* Trap Debug Communications Channel registers */
 	if (!kvm_has_feat(kvm, ID_AA64MMFR0_EL1, FGT, IMP))
-- 
2.51.2.1041.gc1ab5b90ca-goog


