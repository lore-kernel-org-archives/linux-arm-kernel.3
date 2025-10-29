Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F14CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 08:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pqGkVirbGxyprmJRZIsXhSNtITlLbK1Ilrjqz1YXXa8=; b=PviTV2rHDmSNn5E3qiE3iK+xS3
	dCM/lN3ziFYRFHo7lBX6Dl5peaWgrvS89xQqDi/hPD3pDmnNZhJJCGhnTHFALyo9o+fBGUm5VjwIV
	2Xk8dRlgtZoJz0EFlXZI4hNwNRjvBbUGBV8o/yCgok9G+bRfE5cvjxnDpRP1LS+sQ5ENZEY/uTvPQ
	j+3bmMp/NyCxnN1wUA1RRDe4Bt52ZR2UdiNNdZHkxIcp381ZtzULBDimPdLOL5w42EsXjFdkgfyRW
	esZ9Q0b9ivv8QiczveduCMG8QLPxWLpLm5oeO9LXfbfPujHlcSlVr9/bfvzUbHPtoWMSW6mEIUdb8
	+8COxDGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE1Pj-00000000HL8-1IIx;
	Wed, 29 Oct 2025 08:20:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE1Pg-00000000HKh-1PZc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 08:20:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9153D4927A;
	Wed, 29 Oct 2025 08:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 629B0C4CEF7;
	Wed, 29 Oct 2025 08:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761726011;
	bh=2KtQfpwXxBgRt5H6xF9pV7eRjqbrJ70Ux995ibkvkWI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QzzWL/h0ApZ2tjPgLdIF2nyFUg5JHfMCUSLlS6lKzOcpR26PScHzwympwMCN0jO6x
	 EwuMCtMNmiP0X1hjllNwTmVPgsM6kSDrIQcRTbkx9EsSN45Pscam7mMNXA94ykKBsd
	 D4lGQYtee13ZjrBFr42AWF3CngaOnvEObnKLIav8/AUImxRYO8ov+XYpzYxXd74dO+
	 Sg7nsxp2Uv++lx+nVgsb8SHyz641ddSSFPe4jRP608YnhnBRrMPVHcsGfRvFq0fJRN
	 +J0jfXg2eNnqHW9g3B3CK/3Lh88dJrs7e2K6XvbQU0UFbtAopv2eBBDAfg/j7U1XMl
	 J7JqyDxHnNjYg==
Date: Wed, 29 Oct 2025 17:20:04 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Mark Brown <broonie@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar
 <mingo@kernel.org>, x86@kernel.org, Jinchao Wang
 <wangjinchao600@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Ian Rogers <irogers@google.com>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v5 6/8] selftests: tracing: Add a basic testcase for
 wprobe
Message-Id: <20251029172004.a0aca144735f20a6a59d2aa6@kernel.org>
In-Reply-To: <20251029114317.167b7d908533385c1c9e6782@kernel.org>
References: <175859019940.374439.7398451124225791618.stgit@devnote2>
	<175859026716.374439.14852239332989324292.stgit@devnote2>
	<aPvwGhMBJqMKcC9D@finisterre.sirena.org.uk>
	<20251027224347.4c887cc956df63602f377550@kernel.org>
	<20251028084222.a3c1ae97d125d9bd88fc565b@kernel.org>
	<20251028105549.ae94e8eeb42f4efc183d2807@kernel.org>
	<20251029004219.dc9cda0eb56ae46c55855844@kernel.org>
	<20251029114317.167b7d908533385c1c9e6782@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_012012_406569_075ED15D 
X-CRM114-Status: GOOD (  14.04  )
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

On Wed, 29 Oct 2025 11:43:17 +0900
Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:

> > Hmm, it seems that jiffies related things are updated frequently
> > and it may cause interrupt storm or infinit recursive call.
> 
> I added another trace_printk() in el1_watchpt(). It seems el1_watchpt()
> takes too long and there is no time to do any other things.
> (Note the interval shown below is only within the el1_watchpt function,
>  and in reality various processes (save/restore registers etc) for
>  exception handling will be inserted before and after.)

Forget about this. I found the root cause. The x86 watchpoint exception
happens after the instruction is executed, the arm64 happens before.

Thus what we need is to emulate or do single step the hooked instruction
and restart from the next instruction from the watchpoint exception on
arm64. I thought hw_breakpoint does that, but doesn't. Should we do this
in do_watchpoint() or in user_handler?

Thank you,

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

