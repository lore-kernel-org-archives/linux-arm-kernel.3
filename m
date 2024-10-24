Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D111CD0BB5C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 11:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+cnpXrEnratZ/0ANHJRoM/FBQGxJxacaNYhwyCnWLO4=; b=LBKJ68nAWtHs8yEbZ+iwIakwsm
	uxftRRAWDHdi3WKfFXE2ZP4DZpPEveHUt/HIODxw96zVSr5FRuWLvnUlzpUNT30Toh0KkK6OMDWlK
	btgG+xKyy5i/Xcr2Zn2qppRCkT8SyMVRMCdb0YPWnBDI/VKKkW+yW9K0adnCJ+NimaQV+HgANDdYQ
	FkWuv9adr08Uhhch/WGk8lEzvQkELz4LUC5QQ5TbRrJ13WjCR0M9T9z9d3yppECTahHFy4oyejNP6
	TVQTAAzsuNQugkBXQ8b4R5e5oQlRkbKCDqseCsbnbmiBzKrkvQtUHroKHMfb3AAuN6KR6q6Rtd5S7
	+qy1wYIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3viA-00000000AgD-08BJ;
	Thu, 24 Oct 2024 11:09:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3vZN-0000000097g-1MqV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 10:59:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6713B339;
	Thu, 24 Oct 2024 04:00:24 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 25F983F71E;
	Thu, 24 Oct 2024 03:59:49 -0700 (PDT)
Date: Thu, 24 Oct 2024 11:59:46 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, akpm@linux-foundation.org,
	anshuman.khandual@arm.com, aruna.ramakrishna@oracle.com,
	broonie@kernel.org, dave.hansen@linux.intel.com,
	dave.martin@arm.com, jeffxu@chromium.org, joey.gouly@arm.com,
	pierre.langlois@arm.com, shuah@kernel.org, sroettger@google.com,
	will@kernel.org, linux-kselftest@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v2 3/5] arm64: signal: Improve POR_EL0 handling to avoid
 uaccess failures
Message-ID: <ZxoooqtuqTK5CAMR@arm.com>
References: <20241023150511.3923558-1-kevin.brodsky@arm.com>
 <20241023150511.3923558-4-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023150511.3923558-4-kevin.brodsky@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_035957_460241_D1D8C9D6 
X-CRM114-Status: GOOD (  22.02  )
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

On Wed, Oct 23, 2024 at 04:05:09PM +0100, Kevin Brodsky wrote:
> diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
> index f5fb48dabebe..d2e4e50977ae 100644
> --- a/arch/arm64/kernel/signal.c
> +++ b/arch/arm64/kernel/signal.c
> @@ -66,9 +66,63 @@ struct rt_sigframe_user_layout {
>  	unsigned long end_offset;
>  };
>  
> +/*
> + * Holds any EL0-controlled state that influences unprivileged memory accesses.
> + * This includes both accesses done in userspace and uaccess done in the kernel.
> + *
> + * This state needs to be carefully managed to ensure that it doesn't cause
> + * uaccess to fail when setting up the signal frame, and the signal handler
> + * itself also expects a well-defined state when entered.
> + */
> +struct user_access_state {
> +	u64 por_el0;
> +};
> +
>  #define TERMINATOR_SIZE round_up(sizeof(struct _aarch64_ctx), 16)
>  #define EXTRA_CONTEXT_SIZE round_up(sizeof(struct extra_context), 16)
>  
> +/*
> + * Save the unpriv access state into ua_state and reset it to disable any
> + * restrictions.
> + */
> +static void save_reset_user_access_state(struct user_access_state *ua_state)
> +{
> +	if (system_supports_poe()) {
> +		/*
> +		 * Enable all permissions in all 8 keys
> +		 * (inspired by REPEAT_BYTE())
> +		 */
> +		u64 por_enable_all = (~0u / POE_MASK) * POE_RXW;

I think this should be ~0ul.

> @@ -907,6 +964,7 @@ SYSCALL_DEFINE0(rt_sigreturn)
>  {
>  	struct pt_regs *regs = current_pt_regs();
>  	struct rt_sigframe __user *frame;
> +	struct user_access_state ua_state;
>  
>  	/* Always make any pending restarted system calls return -EINTR */
>  	current->restart_block.fn = do_no_restart_syscall;
> @@ -923,12 +981,14 @@ SYSCALL_DEFINE0(rt_sigreturn)
>  	if (!access_ok(frame, sizeof (*frame)))
>  		goto badframe;
>  
> -	if (restore_sigframe(regs, frame))
> +	if (restore_sigframe(regs, frame, &ua_state))
>  		goto badframe;
>  
>  	if (restore_altstack(&frame->uc.uc_stack))
>  		goto badframe;
>  
> +	restore_user_access_state(&ua_state);
> +
>  	return regs->regs[0];
>  
>  badframe:

The saving part I'm fine with. For restoring, I was wondering whether we
can get a more privileged POR_EL0 if reading the frame somehow failed.
This is largely theoretical, there are other ways to attack like
writing POR_EL0 directly than unmapping/remapping the signal stack.

What I'd change here is always restore_user_access_state() to
POR_EL0_INIT. Maybe just initialise ua_state above and add the function
call after the badframe label.

Either way:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

