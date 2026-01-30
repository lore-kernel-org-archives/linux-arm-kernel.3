Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C66C9E6BF0E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 13:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5gV3Xp+lTWPd5vADH178EfrhS9HF61GnJcWvrSFIRbk=; b=vjLofQStPZHejCW+vkA1MnQ5Va
	itSEdfdmwRWE0KBV9QvhLD93M7Tz0dCfmgzkfnIGPdgMTvpgdH75OEMlxBPR1NZxb1JO3m6LACu0F
	HJC/RNKKvDBO8dbUs69rEgWxKGgIxMkOiUYCeiwRtsRm2h76pFkgkbLw+E/uJtYmMJWGmwqF3t/K2
	HD0phjs416xFD2U4KV6bavIpaO52aBe3rnhMvrOMOry9oYx+uSUBBonjTkUtw0GVYPhCv/tCN+lg8
	a8mIWjnvTiv2pFRhA17yMkSrSPIV+hwjflTxbYdeSwrPbI6r1raKQWJ0Lq8PyQCb6GxrvnxJ6Qbti
	IneGAr/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vloZe-00000001XAz-2HDS;
	Fri, 30 Jan 2026 13:30:10 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vloZc-00000001XAO-0Kbw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 13:30:09 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-658cbca1d78so2814349a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 05:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769779805; x=1770384605; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5gV3Xp+lTWPd5vADH178EfrhS9HF61GnJcWvrSFIRbk=;
        b=CR2Ay+fMn6FXKBuZyhdJCGKnPAHKg6Jqj7PhSPtHA1k4r0hE3LQqxXFYP/DBMWLwel
         RcLjl3UpwSqfw0o0H17jsNNmAIfVSwp18S5Jiv5YdyhoWu/ZMd78iO2ArvIlVRwUCnyf
         t3Ls8CpcxcXxK0oo7tzIZ6OmhbCQw5jUkIoSB8Seie5W3tSyxCu5bicTCfJiJqKFvJ7k
         nalStG9/78Pa/4/kb+BFtnFiSLyJ5h3FKdFo18M319uv1dpzQ2rCY40qr1Khq3S1hIqN
         YOUHETfa7VMsl/Llqk8WVD8gXo1mU9NTVQID7CJAJYd+CobQTZXA7zmK+qmKtkIuAMne
         em7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769779805; x=1770384605;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5gV3Xp+lTWPd5vADH178EfrhS9HF61GnJcWvrSFIRbk=;
        b=jE79EoxzohJtoVOE0cfe+ss9nqHClh6DnDuLdYJmZbFx1156fBjZHHI4i4Mjwl/xbW
         PSG65HDEHe+KF6AKftyuMWLss9nYani62l3+kQMsbNQl6b9vA78WksxVZzl0ZkRPjuu7
         ipvuy1M7Pjbd/J52bodO/e2ZxWg0reNpvnoNvebMxsuSHB69uWTzX4HFq2KIJLcJB4VM
         JJUQkmVrPvr6NsFKQBIV92RzrEzWaQANjlxH6gN7YEOpCxiIlwq1KVK2HEGzyINNUijT
         486quBjbpXhz4MFfFHAJAMR0eYIvd/aC4szgk8qtWMpsarKsf0GVJd5HgbxaMGJCZpmZ
         XSow==
X-Forwarded-Encrypted: i=1; AJvYcCUW1ZEMWGVuMaaj/eVSXTesmezylDRnH65YdKhP8rHo0bYnwkEQ3XzCnjeSKZ0CHmH85ybZRlmE7JJ5n/qijhGh@lists.infradead.org
X-Gm-Message-State: AOJu0YzOY6z+jFSkUgHmEf8Yvu868d47AHhkk/5Vz3hXLU5qxwwimvVA
	to6I3o5+ol8QMhr9R+h5Ppp34eAjODbt7uNnyTt/QAIBQDdv6yWwRiAIR1T5RfWt+UIRKd35bfL
	NAQ==
X-Received: from edtc22.prod.google.com ([2002:aa7:c996:0:b0:650:bcc2:4d7a])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:280b:b0:658:eca:1fa5
 with SMTP id 4fb4d7f45d1cf-658de58a598mr1929989a12.20.1769779804975; Fri, 30
 Jan 2026 05:30:04 -0800 (PST)
Date: Fri, 30 Jan 2026 14:28:23 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260130132951.2714396-1-elver@google.com>
Subject: [PATCH v3 0/3] arm64: Fixes for __READ_ONCE() with CONFIG_LTO=y
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	David Laight <david.laight.linux@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_053008_138190_29042539 
X-CRM114-Status: GOOD (  13.26  )
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

Patch 2 refactors the macro to use __rwonce_typeof_unqual() and
eliminates the ternary conditional.

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

v3:
* Comments-smithing.
* Use 'typeof(*__ret) __val'

v2:
* Add __rwonce_typeof_unqual() as fallback for old compilers.

Marco Elver (3):
  arm64: Fix non-atomic __READ_ONCE() with CONFIG_LTO=y
  arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
  arm64, compiler-context-analysis: Permit alias analysis through
    __READ_ONCE() with CONFIG_LTO=y

 arch/arm64/include/asm/rwonce.h | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

-- 
2.53.0.rc1.225.gd81095ad13-goog


