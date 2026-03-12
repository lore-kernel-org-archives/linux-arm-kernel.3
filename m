Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE7B106ACD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 17:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QQrPOJ4IgTYDp8ptNQZ8cyDSS7gullqrxNuyd+nPtUw=; b=BiarbmJc7ZeXiSDlp+IB66qLEd
	VYfKOhFDC50jTeLCCpwDib5HgJclC2PVeJcNuYkB/PQ3IUZ/rcAWBXbwE5qfJh1RevCFG71AbRCuh
	AMriTJUCuQ8yVQfKLIKxPNNtTN318VWxXYCFuLoavP9c5mxAaXYJk8oT02keCcu+yKDO9HeI/LNp2
	ay9d9/NMLSCGDcVmioxeDe3KFT205d29ETMAvSHsbt8gVHqJE1mTS1CCJ1yFgvub+W1D4yrRRSrRo
	SO3hWUW3vI87pfWX48Ii4A2X0K60hvqqEjLVL3Wo3E29b1m+qBPEq9GMe2qFpfZHynQnVJcPBMRoP
	CwfGEZ1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0jga-0000000EhEe-2y0o;
	Thu, 12 Mar 2026 17:19:00 +0000
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0jgX-0000000EhDw-3iNl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 17:18:59 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-1270fc2bdf2so974c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 10:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773335937; x=1773940737; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QQrPOJ4IgTYDp8ptNQZ8cyDSS7gullqrxNuyd+nPtUw=;
        b=eEAgDfR0ZmT2e/wxifwRPfihKpAXq44V9nzrBNHtPoT5FhncIutjSbWnJ66n1SDhVh
         CDbgn7jnwC5xL5ktDTJ+rp1JHCmeUSZdLGAvW9GB2wt+I0WHzgV8vfjtM1YbaUdCj0hk
         Aerm8jRNAo4nXBQRtzUZJSfjX+y6RoxNFlmD9z7n+nJpC7sm01WKx6P1vK87KH6N/C5t
         JOdOOXmCvU4EYl3LxcHdztIcOfphukY2rtsnOIyZk0TaNCOYcgrThBhrIZziBZn3BwI+
         YPoS0Yjo+0uoVNSYTbuKYR9E7BiSjXOlpW4MvT1vJui2TltNtlowyPVS5D+qOVTTmT1V
         ezYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773335937; x=1773940737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QQrPOJ4IgTYDp8ptNQZ8cyDSS7gullqrxNuyd+nPtUw=;
        b=WdQ0WHehB9U454Obu/6MjW3DQZoXdMPKNvbsX7wiGF4fzfF3qACXVKDAegGA/nxt0X
         5QVB3h7V974/ib75urOU7bELfW6Bkd/hNWI3UlLrH4OylMK9fojNxUtBkFZpV1rLrFoB
         cDJf1xCMRXAGnLqCK6USfHiVJgB1Ovp60/82s2CFa1fmLLVgY+ua2YFUamd+kbld1aG4
         C8OmTCzDsf+esuJ6vvLE8FPWxoPlxRW4qV0dT4AcPMxIjDsyRLjDtG0BZ8nVMOgqMPYV
         g44UxYaX3zAaMRPM0vRp5TicSKQIxUywy1L3Hs5swK0lrKzrbtp5aAwsiX8PKi8ZdYbg
         FFXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBFoBMMC9WpLMxJyWwxnBxlTHBgscx+Vp/90pZqs8DzLXna8QmEXs7rzTbEqCHWCTfTM6BLTDj9gLEOXy5tiim@lists.infradead.org
X-Gm-Message-State: AOJu0YyZysHBerVhYdUL40avtgEBnhk6Q1IqNGW9TY2qBuvOUUXiHzYR
	c5L9UqYtJdwXr0vRtVzLCasvxKkITboNE2/kc090DCvp3gjwS9Jf/s4OZqotMsS9HA==
X-Gm-Gg: ATEYQzyou+vNYYyyIeBW71RE++YpNXsiDzjKC+Xwfmn/3nzr6GnFlblE85HpkgQwj8Y
	mIOqGC8bA0N0bgbQCCbXu3VvCewXUJARNvUqs/5lpfB0cuWwueVnqAfZlabMGXVB0SsNuCukrDo
	vLSptQj0T1VdsC0e0t8bqkAz5+oSTC8J4FfHsCfoYVRTcfEhmI9q9QqQ9Bpdd61Qbj5xWvJ3YW5
	R5Ga2V0XmGEwcuFnjaXGfn2L+ZlZleNyH+vBu+HVgRHvlK6v9SnUPbB97vJin2Cc/o8ELK7xqnO
	/xl7jNv1KrnHrVdD0g6MPq90xl/mIGRAa84NbX8XvA3yhMF3uwwgZrLcfmrbk9EZvmEeVUfeWhf
	v3zJongblyK+VL7fvq8pw/So5I23APvnoOudbZKG07sdKw12Y/p5DCBFCHl5g0WXAg1ov88cNEq
	PG17ZyaugDvWzKoN2pF7XniACFs3zui5uFYTkDbRfWE8M+hA/3cbbstco5kQwf8w==
X-Received: by 2002:a05:701b:4294:20b0:11a:4c75:a45b with SMTP id a92af1059eb24-128f43a0537mr6681c88.10.1773335936173;
        Thu, 12 Mar 2026 10:18:56 -0700 (PDT)
Received: from google.com (154.52.125.34.bc.googleusercontent.com. [34.125.52.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be8aa4ff66sm7182541eec.19.2026.03.12.10.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 10:18:55 -0700 (PDT)
Date: Thu, 12 Mar 2026 17:18:51 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ard Biesheuvel <ardb@kernel.org>,
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
Message-ID: <abL1e8o3Geqj2aec@google.com>
References: <20260309223156.GA73501@google.com>
 <20260311225822.1565895-1-cmllamas@google.com>
 <20260311231406.GZ606826@noisy.programming.kicks-ass.net>
 <abIFwSF1RqhC96C2@google.com>
 <742d77a8-3c53-4814-9dd6-81e8317cd829@app.fastmail.com>
 <20260312080740.GC606826@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312080740.GC606826@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_101857_926740_0BF65B6A 
X-CRM114-Status: GOOD (  27.15  )
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

On Thu, Mar 12, 2026 at 09:07:40AM +0100, Peter Zijlstra wrote:
> On Thu, Mar 12, 2026 at 08:40:11AM +0100, Ard Biesheuvel wrote:
> > So far, we have managed to avoid the blessings of objtool on arm64,
> > and the complexity associated with the inline patching is not really
> > justified, given that on arm64, there is not really a need to avoid
> > indirect calls (and as Peter says, we might end up with them anyway)
> > 
> > A while ago, I had a stab at implementing the out-of-line variety [0],
> > but nobody cared enough to even respond. It is rather concise, and
> > localised to arm64, so it is something we might consider for
> > CONFIG_CFI builds. It is essentially the same sequence that arm64 uses
> > for trampolines between modules and the kernel if they are out of
> > direct branching range, with some .rodata patching to change the
> > target. (arm64 basically only permits code patching without stopping
> > the machine when it involves patching branch opcodes into NOPS or vice
> > versa).

Great! I'll go read your implementation then.

> > Doing so for only CONFIG_CFI makes sense because it removes the CFI
> > overhead for all static calls, although it adds back some overhead for
> > the trampoline. But there is currently no need to do this
> > unconditionally.
> 
> Right, so your v3 is very simple and straight forward, and should work
> as an end run around the CFI issue, by effectively doing that indirect
> tail call in the trampoline outside of the compiler generated software
> cfi things.
> 
> And I think I like your thing better because it handles all possible
> cases, not just the ret0 oddity and isn't in fact much larger.

SGTM, I'll switch over to testing Ard's patch.

Thanks,
Carlos Llamas

