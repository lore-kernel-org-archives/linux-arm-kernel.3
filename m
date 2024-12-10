Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3625E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 14:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C5Gt4l1QGMqthEgS8c7bKe1S3kkqDSq0xw0GYQ1ZLaI=; b=YjDLOaEpXsEd8fQQDoQtJco3A5
	3Bhl4gvNkhBA/0Cu6mHplqAM+KC2UdtgOV4fDwr5iE63CIyYcWD2jS0Kf2dgwZ934Gh2hUG7D7G2Y
	cS4Ggve/EaGVUtdeCw1LUmhqEom1g8lT9nIKUE3CpfRKbmj/SXfnTB7t7DIBY6KeygMsbgnCQnQM1
	eabxxwU2/Mt1HCgsbrJqcGK9IK8CXMBZlmKISYjE7Tt6z0ceRudmv/JtNOnS7/yLhDBCfWBiUeOHr
	iz7ADMgc6R3ic7oHlgmwvydDNAHM/TZGQHJYnsWbh7FIPSWCg3gEK1f3ZRwOqvMn19dNunzbvZaxq
	gQt0QdOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1aj-0000000Br9k-3Hjo;
	Tue, 10 Dec 2024 14:52:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1Xn-0000000BqNZ-03Dl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 14:49:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 286AF106F;
	Tue, 10 Dec 2024 06:49:25 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE59D3F58B;
	Tue, 10 Dec 2024 06:48:55 -0800 (PST)
Date: Tue, 10 Dec 2024 14:48:48 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] arm64/signal: Silence spurious sparse warning storing
 GCSPR_EL0
Message-ID: <Z1hU0Ii-Sm9NHnhj@J2N7QTR9R3>
References: <20241210-arm64-gcs-signal-sparse-v1-1-26888bcd6f89@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210-arm64-gcs-signal-sparse-v1-1-26888bcd6f89@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_064859_134327_341D285E 
X-CRM114-Status: GOOD (  26.66  )
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

On Tue, Dec 10, 2024 at 12:42:53AM +0000, Mark Brown wrote:
> We are seeing a false postive sparse warning in gcs_restore_signal()
> 
> arch/arm64/kernel/signal.c:1054:9: sparse: sparse: cast removes address space '__user' of expression

This isn't a false positive; this is a cross-address space cast that
sparse is accurately warning about. That might be *benign*, but the tool
is doing exactly what it is supposed to.

> when storing the final GCSPR_EL0 value back into the register, caused by
> the fact that write_sysreg_s() casts the value it writes to a u64 which
> sparse sees as discarding the __userness of the pointer. The magic for
> handling such situations with sparse is to cast the value to an unsigned
> long which sparse sees as a valid thing to do with __user pointers so add
> such a cast.

As a general note, casting to/from unsigned long or uintptr_t is a
special-case in sparse, and in general you should use __force to cast
across address spaces or to/from bitwise types, e.g.

	some_type *foo = ...;
	some_type __user *user_foo;

	user_foo = (__force some_type __user *)foo;

> While we're at it also remove spurious casts of the gcspr_el0 value as we
> manipulate it which were the result of bitrot as the code was tweaked in
> the long period it was out of tree.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202412082005.OBJ0BbWs-lkp@intel.com/
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/kernel/signal.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
> index 14ac6fdb872b9672e4b16a097f1b577aae8dec50..83ea7e5fd2b54566c6649b82b8570657a5711dd4 100644
> --- a/arch/arm64/kernel/signal.c
> +++ b/arch/arm64/kernel/signal.c
> @@ -39,7 +39,7 @@
>  #ifdef CONFIG_ARM64_GCS
>  #define GCS_SIGNAL_CAP(addr) (((unsigned long)addr) & GCS_CAP_ADDR_MASK)
>  
> -static bool gcs_signal_cap_valid(u64 addr, u64 val)
> +static bool gcs_signal_cap_valid(unsigned long __user *addr, u64 val)
>  {
>  	return val == GCS_SIGNAL_CAP(addr);
>  }
> @@ -1094,15 +1094,15 @@ static int gcs_restore_signal(void)
>  	/*
>  	 * Check that the cap is the actual GCS before replacing it.
>  	 */
> -	if (!gcs_signal_cap_valid((u64)gcspr_el0, cap))
> +	if (!gcs_signal_cap_valid(gcspr_el0, cap))
>  		return -EINVAL;
>  
>  	/* Invalidate the token to prevent reuse */
> -	put_user_gcs(0, (__user void*)gcspr_el0, &ret);
> +	put_user_gcs(0, gcspr_el0, &ret);
>  	if (ret != 0)
>  		return -EFAULT;
>  
> -	write_sysreg_s(gcspr_el0 + 1, SYS_GCSPR_EL0);
> +	write_sysreg_s((unsigned long)(gcspr_el0 + 1), SYS_GCSPR_EL0);

Only one line here wants a __user pointer, so wouldn't it be simpler to
pass 'gcspr_el0' as an integer type, and cast it at the point it's used
as an actual pointer, rather than the other way around?

Then you could also simplify gcs_restore_signal(), etc.

Similarly in map_shadow_stack(), it'd be simpler to treat cap_ptr as an
integer type.

Mark.

>  
>  	return 0;
>  }
> 
> ---
> base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
> change-id: 20241209-arm64-gcs-signal-sparse-53fa9cad67f7
> 
> Best regards,
> -- 
> Mark Brown <broonie@kernel.org>
> 
> 

