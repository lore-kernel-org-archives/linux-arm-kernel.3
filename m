Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0025FCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 12:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iuycLviNnE5+4oumWCmFuRH1nrIm3OzfZVl+S9w0lTM=; b=WRUbEIY21uh9n5yBhoZ0vdl3rv
	iDsFMHPzOMLqKuOZRlYEgv3Jj7MHLD8P1r1LYb7kVktKp4YVNcbI9UAsQrU9/A2KfvdOw+95Q43Vw
	fxhhzQ0sb7B/PxNHf5dklDO2ywyZy5KBjH+i+g71vt6UpTDKGzDvXhAu7mMuKGq3Boc0Z9945dLyr
	E1o5ZKHAGpOML2vouworDDQ/s6IMl0aJ7SswhSbtSbFpSYEdjizyxR9fxQJUSjPFDyqMrH9NaqLbx
	pcWIL0HXDF1cDOW7HOYJRALCpmZeYfMk3j/qmHlU7CgVytcSFPRW1keCsv0HfNN/HGCRKynO8ysYu
	rZdcfLPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU1zh-0000000B9xc-44lh;
	Mon, 01 Jun 2026 12:43:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU1zg-0000000B9xW-33Pj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 12:43:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1DAE260018;
	Mon,  1 Jun 2026 12:43:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA7701F00898;
	Mon,  1 Jun 2026 12:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780317827;
	bh=iuycLviNnE5+4oumWCmFuRH1nrIm3OzfZVl+S9w0lTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F3Wt42dmsl8N/Q6vfJ3pNcJKMoRoRnQ8g8hrqDFUsBz96oXnHGJREwWMNHaY1ekT3
	 xyX/JN+bpfO+JQOjFofzlqO8bdhfudP7aZtWfeY6z2M7Dq3NhchztUWmjAEjBfvBuU
	 Kimm8GlIPyFzEZ/iJKScSt04PcxBFR804+EgdCqFNebURcisLekaZiYGq7rgDPiGas
	 ty4KAo8SJUQJa91xlSLHp5rIWEfgUhGGQPhJdY+PCb3irAPbsR3Ki04VQ8yHvMXT9h
	 uebafcqwpONVzAo5Zb7i9PRnCf9iDZjE7meIHbfRhfyJMIio2bZIwCv6kSz9yKRN96
	 yuT1nTp6kM54Q==
Date: Mon, 1 Jun 2026 13:43:42 +0100
From: Will Deacon <will@kernel.org>
To: Yiqi Sun <sunyiqixm@gmail.com>
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, rmk+kernel@armlinux.org.uk,
	ruanjinjie@huawei.com, mark.rutland@arm.com, kees@kernel.org,
	keno@juliacomputing.com, luis.machado@linaro.org
Subject: Re: [PATCH] fix: arm64: syscall: use live x0 for
 syscall_get_arguments() arg0
Message-ID: <ah1-fmV1VcN3cKto@willie-the-truck>
References: <20260529065444.1336608-1-sunyiqixm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529065444.1336608-1-sunyiqixm@gmail.com>
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

On Fri, May 29, 2026 at 02:54:44PM +0800, Yiqi Sun wrote:
> On arm64, seccomp obtains syscall arguments via syscall_get_arguments(),
> where arg0 is currently read from regs->orig_x0. However, the syscall
> wrapper consumes live arguments from regs->regs[0..5].
> 
> A ptracer can modify x0 on syscall-enter stop before seccomp runs,
> but cannot update orig_x0 through that interface. This can
> leave seccomp checking stale arg0 while the syscall executes with updated
> live x0, allowing seccomp bypass when filters depend on arg0.
> 
> Make syscall_get_arguments() read arg0 from regs->regs[0], matching the
> actual dispatch arguments and removing this desynchronization.
> 
> Fixes: f27bb139c387 ("arm64: Miscellaneous library functions")
> Signed-off-by: Yiqi Sun <sunyiqixm@gmail.com>
> ---
>  arch/arm64/include/asm/syscall.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
> index 5e4c7fc44f73..4bdb4d3ce2b4 100644
> --- a/arch/arm64/include/asm/syscall.h
> +++ b/arch/arm64/include/asm/syscall.h
> @@ -81,7 +81,7 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  					 struct pt_regs *regs,
>  					 unsigned long *args)
>  {
> -	args[0] = regs->orig_x0;
> +	args[0] = regs->regs[0];
>  	args[1] = regs->regs[1];
>  	args[2] = regs->regs[2];
>  	args[3] = regs->regs[3];
> -- 
> 2.34.1

Hrm, this looks like a long-standing issue and I'm pretty nervous about
changing it :/

How did you spot it?

A quick look at the code suggests we have a similar issue with
audit_syscall_entry(), so if we take your patch here then it will silently
introduce a behavioural change to this guy:

https://lore.kernel.org/all/20260320102620.1336796-5-ruanjinjie@huawei.com/

I also notice that the compat ptrace interface allows 'orig_x0' to be
set -- could that cause issues with things like syscall_rollback()?

Will

