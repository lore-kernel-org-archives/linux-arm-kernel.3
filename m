Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4DCCA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 11:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3BiabrC81I6q/hu88iG0Po7W2aHkc1H1GfO6iXoWDeM=; b=rDLGXZXR1ZuhVZRzdtRIDbjy9R
	NpHuo8Sf9Mo87HXrI7uTR9ptKlRcHoy81cWsHcUmLSUB76DQ30vUVvJV4dlTd7aSRLPTL5VN5waXn
	CvQdoz+Jid6xvWNeZtDtsInKurd7Y7TkPeqI030XlQLI+kj1YmHXUFhLog570W/nK0zqKjbJUg5LH
	8pTX1Tes1GvOO0IUv8DDrOOiRK2D+Geez6GxNG8BGeBO4lVYR6ZMBPGhyvFivd1Nv84n3r9BjKxjh
	Y9KG/n60PqHp0wfaWhwoa6iJSlROBGkCR5u9Pk1Jl9YOjT545++v3ZZ8YcXdjlWOwWoPFENd7C/JP
	boKFvGLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQ3p-00000002Mgt-0hrA;
	Wed, 07 Oct 2026 11:43:49 +0000
Received: from mail-pl1-x648.google.com ([2607:f8b0:4864:20::648])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQ3m-00000002Mfn-2Dac
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 11:43:47 +0000
Received: by mail-pl1-x648.google.com with SMTP id d9443c01a7336-2d55d8cd938so59308735ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 04:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791373424; x=1791978224; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3BiabrC81I6q/hu88iG0Po7W2aHkc1H1GfO6iXoWDeM=;
        b=LO89s205CyLGMkrtCn/5LTMwqCzWw/48LmgyPaniKGYLBqNgVyqi0/dln3sTgx9slG
         wNciMG8l6h4GTSaUOn8q5z4879wJam8egYP4dvJTjq4QTeMq4YPed7VZ0QgZRlytz5G+
         xeqAp3lzb/H6vc4HlEPyqofUO9ooIuirqTmawPjT37rc9m+CVLGQTfkvy2LI4oCLnUxI
         XUG8bZgsNj5+o3I0qN5TW6cHzd45Dj1meE94pkoPaparROORh6fB/ujsK2jNUaQ5bdQ3
         L85quqZaOyYgqro97hr3ZUB+Kpdowocu08BuE4F3s/uV0G0SMYu9PvF653mNJ1BLJDBo
         Zs5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791373424; x=1791978224;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3BiabrC81I6q/hu88iG0Po7W2aHkc1H1GfO6iXoWDeM=;
        b=1xHFMl1OmZlggpX/oZzL+l8Jh6I0q+RIBCMOZjCTUeJoVKF1iC94URhwa+bngRVYvf
         pSm7CmcTcOqHdwSIhvXA7N3wO99+7n+wgWTcKNUoEB5EALiQgnX2eRcZDkpM4evcmyAN
         fct7VZeCdIcXPDndZAb9dAEemiAkG6ZUy3WRMNSBUL3CzoHcWx0dZ4yroHVqdaDnL9Xo
         XWeHksqrHMevKc7wjtPeiOpAZc2QNo8Txk6LslKoKqXIZlyewyAPDFp37xwCwE2nSi63
         5gu1dzp8/2JuqOBCMAkNYexSC5eW1gsL2s1/u2c9kozrMewR/DT8JQceBYuW0pi1dMfn
         zdFQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9Rq6+KofLQnAY/ROg7M+C09vFlGysaSPUg6tIAOz0etLD0ink6FdsPNQYv8SUmpkQJbukZyu3Id/oaVZuft7g@lists.infradead.org
X-Gm-Message-State: AFq9FYK1Nuru0wxVzAO4G5zD+S7E4rgjkOM5IXNKqOVVKJ6bkFpXvj60
	MpWsuC5XlqbBRfIOXXmDM9WPChA1guPQrKYJgSLEd43M0RqqBYp0yTPRqoB8EqfJ5oimKTGISsQ
	m5zhsm43gkCaKrK/gfbwDih/Nrg==
X-Received: from plnq15.prod.google.com ([2002:a17:902:f78f:b0:2e2:d223:8126])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ce07:b0:2dd:c100:9433 with SMTP id d9443c01a7336-2e600548a4bmr18840995ad.49.1791373424109;
 Wed, 07 Oct 2026 04:43:44 -0700 (PDT)
Date: Wed,  7 Oct 2026 11:43:24 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.360.g66cac248cb-goog
Message-ID: <20261007114335.440322-1-dylanbhatch@google.com>
Subject: [PATCH v8 00/11] unwind, arm64: add sframe unwinder for kernel
From: Dylan Hatch <dylanbhatch@google.com>
To: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <ibhagatgnu@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jens Remus <jremus@linux.ibm.com>
Cc: Dylan Hatch <dylanbhatch@google.com>, Prasanna Kumar T S M <ptsm@linux.microsoft.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>, joe.lawrence@redhat.com, 
	linux-toolchains@vger.kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Randy Dunlap <rdunlap@infradead.org>, Mostafa Saleh <smostafa@google.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_044346_602647_4E07DD4F 
X-CRM114-Status: GOOD (  22.12  )
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

Implement a generic kernel sframe-based [1] unwinder. The main goal is
to improve reliable stacktrace on arm64 by unwinding across exception
boundaries.

On x86, the ORC unwinder provides reliable stacktrace through similar
methodology, but arm64 lacks the necessary support from objtool to
create ORC unwind tables.

Currently, there is a sframe unwinder proposed for userspace [2], along
with an RFC for an .eh_frame unwinder [5]. This patch series implements
a similar SFrame lookup library to [2], but with many simplifications to
account for the fact that user access is not necessary. The intent here
is to continue to leave the door open for common usage of definitions
and algorithms between kernel and user unwind in the future, while at
the same time keeping these patches strictly constrained the minimal set
of features necessary for arm64 kernel unwind.

Unlike past versions of this series, these patches apply directly to
v7.3-rc3 rather than depending upon [2]. To make this possible, I've
adopted a number of patches from [2] with significant squashes and
changes made in order to coherently suit the kernel unwind use case.
I've done my best to maintain appropriate authorship on these changes,
and have added 'Co-developed-by' trailers to attribute shared authorship
as accurately as possible. Please let me know if you see any
discrepencies in my work here.

Currently, only GNU Binutils support sframe. This series relies on the
Sframe V3 format, which is supported in binutils 2.46.

This full series is available on github: [4].

Ref:
[1]: https://sourceware.org/binutils/docs/sframe-spec.html
[2]: https://lore.kernel.org/all/20260505121718.3572346-1-jremus@linux.ibm.com/
[3]: https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git/log/?h=sframe/core
[4]: https://github.com/dylanbhatch/linux/tree/sframe-v7
[5]: https://lore.kernel.org/all/20260821195259.2688377-1-jremus@linux.ibm.com/

---

Summary of changes since v7:
 - (sashiko): Put .cfi_startproc right after SYM_START to account for
   potential alignment bytes ahead of the actual function symbol.
 - (sashiko) Use __always_inline for IP validation helper.
 - (sashiko) Move .sframe module init and sframe section fields to arch
   generic code.
 - (sashiko) Make sframe_find() noinstr.
 - (sashiko) Add preempt_notrace and instrumentation to
   __sframe_module_find() code path.
 - (sashiko) Block tracing and kprobe on the sframe_find code path.
 - (shashiko) remove KCOV, KCSAN, and KASAN instrumentation from
   sframe.o (copying over ORC's shoulder).

Dylan Hatch (6):
  arm64, unwind: build kernel with sframe V3 info
  module, sframe: Add sframe support for modules
  arm64/sframe: Validate IP addresses
  sframe: Add debug helpers with object name
  arm64, crypto/lib: Annotate leaf functions with CFI info
  unwind: arm64: Use sframe to unwind interrupt frames

Jens Remus (1):
  sframe: Separate reading of FRE from reading of FRE data words

Josh Poimboeuf (3):
  arm64/sframe: Read vmlinux .sframe header
  sframe: Add support for reading vmlinux .sframe contents
  sframe: Add .sframe validation option

Weinan Liu (1):
  arm64: entry: add unwind info for call_on_irq_stack()

 MAINTAINERS                            |   4 +-
 Makefile                               |   8 +
 arch/Kconfig                           |  49 ++
 arch/arm64/Kconfig                     |   1 +
 arch/arm64/Makefile                    |   2 +-
 arch/arm64/crypto/aes-ce-ccm-core.S    |  12 +-
 arch/arm64/crypto/aes-neonbs-core.S    |  16 +-
 arch/arm64/crypto/ghash-ce-core.S      |  12 +-
 arch/arm64/crypto/sm4-ce-ccm-core.S    |  16 +-
 arch/arm64/crypto/sm4-ce-cipher-core.S |   4 +-
 arch/arm64/crypto/sm4-ce-core.S        |  44 +-
 arch/arm64/crypto/sm4-ce-gcm-core.S    |  16 +-
 arch/arm64/crypto/sm4-neon-core.S      |  12 +-
 arch/arm64/include/asm/linkage.h       |  32 ++
 arch/arm64/include/asm/module.h        |   1 +
 arch/arm64/include/asm/module.lds.h    |   2 +
 arch/arm64/include/asm/sections.h      |   1 +
 arch/arm64/include/asm/unwind_sframe.h |  32 ++
 arch/arm64/kernel/entry.S              |  14 +
 arch/arm64/kernel/setup.c              |   2 +
 arch/arm64/kernel/stacktrace.c         | 184 ++++++-
 arch/arm64/kernel/vdso/Makefile        |   2 +-
 arch/arm64/kernel/vmlinux.lds.S        |  14 +
 arch/arm64/lib/clear_page.S            |   4 +-
 arch/arm64/lib/clear_user.S            |   4 +-
 arch/arm64/lib/copy_from_user.S        |   4 +-
 arch/arm64/lib/copy_page.S             |   4 +-
 arch/arm64/lib/copy_to_user.S          |   4 +-
 arch/arm64/lib/memchr.S                |   4 +-
 arch/arm64/lib/memcmp.S                |   4 +-
 arch/arm64/lib/memcpy.S                |   8 +-
 arch/arm64/lib/memset.S                |   8 +-
 arch/arm64/lib/mte.S                   |  28 +-
 arch/arm64/lib/strchr.S                |   4 +-
 arch/arm64/lib/strcmp.S                |   4 +-
 arch/arm64/lib/strlen.S                |   4 +-
 arch/arm64/lib/strncmp.S               |   4 +-
 arch/arm64/lib/strnlen.S               |   4 +-
 arch/arm64/lib/tishift.S               |  12 +-
 include/asm-generic/sections.h         |   4 +
 include/asm-generic/vmlinux.lds.h      |  15 +
 include/linux/module.h                 |   5 +
 include/linux/sframe.h                 |  43 ++
 include/linux/unwind_types.h           |  34 ++
 kernel/module/main.c                   |  21 +
 kernel/unwind/Makefile                 |   5 +-
 kernel/unwind/sframe.c                 | 710 +++++++++++++++++++++++++
 kernel/unwind/sframe.h                 |  79 +++
 kernel/unwind/sframe_debug.h           |  34 ++
 49 files changed, 1401 insertions(+), 133 deletions(-)
 create mode 100644 arch/arm64/include/asm/unwind_sframe.h
 create mode 100644 include/linux/sframe.h
 create mode 100644 include/linux/unwind_types.h
 create mode 100644 kernel/unwind/sframe.c
 create mode 100644 kernel/unwind/sframe.h
 create mode 100644 kernel/unwind/sframe_debug.h

-- 
2.56.0.360.g66cac248cb-goog


