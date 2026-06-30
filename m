Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC20C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 15:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RxV5fEpsJGHhE3L8vdcj3Th/5v0heJ6mrreI6jrRPh0=; b=sIPrmVZiu4OrXpHH8mxa0oADFv
	KlGJVD1nZj7l4ebdQzYRXcXvNrjnZ/U+wQui2VNfKxg+OxEgkDs/nBwdjpRYDHkpweWM5GzEsBwAs
	BoBkMRIKWm+cUYfMcFwQ3gK8waE/IgcwyAZR+usdcxDtwAT1JGbyXx6xBFOJawkKrhPRyBxVANi/t
	TactCdkgRhZLKBnv0yHJ2okachjIXKvnEpyvB8ox5oL91FyWnGGLbaVPrzDNOc/DMNnRdZMl092vX
	WlxG3fngw7F1MWxt5VLJWzq2+vwbQP/tpl78sGU01uoTstNsEx4D2/IGouH0dTpw/4GkGGSk9zxRt
	rmcGLKyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wea1D-0000000HKY5-1PL4;
	Tue, 30 Jun 2026 15:04:59 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wea1A-0000000HKW7-0708
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 15:04:57 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2ca11143dbbso11697635ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 08:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782831895; x=1783436695; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxV5fEpsJGHhE3L8vdcj3Th/5v0heJ6mrreI6jrRPh0=;
        b=rwL+GLSJYu7ylaH6/mobg6p+L6EmBpeVFwGOf5H0s5rfNBqE08oAZT+QlqjLpMH+pb
         LQIWEgW90UzJjLKJlOLe68z4dueBzPebFQ7QXP5IS6LQEFhXzlArmbcRGjddH5J2nRGr
         Om9h4p9al1TZ5xGXsWBJiRXpzMJUcIZQAKzlZpigDKz11EbN3HzHuCK0Rx8R9dsW7z51
         B5UcSeYlspa/kq3JfUg8ddiJw6ROQXR5t17087LJPujXdOsCMGYVfqQoCaQP89IjhWto
         SY3y/nbICNOfehGiSm7pk4UGCeNJ8NUCH7e4DKMSJxyxxAKE2c5SHW5cfQun5t6CVT3I
         jtVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782831895; x=1783436695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RxV5fEpsJGHhE3L8vdcj3Th/5v0heJ6mrreI6jrRPh0=;
        b=aPJCNFAyx8tRpag9ZKXcbD9XBEu3lcFNIZa+n+ioB2TTLiS9UQLr1gNHbJLnVMQHM8
         HclVzyTp1at3z25wmlwdX9yzmykP72aT2iT54I4EuRvqlY+6hP4s2qlW2eREzpX66rA6
         LJB7M2YPYArr7a2c1fE6SnX6sbnMbcNAiNeTL1oTbP/5SC150QWa3++KfSpL88g4JRem
         PpDWbzjPzWZJlwzmFmbS/1a7NcABD7iFc0xNzquvN26HpDRfTE3kZzppaAwOTnMXu8j9
         MloG8B8066xREzYyXx39qYnY/GhF+YOcBUhlRuNLkNXIzmj9jnNAnbGFJF/2H+KOE5qC
         6YsQ==
X-Forwarded-Encrypted: i=1; AHgh+RqEKd4V8xoiErh2GH7Q2QcaJyUH9voUzjx+pUt5pUEomKozA9oicfLeM45Gi28Sg8FQ/4LMMGPC6X4VaVYczbHu@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2BtwpfE26+rvRA5/J0gKl7905gU1qB6EcNJAcJj9/Y6/W2z1L
	XlVldYYLvv0ZwXXfSF4xzSGHly3wr+E1Gc/EFqV/Yh1lAhk/E9dc8hPk
X-Gm-Gg: AfdE7cl+iA7Rca4VNxA79VUDYMbmuhAcFlFIWt23aW0TGZHs9unQcvQKf6/DUP7VlLu
	SdizWLH5MkhB93ymVIuDZk5H6AFTQ8uGmzmntmrS/Dl3B6TWZRDFjb+ZJZvbmCBbt59BAMdWE4I
	FtnzEeSeuVTB7O1Fr53DZDy9wg3saHeqyHRHVgPJZLrmxTmDoL9IgiPayuyIu6YVKgrKGHMit6G
	YhA6cGceECjiT258EiuloTy63RdWvQudlJIZPOZuaG2xZN13Xh/AzPWxdXwgAX0mEBA99NXaoQ8
	sSY9yhHKllXKbbRtL5pApAviLwicJWwTsmWypKYMj6H8TY7PgHr7hwHut6rj+cUcyANprSjdMGr
	zI+5lTwczGQrewZdGyJt5p23ITSmyYW0f/GxH96IcpbKH0XqiQxXzw/ANLN0CBcfeK+J1MkFuvM
	6Pox0hJq4=
X-Received: by 2002:a17:902:f788:b0:2c9:d8c6:1dc3 with SMTP id d9443c01a7336-2ca5a449b1fmr7717425ad.0.1782831895138;
        Tue, 30 Jun 2026 08:04:55 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a70bc0sm16250465ad.10.2026.06.30.08.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 08:04:54 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: rppt@kernel.org,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-mm@kvack.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vincenzo Frascino <vincenzo.frascino@arm.com>
Subject: [PATCH v3 5/8] ARM: remove unreachable invalid range check in kasan_init()
Date: Wed,  1 Jul 2026 00:04:10 +0900
Message-ID: <20260630150413.1718632-6-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630150413.1718632-1-ekffu200098@gmail.com>
References: <20260630150413.1718632-1-ekffu200098@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_080456_067852_3897930A 
X-CRM114-Status: GOOD (  10.18  )
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

kasan_init() maps each memblock region with for_each_mem_range(), which
guarantees pa_start < pa_end. Then it skips any region with
pa_start >= arm_lowmem_limit, so pa_start < arm_lowmem_limit is guaranteed
as well.

When pa_end <= arm_lowmem_limit, pa_start < pa_end means start < end, so
the start >= end check is unreachable.

When pa_end > arm_lowmem_limit, end is clamped to __va(arm_lowmem_limit),
and pa_start < arm_lowmem_limit means start < end, so the check is
unreachable as well.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 arch/arm/mm/kasan_init.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/mm/kasan_init.c b/arch/arm/mm/kasan_init.c
index c6625e808bf8..1f7c74c5df9e 100644
--- a/arch/arm/mm/kasan_init.c
+++ b/arch/arm/mm/kasan_init.c
@@ -262,12 +262,6 @@ void __init kasan_init(void)
 				&pa_start, &pa_end, &arm_lowmem_limit);
 			end = __va(arm_lowmem_limit);
 		}
-		if (start >= end) {
-			pr_info("Skipping invalid memory block %pa-%pa (virtual %p-%p)\n",
-				&pa_start, &pa_end, start, end);
-			continue;
-		}
-
 		create_mapping(start, end);
 	}
 
-- 
2.43.0


