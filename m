Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A389CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 14:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sVrVIr57b6fMWh3pA4LxJ9hZO8cVb5LaT8DX+ge7ENU=; b=rzkTfqiX6Ry1Lkd07lY4POOUPj
	tPVQS/Hp0WFyaRNjDF66rcMnepkSVtqN1arw5JnIg5fZ4xDWc96Qiwfm8P7j5cDQwrUKMGXaOEeYh
	8uvuj3ktYMCAhQxdu6ffyl9hO+azStuECke2lgbTdRgGXKNXELxihTyLVFUDTCT3ts6XgcrpRpEl7
	yKMquQ2/ttah+LLPl0eJa8785s9Av5UymMS7n6qeODUdPMKlJjX+9jdwwGwFf/z00c/DsC4KFpzTs
	CpOUQrqYc53ptNDeJ+gmwB5fTP3Dkolc27MmUxF+TCifWCNrATRdpBEFfOkRuwhG0t/pwBSi8nykL
	os9hE0SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7Xu-00000001fZ9-15zD;
	Wed, 29 Oct 2025 14:53:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7Xr-00000001fXX-1H9F;
	Wed, 29 Oct 2025 14:53:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 12E3741728;
	Wed, 29 Oct 2025 14:53:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39C64C19423;
	Wed, 29 Oct 2025 14:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761749581;
	bh=DycaBBkGuqgEIP5677gSgx8QDJGofxkMNPMcP3M730o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NbRDLF5bQ+u4J4hiySQAVpBuc86Gn1rrbceqZEKYNWpKF9yoAhVdLiG/Nu9SRzin5
	 ddwOS2DAvBL0w6K59co5lqXWGrpHXdyA3+e94n4XKlatrRRprHxYDEy/DFtpqcJYjz
	 jGBmveuocLom0Tr99M8s/YfJisMETw3u7WfPV8VPmObP73KGTMrcXJF2ZKhuh5kL4K
	 FNZiQ5jjE+Qy5WcINDDA3sOHLfgNQyF9ljeM8CBlvKWvkNPOMLvSsJkY31UBeqPnRr
	 epdow2onJrow0Coha3Tk5/8X8R1mpOEWDHWRuB0t8h2sykd3/evOgK+UEPDUs1Kui5
	 FM7cF5Ys9ZgFA==
Date: Wed, 29 Oct 2025 15:52:58 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, rcu@vger.kernel.org,
	x86@kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenzju@redhat.com>,
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
Subject: Re: [PATCH v6 23/29] context-tracking: Introduce work deferral
 infrastructure
Message-ID: <aQIqSq2FWyHg0Y3p@localhost.localdomain>
References: <20251010153839.151763-1-vschneid@redhat.com>
 <20251010153839.151763-24-vschneid@redhat.com>
 <aQDMfu0tzecFzoGr@localhost.localdomain>
 <xhsmh5xbyqas1.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <xhsmh5xbyqas1.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_075303_381542_B1B3DD11 
X-CRM114-Status: GOOD (  26.87  )
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

Le Wed, Oct 29, 2025 at 11:09:50AM +0100, Valentin Schneider a écrit :
> On 28/10/25 15:00, Frederic Weisbecker wrote:
> > Le Fri, Oct 10, 2025 at 05:38:33PM +0200, Valentin Schneider a écrit :
> >> +	old = atomic_read(&ct->state);
> >> +
> >> +	/*
> >> +	 * The work bit must only be set if the target CPU is not executing
> >> +	 * in kernelspace.
> >> +	 * CT_RCU_WATCHING is used as a proxy for that - if the bit is set, we
> >> +	 * know for sure the CPU is executing in the kernel whether that be in
> >> +	 * NMI, IRQ or process context.
> >> +	 * Set CT_RCU_WATCHING here and let the cmpxchg do the check for us;
> >> +	 * the state could change between the atomic_read() and the cmpxchg().
> >> +	 */
> >> +	old |= CT_RCU_WATCHING;
> >
> > Most of the time, the task should be either idle or in userspace. I'm still not
> > sure why you start with a bet that the CPU is in the kernel with RCU watching.
> >
> 
> Right I think I got that the wrong way around when I switched to using
> CT_RCU_WATCHING vs CT_STATE_KERNEL. That wants to be
> 
>   old &= ~CT_RCU_WATCHING;
> 
> i.e. bet the CPU is NOHZ-idle, if it's not the cmpxchg fails and we don't
> store the work bit.

Right.

> 
> >> +	/*
> >> +	 * Try setting the work until either
> >> +	 * - the target CPU has entered kernelspace
> >> +	 * - the work has been set
> >> +	 */
> >> +	do {
> >> +		ret = atomic_try_cmpxchg(&ct->state, &old, old | (work << CT_WORK_START));
> >> +	} while (!ret && !(old & CT_RCU_WATCHING));
> >
> > So this applies blindly to idle as well, right? It should work but note that
> > idle entry code before RCU watches is also fragile.
> >
> 
> Yeah I remember losing some hair trying to grok the idle entry situation;
> we could keep this purely NOHZ_FULL and have the deferral condition be:
> 
>   (ct->state & CT_STATE_USER) && !(ct->state & CT_RCU_WATCHING)

Well, after all what works for NOHZ_FULL should also work for idle. It's
preceded by entry code as well (or rather __cpuidle).

Thanks.

-- 
Frederic Weisbecker
SUSE Labs

