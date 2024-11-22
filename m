Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F118D75E25
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 11:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TmRVGUs6nkxwhsO2iucDTdvS5A9kO2wSDYZR/UjMPwg=; b=PpmsxHcEM6i4vUAcNyhr7UaUT3
	g18GFK3TAUV5UPnjAGSOqGGoPX5QMxJJ+ESJnERZpVRsBXvSyAX24zsU5Y+3848cIqxWVunCodA+T
	0gOjKHrm2z3v+DM1NxMaJmGIrLHzz54Mv/8s2RiAwaIgdOBk9S/03hcKpvnKEfZXdbpmBjeuJHxlu
	5n8Qoh9IN8fUSRwMgusA2fKBhwc8KLxuilFw2ijUrvOWfdyiNeSSMDt46Nj30ooiSAYz2QzXX8a1v
	30u2WeuVvjgSNwCH0fewhwyKIsHmTjMnORX8HL2jAEieuadSzSeA6ipWc9JPH1pAhKEl8lQIrDaWS
	L1cwvLUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tERgY-00000002LTC-3jwM;
	Fri, 22 Nov 2024 11:18:50 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tERV0-00000002JVr-25Cs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 11:06:55 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6ee6c2b65b9so33768787b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 03:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732273613; x=1732878413; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TmRVGUs6nkxwhsO2iucDTdvS5A9kO2wSDYZR/UjMPwg=;
        b=pfMvitR7DvKFf1X4LA2el+rtnlpH/uOSddR46eVr0FLPA44GEBmQfj3PzKOiYtnay7
         4T0gbmIK8ADl6058k21q27ZLsqbHnlpSuSZJ3qbTpgtm71j+65Sb36u+8Fp35DZdz8/A
         AnNqk9nTQ+Eutd3zzSOBMoZ2tSE5Mriicsy+DWB8OM3vDoB0/J5auDPiE3Et+Cw+UWcz
         Wj3WP+CB6c6lofuSnlCH6lc0D0wgJv870rNZzPa0C/P19U05kwnuhf9En8RlwlNwrg5P
         i8sZyG4oXElPW9yQgosKJcSIxecy8l9uYysP3pVykg4MtvssdAVbMSjIKP0QpcvxnnTo
         r3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732273613; x=1732878413;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TmRVGUs6nkxwhsO2iucDTdvS5A9kO2wSDYZR/UjMPwg=;
        b=oGSTfrwNOfwLuX6TLTRD6Ys3CqF/uj54K6T3Xif7fcEvmG4yXKLSMZzfaG+bvTU+JJ
         vCzOBYbZ5kRcnLxPq4Ho5iPRzAekZ1QDjPuSxTAn4J/knAlK/DNX736RjnM0HnAdJsto
         16b0WTGcG5C2mzXISwFLiV5p3l61nBtfy09sSgevG8g81B8RFOYebgcnfvHapSoHI15l
         0yB9QvEzuOImS4yVSemlt03QIwWIpyX1reKeqIsEjR4J9ZjgYowrcv7vi9rSt6KBIkZr
         8AmG95voUibjOJSxoRgbPZEcVPFZ3PsUIn/obOj0xoU7+xiST+IveCkru7qfdyNGES4o
         Ux2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU8W8Vx5yws5UHmi3VmVYpXcTXrKCb9UDT43a1nxtWo8dTY/wUVwJdq62cwcVRIh/fbGCg8fRNHqflDFZNuGxIU@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+lMEg8uHt4ExwfNR5v+zaHgHK26EhSP9s/Lx+lus3UkkhNYOd
	JRLXzfktbu/AFWs5KgjJ+tRm4hkPQytJJwVPFnxxeVEF+szEwnv+fmz6uJX5Hog9zimhJPgSDw=
	=
X-Google-Smtp-Source: AGHT+IFDY0g1fhzMzp9VrckEOC6u+svSMuwV073QrPa2hQhhHhGdZ5PW9AlHSxPAec4RYBV0SLxm6U1zdA==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:a81:d809:0:b0:6e2:12e5:356f with SMTP id
 00721157ae682-6eee0a3cd59mr62337b3.3.1732273612814; Fri, 22 Nov 2024 03:06:52
 -0800 (PST)
Date: Fri, 22 Nov 2024 11:06:22 +0000
In-Reply-To: <20241122110622.3010118-1-tabba@google.com>
Mime-Version: 1.0
References: <20241122110622.3010118-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.371.ga323438b13-goog
Message-ID: <20241122110622.3010118-13-tabba@google.com>
Subject: [PATCH v2 12/12] KVM: arm64: Fix the value of the CPTR_EL2 RES1
 bitmask for nVHE
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_030654_533707_8D429C27 
X-CRM114-Status: GOOD (  13.19  )
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

Since the introduction of SME, bit 12 in CPTR_EL2 (nVHE) is TSM
for trapping SME, instead of RES1, as per ARM ARM DDI 0487K.a,
section D23.2.34.

Fix the value of CPTR_NVHE_EL2_RES1 to reflect that, and adjust
the code that relies on it accordingly.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_arm.h     | 2 +-
 arch/arm64/include/asm/kvm_emulate.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
index 3e0f0de1d2da..24e4ac7c50f2 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -300,7 +300,7 @@
 #define CPTR_EL2_TSM	(1 << 12)
 #define CPTR_EL2_TFP	(1 << CPTR_EL2_TFP_SHIFT)
 #define CPTR_EL2_TZ	(1 << 8)
-#define CPTR_NVHE_EL2_RES1	0x000032ff /* known RES1 bits in CPTR_EL2 (nVHE) */
+#define CPTR_NVHE_EL2_RES1	(BIT(13) | BIT(9) | GENMASK(7, 0))
 #define CPTR_NVHE_EL2_RES0	(GENMASK(63, 32) |	\
 				 GENMASK(29, 21) |	\
 				 GENMASK(19, 14) |	\
diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index 7b3dc52248ce..6602a4c091ac 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -640,8 +640,8 @@ static __always_inline void kvm_reset_cptr_el2(struct kvm_vcpu *vcpu)
 
 		if (vcpu_has_sve(vcpu) && guest_owns_fp_regs())
 			val |= CPTR_EL2_TZ;
-		if (cpus_have_final_cap(ARM64_SME))
-			val &= ~CPTR_EL2_TSM;
+		if (!cpus_have_final_cap(ARM64_SME))
+			val |= CPTR_EL2_TSM;
 	}
 
 	kvm_write_cptr_el2(val);
-- 
2.47.0.371.ga323438b13-goog


