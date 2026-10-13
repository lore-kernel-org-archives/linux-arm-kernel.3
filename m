Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E32CC6B19
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 20:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FsH0cWn1LlvsmNG6WCJYq22XE9O6pVl1IRSuRFpVGDU=; b=cvQK1hFJLpENcASYWwlFumM85g
	LJCtyV4eEsmwzrojRipy8V8Ow1CJU+u0A9sSbIJ1FWv8q+rNdmniIviB6k4Xf5xOWWcXFvd47y7EL
	mBqUuFlBk7dFmVFNlhIi8WngJlG2JDRjEttAc6W0s7mYe9EtuPIP7o/ysGdM9A99wvROIHRd5lvtI
	3vg3DF+dBHDu9L3sWt5/nBmRpqlPIMxwntqa3o+YlcFA7iUin7X4t0/tDdRt1BJuI9exSFqtzf2fE
	heB2vBG/UUAfve0oqmyfpU1vgkCQBA8LfeGUNT+cvw25m66KEHqSM1jxm0cli8F8LgZAiaIevIG5H
	L/NiZHWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGjAK-0000000E0R3-3OUd;
	Tue, 13 Oct 2026 20:32:04 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGjAG-0000000E0Ov-3yIv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 20:32:02 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a01933b584so30153715e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 13:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791923519; x=1792528319; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FsH0cWn1LlvsmNG6WCJYq22XE9O6pVl1IRSuRFpVGDU=;
        b=r2jCEpR34JIEouLi+0geC7b0xcNsDdFNCifEfvQ8dSxNogQr8m/X2sd3bNxHlEWe8M
         scETo5Y1dyEXAOu+sbvKmEWypY0EX2MjoLwA8z+Y/O3jEOCoP9AyPdZFcGLwcDVrRHZA
         ixGa9fJYv4Z0e00DGLLKTtx85aVvYSC7COSbdyOXQIsua6FP7N9gLYV1borq9iL47dz6
         +mZ1OHWvC32VeJ6D0SFuFufx6/PizYP2ozAG75jJrOASe0maxqUNhVPqnKgbBk45ArOM
         UEnPr0dzCG+b3atnpo26iZi/u4Z02UmB9FfbWnsZUqY/7qizar1IrwZDjVCzOaERWVrq
         fxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791923519; x=1792528319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FsH0cWn1LlvsmNG6WCJYq22XE9O6pVl1IRSuRFpVGDU=;
        b=n2eMmmTB6B0jdG8GTg8ozKCDz0/UjdX+EEXlg67qH/Ogq6/jTcOGgQJkkfISH5eCSG
         Nyoq5LZf3b/TFirBAzYYJqaYSM4wzkqZrNaTgb5EuKnyD1Mlf3ftFDXahfb2p0lYsv4y
         8lSKf+rKvfOCFVRt+VVwQTl4RVUOaXa9W4fLOdksoXiu5cB33puZD+2VE31IkcEmYnPA
         LcoPeIWG7x7uIsQ/ojGkUztDLbypTiOPqaEpcSjA/3DjHMZqdYcSM34zok6Xb1fLbmyO
         sxscEDgMPEtI+rvB+II8DhHPOUuUBuuEJm9EveIwxex3s6p1Fu0D4BeF0th4CICeajAI
         QdtA==
X-Forwarded-Encrypted: i=1; AKwUvByS6Vmew39nC58/mommVPAyb6WoMOvp1Xptr3iq18frnnjjPegpQzUswbZN1ayYUWpGIfnm8M9aLIi6oswDEtWD@lists.infradead.org
X-Gm-Message-State: AFq9FYJ03DqXAoBwPCsr4DMCRdN1tyJailO3N9JeFWl6IpEVbnCB26IA
	uuqHN4Gc5R7McFco39r10SuFIJEnLerMKPaLi45rXK7X6KIGY3m6J5Ih
X-Gm-Gg: AYBFou2HeS2U0xwIAC0dCDhPSMIbxMEcETIpY83mEz4IwrCCCDMPfKzoJSEokvw8B1d
	7gUJuKMH/yGId4uoMlSL5cSvjudTCQ5gzVBS3wIrLzZANB9qlqOcNsd1nBIbLDW4rmzR9ppOyUy
	Gs8LgZxT0usmvO0EUr6bO5CE+ucTOahxyjhGTCcIO8/Y50LwXpIUgZMInZgQOMKasEmvVuINAqt
	rXfVPYFwLp1ucEi/507FWpHFImEzw/o7C4IEeSlds24BomANCaDYL8ArrgLf/RRORrEjLuBgNiY
	ryJvQDwD96Q1ipWdVKjLASkOGXhczK9dAz8XG5t9OdNXlxg2ac3ZmvBenvYmXRIU4/WKlov7oCa
	vBKd9mTXswMpgNfA9oVq3j0uL1999Yv70XlT2irUkUZDMRJQt8tWgj79Gj0jkYtueKcMwvIT129
	gsIMFqaqNz4x1yqIm5itM1EbrgfoS5KE6pMNsM0GcS/RMIcAhNyXdHgMrZ4xta1kjsMg3fdgopJ
	u86xps18OhncSmAFc2MTBik11izkDRM+YwO0Q9TXu/nFOs3MP3LJ7H+iSakmHBtnjMpH3DXisGg
	cZiBhMpPVqflfUJZRyy/vQsuu8Pn9GgSB0osDs6wgQr2xhGXLQrH3/p2HTN4Tb6w7YEgRW41YSe
	vwIxzag==
X-Received: by 2002:a05:600c:4ecb:b0:4a0:c01:1902 with SMTP id 5b1f17b1804b1-4a18e43a29fmr276884405e9.2.1791923518889;
        Tue, 13 Oct 2026 13:31:58 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a189-2701-8c58-155a-0279-7389.310.pool.telefonica.de. [2a02:3100:a189:2701:8c58:155a:279:7389])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b481b7f8sm5237345e9.3.2026.10.13.13.31.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 13:31:58 -0700 (PDT)
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
	Peter Zijlstra <peterz@infradead.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/6] ARM: cmpxchg: support 2-byte xchg() on pre-ARMv6 CPUs
Date: Tue, 13 Oct 2026 22:31:36 +0200
Message-Id: <20261013203140.31741-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261013203140.31741-1-kmehltretter@gmail.com>
References: <20261013203140.31741-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_133201_003887_FB8AF75A 
X-CRM114-Status: GOOD (  15.06  )
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


