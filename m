Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EF4C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 14:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Wd5pQO4TMLiiStgKcNv1qG91igXzuOqB+CW/7l3oonI=; b=Z3QdNS9LPAboyqC0wQlA2xqvF8
	/sooY4CVojqRGnK/YF35GK1fLBiL4SrP/Cz9Y3ziwIX7viDfaWDEkwQX349Y9QbcSwV6LyDgpMxbU
	FjTa4JmRqtjKzqYLx+/j5KDfdVWR/BZmQyeKwjqUURY1JqpO8B1HJ1xK6TSUrPPTRjaWfBcpLKRva
	KJLRY/RnXfwEfbGck2Np6vmDzwlwSSMxELyE31fpspoK7TsrD1gucTzMpRQdZKg7sv3dz6WAEPslR
	q5/ireLHs+DhSABSrP+R7Cy8iWO0ykMj3WxbHmkB1EY1Y0mI+ZJg39t9ZwAgR059tx1hGCPiUoU2c
	qkqsF66Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4KC-00000005prZ-0wZA;
	Tue, 24 Jun 2025 14:08:36 +0000
Received: from mail-ej1-f52.google.com ([209.85.218.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3C5-00000005eiY-2TT5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 12:56:10 +0000
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ae0a420431bso192862466b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 05:56:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750769768; x=1751374568;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wd5pQO4TMLiiStgKcNv1qG91igXzuOqB+CW/7l3oonI=;
        b=JVLR4TFA5IxJSRlUkQZCHAJR962WrlGCfoVPS/KxiYBD9u2AMIy4D3zoG1blvckG88
         WBnooc6z4jGVERLxvdNDiIRYJMgxP7M7SAHWzsSAbro0DG+dtdmzlP1eqxCpM4ICqp6e
         UvcjxhP+YBCw2bpxgNh798UtPI0lofaKcdjMNN6//ISLHAUGa0f4y+r41s0glRQSJxjs
         kYA0dz4x665PDxcC6/ka4iXzQVGcMMKZIb45r+dWWltodjInVhob04t765RheFmE3gWk
         XDlMRqEMIC2z9wV1qf9xwpazbmdPvVphbHE0PgA04lOUBiFG6Zo3g47rTFMQq3usQcUT
         0V4g==
X-Forwarded-Encrypted: i=1; AJvYcCXKjtq2mibJaUsDIyyWq+wQ44NXGiDhm1jpGu1hIhinoknlBz+kaThLuLZ9plD7Y5x9rQkuFSb1WKIZEHfZ/c8k@lists.infradead.org
X-Gm-Message-State: AOJu0YxKqkyZo/ENabZTKJQeQjVx2a4UUxxIDxHhbG618XsTV6u3nOhy
	+2SZD1unytt2cgo07wl5dejDogzawXZ6JU6q9ybYOk17cROqX3HnQaJH
X-Gm-Gg: ASbGncv44iGHb2of4OxpvRk806QAGgCNCRQnljk83fe8k35RyTJOYDSMnpQYiaqlMfm
	1ZgVBJ7zahEJxmBmqV5Fiy8wwJ+zffilO8ETapHs1ijWb46LW0SaFWjnWIeUlTTBa9kiJTnu0vb
	MTxTGYkairPSSaDlpDO/iE/zetKfl+6qVmma8Q/2IQThAMZdWXtVFUJe4H3b72pX8+r71XV+ohH
	dGaHvpchxQtW2fXQ434JgdeSaz1ooNQ0U1DoUlG+aYKaC2lfdBmEM25LPRR7GWmoPXgkjJHplkq
	6FGmLoSEfDGeAeyJ847KA9qAmV9MnY3vaBgqWZU+mouyDifKWBfo
X-Google-Smtp-Source: AGHT+IFQFiDas2wGVOeEugta8Qce/28uCIIlkNQljybIhHbXyMiUBS5KHiP7ubJnsUoLTyQUFBS21w==
X-Received: by 2002:a17:907:1c95:b0:adb:449c:7621 with SMTP id a640c23a62f3a-ae057c0f672mr1747686066b.29.1750769767663;
        Tue, 24 Jun 2025 05:56:07 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:3::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ee4e32sm887089266b.57.2025.06.24.05.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 05:56:07 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
Date: Tue, 24 Jun 2025 05:55:53 -0700
Subject: [PATCH] arm64: efi: Fix KASAN false positive for EFI runtime stack
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-arm_kasan-v1-1-21e80eab3d70@debian.org>
X-B4-Tracking: v=1; b=H4sIAFigWmgC/x3MUQqAIBAFwKss7ztBV+rDq0SE1VZLZKEQQXT3o
 DnAPCiSVQoCPchyadEjIZCrCOMa0yJGJwQCW65tw97EvPdbLDEZP7jJsZWR7YyKcGaZ9f6vtnv
 fD9I++rpbAAAA
X-Change-ID: 20250623-arm_kasan-3b1d120ec20f
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: usamaarif642@gmail.com, Ard Biesheuvel <ardb@kernel.org>, 
 rmikey@meta.com, andreyknvl@gmail.com, kasan-dev@googlegroups.com, 
 linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-dd21f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1774; i=leitao@debian.org;
 h=from:subject:message-id; bh=cuqvs4eld47kMpQxlX4a66Aj/+sUNQEviegQV4TglH0=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBoWqBmoaEGY0Co/p8xMQtpfpmgTuCHGkMlV+q1t
 BKsgyWtbl+JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaFqgZgAKCRA1o5Of/Hh3
 bdsaEACmyscWIr3t0MIMFNGraHzVh9hvWTV6na3q1m1afnri47yEjl/+kME4vBNnvroir2ynG0o
 Y43r5iaBwxaB+URpN5iCHcqktnhCX+w9qeN5okvTo5geVnjQrgFpSugkrStqVd3XUXJZWecP1H5
 sVhm16coRcXJSbz6rOjRtVwqNzBpxQ/fYZgOl9II7k+0zFaozXqkQ29462BozXBcp5R/eFu4Qo8
 qNQUC8tsSoqRnpM6vDagP2r5evpSs0bLwTVOjGCBE4zKepqG/4j9RHr2McXgcvb5VNVZI1OlG1j
 BFLL1ktHmWDk6ZrupaSsyzAh3OX/5cdUV8T5aBmfwm5/sJyjEwfgIfXVX9M7Hp+O7rylnmmlxg7
 CcSVzlO17MxtNxxMnSEVLNl41jg6F8fLfeAp6CG0g/N3B0bkzhvdGY6MfuxTSluItEWXtvngiNC
 1VFdvFY5DmwguLAjouudsLTWjc2wOqPcbykPU1VKnXsWnBcJHk4YkyPKhSD2Qc7ekZw6R/vwzVR
 7PGD67q7uND0Cw0I2De5hyNwzlVZwGoDqpdcOF4B9aUF6K3isQGWvvCub/2UXA4WmErmJAeb8Z/
 XikwCGchi6d+NARnAxUtFoPQU+7bhUk2tkfoZFui0qvjOKWPmW4D+lOYzBANctlEbPhz6Y4iAl9
 1cEzMc/LXEis8Sg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_055609_635916_414D0888 
X-CRM114-Status: GOOD (  13.09  )
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

KASAN reports invalid accesses during arch_stack_walk() for EFI runtime
services due to vmalloc tagging[1]. The EFI runtime stack must be allocated
with KASAN tags reset to avoid false positives.

This patch uses arch_alloc_vmap_stack() instead of __vmalloc_node() for
EFI stack allocation, which internally calls kasan_reset_tag()

The changes ensure EFI runtime stacks are properly sanitized for KASAN
while maintaining functional consistency.

Link: https://lore.kernel.org/all/aFVVEgD0236LdrL6@gmail.com/ [1]
Suggested-by: Andrey Konovalov <andreyknvl@gmail.com>
Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 arch/arm64/kernel/efi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
index 3857fd7ee8d46..d2af881a48290 100644
--- a/arch/arm64/kernel/efi.c
+++ b/arch/arm64/kernel/efi.c
@@ -15,6 +15,7 @@
 
 #include <asm/efi.h>
 #include <asm/stacktrace.h>
+#include <asm/vmap_stack.h>
 
 static bool region_is_misaligned(const efi_memory_desc_t *md)
 {
@@ -214,9 +215,11 @@ static int __init arm64_efi_rt_init(void)
 	if (!efi_enabled(EFI_RUNTIME_SERVICES))
 		return 0;
 
-	p = __vmalloc_node(THREAD_SIZE, THREAD_ALIGN, GFP_KERNEL,
-			   NUMA_NO_NODE, &&l);
-l:	if (!p) {
+	if (!IS_ENABLED(CONFIG_VMAP_STACK))
+		return -ENOMEM;
+
+	p = arch_alloc_vmap_stack(THREAD_SIZE, NUMA_NO_NODE);
+	if (!p) {
 		pr_warn("Failed to allocate EFI runtime stack\n");
 		clear_bit(EFI_RUNTIME_SERVICES, &efi.flags);
 		return -ENOMEM;

---
base-commit: a3e9ee4ad433efad9c172d5fcf63ff39b61c902f
change-id: 20250623-arm_kasan-3b1d120ec20f

Best regards,
--  
Breno Leitao <leitao@debian.org>


