Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CAD2D116F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 09:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G8PUYE65+35CiVgD1jp+ggIop/9/H10ihf2g4jePZBk=; b=OFo6BxkTCfPsRW2EeQGfO+SQ94
	DSXmBqaItAmsSaEwC8f3NDj3KQrzc5DWnyVZedzABDHFvPzs/lCx96T2X2QGfth8+e0Py9UnGdGJ8
	nv8+4xUQVjx08CkBRRB4rPIMHDRsBmPB4iJOD/e1/b7N5OTJg9bSL3ac3zgckGlju2JI0O0rPi11H
	GaMdqwGTBejDJn9h9OU0Gh0ye4pGlNGObG9+AS4Ebsre3Y+lnEp2csJ0SMfVz+Fbzl5T/ONqfNnv+
	ZOMrXeFXVsKMJiTewzV9TZRKqCv7lm6pvUjJRmlq+28ZNE6qBocP+Nu2II7BMZ7rb78KrFeJ8cp1+
	/Psk3EHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYDQ-0000000GHgE-0KP1;
	Thu, 27 Nov 2025 09:23:04 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYDK-0000000GHb1-1jy4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 09:22:59 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-47799717212so3900795e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 01:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764235376; x=1764840176; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=G8PUYE65+35CiVgD1jp+ggIop/9/H10ihf2g4jePZBk=;
        b=t4Fm0uSnfgvmkJKiciupuTVg5Oe3svr5cSILP4izAA6ggqo9NQa9lzuYtjttyjZ93B
         c7IGel95g6fohVyxT2Dx4hFaJINcWETdIzPhw7NPPcUTBuATGhZFZUAJZXO9gqKVwqq+
         YqVxLQV7d13+4/nF2UT9/3u4Yi73LQkyD3inEJWhn0z8TG3L/2Ej4OJRhJHkyusYK5KW
         2/zFtWnBryjGXYJ1bhm7LIE/VS/duNXQgD/PIc7h+bIrxXu0Gk/mzhrzx/0iVI9TzKK3
         mnVq6ck0kVk5CL1ptLgvMLqSHJZylGwDZfSCnnRx5DL0tR9+7NpSt7Sbpw0/dO/UQiKQ
         a8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764235376; x=1764840176;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G8PUYE65+35CiVgD1jp+ggIop/9/H10ihf2g4jePZBk=;
        b=X4W5Hqiv2biDRCQHkFnSnpoD2tUyg2lcekiT7FDjAb2mBZCudLCOxE6wECF4YlRDTM
         T3Xuiv5xbKGMAkxhGWg3Yi01TBdYGLx3nRwHFHEziznlj2pTW84p6yjgQayGKHkRqn/m
         EUPJet5BY7nfERpwAuZjB0h4nciBPHYQLGQFr797QILVgNvOsWySTMXpT9iFggZgZsmp
         zKRKMVbVtSltIJpzn5tq0t/FLY36ufKce6YhhgiuKa9BBjXLOGCPnjJpDWwgRQx9s02R
         ie/DJHm5CA2qfqAR+mQzl6/mOfpSe5JRvokYFa4lJbOQ8FGbaCO+mH4/c2UiZxK1+dbP
         yPIw==
X-Gm-Message-State: AOJu0Yyhm21MbBz+qfntJ9e7NDquAImN5mHWCE93WZi2JKdShbw0BO5D
	QPWko0/P/XiWMvZ/Walc00FELueqbcgpSO5uTH7BS7LDJ+wk5tIhqlBPzQYRA7GSJKvLtOg45Q=
	=
X-Google-Smtp-Source: AGHT+IHGmStaBw0kw+zywe3YOqYeTN7JkzcsA1+VS2rjrhQpPUmECbRNT13sfo28k0MCm5UyvTanyD0N
X-Received: from wmbh15.prod.google.com ([2002:a05:600c:a10f:b0:477:988a:7675])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1382:b0:477:a977:b8a7
 with SMTP id 5b1f17b1804b1-477c1117956mr205200185e9.19.1764235376129; Thu, 27
 Nov 2025 01:22:56 -0800 (PST)
Date: Thu, 27 Nov 2025 10:22:30 +0100
In-Reply-To: <20251127092226.1439196-8-ardb+git@google.com>
Mime-Version: 1.0
References: <20251127092226.1439196-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1946; i=ardb@kernel.org;
 h=from:subject; bh=39kBqCzlZF8SLfFJgWsjj400jCEDRYRkq2STbPbbenE=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIVNDIqI3ZHbml073v/KHdtpnHfpRm/Py3LMdqh9Sljd+f
 rhn84cNHaUsDGJcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAi7oYM/0M7zlcnzJvAe846
 80bGvn+b3uxjbs5YvCouYfXjnXIBr/4yMixpPnD96cT+y7kXZlzTaJTelrqtrYVD1/PozHcXtNf yb2UEAA==
X-Mailer: git-send-email 2.52.0.107.ga0afd4fd5b-goog
Message-ID: <20251127092226.1439196-11-ardb+git@google.com>
Subject: [RFC/RFT PATCH 3/6] random: Use u32 to keep track of batched entropy generation
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-hardening@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Kees Cook <kees@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jeremy Linton <jeremy.linton@arm.com>, 
	Catalin Marinas <Catalin.Marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_012258_473629_A826990F 
X-CRM114-Status: GOOD (  14.00  )
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

The batched entropy containers each have a generation field, to keep
track of the base_crng generation from which it was last reseeded.

This use case does not require all bits of the unsigned long to be
stored: storing only 32 bits is sufficient to determine whether or not
we're at most 4 billion generations behind, which seems ample.

So use an unsigned int instead: this will allow a future patch to treat
the generation and position as a single 64-bit quantity, which can be
used locklessly in a compare-and-exchange() operation.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/char/random.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index b8b24b6ed3fe..0e04bc60d034 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -507,7 +507,7 @@ struct batch_ ##type {								\
 	 */									\
 	type entropy[CHACHA_BLOCK_SIZE * 3 / (2 * sizeof(type))];		\
 	local_lock_t lock;							\
-	unsigned long generation;						\
+	unsigned int generation;						\
 	unsigned int position;							\
 };										\
 										\
@@ -521,7 +521,7 @@ type get_random_ ##type(void)							\
 	type ret;								\
 	unsigned long flags;							\
 	struct batch_ ##type *batch;						\
-	unsigned long next_gen;							\
+	unsigned int next_gen;							\
 										\
 	warn_unseeded_randomness();						\
 										\
@@ -533,7 +533,7 @@ type get_random_ ##type(void)							\
 	local_lock_irqsave(&batched_entropy_ ##type.lock, flags);		\
 	batch = raw_cpu_ptr(&batched_entropy_##type);				\
 										\
-	next_gen = READ_ONCE(base_crng.generation);				\
+	next_gen = (unsigned int)READ_ONCE(base_crng.generation);		\
 	if (batch->position >= ARRAY_SIZE(batch->entropy) ||			\
 	    next_gen != batch->generation) {					\
 		_get_random_bytes(batch->entropy, sizeof(batch->entropy));	\
-- 
2.52.0.107.ga0afd4fd5b-goog


