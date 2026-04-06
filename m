Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B80EF4ECA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 10:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V1I15X9X7j4rAAhAVYdgKSA5yt1Ur692e3szEwexYJE=; b=aMUps5FaEO5Fek106hbFn9nGyG
	+irGCjIvRFgv69oewjxeXVlSVOShnXlg+1gf62drxWGNgF1nKzPPXnc6L3uhMQuk7FwvnHhQcgqsY
	xY9SVfHzDnrrekm1JRjYIDFAzkRpO8rF5z61rKNbusYzSJSujW+jbKNwlwny4ZLQPSA0iLN2Wzab5
	mEA0UbkjXEMeyjA1S5fmcYK7wIizYPsuzOXi82CSguny5VODD9oJFWGnxzp2VgTLhSlT62b8PU5ke
	H/BOcoNs7rH0GoSLoh0pZnZBg1N07NvDCZahwMXREvfRKHck23sXuUYNSUbOL6gweNvMFDeXG+mjQ
	pcDQ65Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9h83-00000005004-48z4;
	Mon, 06 Apr 2026 10:24:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9h82-00000004zzx-3DxO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 10:24:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D1EF600AC;
	Mon,  6 Apr 2026 10:24:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B38BDC4CEF7;
	Mon,  6 Apr 2026 10:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775471060;
	bh=ubGAF3hmNHjU6MfkJrHCEAvksWtUTwkbDSHXUbQhCAU=;
	h=From:To:Cc:Subject:Date:From;
	b=QFHrsq/q2wpxQuzvj1SsFmhxmS9D2n8LP5jIdj1HElrFvEaGTh86cH0aMzRqJdEK0
	 OQZDQaoWG94eXEYJWUuiVGmiQ724LFQt5tZRGIYNTjkFTwMypQETM98y8s1pzitxJo
	 /cLQxHntDJriW923zOV3VM7JC7tVd+7w2E2Ldk5R8+36/Mwi56Zhb9+FtvqR0PAOnh
	 iGHflaVZA44Ke7RqLK48ti5OShDY61C9CO7G1n1E3FOt/t8zm82cmesLu8ZA46CZp7
	 ITdjGTb9Pr+VXKJP8pr+weNk+gXyX+LNy1HiWQTWj2PFLASAjko3nhas7lttqPKUkm
	 QcXfLAE4/5WLw==
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
Subject: [PATCH v16 0/5] ring-buffer: Making persistent ring buffers robust
Date: Mon,  6 Apr 2026 19:24:15 +0900
Message-ID: <177547105523.259641.14385891517704197263.stgit@mhiramat.tok.corp.google.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
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

Here is the 16th version of improvement patches for making persistent
ring buffers robust to failures.
The previous version is here:

https://lore.kernel.org/all/177494615421.71933.3679132057004156013.stgit@mhiramat.tok.corp.google.com/

This version adds Catalin's Ack [1/5] and update description and
document[4/5][5/5]. Also, rebased on ring-buffer/for-next.

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
 kernel/trace/Kconfig                 |   34 ++++
 kernel/trace/ring_buffer.c           |  258 ++++++++++++++++++++++++++--------
 kernel/trace/trace.c                 |    4 +
 26 files changed, 276 insertions(+), 64 deletions(-)
 create mode 100644 arch/arm64/include/asm/ring_buffer.h
 create mode 100644 include/asm-generic/ring_buffer.h

--
Masami Hiramatsu (Google) <mhiramat@kernel.org>

