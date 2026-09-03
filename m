Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE62FC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 05:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wPjV0xAt2X5xqXl6S8/1og+Gt7Br2ZKczWCCN82Xt7k=; b=Bei8EnR+d3Lay0K4i0DcWWrYhh
	Ks8TMM7RY9FJgxMwXVSa8yf4VIdS0nRvbi8Z5DL1cjfNyCgPjnzfRuasT8PKQqo24FAArg069oFGn
	u0xf2srucZggp7DX3HrACwFH85DYaZrpusf3EuJxeXMdfih7XAGL0F1/Fc+4h883ACoQKk/0h5uTw
	0bqe8RX4sArgo2oTJMnsWb2cwf6jSq9x+6QbJhlBj0+N6J07+oRrwEtUOTs6M+GH3JA4AF8P6FmHe
	0lwqk5nDmBjePlzf32xum4esl1ja3MugwSTGrTYcnPINS6AqbwiTwIxjoHamQEmX3uCs73nkEQ+Lz
	awfy9S6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x20Sl-0000000GRJz-3oTI;
	Thu, 03 Sep 2026 05:58:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x20Si-0000000GRJO-42su
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 05:58:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DB6F1596;
	Wed,  2 Sep 2026 22:58:08 -0700 (PDT)
Received: from localhost (a079125.arm.com [10.164.21.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A1AE43F673;
	Wed,  2 Sep 2026 22:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788415092; bh=pQigNQ0RH1x3B4WAmoTYWjrUAMlgt0klrdQWZzUN6Qs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qCWpIZJyle1CnxF0mfzL51ZZrc+lgi1FCWufg+fdD4C3LnAhAdqG+yOAQVUktlhQj
	 p1q2ujxe01GN/YlR+g5ypXIuoNQei3uuNybBMEsgxyF8q7twxpCp0dzAIf+vlZyrM1
	 xQJ0F5GV8r0lEw0yR9/mBskoHU06Y0xqJ3sjjJpQ=
Date: Thu, 3 Sep 2026 11:28:08 +0530
From: Linu Cherian <linu.cherian@arm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-hardening@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Jann Horn <jannh@google.com>, Jeff Xu <jeffxu@chromium.org>,
	Joey Gouly <joey.gouly@arm.com>, Kees Cook <kees@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Maxwell Bland <mbland@motorola.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	=?iso-8859-1?Q?Pierre-Cl=E9ment?= Tosi <ptosi@google.com>,
	Quentin Perret <qperret@google.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	x86@kernel.org, Ira Weiny <iweiny@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH RFC v9 07/25] arm64: Context-switch POR_EL1
Message-ID: <apkMcHO_Y5Bu9G5o@a079125.arm.com>
References: <20260818-kpkeys-v9-0-743ad31b2c8f@arm.com>
 <20260818-kpkeys-v9-7-743ad31b2c8f@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818-kpkeys-v9-7-743ad31b2c8f@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_225813_071668_125DDAC2 
X-CRM114-Status: GOOD (  24.23  )
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


On Tue, Aug 18, 2026 at 03:08:49PM +0100, Kevin Brodsky wrote:
> POR_EL1 is about to be used by the kpkeys framework, modifying it
> for (typically small) sections of code. If an exception occurs
> during that window and scheduling occurs, we must ensure that
> POR_EL1 is context-switched as needed (saving the old value and
> restoring the new one). An ISB is needed to ensure the write takes
> effect, so we skip it if the new value is the same as the old, like
> for POR_EL0.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  arch/arm64/include/asm/processor.h |  1 +
>  arch/arm64/kernel/process.c        | 10 ++++++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
> index c2a627f39314..8d7fa479cd36 100644
> --- a/arch/arm64/include/asm/processor.h
> +++ b/arch/arm64/include/asm/processor.h
> @@ -195,6 +195,7 @@ struct thread_struct {
>  	u64			svcr;
>  	u64			tpidr2_el0;
>  	u64			por_el0;
> +	u64			por_el1;
>  #ifdef CONFIG_ARM64_GCS
>  	unsigned int		gcs_el0_mode;
>  	unsigned int		gcs_el0_locked;
> diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> index 581f80e9b9b7..1dec143decf1 100644
> --- a/arch/arm64/kernel/process.c
> +++ b/arch/arm64/kernel/process.c
> @@ -51,6 +51,7 @@
>  #include <asm/exec.h>
>  #include <asm/fpsimd.h>
>  #include <asm/gcs.h>
> +#include <asm/kpkeys.h>
>  #include <asm/mmu_context.h>
>  #include <asm/mpam.h>
>  #include <asm/mte.h>
> @@ -431,6 +432,9 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
>  
>  	ptrauth_thread_init_kernel(p);
>  
> +	if (system_supports_poe())
> +		p->thread.por_el1 = POR_EL1_INIT;
> +
>  	if (likely(!args->fn)) {
>  		*childregs = *current_pt_regs();
>  		childregs->regs[0] = 0;
> @@ -681,6 +685,12 @@ static void permission_overlay_switch(struct task_struct *next)
>  		 * of POR_EL0.
>  		 */
>  	}
> +
> +	current->thread.por_el1 = read_sysreg_s(SYS_POR_EL1);
> +	if (current->thread.por_el1 != next->thread.por_el1) {
> +		write_sysreg_s(next->thread.por_el1, SYS_POR_EL1);
> +		isb();
> +	}
>  }
>  
>  /*

Reviewed-by: Linu Cherian <linu.cherian@arm.com>


