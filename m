Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF074CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 15:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AgOp7iaV/RaDAR+GphQp+dqI9mVhhh2Ps95uPVoCH/4=; b=dmf5rpcVIMn9wopt3G4DufvZ94
	yh4POBt/Albyra7WnGdBLpnP7BMUm7VqaNKg3kq+i80kInhGvWU8Szq6B1o9e4etfElCK/3XwtuHY
	DCu1nEgO4zpRRj7nrYPA6kZtxXY5pfA+Z6RHhkei26kxwCi4erTovLOR7mRQVe3eFA5OnQzgsoJuU
	Y6wVYXGVVm6C4aqrIiS09IJBNC1cd0OB/Z05evwg8rIIAKGpdqWCamyyvDXCBObTrhICWkCcIwlV7
	o1gEFqE9bNpYqoXzH9ktIDmGWyi7YIwgfEk6Fe+6H4TVfm1qKqBhjc+zoOFBcJhIrT7vek3W9yoxE
	zIN3LZZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WNX-00000004BOw-1nXW;
	Wed, 08 Oct 2025 15:46:59 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WNT-00000004BJ5-1EJv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 15:46:56 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3ee888281c3so72969f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 08:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759938413; x=1760543213; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AgOp7iaV/RaDAR+GphQp+dqI9mVhhh2Ps95uPVoCH/4=;
        b=LpG/Fx7OgzjMs/0CgDiHUKYHFXiVm7dlx3UqVG9TkW3pCBRuIhaS2z9Mjpx34QdYVv
         UwkzcCZB+FqXaFT3pAMjY6efaHHLMsFzwkQOFYaFHx7/aGgS0VwhS/KKodz/MaVhroti
         A7NEzpaOm3v/ibVq04xQVCxr2krohueoLzHj0IHa8j3tsmLZ7Br6nDA+dwFbBO3ONU/P
         EyUb9i4fLLWYmC8OLYPtRv9eJtjmIuFlM0v1YVYRmh2kdSskeJKOGlTAMt9xdpxS7525
         C5Ww3GIW5TemLAxmrIk+BimkVMpkwghng/LBkxnLIawpbiCF63v2wgESHMqzRXIIEwYC
         di3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759938413; x=1760543213;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AgOp7iaV/RaDAR+GphQp+dqI9mVhhh2Ps95uPVoCH/4=;
        b=WE0ziS/unrApAqRpET8Nm1wQpjqnNh3pEd8LE/9l+QV6M9lbVzkvASfuytViznDCRP
         Gn+YROMiMdL3RUholdbDirA7PwV3Le9q2kXBBljxRHe5BtoO8cao9ZJgLnCB+7brvFzJ
         r6TLpIm1S/nEzcM3e0676aqUT0oq+nmnqoJEUmdywxQOuo3lo/49e/PDzOYLXbd31pfC
         /u57AnnVASAPyKlpau0ySJQ9y+meGDnYtONFHmiHzXeayblqcbe/iBJdBvdQTrznGqBm
         XnBHf53MGIb9tOZVKkQxxdS4+iNC2uKQIXU60pHKpnbGCPEUAwH9lI5QtLmu9ZToIwuh
         9Kcw==
X-Gm-Message-State: AOJu0YyFL3B1jKrdabddl9h3q/tK0egd/YsbKHwN4RzmLePm6pZeKpO2
	9UgOW3pC/7TK4mtnMaIJ2GsvEI1x3YnoQKg6c5m1dZbYITkVrYHptj/0VCex1XzO9FHe03sIdIX
	32KiVutuhCi2PcCfVkQ1nUANICnGJqVyf+xnq81toMZMPj7CtPiDxQjuST0ov8siWdE3KJoH2RR
	3V2CKKetCTxeuhj1CKFcCdAuYFqoNfWLma9FYjYj9MDa/a
X-Google-Smtp-Source: AGHT+IHnmMnb0RKyaZwccpLn7QM/pWxbFeikk4zy0bIG8pjPiMhw8Qcfv9JNIYTDNAkRKG1Td/av8bhJ
X-Received: from wmbji6.prod.google.com ([2002:a05:600c:a346:b0:46e:1b05:b386])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4753:b0:46e:1d8d:cfb6
 with SMTP id 5b1f17b1804b1-46fa9af0621mr24939175e9.19.1759938412947; Wed, 08
 Oct 2025 08:46:52 -0700 (PDT)
Date: Wed,  8 Oct 2025 17:45:41 +0200
In-Reply-To: <20251008154533.3089255-23-ardb+git@google.com>
Mime-Version: 1.0
References: <20251008154533.3089255-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3233; i=ardb@kernel.org;
 h=from:subject; bh=S7UkFILzssk2NqWBV2TXMFPj5Ekrt9RH75yk9Qm+UwE=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeNZu1F00hLnn+/fFUZJ/WdX51zowZrIPy+rUaZ34U/hZ
 wYnLvzpKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABM5upSRYfEi+fKcM1LLv9Rb
 ZLq4XVr5tUNinm6e3b6kR9wpF7cdN2FkeC7925hr96WfEn2XFhRqveJla9PxyjRiXDKv52Pr498 HuAE=
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251008154533.3089255-30-ardb+git@google.com>
Subject: [PATCH v3 07/21] raid6: Move to more abstract 'ksimd' guard API
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_084655_363127_7287028E 
X-CRM114-Status: GOOD (  12.03  )
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
2.51.0.710.ga91ca5db03-goog


