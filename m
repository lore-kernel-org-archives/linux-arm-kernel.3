Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39C1FA1FCD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 16:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=45U1QIjlX7DUAME+Fk/vC6cJYSxH6PCKg6P+vpRhNvw=; b=yFJ2j3et9np968M+sTgpr3PvQ+
	58kEOimZ5jriRbvNgmoCuWxFpITrPlu/lNaaKivaxVhhVPlVIfrh5Z3isHxgJjWxieMoX+j/whb+F
	7NapbbnDYP2mSfBnaQVZUmq9BU8AcK0oKLgoAA09wcbmi6FmQUmsJJHiujsXli/3eK4M/ocwmKjjt
	1v2J0Un0d7jbP7x208ZzkcfA7A4SVPJRoDBrMT2WBT3/jDn+EqC5CakWDbPS3S8KetVmBqhYJ/8SZ
	kXhG4bfr7P6EgSFXNtscCo7m9RE2f2mMa2zH3s4QMkFZx8r/o6aOekFuW4sPpielCfmr2P9F9Jvxp
	pzm2Hz+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFaFc-0000000AUFO-1NBu;
	Wed, 22 Apr 2026 16:16:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFaFZ-0000000AUEX-3Swm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 16:16:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F256A4367E;
	Wed, 22 Apr 2026 16:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE114C19425;
	Wed, 22 Apr 2026 16:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776874588;
	bh=91iXZSQqUVdF83EUnHj44pw4JQSZtIFD+ygd3Gd6kGE=;
	h=From:To:Cc:Subject:Date:From;
	b=IFV/1QJJBBQNztikppzmAh8hG4Ib/DwAARChOy6jDkjTPHZqDcGP9RnySdIEXOf3c
	 R+s8ZuJ/9FLmMnRpke7tizFZEpQoIWc0dYbkw9gRJP9wH1jRjS36XGcDPHl+/lCHjN
	 G64NF6P0mLfKL2d+GFm5pbQLf581lwgL95ledXFPWRKkNEZd4ttjzHYl0h/KI8o52K
	 r4oFN3kkPpLM+i9FEvNVMv3lRN1hReANtTbJFsWIu2bJQGUCoEnqBOv5hfUqmqjn1E
	 7J+zwejym7DQu027WTNzAcNbvHKRd6iFt24AmYlADJ3V+22csp8vS9nLGKIYC+DHwB
	 FCT7P1ZbjG5rQ==
From: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Ian Rogers <irogers@google.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v17 0/5] ring-buffer: Making persistent ring buffers robust
Date: Thu, 23 Apr 2026 01:16:26 +0900
Message-ID: <177687458572.932171.10907864814735342737.stgit@mhiramat.tok.corp.google.com>
X-Mailer: git-send-email 2.54.0.rc1.555.g9c883467ad-goog
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_091629_902374_AA201CF7 
X-CRM114-Status: GOOD (  11.02  )
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

Hi,

Here is the 17th version of improvement patches for making persistent
ring buffers robust to failures.
The previous version is here:

https://lore.kernel.org/all/177547105523.259641.14385891517704197263.stgit@mhiramat.tok.corp.google.com/

This version fixes some review comments from Sashiko[1], which
includes:
[2/5] Fix to use rb_page_size() of rewound pages for entry_bytes.
[3/5] - Fix to verify head_page at first before using its timestamp.
      - Reset timestamp if the page is invalid.
[4/5] - In rb_test_inject_invalid_pages(), changed entry_bytes and
       idx to unsigned long
      - Added NULL checks for cpu_buffer and meta.
      - In allocate_trace_buffer(), added a NULL check for tr->name
       before comparing it with strcmp.
[5/5] Added NULL check for dpage in rbm_show in ring_buffer.c.

[1] https://sashiko.dev/#/patchset/177552432201.853249.5125045538812833325.stgit%40mhiramat.tok.corp.google.com

Thank you,

Masami Hiramatsu (Google) (5):
      ring-buffer: Flush and stop persistent ring buffer on panic
      ring-buffer: Skip invalid sub-buffers when validating persistent ring buffer
      ring-buffer: Skip invalid sub-buffers when rewinding persistent ring buffer
      ring-buffer: Add persistent ring buffer invalid-page inject test
      ring-buffer: Show commit numbers in buffer_meta file


 arch/alpha/include/asm/Kbuild        |    1 
 arch/arc/include/asm/Kbuild          |    1 
 arch/arm/include/asm/Kbuild          |    1 
 arch/arm64/include/asm/ring_buffer.h |   10 +
 arch/csky/include/asm/Kbuild         |    1 
 arch/hexagon/include/asm/Kbuild      |    1 
 arch/loongarch/include/asm/Kbuild    |    1 
 arch/m68k/include/asm/Kbuild         |    1 
 arch/microblaze/include/asm/Kbuild   |    1 
 arch/mips/include/asm/Kbuild         |    1 
 arch/nios2/include/asm/Kbuild        |    1 
 arch/openrisc/include/asm/Kbuild     |    1 
 arch/parisc/include/asm/Kbuild       |    1 
 arch/powerpc/include/asm/Kbuild      |    1 
 arch/riscv/include/asm/Kbuild        |    1 
 arch/s390/include/asm/Kbuild         |    1 
 arch/sh/include/asm/Kbuild           |    1 
 arch/sparc/include/asm/Kbuild        |    1 
 arch/um/include/asm/Kbuild           |    1 
 arch/x86/include/asm/Kbuild          |    1 
 arch/xtensa/include/asm/Kbuild       |    1 
 include/asm-generic/ring_buffer.h    |   13 ++
 include/linux/ring_buffer.h          |    1 
 kernel/trace/Kconfig                 |   34 ++++
 kernel/trace/ring_buffer.c           |  275 ++++++++++++++++++++++++++--------
 kernel/trace/trace.c                 |    4 
 26 files changed, 290 insertions(+), 67 deletions(-)
 create mode 100644 arch/arm64/include/asm/ring_buffer.h
 create mode 100644 include/asm-generic/ring_buffer.h


base-commit: 6170922f137231b98fc568571befef63e1edff3f
--
Masami Hiramatsu (Google) <mhiramat@kernel.org>

