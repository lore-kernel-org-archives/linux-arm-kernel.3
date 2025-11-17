Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A2E8CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 10:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VuPkiELm+SrnpcT5iZ90jAZEPo4vB/y31N88Vd0NW8A=; b=NN/h5hExnzjpPY5FRR4IjEKwpU
	zLli1Vgf8vdYR+XnLA5gRfQybe7S9Ucvge319dGhrUp/HFgFFfNWy48yQgiOTL1syiWY4n2VS0AFs
	Kk+y4FbL33ww84GbPUiKEKOU2Yrt7p+EbuEWP6LC3hgvJSZ+//iLA68jbkW6GFOkp+tyh63VNYpsV
	0vDOs9S+mM91HhQ2Tt2ftiykKK+x6K2+/Nw7IzWQsSII9CZXm7LVi9iS4bR74ptGcISBIsG6bp1Zn
	JYP0To6r4ysEo/LN5hUaNO55kKBYHz0sP36MPdHmdvxoXC+6gHYQOfYLN6MPE7ECuUBJn0jypvvIR
	zKagXqlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwFq-0000000Fr7L-2XhO;
	Mon, 17 Nov 2025 10:14:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwFn-0000000Fr6C-3fDh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 10:14:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D77D2FEC;
	Mon, 17 Nov 2025 02:14:24 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DBD4A3F740;
	Mon, 17 Nov 2025 02:14:30 -0800 (PST)
Date: Mon, 17 Nov 2025 10:14:25 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Ben Niu <niuben003@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, tytso@mit.edu, Jason@zx2c4.com,
	Ben Niu <benniu@meta.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] tracing: Enable kprobe for selected Arm64 assembly
Message-ID: <aRr1gXk1giE8TXvY@J2N7QTR9R3>
References: <20251103185237.2284456-1-benniu@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103185237.2284456-1-benniu@meta.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_021435_953012_41D165A4 
X-CRM114-Status: GOOD (  19.13  )
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

On Mon, Nov 03, 2025 at 10:52:35AM -0800, Ben Niu wrote:
> When ftrace is enabled, a function can only be kprobe'd if
>   (1) the function has proper nops inserted at the beginning
>   (2) the first inserted nop's address is added in section
>       __patchable_function_entries.
>
> See function within_notrace_func in kernel/trace/trace_kprobe.c
> for more details.

As mentioned last time, this isn't accurate, and this is at the wrong
level of abstraction. You're conflating kprobes with kprobes-based trace
evnts, and you're describing the implementation details of ftrace rather
than the logical situation that the function needs to be traceable via
ftrace

This would be better summarized as:

  While kprobes can be placed on most kernel functions, kprobes-based
  trace events can only be placed on functions which are traceable via
  ftrace (unless CONFIG_KPROBE_EVENTS_ON_NOTRACE=y).

IIUC from last time you only want this so that you can introspect
__arch_copy_to_user() and __arch_copy_from_user(), so why can't you
select CONFIG_KPROBE_EVENTS_ON_NOTRACE in your test kernel? That would
require zero kernel changes AFAICT.

I'm not keen on doing this unless absolutely necessary, and as above it
looks like we already have suitable options to make this possible for
your use-case.

> This patch adds a new asm function macro SYM_FUNC_START_TRACE
> that makes an asm funtion satisfy the above two conditions so that
> it can be kprobe'd. In addition, the macro is applied to
> __arch_copy_to_user and __arch_copy_from_user, which were found
> to be hot in certain workloads.
> 
> Note: although this patch unblocks kprobe tracing, fentry is still
> broken because no BTF info gets generated from assembly files. A
> separate patch is needed to fix that.

As above, I'm not keen on doing this, and if it's largely incomplete, I
think that's another nail in the coffin.

[...]

> +#ifdef CONFIG_ARM64_BTI_KERNEL
> +#define BTI_C bti c;
> +#else
> +#define BTI_C
> +#endif

Please note that we deliberately chose to always output BTI for asm
functions to avoid a performance vaiability depending on whether BTI was
enabled, so if we're going to change that, we must do that as a
preparatory step with a clear rationale.

Mark.

