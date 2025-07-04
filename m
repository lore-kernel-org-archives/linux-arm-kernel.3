Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94EDCC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 12:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TmBJIHqOp4ler4vBmcjf5ac2fSEeELNLUvkG6S/lhig=; b=Z+5s20uWTALYS4sqXFL3F2lHja
	gMMZURrYVCpxOS6Wty6R3kKtvrSavkY/VXFxn5TQbpwETbotqJA0g8+1FBuSU3uWVgpJWMif6ej5c
	ZtXtZDWFm+KTynA4JCntqTDOJEP4SbjmH3Ig6k2pBAWAwV1GZxWa7J1O0oYzJI1a4SM6HGl1qNZ8Y
	hfCuCtkQD8snyT3udhCRV7kHdpyswVSGlMxiJ56IohGdyrsIN0BqvIAc8BKXWSAdnJj4144NySQeA
	J4AAZ2MW4DEdL3DIbK7IrAMxXBK7YJRmUmx220BhMVav77ws4+KPnH7dDDNixtr880uG4fEzQ75ao
	JVfHC70A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXfrQ-0000000EQZA-0SNJ;
	Fri, 04 Jul 2025 12:49:48 +0000
Received: from mail-ed1-f50.google.com ([209.85.208.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXfp3-0000000EQGD-285S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 12:47:22 +0000
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-60c5b7cae8bso1461166a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Jul 2025 05:47:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751633239; x=1752238039;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TmBJIHqOp4ler4vBmcjf5ac2fSEeELNLUvkG6S/lhig=;
        b=bbL1GQWkFElELmfQ1zSzZ4KxGtZuQqilFCMrCOFvjaA9Tu7zNiQ0ULAXCRw36LBNiQ
         QvVGS7u2RgZVwhlAkf3Vm8Q4Yi+gJEHDRxXV2zaxvqvKWSzrCkwZtkF0P0pt7ng+pdIn
         d//EuKZtRmpRZ9Vmmp6fl4eh8aV0jQtvSTA0+EBu8kYLrUzUupjqpGDrx775zYL/l5OA
         CmwDf5vwB0kY4cADpoAeXYEbwUPv0qDAuOUUAjPL8o4tmkj5EPiFUYWALET1uQK96S5f
         syLTW8D+Y59+WGroAyGzV78VDWNMsXZc3lmO6eQo7N2b4IUyPTOvdUIeSjcRbJgpthd8
         KW6w==
X-Forwarded-Encrypted: i=1; AJvYcCXd/3B6PigxfdtwtFoFkav1pS3cC1Cg0cXR27AYD7FlFhYZGSDIfzaBmlH9vh58D6JmI/yaCshZrxD1+lnSI4BA@lists.infradead.org
X-Gm-Message-State: AOJu0YywM4VLzPzOLlzoYrq0A6YdwUv/6TbF1EblmODZKoRtRCR9+zD8
	i009fxYvyIcNeJ9DTxm4H4uVQmfpFAs6lwkYv1e7+yD9qMqU3hANQdFd
X-Gm-Gg: ASbGncuODKsed2wsCoz26ktMWAHQcTY6O2UNdX8NtQT0lkuazWs0wFUnQVWTGxtPhtT
	sicpgUYRA+5GXL/skaeHtdJCAIVD3jZaN6YnORGGSdEnhY6X/jfq6u3jNPn5w6hul9NJRC1WNPB
	lU/7YXZ7kRJ0do18Zjxxi4y3hjEBMKOqwrMGYyc8D6wuKO/+H0ZOsG323LlbFNkb2OilkEkQoEi
	tVWjc9X6BKg3kq+IxZQaTQpiZWyCam2QfMPx7CUvxR+doufwAV2mpvJsRbpvh/v6Frli7ygND/f
	jyDGw0EtEx/kyx95adKq+A11oJxy0J9GNNpDKajUm+RPixX1J/8Caw==
X-Google-Smtp-Source: AGHT+IGY5NR0TFPMOMBYaRv+wFU/0enDu6wTkrwt9iQwPL63rdfAnrB6Pk0nVOpnxHAZOBwFtJRTog==
X-Received: by 2002:a05:6402:354a:b0:60c:421f:1357 with SMTP id 4fb4d7f45d1cf-60fd30d0fb5mr2017145a12.13.1751633239231;
        Fri, 04 Jul 2025 05:47:19 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:73::])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fca695d66sm1295796a12.17.2025.07.04.05.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 05:47:18 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
Date: Fri, 04 Jul 2025 05:47:07 -0700
Subject: [PATCH v2] arm64: efi: Fix KASAN false positive for EFI runtime
 stack
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-arm_kasan-v2-1-32ebb4fd7607@debian.org>
X-B4-Tracking: v=1; b=H4sIAErNZ2gC/03MSwrDIBAA0KvIrLXopD9c9R4lFI2TZCjVoEVag
 ncvDRS6fYu3QqHMVMCKFTJVLpwiWIFSwDC7OJHiAFYAajzoI3bK5cft7oqLqvMmGNQ0oB5BClg
 yjfzarmsvBcxcnim/t7qar/6W/d9SjTIKDZ01Od+Fk74E8uziLuUJ+tbaB8eBScmjAAAA
X-Change-ID: 20250623-arm_kasan-3b1d120ec20f
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: usamaarif642@gmail.com, Ard Biesheuvel <ardb@kernel.org>, 
 rmikey@meta.com, andreyknvl@gmail.com, kasan-dev@googlegroups.com, 
 linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, leo.yan@arm.com, kernel-team@meta.com, 
 mark.rutland@arm.com, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-dd21f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2078; i=leitao@debian.org;
 h=from:subject:message-id; bh=nHYuH6tChVt5qIWjfOe/wW/MwpJhNrg5zTlmP7KwkUg=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBoZ81VFvHF7PJ6tVUQPcHhUtDROIBPyQcmYm6JZ
 GUZHPerTDKJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaGfNVQAKCRA1o5Of/Hh3
 bYrbD/98qZZ8aLRXNLcokbh0chd6hghgMJY2Hz9GIVuk8KR71cJ09i9ySDkQqp2H1C61uWz+Eq2
 bD8FgXQTheK9Q29T5Xk6sMWGeE//NWZbj7vIjNyMWRdZODE5U4we0rvzLte8OD+4jLhICAozmIk
 OYkDIvz5tk6E99tkHyNwJ8od3UBRXBgsjuKvLhuuQZNlhtw7qvAjMHo5mKkPMUpuLZ1KBbWbIFx
 b7/bp0LBn05ZwX+ditk6pADUXYhWii2nxsoYqrQV8+q8vCcUgtvPBLBjSAaOcO3TVS6n7KOO2w8
 YKQG1BoHsdugXN6mPUhnCzcb2mVZD5ropVSH0s7p1kHVOiKGCiCQ0+hgJ4S8j5Cs0S1HvXn8bSk
 03j2TgoZUyPUFw9LNqOp0KLsk+Xxu4tCzYqa0EX00Fk7CvLhEVY4ulc+RClJ+c9drHUaJjXTWfn
 3itAPTWWQjVyo47oYEC+gPqWVk2f4xIqMNEdT8JWvCXrzzscqFAwylFhkH5kSEsDWIZ+1jsbg/a
 OlgL99AjUboOO1kCS9TJ6jOh4DWANwUmk7xjxDL0j1EIMlWhd4ecEbz3Q0QV2c80eVpDkcPqFUb
 uV23K5ppxBdzKmtBkcCjHyOzFYDGFjcDHnj9nSYODDAJelUnnDLSFK5RxoGzOhEdY/IxWrfysdJ
 fDr37mZQNUeJAUg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_054721_550956_5984C5D2 
X-CRM114-Status: GOOD (  13.15  )
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
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Breno Leitao <leitao@debian.org>
---
Changes in v2:
- Clear the EFI_RUNTIME_SERVICES in efi.flags before returning (Mark/Catalin)
- Link to v1: https://lore.kernel.org/r/20250624-arm_kasan-v1-1-21e80eab3d70@debian.org
---
 arch/arm64/kernel/efi.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
index 3857fd7ee8d46..62230d6dd919c 100644
--- a/arch/arm64/kernel/efi.c
+++ b/arch/arm64/kernel/efi.c
@@ -15,6 +15,7 @@
 
 #include <asm/efi.h>
 #include <asm/stacktrace.h>
+#include <asm/vmap_stack.h>
 
 static bool region_is_misaligned(const efi_memory_desc_t *md)
 {
@@ -214,9 +215,13 @@ static int __init arm64_efi_rt_init(void)
 	if (!efi_enabled(EFI_RUNTIME_SERVICES))
 		return 0;
 
-	p = __vmalloc_node(THREAD_SIZE, THREAD_ALIGN, GFP_KERNEL,
-			   NUMA_NO_NODE, &&l);
-l:	if (!p) {
+	if (!IS_ENABLED(CONFIG_VMAP_STACK)) {
+		clear_bit(EFI_RUNTIME_SERVICES, &efi.flags);
+		return -ENOMEM;
+	}
+
+	p = arch_alloc_vmap_stack(THREAD_SIZE, NUMA_NO_NODE);
+	if (!p) {
 		pr_warn("Failed to allocate EFI runtime stack\n");
 		clear_bit(EFI_RUNTIME_SERVICES, &efi.flags);
 		return -ENOMEM;

---
base-commit: 6b9fd8857b9fc4dd62e7cd300327f0e48dd76642
change-id: 20250623-arm_kasan-3b1d120ec20f

Best regards,
--  
Breno Leitao <leitao@debian.org>


