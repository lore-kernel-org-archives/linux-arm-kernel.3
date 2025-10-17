Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53AECCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 17:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dYSbPtvk99ZqXo0I+FP8hH9eTNVo3RwNmsNeJVR8rYo=; b=1S2HtAxBH7V1YCEpZHw75hlJ5F
	g1huqkcd1zVnFOKmH7sSNy+bsdvCQpdUHkYLxIVeEWdNCH4wvaXNN/bDZ91etyyPX6/4+tCRmavMI
	MhwxrSWwN5I2V1AAGMcOy07LsRm9yjmaQSwO+xg5MKQWyAdTPf9rfcLT0e7t/Q2Suy01guHebecm9
	g2rCFVbYGQ89B29YR3/zI1fVeDYhr7XEbLWU9e8HR3E73+9HaWnxdh016d+9iNmtJ/vJUBrBmcsC4
	/8qUV7SfeiivfzNQkSGkM5w+D1mxYbgtCYH9qgf7At+KnN3mc+Qg5ZKqwfCwlPXwJ21rfIURRpC3F
	3fRjlp5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9o1f-00000008ZKS-3jWJ;
	Fri, 17 Oct 2025 17:13:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9o1d-00000008ZJM-1zjx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 17:13:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D86544C71;
	Fri, 17 Oct 2025 17:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46650C4CEE7;
	Fri, 17 Oct 2025 17:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760721236;
	bh=Zc+ypsDehD+D6EjfX9MaxxSVOwS713BdXCX/6JkDy1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N3b3JcaVsGssqTSDliSQf4B8QRyePHJqsfnUBuurk8TnjaVSmZXKRjiQR36KHZOQ9
	 vckQglIOadTsS8LvFnioBKHfz91LE3sIhjQzxnzoiDoMqsiLRaCq2J6kItOxJ++788
	 OFNqc4WcskLOEo+Qg+kypMA6NrIB5zH5SM6wf3nRt55KexXQjcMd9/mHLn+u3cqtMx
	 0tgqmFeWm2Z0fLhGwRrG/6/Vkez5K7tecI43bJarRS9fCC02oWisB4B4THSMj1LO/k
	 xm/9MIsjNM3IvuCZ1ugzRVcA9X8oawlGvoxgFkY/YPMGOFteY3/u+bdtmaSeRn1G2A
	 JElBpSLx3c81Q==
Date: Fri, 17 Oct 2025 10:12:23 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, herbert@gondor.apana.org.au,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v3 21/21] arm64/fpsimd: Allocate kernel mode FP/SIMD
 buffers on the stack
Message-ID: <20251017171223.GF1566@sol>
References: <20251008154533.3089255-23-ardb+git@google.com>
 <20251008154533.3089255-44-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008154533.3089255-44-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_101357_546539_6EBFA8F1 
X-CRM114-Status: GOOD (  15.96  )
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

On Wed, Oct 08, 2025 at 05:45:55PM +0200, Ard Biesheuvel wrote:
> diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
> index 61d62bfd5a7b..226e635c53d9 100644
> --- a/arch/arm64/include/asm/processor.h
> +++ b/arch/arm64/include/asm/processor.h
> @@ -172,7 +172,7 @@ struct thread_struct {
>  	unsigned long		fault_code;	/* ESR_EL1 value */
>  	struct debug_info	debug;		/* debugging */
>  
> -	struct user_fpsimd_state	kernel_fpsimd_state;
> +	struct user_fpsimd_state	*kernel_fpsimd_state;

Perhaps this field deserves a comment?

> @@ -1834,7 +1837,7 @@ void fpsimd_save_and_flush_cpu_state(void)
>   * The caller may freely use the FPSIMD registers until kernel_neon_end() is
>   * called.
>   */
> -void kernel_neon_begin(void)
> +void kernel_neon_begin(struct user_fpsimd_state *state)

Similarly, the 'state' parameter to kernel_neon_begin() and
kernel_neon_end() could use documentation.

> -		if (IS_ENABLED(CONFIG_PREEMPT_RT) || !in_serving_softirq())
> +		if (IS_ENABLED(CONFIG_PREEMPT_RT) || !in_serving_softirq()) {
> +			/*
> +			 * Record the caller provided buffer as the kernel mode
> +			 * FP/SIMD buffer for this task, so that the state can
> +			 * be preserved and restored on a context switch.
> +			 */
> +			WARN_ON(current->thread.kernel_fpsimd_state != NULL);
> +			current->thread.kernel_fpsimd_state = state;
>  			set_thread_flag(TIF_KERNEL_FPSTATE);
> +		}

'state' can be NULL here, right?  So in that case we do set
TIF_KERNEL_FPSTATE, but we assume context switching cannot happen?

- Eric

