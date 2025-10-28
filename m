Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA58CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 15:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eQvOkt2E+3y+uo1WdteSodshUamGy1TODkc+zOeJre8=; b=nhsenYcwbIndrYYzMJwe/Vxfvo
	wh42bpqXAz94KN3kRzY+l70ZBiwN/2PrxDpjBvgQVCbMKHGbD8CJVOoocUIEc7ynm6OksWfXu3xbn
	3kGUvIPD+B5EIw1gTxiPMOcDw32qyuqCp3YxwKXjf4hxKrfKRmSvmPs36vc89/qUC7+lxU19jyQCg
	cMJLBFXvupO1Yq+de7/AJ0J9DAlZlhOC7DG+4bWbzd5rYdX3rrYGr4Nl23uvbyBnm3BS++8CL9ZQP
	EWIsbNPCptvyU1VP5UDFT9tjkGBmCHYzP0GFMcTy/L9lOEpiykua+0E5DrFaUiH/1s9a24zY8UkHc
	1/zMwm1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDm6T-0000000GG7N-0XIz;
	Tue, 28 Oct 2025 15:59:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDm6S-0000000GG74-1JYe;
	Tue, 28 Oct 2025 15:59:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D8A8614A7;
	Tue, 28 Oct 2025 15:59:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C55CEC4CEE7;
	Tue, 28 Oct 2025 15:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761667159;
	bh=SDRIuqWM2TI7GYT8HdCkn7TBcJvTMa+nGGBd4kxLWaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h0Rjdky40XtCVRjoUUWv5rLiJ9ZMpCagJKFXeyfzHOGEHTGw9bKgoBDki9igeNVWF
	 hxxzLvARw99/t5f4Lqs+Dj5fZyVuN3fZZCRfCFM55ZeACJS/rijOr6rAqCQE7Hwid1
	 QyXcKn0xMZDkHD1ajCbuYBSCn+ENYdvO5PJWUuqfmfteG28nQwGE4UO2KHjBeLwl2c
	 hE32PRBdNnuYpqH0YyIEEpoBXAGIkGRuRSDfPq/9QdewsKj3LtsQ6g4eJFxD5TaKJO
	 HpEpDWwMqwcXSfnux9kuKahgFba9EgaGpASx7PAIM38ag+Pw/+fgAan6RlnvKpPKM4
	 jLUxM6PBiYL0w==
Date: Tue, 28 Oct 2025 16:59:16 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Valentin Schneider <vschneid@redhat.com>
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
Subject: Re: [RFC PATCH v6 27/29] x86/mm/pti: Implement a TLB flush
 immediately after a switch to kernel CR3
Message-ID: <aQDoVAs5UZwQo-ds@localhost.localdomain>
References: <20251010153839.151763-1-vschneid@redhat.com>
 <20251010153839.151763-28-vschneid@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251010153839.151763-28-vschneid@redhat.com>
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

Le Fri, Oct 10, 2025 at 05:38:37PM +0200, Valentin Schneider a écrit :
> Deferring kernel range TLB flushes requires the guarantee that upon
> entering the kernel, no stale entry may be accessed. The simplest way to
> provide such a guarantee is to issue an unconditional flush upon switching
> to the kernel CR3, as this is the pivoting point where such stale entries
> may be accessed.
> 
> As this is only relevant to NOHZ_FULL, restrict the mechanism to NOHZ_FULL
> CPUs.
> 
> Note that the COALESCE_TLBI config option is introduced in a later commit,
> when the whole feature is implemented.
> 
> Signed-off-by: Valentin Schneider <vschneid@redhat.com>
> ---
>  arch/x86/entry/calling.h      | 26 +++++++++++++++++++++++---
>  arch/x86/kernel/asm-offsets.c |  1 +
>  2 files changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/entry/calling.h b/arch/x86/entry/calling.h
> index 813451b1ddecc..19fb6de276eac 100644
> --- a/arch/x86/entry/calling.h
> +++ b/arch/x86/entry/calling.h
> @@ -9,6 +9,7 @@
>  #include <asm/ptrace-abi.h>
>  #include <asm/msr.h>
>  #include <asm/nospec-branch.h>
> +#include <asm/invpcid.h>
> 
>  /*
> 
> @@ -171,8 +172,27 @@ For 32-bit we have the following conventions - kernel is built with
> 	andq    $(~PTI_USER_PGTABLE_AND_PCID_MASK), \reg
>  .endm
> 
> -.macro COALESCE_TLBI
> +.macro COALESCE_TLBI scratch_reg:req
>  #ifdef CONFIG_COALESCE_TLBI
> +	/* No point in doing this for housekeeping CPUs */
> +	movslq  PER_CPU_VAR(cpu_number), \scratch_reg
> +	bt	\scratch_reg, tick_nohz_full_mask(%rip)
> +	jnc	.Lend_tlbi_\@

I assume it's not possible to have a static call/branch to
take care of all this ?

Thanks.

-- 
Frederic Weisbecker
SUSE Labs

