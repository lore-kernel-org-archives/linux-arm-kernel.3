Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FBBD216A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 16:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EPau2MLeRwdYFnR0s3CHXgVfq70nmnwxY4DcSbyAS9c=; b=UaYI34tdgR/g9J1igM3QX6OWHl
	Bfy+p/qRbXnaxL0snTB/kJ8hk16LjAI+ozTn2QdDZ8W7PPLN8JYVBxJ60Lq6m7x6uJoL4rNCuaK3P
	jBccjNlAtoLu3OXoXfDPz4QETbEX/ctSXKwI5fTZKkzLapaozCgZnmos56PeAVO48dcdLNY8Dz8gq
	xTWu8ewo2dmELzCSFEfzetpCb47ftqGgZ/D4q+ZZxXgr27KCsRquCDCg4E+2n1PofCvxvpU1BBZ26
	zZZSdGTI6NOjrkZ0pBNGyNUxul1zdAiDKAStDFXhcUw4Xtgoxsoo8vb0p3VL6WqJYh31ke3MyGx57
	VQb6k1qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRCBx-00000008Hs6-3gxk;
	Thu, 04 Dec 2025 16:28:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRCBv-00000008HrR-2hi3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 16:28:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 074CA40BC8;
	Thu,  4 Dec 2025 16:28:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79365C4CEFB;
	Thu,  4 Dec 2025 16:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764865706;
	bh=j5XgDut8Jh1yOBUGeAP7WAC4k+EHrnpB2QuBKNomiHY=;
	h=From:To:Cc:Subject:Date:From;
	b=Z0hGZn2kNBdkc7f594EH++IfFxSu7b57KV/sMuVakNlZ5u/hrtZq6S48xIcPMPrwi
	 dvq+18F3QxhmHb22a4W3ZBBFjkrKqJX2D1ecpS30VXm+sESjvbG2Tvgz2QK9Hv+7vq
	 3iCXYnQZ5iRl96u67unbDTOQF5yDxwH4TQlsllrdHOIKZX3nUS1HKTKEDOmEf9F7P1
	 zHuBW624NkeCNaOstdSircbCW/fHWiDQ3o1bgv5rWMACYc+sZKubRawM+WclK+ZuGd
	 sDi5mU8FPRb8qa+VFBCE2h7QJYR321AuWvdgOIRr2CrxSICAYj288jYl7w0XD4rMXV
	 FAtfzwxN1mSGA==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-crypto@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Kees Cook <keescook@chromium.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Justin Stitt <justinstitt@google.com>
Subject: [PATCH] arm64/simd: Avoid pointless clearing of FP/SIMD buffer
Date: Thu,  4 Dec 2025 17:28:15 +0100
Message-ID: <20251204162815.522879-2-ardb@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1891; i=ardb@kernel.org; h=from:subject; bh=j5XgDut8Jh1yOBUGeAP7WAC4k+EHrnpB2QuBKNomiHY=; b=owGbwMvMwCVmkMcZplerG8N4Wi2JIdNw2/zjsX9eZSTu27h3RtW9Nv2qtMtRK9qv5sQdtJrSX c1gdqa0o5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEwkJIrhr/iv2P2PsoTz55dn LL7NUuJ39PYs2wrB63+mmHKbzJ7CsJzhD4+Sv8PXalnHKQc+z33iuZ6Z2/rVCfcFoWxy2ZH39hc vYQYA
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_082827_700771_8EF86B33 
X-CRM114-Status: GOOD (  11.56  )
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

The buffer provided to kernel_neon_begin() is only used if the task is
scheduled out while the FP/SIMD is in use by the kernel, or when such a
section is interrupted by a softirq that also uses the FP/SIMD.

IOW, this happens rarely, and even if it happened often, there is still
no reason for this buffer to be cleared beforehand, which happens by
default when using a compiler that supports -ftrivial-auto-var-init.

So mark the buffer as __uninitialized. Given that this is a variable
attribute not a type attribute, this requires that the expression is
tweaked a bit.

Cc: Will Deacon <will@kernel.org>,
Cc: Catalin Marinas <catalin.marinas@arm.com>,
Cc: Kees Cook <keescook@chromium.org>
Cc: Eric Biggers <ebiggers@kernel.org>
Cc: Justin Stitt <justinstitt@google.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/simd.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

The issue here is that returning a pointer to an automatic variable as
it goes out of scope is slightly dodgy, especially in the context of
__attribute__((cleanup())), on which the scoped guard API relies
heavily. However, in this case it should be safe, given that this
expression is the input to the guarded variable type's constructor.

It is definitely not pretty, though, so hopefully here is a better way
to attach this.

diff --git a/arch/arm64/include/asm/simd.h b/arch/arm64/include/asm/simd.h
index 0941f6f58a14..825b7fe94003 100644
--- a/arch/arm64/include/asm/simd.h
+++ b/arch/arm64/include/asm/simd.h
@@ -48,6 +48,7 @@ DEFINE_LOCK_GUARD_1(ksimd,
 		    kernel_neon_begin(_T->lock),
 		    kernel_neon_end(_T->lock))
 
-#define scoped_ksimd()	scoped_guard(ksimd, &(struct user_fpsimd_state){})
+#define scoped_ksimd()	\
+	scoped_guard(ksimd, ({ struct user_fpsimd_state __uninitialized s; &s; }))
 
 #endif
-- 
2.47.3


