Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AFECCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 16:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fSxoEFGAAolVhXFywte18CkthEXwJuFOJ2hIbnLSDSg=; b=o1HCixKniBd/WdkI8lzdjQnUY4
	ZKfJVXO144xC5qrethHC1LK+/9ELauoHrDF6Wlr6qN/c933RbbVU2lNJ3fjZYaeYRTiRuaOgHoGgo
	Ba+1YkL/DTqZDo7agMDKQjvKFdEII3aLjIcWoYGp1EWXI1eEL+f3AKB+kOqEmoF86BsJYWuvtvhD0
	cHa8vaw5VI5HyZXVXiZCjloiDbUXrMDQbw3nPebl/6X4V0DH1n0yTW588Kh7cUOZUFi6OQp/SvoPO
	8slu1Qpq9GUyrJn0e+mG1JpgFp46KAmLXFAMgDVwtvS1hXJoRnU9UFH2/NRx69iVfjDZkM42guG4Z
	dXV2Mj2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vChCo-0000000BWqV-0m96;
	Sat, 25 Oct 2025 16:33:26 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vChCj-0000000BWlh-0bgQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 16:33:22 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4eb9ca96781so17153231cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Oct 2025 09:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761410000; x=1762014800; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fSxoEFGAAolVhXFywte18CkthEXwJuFOJ2hIbnLSDSg=;
        b=Q/i0BMy4Xli+JgXeAF8n84aKCMyi8LlcZsgNTiSUfCZUAWBGHw2HmtTbhRbJvUgm3x
         8wDCG+QmYOzQzBeaLEMzhb53PDiEPuh5jkgAI4QIx6thV+KLjk0VamzWh47CbwKdrw8q
         jJ48Kbb5vd4yTXQCX1lmyEhacwCqse2m4SNgqY2R4uKC/BnN+aAFc0bn9JfSOlLrDWgJ
         6YyOUXOZL8AMTr5ycKrFSsKtejcmuI9dhXD6JUKjdjjc4tCkXIahv5wlUS9WWcUIpWzI
         QQ4s4wPNeF/QoBZD0NbYgFefMYtit17TebDigWjKiMHLsschLR2fWGOYVXxPon7t9gJT
         5ncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761410000; x=1762014800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fSxoEFGAAolVhXFywte18CkthEXwJuFOJ2hIbnLSDSg=;
        b=a6JNuy3xfdLR9xOVpypgknvQnuCCHzASc/2KwciqDTn5TJmIYSfluXFmjhFFNH5fFa
         Zao8DDd1bo6JVgUZ+wmFVSym6pMYP2GkiMd81SQU5Sf+Uzj+qsmsah+LOBTuNO6fRwBK
         oOLe7oTVWNW/7IcCf133CGwxzZ/kHiGuDWBh7KQkFdspbBtGH45w3f5tC2pyLaQ4h8qA
         hbmXuYn1pZAleaiLwyz6r2Cz1C0sYt/oknNKyCwtUDDcfwb2T5ijCwocSN8WTN+cY9KM
         U+CMJati1qws46FWlF83gHJYnu6OgJqXsApqzzpY0MuUMNUx5AtNBMryrFY9HlHfV6mE
         M+hQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuRAc2yK6qJpiS70mWR3bGnlP+eMUJTg7YunXF/fWYiXVyBMXfnJaKZaXVhOmsTUs6Zte6PELGfKFBgVk0j7V9@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+gWbpwlNhSqaCWRLW29l4QdbU6vrIrg9ZQmfT5R1AV6I3VC3N
	Be7kSK8ZOZTvxORZkBZzrIKc3MYB4GNUyn9o5r9NwJh7M/g4nOnPcYJn
X-Gm-Gg: ASbGnctHd6HHAMWWI8CTeTDJkC6aFWr9U3kxif/uMBz69hYDIKPn2b6ZlvqhU8lLtDQ
	UB1SmBZSpEOCmSlmvNfFtRlbZGP3b8GNSgKoad6NbbUzSRXuT3qsu0x1MwbV38wCGwDXjvfgiKK
	pDnOb+C10NKf+UV1MpxQrFEXkC2trn/CtfdGY2buMhJDTVTXMUX3CBUDXbMGDhXOGIPj3pKnU3r
	o1Hgr0HpsUkybCeS1l8ZXTHxmDZpR059fua6aALrko0W2PYc9CBdupuKZcAHzmP5fcxo3bC2Wc+
	lKu1TwLh8wG0Tu02xEhivHf9m9kp8hqD86Lo5Xs21D6TvRn1aC8Jkhbx95FTqVxAt2ykuHS8QHF
	CCBXdDxKbp7LJxTNZ0QAuqG9gcKivhgp3ogluo0rxAOlreQ3GZvGOtIUMtdg/7v1SYmhzrpoN
X-Google-Smtp-Source: AGHT+IFwY9Y3BAwsQLIpG2h0HJ31eBt8/+nMYp6HoC42JMSxN357FYrFvS1io5FJ90lWGu4fEjCzyg==
X-Received: by 2002:a05:622a:4d48:b0:4eb:a915:c213 with SMTP id d75a77b69052e-4eba915c5a0mr20033121cf.65.1761410000104;
        Sat, 25 Oct 2025 09:33:20 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc48ca5bcsm16552366d6.13.2025.10.25.09.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 09:33:19 -0700 (PDT)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 12/21] bitmap: don't use GENMASK()
Date: Sat, 25 Oct 2025 12:32:54 -0400
Message-ID: <20251025163305.306787-5-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025162858.305236-1-yury.norov@gmail.com>
References: <20251025162858.305236-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_093321_205419_3F018556 
X-CRM114-Status: GOOD (  15.96  )
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

GENMASK(high, low) notation is confusing. Switch to a more natural
BITS(low, high) mask generator, or FIRST/LAST_BITS() as appropriate.

Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 include/linux/bitmap.h |  4 ++--
 include/linux/find.h   | 34 +++++++++++++++++-----------------
 lib/bitmap.c           |  2 +-
 lib/test_bitmap.c      | 14 +++++++-------
 4 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
index fbe2d12bceab..3bed29f1780b 100644
--- a/include/linux/bitmap.h
+++ b/include/linux/bitmap.h
@@ -473,7 +473,7 @@ void bitmap_set(unsigned long *map, unsigned int start, unsigned int nbits)
 	if (__builtin_constant_p(nbits) && nbits == 1)
 		__set_bit(start, map);
 	else if (small_const_nbits(start + nbits))
-		*map |= GENMASK(start + nbits - 1, start);
+		*map |= BITS(start, start + nbits - 1);
 	else if (__builtin_constant_p(start & BITMAP_MEM_MASK) &&
 		 IS_ALIGNED(start, BITMAP_MEM_ALIGNMENT) &&
 		 __builtin_constant_p(nbits & BITMAP_MEM_MASK) &&
@@ -489,7 +489,7 @@ void bitmap_clear(unsigned long *map, unsigned int start, unsigned int nbits)
 	if (__builtin_constant_p(nbits) && nbits == 1)
 		__clear_bit(start, map);
 	else if (small_const_nbits(start + nbits))
-		*map &= ~GENMASK(start + nbits - 1, start);
+		*map &= ~BITS(start, start + nbits - 1);
 	else if (__builtin_constant_p(start & BITMAP_MEM_MASK) &&
 		 IS_ALIGNED(start, BITMAP_MEM_ALIGNMENT) &&
 		 __builtin_constant_p(nbits & BITMAP_MEM_MASK) &&
diff --git a/include/linux/find.h b/include/linux/find.h
index 9d720ad92bc1..24d7266fd02b 100644
--- a/include/linux/find.h
+++ b/include/linux/find.h
@@ -66,7 +66,7 @@ unsigned long find_next_bit(const unsigned long *addr, unsigned long size,
 		if (unlikely(offset >= size))
 			return size;
 
-		val = *addr & GENMASK(size - 1, offset);
+		val = *addr & BITS(offset, size - 1);
 		return val ? __ffs(val) : size;
 	}
 
@@ -96,7 +96,7 @@ unsigned long find_next_and_bit(const unsigned long *addr1,
 		if (unlikely(offset >= size))
 			return size;
 
-		val = *addr1 & *addr2 & GENMASK(size - 1, offset);
+		val = *addr1 & *addr2 & BITS(offset, size - 1);
 		return val ? __ffs(val) : size;
 	}
 
@@ -127,7 +127,7 @@ unsigned long find_next_andnot_bit(const unsigned long *addr1,
 		if (unlikely(offset >= size))
 			return size;
 
-		val = *addr1 & ~*addr2 & GENMASK(size - 1, offset);
+		val = *addr1 & ~*addr2 & BITS(offset, size - 1);
 		return val ? __ffs(val) : size;
 	}
 
@@ -157,7 +157,7 @@ unsigned long find_next_or_bit(const unsigned long *addr1,
 		if (unlikely(offset >= size))
 			return size;
 
-		val = (*addr1 | *addr2) & GENMASK(size - 1, offset);
+		val = (*addr1 | *addr2) & BITS(offset, size - 1);
 		return val ? __ffs(val) : size;
 	}
 
@@ -185,7 +185,7 @@ unsigned long find_next_zero_bit(const unsigned long *addr, unsigned long size,
 		if (unlikely(offset >= size))
 			return size;
 
-		val = *addr | ~GENMASK(size - 1, offset);
+		val = *addr | ~BITS(offset, size - 1);
 		return val == ~0UL ? size : ffz(val);
 	}
 
@@ -206,7 +206,7 @@ static __always_inline
 unsigned long find_first_bit(const unsigned long *addr, unsigned long size)
 {
 	if (small_const_nbits(size)) {
-		unsigned long val = *addr & GENMASK(size - 1, 0);
+		unsigned long val = *addr & FIRST_BITS(size);
 
 		return val ? __ffs(val) : size;
 	}
@@ -235,7 +235,7 @@ unsigned long find_nth_bit(const unsigned long *addr, unsigned long size, unsign
 		return size;
 
 	if (small_const_nbits(size)) {
-		unsigned long val =  *addr & GENMASK(size - 1, 0);
+		unsigned long val =  *addr & FIRST_BITS(size);
 
 		return val ? fns(val, n) : size;
 	}
@@ -261,7 +261,7 @@ unsigned long find_nth_and_bit(const unsigned long *addr1, const unsigned long *
 		return size;
 
 	if (small_const_nbits(size)) {
-		unsigned long val =  *addr1 & *addr2 & GENMASK(size - 1, 0);
+		unsigned long val =  *addr1 & *addr2 & FIRST_BITS(size);
 
 		return val ? fns(val, n) : size;
 	}
@@ -291,7 +291,7 @@ unsigned long find_nth_and_andnot_bit(const unsigned long *addr1,
 		return size;
 
 	if (small_const_nbits(size)) {
-		unsigned long val =  *addr1 & *addr2 & (~*addr3) & GENMASK(size - 1, 0);
+		unsigned long val =  *addr1 & *addr2 & (~*addr3) & FIRST_BITS(size);
 
 		return val ? fns(val, n) : size;
 	}
@@ -315,7 +315,7 @@ unsigned long find_first_and_bit(const unsigned long *addr1,
 				 unsigned long size)
 {
 	if (small_const_nbits(size)) {
-		unsigned long val = *addr1 & *addr2 & GENMASK(size - 1, 0);
+		unsigned long val = *addr1 & *addr2 & FIRST_BITS(size);
 
 		return val ? __ffs(val) : size;
 	}
@@ -339,7 +339,7 @@ unsigned long find_first_andnot_bit(const unsigned long *addr1,
 				 unsigned long size)
 {
 	if (small_const_nbits(size)) {
-		unsigned long val = *addr1 & (~*addr2) & GENMASK(size - 1, 0);
+		unsigned long val = *addr1 & (~*addr2) & FIRST_BITS(size);
 
 		return val ? __ffs(val) : size;
 	}
@@ -364,7 +364,7 @@ unsigned long find_first_and_and_bit(const unsigned long *addr1,
 				     unsigned long size)
 {
 	if (small_const_nbits(size)) {
-		unsigned long val = *addr1 & *addr2 & *addr3 & GENMASK(size - 1, 0);
+		unsigned long val = *addr1 & *addr2 & *addr3 & FIRST_BITS(size);
 
 		return val ? __ffs(val) : size;
 	}
@@ -385,7 +385,7 @@ static __always_inline
 unsigned long find_first_zero_bit(const unsigned long *addr, unsigned long size)
 {
 	if (small_const_nbits(size)) {
-		unsigned long val = *addr | ~GENMASK(size - 1, 0);
+		unsigned long val = *addr | ~FIRST_BITS(size);
 
 		return val == ~0UL ? size : ffz(val);
 	}
@@ -406,7 +406,7 @@ static __always_inline
 unsigned long find_last_bit(const unsigned long *addr, unsigned long size)
 {
 	if (small_const_nbits(size)) {
-		unsigned long val = *addr & GENMASK(size - 1, 0);
+		unsigned long val = *addr & FIRST_BITS(size);
 
 		return val ? __fls(val) : size;
 	}
@@ -537,7 +537,7 @@ unsigned long find_next_zero_bit_le(const void *addr, unsigned
 		if (unlikely(offset >= size))
 			return size;
 
-		val = swab(val) | ~GENMASK(size - 1, offset);
+		val = swab(val) | ~BITS(offset, size - 1);
 		return val == ~0UL ? size : ffz(val);
 	}
 
@@ -550,7 +550,7 @@ static __always_inline
 unsigned long find_first_zero_bit_le(const void *addr, unsigned long size)
 {
 	if (small_const_nbits(size)) {
-		unsigned long val = swab(*(const unsigned long *)addr) | ~GENMASK(size - 1, 0);
+		unsigned long val = swab(*(const unsigned long *)addr) | ~FIRST_BITS(size);
 
 		return val == ~0UL ? size : ffz(val);
 	}
@@ -570,7 +570,7 @@ unsigned long find_next_bit_le(const void *addr, unsigned
 		if (unlikely(offset >= size))
 			return size;
 
-		val = swab(val) & GENMASK(size - 1, offset);
+		val = swab(val) & BITS(offset, size - 1);
 		return val ? __ffs(val) : size;
 	}
 
diff --git a/lib/bitmap.c b/lib/bitmap.c
index b97692854966..ec11cc36624e 100644
--- a/lib/bitmap.c
+++ b/lib/bitmap.c
@@ -876,7 +876,7 @@ void bitmap_to_arr64(u64 *buf, const unsigned long *bitmap, unsigned int nbits)
 
 	/* Clear tail bits in the last element of array beyond nbits. */
 	if (nbits % 64)
-		buf[-1] &= GENMASK_ULL((nbits - 1) % 64, 0);
+		buf[-1] &= FIRST_BITS_ULL(nbits);
 }
 EXPORT_SYMBOL(bitmap_to_arr64);
 #endif
diff --git a/lib/test_bitmap.c b/lib/test_bitmap.c
index c83829ef557f..c198fc7a66d2 100644
--- a/lib/test_bitmap.c
+++ b/lib/test_bitmap.c
@@ -692,10 +692,10 @@ static void __init test_bitmap_arr64(void)
 		}
 
 		if ((nbits % 64) &&
-		    (arr[(nbits - 1) / 64] & ~GENMASK_ULL((nbits - 1) % 64, 0))) {
+		    (arr[(nbits - 1) / 64] & ~FIRST_BITS_ULL(nbits))) {
 			pr_err("bitmap_to_arr64(nbits == %d): tail is not safely cleared: 0x%016llx (must be 0x%016llx)\n",
 			       nbits, arr[(nbits - 1) / 64],
-			       GENMASK_ULL((nbits - 1) % 64, 0));
+			       FIRST_BITS_ULL(nbits));
 			failed_tests++;
 		}
 
@@ -1217,7 +1217,7 @@ static void __init test_bitmap_const_eval(void)
 	 * in runtime.
 	 */
 
-	/* Equals to `unsigned long bitmap[1] = { GENMASK(6, 5), }` */
+	/* Equals to `unsigned long bitmap[1] = { BITS(5, 6), }` */
 	bitmap_clear(bitmap, 0, BITS_PER_LONG);
 	if (!test_bit(7, bitmap))
 		bitmap_set(bitmap, 5, 2);
@@ -1229,9 +1229,9 @@ static void __init test_bitmap_const_eval(void)
 	/* Equals to `unsigned long var = BIT(25)` */
 	var |= BIT(25);
 	if (var & BIT(0))
-		var ^= GENMASK(9, 6);
+		var ^= BITS(6, 9);
 
-	/* __const_hweight<32|64>(GENMASK(6, 5)) == 2 */
+	/* __const_hweight<32|64>(BITS(5, 6)) == 2 */
 	res = bitmap_weight(bitmap, 20);
 	BUILD_BUG_ON(!__builtin_constant_p(res));
 	BUILD_BUG_ON(res != 2);
@@ -1241,8 +1241,8 @@ static void __init test_bitmap_const_eval(void)
 	BUILD_BUG_ON(!__builtin_constant_p(res));
 	BUILD_BUG_ON(!res);
 
-	/* BIT(2) & GENMASK(14, 8) == 0 */
-	res = initvar & GENMASK(14, 8);
+	/* BIT(2) & BITS(8, 14) == 0 */
+	res = initvar & BITS(8, 14);
 	BUILD_BUG_ON(!__builtin_constant_p(res));
 	BUILD_BUG_ON(res);
 
-- 
2.43.0


