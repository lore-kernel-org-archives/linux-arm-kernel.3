Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8FAC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 16:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZqTf0w984hWi5llfvtlyawmZ56xQei2ohDzGa9Ujg2A=; b=v5ExjZQZ2O7PbbynSqMSM9SZlC
	X8SS88HIBjZadZuhuYxQ3PiiiHueW0+4or5j78hfJlBGshvkdqc1X2EM+cABQh2FwVljQ4cCnppIC
	HSWFxaOc2DHljq9Me6ak0BJYHoAdBILqEYucRt0CcpGkT2domKxvufF628Q8gfxi5rQJbO6cXupG/
	vMDQ55PrcG6R+axSBrxr5wi7iKZ2BMgO/NJJ61PxEhtejtrbSDNgOD36pO4aLkvKCykIy4Th4sUbs
	AE7FoPqYTWfqOqBy4kOc5OYk4LnpxiJtbQ7ytU8fNGiooYFMjRr9KkPK/oG4y6A38PID3O7Ua/rpK
	sx5GQLEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAARh-0000000DSOk-22lJ;
	Wed, 30 Apr 2025 16:38:05 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAAHW-0000000DR61-0Ibm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 16:27:35 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43d08915f61so38923875e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 09:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746030452; x=1746635252; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZqTf0w984hWi5llfvtlyawmZ56xQei2ohDzGa9Ujg2A=;
        b=JC6Kq9YSnWQFTg57fvMbejxKtPw1R6Z/OASExxwZFaBtqXes42kS9xRCDb/8UiOioN
         uHXptb6zl0STo+6z/REEL7anwO1qNDvxcUqc0y0wkjH8YGJrb5bST2sPi8iV3bLGF6Vt
         8U77oS15Lbt9yqwTNNlZLb1xNYZK7unQuYdag+a0ZvbWUHLKj0k+HPUCl593g1ybpiAc
         9d+jzIfJPwwdqG5fJcyJgNX+XlQGsy1JZq0BJyvKoBtz0OUdQ2jRFlpej5AKKtfNr2fy
         R3f3GBsVoYJ0e+RZUC8QnqPIqMgrfyRLtvC2ErQrj7zzfQ97y80swcsytMnyzOOUbIWG
         r6pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746030452; x=1746635252;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZqTf0w984hWi5llfvtlyawmZ56xQei2ohDzGa9Ujg2A=;
        b=K2kRVkVIHh9rR0OTF0QZRcdInhIiAYUy7USRr0FPIUeErKXZnsooJ2lpOTu3FN+LIa
         XzvpiRX0KX9nmvS6f/nFekr4RaWOIgBN90+6HtiRo4pFYmC4DapbX9blTGCFIEKAcZqJ
         lhwQ6zJmrgv8kPmE3x+6DUQcePP3GH9ns9shDmxAx4hq5nItlrNqbziKo0NO8jGKpcRY
         Dtw8H7hzQdrLFAQ2h1UAgfJMhAg47nAFU6TvJy+x9tmDCM+neoeLbe6VCLZVZ7jYVNJw
         2STyAp5ZXKp25MBsAmuqVQoRE5TIyf7xA2H1Ji2hj3P4elOI9qWY8cWRto9NKaekCDrX
         spWw==
X-Forwarded-Encrypted: i=1; AJvYcCWe5a7XTVuN/iq0GEH7QMx0UM3BPlXu9Fm+9w9jUTPf1KkdU985tPrwtWV8ST4xxHGCXyYX1+f5YMuCIcYsTAq2@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv1ai5WjTfQJPwh7PtJDIl+80TW7UONkLFm1BUiNonv6ls5Z8B
	iMzCpMX5NW04PuChrTlVoeT8eRerpIGluhUSbtSl2DVz6APSN5uCtDQfcFxkVDU5cKpW2wOMNxu
	HZkF7C+2e+w==
X-Google-Smtp-Source: AGHT+IElx2K4Ydzexiq6oj60bHV5vV1dfYGpgIOCHldmU1tuiZbYiGFH3YyV8uq6opoqtz/pcuka5AJ5zvQ7LQ==
X-Received: from wrp29.prod.google.com ([2002:a05:6000:41fd:b0:399:71d8:5e84])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f4e:0:b0:3a0:8712:5983 with SMTP id ffacd0b85a97d-3a08f7d1a1bmr3354676f8f.51.1746030452526;
 Wed, 30 Apr 2025 09:27:32 -0700 (PDT)
Date: Wed, 30 Apr 2025 16:27:11 +0000
In-Reply-To: <20250430162713.1997569-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250430162713.1997569-1-smostafa@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250430162713.1997569-5-smostafa@google.com>
Subject: [PATCH v2 4/4] KVM: arm64: Handle UBSAN faults
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
X-CRM114-CacheID: sfid-20250430_092734_106245_D5A8033B 
X-CRM114-Status: GOOD (  10.93  )
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

As now UBSAN can be enabled, handle brk64 exits from UBSAN.
Re-use the decoding code from the kernel, and panic with
UBSAN message.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/handle_exit.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index b73dc26bc44b..5c49540883e3 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -10,6 +10,7 @@
 
 #include <linux/kvm.h>
 #include <linux/kvm_host.h>
+#include <linux/ubsan.h>
 
 #include <asm/esr.h>
 #include <asm/exception.h>
@@ -474,6 +475,11 @@ void __noreturn __cold nvhe_hyp_panic_handler(u64 esr, u64 spsr,
 			print_nvhe_hyp_panic("BUG", panic_addr);
 	} else if (IS_ENABLED(CONFIG_CFI_CLANG) && esr_is_cfi_brk(esr)) {
 		kvm_nvhe_report_cfi_failure(panic_addr);
+	} else if (IS_ENABLED(CONFIG_UBSAN_KVM_EL2) &&
+		   ESR_ELx_EC(esr) == ESR_ELx_EC_BRK64 &&
+		   esr_is_ubsan_brk(esr)) {
+		print_nvhe_hyp_panic(report_ubsan_failure(esr & UBSAN_BRK_MASK),
+				     panic_addr);
 	} else {
 		print_nvhe_hyp_panic("panic", panic_addr);
 	}
-- 
2.49.0.967.g6a0df3ecc3-goog


