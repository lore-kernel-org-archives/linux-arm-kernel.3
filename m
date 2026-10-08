Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EDECA600D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 05:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RrJHqVEE809VPtPoK85AUD6Bvdktoej0RW32RmBaNCM=; b=2BU/82g095dn93gO8XnFHLPAWo
	Yy3ZRfyfryBNqAqO1UGUnMvafske+DSCLTYQH1D+ornV1Hg9K+E305XJ3QOA/o2ExT4qVCN4Jov+4
	9CLMTr/jo60c3003nmPNbUCOYrLhpzGxgkFpxEKf28jg5uTlWsd3Hkch9AvskE6dTsCjqo1YIRqb3
	eeHDob9uwap6Wcpcf57RzTQ8/1OVWK5CatuvVe5lmz+f+y/T47A7v4fgKei8VKl2ZoSa0VNsvmhH1
	XWHG7oRj561O1yVQW0Nljub00CKjBjyahoXSSTtnjWastaon91BWf86W48BE77WwbzPFm7SnCkw5N
	Eu0K0OlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEgpN-00000003YTd-0Xi0;
	Thu, 08 Oct 2026 05:38:01 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEgpK-00000003YSQ-2Gdq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 05:37:59 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48afbd2c386so2022588f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 22:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791437877; x=1792042677; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RrJHqVEE809VPtPoK85AUD6Bvdktoej0RW32RmBaNCM=;
        b=Fdt/wtmIFwpZt5BwxtRiMPflbAhr1IaM0ICm0C2TDEpGGaQeebpcgUJJyRjDtL6GK2
         hdE1nXAifrFr8wxObuIIsCYGIULl5hWSC89OpIKvsHkSREmNPd73AMmZZDd5S2bq7gVb
         oHDFQ6Gc0TzI6RoA5yJkelMp4u215RtA7i+4LN2F1/dqHzzcUvgRaHgD9CQQWoz11Gbx
         WS0I009prEVCJkM57jvaYHBDS8i5YUKJZWsQP9D3rBPetlbIRdegteYEjVkS9IQC/tBL
         pRr3Y92DvFOxpy/h6f37K+darm5mKpg0vzfXoe8hqlKLJU17fXESgdvW1ErrLDMRhNBr
         d7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791437877; x=1792042677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RrJHqVEE809VPtPoK85AUD6Bvdktoej0RW32RmBaNCM=;
        b=SicwdazENVmvz7zCSxXzRxWc5IGrTU1iKAh0lXceKtzt0JNtCHUaW6u2XCv/yFUsIK
         nltU7ngL/k+cA9xjlz0X28U/4wfNRU66YqfsIB9r2KhsDFG+rS8N6moZESJfQaUqBrHR
         MEPGmI5mUshDQ00p0kDa5y7clgUg4ToRStWOYaPM32Og2jTgbC2zk0trg8u8vNtHa8G8
         B45uO7HkhlfL5t0LKewEod92J03+NVfPUnzAuVN/XWYiNOGTiEXuUv652QNjN3l9kluC
         MsFJPKmhNASgfZdbIvAs3rxK1vaT6J3MCv0q08QF3BNvh7t39sO5ZgAVIHTThirlmHG+
         HesQ==
X-Forwarded-Encrypted: i=1; AKwUvBzr8YHXKdvEj9NQoHWJvpYOsaVWemjmFKcScJkD/CIH6hDT/1NPkHlJeTbCLeNzsur9xeOkOLvP2Z9tX0Mugqu/@lists.infradead.org
X-Gm-Message-State: AFq9FYJHjb9ikM9I8OzHccSubu7eZ/PxIUUVBTMRtLvBPo3saoEwG11n
	76/8dd1vj5QkM6W6bJ8auaTwdSvoJRvpsG6LaLg4SlcXl3hiinRRhCfK
X-Gm-Gg: AYBFou16YPznmrr7XMoM7WlzsPY8uTl/vCerl+eMq7C8l0z0q0xWrXPmafqKzEt4/MF
	Jvv79WKAjdPeu8fD3GYpdaobhicqixi7VUfoFCZLPc9II7S/TikFpJle7qCmRipGiQkZXa7H/9g
	036pOtWdphVIfYmrKOAi8rn6AT0qXTuU4tpXapeeEpigzmK3ufKW0HhUkIt7bUO4YXJfteXrU0c
	udl15WjbIK/BNqEy74ITgMtNzQzICuu9QQqeNoJBm2nCzDiGCXJH/SxWMMymGtgT7VFsDfAJa0U
	bdzI9Y41Jekyx+qXbAkrfZnoyOmBKxttGKspcpu6T1oaY2pS8pQHApOGCiKuQL21ipkGTT8Kh/S
	/vKgJ9EeB6yc6axEPDRpkZXxVT8jSvt9nUcDFNMHYj8paWpwaDrdBZOETjqjcmWbRfg94h/g5h3
	OYw5rYKNAKj8shtRsxu/9syN2LfXTHpo4NCoRLOB8zncGPb73aDIhf4z2RoEwcX+aAA9r58Fx8f
	zUHDiTFDiGvaZ+zNif60Kv9sxI0R8nztk4hyfXDoLS0KSfwjDfzDaqtkIE8U1jfv6iix4Txmp5F
	BeD7vZ3DbGZrNCX4Ae0TSlB7cUmwbZyb0z+7qOOV6Dxj3nAmcj4R4Mz7pRrkWFrARyJspirDHvX
	XzUfzNyQ=
X-Received: by 2002:a05:6000:2281:b0:488:89c7:31aa with SMTP id ffacd0b85a97d-48c728852dfmr8353187f8f.39.1791437876591;
        Wed, 07 Oct 2026 22:37:56 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad61-5a01-743c-891f-b33c-cae7.310.pool.telefonica.de. [2a02:3100:ad61:5a01:743c:891f:b33c:cae7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1f8fbsm8458219f8f.33.2026.10.07.22.37.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Oct 2026 22:37:55 -0700 (PDT)
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
Subject: [PATCH v2 1/6] ARM: cmpxchg: always inline __arch_xchg() and __cmpxchg()
Date: Thu,  8 Oct 2026 07:37:41 +0200
Message-Id: <20261008053746.49631-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261008053746.49631-1-kmehltretter@gmail.com>
References: <20261008053746.49631-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_223758_612436_1E6049F9 
X-CRM114-Status: GOOD (  14.11  )
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

__arch_xchg(), __cmpxchg() and __cmpxchg_local() end in a default case
that calls an undefined function. That turns an unsupported size into a
link error. It relies on the functions being inlined, so that the
compiler can drop the default case for a constant size.

They are only marked inline. gcc 8.1.0 with CC_OPTIMIZE_FOR_SIZE does
not inline them in rust/helpers/helpers.c, which calls xchg() and
cmpxchg() from many small helpers. The out-of-line copies keep the
default case and the link fails.

  helpers.c:(.text+0x424): undefined reference to `__bad_xchg'
  helpers.c:(.text+0x4ac): undefined reference to `__bad_cmpxchg'

Seen with bcm2835_defconfig and CONFIG_RUST=y on v7.3-rc1. The same
config links with CONFIG_RUST=n. It also links with gcc 15.2.0 and
with clang.

v6.19 links. Commit ab717dd98bee ("rust: helpers: Add i8/i16 atomic
xchg_acquire helpers") in v7.0 triggers __bad_xchg. Commit
ac8f06ade38a ("rust: sync: atomic: Add Atomic<*{mut,const} T> support")
in v7.1 also triggers __bad_cmpxchg.

Mark the functions __always_inline.

Fixes: ab717dd98bee ("rust: helpers: Add i8/i16 atomic xchg_acquire helpers")
Fixes: ac8f06ade38a ("rust: sync: atomic: Add Atomic<*{mut,const} T> support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm/include/asm/cmpxchg.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/include/asm/cmpxchg.h b/arch/arm/include/asm/cmpxchg.h
index 9beb64d30586..0ce5225af442 100644
--- a/arch/arm/include/asm/cmpxchg.h
+++ b/arch/arm/include/asm/cmpxchg.h
@@ -26,7 +26,7 @@
 #define swp_is_buggy
 #endif
 
-static inline unsigned long
+static __always_inline unsigned long
 __arch_xchg(unsigned long x, volatile void *ptr, int size)
 {
 	extern void __bad_xchg(volatile void *, int);
@@ -155,8 +155,8 @@ extern void __bad_cmpxchg(volatile void *ptr, int size);
  * cmpxchg only support 32-bits operands on ARMv6.
  */
 
-static inline unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
-				      unsigned long new, int size)
+static __always_inline unsigned long
+__cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, int size)
 {
 	unsigned long oldval, res;
 
@@ -220,9 +220,9 @@ static inline unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
 				      sizeof(*(ptr)));			\
 })
 
-static inline unsigned long __cmpxchg_local(volatile void *ptr,
-					    unsigned long old,
-					    unsigned long new, int size)
+static __always_inline unsigned long
+__cmpxchg_local(volatile void *ptr, unsigned long old, unsigned long new,
+		int size)
 {
 	unsigned long ret;
 
-- 
2.39.5 (Apple Git-154)


