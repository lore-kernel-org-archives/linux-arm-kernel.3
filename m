Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44D3C36002
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 02:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KbmWscRvAoMTscJ7YX1VjxJzdFRKT7QCMrJKO+SUNOM=; b=CEf9BXBqUz+bw0dEQ9uJMScOjc
	ZyTrccJx9VqUeBNRpE4qqOODea7x3uIVWmThUNNjuBLftbrq6z/fm7cNI2CsK3x24FpSWLb1zfZ0r
	QqTBN8O1UaNhea5hGFhrHSjy8kIVl5P1sfnuduKcKKL7HudR57lU58ceCn8G5uK9/35ioWNi1land
	TEqNY0niNiez16NUB266o+rWp04MZtWgpqPjdXYZs9t6S/Xx+tww/i9VlRhpJwsP7j+8eTfSCoCRJ
	rpZvRLUJcanw+tgYYSKISqbbCrxPShhoFqX4pphiCAkIyFgp47LnLkbV7h6ZX6KzZuRKdKfzlTZng
	A0dTw2FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twtbo-00000004em7-2eTV;
	Tue, 25 Mar 2025 02:01:40 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twtWk-00000004doq-1wGO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 01:56:27 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ff69646218so13478971a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 18:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742867785; x=1743472585; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KbmWscRvAoMTscJ7YX1VjxJzdFRKT7QCMrJKO+SUNOM=;
        b=Yh0ucpyMyQfern2EZPWqsfh1iIHERkow79vG9DMywuAxKs+/x0wQIwIFF1waDWP/wx
         NlXRSglVFXUj6x3/mn8q156w96PWPsIRUPVmo1AcOuIAzRv/AyrlAGlXsql2LfDI3blR
         s1OcxeSrMk0LJZ3u2PsjoehpoIxBusyfptJhimwXXJUDO6XUDvD325nfMIEX1mIIrJCu
         tCivkVijyrNn+WqbDFUF62VJaopDnyWi5Zb4PQ2uQLQffDYyK9fplVJ7sy8FF4JEPszR
         u/m8Xa11i2BVRLx7ncHH0XRr2VKdSL2+Ruk105SjSolTEsrXEyHAFaweu2QBOQygohBg
         PgxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742867785; x=1743472585;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KbmWscRvAoMTscJ7YX1VjxJzdFRKT7QCMrJKO+SUNOM=;
        b=CC4f2R/AhcpQdTKEnZPilDPjmi/4fGUMfa41XAMUoB83M+AjVH/1FTOhV/lOzjFLSv
         rD7QTTpDEka3oLh+S/M2x25uBaHpSMBHUQl5qnfJBOBW1rSPz6upFJglYyOL22zIe0+Y
         3vB4C4hftsD+xC/KaVFDavHwAzn8p+7lLU7rdgAyUnEKSdj7pOrpYqqN+D61sXRAgwF5
         HLOA3Mrkr4CRVT0NyERdd1RGETYb1UAXKCNHjh+IGvu/hEmTarlfzA+71OzcYGQVtAMZ
         X8Xbv6z6MgZLI9j+zRe3Al5YlRexgIULmTO+KsJ9NsaOkqe2w8N5Wif/z7T2EWQByq1B
         +EDg==
X-Forwarded-Encrypted: i=1; AJvYcCXGtQ7PGYJ1R2Q8lMdQaBO1I9sv30CGcc9Yv5GFRC6GxHwBpCYYwwh6nMEIjBRVrkHJPEFnjYwHEWJWurK6JutG@lists.infradead.org
X-Gm-Message-State: AOJu0Yw18s9+QKHnhTIw4iG8w6OLdjRlChQzlj1qwFc6EZKgvAEPbyK+
	cRPWVjiP2BNu7X3LhzHpHMAIRr6sqYs8pTE13wXeDY3zO6smM7RPV1lj/04or/SiBw==
X-Google-Smtp-Source: AGHT+IHw/mFa4K32w6FBmgVCLK0lfqwfx84tHmcbhBFHdeJjTz1GHC7yDdmMbL5MTLDA5q8NZ++fySA=
X-Received: from pgcu63.prod.google.com ([2002:a63:7942:0:b0:af2:3541:76e2])
 (user=pcc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:113:b0:1f5:874c:c987
 with SMTP id adf61e73a8af0-1fe42f2c872mr24619131637.15.1742867785611; Mon, 24
 Mar 2025 18:56:25 -0700 (PDT)
Date: Mon, 24 Mar 2025 18:56:15 -0700
In-Reply-To: <20250325015617.23455-1-pcc@google.com>
Mime-Version: 1.0
References: <20250325015617.23455-1-pcc@google.com>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250325015617.23455-3-pcc@google.com>
Subject: [PATCH v3 2/2] kasan: Add strscpy() test to trigger tag fault on arm64
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
X-CRM114-CacheID: sfid-20250324_185626_499797_D3015BA0 
X-CRM114-Status: GOOD (  15.15  )
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
v3:
- simplify test case

v2:
- rebased
- fixed test failure

 mm/kasan/kasan_test_c.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/mm/kasan/kasan_test_c.c b/mm/kasan/kasan_test_c.c
index 59d673400085f..b69f66b7eda1d 100644
--- a/mm/kasan/kasan_test_c.c
+++ b/mm/kasan/kasan_test_c.c
@@ -1570,6 +1570,7 @@ static void kasan_memcmp(struct kunit *test)
 static void kasan_strings(struct kunit *test)
 {
 	char *ptr;
+	char *src;
 	size_t size = 24;
 
 	/*
@@ -1581,6 +1582,18 @@ static void kasan_strings(struct kunit *test)
 	ptr = kmalloc(size, GFP_KERNEL | __GFP_ZERO);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
 
+	src = kmalloc(KASAN_GRANULE_SIZE, GFP_KERNEL | __GFP_ZERO);
+	strscpy(src, "f0cacc1a0000000", KASAN_GRANULE_SIZE);
+
+	/*
+	 * The expected size does not include the terminator '\0'
+	 * so it is (KASAN_GRANULE_SIZE - 2) ==
+	 * KASAN_GRANULE_SIZE - ("initial removed character" + "\0").
+	 */
+	KUNIT_EXPECT_EQ(test, KASAN_GRANULE_SIZE - 2,
+			strscpy(ptr, src + 1, KASAN_GRANULE_SIZE));
+
+	kfree(src);
 	kfree(ptr);
 
 	/*
-- 
2.49.0.395.g12beb8f557-goog


