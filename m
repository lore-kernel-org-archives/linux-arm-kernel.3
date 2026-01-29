Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3FC5D46C01
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 00:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZukGKueGp87OrsWwJYFUiCCf9dq8hTvBab+Jn9rxA6I=; b=UkHUiUgg7ukoWBSGcFKRpXpZMl
	wZNDkhc1UlVrMEavyZ/cbo4O+HN4C23cuICkN0nMapRjHB9x8hhmqRIhK/3Nih0PEaokX6lWoH2qc
	veXCTU/e3fgucduGocgcBBUmGEzX8dCGFqfG4ZYiQ7jCmg2fhyPrJ2ykvTvZ2Ui5CEaD9JBKAOVxM
	EMNN/iM4fuvB0JHwK2hkuc4chgvtNC1YPKj4eIFpabnkikk91AXtpsMCJghLRQh+X4fCPVJTiA2eO
	CHEtFUCs+YrXglhmsR2/vOXCpeUWyHhAhEoVCigzjY3abBJG7hfKo2rxBkQ5lC/hzx5ZKbCWe+IzB
	vdIKVVhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlGLI-0000000H0QN-0kLR;
	Thu, 29 Jan 2026 00:57:04 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlGLF-0000000H0Pm-1jJ6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 00:57:02 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-b8d78d3fabfso121155766b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 16:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769648218; x=1770253018; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZukGKueGp87OrsWwJYFUiCCf9dq8hTvBab+Jn9rxA6I=;
        b=YngeD8Yh4ail75mwVOkOZHU/9igESRnPFVxv1zHnE/kafBIUtwNaDX2FBpQjiWGLNa
         xR0/SzcGM9TVi+uVMoZ05goCx4Bo+jZ7mAEINXHPif27AKs1q/2s/I+4IISgGMznX+kP
         PGZK6Qks4WReBBhedZ0GhW1yTgXYmsxwhR0MpTY1wDRs5OPj//+3DC5WFgq2lhtVebQS
         O3sBt0gGgyeqt/Gfv4wZCQycE7ui43OCgQmXAS23Pr92cP4KCBCrHPNCIeeMQ7PbAo3J
         c4gHqj4ebW1Vbp+5BZFU0yMJc/AnAQ/Z1k0cKasjlufwc82g02rUip5d6vqKfA2qKw0v
         Xavg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769648218; x=1770253018;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZukGKueGp87OrsWwJYFUiCCf9dq8hTvBab+Jn9rxA6I=;
        b=RhNl8TeyHzGsii/E3CgMPPskSIwRtL78S6JlCRfFhQpS3fmEC5HOgm6DyzJ1ek3nsp
         /lIBWTW7uEmSBaRUlKT9myrViLi5CRr+BDNq0BBkiYcmEtkuEbFRRiDDblmCDFZtiJby
         O3FdIiJB56rLsfWu06g3/vlsoxAR38Krv38KxXHx0b6cInA89ud1Z7QFgDTrz28PFbTf
         9vnCeCI9tJppXO33KL+j8DiC9JaAcO59iOA3/Siw0PReGHQ4T7h0oYNLNbHfgxahtQZk
         +ZFjwUnMCVF2DpzbBnMP6E7H7yIxq0p02qZjrba/VqC8L43IkZZ95+AsmvOWtmLLbtIb
         Izmg==
X-Forwarded-Encrypted: i=1; AJvYcCUNVou89AHk9hpO7KPuTwAGOGhnpWAuE+0poBWtn3vQ+KayDB/cLh0ueyUkZCH06KLIzI1HJMWWyrpg+Z0k+hOw@lists.infradead.org
X-Gm-Message-State: AOJu0YwxgoP254WxmDcoGRkKCClOk4m94Pg8uhpafO2ssGT9L99qym19
	yb75N6N7t1vxhTVhXOCJluo+HRlajXXQJZ4jUhZn8STVG3+BVWMAZ3xZxf/pK69LmzP9P25APmN
	rvg==
X-Received: from ejbbw17.prod.google.com ([2002:a17:906:c1d1:b0:b88:2156:436c])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:3f8e:b0:b73:758c:c96f
 with SMTP id a640c23a62f3a-b8dab3a41e3mr495095966b.52.1769648218454; Wed, 28
 Jan 2026 16:56:58 -0800 (PST)
Date: Thu, 29 Jan 2026 01:52:31 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
Message-ID: <20260129005645.747680-1-elver@google.com>
Subject: [PATCH v2 0/3] arm64: Fixes for __READ_ONCE() with CONFIG_LTO=y
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_165701_509392_2F7EA944 
X-CRM114-Status: GOOD (  12.61  )
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

While investigating a Clang Context Analysis [1] false positive [2], I started
to dig deeper into arm64's __READ_ONCE() implementation with LTO. That rabbit
hole led me to find one critical bug with the current implementation (patch 1),
and subtle improvements that then enabled me to fix the original false positive.

Patch 1 fixes a bug where READ_ONCE() on types larger than 8 bytes (non-atomic
fallback) incorrectly qualified the pointer rather than the pointee as volatile.
This resulted in a lack of "once" semantics for large struct loads.

Patch 2 refactors the macro to use TYPEOF_UNQUAL and eliminates the ternary
conditional.

Building on the refactor, patch 3 fixes the context analysis false positive, by
helping its alias analysis "see through" the __READ_ONCE despite the inline asm.

## Note on Alternative for Patch 3

An alternative considered for the Context Analysis fix was introducing a helper
function to redirect the pointer alias; specifically passing a pointer to
const-pointer does not invalidate an alias either (casting away the const is a
deliberate escape hatch, albeit somewhat unusual looking). This approach was
slightly more verbose, so the simpler approach was chosen for now. It is
preserved here for future reference in case we need it for something else:

	static __always_inline void __set_pointer_opaque(void *const *dst, const void *val)
	{
	    *(void **)dst = (void *)val;
	}

	...
	__set_pointer_opaque((void *const *)&__ret, &__u.__val);
	...

[1] https://docs.kernel.org/next/dev-tools/context-analysis.html
[2] https://lore.kernel.org/all/202601221040.TeM0ihff-lkp@intel.com/

---

v2:
* Add __rwonce_typeof_unqual() as fallback for old compilers.

v1: https://lore.kernel.org/all/20260126002936.2676435-1-elver@google.com/

Marco Elver (3):
  arm64: Fix non-atomic __READ_ONCE() with CONFIG_LTO=y
  arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
  arm64, compiler-context-analysis: Permit alias analysis through
    __READ_ONCE() with CONFIG_LTO=y

 arch/arm64/include/asm/rwonce.h | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

-- 
2.53.0.rc1.217.geba53bf80e-goog

