Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB901C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 16:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VnK5j+Jo1K/WzSp4PdO4lujX1U9fmP2f6cJOHKbJAR0=; b=poPaJhlxmcg6WpXgeFig9j1Sst
	3QbBAS9mioURl9ELF+g7oRuGmKiU4tB6FuRjrjN8qekwoDx6FnWyoNQjvUNF5V0ATsZQph/Y28WU7
	quw+wB8j4UXUFpYnOtaVNfA00aixSGN5PlV2EUZMSNHyH5vRgjeF6UqNNm3A2Ozf67QHU5XyxjKQB
	FD8ev2Jmp5tYzQ9zSGfPM1ofrI2QuS6vezP2Xa97pu1gtHKHb16Yyh6VrDR7uyn8wtws6bOw21M19
	h0NmJFJwlKq8YsIui4bOiw6VzYGiu2mrrdkovqBwXlMsWPKCGGw3Vs8wrkul3k8tFF4koZofzrYRf
	qSlZq+uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH2yB-00000009il1-4Azo;
	Mon, 19 May 2025 16:04:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH2AX-00000009ZCE-1Zxk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 15:12:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AEDF3A4DE97;
	Mon, 19 May 2025 15:12:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBA3BC4CEE4;
	Mon, 19 May 2025 15:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747667564;
	bh=F2x2lSFiD7EPnjwMTLKRMzcQO67IFR8BeGPkqvkIEFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PoJIt/orUOH+KTd5pUCa8DjVEdBtRwJiAbeEYP+SYuKvB5QUwqE09HTGMS+D5PRak
	 ZodHEfGzeibKjdRlL4M3L5cva2CrFCnJMrfLa/tCLeLAdTQXQVShhGFZpi6Myzpj9F
	 CzXoQgoyRgeHZAENLp3zF96fT95/B7S8JZIsSKO5HriWkO3Aqz/wB8Z89uDUkKi/aD
	 HiBiatMPnDleE/w5FuRCn6fHqomPVt1dJl5RBeQFRRdFll5ojsp4yIAhXHrcXHI09z
	 D8dS91qLMmceVX07SyxP6uw+5cDTIYk0U2n+TEU3rs8KPhgkZotMmbL4duuJVA6vKb
	 XfMtVJ394+Iug==
Date: Mon, 19 May 2025 16:12:39 +0100
From: Will Deacon <will@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Nam Cao <namcao@linutronix.de>, Gabriele Monaco <gmonaco@redhat.com>,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
	john.ogness@linutronix.de,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 17/22] arm64: mm: Add page fault trace points
Message-ID: <20250519151238.GB17177@willie-the-truck>
References: <cover.1745999587.git.namcao@linutronix.de>
 <554038c996662282df8a9d0482ef06f8d44fccc5.1745999587.git.namcao@linutronix.de>
 <20250516140449.GB13612@willie-the-truck>
 <3E29A42D-8A6A-4342-8C60-2BEF1EDCD640@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3E29A42D-8A6A-4342-8C60-2BEF1EDCD640@goodmis.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_081245_490986_A257456D 
X-CRM114-Status: GOOD (  16.73  )
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

On Fri, May 16, 2025 at 10:42:48AM -0400, Steven Rostedt wrote:
> 
> 
> On May 16, 2025 10:04:50 AM EDT, Will Deacon <will@kernel.org> wrote:
> >
> >> +	if (user_mode(regs))
> >> +		trace_page_fault_user(addr, regs, esr);
> >> +	else
> >> +		trace_page_fault_kernel(addr, regs, esr);
> >
> >Why is this after kprobe_page_fault()?
> >
> >It's also a shame that the RV monitor can't hook into perf, as we
> >already have a sw event for page faults that you could use instead of
> >adding something new.
> >
> 
> Perf events work for perf only. My question is why isn't this a tracepoint
> that perf could hook into?

Well, the perf event came first in this case, so we're stuck with it :/

I was hoping we could settle for a generic helper that could emit both
the trace event and the perf event (so that the ordering of the two is
portable across architectures) but, judging by Nam's reply, the trace
event is needed before kprobes gets a look in.

Will

