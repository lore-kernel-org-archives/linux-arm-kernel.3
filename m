Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E33C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 15:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OrNbg05behU40JhXpahDzxCTTtw9aZe79lE2GTk1vx0=; b=sbA93tCES/8iaijjLoRAU4SS6k
	/cAstmWuxsw3TztPrucd75c2JhTIerkK7DgMyeKGEgwT89rrqiXXBW15wMTEWGmO74wlPj9ycek4g
	e+5Tk/81gNQDyPLNz6K6Pk8293hDffAo3zIZZysWz5757ghITZYlUY2IDflD0I2FnMJPqh7uZ89EG
	BeBZOOJFr7xTc1em2N8g5Osas+jKZwiOZAtLcHAndbvoJiHtnGjDzCJ8eNjBaCrDP074Aj5sJB3Fr
	xfZ01Rvc0y2wjzp4TTzn7rd4iacE9z6JWPBteEBRg8vQAdpz7vXbaD74Ahb3MFqdt/BD+JeAZCSmx
	Ui1PDmzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgpM-0000000FznU-2Z5Y;
	Wed, 07 May 2025 15:36:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgDo-0000000FsHN-1V2b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 14:58:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5F877629D5;
	Wed,  7 May 2025 14:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93A81C4CEE2;
	Wed,  7 May 2025 14:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746629887;
	bh=LEC5fCf715uRLsq0jhN7rxgg1z1gqf1psRO7uG6uXFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b1KJyzUMIoi4l6yEpUsbz3Dl5kqWSFBUkSJRtL1yC/YeNXe+CSWfzaIQe51xB34Ld
	 z/KnL6javmqQx9N4rRAixENng1IMK2TJtodek55wLd4LRVGIm3Zbr2Knw4eyL01w2A
	 FYtludjdZwUTlW6aINRxmuWCrLdJ4MFjfLKX7ZEbV9npVoIhuoAO30AGwB5u1zfZ+E
	 7hkFVZDhpxirG2O/fOj+aIfFGIeujdLkjTvWOJ0IjNUWTlv5i5epK5d9ZZWtRlo0x8
	 Mj7e7tnX7Kjo7txMwigwItvqX1HKW6745MLvHyEX4pYxRfG+1w9a+8dPFAFckjjoeX
	 JFWz3nG9g1Wog==
Date: Wed, 7 May 2025 15:58:01 +0100
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
	catalin.marinas@arm.com, daniel.kiss@arm.com,
	david.spickett@arm.com, luis.machado@arm.com, maz@kernel.org,
	richard.sandiford@arm.com, sander.desmalen@arm.com,
	tabba@google.com, tamas.petz@arm.com, tkjos@google.com,
	yury.khrustalev@arm.com
Subject: Re: [PATCH 13/20] arm64/fpsimd: Make clone() compatible with ZA lazy
 saving
Message-ID: <20250507145800.GC2475@willie-the-truck>
References: <20250506152523.1107431-1-mark.rutland@arm.com>
 <20250506152523.1107431-14-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506152523.1107431-14-mark.rutland@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Tue, May 06, 2025 at 04:25:16PM +0100, Mark Rutland wrote:
> @@ -441,14 +449,39 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
>  				childregs->sp = stack_start;
>  		}
>  
> +		/*
> +		 * Due to the AAPCS64 "ZA lazy saving scheme", PSTATE.ZA and
> +		 * TPIDR2 need to be manipulated as a pair, and either both
> +		 * need to be inherited or both need to be reset.
> +		 *
> +		 * Within a process, child threads must not inherit their
> +		 * parent's TPIDR2 value or they may clobber their parent's
> +		 * stack at some later point.
> +		 *
> +		 * When a process is fork()'d, the child must inherit ZA and
> +		 * TPIDR2 from its parent in case there was dormant ZA state.
> +		 *
> +		 * Use CLONE_VM to determine when the child will share the
> +		 * address space with the parent, and cannot safely inherit the
> +		 * state.
> +		 */
> +		if (system_supports_sme()) {
> +			if (!(clone_flags & CLONE_VM)) {
> +				p->thread.tpidr2_el0 = read_sysreg_s(SYS_TPIDR2_EL0);

Why do we need to re-read this register given that we did this just a few
lines earlier?

> diff --git a/tools/testing/selftests/arm64/abi/tpidr2.c b/tools/testing/selftests/arm64/abi/tpidr2.c
> index 285c47dd42f63..eb19dcc37a755 100644
> --- a/tools/testing/selftests/arm64/abi/tpidr2.c
> +++ b/tools/testing/selftests/arm64/abi/tpidr2.c
> @@ -169,8 +169,10 @@ static int sys_clone(unsigned long clone_flags, unsigned long newsp,
>  			   child_tidptr);
>  }
>  
> +#define __STACK_SIZE (8 * 1024 * 1024)
> +
>  /*
> - * If we clone with CLONE_SETTLS then the value in the parent should
> + * If we clone with CLONE_VM then the value in the parent should
>   * be unchanged and the child should start with zero and be able to
>   * set its own value.
>   */
> @@ -179,11 +181,19 @@ static int write_clone_read(void)
>  	int parent_tid, child_tid;
>  	pid_t parent, waiting;
>  	int ret, status;
> +	void *stack;
>  
>  	parent = getpid();
>  	set_tpidr2(parent);
>  
> -	ret = sys_clone(CLONE_SETTLS, 0, &parent_tid, 0, &child_tid);
> +	stack = malloc(__STACK_SIZE);
> +	if (!stack) {
> +		putstr("# malloc() failed\n");
> +		return 0;
> +	}
> +
> +	ret = sys_clone(CLONE_VM, (unsigned long)stack + __STACK_SIZE,
> +			&parent_tid, 0, &child_tid);
>  	if (ret == -1) {
>  		putstr("# clone() failed\n");
>  		putnum(errno);

Thank you for updating the selftest, but please can you put it in a
separate patch?

Cheers,

Will

