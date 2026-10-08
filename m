Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D262CA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 06:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FsH0cWn1LlvsmNG6WCJYq22XE9O6pVl1IRSuRFpVGDU=; b=WY137YF3Jit/uHfEI+eIHprgDm
	n9Hd3xAZuooFX1+jRWMHbhkt6COEvAtuRF+GAVy1T1JiIrS+EBCSxrusOwVTGXxSYqkllOghnki2g
	kmCtFdnumdAq3mOKGG1J4fyTUVuqbnWZ9QOrkXC9AEKRX5BARqvfVEl08uWa68vkRgHXAxEWfxYAK
	PdpiTtkezfJoulASdypyfq/NDCenV6JcGBxmZy3g0ekT6UNYBaT9D5xC36sc05Mk4xP/lzMAkSP5N
	7MqAGCRwwh6eGD1bNIkEVv76SPqWZ0RMtfKim0QP1br5bw6UNBQ4BxF3CqSiVz5iHJrplHaFhYu1t
	s6I2LkFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEgpP-00000003YVB-1fgf;
	Thu, 08 Oct 2026 05:38:03 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEgpM-00000003YT0-3Cdb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 05:38:02 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48c4be28b82so2273181f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 22:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791437879; x=1792042679; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FsH0cWn1LlvsmNG6WCJYq22XE9O6pVl1IRSuRFpVGDU=;
        b=GOl7SfxPcchQtyHfSEJpJE7VZNA6ZtbNzFVpvHsmn3XTYO4wnZlmNL9+6fHP9B5yr3
         BI5vn/fV0s5mJYqQfi32fD9uR79T3/xFKynBq6WW/pdT48iMFv83vYLTLODQHdQKAHML
         eMP9K7iUMkQOGt0XWU+2tZ2ODQ9i5yQzE3QhacAPkkxWdFUcxc5l20bvZGI+zYzMUh2E
         nsyu9JHQsGjaa0KtThc2gTfQc+mjIhcUeIV2aR6dgwOdl5x1iw7CmIH2+v6b0sBka/Oa
         S78uwws1VQZNRG8rkFL67TeBjbr81MVOII56Sh9wmhv0QQTLWLF4N0DXejxeRJJ7BTT+
         xqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791437879; x=1792042679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FsH0cWn1LlvsmNG6WCJYq22XE9O6pVl1IRSuRFpVGDU=;
        b=2AcKkFr67jIKIZX8zt1qgOIVJ6qW23H2LuXSrBZlkdmm7o2/eTTTM3X3Fm/U4+YfZm
         QiM6LRVXMin+PXBoA3X3J6D5Q1Ax5WV8dIqFp3bjfWGbNTSNkBh2wLLW+hn/RInXoTfQ
         SCThgxxtTbZlpyP//U215oSWVvgDUdAuRRRQN6dXdVdEIOamQGOpoonMqTySdW3HjxcP
         xhJ3BoZySFVxsxvvcj6sOqzcQ2Etezd5B9tme4LZNV05vXdi4zR2XMJCPFjEOgjeuQQt
         ANujtpiGDJG0IyBzXUd/U7LRFIUJAHbARyaU3TjHHUvfgtGGrN7qCGW6Z6KQ4yd+O8TN
         jt1g==
X-Forwarded-Encrypted: i=1; AKwUvBybWVRyZEAaFEJeMJYkW8W6HJ6LhPlxv8bJmTy8zcuy2AQi9H9DLJRvKT4sJRBL6UzX1CCXHm54O40+u8ZeONyO@lists.infradead.org
X-Gm-Message-State: AFq9FYL/ka6KH0sRkvUCQsZ5jDdIgDEV7W72kh5dE31BHTxhaWGSOgP8
	T5PsygzL6Owq93tQuCM5Fk9p+mADjspa5wjpKoDsRjTRFtsy+v3CQrTo
X-Gm-Gg: AYBFou3Pt/4lwTH/gcZ3uHpIhZMfnZjzcwBm+V0n6swp0/mGcsjn4RaEcjR8H4PywE/
	dj0rhNVT/sLMZWF3M4h/pxuX9PDSUfEmAUxm0cS/8kPihKrkA6aIRr0/7xCJH6ioUqhEks5VoZb
	SpfKa5NpEGww/fRsAiaz0rL6Mwobrz2XP9a5rGie31oN9r6moQSW7/EDB00Y0dikwOEDKRoBGHo
	khfpa0torJa30saavjX6UESNF+KUvSuR1tYC92mpMkkmSnuedmmQOOvmyZeCCdtj0KfQxqIKIg8
	UpFlTfK/eI8PRl0rMJq137LTaRdr7UBqVn31Q5bLifsAMF+MI4WTVLwNJN1QTaFMfiw1IC1svfB
	bMjJDiR/K9SMbtESMJ97bsO4cLGez32bFZHn9zdWIHLGp25gSoPQwZRprwnMn4eQd661YkIYR+b
	qgPhM4FT4130XJ7QqV6K6pt9UMBWnGF3Txut8VtkWJabb7GBuCkZK/58LP2LsrEwi2YLVvL7V+s
	kZixGOhUL9epwEi0kXFetdXKADxMvN1K6MBgzltQxLXFNRKC6nOWL3fIsuEIfL0b+yqh9aZ3W/8
	9FtsJGTXOFyV7gkP3ZDmzK4mbvOyhPG2PaFvsY0l1f7GDrsaWvuwfOlL81CRf5ve+k9iNqCsf0M
	l881dDJQ=
X-Received: by 2002:a05:6000:2407:b0:48a:fcf9:aca5 with SMTP id ffacd0b85a97d-48c72779796mr7901474f8f.11.1791437878835;
        Wed, 07 Oct 2026 22:37:58 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad61-5a01-743c-891f-b33c-cae7.310.pool.telefonica.de. [2a02:3100:ad61:5a01:743c:891f:b33c:cae7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1f8fbsm8458219f8f.33.2026.10.07.22.37.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Oct 2026 22:37:58 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linusw@kernel.org>,
	Christian Schrefl <chrisi.schrefl@gmail.com>,
	Bradley Morgan <brads@mainlining.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] ARM: cmpxchg: support 2-byte xchg() on pre-ARMv6 CPUs
Date: Thu,  8 Oct 2026 07:37:42 +0200
Message-Id: <20261008053746.49631-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261008053746.49631-1-kmehltretter@gmail.com>
References: <20261008053746.49631-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_223800_821822_E7B8F0CD 
X-CRM114-Status: GOOD (  15.03  )
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

Pre-ARMv6 CPUs have no halfword swp, so __arch_xchg() only handles 1-
and 4-byte exchanges there and turns any other size into a link error
via __bad_xchg().

No C code needs a 16-bit xchg() on these CPUs, but the Rust atomic
helpers in rust/helpers/atomic_ext.c provide xchg() for Atomic<i16>
unconditionally, so building with CONFIG_RUST=y for ARMv5 fails:

  ld.lld: error: undefined symbol: __bad_xchg
  >>> referenced by helpers.c
  >>>               rust/helpers/helpers.o:(rust_helper_atomic_i16_xchg)

Implement the 2-byte case with interrupts disabled, as the pre-ARMv6
atomic_t operations already do. This is safe because a kernel built
for ARMv5 or older is never SMP.

ARMv6 before ARMv6K (ARM1136r0) has no 16-bit exclusive access either.
It is not handled here. Rust stays disabled for those kernels, and
they cannot be SMP since commit d70242427110 ("ARM: rework ARM11 CPU
selection logic").

Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Bradley Morgan <brads@mainlining.org>
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm/include/asm/cmpxchg.h | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm/include/asm/cmpxchg.h b/arch/arm/include/asm/cmpxchg.h
index 0ce5225af442..18555ae22893 100644
--- a/arch/arm/include/asm/cmpxchg.h
+++ b/arch/arm/include/asm/cmpxchg.h
@@ -31,11 +31,10 @@ __arch_xchg(unsigned long x, volatile void *ptr, int size)
 {
 	extern void __bad_xchg(volatile void *, int);
 	unsigned long ret;
-#ifdef swp_is_buggy
-	unsigned long flags;
-#endif
 #if __LINUX_ARM_ARCH__ >= 6
 	unsigned int tmp;
+#else
+	unsigned long flags;
 #endif
 
 	prefetchw((const void *)ptr);
@@ -106,6 +105,15 @@ __arch_xchg(unsigned long x, volatile void *ptr, int size)
 			: "r" (x), "r" (ptr)
 			: "memory", "cc");
 		break;
+#endif
+#if __LINUX_ARM_ARCH__ < 6
+	case 2:
+		/* swp has no halfword form. Pre-ARMv6 is never SMP. */
+		raw_local_irq_save(flags);
+		ret = *(volatile unsigned short *)ptr;
+		*(volatile unsigned short *)ptr = x;
+		raw_local_irq_restore(flags);
+		break;
 #endif
 	default:
 		/* Cause a link-time error, the xchg() size is not supported */
-- 
2.39.5 (Apple Git-154)


