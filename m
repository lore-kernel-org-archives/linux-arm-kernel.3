Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDECC36018
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 00:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NyoF5i3nxCUfNVJkAVl8GCLqKKAkd0DOEReeKsHnmjw=; b=RDNhWfChELQL+0sl9pqfCuzxOZ
	nSoC+zAsV4kLHt/MI/HJYPCcoF0P8taBd92L5EH/99wuOwsTmrtLCRQ5lwf1hwLgYIUwjYEqZh3Jo
	DMjGIVBAPMHtNss6mK03A/3E4ZwSPOxAmD1/Ecpr/IUeLSh5B+vQeYloNe06zomABVvYBdaCEh/Y2
	qMnNbLptbm5fL4wXpni7BW8UxtPhzIDfVounrCcfiNzh50wP9vxGIvPd4R3eVZmjGLzPrAHHgpLPm
	xaNkIK100OkRG7LW87fRtLCGwvlKiKehIblZT26LxCjaej8FP4UC2LuJF6tU/TiFsKCK/FMb2m3Cl
	kIgpfjTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u08IY-00000007URt-1a93;
	Thu, 03 Apr 2025 00:19:10 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u088Q-00000007TLs-0owN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 00:08:43 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ff798e8c3bso279853a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 17:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743638921; x=1744243721; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NyoF5i3nxCUfNVJkAVl8GCLqKKAkd0DOEReeKsHnmjw=;
        b=KoTY/YY0rCANoexGD4Bkq2yYwxO3nob8fYTj37ouPAoR815HAXxT6DupTSoBeVi4ri
         7h3KKhTOqWurLCjtoYJgSZO2G5qudZAexb2kCILLJfWazlle5OyUi4NM7UBQdCdvqDrY
         eLjgeeYCyvDE6PdrRqybF9HoeClW5KU7OBWXcwsRQcXeMujL1qhy81Jl6MBteGD9ThV8
         VuMSrMHbeWrjj+hw9wM1aib4i2v6fm1AEwjYdXV0eNurXr3+8Kj0UZvWYSmJCpUU+r4h
         BCsDRtLeS8Segsz8Uw27rPkw+9iSKwQ7VF0F/LyJl+ieGFo5IGbDgIpgH6T2YI4oI2BY
         4CNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743638921; x=1744243721;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NyoF5i3nxCUfNVJkAVl8GCLqKKAkd0DOEReeKsHnmjw=;
        b=cfkmMV0KqlxNVSk5/xDOoA05cSLMriC4OKubhQitzS93xGKNby0POzn3G47vohtVfF
         slEl+oLzSKTaF5LucSV1ARNYjTF4wpcLgi57kHfLNrMnRK9QZFV4Y/ATxARR8Qzno92o
         4FMbPaFgpMQEhn5ZeRvFglgbxXgViw/XFvLIINDJKY0vwOj8PN/7bgfrx6Ehy+lTyjXw
         VHDSSQ1rHPQW9jaiH9A00JYq++v1zmiTq6jGyhXeATFg7Ma6GvYu+ZDilwVrV0gNviIb
         L0oLY7C4mm6FFyiO8Nq7d5KjyzZNGEOFR20pc7I4R80qFKjcrGINGtwkbgpvW6tzCFLb
         HYQg==
X-Forwarded-Encrypted: i=1; AJvYcCXZo31j7r0cljZfEKkKMSlWDralzd6cW2TazTIVgspQfRayWmABMdtdK8h03C0a3WR3vr2rygS+hmFll0QGYjaE@lists.infradead.org
X-Gm-Message-State: AOJu0YwiXIkvbCHnM0wTgqtl7tHVsbt5Ity9u6XIdr6k7/NckFKEgPkW
	5mzkrcI98fjAzepTObZWU/wBuFkeGyqHePBq5l3GCk7n3fyK3m07GU5ZAtIyraisLw==
X-Google-Smtp-Source: AGHT+IF9PPSWYluV28LHjIAQYtoCIsrCyo2nNzgTlCfOaTtLczxhcR0/cQHFz16AjBy9tsQ09yZBi4s=
X-Received: from pja11.prod.google.com ([2002:a17:90b:548b:b0:2fc:3022:36b8])
 (user=pcc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:dfc7:b0:2ee:b875:6d30
 with SMTP id 98e67ed59e1d1-30531fa4dd6mr27878978a91.9.1743638920951; Wed, 02
 Apr 2025 17:08:40 -0700 (PDT)
Date: Wed,  2 Apr 2025 17:07:00 -0700
In-Reply-To: <20250403000703.2584581-1-pcc@google.com>
Mime-Version: 1.0
References: <20250403000703.2584581-1-pcc@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250403000703.2584581-3-pcc@google.com>
Subject: [PATCH v5 2/2] kasan: Add strscpy() test to trigger tag fault on arm64
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
X-CRM114-CacheID: sfid-20250402_170842_235368_E7933E3B 
X-CRM114-Status: GOOD (  16.38  )
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
v5:
- add test for unreadable first byte of strscpy() source

v4:
- clarify commit message
- improve comment

v3:
- simplify test case

v2:
- rebased
- fixed test failure

 mm/kasan/kasan_test_c.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/mm/kasan/kasan_test_c.c b/mm/kasan/kasan_test_c.c
index 59d673400085f..e8d33af634b03 100644
--- a/mm/kasan/kasan_test_c.c
+++ b/mm/kasan/kasan_test_c.c
@@ -1570,6 +1570,7 @@ static void kasan_memcmp(struct kunit *test)
 static void kasan_strings(struct kunit *test)
 {
 	char *ptr;
+	char *src;
 	size_t size = 24;
 
 	/*
@@ -1581,6 +1582,25 @@ static void kasan_strings(struct kunit *test)
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
+	/* strscpy should fail if the first byte is unreadable. */
+	KUNIT_EXPECT_KASAN_FAIL(test, strscpy(ptr, src + KASAN_GRANULE_SIZE,
+					      KASAN_GRANULE_SIZE));
+
+	kfree(src);
 	kfree(ptr);
 
 	/*
-- 
2.49.0.472.ge94155a9ec-goog


