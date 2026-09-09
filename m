Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50046C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 16:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FEDz6/RueJDQSwY6RDBaKtCBKg56j+hFHYBq38ixiTA=; b=ltsWhP5/16r/cPn7j8q0uQT67d
	iJwBFzOmuw76qctj3If7zDOlUee3MzR1OSrdEyDVeh7sgz47FEE05aVaOz5jxX1E2+1yIVVl4jKKD
	wM5wCpAtyJu5nvQmhq8X6M7kC1Lavm4Gan5NncpecKiBwqfawzB9P80ZUGtDkoDS2GrFufk3bYiRo
	a+LjdJS0Eez/qNBVCGq7YkWnJVfCYuS9q0D9mlIJeMA55J4ejCxY5RjvZ3e91UHd3a7QapPrF/01r
	gGb9pAVqXc4uW2yvE/H7hqigckgkkTEt4Un6FOWmieuTro6qDq3X28cgkcv6lv+HQjfYlVxBgb/36
	7cmPl1AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LEu-0000000CKlt-3Ohf;
	Wed, 09 Sep 2026 16:33:36 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LEn-0000000CKhi-3H0A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 16:33:30 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-485afdd5079so761440f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 09:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788971607; x=1789576407; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FEDz6/RueJDQSwY6RDBaKtCBKg56j+hFHYBq38ixiTA=;
        b=CLC7A3VHlvNI+VYtiSUuesSEuMgV7dV3bw/2QzIWhaLndTmUqFx+KGI+JyWpKqGFxx
         Ox4wRFhuO4HYAKfmyOCPIJVW81kqaa3dv8yd88wgm+HPN4u1H8w/2JFT7gHy05ShGIti
         b89gw+BziaX0n9JVItRrZ7zomdJjwW25U9bWhGkPH1huaxTsa8Ox6MNlrsmX99L0AqnB
         Zu0kSoebkS8u8OYAkn0HLLIBOXSH6H6sbbaJcuD1Zy+E6WKqo+wxOhqiUFzi8dd7EXut
         jKFony1N1IAPXQT5X23U1gGzzD5zSpia1odKiymXKwPXoM9vPRtUeJ/N25JDjG/cJNrZ
         ol5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788971607; x=1789576407;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FEDz6/RueJDQSwY6RDBaKtCBKg56j+hFHYBq38ixiTA=;
        b=JhTlcU8+PZU3o/4/Pc1RU30Q7QiL5V3K6iqeRIPaWfVhmEYNVPTAvtMX1DUSGt70Qi
         Abo7wd7mgRje4gU2bGrLWhpzhf22a2K++IBdIkKi98t8jQNK4uHohoSkIYNmROLbJbRJ
         Go+lOU40gXRqaX+doMc58FVWyJY/mtaiQ/ucu7Uw+tn/hWXC+eSZlh6gnnXiwHcWAoP8
         itqqrRLRx7Dyw1zU7fl9f390KQCi6yqB7i7WFCze+ESaAljDJnNXB3HW6wy+eMwGWDLC
         9hTZAPPGUuVPgbFsTwwdRIyee04ax2YVbvj6GI3Rr5hdVq8dRw44RqLJO7sKsWNOjlzw
         vVXw==
X-Gm-Message-State: AFuF++nRLJTTqymbKQoEAUUmtE+f9RGJaKL8QSC1kSlbHjO0I6uUHb2N
	Z5HxmZZSWgvPN/KneL+jawwLPf090KPqk/0Zq6zSULGHv1pjiqTNOOyUW9OtZ0p0RiAnLTbnNRC
	q4gJmfUpV/fxR7Q/ixkrga36FFPL40FdZdTpJZ99et0ZT/F6MwMtMo9LRH9YleD1Jx7LBHRChKZ
	rIuFCd0lPcThbF5cKo6rhmOgrLsaLg8SsqC9WmmXaXCqao
X-Received: from wrbes13.prod.google.com ([2002:a05:6000:44cd:b0:484:3663:d996])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:40cc:b0:485:8393:215a
 with SMTP id ffacd0b85a97d-4858703f4bamr40073275f8f.5.1788971607084; Wed, 09
 Sep 2026 09:33:27 -0700 (PDT)
Date: Wed,  9 Sep 2026 18:33:22 +0200
In-Reply-To: <20260909163319.2116279-4-ardb+git@google.com>
Mime-Version: 1.0
References: <20260909163319.2116279-4-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2436; i=ardb@kernel.org;
 h=from:subject; bh=VFd3n5XWAvyNP0BemPakDTs/m7Yonl3YbzM8kBIsNGE=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIWthV9CEBsd7tl/SVKK31t74xlEjtNvq4c5TzeYcUTfeL
 tWf3uXWUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACaib8bwV1pw1zOX5NfazneO
 eL59c7fcZGdmUs3uqvv3k5xTr0kn5DD8d/YTt25IUH8dd+Tyofgl4qv4mS0S7eV9BUK3W/dZHpr LDgA=
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Message-ID: <20260909163319.2116279-6-ardb+git@google.com>
Subject: [PATCH 2/2] ARM: Remove hacked-up asm/types.h header
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Eric Biggers <ebiggers@kernel.org>, Christoph Hellwig <hch@lst.de>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_093329_837540_463C91FF 
X-CRM114-Status: GOOD (  17.09  )
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

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
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
2.55.0.1003.g10538fe699-goog


