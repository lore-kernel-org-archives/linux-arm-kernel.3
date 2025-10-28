Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1E7CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 14:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iMhlL+awlNfW9A5jmBo0UeSJ8e6xIZTWAHrMjd5ojNE=; b=xCR/nPBqn9HvH7F9kipj9fy9jZ
	UwrXlap34MQq9jDslrAraxutAUfSoC6FpkMsVDuNcqVvRNMYE3Yc1lmC8epHpmGv2wFZKjknx5L2R
	+DolomTe3/z/7k6NT8o1kb7jm07egef+vd9H2tOin+KQ/LCfxtWZkJh2F5/vipiDsd/42O0w0jOLo
	BqgbzMYDryNW+EsWol437CGJy+By4Y4K/k36PTnhTIlmb678gOODOQDY2YXCMhwY76yfdSwQq/nTk
	3oL+zb/MnhuDeDyYNwXCS/PuIpLZ6iQjTc0/T4xm9JpQgtCy99Fc99uP88JwD8rLvr4V/afPsDBeT
	BGbgTDRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDl0i-0000000G71A-0KmZ;
	Tue, 28 Oct 2025 14:49:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDl0f-0000000G70i-3TlB;
	Tue, 28 Oct 2025 14:49:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0969A45F05;
	Tue, 28 Oct 2025 14:49:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64951C4CEE7;
	Tue, 28 Oct 2025 14:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761662956;
	bh=/YcbY6Xd39AsABVLZZYIvhdW8ivhFU4lURFGb2RCZr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=huHQXCvp0W/S5F1ENdurMkw2WwJZbMBNDXAh91iSKf/vrNDl1NLBkoXJdUx/C19Qv
	 Z4qNcGgTCDjqG04Q8z3Gw4n7Ol2Hs4TiC0IGtfV35bwyLcbAG4VH3lZOOkEdiJR4uv
	 98GKb95kopcHzMuvU3H2025SulpKC226+6+rZMUmhwVvLSkelVU5+Fv/hfF6vOYswZ
	 XcZScHHzyBVq+mz32oPgQ0NUDZQKpY6cLjssBtvUS7RZby1k7TivV6VhaUkRZyqa69
	 4+Ez+WRvhuVyLYG73RXpS/ughenkh3oUdmNmmth4K/glGp+Eu28p8jOe+6mgl5gPer
	 pCdjOFhzrTR8g==
Date: Tue, 28 Oct 2025 15:49:14 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, rcu@vger.kernel.org,
	x86@kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Nicolas Saenz Julienne <nsaenzju@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
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
Subject: Re: [PATCH v6 24/29] context_tracking,x86: Defer kernel text
 patching IPIs
Message-ID: <aQDX6hHV3b1-_wuF@localhost.localdomain>
References: <20251010153839.151763-1-vschneid@redhat.com>
 <20251010153839.151763-25-vschneid@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251010153839.151763-25-vschneid@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_074917_907187_792895DE 
X-CRM114-Status: GOOD (  21.37  )
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

Le Fri, Oct 10, 2025 at 05:38:34PM +0200, Valentin Schneider a écrit :
> text_poke_bp_batch() sends IPIs to all online CPUs to synchronize
> them vs the newly patched instruction. CPUs that are executing in userspace
> do not need this synchronization to happen immediately, and this is
> actually harmful interference for NOHZ_FULL CPUs.
> 
> As the synchronization IPIs are sent using a blocking call, returning from
> text_poke_bp_batch() implies all CPUs will observe the patched
> instruction(s), and this should be preserved even if the IPI is deferred.
> In other words, to safely defer this synchronization, any kernel
> instruction leading to the execution of the deferred instruction
> sync (ct_work_flush()) must *not* be mutable (patchable) at runtime.
> 
> This means we must pay attention to mutable instructions in the early entry
> code:
> - alternatives
> - static keys
> - static calls
> - all sorts of probes (kprobes/ftrace/bpf/???)
> 
> The early entry code leading to ct_work_flush() is noinstr, which gets rid
> of the probes.
> 
> Alternatives are safe, because it's boot-time patching (before SMP is
> even brought up) which is before any IPI deferral can happen.
> 
> This leaves us with static keys and static calls.
> 
> Any static key used in early entry code should be only forever-enabled at
> boot time, IOW __ro_after_init (pretty much like alternatives). Exceptions
> are explicitly marked as allowed in .noinstr and will always generate an
> IPI when flipped.
> 
> The same applies to static calls - they should be only updated at boot
> time, or manually marked as an exception.
> 
> Objtool is now able to point at static keys/calls that don't respect this,
> and all static keys/calls used in early entry code have now been verified
> as behaving appropriately.
> 
> Leverage the new context_tracking infrastructure to defer sync_core() IPIs
> to a target CPU's next kernel entry.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Signed-off-by: Nicolas Saenz Julienne <nsaenzju@redhat.com>
> Signed-off-by: Valentin Schneider <vschneid@redhat.com>

Acked-by: Frederic Weisbecker <frederic@kernel.org>

-- 
Frederic Weisbecker
SUSE Labs

