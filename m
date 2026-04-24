Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E732FB44BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 06:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bVjngQNZIhpi2IpX9drnTgb+e2YmlWR8YVf72VwZOk0=; b=dut6XS5BrDyL2ai0hHyPuZ7EIw
	pK4ugCCwyNjIS5wymjkjYXKYDzFw2OnXEn3z1TSUcUCC18GKcy3ncaDUrDcXJ4T428nen3ILThbRq
	P59D0+KDOeFM+YJhtwgexCKnFv6F8yY7+HrjS3SLcOBjYOspngCRuTJgrF7rDLG8Ysh9JRgoEG0Rt
	FE1oYyjpD17/0ltxM3klq9GTXhcOSmqSmTaRbr5BrsatBZVn8aQrQH5f4t1XQK5O+QvXFdsuGgfLV
	1Hi9pIy6bm7rQqY1zdgYm/bXWduXj1BG/JGaNark4xNE19KqsyYtptYMy/LS9kHVMNMkxAZlQEjYj
	hzt/SuqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAOX-0000000CjIA-39NB;
	Fri, 24 Apr 2026 06:52:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAOU-0000000CjHQ-2zFY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 06:52:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A31E40B7D;
	Fri, 24 Apr 2026 06:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39244C19425;
	Fri, 24 Apr 2026 06:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777013525;
	bh=3Pkgxb3AaO1XuEUmAmnS4l7BYM6AORThEKZp5fWQTI0=;
	h=From:To:Cc:Subject:Date:From;
	b=umEbRDaFAgKrUbp5k24rIFyf59WDdYS0hUE5hImkUf3jyg+J8yglF7Ow2FhkgHiS7
	 0sJmyxiyZMzYij5THZnDg+jv1DAjqpJYw+OsGJ9ZdMrPQYQrzuEr47q9uFRNT8OWcz
	 KzwP9RZ9Pm1GxSLKJX45PXv3XxNZ+TDVMV1wCVB6LswHuAw8I0vxG6Ot5w3gfYbRcW
	 DrJpzFGOFCXCPmlsUS9pLwoeWZncTV4D00LOeNcPNS93dGUtEIGALLQCs6R5XWdUmq
	 3DVShoF6wARZx7VzaIvzwcY2J6gF5z5/lK4wpOErypXdx8PNMWhtrn49bcQRL95Bd0
	 5ikQ6GFQNowMw==
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
Subject: [PATCH v18 0/8] ring-buffer: Making persistent ring buffers robust
Date: Fri, 24 Apr 2026 15:51:59 +0900
Message-ID: <177701351903.2223789.17087009302463188638.stgit@mhiramat.tok.corp.google.com>
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_235206_815893_FF1C234C 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
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

Here is the 18th version of improvement patches for making persistent
ring buffers robust to failures.
The previous version is here:

https://lore.kernel.org/all/177687458572.932171.10907864814735342737.stgit@mhiramat.tok.corp.google.com/

This version fixes a newly found bug and some review comments from
Sashiko[1], also, add 2 cleanups, which includes:
[1/8] Do not double count the reader_page when verifying persistent
      ring buffer.
[2/8] Add Geert's Ack (Thanks!)
[3/8] Fix to substract BUF_PAGE_HDR_SIZE from meta->subbuf_size
      to make the limit of commit size.
[4/8] Reset timestamp of reader_page when the entire cpu_buffer is
      invalid.
[5/8] In rb_test_inject_invalid_pages(), changed entry_bytes and
      idx to unsigned long.
[7/8] Cleanup persistent ring buffer validation code.
[8/8] Cleanup buffer_data_page related code.

[1] https://sashiko.dev/#/patchset/177687458572.932171.10907864814735342737.stgit%40mhiramat.tok.corp.google.com

Thank you,

Masami Hiramatsu (Google) (8):
      ring-buffer: Do not double count the reader_page
      ring-buffer: Flush and stop persistent ring buffer on panic
      ring-buffer: Skip invalid sub-buffers when validating persistent ring buffer
      ring-buffer: Skip invalid sub-buffers when rewinding persistent ring buffer
      ring-buffer: Add persistent ring buffer invalid-page inject test
      ring-buffer: Show commit numbers in buffer_meta file
      ring-buffer: Cleanup persistent ring buffer validation
      ring-buffer: Cleanup buffer_data_page related code


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
 include/asm-generic/ring_buffer.h    |   13 +
 include/linux/ring_buffer.h          |    1 
 kernel/trace/Kconfig                 |   34 ++
 kernel/trace/ring_buffer.c           |  472 +++++++++++++++++++++++-----------
 kernel/trace/trace.c                 |    4 
 26 files changed, 395 insertions(+), 159 deletions(-)
 create mode 100644 arch/arm64/include/asm/ring_buffer.h
 create mode 100644 include/asm-generic/ring_buffer.h


base-commit: 6170922f137231b98fc568571befef63e1edff3f
--
Masami Hiramatsu (Google) <mhiramat@kernel.org>

