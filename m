Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10400CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 15:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r6qU4dk91tAr2/hjLbeesrEFLeALQh619b79NXK4nw4=; b=srJx3QphuVRmUd96PP6Zl9C4sU
	9NfAcuG4gHmf6y9pTbdXibwZjFe/AxH8vjv9eFvu+2iyA5oF6OsOGZoLKE3riG2+4LqaiO/tPvPpE
	yiZASdZ7g6YNMAiknym3t06Mc2lnJhUa09dBd6wSyyMCCUil/QT9cwSuFvBJKJgCtrb3zCgdlJqsP
	tFjiwZO2/2ZsVjK88QRaA8VHM58WS+x7Q9d2txGH06njHNbVWYVZJNAyJe+PLNo8KalVXQVNQqb6f
	sgDT/7L8U4BBhsNXSwQGAk6vbbbyMlcC/zTUYCi5APDGZ1Fdx8DVG8rB5SOlG5zKT7oIwCBjBKeNw
	XQrEx9+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WNW-00000004BO5-3m0Z;
	Wed, 08 Oct 2025 15:46:58 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WNR-00000004BHB-3kYl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 15:46:55 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-46e3ed6540fso516475e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 08:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759938410; x=1760543210; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=r6qU4dk91tAr2/hjLbeesrEFLeALQh619b79NXK4nw4=;
        b=aKZWxMr+LnC47wdI6N2vOVuwruqu6YbrhJPmwn4Rj49ST97pVndV4KQx0MH+plHSEy
         PEWkQc/cWOVp99KgqaHa4FOK+VCUAxW6OgU0h+Gh1LKDZugratxikK8Vt2G/kxwD57GO
         U42sF0Ux2Xyiartto7sYK+MrjauUokNu3xzVkPMkTC6j68ixBseDqc6tZedmV64o+GtA
         jUn7HuCFI3RciRXlVXEdj0bVG9v5XBRMjQKtIhB7INpXG6scYFdUJQJu3J9lS4ZL//0Y
         0KIIpRYeijPi0P4TqZXkI5o+uRVs0BVb2TddjNcuzhmqygY7Ya7cBxMKbGqKokhQa3Z7
         sb+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759938410; x=1760543210;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r6qU4dk91tAr2/hjLbeesrEFLeALQh619b79NXK4nw4=;
        b=kXsN11TXIkth/dcule2uP+QmVd9LF8VrgnvZep2Yordux5DWyVL93tH4l/Ya2maf5x
         KfF+f9qkoE+0py63/EHMo3fDJ2KCZ8O9yl9INBsYegJ+I7LASC1gLZYnVPuNI6mlcLb4
         w6iKXcgRdKYuKtVj3krdNwp7MEZhAFbGLn+pLJ0HtvDsSgAMezSNSoztp770y/pC+Wtv
         gq2JWQ1P65eoD2n5wCDEIaOqXckC824FhxYRZToZrZ/3AI/ZaL32ROoAKcqVfnKvR+NN
         o4EVLWuPHLcbe4cSPPu/uMGiCHTZPSCQEiAS7VwksfDAMfPbVnkJu9Oh3dNlm9Cqvbnd
         tzfA==
X-Gm-Message-State: AOJu0Yz2w8DJRvlgGfIOPKgXM/4yvq27FbgFusI4vPevbFh5Er4K5JcV
	I44t3e2pDBqHkdMLN2BaL3znW4X0Et/63c1pj+Uieu+AT4zi23gE1TrXKhGlYa1tNTPykC/ekSw
	NRgimk6a72KSPJuNAqe4yC5TIxUYoUIOeRBAKjjLNUtStMqpNloN68CXx8pBMSFBRx3cVVz1kiN
	olnt5RGqyIhv+4FeAAJrW0An4ybWg8y0ajJ57QzhGLwfCC
X-Google-Smtp-Source: AGHT+IFgQd+cxAsEksCTNK8/LMhLr7VTFVSm/ymPavO/ZmIgqUdl9TlX+DTaPdHycCZ8dWC8FxaOxcb1
X-Received: from wmby11-n1.prod.google.com ([2002:a05:600c:c04b:10b0:45f:2be0:b17e])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1d9e:b0:46e:2815:8568
 with SMTP id 5b1f17b1804b1-46fa9ebe0dfmr26954295e9.10.1759938410501; Wed, 08
 Oct 2025 08:46:50 -0700 (PDT)
Date: Wed,  8 Oct 2025 17:45:39 +0200
In-Reply-To: <20251008154533.3089255-23-ardb+git@google.com>
Mime-Version: 1.0
References: <20251008154533.3089255-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1073; i=ardb@kernel.org;
 h=from:subject; bh=03C5PCob8A/RgOeAQHX/4ZCOM9qpxWhAP4TBfsL5DQ8=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeNZu67vx5bzQuJBJ9VNz8z77964fOkps5iNBqHnH35iW
 FNVeKyro5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEzEfSrDH/4Xk6WsfxU6r3kX
 4aVd5JkRbTaTSd1xptHVuhknJe8+PMbwP9hcNNXGOvjmNMd69f/504wueGtfWLcnMH7vf2vbg56 K/AA=
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251008154533.3089255-28-ardb+git@google.com>
Subject: [PATCH v3 05/21] ARM/simd: Add scoped guard API for kernel mode SIMD
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_084653_942362_FBF38356 
X-CRM114-Status: GOOD (  11.07  )
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

Implement the ksimd scoped guard API so that it can be used by code that
supports both ARM and arm64.

Reviewed-by: Kees Cook <kees@kernel.org>
Reviewed-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm/include/asm/simd.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/include/asm/simd.h b/arch/arm/include/asm/simd.h
index be08a8da046f..8549fa8b7253 100644
--- a/arch/arm/include/asm/simd.h
+++ b/arch/arm/include/asm/simd.h
@@ -2,14 +2,21 @@
 #ifndef _ASM_SIMD_H
 #define _ASM_SIMD_H
 
+#include <linux/cleanup.h>
 #include <linux/compiler_attributes.h>
 #include <linux/preempt.h>
 #include <linux/types.h>
 
+#include <asm/neon.h>
+
 static __must_check inline bool may_use_simd(void)
 {
 	return IS_ENABLED(CONFIG_KERNEL_MODE_NEON) && !in_hardirq()
 	       && !irqs_disabled();
 }
 
+DEFINE_LOCK_GUARD_0(ksimd, kernel_neon_begin(), kernel_neon_end())
+
+#define scoped_ksimd()	scoped_guard(ksimd)
+
 #endif	/* _ASM_SIMD_H */
-- 
2.51.0.710.ga91ca5db03-goog


