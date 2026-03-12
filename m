Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6ED7FED2E4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 08:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+AGDKIE6hXp/8VOqIEg9/kQz3a6B7IfLZxRpsrZlLc=; b=GoxvGFQyjli5piehPYvl4nSjU1
	xRE2uIQAQkJAU08+GVcn1Q/RnIQ4UyOuY1npfBrvDuYW0j9GldVqyuz14Tg8zR9sZUiOlz99NHvNx
	+juOVLhaOJn3y16p+Z5LRReC4enVM5p3gLtALqJzQAsQy+3iV8ywWu7OR0DZE7+RYCb30HX+V7W5I
	Ngexax/jz7cMorD0pYp4ytZK8t1GW+NsQSbqlxVMiE+hab2pD9UBg69cigIUL+PLLD87R0vSK8+33
	VQZ455JvWWpoy/NQU6C+CnHVkbiXvKy61ebemGmnX65lWlN/dQc810MVOmjqm8aRPaYhSjTvZLjbe
	vugMaF5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0b5D-0000000DbTM-2I0i;
	Thu, 12 Mar 2026 08:07:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0b5B-0000000DbT1-37MM
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Mar 2026 08:07:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=m+AGDKIE6hXp/8VOqIEg9/kQz3a6B7IfLZxRpsrZlLc=; b=teNq9ellKTdTiEw8CgadARx2XH
	LPBtCpFWtUVYzLAmUgMCs4SmnqQc7YNIefAvYFRu5CGx19swkhzNA/48Aivr3cwoA6P1sc8VE+znz
	K5GtiT5Gonw50+RiI7T69ZiWLfl4Tf8G0TTk+RNvgvwos2uZ+CbTxdrUFTUgHyjr3yl/wibf+xeWt
	qQTS4YUO5fxyWD0m9NYuLrYrAjmI/LNa4kupmAE4+yJmwX01LIMU5d4TijOf2heQkz5M6uQ6tpBRt
	FhBJceHidowKp3TUDdo4O2+bAeej0Xx6kiKGdcoz0dhNc5/3xMe30Fa4GlWxfIwzFbT8XyozdIOju
	TRYUjfHw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0b52-0000000B1Mc-2b9j;
	Thu, 12 Mar 2026 08:07:40 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 288A9301150; Thu, 12 Mar 2026 09:07:40 +0100 (CET)
Date: Thu, 12 Mar 2026 09:07:40 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Carlos Llamas <cmllamas@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>, Alice Ryhl <aliceryhl@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Kees Cook <kees@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Jens Remus <jremus@linux.ibm.com>, Juergen Gross <jgross@suse.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	David Kaplan <david.kaplan@amd.com>,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	James Morse <james.morse@arm.com>, Thomas Huth <thuth@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org,
	Will McVicker <willmcvicker@google.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>,
	"open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>
Subject: Re: [PATCH] static_call: use CFI-compliant return0 stubs
Message-ID: <20260312080740.GC606826@noisy.programming.kicks-ass.net>
References: <20260309223156.GA73501@google.com>
 <20260311225822.1565895-1-cmllamas@google.com>
 <20260311231406.GZ606826@noisy.programming.kicks-ass.net>
 <abIFwSF1RqhC96C2@google.com>
 <742d77a8-3c53-4814-9dd6-81e8317cd829@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <742d77a8-3c53-4814-9dd6-81e8317cd829@app.fastmail.com>
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

On Thu, Mar 12, 2026 at 08:40:11AM +0100, Ard Biesheuvel wrote:
> So far, we have managed to avoid the blessings of objtool on arm64,
> and the complexity associated with the inline patching is not really
> justified, given that on arm64, there is not really a need to avoid
> indirect calls (and as Peter says, we might end up with them anyway)
> 
> A while ago, I had a stab at implementing the out-of-line variety [0],
> but nobody cared enough to even respond. It is rather concise, and
> localised to arm64, so it is something we might consider for
> CONFIG_CFI builds. It is essentially the same sequence that arm64 uses
> for trampolines between modules and the kernel if they are out of
> direct branching range, with some .rodata patching to change the
> target. (arm64 basically only permits code patching without stopping
> the machine when it involves patching branch opcodes into NOPS or vice
> versa).
> 
> Doing so for only CONFIG_CFI makes sense because it removes the CFI
> overhead for all static calls, although it adds back some overhead for
> the trampoline. But there is currently no need to do this
> unconditionally.

Right, so your v3 is very simple and straight forward, and should work
as an end run around the CFI issue, by effectively doing that indirect
tail call in the trampoline outside of the compiler generated software
cfi things.

And I think I like your thing better because it handles all possible
cases, not just the ret0 oddity and isn't in fact much larger.

