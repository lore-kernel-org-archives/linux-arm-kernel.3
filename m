Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EB8103E2F1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 23:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eVXn+Bxh0tcCavT748ERcPpFO7MJkNREEPJ3NP1c5Qg=; b=rshtRirqCIo+a+gyPZF5Lm/9wW
	UQgrwubR0oVcA6qPskcSyW1NFZS6bQ7cpIFCfpB9feXYWW072MFdsRiaoy9nrf0yNO8/BYI27GA7X
	/3sEZjy45Rvb0UDEpuysUiH+NtgugniQ/vvkrLhTRQUi9nKxl6S5wELVOksQzf/WT4gfe+J9uTfhG
	sSHUCxh6oPGPSlUewGVxtel8UBGENwfICUGWJPs9ZTbwdf2R3ifZ9AxMPC/TRjpccjdyJsypdcWJ5
	dDudp5Nttfq5iBGfwCye47ZPWhf5CWO8DD56kNfnZSpYJ5qUew9aDUWxv5eQJmdMg56P+4w8OU+EG
	juUt5wLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Skw-0000000CmBr-3GF2;
	Wed, 11 Mar 2026 23:14:22 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Sku-0000000CmAe-3HEq
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Mar 2026 23:14:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eVXn+Bxh0tcCavT748ERcPpFO7MJkNREEPJ3NP1c5Qg=; b=UfpF0uo0FDgd7R0MDjKkcRKS7U
	cdQhSBvIrBkvZ7epa1i/Av2klUvrcaXeRJ10syoBuITEGN8rgFnxXrwtKA8y4f2FsOUZH2/KldYls
	Ddwye10mIBnhxYaC+US4Mc5xlsA7aCPM8flPYoxAvfVlgbns7R0wGM9U//5bjPN3yKA6H3HqpIUeA
	G9olTQ1p9+h5su/n5Qc9gMiGqYmMSmuf2HCJTyhye0HX0xwlIi+LddV+oivZa8Ti8jy9rOnOemlsJ
	5J7Q1DgOhij7XsHdLEmSGzFFKGLCl4uF2LXIDiW3kZq/chpZlUtM6BwVOMTnHQT2zRdb2abYL+4Uq
	uxoL5nxw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Skh-0000000ARqF-2AyW;
	Wed, 11 Mar 2026 23:14:07 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id F0C0C301150; Thu, 12 Mar 2026 00:14:06 +0100 (CET)
Date: Thu, 12 Mar 2026 00:14:06 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Carlos Llamas <cmllamas@google.com>
Cc: Sami Tolvanen <samitolvanen@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>, Alice Ryhl <aliceryhl@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@redhat.com>,
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
	"Borislav Petkov (AMD)" <bp@alien8.de>,
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
Message-ID: <20260311231406.GZ606826@noisy.programming.kicks-ass.net>
References: <20260309223156.GA73501@google.com>
 <20260311225822.1565895-1-cmllamas@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311225822.1565895-1-cmllamas@google.com>
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

On Wed, Mar 11, 2026 at 10:57:40PM +0000, Carlos Llamas wrote:
> Architectures with !HAVE_STATIC_CALL (such as arm64) rely on the generic
> static_call implementation via indirect calls. In particular, users of
> DEFINE_STATIC_CALL_RET0, default to the generic __static_call_return0
> stub to optimize the unset path.
> 
> However, __static_call_return0 has a fixed signature of "long (*)(void)"
> which may not match the expected prototype at callsites. This triggers
> CFI failures when CONFIG_CFI is enabled. A trivial linux-perf command
> does it:

*sigh*...

And ARM64 can't really do the inline thing because its immediate range
is too small and it all turns into a mess constructing the address in a
register and doing an indirect call anyway, right?


I'll stare at it in more detail tomorrow.

