Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB87C36018
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 00:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mEgmoeCU7ZoBbD/6q07yzTwvuV9KDxvtvsClWJ9QuF8=; b=XtdJTliEvtbNrZJtbA7uWN8wyK
	0c8+OAKa8ltgqGG7Ne+xJAN35vkE4mxbFuSk5Vr0Re8NI70Hlvu7ftTIuea16/CUtD+g0mdya1VWu
	KAxYZ/wJjOcf12WyWR/B0Q4mnCrJJG5w4utL0CYkyF4OO6W394fEHXEXnYxulxwvW04HGLtnyChB3
	ai2/RtO2XFsDchn80wrw5oq/60ztSmUErKhJZhA64imHlr07//kSMcGMf1fFypoBvQcSqKlLykc2Q
	DnwDc4pm/DtLP2ANAEKdregioqTnDdrinDZQyDhkykQgIJI2i8/Ueq3pb5s9rYRQTcdG0TqXNb7NA
	R0X5WlIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u08Gp-00000007UKq-2bUK;
	Thu, 03 Apr 2025 00:17:23 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u088O-00000007TLK-2CPd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 00:08:41 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-3052d29759bso458702a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 17:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743638919; x=1744243719; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mEgmoeCU7ZoBbD/6q07yzTwvuV9KDxvtvsClWJ9QuF8=;
        b=nDg8pUiLQTowHgjn89t/H6J7w3G4TAAMrIc1pvQi113GI3kgVEeukyRdpVIKWOSwsa
         G8TECO83itav2yuRXcWPqDZGPdUzXpGW7NjBFxcyM9daC240NB/NCvByzvGhqsJ5xzSp
         JyQ0UOg0cE85JwfQapLWSZcbNRYuubzXDQBHMsyBw6oFNrCPSIeN3YPaNB4aMVLHY9CO
         cvyHdu5Ntdh0mE0PAAj4IBsJja8F1MCXMJSGdfHTnD6K42UQfMM1Jid889bISwmXbVMf
         hm8Cqux2EvDZHWq2UBRNo/iBYQhkcJRk7VIPfd0WN8h5Y+z7/qq+Bum4LwGJUFB9xXKN
         JCZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743638919; x=1744243719;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mEgmoeCU7ZoBbD/6q07yzTwvuV9KDxvtvsClWJ9QuF8=;
        b=p7Y6Varz+4ADE4Fw0A5808gj1aEGmY4CD9jPdnFclx/OM0DRtEqPjgYKNMRKpcvH/s
         Rc9NXQGtJYmSL68+HFxKQGGWNIEcqoAA0Q0g/jc1ja056uIkTbB/sye0Xo9z/uqYnuVv
         q/ECwfszvokre0gQa1YMH5aO6z4fvmEbDYGOp0ISUszCcVjLx7f7UAv7ujW1AnjvmD/T
         LPPbZyCeeeeCw/iRU2Fb5cm3IYy+Eoo5gbPPNDMv4zN+CFoIWx9YzVcTXpFQKxYOaoFZ
         bWgnWwTq67ll/67KR3v+Ow4yTR4m5XZtPdbP4ldIRsvhb51cY4DeUJffiGxfYwAjSy7b
         98NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVy9uyNaBO/SOWXtCRe6a7/Lx2H1QcypZ37h/hsa85SG3N+twmrrvyMfViTzWrJAMAnjLvCejntaMmgRvXiRBYR@lists.infradead.org
X-Gm-Message-State: AOJu0YyA4wl2b0D22+xIGNAgU0LbyL30x5uySS4ACYYjeear0DOUDXjl
	rPEIFC2tumZl2Jpe2dVO5PGzHSa0fOhA0bTJ4MB50NZGjRabCAeaGCpGlgD+Dn4vsA==
X-Google-Smtp-Source: AGHT+IEn+KDt633hxPIy/Xv0o5YX2H1GlYC0LI3Wy6iiMYKkwRX/0697A1IGauH6w3mSOoDfNBnB/3U=
X-Received: from pjbsu16.prod.google.com ([2002:a17:90b:5350:b0:2ea:9d23:79a0])
 (user=pcc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5241:b0:2ff:58a4:9db5
 with SMTP id 98e67ed59e1d1-3056ef46f92mr5028152a91.30.1743638918950; Wed, 02
 Apr 2025 17:08:38 -0700 (PDT)
Date: Wed,  2 Apr 2025 17:06:59 -0700
In-Reply-To: <20250403000703.2584581-1-pcc@google.com>
Mime-Version: 1.0
References: <20250403000703.2584581-1-pcc@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250403000703.2584581-2-pcc@google.com>
Subject: [PATCH v5 1/2] string: Add load_unaligned_zeropad() code path to sized_strscpy()
From: Peter Collingbourne <pcc@google.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>
Cc: Peter Collingbourne <pcc@google.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_170840_562921_C1BF1C8E 
X-CRM114-Status: GOOD (  15.04  )
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

The call to read_word_at_a_time() in sized_strscpy() is problematic
with MTE because it may trigger a tag check fault when reading
across a tag granule (16 bytes) boundary. To make this code
MTE compatible, let's start using load_unaligned_zeropad()
on architectures where it is available (i.e. architectures that
define CONFIG_DCACHE_WORD_ACCESS). Because load_unaligned_zeropad()
takes care of page boundaries as well as tag granule boundaries,
also disable the code preventing crossing page boundaries when using
load_unaligned_zeropad().

Signed-off-by: Peter Collingbourne <pcc@google.com>
Link: https://linux-review.googlesource.com/id/If4b22e43b5a4ca49726b4bf98ada827fdf755548
Fixes: 94ab5b61ee16 ("kasan, arm64: enable CONFIG_KASAN_HW_TAGS")
Cc: stable@vger.kernel.org
---
v2:
- new approach

 lib/string.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/lib/string.c b/lib/string.c
index eb4486ed40d25..b632c71df1a50 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -119,6 +119,7 @@ ssize_t sized_strscpy(char *dest, const char *src, size_t count)
 	if (count == 0 || WARN_ON_ONCE(count > INT_MAX))
 		return -E2BIG;
 
+#ifndef CONFIG_DCACHE_WORD_ACCESS
 #ifdef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
 	/*
 	 * If src is unaligned, don't cross a page boundary,
@@ -133,12 +134,14 @@ ssize_t sized_strscpy(char *dest, const char *src, size_t count)
 	/* If src or dest is unaligned, don't do word-at-a-time. */
 	if (((long) dest | (long) src) & (sizeof(long) - 1))
 		max = 0;
+#endif
 #endif
 
 	/*
-	 * read_word_at_a_time() below may read uninitialized bytes after the
-	 * trailing zero and use them in comparisons. Disable this optimization
-	 * under KMSAN to prevent false positive reports.
+	 * load_unaligned_zeropad() or read_word_at_a_time() below may read
+	 * uninitialized bytes after the trailing zero and use them in
+	 * comparisons. Disable this optimization under KMSAN to prevent
+	 * false positive reports.
 	 */
 	if (IS_ENABLED(CONFIG_KMSAN))
 		max = 0;
@@ -146,7 +149,11 @@ ssize_t sized_strscpy(char *dest, const char *src, size_t count)
 	while (max >= sizeof(unsigned long)) {
 		unsigned long c, data;
 
+#ifdef CONFIG_DCACHE_WORD_ACCESS
+		c = load_unaligned_zeropad(src+res);
+#else
 		c = read_word_at_a_time(src+res);
+#endif
 		if (has_zero(c, &data, &constants)) {
 			data = prep_zero_mask(c, data, &constants);
 			data = create_zero_mask(data);
-- 
2.49.0.472.ge94155a9ec-goog


