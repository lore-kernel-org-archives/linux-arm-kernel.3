Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E340CCF9FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 10:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e4RjkuRbzhzq+DbHCUcTmZHT9d6t7fanSTph/M7FrwM=; b=gtcRdg5FIG65JeOg9x+/At4lcf
	kFyMtGuLaO34xuo4isELtTqdG0uk/q5p0xRPDyme1T0TqmGxUJEKN5MxMuA8FJNGtWsnxv5FpqlZa
	WC19laRg7Eq7rYL+/235zpPb9rwXByDo/sBIHvk2Q3D0c4rhdeTacDYAe8kMSmx0Ru8j8aB+OBFr2
	lvs6LScLNoYmSxppA0tZu/oCed1NCgQ0KwS+YyUm5e6bnlFTT+ZMJhBySP1MgHeg9Uh3iQM4v5Y5N
	YI76V3HW+EcyYLdd8Y7gsk/MKoiEJK3F0hu3rYz0tKRdDDnY/5OGYxIoJVFTBkKzd0/f2GkzWLebO
	ZQwqgu1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmY7-00000005vFq-3lKb;
	Fri, 31 Oct 2025 10:40:03 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmXy-00000005v77-2mSK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 10:39:55 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-475de0566adso16710105e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 03:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761907193; x=1762511993; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=e4RjkuRbzhzq+DbHCUcTmZHT9d6t7fanSTph/M7FrwM=;
        b=yDiNU0XXBcD8+zQiCQbLpFW1qPR6Ytv+/MIlRfps8bApUIiUSPXmHAxteDZHqXYuTx
         HUzKALyPsvGfOpfgKppSQ6TuglD1rczKThx/V+h8G/h6CDpqcUbYXi2OJGlsCsS8JaX4
         s8tVsi9HWpgDjtkBQu6Mn/X4bf3WUzMMUp7d5kQAWm3ECUbMoiQqt3IHaA/iMVVXWNFO
         PXjz9XhEh62VkHzzhgny1LdYn98w5gTOjg9I4LE3a1ce3PP2RrmyTjEq2pII+zTVgMG9
         JP5bOFqYOnXJu1Eyie0DuJKAOB7KEBbeTBsxOBJp4h7DytQ2IdqjKOREbQXyFMBvuhcM
         qV9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761907193; x=1762511993;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e4RjkuRbzhzq+DbHCUcTmZHT9d6t7fanSTph/M7FrwM=;
        b=Xfh9p+k7Mx72tZxVmd2XKCImqDfggeV02aJTPyq5T/vzGlpnH2PPfAELaMBsAmQowa
         lWITdFa2wwIKnG6bIydUO+FGjqc3bWnX94Xeqeq+gmHNEveDNhSn0DYZhiANDIdVcZaY
         8gV2+WZ47nkxdCwcFK5bqIEuuJYySnzZNuz7l0f38T9T2lZfM6KpHhBqUev9JAhwHmhM
         Y+YK31e6CK3dBM6vZ80jt7lKqvpd5n+CUUWVW4c2935LrFgYl29hIuf2G6LthkBHOk/h
         Nx6dJil56YXu4JkIbePB7AkD9NtAM14BJOZbPvRpWz5LgJfapmgJvCkCL1JOmRujjosB
         rshQ==
X-Gm-Message-State: AOJu0YxtNBp2MqF8H7chjAeoMGsdo/1EbizMTl1cOHsjaZ4PMt9nqC+w
	eTwxqteKa8QNUgSHlJ90TtzsNpvsI+VUjTrr59Zy5J4TIXD8hxrswVZSUiDbnnutFuZ0OiD3xRb
	eMx0Wi30yQvaltKDnSyqLv77DazwAv4L555MqsUHA8XV4m1n22TseZZuiA4oveVPMB23F6yxd+J
	Pw0cuSBQh8O0LoLmM/s2i/0Ksm9NBhjfmpOVELcTH405Lb
X-Google-Smtp-Source: AGHT+IHVOvUG0Xu/U72ITBOpdefU2DBxMkwXD2QsdxXRJMDjdqSoWxzPqoXGu/4sUXEGYRcoh2Hw1odT
X-Received: from wrbdz17.prod.google.com ([2002:a05:6000:e91:b0:429:8bd5:a979])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:4813:b0:429:89c2:d933
 with SMTP id ffacd0b85a97d-429bd6a661bmr2703069f8f.36.1761907192812; Fri, 31
 Oct 2025 03:39:52 -0700 (PDT)
Date: Fri, 31 Oct 2025 11:39:06 +0100
In-Reply-To: <20251031103858.529530-23-ardb+git@google.com>
Mime-Version: 1.0
References: <20251031103858.529530-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3233; i=ardb@kernel.org;
 h=from:subject; bh=iSbN4ekVGltGzQmP5pLZ+bG2pN1WnvqNrOwI0kB4C8o=;
 b=kA0DAAoWMG4JVi59LVwByyZiAGkEkc3IqxaPccg6BBv5hnkGx/1bCaULY/XwigMLrW1nDGA+l
 Yh1BAAWCgAdFiEEEJv97rnLkRp9Q5odMG4JVi59LVwFAmkEkc0ACgkQMG4JVi59LVzG4QEAoaIi
 zu37MoBFQRoBZZ+yZD5/L9uJT55ZFas0kEqcoTgBANiP73S3Ww/wj+Epar2f+78g93ZAI/f4ta1 oEhX9xoUH
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251031103858.529530-30-ardb+git@google.com>
Subject: [PATCH v4 07/21] raid6: Move to more abstract 'ksimd' guard API
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_033954_738912_D23FCF35 
X-CRM114-Status: GOOD (  11.27  )
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

Move away from calling kernel_neon_begin() and kernel_neon_end()
directly, and instead, use the newly introduced scoped_ksimd() API. This
permits arm64 to modify the kernel mode NEON API without affecting code
that is shared between ARM and arm64.

Reviewed-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 lib/raid6/neon.c       | 17 +++++++----------
 lib/raid6/recov_neon.c | 15 ++++++---------
 2 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/lib/raid6/neon.c b/lib/raid6/neon.c
index 0a2e76035ea9..6d9474ce6da9 100644
--- a/lib/raid6/neon.c
+++ b/lib/raid6/neon.c
@@ -8,10 +8,9 @@
 #include <linux/raid/pq.h>
 
 #ifdef __KERNEL__
-#include <asm/neon.h>
+#include <asm/simd.h>
 #else
-#define kernel_neon_begin()
-#define kernel_neon_end()
+#define scoped_ksimd()
 #define cpu_has_neon()		(1)
 #endif
 
@@ -32,10 +31,9 @@
 	{								\
 		void raid6_neon ## _n  ## _gen_syndrome_real(int,	\
 						unsigned long, void**);	\
-		kernel_neon_begin();					\
-		raid6_neon ## _n ## _gen_syndrome_real(disks,		\
+		scoped_ksimd()						\
+			raid6_neon ## _n ## _gen_syndrome_real(disks,	\
 					(unsigned long)bytes, ptrs);	\
-		kernel_neon_end();					\
 	}								\
 	static void raid6_neon ## _n ## _xor_syndrome(int disks,	\
 					int start, int stop, 		\
@@ -43,10 +41,9 @@
 	{								\
 		void raid6_neon ## _n  ## _xor_syndrome_real(int,	\
 				int, int, unsigned long, void**);	\
-		kernel_neon_begin();					\
-		raid6_neon ## _n ## _xor_syndrome_real(disks,		\
-			start, stop, (unsigned long)bytes, ptrs);	\
-		kernel_neon_end();					\
+		scoped_ksimd()						\
+			raid6_neon ## _n ## _xor_syndrome_real(disks,	\
+				start, stop, (unsigned long)bytes, ptrs);\
 	}								\
 	struct raid6_calls const raid6_neonx ## _n = {			\
 		raid6_neon ## _n ## _gen_syndrome,			\
diff --git a/lib/raid6/recov_neon.c b/lib/raid6/recov_neon.c
index 70e1404c1512..9d99aeabd31a 100644
--- a/lib/raid6/recov_neon.c
+++ b/lib/raid6/recov_neon.c
@@ -7,11 +7,10 @@
 #include <linux/raid/pq.h>
 
 #ifdef __KERNEL__
-#include <asm/neon.h>
+#include <asm/simd.h>
 #include "neon.h"
 #else
-#define kernel_neon_begin()
-#define kernel_neon_end()
+#define scoped_ksimd()
 #define cpu_has_neon()		(1)
 #endif
 
@@ -55,9 +54,8 @@ static void raid6_2data_recov_neon(int disks, size_t bytes, int faila,
 	qmul  = raid6_vgfmul[raid6_gfinv[raid6_gfexp[faila] ^
 					 raid6_gfexp[failb]]];
 
-	kernel_neon_begin();
-	__raid6_2data_recov_neon(bytes, p, q, dp, dq, pbmul, qmul);
-	kernel_neon_end();
+	scoped_ksimd()
+		__raid6_2data_recov_neon(bytes, p, q, dp, dq, pbmul, qmul);
 }
 
 static void raid6_datap_recov_neon(int disks, size_t bytes, int faila,
@@ -86,9 +84,8 @@ static void raid6_datap_recov_neon(int disks, size_t bytes, int faila,
 	/* Now, pick the proper data tables */
 	qmul = raid6_vgfmul[raid6_gfinv[raid6_gfexp[faila]]];
 
-	kernel_neon_begin();
-	__raid6_datap_recov_neon(bytes, p, q, dq, qmul);
-	kernel_neon_end();
+	scoped_ksimd()
+		__raid6_datap_recov_neon(bytes, p, q, dq, qmul);
 }
 
 const struct raid6_recov_calls raid6_recov_neon = {
-- 
2.51.1.930.gacf6e81ea2-goog


