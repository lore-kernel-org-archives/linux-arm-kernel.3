Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E8DCCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 10:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4s6P+Feh6QTHXx+j4+pZbRiwHHcjHTLEIbaDo5nXNow=; b=re7LuBixBBcVo1M/IzaoDDN9sj
	esyxQ/wzYG/c4nZd6CLcUw8mIBbLsCI8hhX0Iwq4hzOjrX0+7ENZ9y2FF9+kNUJMcIlm+jXyYh/5v
	e7Xf8oOuPoick8tkTIoAg5gBn0lBLga1Zx1OqX9w8TgY/fymRzPepv4o0mfB6dtnpLeO6DoQmbKce
	iVuDmLCIEe5kF9//I9Ph/MlK3FAomKGFOiPhjWexXNW13bXZerHv++8877FkzPY3eTAPJG2UQFTqL
	JWYkvTuNR5RuMxvzLtq9ddhIhMyF1UmG7FrwroM4KqSa0AG6OTl1c8racQCyUfQXEU7xfZ1Qmq6tQ
	zaHOAVjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmZ8-00000005vrg-3HGc;
	Fri, 31 Oct 2025 10:41:06 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmY5-00000005vAu-19eP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 10:40:03 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-47496b3c1dcso20374755e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 03:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761907199; x=1762511999; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4s6P+Feh6QTHXx+j4+pZbRiwHHcjHTLEIbaDo5nXNow=;
        b=3WfQYnM8losr6ZNR4rKDv2Ud/A075JH9DjWC/z3cZnBiJEOml56kYVC2cHToRxtb7A
         qhjDJNSA9u1RVyKEdF/6WIpJsxYK7oYhMFpd6VhVXi7Wn84ksVdxGvquYcuQppVwKhf1
         lFkbEVzpEnaLjFnw87JpWx9lkUNw5kdvQIJtkM5knAilVtiIymuHSw+tPnVisYjHo17h
         dvYHNCVJ+3UsWu8bSlK3aMdSH4eGgw++uVkJhLrs3mAJGD61AH06IcBipntLvOfHSgTX
         X5ynAuG1sddBJpmdVLp7MYvL3BsIuEsIQi8TW5IReFE450L/mwM97QJZQ1lttAOsuJCh
         pwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761907199; x=1762511999;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4s6P+Feh6QTHXx+j4+pZbRiwHHcjHTLEIbaDo5nXNow=;
        b=sawg4CbeliYSsO2ZQuJIkBHssI9VAasMPrsZISgwWU3ZNWwEmHQDwD4M9AOKTn+oQh
         2t3YPvf4ErXvfETUhBaM4UUqSWphqlWhCbi73kTzKOXcaXb5KB0CnrifsHAbuU77ysqT
         9GoEg5pikUIPfYOd8COaeaE5WUhMEEWPVjcky261HyZDzHQQWNLk52j+ieYY+4O307+C
         Gyk5EgIM06sAkgZci67ePBiyeG4SPTOf3+nU7k6OlzOJjG89OVc16fmoWrXs60CBzgTS
         6vGrZ7r3vI4Rl9rw02NjHbRAVh7DXy3r+oOZRRrLLC8Qyv29my5l+vbLAy2BLN7lUYTH
         Hcxg==
X-Gm-Message-State: AOJu0YwTym+vOp/XALL5g6egi5FyugvQnTNERayink7D27OIsUYE1UMm
	W9w+bkPXST3O5OrVcVAEiPoTQL6LHj0/etBpIkx0kAeQ7x+yi+8YHR3+BJ5lyGbyhCAL1wOl0cb
	maBe/G847ItkdDfSy4bZmeTPL6X4jIQDVCShKV9LlNj7svGlz9+r5rOD91f7gtYU2iRzwWXueU7
	y3W9Z3xjYXiM+SvxcvCl8Ftgocfu7PqmKzyZUSWoK+5H41
X-Google-Smtp-Source: AGHT+IEfIHxmt0Akn8ZOdGgYUmWAojffoRFxXG63QnY50c3838BNl1o+lCSGk7AdLGAKU776OVcmZYAl
X-Received: from wmbf23.prod.google.com ([2002:a05:600c:5957:b0:475:d8ac:bbb0])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:190e:b0:46e:3cd9:e56f
 with SMTP id 5b1f17b1804b1-47730802ca0mr29236185e9.6.1761907198711; Fri, 31
 Oct 2025 03:39:58 -0700 (PDT)
Date: Fri, 31 Oct 2025 11:39:12 +0100
In-Reply-To: <20251031103858.529530-23-ardb+git@google.com>
Mime-Version: 1.0
References: <20251031103858.529530-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1189; i=ardb@kernel.org;
 h=from:subject; bh=gI3hKx/eLJBwHcKg2Z09pXqMlir5s87xW/Yb/W5o4zk=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZNl4jWpy2tS+Bo75wd5RN++5pC6flaDZOhdjaXyL29rv
 ptye2tARykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZhI7DtGho6N39KFNuivY32j
 GDljvd68v90bNjKtOyAX6WXkfGla2RxGhlksDTN+Lky+f+d0gcYX0Ud7VrsIxVS0X5aRuJh5ySK YgQ8A
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251031103858.529530-36-ardb+git@google.com>
Subject: [PATCH v4 13/21] crypto/arm64: nhpoly1305 - Switch to 'ksimd' scoped
 guard API
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_034001_323928_0FB633D4 
X-CRM114-Status: GOOD (  11.18  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Switch to the more abstract 'scoped_ksimd()' API, which will be modified
in a future patch to transparently allocate a kernel mode FP/SIMD state
buffer on the stack, so that kernel mode FP/SIMD code remains
preemptible in principe, but without the memory overhead that adds 528
bytes to the size of struct task_struct.

Reviewed-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/crypto/nhpoly1305-neon-glue.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/crypto/nhpoly1305-neon-glue.c b/arch/arm64/crypto/nhpoly1305-neon-glue.c
index e4a0b463f080..013de6ac569a 100644
--- a/arch/arm64/crypto/nhpoly1305-neon-glue.c
+++ b/arch/arm64/crypto/nhpoly1305-neon-glue.c
@@ -25,9 +25,8 @@ static int nhpoly1305_neon_update(struct shash_desc *desc,
 	do {
 		unsigned int n = min_t(unsigned int, srclen, SZ_4K);
 
-		kernel_neon_begin();
-		crypto_nhpoly1305_update_helper(desc, src, n, nh_neon);
-		kernel_neon_end();
+		scoped_ksimd()
+			crypto_nhpoly1305_update_helper(desc, src, n, nh_neon);
 		src += n;
 		srclen -= n;
 	} while (srclen);
-- 
2.51.1.930.gacf6e81ea2-goog


