Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6AEC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Mar 2025 00:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tGMonBDCtHbGxccj+//vlpjOsUsbEFJEDLrw6ctd8aw=; b=ESPEVn7c5NYzxZWy5PCD3RxJJQ
	nxsI4ojCUtQBfYoP1T5Du6DeMWrAN5MUE7U477j7Ie32R7OEJ8sdznP7BL3yNQX7tbwaDLNnhHNuY
	qETJR15UhrrEFrlKAIMblJGILhFECrAJCx5fyOiDoa2awU+TbNMM5Q6sJEYWZPHk4xWVoED2TrpMF
	DCo3LALFQ+MWUhVKOxEiXKOd7yt1UGhFgGjl5K19U0WAzoaV+FwTTYW73wugemYUl4UmzzRtoOEH1
	0azlNjJgO5i7tH192drEZqOSTZClxJsKtkHMBcIE7a7AhxP7NhqzrrvaPSJJ1NKHGRIrDBHBQaR6f
	A/e7oh9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyJlA-0000000EX2P-3ZWA;
	Sat, 29 Mar 2025 00:09:12 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyJg2-0000000EWWM-3ucE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Mar 2025 00:03:56 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2240a96112fso79188165ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 17:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743206633; x=1743811433; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tGMonBDCtHbGxccj+//vlpjOsUsbEFJEDLrw6ctd8aw=;
        b=vZSgZkXgV6h4Zor1ZYcGHe75+3AJeiaUG/mjWsfGwcitQyQWuSisVhFMYiwcbsNaD/
         VJPZ/mQXXbtHQerv9vQprHk+bRWYsPTISSJi7LLyU11mFvwLvVtodESKUaSJL163Hc7E
         D+2bq4nZNC5o+Irtqt7SMZznn+QJ4W1FItHu9lfv/WqvFxZGGYxDQtbiUG4J0LMw0Bjy
         fKr8KVo6an0bobA6aJPcb8Vw6HV/zyJbNxLTfSfk1DvHn+0ppkcfmSkWcvFlK5eOS6xI
         yzTk8EQhzR+g/2/GfPa0EuUtb7n2+oqmZXkqRsKDpatIEj3IKj2OStssI8ScbQL7KWlU
         QCzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743206633; x=1743811433;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tGMonBDCtHbGxccj+//vlpjOsUsbEFJEDLrw6ctd8aw=;
        b=ekYOa5IChITNXRDV7jZk9RgqbAtzL9H9fivptd/YxIwKmzJzDfH4MGrRZAjK3z/UMn
         m6/dUl/Ol85/QuuaPL6GlDbvtKuEZ604rQVxTWGdNqUWal/sC4m1GUDBKyrxXqck2tZy
         Rzy4/IaC1wzx7XOMC43fcq3Gg4vseUtY+tfryJI6iUC/Vv0ja3ifE5YQ/q7CSN/CZCaF
         6EXqdbfSNglHBWMsygPDuz1xh0pl2Fm2QHi27Xqhs15paJfJo08TIZBkypklfoZCVY+w
         LLR+FtNrBSyMwC0fLAQRlQZ/ayNnsjnkRGzHfv3IOPk1383mWX4UhpnIA+Mkta2q8hgA
         XxSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpVdsEexCLDUCwq+Gb1dTVCZ1kAPxn/X/Pf3eCI+RztiydYJ+jZj7rKnr8ix3aVpAmr6313Pmaa72o+kYUQvQt@lists.infradead.org
X-Gm-Message-State: AOJu0YxS6M+hGP2sbtMXwSPgP5EKb6L8QPqOWVaK3vwQWPtVAs+tz44n
	sD3yt4riPUY+bT9+l2/qW5fAU1y5I52juFhODeaZb8XW9uIMkiJyBVtRc92oJMRt/Q==
X-Google-Smtp-Source: AGHT+IG1OCkWK6ACc2gjb+axSi3OGauLJByZEq2XzaKVmUmtuGmaBnSVPaf+lB7MT0QcfgqXjpACp1o=
X-Received: from plrc9.prod.google.com ([2002:a17:902:aa49:b0:229:2f8a:aac5])
 (user=pcc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:eb8d:b0:21f:564:80a4
 with SMTP id d9443c01a7336-2292f9e5139mr16353845ad.33.1743206633220; Fri, 28
 Mar 2025 17:03:53 -0700 (PDT)
Date: Fri, 28 Mar 2025 17:03:37 -0700
In-Reply-To: <20250329000338.1031289-1-pcc@google.com>
Mime-Version: 1.0
References: <20250329000338.1031289-1-pcc@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250329000338.1031289-3-pcc@google.com>
Subject: [PATCH v4 2/2] kasan: Add strscpy() test to trigger tag fault on arm64
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
X-CRM114-CacheID: sfid-20250328_170354_973436_74C6E403 
X-CRM114-Status: GOOD (  14.80  )
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
bigger then the source buffer, it would previously trigger an MTE fault.

Implement a KASAN KUnit test that triggers the issue with the previous
implementation of read_word_at_a_time() on aarch64 with MTE enabled.

Cc: Will Deacon <will@kernel.org>
Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Co-developed-by: Peter Collingbourne <pcc@google.com>
Signed-off-by: Peter Collingbourne <pcc@google.com>
Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
Link: https://linux-review.googlesource.com/id/If88e396b9e7c058c1a4b5a252274120e77b1898a
---
v4:
- clarify commit message
- improve comment

v3:
- simplify test case

v2:
- rebased
- fixed test failure

 mm/kasan/kasan_test_c.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/mm/kasan/kasan_test_c.c b/mm/kasan/kasan_test_c.c
index 59d673400085f..655356df71fe6 100644
--- a/mm/kasan/kasan_test_c.c
+++ b/mm/kasan/kasan_test_c.c
@@ -1570,6 +1570,7 @@ static void kasan_memcmp(struct kunit *test)
 static void kasan_strings(struct kunit *test)
 {
 	char *ptr;
+	char *src;
 	size_t size = 24;
 
 	/*
@@ -1581,6 +1582,21 @@ static void kasan_strings(struct kunit *test)
 	ptr = kmalloc(size, GFP_KERNEL | __GFP_ZERO);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
 
+	src = kmalloc(KASAN_GRANULE_SIZE, GFP_KERNEL | __GFP_ZERO);
+	strscpy(src, "f0cacc1a0000000", KASAN_GRANULE_SIZE);
+
+	/*
+	 * Make sure that strscpy() does not trigger KASAN if it overreads into
+	 * poisoned memory.
+	 *
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
2.49.0.472.ge94155a9ec-goog


