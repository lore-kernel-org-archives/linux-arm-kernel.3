Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1B2C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 22:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FJhYQvKwmvTaYugApDDBG746sf34tZee/3nwBqcoPts=; b=ejlLRSEcIkHA+AjaQinEbY+gH9
	cx2bbA5ZpYn+uxw/bU9XuLJQ+yuEC1/icVKmlrE2FEsoy6Mg3l3c14/emD7rwMslKNcErjYX9jSTr
	5donk3tvzGqgQ9tbMLMbJdxxDNq2ljgD48G2sq9QcCZgrZ80e9Gt4NR3hW+DokOpWSo8FrX1su9H4
	camzIDzC/fzGRF1r6UmmsZbqNKxegPTAnTUqr2i+84ikasxaBhqHP09wVgCGkrEILmb5u4EmwqiE9
	3UnVqJ5hlqBMPznixjzxkP7ySCXqMmJ1s8VP6qMtju1aGNi4opzM0oF3MYFuFXKyPDHM3lgxjTGhu
	LvX0F5jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmgqb-0000000FLt4-45W1;
	Mon, 24 Feb 2025 22:22:45 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmgp9-0000000FLhK-0MvA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 22:21:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 77200611B2;
	Mon, 24 Feb 2025 22:21:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 701C6C4CED6;
	Mon, 24 Feb 2025 22:21:11 +0000 (UTC)
Date: Mon, 24 Feb 2025 17:21:47 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, bpf <bpf@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org, "Masami
 Hiramatsu" <mhiramat@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 "Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Peter Zijlstra" <peterz@infradead.org>,
 "Linus Torvalds" <torvalds@linux-foundation.org>, "Masahiro Yamada"
 <masahiroy@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>, "Nicolas
 Schier" <nicolas@fjasle.eu>, "Zheng Yejian" <zhengyejian1@huawei.com>,
 "Martin Kelly" <martin.kelly@crowdstrike.com>, "Christophe Leroy"
 <christophe.leroy@csgroup.eu>, "Josh Poimboeuf" <jpoimboe@redhat.com>,
 "Heiko Carstens" <hca@linux.ibm.com>, "Catalin Marinas"
 <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Vasily Gorbik"
 <gor@linux.ibm.com>, "Alexander Gordeev" <agordeev@linux.ibm.com>
Subject: Re: [PATCH v5 2/6] scripts/sorttable: Have mcount rela sort use
 direct values
Message-ID: <20250224172147.1de3fda5@gandalf.local.home>
In-Reply-To: <893cd8f1-8585-4d25-bf0f-4197bf872465@app.fastmail.com>
References: <20250218195918.255228630@goodmis.org>
	<20250218200022.538888594@goodmis.org>
	<893cd8f1-8585-4d25-bf0f-4197bf872465@app.fastmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 24 Feb 2025 22:10:53 +0100
"Arnd Bergmann" <arnd@arndb.de> wrote:

> This is what I get on arm64 randconfig builds using clang after your
> patch:
> 
>   failed to sort mcount 'Expected 24260 mcount elements but found 0
>   ': vmlinux
>   Failed to sort kernel tables
> 
> I have not tried to understand what your patch does. See the attached
> defconfig for a reproducer.

Hmm, I haven't tried building this with clang.

Can you compile without that commit, run and give me the output from these
two programs:

 ./dump_elf_sym vmlinux __start_mcount_loc __stop_mcount_loc
 ./dump_elf_rela vmlinux .rela.dyn

If the second one fails, remove the '.rela.dyn' and see what that shows.

 https://rostedt.org/code/dump_elf_sym.c
 https://rostedt.org/code/dump_elf_rela.c


Thanks,

-- Steve

