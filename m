Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9483FF60DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 07:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xX1RLQfuL8f01fbs5w+AQoYx0sqR/fYyxSbc44uk88k=; b=iUBYwqTaIbjwmFW80lQMvQQiy2
	d9qP46rvNgxfFwKdqRJIiO/GO2Wp6mb5QT5CM5A9tY9WOEvhs+u+Ow9TJQJumQr9u2wisSJVq2d1w
	26UnjJsI0B2WhmoICaebcAoXT63OR8lS29vExDEnnZzsbNMPjgfh5zh8IzOh4cSmtAONaiNg0smhj
	jgiLGrFyX67WJJZY+En3iEaU8GqUDwmRyTvX6my0G6Y9Zs7kApT10zihUAg2uXOOSl9i/2YRQg+8z
	BorSriaoyC7TdrmV85PjN+0NP+Y2SZWOaXJnau6hRyc7BQ454rt/9jeQ5MpCMczCBmSZfVANy9eB0
	RmRRDAvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TrP-0000000CWT4-2W4K;
	Tue, 31 Mar 2026 07:50:03 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TrL-0000000CWPY-1hAs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 07:50:00 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4887b85ad5dso2216525e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 00:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774943397; x=1775548197; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xX1RLQfuL8f01fbs5w+AQoYx0sqR/fYyxSbc44uk88k=;
        b=csuPEGZ6FtqKNBr057S9Rb5lz5Ji5fLuiCRYScn58s0xj2opsCO58PJGz3Pzh0ncYF
         WqsmVdNsbnbO6xV09ArNNzpccP5baqOXequ2m+UtEPB0XfejmN0/PEcfVSV/n+23SVTV
         Dy50IEPZdq0yTGG6kcXnfkpgNBmmuBT5ysabfJTNA6pRIxsiWQ0j2iq0gonpWaaHAgwm
         Mzdx0UCfr5/yXvr7yBCVYJRwbQU2mqHPjUZ5t/SMt0E67UjOSiWl1qM77q7NeLYc9J5z
         Cw6psiutP6G1m+njZDsGO0NA6BJRuUmibnTpqykXaQmD5flpR3OkRJfKX8ZgtFPvoAP7
         FEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774943397; x=1775548197;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xX1RLQfuL8f01fbs5w+AQoYx0sqR/fYyxSbc44uk88k=;
        b=bj8CNTahKn1Li1NWqIF0yjqz8eHPGIhni7kKiRiVEMU1IKByfMEEZyL2tZwMCzlISs
         MX1/PsYfJHhToya80zAzFSBoZHn+73u757bQkq03sYNzzI4IJ6owKeG7dvJUxxaUuDG+
         9VRjgKKD40TlNwstvhLtAv+Oi/YtiaqbnRReYLnWAdg2tOXNjaYqZebXLfs/sv2X1Ru0
         1DiPUxSlN+JlPBI5SyNA4VvDxpDF/hLBymBCBPOJrPHKUu9Ujlk2k7jMDZVuziEkL0Gh
         TCQ1gNku1tyy5qOqCD9e50BMbCsmeVf16DgTxvnDWtVfsImxlsX4MpHXON1cpQjHknYp
         3+tA==
X-Gm-Message-State: AOJu0YzAv2ONtwlCh24TX6u5olzXrzGuzv3y7MwmhFFC40zSUQKIm55L
	efThNa94TFL5HkcUXl9nrxiEXssfbf4KHVxH3yWselfoJiHlq4QjSE4o1VWvQ+KF2Jo1vAEKfQ=
	=
X-Received: from wmpj25.prod.google.com ([2002:a05:600c:4899:b0:487:304a:7fdd])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1d1e:b0:486:fe46:b647
 with SMTP id 5b1f17b1804b1-48727f00d8fmr253676295e9.10.1774943397259; Tue, 31
 Mar 2026 00:49:57 -0700 (PDT)
Date: Tue, 31 Mar 2026 09:49:45 +0200
In-Reply-To: <20260331074940.55502-7-ardb+git@google.com>
Mime-Version: 1.0
References: <20260331074940.55502-7-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2392; i=ardb@kernel.org;
 h=from:subject; bh=VgvFV6e24K1jLyX3BtgZs5h4ZlG8hjrR1x9Qg5yrHgw=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIfN0zewnU1Knqs9ZfFllycHU259cjd9YXt3kKnk/t+ngk
 tWSv+WPd5SyMIhxMciKKbIIzP77bufpiVK1zrNkYeawMoEMYeDiFICJcL9mZPiwTss4cunvH3Gf
 vjaonFg6Tc90zSWeizr3zCck/7CukX/F8FdIympv5PfjRw96CfklM/irxpx5NF9v3aXCuOdG05K XbeACAA==
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260331074940.55502-12-ardb+git@google.com>
Subject: [PATCH v2 5/5] ARM: Remove hacked-up asm/types.h header
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-raid@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Christoph Hellwig <hch@lst.de>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_004959_466856_58A3921E 
X-CRM114-Status: GOOD (  16.48  )
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

From: Ard Biesheuvel <ardb@kernel.org>

ARM has a special version of asm/types.h which contains overrides for
certain #define's related to the C types used to back C99 types such as
uint32_t and uintptr_t.

This is only needed when pulling in system headers such as stdint.h
during the build, and this only happens when using NEON intrinsics,
for which there is now a dedicated header file.

So drop this header entirely, and revert to the asm-generic one.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm/include/uapi/asm/types.h | 41 --------------------
 1 file changed, 41 deletions(-)

diff --git a/arch/arm/include/uapi/asm/types.h b/arch/arm/include/uapi/asm/types.h
deleted file mode 100644
index 1a667bc26510..000000000000
--- a/arch/arm/include/uapi/asm/types.h
+++ /dev/null
@@ -1,41 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef _UAPI_ASM_TYPES_H
-#define _UAPI_ASM_TYPES_H
-
-#include <asm-generic/int-ll64.h>
-
-/*
- * The C99 types uintXX_t that are usually defined in 'stdint.h' are not as
- * unambiguous on ARM as you would expect. For the types below, there is a
- * difference on ARM between GCC built for bare metal ARM, GCC built for glibc
- * and the kernel itself, which results in build errors if you try to build with
- * -ffreestanding and include 'stdint.h' (such as when you include 'arm_neon.h'
- * in order to use NEON intrinsics)
- *
- * As the typedefs for these types in 'stdint.h' are based on builtin defines
- * supplied by GCC, we can tweak these to align with the kernel's idea of those
- * types, so 'linux/types.h' and 'stdint.h' can be safely included from the same
- * source file (provided that -ffreestanding is used).
- *
- *                    int32_t         uint32_t               uintptr_t
- * bare metal GCC     long            unsigned long          unsigned int
- * glibc GCC          int             unsigned int           unsigned int
- * kernel             int             unsigned int           unsigned long
- */
-
-#ifdef __INT32_TYPE__
-#undef __INT32_TYPE__
-#define __INT32_TYPE__		int
-#endif
-
-#ifdef __UINT32_TYPE__
-#undef __UINT32_TYPE__
-#define __UINT32_TYPE__	unsigned int
-#endif
-
-#ifdef __UINTPTR_TYPE__
-#undef __UINTPTR_TYPE__
-#define __UINTPTR_TYPE__	unsigned long
-#endif
-
-#endif /* _UAPI_ASM_TYPES_H */
-- 
2.53.0.1018.g2bb0e51243-goog


