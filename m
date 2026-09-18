Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6387DC982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 22:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WYajfqS3KjHTY5xifMFwHc/tZdyyd455ED9TO4wHoQI=; b=CxvwEx+0w6B9XdT+CwEK1guWLe
	JBMVIp/WsNe9JryJqLy0UTmC9HdrpWeGRbnz9pUtQJzOmtJg8H4hU1sKhNLyKE/qKd0yNRl/68wjD
	+PY1eSMKA6zAc+6qUe1cmqMhqaHImyFBhVPklDmLGwREq9X9tGrH5W7rcvShbdeSV48GeUKYQxndX
	Z9JLCFIQCw+lRitOYU1APilqbcdBDvVJ9MqoMA1GbZyNWk1hKHXLwofczWllEH3UqYVWaRPao5ZV/
	qJdqcCrZaCRYAkmKQoYVIEl80qQa6nvyA6AgB+8L59I03j9zrmRdjN4nhE8jvkbG7ytWcSVpJNhYT
	6xs98eZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7hHT-0000000Fdv8-29ND;
	Fri, 18 Sep 2026 22:42:07 +0000
Received: from mail-pl1-x646.google.com ([2607:f8b0:4864:20::646])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7hHQ-0000000FdtV-201r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 22:42:05 +0000
Received: by mail-pl1-x646.google.com with SMTP id d9443c01a7336-2db87f759c5so24245905ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 15:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789771322; x=1790376122; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WYajfqS3KjHTY5xifMFwHc/tZdyyd455ED9TO4wHoQI=;
        b=b0sqqTfmVZKgsQtkuUc76XS1MzQwp+27tBsGXzQd6o5TXmvCx1S+IEbPXg5S01C+5E
         mv+V6HQNlLwwkT/zqHFwl20Ho4ahc8qSxfafMsbL5EW4D6+NNgoRACgJSe2lC0zia0uw
         YhAJYV1Lg+QORLOlZKhZNAeYvfEVCEBy+U7OgMvLKFOm8+NTZvYHYfUYuEEHL3WIKyjh
         V/I5KKYjvn+IOzSq5xcHo7XlOL9CbAabHVdS1wyblImqdPYT6TurWwyDwzj+XjSDEKw8
         OxkklSPa5L12aUpChNJvk2C1c12qT6IrbJD8bBFqBIw3mETS1Ydb1jbSkKkcHq0OguiK
         O0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789771322; x=1790376122;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WYajfqS3KjHTY5xifMFwHc/tZdyyd455ED9TO4wHoQI=;
        b=zXpqWKfTmUBrfgo9IzUG4xBd6jM80K5WfecAtwSTn3kp3TyGDPIRLhNzaUUH1zwfWa
         FSNNlGBEbTTiWRVq4A7+1nHWi0kSCBHWRx8Dug4Xya2PxYxHXZJTBMg+1thmAJzb+Qgb
         jgIfIxXJR1xcEkRYfpe7Xxomo6ZHz0AMRTa7NBng4MibpMA/qRWe+MKtT5xBe7qrjuOu
         gFrzfDOMu/zPcj2nbfYQuZU9hnONqgBAnYDlSDL7GRDkdKNKW1BQtKbeOMcLWVNJ0o+u
         +G1HngbMSrBuN+/JkkPT+IXzyqOzJmUkTb+E3QSfL1SOjO6E8iG60BhqJFYI6NMiWm0t
         4MtQ==
X-Forwarded-Encrypted: i=1; AKwUvByIvQOMIUpB6/7gimxLuBAzIAjDKn07VH8J1y1+bum061wlBAVPZHGjo1K/5u8S46kuN0GWjJwhXRJqeG8nbI8Y@lists.infradead.org
X-Gm-Message-State: AFuF++m5mML90lahRnd+EeIfUBh4ZheBkbYpI4V2m+KhE5JYU7I2ndgn
	ETF941DR8zhPqnJr1aEXOR6BB2Dq8E19vnGDxQSZN7eMfYgr+GB6UFPSyIQUcx400VCwEQm2xmm
	5qYSdyPt2RwwA/HruCW9rMh0nkw==
X-Received: from plmn11.prod.google.com ([2002:a17:903:188b:b0:2dd:b876:a4c8])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ecd2:b0:2db:8406:db91 with SMTP id d9443c01a7336-2ddb1adf368mr77650485ad.10.1789771322382;
 Fri, 18 Sep 2026 15:42:02 -0700 (PDT)
Date: Fri, 18 Sep 2026 22:41:46 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918224157.1471085-1-dylanbhatch@google.com>
Subject: [PATCH v7 00/11] unwind, arm64: add sframe unwinder for kernel
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
X-CRM114-CacheID: sfid-20260918_154204_524653_4F42182B 
X-CRM114-Status: GOOD (  21.73  )
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

Summary of changes since v6:
 - Drop SFRAME_REG_SP / SFRAME_REG_FP definitions.
 - (sashiko) Add -fasynchronous-unwind-tables so CFI directives are
   emitted by the compiler even when debug options are not set.
 - Discard .eh_frame sections when CONFIG_UNWIND_TABLES is not set.
 - Repurpose kernel/unwind/sframe* exclusively for in-kernel .sframe.
 - Drop user-acces wrapper usages for direct memory access.
 - Simplify struct sframe_section for only in-kernel use case.
 - (sashiko) use get_unaligned() when reading packed .sframe contents.
 - Drop support for flexible FDEs, as this isn't needed for arm64.
 - Simplify sframe IP validation for only in-kernel use case.
 - Simplify debug printing for only in-kernel .sframe sections.
 - (sashiko) fix CONFIG_MODULES=n build.
 - (sashiko) Fix non-leaf CFI annotions in arch/arm64/crypto/.
 - Simplify FP and RA recovery logic.
 - Simplify arch_stack_walk_reliable() code path, dropping unnecessary
   structs and dead code.

Dylan Hatch (6):
  arm64, unwind: build kernel with sframe V3 info
  arm64/module, sframe: Add sframe support for modules
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
 arch/arm64/include/asm/linkage.h       |  29 ++
 arch/arm64/include/asm/module.h        |   6 +
 arch/arm64/include/asm/module.lds.h    |   2 +
 arch/arm64/include/asm/sections.h      |   1 +
 arch/arm64/include/asm/unwind_sframe.h |  32 ++
 arch/arm64/kernel/entry.S              |  14 +
 arch/arm64/kernel/module.c             |   5 +
 arch/arm64/kernel/setup.c              |   2 +
 arch/arm64/kernel/stacktrace.c         | 186 ++++++-
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
 include/linux/sframe.h                 |  41 ++
 include/linux/unwind_types.h           |  34 ++
 kernel/unwind/Makefile                 |   3 +-
 kernel/unwind/sframe.c                 | 692 +++++++++++++++++++++++++
 kernel/unwind/sframe.h                 |  79 +++
 kernel/unwind/sframe_debug.h           |  34 ++
 48 files changed, 1361 insertions(+), 134 deletions(-)
 create mode 100644 arch/arm64/include/asm/unwind_sframe.h
 create mode 100644 include/linux/sframe.h
 create mode 100644 include/linux/unwind_types.h
 create mode 100644 kernel/unwind/sframe.c
 create mode 100644 kernel/unwind/sframe.h
 create mode 100644 kernel/unwind/sframe_debug.h

-- 
2.55.0.1082.g2b9226bbc0-goog


