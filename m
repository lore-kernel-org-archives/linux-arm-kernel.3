Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38644CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 21:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nLN5jr5EZSwszf+F9TmirI7MwTEPAK5WzBEEPFGFb+c=; b=C5wgoQuJ2oMMf94j3tkr9uYD87
	YRtStMXL/s7+t1gWqKfASVGL+MEgrQbW8cBUmGcA0FaWm4uoNHzbQp5jg44YFj2WSGM7NewYab8zV
	T40gMXbVb/BEbK1YbuEOx3LlUwFKxY+MXKXaxWmSbRC923uapdR1zYIbUJLjJqg3UBrL7ICVWfpIX
	JAqN9v7kSSN/4f2gYht+4crSWhCd1tfrrBfwmh4OPqS6fPGzf3+O+SZPtQCUGOcYKjQILFRZKFn+v
	Biz6PP2zhgcgCbuvwdp7wO+4dIAVSlE78GcIFgCyJyj46GGqcCHo7E4uQ9lfgMsV//b8CY0Aq8DPw
	hhOjNKTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zV-00000008ywO-42jr;
	Wed, 01 Oct 2025 21:04:01 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zT-00000008ytG-2zG7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 21:04:00 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-aff0df4c4abso45839866b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 14:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759352637; x=1759957437; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nLN5jr5EZSwszf+F9TmirI7MwTEPAK5WzBEEPFGFb+c=;
        b=gZ/hxwLbVmk4mRlRuPRopPkKCECqj6O2TOAAw4Iyg+te8K8UuLDSGxMImRewErlFrg
         eVhZ0mcot4t7Nld/bU/5v9KfbNIpL5C2w/pj1HDxOwKDqPOnBqr8JOPlkLCFWL/P4wYn
         a36OPk8omOFfeazy+2FUGge+DhJbvMK64Wus/kkWAU6OAAKvaxzVT2SFYdJm8psCfFyt
         rlxK40QZ+0Rs7SIodJICMXB/nKg28ISkvTURb8O6uLFG2zDb4GwFHUHH1+bkxnv23LSp
         fdHZAgnOyjNxLCVP5eEFe3vm76xXlvZI8moE5pXe0Nf+HiXzfuBempIWQ1cy5fQXiNZQ
         YowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759352637; x=1759957437;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nLN5jr5EZSwszf+F9TmirI7MwTEPAK5WzBEEPFGFb+c=;
        b=LMSqAYWLP3v0b6PtoyEO5iryBcyR8H0t2Hn37qszgjUksCw4BHZ/H7Whh69eqrsZx5
         fL7BHaGMYbsbuBgMft8UjEVRdfiJZNWaf7Eyewloz9qJdSn5AjZxFyEUI8MHKcX8Gk2g
         x6FeJuKUX6w/2+d+FdnTVQdy+oJcvnZUfzWjuN1fVOJ3BWTWq/NQBLwbMccTJO/IDuys
         PXJ+UpJAgEsQVdrdxwwb+n9Mz4rAulnFyCLCBHNvyhl1Rm96xdeile50fnVv1eVePB3b
         fOY85u31DP2PcyOhIBQ95S6eAN6nwuR+pGoxMA+DJNnc1NADsfLKDNsDzAyKPlg6bOt6
         2grQ==
X-Gm-Message-State: AOJu0YwbOMQSqd9WUsRzZsyxr1gzJzTcxPkJF1GCALsbx8ZIMR5xTdot
	WprrRl+lqnq68AHbEXq3meZ4y/PpQAZutPYgeI0Oy/b052jwuLKpimpDRNNVKEXLzSVfJgwLnAP
	9jLt2UOIfisYKcFzd88vXJvh3CEFDBg320tCu3o7wEUDVxUFkioMUOcNz4Bs1YfQXXYz/GcmINW
	oJ9bjjgYkHJdl6UNKToqe3F86MlXIWyrLo3x7huNICNF5/
X-Google-Smtp-Source: AGHT+IE/5dzsYm+uKsCA7BqxixvVFjLG0cblUGfuQzl+SHoar/yQvT4DNAxneFAQwNCEwxJSwxiGrNJ9
X-Received: from ejbgx6.prod.google.com ([2002:a17:906:f1c6:b0:b3d:b7b8:e443])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:724a:b0:b41:abc9:613c
 with SMTP id a640c23a62f3a-b46e97621d3mr576098566b.51.1759352637265; Wed, 01
 Oct 2025 14:03:57 -0700 (PDT)
Date: Wed,  1 Oct 2025 23:02:07 +0200
In-Reply-To: <20251001210201.838686-22-ardb+git@google.com>
Mime-Version: 1.0
References: <20251001210201.838686-22-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3184; i=ardb@kernel.org;
 h=from:subject; bh=gbq7vX1V656Kd5zOXbjYzxNSx5HVr+W5CHBw6KSs3yM=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIePutAd/TfvXOrnNLdzMmuP5wDbmqvKCn8Y7b23smLTMO
 eYwY+nPjlIWBjEuBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjCRK48Y/ldUdS5R2rJRRfXS
 RDOpUsODP9J6kjct2vbf13Ji73OtackM/0vYOs/H38s/k8jeMbdyy6Hvl1ee9mG9fkrdSVhmk13 dZVYA
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251001210201.838686-27-ardb+git@google.com>
Subject: [PATCH v2 05/20] raid6: Move to more abstract 'ksimd' guard API
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	herbert@gondor.apana.org.au, linux@armlinux.org.uk, 
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Kees Cook <keescook@chromium.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
	Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_140359_777985_E3947B4B 
X-CRM114-Status: GOOD (  13.53  )
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
2.51.0.618.g983fd99d29-goog


