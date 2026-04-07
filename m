Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7112DFB5173
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 01:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NooIHswyGzeSIJIO4+52skCTiiWHm3M1aAeSIhReJPw=; b=07Hk1I5lHpqee/eRxyUXEEywJe
	0kmhkSNSFuX3W1RT1c3C40QaetrHS3E4HUXzm4uxzNsMu4SOrGberGlopNSjS4Qswvl45qi+dSQnO
	XR9Hx/dkKBB8IKRWgHFC7T3cPftmPC0hLTiWQe/PmvcRALeb5XKPyE3fjM4cPkHkblF95ExYSFj7T
	DmhPuqq01fJSqFDE+vKEwardoi0kZNVTcm+7sT1wjCllWwkQSgfiyPVE66NYtvB07ErAafeNjlZkW
	mry/LKBqeQCYO1HwlRswNWjEm42GFn/bQ6pwpwPAtQ2VGvGr/SqMttFj+J5eoGC5mzTql6bybmAP9
	lk4buGIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9uzD-00000005gVo-1jwJ;
	Tue, 07 Apr 2026 01:12:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9uzA-00000005gVS-1eoi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 01:12:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AB88E443DA;
	Tue,  7 Apr 2026 01:12:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5752AC4CEF7;
	Tue,  7 Apr 2026 01:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775524327;
	bh=nO7MSi9KtSPql9LxwJNNyWYq2uXlPbYAE6DXi5GoDx8=;
	h=From:To:Cc:Subject:Date:From;
	b=q0nS6YpIn/XY95Dc9c0JScdEgow0GNgFoWvCABNhSQumiHD1IqI1RCBPYx05FwwiL
	 rIvBaEg4vTLqa9OXswbZpB2eFpD8V8yIqy7BFEe7ScVehxNV4EVk6Cgnd1mVP5QRt6
	 HJClY0bilwHd8L4fjK+Pci1G8lKnxVmWzpbz7nxdG4d89gMGNRIeLw2+/q0C/vGAS3
	 OsDtOMyMDUcNfGisAm3lGHMwy0p8Cw1qvrX0OC5KQ2hqpHhQcU+OMzEmrkRVT4/mYK
	 5OKtFBwV3IkE/FX3ZusEwjypxvUHbcM/MMCJoGzpOLIxYeZ8+NnZcMND4PbdW1STb8
	 92ofE7IOfgeaw==
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
Subject: [RESEND PATCH v16 0/5] ring-buffer: Making persistent ring buffers robust
Date: Tue,  7 Apr 2026 10:12:02 +0900
Message-ID: <177552432201.853249.5125045538812833325.stgit@mhiramat.tok.corp.google.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_181208_477888_E85146ED 
X-CRM114-Status: UNSURE (   8.76  )
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

[Resend this series with base-commit tag so that bot can apply this correctly]

Hi,

Here is the 16th version of improvement patches for making persistent
ring buffers robust to failures.
The previous version is here:

https://lore.kernel.org/all/177494615421.71933.3679132057004156013.stgit@mhiramat.tok.corp.google.com/

This version adds Catalin's Ack [1/5] and update description and
document[4/5][5/5]. Also, rebased on ring-buffer/for-next.

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
 kernel/trace/ring_buffer.c           |  258 ++++++++++++++++++++++++++--------
 kernel/trace/trace.c                 |    4 +
 26 files changed, 276 insertions(+), 64 deletions(-)
 create mode 100644 arch/arm64/include/asm/ring_buffer.h
 create mode 100644 include/asm-generic/ring_buffer.h


base-commit: 3515572dd068895ffd241b8a69399a0ebfac7593
--
Masami Hiramatsu (Google) <mhiramat@kernel.org>

