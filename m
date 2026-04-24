Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC13CFB44C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 07:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+NIi2u+c8fiR0Ex3uWvx7jFu7fAKNKofnQXwbQu2sZI=; b=GzyFoCnFz+ryanA+HAASkNBXsH
	Ux/RcKmDvfjS0dp2fk5j6aAUWmVbLp4yFMlXyxwcMjk1u820XSP83PMN1c9iv+CFDZNemnLmIrDo4
	YL0jhlYXQHOzvqC+ifROtJVIacb7UExAnwX415ca9MgZzJgq27K76/uCmsX5tCnTn0Y2Nc+36ADNU
	2zdc5RvplRRyP4mpZ0PaS+W2KFP32xzlLG+tQTN9ktpVPRNWph9xZlbpBVsPdNcAiqyg4loijlsML
	xoMm2KnpZW8TsXMkBjeiDazO56TWW6ZEkqaAqssmraXQm8B1phFB+DRCixqLZ6l0TriZP3S6F5cbI
	LxHblRzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAci-0000000CltV-0kwM;
	Fri, 24 Apr 2026 07:06:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAcc-0000000ClsX-2NEX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 07:06:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1CFCE442FB;
	Fri, 24 Apr 2026 07:06:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C553C4AF0B;
	Fri, 24 Apr 2026 07:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777014402;
	bh=TmX8gnlQzrvHw83tZno67tfF8CIFAFoS4SrixL+jdmU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CYBVy+yLqbqsoQniZcJDsow97WhQ/imgTiJHRnvl0GKUMDCrftQjAZ89QZPbuItFz
	 lLfr61nzZg0wRCHx7fcAKrZyEBfzFNZZ/MU2SwFxVHwECeddDJIRCagNpZLxN9d0h5
	 P1JULOdLoFm+M240dG7aLGle7Z5RC5pWb6d0PGugwtTrL3FwTaNAhdFAsLfVVpMzkd
	 4Dq1SdO8HoyiBvtgc5CLTRPM+Y1zZ4sLkkZMvsgMzH2PGFiz82oSmuozIkdZVMatfe
	 dSBWWi6H6d4zpdglAq7iR1S7t/+UDhEf85PpVgSTNtQTuQphE8vJ4ouy9zkJ8PlhEp
	 2rQj0PAeql1Yw==
Date: Fri, 24 Apr 2026 16:06:39 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v18 0/8] ring-buffer: Making persistent ring buffers
 robust
Message-Id: <20260424160639.1a65e2f1ed2dbe780e6a1e95@kernel.org>
In-Reply-To: <177701351903.2223789.17087009302463188638.stgit@mhiramat.tok.corp.google.com>
References: <177701351903.2223789.17087009302463188638.stgit@mhiramat.tok.corp.google.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_000642_662606_A940B9EF 
X-CRM114-Status: GOOD (  18.76  )
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

Hi Steve,

I added a fix related this series as the 1st one. It can be merged
independently.

Thanks,

On Fri, 24 Apr 2026 15:51:59 +0900
"Masami Hiramatsu (Google)" <mhiramat@kernel.org> wrote:

> Hi,
> 
> Here is the 18th version of improvement patches for making persistent
> ring buffers robust to failures.
> The previous version is here:
> 
> https://lore.kernel.org/all/177687458572.932171.10907864814735342737.stgit@mhiramat.tok.corp.google.com/
> 
> This version fixes a newly found bug and some review comments from
> Sashiko[1], also, add 2 cleanups, which includes:
> [1/8] Do not double count the reader_page when verifying persistent
>       ring buffer.
> [2/8] Add Geert's Ack (Thanks!)
> [3/8] Fix to substract BUF_PAGE_HDR_SIZE from meta->subbuf_size
>       to make the limit of commit size.
> [4/8] Reset timestamp of reader_page when the entire cpu_buffer is
>       invalid.
> [5/8] In rb_test_inject_invalid_pages(), changed entry_bytes and
>       idx to unsigned long.
> [7/8] Cleanup persistent ring buffer validation code.
> [8/8] Cleanup buffer_data_page related code.
> 
> [1] https://sashiko.dev/#/patchset/177687458572.932171.10907864814735342737.stgit%40mhiramat.tok.corp.google.com
> 
> Thank you,
> 
> Masami Hiramatsu (Google) (8):
>       ring-buffer: Do not double count the reader_page
>       ring-buffer: Flush and stop persistent ring buffer on panic
>       ring-buffer: Skip invalid sub-buffers when validating persistent ring buffer
>       ring-buffer: Skip invalid sub-buffers when rewinding persistent ring buffer
>       ring-buffer: Add persistent ring buffer invalid-page inject test
>       ring-buffer: Show commit numbers in buffer_meta file
>       ring-buffer: Cleanup persistent ring buffer validation
>       ring-buffer: Cleanup buffer_data_page related code
> 
> 
>  arch/alpha/include/asm/Kbuild        |    1 
>  arch/arc/include/asm/Kbuild          |    1 
>  arch/arm/include/asm/Kbuild          |    1 
>  arch/arm64/include/asm/ring_buffer.h |   10 +
>  arch/csky/include/asm/Kbuild         |    1 
>  arch/hexagon/include/asm/Kbuild      |    1 
>  arch/loongarch/include/asm/Kbuild    |    1 
>  arch/m68k/include/asm/Kbuild         |    1 
>  arch/microblaze/include/asm/Kbuild   |    1 
>  arch/mips/include/asm/Kbuild         |    1 
>  arch/nios2/include/asm/Kbuild        |    1 
>  arch/openrisc/include/asm/Kbuild     |    1 
>  arch/parisc/include/asm/Kbuild       |    1 
>  arch/powerpc/include/asm/Kbuild      |    1 
>  arch/riscv/include/asm/Kbuild        |    1 
>  arch/s390/include/asm/Kbuild         |    1 
>  arch/sh/include/asm/Kbuild           |    1 
>  arch/sparc/include/asm/Kbuild        |    1 
>  arch/um/include/asm/Kbuild           |    1 
>  arch/x86/include/asm/Kbuild          |    1 
>  arch/xtensa/include/asm/Kbuild       |    1 
>  include/asm-generic/ring_buffer.h    |   13 +
>  include/linux/ring_buffer.h          |    1 
>  kernel/trace/Kconfig                 |   34 ++
>  kernel/trace/ring_buffer.c           |  472 +++++++++++++++++++++++-----------
>  kernel/trace/trace.c                 |    4 
>  26 files changed, 395 insertions(+), 159 deletions(-)
>  create mode 100644 arch/arm64/include/asm/ring_buffer.h
>  create mode 100644 include/asm-generic/ring_buffer.h
> 
> 
> base-commit: 6170922f137231b98fc568571befef63e1edff3f
> --
> Masami Hiramatsu (Google) <mhiramat@kernel.org>


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

