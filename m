Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A00F99344
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 08:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xipKoK409DTGMqb6TILW5LNXnpcpcueYpEZGn8MBuAU=; b=c4KXmVUCpUw20HPkFZrDUUiHV+
	1yw8Jw4f82NRYlzRfL2rEVbOcr2KC/U9OKbpudakmMaJ9o1/Lcq57Jfw4hwM482HbHiSY0fKbDYWb
	65az1QAO9CSs6hRiNOB4Q8li+5yXNbKj2CXqrn/3dcwfmZTiR+cCvtoCCumtHOToIzyIVTHsMt/rD
	2/QI7S8zZS3CROcK4eVTHakAdZPd0Rt5yJJMJfaq5VnzOnppvkEoyzcN0X7XOdGUhW3ANaukqo8lw
	zby+o7TOwsuHuPBvv+P5Xby2j+7ooefTHzNBA5RxJvO5OSmN+d8gPuayw1byUi89QUrIzIMEd5Gfg
	w3zeniVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFpNv-0000000BExA-47PR;
	Thu, 23 Apr 2026 08:26:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFpNs-0000000BEvs-2r1f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 08:26:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1512740DFE;
	Thu, 23 Apr 2026 08:26:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD419C2BCAF;
	Thu, 23 Apr 2026 08:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776932763;
	bh=IjL8twB+4d9z4gO+zDoSjmB2/hJ0XW6r2E+wUwSomso=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OTYKDCTzOUzTH4mt3kNkQ8qy0pysslUAGpHK6g0dZ6Qscu1saFiktKCF6yFfNUEwh
	 TxPdidgm8eInOeaNdayfmqU0RevjYbNYROwkoxVFNsYs8Blp54fU0Z58ydpUzKM9YF
	 T/Dx0GXkRLJr4Tj+FdSQljoKYAwrVWIjMx3A+RATNsLweYNfKW68+DXn98PCs4usow
	 eOBlcLgb8ttn7i60oG+d/HSzt2lbVDqi75OrlEjC22DkvWZA1IIb8uVfbdDO8Yi30f
	 VwNbZctEQuC0XOZlhHiGNq8p09FQ1S9OmWzjsHvizsTj6C59yRdplG7X26eu0bvrJQ
	 29SUM8xi6h+9A==
Date: Thu, 23 Apr 2026 17:26:01 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v17 0/5] ring-buffer: Making persistent ring buffers
 robust
Message-Id: <20260423172601.735884be696225c050566060@kernel.org>
In-Reply-To: <177687458572.932171.10907864814735342737.stgit@mhiramat.tok.corp.google.com>
References: <177687458572.932171.10907864814735342737.stgit@mhiramat.tok.corp.google.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_012605_012362_42FBB508 
X-CRM114-Status: GOOD (  19.86  )
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

Sashiko[1] pointed out other problems. Let me review it.
I also found one mistake (not by this series), so I will fix it too.

[1] https://sashiko.dev/#/patchset/177687458572.932171.10907864814735342737.stgit%40mhiramat.tok.corp.google.com

Thanks,

On Thu, 23 Apr 2026 01:16:26 +0900
"Masami Hiramatsu (Google)" <mhiramat@kernel.org> wrote:

> Hi,
> 
> Here is the 17th version of improvement patches for making persistent
> ring buffers robust to failures.
> The previous version is here:
> 
> https://lore.kernel.org/all/177547105523.259641.14385891517704197263.stgit@mhiramat.tok.corp.google.com/
> 
> This version fixes some review comments from Sashiko[1], which
> includes:
> [2/5] Fix to use rb_page_size() of rewound pages for entry_bytes.
> [3/5] - Fix to verify head_page at first before using its timestamp.
>       - Reset timestamp if the page is invalid.
> [4/5] - In rb_test_inject_invalid_pages(), changed entry_bytes and
>        idx to unsigned long
>       - Added NULL checks for cpu_buffer and meta.
>       - In allocate_trace_buffer(), added a NULL check for tr->name
>        before comparing it with strcmp.
> [5/5] Added NULL check for dpage in rbm_show in ring_buffer.c.
> 
> [1] https://sashiko.dev/#/patchset/177552432201.853249.5125045538812833325.stgit%40mhiramat.tok.corp.google.com
> 
> Thank you,
> 
> Masami Hiramatsu (Google) (5):
>       ring-buffer: Flush and stop persistent ring buffer on panic
>       ring-buffer: Skip invalid sub-buffers when validating persistent ring buffer
>       ring-buffer: Skip invalid sub-buffers when rewinding persistent ring buffer
>       ring-buffer: Add persistent ring buffer invalid-page inject test
>       ring-buffer: Show commit numbers in buffer_meta file
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
>  include/asm-generic/ring_buffer.h    |   13 ++
>  include/linux/ring_buffer.h          |    1 
>  kernel/trace/Kconfig                 |   34 ++++
>  kernel/trace/ring_buffer.c           |  275 ++++++++++++++++++++++++++--------
>  kernel/trace/trace.c                 |    4 
>  26 files changed, 290 insertions(+), 67 deletions(-)
>  create mode 100644 arch/arm64/include/asm/ring_buffer.h
>  create mode 100644 include/asm-generic/ring_buffer.h
> 
> 
> base-commit: 6170922f137231b98fc568571befef63e1edff3f
> --
> Masami Hiramatsu (Google) <mhiramat@kernel.org>


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

