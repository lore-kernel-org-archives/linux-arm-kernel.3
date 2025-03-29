Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A441C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Mar 2025 00:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mEgmoeCU7ZoBbD/6q07yzTwvuV9KDxvtvsClWJ9QuF8=; b=BdZsjWfKduhLPe7S8WLgYfuRIU
	zWfQK4Dlva3WPJx87Yfzp0RNP4pIhsSzVaAH+y+HUkW1kTZuHuRxQexLkR9EIn9ELayeBEB/DTTgi
	GT9py0dptZ8wba+vW5K4of4DNKGxmuQtdk+JulSlAgxFusE+WNvqZbIubqb5cCpu2KVIj9b/OSDE2
	jKLtQrnsUNX2B5LBNstyWbtMYICpyBSPMA7GWU0TZ3rHWhEXX2OYyp7DyfNwcUG+4BYO9TbJZXBwt
	D6GuIDFTCSjFsCIWkBKcLLM3mWNPzb4K+xOdK+l12p2/EYQP4Jf8aH3DCmIR2pQ1TTasPJ74yRqMg
	JzBXi/KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyJjS-0000000EWth-0dvD;
	Sat, 29 Mar 2025 00:07:26 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyJg0-0000000EWVY-0Utl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Mar 2025 00:03:53 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2240a7aceeaso48106615ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 17:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743206631; x=1743811431; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mEgmoeCU7ZoBbD/6q07yzTwvuV9KDxvtvsClWJ9QuF8=;
        b=GPMImk0mrn2J+u1uR1PG8gNm6m+bR+xYaonH3BihzYsFvOfRuM5Au2SP5ywPeYJbMa
         QFkXvzQFZ8TYZWTaA3U4YWcYrOf1p7kwNgHG6lDr7C4CyE/M2Uw9LI1ZVk8hs8lbqA6N
         tDDgFwue4cvZbJJuoDcqbRJ9g7Ma6nS8tOiVe2cDvtWhvi6zvAfffaNd3Xsm8LtCslOI
         CFWRBGmHYFkCU7ZdZJXzpxFfKNt2ZB9WKN6J/HUD+aVebDA5GzeJRoZho181djAZ4+Ir
         l0pQIl9kkj02IbE02CNBYzluQX0Z/rIqwXrORZwrKS/szTdLo6DDf/UTHSQJjrpADUYZ
         0b/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743206631; x=1743811431;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mEgmoeCU7ZoBbD/6q07yzTwvuV9KDxvtvsClWJ9QuF8=;
        b=Q+S5wiqYB2FkoFTw/JYFfUIVp9R0xDDL0Hp27bCB3Q1pKOVyUkeb5FaexNfyuA6Qhn
         CwfkTYs56VMLXyDREYTqKAcCxWr9dUY1nz0fhaMErxDuIPFcwofBI6u47utn2J6plZ/1
         +p1S+NozJ8PaYHRowNq/jd2xO7B0QyKRM9yzSf8h7MbT356ze/fLuw2T+s0L0747oih0
         KNRZE1x2KNmlLECDVzcz6Q7K+GNft0a/Liwp1O0zV10V5LVIGZu3GI38XR2riZVb6W2G
         ifbJMobRy1z698nPV3Qrlm6xVymjooNNp6WqjYlpoBQS05plYGuwKFwR31ogP2PIV18+
         eNig==
X-Forwarded-Encrypted: i=1; AJvYcCV4wfU9apVoIj2wZ2JSeEwXfFiZSoSueQoaUuXLWPy3bSf2rTzs3X6wGtDeKaHFPeuEbn77St5jB4FgGmTeakED@lists.infradead.org
X-Gm-Message-State: AOJu0YwP17XERrwm6tAHzpcU/UssBq2ScboPitx4FQ3aSRqAEn3BGvNg
	zyQrNav+LyIeK8WAuUZ/obLsBWbf9LRn05/Suzb7SPdm3RP0YUZjuUvruphTZglW/Q==
X-Google-Smtp-Source: AGHT+IHjR6hGtSOVpUkc0nyNRot3w3fhTtOD52YS62CSenulpOThQdeL5LjrShYtAkO27skye9Y/6dw=
X-Received: from pfbmd6.prod.google.com ([2002:a05:6a00:7706:b0:739:4935:6146])
 (user=pcc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e887:b0:223:f408:c3f8
 with SMTP id d9443c01a7336-2292f960348mr16354725ad.14.1743206631260; Fri, 28
 Mar 2025 17:03:51 -0700 (PDT)
Date: Fri, 28 Mar 2025 17:03:36 -0700
In-Reply-To: <20250329000338.1031289-1-pcc@google.com>
Mime-Version: 1.0
References: <20250329000338.1031289-1-pcc@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250329000338.1031289-2-pcc@google.com>
Subject: [PATCH v4 1/2] string: Add load_unaligned_zeropad() code path to sized_strscpy()
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
X-CRM114-CacheID: sfid-20250328_170352_155906_C6F52469 
X-CRM114-Status: GOOD (  14.53  )
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


