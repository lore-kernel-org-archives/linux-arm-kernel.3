Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD42C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 12:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XzrwdlotVV4wDasEe45YS9W6PV4g7nf83PqzyoE45f4=; b=qhbUdf8fY7tzjfjTgpuat6ZfLX
	EBmse5GkAciSO1dPV/cZu0kgTS+leUG7ZwvSmja/JzU+C9sL/wh518AHU6jYj8F4qKxPAZrexc67T
	vWGqmMJycvuVcW2cpHg+AlQwYDHejj608EtFo7Dx3tQpQh0f1O0UAKktbaGvcF3pXbYNwJOFQu6E9
	HaBSQzMRPglMvGlb6k4LgBAfpC3CammO6A1icVW2oQFk1XGJb11n5VhwP7VB8aLPrFC2kEj1Ujzmu
	zmotKC+Ayub0ltSU77k9XVHTqPN2CosdqgOH02lbcKYWv3rvW9gUDC3jOB3/cPIWejYZ1BCyQwgTN
	5xAdM1PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uckH4-0000000Caca-3ObA;
	Fri, 18 Jul 2025 12:33:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucjL8-0000000CTgV-1Yqm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 11:33:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1017E5C5428;
	Fri, 18 Jul 2025 11:33:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A11AC4CEEB;
	Fri, 18 Jul 2025 11:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752838400;
	bh=92arq/Wo1/KhOpoRdEXUKIc1y6xuILihx9THlijFiR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XFwPSbbkzFb40PzhDQ/wJAwKW3YmtkzoutTGTkV/zX1+GLT4rYBnnKNNYzGDui87P
	 Yi7IOtoXvaRhL5fa1rWumqqxtuAhQae5fbYevDcyF+Lxo0ccUSuMoguYPO/egRL/Qm
	 EQeCo/h2G3/kiEcq4oJQnk+8G+3ev4ZIRyyke8n1bh/8qHk9kyldId2MUKh5ePVkjP
	 lcCkEdu1CxQu9uFDq34mw7pvxII3CRaE2y464pDItUdJhiCri28vwejHJU0WqreC7G
	 7BXZuGgFrCPbtERV8zuJ/vRXT1P1j0zzRzJhZ+1NFvXe3udHk/iOi+ANqxnMqWa2ud
	 2yZwCecPVUMaw==
Date: Fri, 18 Jul 2025 12:33:15 +0100
From: Will Deacon <will@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: bpf@vger.kernel.org, Puranjay Mohan <puranjay@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Maxwell Bland <mbland@motorola.com>, Dao Huang <huangdao1@oppo.com>
Subject: Re: [PATCH bpf-next v10 1/3] cfi: add C CFI type macro
Message-ID: <aHow-yVsJCO2AJsn@willie-the-truck>
References: <20250715225733.3921432-5-samitolvanen@google.com>
 <20250715225733.3921432-6-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715225733.3921432-6-samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_043322_453347_0636E54B 
X-CRM114-Status: GOOD (  17.71  )
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

On Tue, Jul 15, 2025 at 10:57:35PM +0000, Sami Tolvanen wrote:
> From: Mark Rutland <mark.rutland@arm.com>
> 
> Currently x86 and riscv open-code 4 instances of the same logic to
> define a u32 variable with the KCFI typeid of a given function.
> 
> Replace the duplicate logic with a common macro.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Co-developed-by: Maxwell Bland <mbland@motorola.com>
> Signed-off-by: Maxwell Bland <mbland@motorola.com>
> Co-developed-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Tested-by: Dao Huang <huangdao1@oppo.com>
> ---
>  arch/riscv/kernel/cfi.c       | 35 +++--------------------------------
>  arch/x86/kernel/alternative.c | 31 +++----------------------------
>  include/linux/cfi_types.h     | 23 +++++++++++++++++++++++
>  3 files changed, 29 insertions(+), 60 deletions(-)

[...]

> diff --git a/include/linux/cfi_types.h b/include/linux/cfi_types.h
> index 6b8713675765..e5567c0fd0b3 100644
> --- a/include/linux/cfi_types.h
> +++ b/include/linux/cfi_types.h
> @@ -41,5 +41,28 @@
>  	SYM_TYPED_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)
>  #endif
>  
> +#else /* __ASSEMBLY__ */
> +
> +#ifdef CONFIG_CFI_CLANG
> +#define DEFINE_CFI_TYPE(name, func)						\
> +	/*									\
> +	 * Force a reference to the function so the compiler generates		\
> +	 * __kcfi_typeid_<func>.						\
> +	 */									\
> +	__ADDRESSABLE(func);							\
> +	/* u32 name __ro_after_init = __kcfi_typeid_<func> */			\
> +	extern u32 name;							\
> +	asm (									\
> +	"	.pushsection	.data..ro_after_init,\"aw\",@progbits	\n"	\
> +	"	.type	" #name ",@object				\n"	\
> +	"	.globl	" #name "					\n"	\
> +	"	.p2align	2, 0x0					\n"	\
> +	#name ":							\n"	\
> +	"	.4byte	__kcfi_typeid_" #func "				\n"	\
> +	"	.size	" #name ", 4					\n"	\
> +	"	.popsection						\n"	\
> +	);
> +#endif

This looks good to me. I was initially a bit worried about the portability
of the '.4byte' directive, but it seems that cfi_types.h is already using
that for the __CFI_TYPE() macro so I'm assuming it's not an issue.

In which case:

Acked-by: Will Deacon <will@kernel.org>

Thanks for cleaning it up.

Will

