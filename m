Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0E1FF60ED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 08:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/nsM2/QTBc1+UoibHrvk9JevBT5/+U1EpGLZLs7BplE=; b=BiU//FkonmIPNIr+u5ya4CE0Xh
	ELyYDs9rNJkZqccluCRRpGM4Mugc7x1UQRO1/YVp8sHEFY4YXG4cftEbtliFXLLcT9CsQuTWNuSRr
	Fgu10g7zsnnLM44ygAY/OJ2regZo4B/Svav3oZULXRh0co2coXx50UWSJCT+PWbEk9/vGx79Z1J21
	aMNWq9zJ7ZKv5MaX8t68VOGFxr81pqyTjf9F1eC6b1B68qbvarWDI6oGefUC8wNzlc/RHl71ckcif
	ZlvkmI5Wsq2SRYE9BNZJXFAfRlyoMTaw+CEvRVbe5lAHhLWgHPd14YV7DTgksdG6zkUUK4sur88aF
	eRH12SJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7UZw-0000000Cbi6-1Ml7;
	Tue, 31 Mar 2026 08:36:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7UZu-0000000Cbhd-0mLT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 08:36:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 55065600CB;
	Tue, 31 Mar 2026 08:36:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CF19C19423;
	Tue, 31 Mar 2026 08:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774946161;
	bh=oeERGx74IOGltNC60r1Co69orfKTcrkSQWbL9r5xfaU=;
	h=From:To:Cc:Subject:Date:From;
	b=UgNwe1tJoGXA3bt5bsQ2dQm/m6Wb6zypipr/Wt+bgLtb3DBt2a3sRABJQVa19hW45
	 zmQufn6LX6Oe4uKdt0hkdV/R2QO5FGmFevuy7IkgXQXg+cbDcm5PwcN7BxFAmshRJq
	 7JwifAZgdhk5yJFQN4ynWuh7IXvYaTGmu8o2Zo2WBGSsaY0xYVelh0Ycxb2dBN/vmM
	 +h8hWOPx+fIxvwgxUqu46B3K4kU7qBfbha1Q2DKuNIwYlNTZpFqhyObDMPKjZ7MnNI
	 wQSsDfjVLVV+tBIlvzmWuf/aWsgbWeGDekuz4bZFMlZlc4Dg9y2Qbi1X4gzptXd5UV
	 a48VQ8wyYQOpw==
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
Subject: [PATCH v15 0/5] ring-buffer: Making persistent ring buffers robust
Date: Tue, 31 Mar 2026 17:35:54 +0900
Message-ID: <177494615421.71933.3679132057004156013.stgit@mhiramat.tok.corp.google.com>
X-Mailer: git-send-email 2.53.0.1118.gaef5881109-goog
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

Here is the 15th version of improvement patches for making persistent
ring buffers robust to failures.
The previous version is here:

https://lore.kernel.org/all/177487498530.3463592.12715592581212799257.stgit@mhiramat.tok.corp.google.com/

This version fixes warning if reader see contiguous multiple
empty (invalidated) pages on the recovered persistent ring buffer
[2/5], do not show discarded pages if it is 0 [2/5], use pr_warn()
for showing test result [4/5], and inject errors to the pages which
is multiples of 5 too[4/5].
This also drops "Reset RB_MISSED_* flags" patch, and add a patch
to show commit number on each data page [5/5] for debugging.

In this version, I added arm64 maitainers to request their
review for [1/5], which introduces asm/ring_buffer.h for flushing
the cache before reboot.

Thank you,

---

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
 kernel/trace/Kconfig                 |   31 ++++
 kernel/trace/ring_buffer.c           |  258 ++++++++++++++++++++++++++--------
 kernel/trace/trace.c                 |    4 +
 26 files changed, 273 insertions(+), 64 deletions(-)
 create mode 100644 arch/arm64/include/asm/ring_buffer.h
 create mode 100644 include/asm-generic/ring_buffer.h

--
Masami Hiramatsu (Google) <mhiramat@kernel.org>

