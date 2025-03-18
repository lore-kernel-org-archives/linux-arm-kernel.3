Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41249C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 21:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+3v041miGofNddzBnUn4Cs5yNorfDPWogz1+D6wVoyA=; b=1ioooTfTl1y88JhTSyLhTdzScJ
	IaUPOCJrC37PceAGEMLetRIkaxxG+ujhoaK3s43Uk2BRq/qedyHrt9r5CVnJpoou2uSWnvI4BANty
	INmw5IxWw7RItxrymK9tC0eHypiorRf727BiZjicTtLCe1zRzYj9cON8vjA4epQjSCVLMxSy8YG8V
	gq5Q8tN9XztaigbnaQBZj8OFRe+Y4CiYVUpICy36/jH6XbcmHis/Jr2WI0hdoS4DYx2ZxfpFyG8Xm
	UHBYwMnO5+Be+W6+Sqy1Q8mjENMJ94QzLPF+MRmA51q18jAon6G+nanYygNcqeFksHW31sWN9BCty
	k6en2C5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuelo-000000079tO-3vmR;
	Tue, 18 Mar 2025 21:46:44 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuegq-0000000790y-1BcB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 21:41:37 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ff605a7a43so9806298a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 14:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742334095; x=1742938895; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+3v041miGofNddzBnUn4Cs5yNorfDPWogz1+D6wVoyA=;
        b=rdTVmnLHcTiLGShY19JCGgA6KPOasakrqtuuE+2pktTrdqdfZ11eCqOq0YIJfit24k
         pfNgCXjXZ18EO8qEprfUXx18LJnDLdoj7gZDT5eSSeuFpp/b87NKVeOCXGBDLkqayIZq
         orys+lEXp1YWlRah6wSPsNvXeZ/TurkBz5hozltlDKG/3mfUcfis9hhObA3p9eCe3LH4
         iDQ5lWyS4W3XxNmLZlXfbtciq+u20wpZvcxNTGrq7AhAx9n+h0Ngy4rEaFMrUcfRKpUY
         Dcx3P+tEoaeUu99R8AiGsUwBTMXARNhQChGDLLxOtbAANahAoiiIjX85Bm7T4+4S7/ww
         YvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742334095; x=1742938895;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+3v041miGofNddzBnUn4Cs5yNorfDPWogz1+D6wVoyA=;
        b=eC7K9fl7eHDvc80zxIwmQLzHkOqpJqBFA6jF75yhOEcNxzO3K5rnpsPO4sG5NgxkRM
         69+Rq187BH2HNVmOW8Oy3VRCi/ToTJGKO3GCTc5SWGMSzrNkt/gdh3fdDYH38vcsOcEk
         VFJ48Zd36iHyyj3fk/MW8zZQIWubk/48FGP6h4hNUdDf8M4fE8r5jojiHwcJUY3rdfWw
         QiGeBhECTzJtjIs1yxWNV/Mjf0xcU2XdCcB+YiPIsYl+B/Gn06/kI9crGFex1/ZgZpOG
         0PS/wc6Gg7NlmKLd5lyJ9ePAtbmQ0VuK6vWJ0vrB+nNMvfcty1h6z2u4ZwD40D63uES8
         r/Mw==
X-Forwarded-Encrypted: i=1; AJvYcCXwgMm9/fXPHjxAExVRywuNXYL1PjmF3HFI6x2IgAV2VlFJ3aOic9Z5YUn3WdudgOON2M7Yhc6VpAtUMzqVCJN6@lists.infradead.org
X-Gm-Message-State: AOJu0YzCeJy0VqCxGOSinYp1Hg92UFqq6AqjpR4rPDnBhBRnlbs+/Lia
	RpJ1hDCWg0VSjP5PUANSFNZR6J6mj+F1mXxk1Bg8KVxVzpkVYytbvo9ZPI58G5Umxw==
X-Google-Smtp-Source: AGHT+IFLY1EmXxbPh0DHXmzLlTkBArwizsU3t94Vw7f4cPApT4gnOzyKca7K7uUKbY1tEhJcornmRlo=
X-Received: from pjp6.prod.google.com ([2002:a17:90b:55c6:b0:2ef:78ff:bc3b])
 (user=pcc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:38d2:b0:2ff:6f8a:3a13
 with SMTP id 98e67ed59e1d1-301be1f8f6emr353522a91.25.1742334094908; Tue, 18
 Mar 2025 14:41:34 -0700 (PDT)
Date: Tue, 18 Mar 2025 14:40:33 -0700
In-Reply-To: <20250318214035.481950-1-pcc@google.com>
Mime-Version: 1.0
References: <20250318214035.481950-1-pcc@google.com>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250318214035.481950-3-pcc@google.com>
Subject: [PATCH v2 2/2] kasan: Add strscpy() test to trigger tag fault on arm64
From: Peter Collingbourne <pcc@google.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>, 
	Peter Collingbourne <pcc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_144136_322128_FA6F1B6D 
X-CRM114-Status: GOOD (  16.79  )
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

From: Vincenzo Frascino <vincenzo.frascino@arm.com>

When we invoke strscpy() with a maximum size of N bytes, it assumes
that:
- It can always read N bytes from the source.
- It always write N bytes (zero-padded) to the destination.

On aarch64 with Memory Tagging Extension enabled if we pass an N that is
bigger then the source buffer, it triggers an MTE fault.

Implement a KASAN KUnit test that triggers the issue with the current
implementation of read_word_at_a_time() on aarch64 with MTE enabled.

Cc: Will Deacon <will@kernel.org>
Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Co-developed-by: Peter Collingbourne <pcc@google.com>
Signed-off-by: Peter Collingbourne <pcc@google.com>
Link: https://linux-review.googlesource.com/id/If88e396b9e7c058c1a4b5a252274120e77b1898a
---
v2:
- rebased
- fixed test failure

 mm/kasan/kasan_test_c.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/mm/kasan/kasan_test_c.c b/mm/kasan/kasan_test_c.c
index 59d673400085f..c4bb3ee497b54 100644
--- a/mm/kasan/kasan_test_c.c
+++ b/mm/kasan/kasan_test_c.c
@@ -1570,7 +1570,9 @@ static void kasan_memcmp(struct kunit *test)
 static void kasan_strings(struct kunit *test)
 {
 	char *ptr;
-	size_t size = 24;
+	char *src, *src2;
+	u8 tag;
+	size_t size = 2 * KASAN_GRANULE_SIZE;
 
 	/*
 	 * str* functions are not instrumented with CONFIG_AMD_MEM_ENCRYPT.
@@ -1581,6 +1583,33 @@ static void kasan_strings(struct kunit *test)
 	ptr = kmalloc(size, GFP_KERNEL | __GFP_ZERO);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
 
+	src = kmalloc(size, GFP_KERNEL | __GFP_ZERO);
+	strscpy(src, "f0cacc1a00000000f0cacc1a00000000", size);
+
+	tag = get_tag(src);
+
+	src2 = src + KASAN_GRANULE_SIZE;
+
+	/*
+	 * Shorten string and poison the granule after it so that the unaligned
+	 * read in strscpy() triggers a tag mismatch.
+	 */
+	src[KASAN_GRANULE_SIZE - 1] = '\0';
+	kasan_poison(src2, KASAN_GRANULE_SIZE, tag + 1, false);
+
+	/*
+	 * The expected size does not include the terminator '\0'
+	 * so it is (KASAN_GRANULE_SIZE - 2) ==
+	 * KASAN_GRANULE_SIZE - ("initial removed character" + "\0").
+	 */
+	KUNIT_EXPECT_EQ(test, KASAN_GRANULE_SIZE - 2,
+			strscpy(ptr, src + 1, size));
+
+	/* Undo operations above. */
+	src[KASAN_GRANULE_SIZE - 1] = '0';
+	kasan_poison(src2, KASAN_GRANULE_SIZE, tag, false);
+
+	kfree(src);
 	kfree(ptr);
 
 	/*
-- 
2.49.0.395.g12beb8f557-goog


