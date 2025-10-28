Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086AFCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 16:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=isLSBLoTw3QiOQIgpYrVdL6cIlwf0KcsUonLPy1B8DQ=; b=orGo//s1CkvM2ciHJhASkA3K4M
	0Kswlu3/cRKQ2bBQqZy798nQl1FBxOuLnRlLpnOl2q1qpS2HJa89bHh/AdVwFAmEVafMQB7CxZTkg
	/R5xgvMaoYNJMxlRqn5k/Jt+zNopglFJpALSSPV1eqExvSCOmm+ofTLBpFpXVGwfGUSDXExfeC2IF
	2JEiFHVyKUa+k5egOdDyv9GgvSmlrZ3tmTYRhegoslj6HcNX8KstP2M6cFo+Egg3RGl+crwDUQv0y
	aTjNHE8ZGdXJojtV4jeiBjASN8lV9X92W90deoRRmipS1mba8VjS8pspzo/6AqRa9kvMVIflRHB0F
	eLhlyd3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDmVV-0000000GJpN-0NEe;
	Tue, 28 Oct 2025 16:25:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDmVS-0000000GJoW-3NK2;
	Tue, 28 Oct 2025 16:25:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 74A0945A9D;
	Tue, 28 Oct 2025 16:25:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDDAFC4CEE7;
	Tue, 28 Oct 2025 16:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761668710;
	bh=g+HYr74fOIJBF8//IeX1u6hGkpfR/MyO8jpC8AyplAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gT6/ILOPpDox4LIC0P6mrQkn27cKKS8sqA59JphgtIkj6muwgaA3Fo1qkj+3hwr0x
	 Lec8ctwO62yUgf5b+f8NOys9+imyW63Awoi+zjDc6vUMX7ItNvFhAbXVixsle20+AM
	 DCYjg9wWsW+BmN8WmVOnXKeoK7KRXl7UfDuM55FDXrP20wubQGruqEIuyl7uN1vem3
	 z1RjIXGmQ+jItDnSIQZ94NMGu9r4D1Cc2Yx7w4rRGmNHf87sUEhnNQJTnZxj1eJJBt
	 Bp2v2DXxUkTbIAPy+fj+FmsmIlW78U0n3bUpKvn+IC4BArPQhxPUJb7TwK5EWFOiU5
	 OFSj9z0ZySqFA==
Date: Tue, 28 Oct 2025 17:25:07 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Valentin Schneider <vschneid@redhat.com>, Phil Auld <pauld@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, rcu@vger.kernel.org,
	x86@kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mel Gorman <mgorman@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Han Shen <shenhan@google.com>, Rik van Riel <riel@surriel.com>,
	Jann Horn <jannh@google.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Oleg Nesterov <oleg@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Clark Williams <williams@redhat.com>,
	Yair Podemsky <ypodemsk@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Daniel Wagner <dwagner@suse.de>, Petr Tesarik <ptesarik@suse.com>
Subject: Re: [PATCH v6 00/29] context_tracking,x86: Defer some IPIs until a
 user->kernel transition
Message-ID: <aQDuY3rgOK-L8D04@localhost.localdomain>
References: <20251010153839.151763-1-vschneid@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251010153839.151763-1-vschneid@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_092510_883674_0F8F51EB 
X-CRM114-Status: GOOD (  17.01  )
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

+Cc Phil Auld

Le Fri, Oct 10, 2025 at 05:38:10PM +0200, Valentin Schneider a écrit :
> Patches
> =======
> 
> o Patches 1-2 are standalone objtool cleanups.

Would be nice to get these merged.

> o Patches 3-4 add an RCU testing feature.

I'm taking this one.

> 
> o Patches 5-6 add infrastructure for annotating static keys and static calls
>   that may be used in noinstr code (courtesy of Josh).
> o Patches 7-20 use said annotations on relevant keys / calls.
> o Patch 21 enforces proper usage of said annotations (courtesy of Josh).
> 
> o Patch 22 deals with detecting NOINSTR text in modules

Not sure how to route those. If we wait for each individual subsystem,
this may take a while.

> o Patches 23-24 deal with kernel text sync IPIs

I would be fine taking those (the concerns I had are just details)
but they depend on all the annotations. Alternatively I can take the whole
thing but then we'll need some acks.
 
> o Patches 25-29 deal with kernel range TLB flush IPIs

I'll leave these more time for now ;o)
And if they ever go somewhere, it should be through x86 tree.

Also, here is another candidate usecase for this deferral thing.
I remember Phil Auld complaining that stop_machine() on CPU offlining was
a big problem for nohz_full. Especially while we are working on
a cpuset interface to toggle nohz_full but this will require the CPUs
to be offline.

So my point is that when a CPU goes offline, stop_machine() puts all
CPUs into a loop with IRQs disabled. CPUs in userspace could possibly
escape that since they don't touch the kernel anyway. But as soon as
they enter the kernel, they should either acquire the final state of
stop_machine if completed or join the global loop if in the middle.

Thanks.

-- 
Frederic Weisbecker
SUSE Labs

