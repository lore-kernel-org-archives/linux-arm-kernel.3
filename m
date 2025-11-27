Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47FAD11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 09:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8k+F0GetRpiG4yeaeJZYzrwTgndZIgQnhjJYwqn3Z9M=; b=hxrr1zzwXYdhzlhy7ftQdwfAX9
	bywaaELon28i+/AA5mE58iR490wjlOP+bp+mkgHbJFwM/pVE/ISxpGZ1v+eHHjG4NqhEG14wGQbDk
	BWfNOAigK6FlEfQAMAcXyIM3Vatkc12cLHoAw3Kq1RK6Ng/UEyaBVzVT+VUBpDgc98knYGD+0wKth
	qXtZPlRC0o5Q9D6MwmnlWrVYkDB38gTlRpR5aPD4XLAx4Mdlbzc5Y5cOO36EDqjOzLchetrDvMOR8
	M0AJGQFH7S8OIXDNrMLKW585L3E7QelX2xXf6uGduS/lvA/vsRsOHUG8T1iF7Eba4ruZDroFrWZPt
	DUFnFg5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYDI-0000000GHb6-46CW;
	Thu, 27 Nov 2025 09:22:56 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYDG-0000000GHZe-3oG6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 09:22:56 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-47106720618so6195125e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 01:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764235373; x=1764840173; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8k+F0GetRpiG4yeaeJZYzrwTgndZIgQnhjJYwqn3Z9M=;
        b=XDgP7S9XSMxmH0hGGkOo0z1CLtjy5YkOZwi8m+CEiADPRWvi80y/6pa6PBgqfCQjnx
         u1r0Tfiq4eTxr9CLVuaEbO0DXkcSEUsz3aCvbKNyTbZLFXA9+WTY1aO95xDjtNaFr9Fm
         5sb8/yuf5QzSo3EyYlGv/Y6PVxW3gzsWxtR+1CBhiI61F7BBEfM1mgkrBlA+NsqlZG6Y
         P5KIOyu/IJ2toobiT7YzndC0Uwp+PrT36+iK6/yaZ58WpIdCXvVP5B/R1WZsFpvR0YVH
         igYrq6o4QDpbGPWAHKXSv2WSMqxPzLFEHzDN2aFeocV/9wXC+hKmWrdTT3THMRAf80xJ
         zsLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764235373; x=1764840173;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8k+F0GetRpiG4yeaeJZYzrwTgndZIgQnhjJYwqn3Z9M=;
        b=P7a6xf8mTs9zkIIZMbAxtmu5wEVuLjfhOY/WxQ60ZXWZNXvYSx+wpWCTKuW6588nWI
         2uIfSkxsKarq21dUMbr+RufkDxxDNjvsdFjtarQmr1ych/nxJJstzMkMJs06KWnJxUg5
         GzM/qvvlxVju1acglgWDo7hcWeuOVRU9rBclL74uVKpf4bRbaIwEZoruN0/goF2Hw2Ns
         RjkTVB3C2ktryZXaDTHk+fLjobo+NsNAGAXBMpBxhzmARlW05E2k5j3bVnel+y9ZBH3i
         4fhgIE/xh1tcki6TgO2IVDm6PjAUdGYoicE2fY47Rzkn3LnRe0pKV4YZBrk3Wt/fls69
         kD1A==
X-Gm-Message-State: AOJu0YyWR9dbzJdS6xGmhqwjOYee5PJD1Vsk7AjwcpQX+y3yvyEgCYvV
	zxaZZbeZVLGRkvgjNCtxz06o8HTwXGk3DytemuagahRcg1mKuMQ/z9InQRkMVzZpnim3wVZi+w=
	=
X-Google-Smtp-Source: AGHT+IGfvNKR+g9XaWkAB5dq4WcVViwMo8HeCBTI8nv+mxDAvIwxYs0Hqc92CpBwKzvNXIgLV5xTxErv
X-Received: from wmbz27.prod.google.com ([2002:a05:600c:c09b:b0:477:9b53:8816])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:840f:b0:477:df3:1453
 with SMTP id 5b1f17b1804b1-477c01eea66mr213141915e9.28.1764235372847; Thu, 27
 Nov 2025 01:22:52 -0800 (PST)
Date: Thu, 27 Nov 2025 10:22:27 +0100
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1810; i=ardb@kernel.org;
 h=from:subject; bh=GVwhZRAgf3/OeRmqAQsplmNoFkzur4kYLnMaWMHGxBc=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIVNDIjjssTWzZKbJxK9fUrdHx0111Cq1Zn3gl7nMhI/B/
 jrbBt6OUhYGMS4GWTFFFoHZf9/tPD1RqtZ5lizMHFYmkCEMXJwCMJGwbEaG8zZViycp7mXK630g
 uzr8p1CxSAODFX8+z+fKR5P/rDf8wMjw1C1rXqkNQ0+GsmhXdWzjhsMPl7/6c0bz/cJr79OPnVz BBAA=
X-Mailer: git-send-email 2.52.0.107.ga0afd4fd5b-goog
Message-ID: <20251127092226.1439196-8-ardb+git@google.com>
Subject: [RFC/RFT PATCH 0/6] Improve get_random_u8() for use in randomize kstack
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-hardening@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Kees Cook <kees@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jeremy Linton <jeremy.linton@arm.com>, 
	Catalin Marinas <Catalin.Marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_012254_986929_3318E354 
X-CRM114-Status: GOOD (  10.48  )
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

Ryan reports that get_random_u16() is dominant in the performance
profiling of syscall entry when kstack randomization is enabled [0].

This is the reason many architectures rely on a counter instead, and
that, in turn, is the reason for the convoluted way the (pseudo-)entropy
is gathered and recorded in a per-CPU variable.

Let's try to make the get_random_uXX() fast path faster, and switch to
get_random_u8() so that we'll hit the slow path 2x less often. Then,
wire it up in the syscall entry path, replacing the per-CPU variable,
making the logic at syscall exit redundant.

[0] https://lore.kernel.org/all/dd8c37bc-795f-4c7a-9086-69e584d8ab24@arm.com/

Cc: Kees Cook <kees@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Jeremy Linton <jeremy.linton@arm.com>
Cc: Catalin Marinas <Catalin.Marinas@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Jason A. Donenfeld <Jason@zx2c4.com>

Ard Biesheuvel (6):
  hexagon: Wire up cmpxchg64_local() to generic implementation
  arc: Wire up cmpxchg64_local() to generic implementation
  random: Use u32 to keep track of batched entropy generation
  random: Use a lockless fast path for get_random_uXX()
  random: Plug race in preceding patch
  randomize_kstack: Use get_random_u8() at entry for entropy

 arch/Kconfig                       |  9 ++--
 arch/arc/include/asm/cmpxchg.h     |  3 ++
 arch/hexagon/include/asm/cmpxchg.h |  4 ++
 drivers/char/random.c              | 49 ++++++++++++++------
 include/linux/randomize_kstack.h   | 36 ++------------
 init/main.c                        |  1 -
 6 files changed, 49 insertions(+), 53 deletions(-)


base-commit: ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
-- 
2.52.0.107.ga0afd4fd5b-goog


