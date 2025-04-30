Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0573C3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 16:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Cc1UFbHiSntYShVPXAcoplaHQWwRkP8Qvo8LnShWWI=; b=dDQNbebyc2rnYSEj2ps7b2+dqx
	CPdK4F8zGZXXON7kYrzGzcaUgi/nvhfJekxD+6XT4SuqI4TI+3HOAoeOkTHsGQZcBmzCApA7vedXj
	SDOrU01lNinkty/lJE+BeqUSjZV6F2sH9fZqAJNLx7xju/C2++RWQbLYI7mkrJX5hdFlQitQAxqpI
	oPIWZ86K5rzqxCjkLes9Tj1FKnrBK3yTjqCwvxbHShTDay+5e32hYflzJ3i0/f6BEUC5TTzit0lr2
	myZndXUd9HEq1jPuShf5++vf3kh9VJAXTW6DuXypcOaZTK2Nbn2KYKS9/WHpFpGmtlDeZACG74ajx
	e0DH21Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAANu-0000000DS0Z-0SbG;
	Wed, 30 Apr 2025 16:34:10 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAAHP-0000000DR3G-3jF5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 16:27:29 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3a07a867a4dso2494658f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 09:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746030446; x=1746635246; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Cc1UFbHiSntYShVPXAcoplaHQWwRkP8Qvo8LnShWWI=;
        b=0zWY2SqrgfV9LqN3Bm7dqA1XM81QhdJpS32weOnz7KdfJXXiUkAxO2/euOFIZZV2a9
         D0fGpN/KnBD+wCV1EPdjeUaTiOlsyuQZDLClvEeLCGZkX/uT+mPnJOniF+Ym8lGGrbQA
         tfsHHnypY27MbHshiB87HWhcx2mkDYmyai1jAaoSGUTjrCQQBtgCx9fNo/aP33dXWZJi
         1ptKnENRcOeK0Jvn0xTyeVuPwXlEo9huWdWbcZ+FijTK3oQLMBVjcsAEjn0/X9tOHx5q
         2w4Dy3HY/XhblLaTWVPJrP0tj4D26jMVzZZ908uZgYGU8HQMYz2gn/f5GaqCxGi5tMg4
         MSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746030446; x=1746635246;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Cc1UFbHiSntYShVPXAcoplaHQWwRkP8Qvo8LnShWWI=;
        b=AQjoDeeS1hl1qXi/kkTD23O852HxEQt/InNq4Sh/Om6JnZI3ad6WralNpj4toxInkq
         T4zrW5obU4qvOwryJ1bIkBNAvVqHTTUymaeUTBppPJslQTqizNHbUNsz5/6frLfZ4hZ/
         ufSSV03NOLjX5068vKG1VVuOiAWVtgAEX2/GV77YJj/at/hSw6XxQReTUHLH6cA/opGc
         mraBeHXSTCJOkYwuED7lCUf/EWCCBWLAlEjbGnjpb173p0cQDyzrp63O2/nwFOTXmFdT
         xSCnjBtiIVqHR7Sk/DqucOUPHT1S8wfUNSUmyfccP82lkdh6Wpdsvw6Grb7n7EPECqI8
         9FCw==
X-Forwarded-Encrypted: i=1; AJvYcCUZ9Q6K105Cf71DIbhPYos9CgLHQpXmRPFWvi6UFEOA/qZzH1Sahg81B3gITU1m1grYiVS4Q7nnv1Nut14YBhpp@lists.infradead.org
X-Gm-Message-State: AOJu0YyZfm36jT5kX1F4yPE/Bx+DAu8klqak48rVyfw1gnscgm/hr8Rg
	ryzow1v9vy8/escA5qrdyTZBNhuQdy8Y64HODte18wnZuZso8vtn7LAgiKdFHnmZC4kJdscqM77
	2mixLTkYJUg==
X-Google-Smtp-Source: AGHT+IHDzYZhWgLNGxcyelrM4O2AAV3CEZWXJdSJ7SeEaiIFmtJryw2vi0tu8g2u+0VnUpRP7QxKQEtc5Ig7EQ==
X-Received: from wrbfu6.prod.google.com ([2002:a05:6000:25e6:b0:39a:bcee:e7a1])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:420e:b0:3a0:847d:8326 with SMTP id ffacd0b85a97d-3a08f777d82mr3895576f8f.25.1746030445844;
 Wed, 30 Apr 2025 09:27:25 -0700 (PDT)
Date: Wed, 30 Apr 2025 16:27:08 +0000
In-Reply-To: <20250430162713.1997569-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250430162713.1997569-1-smostafa@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250430162713.1997569-2-smostafa@google.com>
Subject: [PATCH v2 1/4] arm64: Introduce esr_is_ubsan_brk()
From: Mostafa Saleh <smostafa@google.com>
To: kvmarm@lists.linux.dev, kasan-dev@googlegroups.com, 
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	broonie@kernel.org, catalin.marinas@arm.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, kees@kernel.org, elver@google.com, andreyknvl@gmail.com, 
	ryabinin.a.a@gmail.com, akpm@linux-foundation.org, yuzenghui@huawei.com, 
	suzuki.poulose@arm.com, joey.gouly@arm.com, masahiroy@kernel.org, 
	nathan@kernel.org, nicolas.schier@linux.dev, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_092727_925469_3C5180CE 
X-CRM114-Status: GOOD (  12.22  )
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

Soon, KVM is going to use this logic for hypervisor panics,
so add it in a wrapper that can be used by the hypervisor exit
handler to decode hyp panics.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/include/asm/esr.h | 5 +++++
 arch/arm64/kernel/traps.c    | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/esr.h b/arch/arm64/include/asm/esr.h
index e4f77757937e..350f02bf437d 100644
--- a/arch/arm64/include/asm/esr.h
+++ b/arch/arm64/include/asm/esr.h
@@ -440,6 +440,11 @@ static inline bool esr_is_cfi_brk(unsigned long esr)
 	       (esr_brk_comment(esr) & ~CFI_BRK_IMM_MASK) == CFI_BRK_IMM_BASE;
 }
 
+static inline bool esr_is_ubsan_brk(unsigned long esr)
+{
+	return (esr_brk_comment(esr) & ~UBSAN_BRK_MASK) == UBSAN_BRK_IMM;
+}
+
 static inline bool esr_fsc_is_translation_fault(unsigned long esr)
 {
 	esr = esr & ESR_ELx_FSC;
diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index 529cff825531..224f927ac8af 100644
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@ -1145,7 +1145,7 @@ int __init early_brk64(unsigned long addr, unsigned long esr,
 		return kasan_handler(regs, esr) != DBG_HOOK_HANDLED;
 #endif
 #ifdef CONFIG_UBSAN_TRAP
-	if ((esr_brk_comment(esr) & ~UBSAN_BRK_MASK) == UBSAN_BRK_IMM)
+	if (esr_is_ubsan_brk(esr))
 		return ubsan_handler(regs, esr) != DBG_HOOK_HANDLED;
 #endif
 	return bug_handler(regs, esr) != DBG_HOOK_HANDLED;
-- 
2.49.0.967.g6a0df3ecc3-goog


