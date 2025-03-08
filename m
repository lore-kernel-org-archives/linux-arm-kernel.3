Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9DEC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 02:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jKzjjHkyghJxAnuAXwC3PWRJfez3LkNv1m9ZaRZ16eg=; b=KQ+E6CxQGionR4ryWm5gF8kpi0
	EdR+ZFS+mxanrVdEm+jBz0YWlTN4+TEJWDxEGUAGfGS4yVhv90RWi1N45iAC1LWRVsX8UFm5FaXsp
	z4i1OkEeCGTeJLEBFcbiHs6s1NsCk7WZdL9JWfKXsUiEIHT9dMXM2MOM9KV6Kh3PpGhR2k3T5u16Y
	MxQ+m3lJdH7jaHISpsyZXcBCPdtXkGGDDZhycTZTC3q9I4zytLIQkJlpb6ckgaZ8O2mawGd2BYTzA
	ZeW5+rncWWA9mMi2YeJ/LrBAQqXI3xVzspXuYuUfDPto+cGBIIG0aJ8Wv5wwEgLZKdPSRtElx/6V3
	dgpuAaMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqk1k-0000000G3dg-2Myy;
	Sat, 08 Mar 2025 02:35:00 +0000
Received: from mail-oo1-xc4a.google.com ([2607:f8b0:4864:20::c4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqk06-0000000G3XM-3wm8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 02:33:20 +0000
Received: by mail-oo1-xc4a.google.com with SMTP id 006d021491bc7-5fce04707a2so856035eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 18:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741401197; x=1742005997; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jKzjjHkyghJxAnuAXwC3PWRJfez3LkNv1m9ZaRZ16eg=;
        b=3/tP9oEK/Nn8Sm56+yu92vO7qqD0LIX0DRdJCgcnWQY6gxhEJqWJWkGt2erSruYW+i
         KXKlAC+UVGXlMxAsh09d6nCF5Ksp02OrOtj4lzMQZLI+YLTs//wVeZ4kqmmw4CuNhtqd
         Krk7J0tu7UON5ywXQby//0iBNIJ7gUNqjZI49FCZg0aIbFJYBkWcZDMGNvwwyJ6SfzZ2
         NBlkoj9UkHe924Gmp+RCuBuGXXGFSpmr9bR2TBvsQ7u+cY/j1ls4/CCV+FiautV5dlMQ
         EAU6tgyqu/x30wd/8lOJO8tsI87Rt63YxGfx5ZlpgOL6ttBWYLbJ/lpxggqqYJ0dV0fg
         OMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741401197; x=1742005997;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jKzjjHkyghJxAnuAXwC3PWRJfez3LkNv1m9ZaRZ16eg=;
        b=hvdamkBQ7ud9RPsG/d/W9m1ZCd+70YzpaRVBmoreO0VSz0wrmu60z0lJOWz1mw2oyw
         T9QuhaJGa7kqcFxnjOuR2Fnkb+wzhXLZaB9S9Y00Nx05/DoatchK4tI0dp+UpakCbhiH
         pJc0H/YLDfh7Qs6umOIiTNg2CMQtH/pEqvRlok852t+akI5Nj2FX6Rk4lD1yf70wyZzn
         mEmHrKLd4A8KuPF0aGFIwwKsK9kGWQUmaHcRvnOO9dCP6FnHRpcLue4VL2EuoCPh+cS5
         UOmkJ4dD2fuaNYOPtTCOcZXUD9zXQJXAXqCMNFSuYA8LuvbRavhLGS4sD+C5l2eZY/Md
         NpEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNbFI1osxj6Xp1O6jQYR4B8uWyJTNl3Q2u1/5LkTNcNxqeCBng2lGUK5UsZ0vKBVkixyE0DwozdMnFc7A8gmgN@lists.infradead.org
X-Gm-Message-State: AOJu0YzAnoxqmC4eayABMioE2vqVGmuZp4vYwJpUokcF4ebOp4eVhDw7
	x0L4aITCZCnQ2VYHKJ8PsE+ko2Ts0ZWWxEkRgrIu+xDcBLCpaXDdHJ5lVzcopFZRqg==
X-Google-Smtp-Source: AGHT+IFFZMokntAqkxOEmyT2cvJ9U4fSWph4TCXA8wvZ1kT5cN4sra8A6sENMM+l+kubdYKyBOP+ETg=
X-Received: from oabnw7.prod.google.com ([2002:a05:6870:bb07:b0:2c1:c983:48c1])
 (user=pcc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6830:264e:b0:727:345d:3b7b
 with SMTP id 46e09a7af769-72a37b41aafmr3231129a34.5.1741401197125; Fri, 07
 Mar 2025 18:33:17 -0800 (PST)
Date: Fri,  7 Mar 2025 18:33:13 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Message-ID: <20250308023314.3981455-1-pcc@google.com>
Subject: [PATCH] string: Disable read_word_at_a_time() optimizations if kernel
 MTE is enabled
From: Peter Collingbourne <pcc@google.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>
Cc: Peter Collingbourne <pcc@google.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_183318_977904_65CB551F 
X-CRM114-Status: GOOD (  15.54  )
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

The optimized strscpy() and dentry_string_cmp() routines will read 8
unaligned bytes at a time via the function read_word_at_a_time(), but
this is incompatible with MTE which will fault on a partially invalid
read. The attributes on read_word_at_a_time() that disable KASAN are
invisible to the CPU so they have no effect on MTE. Let's fix the
bug for now by disabling the optimizations if the kernel is built
with HW tag-based KASAN and consider improvements for followup changes.

Signed-off-by: Peter Collingbourne <pcc@google.com>
Link: https://linux-review.googlesource.com/id/If4b22e43b5a4ca49726b4bf98ada827fdf755548
Fixes: 94ab5b61ee16 ("kasan, arm64: enable CONFIG_KASAN_HW_TAGS")
Cc: stable@vger.kernel.org
---
 fs/dcache.c  | 2 +-
 lib/string.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/dcache.c b/fs/dcache.c
index e3634916ffb93..71f0830ac5e69 100644
--- a/fs/dcache.c
+++ b/fs/dcache.c
@@ -223,7 +223,7 @@ fs_initcall(init_fs_dcache_sysctls);
  * Compare 2 name strings, return 0 if they match, otherwise non-zero.
  * The strings are both count bytes long, and count is non-zero.
  */
-#ifdef CONFIG_DCACHE_WORD_ACCESS
+#if defined(CONFIG_DCACHE_WORD_ACCESS) && !defined(CONFIG_KASAN_HW_TAGS)
 
 #include <asm/word-at-a-time.h>
 /*
diff --git a/lib/string.c b/lib/string.c
index eb4486ed40d25..9a43a3824d0d7 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -119,7 +119,8 @@ ssize_t sized_strscpy(char *dest, const char *src, size_t count)
 	if (count == 0 || WARN_ON_ONCE(count > INT_MAX))
 		return -E2BIG;
 
-#ifdef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
+#if defined(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS) && \
+	!defined(CONFIG_KASAN_HW_TAGS)
 	/*
 	 * If src is unaligned, don't cross a page boundary,
 	 * since we don't know if the next page is mapped.
-- 
2.49.0.rc0.332.g42c0ae87b1-goog


