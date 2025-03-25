Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07328C36002
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 02:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eTUn5qDH83alwoR8172wGnmaTD/nkQcDeotToQ/FQtU=; b=k5CPKZvDPFT5a5iN/G+v390MO8
	B/p8xKIrtJIHwJSs80bhemsErMeYZnbwU5bCcE/2gNlXXQZ0jk2E5iUAmM9pxaUrIyqpVtJQSWGC3
	FhqYc7kio7SahiVJlW5l1LGVsVl5yUrapEv9+ayZTs0R5ZuiwQePy1fQulJkBVzjy8g2pUCDNMSzr
	+Fv6FLNFDNBqXV4EfrW33Hclkfy+b06j6J+9Urxwn9Xyp48qXAA4rO2K1UCsSl0Xu0cs5PDTfDHze
	U8pZXtLgXgjf/Fec/iZVndxnrZKySp2Wmg21DX8y2z7kGf24nxfnRMX1XjzXFg8UGCrXpOUsOBYVj
	7PXodXdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twta7-00000004eVS-3vUD;
	Tue, 25 Mar 2025 01:59:55 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twtWi-00000004doH-3euX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 01:56:26 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ff854a2541so8393078a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 18:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742867784; x=1743472584; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eTUn5qDH83alwoR8172wGnmaTD/nkQcDeotToQ/FQtU=;
        b=lqsMgFnNqMqU4oUFV5gFb8uVT1aXNPNuiqljKGWc1J0+nzdV0GR9u132k2Nl/NUG4o
         YpS01/3DvCHN1kTcpGu0d0+2aK4NFC0jlIGIDEuqzKg7jGLZKFoT4u65LH9vOrEdzHhb
         R0JE6ddhEFkqZBDmUig5a10KnOtf+vB8ehqXpXeLIsTbcGR57UngoH5xsNIQ8ArnobUp
         zIhyvv7HcRg5Et8rFZNOw9Pe368adeJqbkR7sPAZV/f9fU/HIdzjVpqUOK4xBFTdgvvY
         JaDS3/byZaoEswykqeloY0g4inm3/2doSqw2AyE15gqKTd8jHZ1ITkyuo8uI00cQELw7
         uOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742867784; x=1743472584;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eTUn5qDH83alwoR8172wGnmaTD/nkQcDeotToQ/FQtU=;
        b=DL7Xk5R7bWLZ3CSr0ca+9gDQXBYYGA2VLrou3BtunU9uu4xhep19s/YzDBRRDNTaUy
         51dUVGxWTtZxMkGQwwYvGux7jjScBnprKV+CmBWKGnVKPESjPLm3mqx65ayRp8z95k3Z
         a3TsJ+zbY/91qpJieDLSQczUfEJTf70EBcS2ZDLM4t+X48/HFxSic2SGPfcCeBPAMcZo
         zzzI3BLM9DSWuBReK69WNMhuUQN6M+UbrQXXGKp1zrReW4mzaryQxv1ouRp3bV5DTe1f
         fxfYjucAzXUO22JGIN2Kvaw1z829axMYAQ2sTUbkeS6eLWIKEQcOH6t7tpaHLnvjTpwr
         c8Pw==
X-Forwarded-Encrypted: i=1; AJvYcCWN/A0zKBXSXwbVxXE7AfYZzPdCWAqD1veol5BHKIYIW1TwjLIJFpHNifLYh4HV95z8dBZgVbdHsJCCZ1kOQ0M5@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi8Nn1yCQMLWtr1kU1gybZlcyhug7y7+n3KLE8NMLs/3jZnTrG
	IM4ZzZMnnqqm6hV6RSE1UZp0HQaV7R5Zx/7jyRRGv5JoxAvP9wsoom7bAidJNTZDsQ==
X-Google-Smtp-Source: AGHT+IFIvVndmJ5T1LC0v2mYgG4gIWIkXYdD4jSAqc98z2o614eIuEt5Jeeq109zoC0i0zwJ2WUV6dM=
X-Received: from pgrx8.prod.google.com ([2002:a65:4548:0:b0:af2:734a:2cfb])
 (user=pcc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:788b:b0:1f5:8179:4f47
 with SMTP id adf61e73a8af0-1fe42f557edmr27545583637.20.1742867783666; Mon, 24
 Mar 2025 18:56:23 -0700 (PDT)
Date: Mon, 24 Mar 2025 18:56:14 -0700
In-Reply-To: <20250325015617.23455-1-pcc@google.com>
Mime-Version: 1.0
References: <20250325015617.23455-1-pcc@google.com>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250325015617.23455-2-pcc@google.com>
Subject: [PATCH v3 1/2] string: Add load_unaligned_zeropad() code path to sized_strscpy()
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
X-CRM114-CacheID: sfid-20250324_185624_904849_80EE9886 
X-CRM114-Status: GOOD (  14.81  )
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
2.49.0.395.g12beb8f557-goog


