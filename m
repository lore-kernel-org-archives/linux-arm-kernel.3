Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC28FF8864
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 03:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7EjNfIyfR1DeFkoG9Z/pJWNU9O4z2jpGZgBa9H9HRiI=; b=NULBGUr7FbSDz/aNLHkb/OURfq
	ahFI5e+NwZ6Ovp2BmZi5/EDEsmOzgeRO9WkG05lWuz4xkOSwrvagfdPaYKdIQoABQRxzIrEMBJYqb
	OFx+LWZc90xFVpWy2lBhj/CASh3oVJ6MbriE5oC3zT88zneytB3dGA02I15tnxhQfWAmbY263jY8U
	WUTaxMSYeNzwHm2/Njx63+zZ0+L+5mEbV11fllludT736mfeye8MCP5j/ApwEqHDNjDUHiQsEJlU3
	rfl7kvRj0e1oZkeJzV2NI7brHRWRMpc0on9jYHZu8fXLXsrFliyd/2VBIpvhG5zMPLWx78ps0E7Yw
	zBsgktaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII4w-00000004ZCa-0eqx;
	Thu, 30 Apr 2026 03:28:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII4R-00000004YVo-321r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 03:28:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E01E61339;
	Thu, 30 Apr 2026 03:28:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96E02C2BCB8;
	Thu, 30 Apr 2026 03:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519690;
	bh=k2A+kUVVRq4Ta7CpDmynAO3yQaUxHFRQg/EdEUOsSQg=;
	h=From:To:Cc:Subject:Date:From;
	b=TwnW3ZlBdw/gKupgDdgPK/QWOkwACyys/Mwkd9jkswiXbo9nlZJTK3Y7QRuIxfT1W
	 Ud2wYYkTo1p5DTLBTZHmLW2hl8A1q1coyxXkLDJWz6d2ubD+8vly3xoo+JsjIsMHV9
	 l821ni6Ar2xfK7kYdIYQ+4wT0Rioy8vr+1CIfZaDlKkWMryis/jNmAyYSwPsUNKjFf
	 FhNvrplxUB4hRz0kGXAAaCkxpXdyUZrDF31rNDpESBEf372BkBNkoBdkCnWxBiv/z/
	 eY1zMbih658u8w1tn2CEnY0UVesy5E4xRFHZq05GPVhCiAWnfQz/DACVZ0pjb+Q9Vj
	 AhsQh+9+nwZkQ==
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
Subject: [PATCH v19 0/7] ring-buffer: Making persistent ring buffers robust
Date: Thu, 30 Apr 2026 12:28:05 +0900
Message-ID: <177751968499.2136606.17388366710182662849.stgit@mhiramat.tok.corp.google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
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

Here is the 19th version of improvement patches for making persistent
ring buffers robust to failures.
The previous version is here:

https://lore.kernel.org/all/177701351903.2223789.17087009302463188638.stgit@mhiramat.tok.corp.google.com/

This version rebased on v7.1-rc1 and cleanup code.

[2/7] Limit max number of loops to nr_pages in __rb_get_reader_page()
      and update comment.
[3/7] Cleanup rb_validate_buffer() so that it is more readable,
      and add a comment about the timestamp validation.
[6/7] Add a kerneldoc about rb_validate_buffer().

Thank you,

Masami Hiramatsu (Google) (7):
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
 kernel/trace/ring_buffer.c           |  490 +++++++++++++++++++++++-----------
 kernel/trace/trace.c                 |    4 
 26 files changed, 415 insertions(+), 157 deletions(-)
 create mode 100644 arch/arm64/include/asm/ring_buffer.h
 create mode 100644 include/asm-generic/ring_buffer.h


base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
--
Masami Hiramatsu (Google) <mhiramat@kernel.org>

