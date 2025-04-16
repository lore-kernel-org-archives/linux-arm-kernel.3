Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7A8C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 18:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xO8p3wWnMTFzkHmEwWDOeYMg/xjqFsfP9HNTtGIh/qY=; b=pz3th65ZvDRSGmDwOZmyOGzfL9
	hi7lCMcbrEPdAiKbL1hGbwqjaPONKRFZtkSeirUr5wplR8x4JniQ/d0mWqFiYDiP9Z5O2jDK5o5ca
	LvsJPVL8hqzwzJWP1CfhsQnT6KYN6cYACl8QGNATCO+gLuoJqUDewjSGcgrx/st6SxEdue2NS8zSG
	Nh6xMGufvK8dUljsYXUiyTtu7LYTU7x9QtCh3Vw4n7sk+PsljgkrU4hYum5w91C8xz0o5WoxRy4AD
	zlnfkHSBfmJL06iTRNp6LFes4Q2HOOxdCWKdITWQdA9vA10FqtucCLBBxKZ97L0ePsziHxcv+nJgm
	loEpoKig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57Ix-0000000AXXL-1lFu;
	Wed, 16 Apr 2025 18:16:11 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u578Z-0000000AVGn-3PEb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 18:05:29 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43d22c304adso4551625e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 11:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744826726; x=1745431526; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xO8p3wWnMTFzkHmEwWDOeYMg/xjqFsfP9HNTtGIh/qY=;
        b=i9SfC+Y1sEuLbau/I6kzwaZjZuQ2/YBd4p4e6SkMAcRD4AuzWIw6SsjWOBlvsSiCCS
         Tl7y5L4K9JunOCHkAfu2YJHnhvcCXugRyATijVkxDPnXNV7EbuqWdGhnHF1Nd7Rb5Cxx
         CMzAaoXxzpqrAxi+vNr6YVypWEFj7OEIaSieFOyWm+iv4r4Kcqe2az/m8wLy7PTrhx5Y
         iIWxRojKNbrhilrhBbIAlFLDpNWJD0KLQqoweWG9/lm/zUqmW4a97bnoRJ27YjEf8xGd
         bU1K0nlTAU2pEyjME7EupKPwNIy7FyfRwTGvMmioOGwKrMYe4hLz027xRM9rJ1MsZn3J
         Mg8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744826726; x=1745431526;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xO8p3wWnMTFzkHmEwWDOeYMg/xjqFsfP9HNTtGIh/qY=;
        b=ZMjlqQ1vktHS2FpWQP51TcvIqjEGIG5hkXiIAorooNP0hqlGye/1BxlXbSbMNcYkpy
         6eiEQj1i/xBZvwWZhMvhcryanOJgmrSBqnDTlfcrBWkrMnA1nFF4l829u/sqf1xQmem3
         ZD1usXbO2zkCbYyRKfbmWKMsxUu36vdd/cX/tgXfofnfmRn+4oUeGjyTYatkJOigcBWw
         QvcToC/UqsRVqf94WyfmHkFPw3vYYlYcsvnpKx8W9ogQ4MTYCqMmGfPxjV8xUTWTwuAA
         8obAnGIKAT+KVS3mNpeEPPgnh5YAgtCZO14MtUhxBRWumvENXuAp+bi48IuZ/SMigRA/
         hqnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXW4ZYv6FHiTIzW8LDVk4hoa4VkLlZaLPv6XWqRfdNO/w+5ARVRN8YlQDyTCSi7zXlGk8SgtWO+TfiSlG2pBLL/@lists.infradead.org
X-Gm-Message-State: AOJu0YzaEWResiLCxKD77l57qE0oCdrMv8yj3gQnxv/ZnLWvck17li0S
	LAnNr40mBW1mtrMZnU0HygfNmJLBnLQUFBTHc7orwtdSsiPxN24/nofJOQv09nOUlEJpq5ZJiwI
	MtlB7sJXLMA==
X-Google-Smtp-Source: AGHT+IFu4srZxpATOjlO2rI6vko1n4XKZtERHwJbfnOezh1jE9LHVVBUHBqm8Y3anm1ST1HCKXtYf3N4xz9VaA==
X-Received: from wmbh25.prod.google.com ([2002:a05:600c:a119:b0:43d:586a:9bcb])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a4b:b0:43b:4829:8067 with SMTP id 5b1f17b1804b1-44062421bd7mr3209925e9.6.1744826726256;
 Wed, 16 Apr 2025 11:05:26 -0700 (PDT)
Date: Wed, 16 Apr 2025 18:04:34 +0000
In-Reply-To: <20250416180440.231949-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250416180440.231949-1-smostafa@google.com>
X-Mailer: git-send-email 2.49.0.777.g153de2bbd5-goog
Message-ID: <20250416180440.231949-5-smostafa@google.com>
Subject: [PATCH 4/4] KVM: arm64: Handle UBSAN faults
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
X-CRM114-CacheID: sfid-20250416_110527_848708_4B319701 
X-CRM114-Status: GOOD (  10.57  )
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
2.49.0.604.gff1f9ca942-goog


