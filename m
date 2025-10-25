Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3456ACCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 16:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7/JFSnIjaD6DTDEOO1oZNxHniLLcLZti7jNstgpjRDc=; b=zgpmHuyTFxdb1ax8uikyUg6a+F
	yoH19A0KPxR6u7XMAcWne6RlaO0gz5qHuBHdKqXdcdVbFgPTujlTG+VWsLgP5fANNWK+DeMoxzvzK
	mTV0Qldx7/XgXHRJqfPFAQ8QmA+btRYSBlBIhM2jSm5T3QcaX2q8d6nOFy8wpRzobNLiTfAkv6Evd
	V3ovd61RQeX6ga9vTPFXx0wkkwN3SkEqoKz52C81xtED5teBZ9U+IXM7Cgd5Ero73IA8QwzC8xi9V
	p5pBeRBgal8gYfoRbsqQuIl+Z/FSCaTDgBZbV8JCypa7L7x/ZTvUTcR6UDDilwi+wFtuMm8+p6THm
	jrfbq1pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vChCe-0000000BWjx-0qTc;
	Sat, 25 Oct 2025 16:33:16 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vChCb-0000000BWiy-1Lde
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 16:33:14 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-87fc4d29301so14031956d6.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Oct 2025 09:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761409992; x=1762014792; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7/JFSnIjaD6DTDEOO1oZNxHniLLcLZti7jNstgpjRDc=;
        b=fKLWg7JKZN3/uCr0FLIpYTY5lg2PFFRHstvSS+bnYyFC2Z51nxdIqvDWBuZwOekgqt
         v5dWJ7PmT0Lcrbsg66Y4fPvnd+Yf8Z5ZIp399yANNwY94iqseAtaRwgZ1fI5rDcBnczN
         9xVDak1ZcxvWDN+oQQ3kkOlYHKLXOJ61ZWK9Sgbfchx9viOaQs6G0MwHXsMdQsoxjB79
         2UddsZGZYsNRWakCWbIYAqB7tLXgOJaIR2yqgnAaZ4qlk6mdCy8BCQNLo2Iq2trRsLW6
         Axiqwng0NUagKXyQDgDR9E3wFGL/6PHfxvghRKCObgB3l5gf2/vJMtUkHhB+yWLSXekL
         wW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761409992; x=1762014792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7/JFSnIjaD6DTDEOO1oZNxHniLLcLZti7jNstgpjRDc=;
        b=JSiD6RBHsU+5B52BDjjugFOYzdFwoxwmwLeYZrxWxhDMhoEvTHrOwhLumGaGWvDxS5
         Ub8dJMBmRtbBcfaR23cv29R00vbc6H+3arK8zICPkVNqMtpdfzJvSD8IVwJENsdNIfE4
         YXU3LIIedLrXsirYbvCDzzyAKa3hKo7fRAgp791VxybT5dEzmyR/BD5e+A5sjP3xA+Gp
         KLURHs6I7pnqEH0SGdm8YZtDA3XKEjzj/UKNMcA+Q/eu3ZARH7bbaZqTCxdyYxjshRJp
         /YkBxfwqAEP/E7HJBG3Y/9C8mur5AFYhiGkEYWJ0D0m6qF+Z/MMmqjN7Fk9Iz5EHoWqL
         zZ1g==
X-Forwarded-Encrypted: i=1; AJvYcCXSdoRnWgBXhu9AZ+PNv3Qmzlp3DHaoNPTFeBTCRektzdi2+4SQgRbP9s/H7AzmsEngiDbjA2rk3ZUBNIawBMg2@lists.infradead.org
X-Gm-Message-State: AOJu0YwCd06rPhLaKPlzmfhMRe1BsKFiL1PxqzNRXZnzow//+P0XRJIf
	DvOyAC1/NtsNzces0YK4Ic4K1osG2hPBsKx22eeGcS+89uhu3rjVmmCY3eYIfg==
X-Gm-Gg: ASbGncsPjDHuaffjIMv3G4XwzaFfDBLl3LwyZALAfc5+bG/4tZOK7NPO8C3dSPgxTrw
	kHWK1IzEjH+pgWqxkG/uqnhG+DpQUdmhysmO3TeE11KHiaIrlAlekc675+YBd92MmwlJs/7ClZk
	jehkH9fAb3P+/8qRCzZAsY8Uz0YTRpZWYpxRKSerTfJQXdHSd9CZDeo92uIG0tQmx2oDD69I9bc
	B55ba1afRhgf0zHhAKgp0DPcyPjZJzmteEGWKy2cmv16Qeu3eS7RXxbTZ64twnylDK7+baTDyH4
	cPlqvH5jGXsL9UOp+aO+OoNDNZ1Luh5Pd2w/G38UJK5lzQ79qucvK/8TCY1TLD5sjMTD/R/GHr5
	EZNIjBCzEHjWoOftGMiuycpU1pfI0knfKCN0Vf2uMzzvByYBQxBE/EtCd1D4XSW6aWHw+CrVqSg
	6EEnElD1w=
X-Google-Smtp-Source: AGHT+IHVYDsqKWbYt2Nmb/p8bTfk7JqCLafoGcRUy2c7z6Z4BfX/omQyQkhSyRFtxDz8s1NdOAjCIw==
X-Received: by 2002:a05:6214:248a:b0:7a3:b6ab:6f2 with SMTP id 6a1803df08f44-87c206612e2mr191871606d6.63.1761409991997;
        Sat, 25 Oct 2025 09:33:11 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc51e3809sm15261996d6.26.2025.10.25.09.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 09:33:10 -0700 (PDT)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH 09/21] bits: generalize BITMAP_{FIRST,LAST}_WORD_MASK
Date: Sat, 25 Oct 2025 12:32:51 -0400
Message-ID: <20251025163305.306787-2-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025162858.305236-1-yury.norov@gmail.com>
References: <20251025162858.305236-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_093313_365919_00E7FC44 
X-CRM114-Status: GOOD (  10.93  )
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

The macros are helpful in many non-bitmap places too. Move them from
bitmap.h to bits.h.

Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 include/linux/bitmap.h | 7 +++++--
 include/linux/bits.h   | 8 ++++++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
index 595217b7a6e7..fbe2d12bceab 100644
--- a/include/linux/bitmap.h
+++ b/include/linux/bitmap.h
@@ -223,8 +223,11 @@ void bitmap_onto(unsigned long *dst, const unsigned long *orig,
 void bitmap_fold(unsigned long *dst, const unsigned long *orig,
 		unsigned int sz, unsigned int nbits);
 
-#define BITMAP_FIRST_WORD_MASK(start) (~0UL << ((start) & (BITS_PER_LONG - 1)))
-#define BITMAP_LAST_WORD_MASK(nbits) (~0UL >> (-(nbits) & (BITS_PER_LONG - 1)))
+#define BITMAP_FIRST_WORD_MASK(start) LAST_BITS(start)
+#define BITMAP_LAST_WORD_MASK(nbits) FIRST_BITS(nbits)
+
+#define BITMAP_FIRST_WORD_MASK_ULL(start) LAST_BITS(start)
+#define BITMAP_LAST_WORD_MASK_ULL(nbits) FIRST_BITS(nbits)
 
 #define bitmap_size(nbits)	(ALIGN(nbits, BITS_PER_LONG) / BITS_PER_BYTE)
 
diff --git a/include/linux/bits.h b/include/linux/bits.h
index c7c587e90e2d..0d2950b80a3b 100644
--- a/include/linux/bits.h
+++ b/include/linux/bits.h
@@ -5,6 +5,14 @@
 #include <vdso/bits.h>
 #include <uapi/linux/bits.h>
 
+/* Mask with first nbist set */
+#define FIRST_BITS(nbits) (~0UL >> (-(nbits) & (BITS_PER_LONG - 1)))
+#define FIRST_BITS_ULL(nbits) (~0ULL >> (-(nbits) & (BITS_PER_LONG_LONG - 1)))
+
+/* Mask with all bits before start unset */
+#define LAST_BITS(start) (~0UL << ((start) & (BITS_PER_LONG - 1)))
+#define LAST_BITS_ULL(start) (~0ULL << ((start) & (BITS_PER_LONG_LONG - 1)))
+
 #define BIT_MASK(nr)		(UL(1) << ((nr) % BITS_PER_LONG))
 #define BIT_WORD(nr)		((nr) / BITS_PER_LONG)
 #define BIT_ULL_MASK(nr)	(ULL(1) << ((nr) % BITS_PER_LONG_LONG))
-- 
2.43.0


