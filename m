Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA84C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 18:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cig4j4B59mGrHXUscIMbyQJ5aIiV+Rf6+4/as61+W8M=; b=x737Hc5AbchSfy67uhlhft8zMd
	ycJtfItrHI8anGIV7CPWcS/xQed0JagMfKp2EN0URfJVKfaKOF1XxRtpGavYT0NHGoe52Ic26qLIB
	imsNRQgqVN0a2gdSAYTzOwOxCYdllGZm/yJeqUG56Jaywix5ATHvtL+6tlJ+AKj8MSPMX076VH3O1
	N0dxhjocKQk26vaUUUYxkCvT1jg/9VAUE0x6IOUNc9CQ+lUxNgQBS/cvr/7Eag/1fmV5rxpc6Eh6F
	56UexIdbI5DxURL2NCVoVru+Lm/ejAAtKg4fzxfromojXZfYMXUL0OKk+r4LkOhngk5Nov0VoLs88
	Szlzz0jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57DV-0000000AWUo-18AA;
	Wed, 16 Apr 2025 18:10:33 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u578T-0000000AVDJ-1hyx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 18:05:22 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43d5ca7c86aso42327405e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 11:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744826719; x=1745431519; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cig4j4B59mGrHXUscIMbyQJ5aIiV+Rf6+4/as61+W8M=;
        b=Jn3rRv4+o3gSJsVDBGxFbgK9mwFDSRf2dD+ElMBSkO++7EY7FEvZ+D9fktfSw9hYw7
         9oiR08X+04e+MoVlG9VIKpgA+jY8oIh1G03wQjH40rfmxV/Lqy7xCilKXcLhw+sTKosU
         /HYp8lxXwqPlajlAoCbSZ26h/YQrkCrVLxK2bm7PNQcKF3fgFSWp39QbbBa9ZpBoot0G
         Ht3rM3m/vEoNC66lw+O1S/G3Yesc+gNJPfLm3C7u7tl7w/wFcS5twLfzMwWRCDYtdqls
         Zr9u9/cSJ3xKQV7nOJ4vRju5Mvl0s7YdcHVUhbaVO8ilWCmXTY7gOW6G2gWg1ufiBUQ5
         tISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744826719; x=1745431519;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cig4j4B59mGrHXUscIMbyQJ5aIiV+Rf6+4/as61+W8M=;
        b=jK67K7hmxnfgH8igkETg5n0a2taZc3Uf5AMkSI4pNIk5I6futAkyEE5iHX0r3p+a2X
         u5tC7pYg+zTJLbwBKysfHytl0XfDlH4nBDHgGgVVtxAGSEuJHb9eqxbnTM59NgvjsdzI
         8nK4cCa47SzxYzASVSYfrfB8Aw77fCOQan4h9CkPq6YEml6AY431A4/Cgkt6ECaB69DX
         gPOFlXQS0DLDyEU37xq990YZGFrsK/cs/zIhkl0v1ZHq3EsMn526SJGF8VJFasn0gXxM
         lLK9fFPjt1aP8E/KJleQS2GZbcBNBDim94KM+xclk/xuZ1ZLCrkZGwgzTjSybFVMHiHw
         A58Q==
X-Forwarded-Encrypted: i=1; AJvYcCX02EjNhj0nzXqQYzs12B8fZF8tWKfUGYN4/fQ0XZWVtJPXvtFE7+UiwKBkmpfsM76zGIRSVq0JM6wiGo42CFo/@lists.infradead.org
X-Gm-Message-State: AOJu0YwFYUG88DnSzvNOw5kAlT3T7KOqJ8VpyXCKJ/tGtAeFithEoLZp
	Irhf1HzwVy2pqI3U+KGhWmDj1id0r07Z5ErlygUIUBDpx23tDWcDvpsvQiRZ2vUEjLtNhjsXhP3
	RMB3zlNOssA==
X-Google-Smtp-Source: AGHT+IEiPUfN9S/47HXHkhZb5HxXPnfUW71Ci+ZV97xZnZ+QKkE230TNxvDfhI7LnVtAM5BZRKK50jEgq3SU8A==
X-Received: from wmhu10.prod.google.com ([2002:a05:600c:a36a:b0:43d:44cf:11f8])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c07:b0:43c:f616:f08 with SMTP id 5b1f17b1804b1-4405d61cdccmr26873015e9.8.1744826719680;
 Wed, 16 Apr 2025 11:05:19 -0700 (PDT)
Date: Wed, 16 Apr 2025 18:04:31 +0000
In-Reply-To: <20250416180440.231949-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250416180440.231949-1-smostafa@google.com>
X-Mailer: git-send-email 2.49.0.777.g153de2bbd5-goog
Message-ID: <20250416180440.231949-2-smostafa@google.com>
Subject: [PATCH 1/4] arm64: Introduce esr_is_ubsan_brk()
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
X-CRM114-CacheID: sfid-20250416_110521_445119_BE988409 
X-CRM114-Status: GOOD (  11.95  )
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
2.49.0.604.gff1f9ca942-goog


