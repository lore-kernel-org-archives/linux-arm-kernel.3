Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560C8CAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 03:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2jMT0ncEFd/fEy/GuVvS9zwgWNcbA+60oyxGINspTTo=; b=fBFT7LPPsrT+6t8mnjibdznfPe
	oC5kEIDUH5NElSPOfrrFMjNtMjymNJ4HSK9TAEV1cn3NyKSBz1wYYYYGhxMAqd0C+dYye6bWADRfE
	dVFBao0Y1sIvW1gHDdL9Vn35YlixbUu0OLQzLr6f9uE84oBzNTyTnRk0qFu3hGzx8FXqB4iYLCvui
	U3mdnC096TZq+WBYkeIIe1Mur4/j67ETJpx9/BRH+8rfyYCbCvEcXy0AVpIVe8HkI5D1Iq4uFlXmh
	pASruU0zDc0orV0oqnMTgh/9kdWcHZI9mcS+z7m/Tt1OTGZ9OuzfMN4L56ZPIn//GJzKJTqEUvoCf
	L8dHY3QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1cjj-00000005Pkz-3gmH;
	Thu, 25 Sep 2025 03:33:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1cjh-00000005PkX-14YI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 03:33:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 97CD2416E1;
	Thu, 25 Sep 2025 03:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85439C4CEF0;
	Thu, 25 Sep 2025 03:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758771215;
	bh=DWfe4aECbsuwyz8AkW6vviHZuLumZTzAPaTzGlzdesg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gpeIJVxSOHjl/s2K8uNPyOH91Xr617pjQoR98gz6255BMQrq87DcqAlwrDI5mkwV1
	 OwqJ/CFHdKfkUJ3wYO9bINfdIr0MHVaWR1+OSvggIr/hARfQiX+S4rcsReLDfEbD9q
	 MKd8Xy5VfVA8CRV7N4KRVXVu6H9GssHI4m6v6mwTGO3cu4gsojzr2OSzoEryixJfjb
	 NpZzaAOoJcIWx2/C0lx0Vqir9ub0YHAqj8w46XnMGx+tzuHKGuP6u/RPR5ZsQTvWiO
	 0iaRHn+FkuAm9xJNxWkGXdwOGHb5h0nVLjor90w6cwsPHBpitKqEUbnoClLtbG9qy6
	 Y7pyQyENmtwtg==
Date: Thu, 25 Sep 2025 12:33:31 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Feng Yang <yangfeng59949@163.com>
Cc: rostedt@goodmis.org, mark.rutland@arm.com, catalin.marinas@arm.com,
 will@kernel.org, revest@chromium.org, alexei.starovoitov@gmail.com,
 olsajiri@gmail.com, andrii@kernel.org, ast@kernel.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH] tracing: Fix the bug where bpf_get_stackid returns
 -EFAULT on the ARM64
Message-Id: <20250925123331.f4158581bd488ca0ba838d1c@kernel.org>
In-Reply-To: <20250925020822.119302-1-yangfeng59949@163.com>
References: <20250925020822.119302-1-yangfeng59949@163.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_203337_326926_247A4251 
X-CRM114-Status: GOOD (  23.86  )
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

On Thu, 25 Sep 2025 10:08:22 +0800
Feng Yang <yangfeng59949@163.com> wrote:

> From: Feng Yang <yangfeng@kylinos.cn>
> 
> When using bpf_program__attach_kprobe_multi_opts on ARM64 to hook a BPF program
> that contains the bpf_get_stackid function, the BPF program fails
> to obtain the stack trace and returns -EFAULT.
> 
> This is because ftrace_partial_regs omits the configuration of the pstate register,
> leaving pstate at the default value of 0. When get_perf_callchain executes,
> it uses user_mode(regs) to determine whether it is in kernel mode.
> This leads to a misjudgment that the code is in user mode,
> so perf_callchain_kernel is not executed and the function returns directly.
> As a result, trace->nr becomes 0, and finally -EFAULT is returned.
> 
> Therefore, the assignment of the pstate register is added here.
> 
> Fixes: b9b55c8912ce ("tracing: Add ftrace_partial_regs() for converting ftrace_regs to pt_regs")
> Closes: https://lore.kernel.org/bpf/20250919071902.554223-1-yangfeng59949@163.com/
> Signed-off-by: Feng Yang <yangfeng@kylinos.cn>

Thanks for fixing!

Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

This is actually a fix for arm64. So I think it will be
merged via arm64 tree, right?

Thank you,

> ---
>  arch/arm64/include/asm/ftrace.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/include/asm/ftrace.h b/arch/arm64/include/asm/ftrace.h
> index bfe3ce9df197..ba7cf7fec5e9 100644
> --- a/arch/arm64/include/asm/ftrace.h
> +++ b/arch/arm64/include/asm/ftrace.h
> @@ -153,6 +153,7 @@ ftrace_partial_regs(const struct ftrace_regs *fregs, struct pt_regs *regs)
>  	regs->pc = afregs->pc;
>  	regs->regs[29] = afregs->fp;
>  	regs->regs[30] = afregs->lr;
> +	regs->pstate = PSR_MODE_EL1h;
>  	return regs;
>  }
>  
> -- 
> 2.25.1
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

