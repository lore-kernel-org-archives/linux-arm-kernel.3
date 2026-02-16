Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38079E81A2F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 14:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PN5r/7tt47yJK8ejJibZMzrosjD0HGAjuC2k5NzaqOI=; b=oLBF5PIVdfv/Nf+AfdDw6FYS0j
	T3YINJJTQiSNfj/HncNYnnbQ1Qv1XK3+2GowgvvzCQlF4vtwZfLwdzw3pZxUkGi8dJ2QAVKRKOIcf
	cYYy/C18R0N7gxvNbQwh0kNBnDd7i1UwfZYEJZOD289TFk/y2Qmc9vQxNoC0Y/BjgAzwaCQe4x4OG
	5vrP9uiDi6k1FF9ehHxzidtqYhoZItgHCTkR4bIcANuh50EBSEIR5W8fpKZ2DCNA9BbUAdsCD5QZB
	mTGLTPLYgHXuHTGZ2DtsNd9xlqjl+JuI5Nb/KLlp4hd72ihSRgW0wqut6NT3zVHG7mFn4x8rDogRH
	ouaznfgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrzw9-00000006ox4-3O5q;
	Mon, 16 Feb 2026 14:50:57 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrzw6-00000006oqv-3Sfk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 14:50:56 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4836b7fbf4fso25370815e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 06:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771253434; x=1771858234; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PN5r/7tt47yJK8ejJibZMzrosjD0HGAjuC2k5NzaqOI=;
        b=CwrCk/leimJZSPkSPlq65Me12ABL2J+sOmdv+8QN305V3FV7MZDiO5+xkN5cT+dfjK
         8ZHYgHMtEqWWQJXGOjGYTRTA9egjzZpTvoNBnqbJ367wlpk6pBhtKP1ZZ7foDh+u0l7f
         Z60cLS7kBIYXXiJt3cczz0cYhlBMG2i/JxDKOjEHHoJKCioWZKGPf2Y55HEc1xOPjqeH
         A3rCAShvidKJRdv3dZF19zZYAb3WNI4HhahwNRwnez/+Jl9s/uGK7dTkOXskJfMuntSW
         0IkEV6f3z9ihdp/UPuEfLMj+bEk73cFrjI3FhBm+O+s37mrnxP4d5VEcvCaVTqpfkYLD
         pNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771253434; x=1771858234;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PN5r/7tt47yJK8ejJibZMzrosjD0HGAjuC2k5NzaqOI=;
        b=UZfBCBg3rCI04W6+8wNk1NI08fSxDqPl6+qbWQEINVZjudo1qsDLQtpRxkuD22FcGy
         d5Ho6cB0HOLzZGx6Rd01SS4/+SYe6bdUek6yvFPTfxQoTckCkx2aBLpRlJah22vGAQKk
         9WC9dV4aP9myKr+7/lD9rNsCUO1zE95ZQrDCQkj879U1Pmwk2h+C30G3ttcX/83C1Znt
         OnlvTM+OnZUkUxzTvJoMmtzAyoofwbWyz+hBWrbHaz5dveRvVNmWL4fYHn6eRBriRat3
         CP3Kd5j3B4fgh5Wgnt4Ml/QkwW6RQc6YjUX/1O1LT8UvZ39u+QdC/wBkC6zkgtOQGG/M
         qGsg==
X-Forwarded-Encrypted: i=1; AJvYcCVu4HNOGnMNyqMErn15wn5ikMMqoUFY5eBmF1anX7AMNFzDMU0UOSz2H23AWJsExUbEXNpRRzKOs6WYRIFVvWl5@lists.infradead.org
X-Gm-Message-State: AOJu0YwqpM1sKxvsBJnA35p1/652sVhyeaPh1Cy1brVfhSGjjABUwfPv
	c+2NgnzoRPcmzJL5/vJlgofExoi3wZWY3d8gzaMMwYulC5z+LqHeX7jBCSApNwukbS3rYJWNJf9
	J8g==
X-Received: from wmaw19.prod.google.com ([2002:a05:600c:6d53:b0:47f:941a:613d])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1c12:b0:480:49ce:42cc
 with SMTP id 5b1f17b1804b1-48373a02cfbmr205524815e9.9.1771253433414; Mon, 16
 Feb 2026 06:50:33 -0800 (PST)
Date: Mon, 16 Feb 2026 15:16:21 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.335.g19a08e0c02-goog
Message-ID: <20260216142436.2207937-2-elver@google.com>
Subject: [PATCH v4 0/2] arm64: Fixes for __READ_ONCE() with CONFIG_LTO=y
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	David Laight <david.laight.linux@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_065054_881890_3EAE66A0 
X-CRM114-Status: GOOD (  13.76  )
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

While investigating a Clang Context Analysis [1] false positive [2], I
started to dig deeper into arm64's __READ_ONCE() implementation with
LTO. That rabbit hole led me to find one critical bug with the current
implementation (fixed already in [3]), and subtle improvements that then
enabled me to fix the original false positive.

Patch 1 refactors the macro to use a different way of getting an
unqualified type and eliminates the ternary conditional.

Building on the refactor, patch 2 fixes the context analysis false
positive, by helping its alias analysis "see through" the __READ_ONCE
despite the inline asm.

## Note on Alternative for Patch 2

An alternative considered for the Context Analysis fix was introducing a
helper function to redirect the pointer alias; specifically passing a
pointer to const-pointer does not invalidate an alias either (casting
away the const is a deliberate escape hatch, albeit somewhat unusual
looking). This approach was slightly more verbose, so the simpler
approach was chosen for now. It is preserved here for future reference
in case we need it for something else:

	static __always_inline void __set_pointer_opaque(void *const *dst, const void *val)
	{
	    *(void **)dst = (void *)val;
	}

	...
	__set_pointer_opaque((void *const *)&__ret, &__u.__val);
	...

[1] https://docs.kernel.org/next/dev-tools/context-analysis.html
[2] https://lore.kernel.org/all/202601221040.TeM0ihff-lkp@intel.com/
[3] https://git.kernel.org/torvalds/c/bb0c99e08ab9aa6d04b

---
v4:
* Use the return-value-of-function-drops-qualifiers hack.
* Rebase (original patch 1 already merged).

v3: https://lore.kernel.org/all/20260130132951.2714396-1-elver@google.com/
* Comments-smithing.
* Use 'typeof(*__ret) __val'

v2:
* Add __rwonce_typeof_unqual() as fallback for old compilers.

Marco Elver (2):
  arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
  arm64, compiler-context-analysis: Permit alias analysis through
    __READ_ONCE() with CONFIG_LTO=y

 arch/arm64/include/asm/rwonce.h | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

-- 
2.53.0.335.g19a08e0c02-goog

