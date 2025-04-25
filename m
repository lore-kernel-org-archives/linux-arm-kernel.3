Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1098DC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 22:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6wnzxYcH1nOh1H2nt8pYoGaHckTyTgqydYQnbC7Xk7o=; b=j3YMDSBkSPhc8MCqhjbNaDxgs0
	sySuznMIX5Y+ucQLQ50XOXV+Mi0Xx1cwRRu0I8j9gPOb7QOJF+QsV/QORQVHGK9dSrgh0AmEFtJiq
	ZMBNoYJxW9mtA2/3h5mmurrSGT5hnQtUCu4vzcU5/oRYgT3mSMwSiKjbjTmqg04OoxxjGPlSCGgS4
	ROXgKkudToJZWUEUghP5lh84tnYDWDEGvxnkealI6YCba0ohXb07wV6X8HvTGbXKCTrWOj8dWCTGp
	uaXdgJeWD0UMVvq8CtTMelG+qDkfxVd89wu8YSdMR+tKaOYe5/Y28XIz5d22grMG7f0ELbL86oJ7K
	pvkOm4Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8RsJ-000000014yv-2uec;
	Fri, 25 Apr 2025 22:50:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8RqS-000000014r8-02fQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 22:48:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 938725C6D0C;
	Fri, 25 Apr 2025 22:46:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 619FBC4CEE4;
	Fri, 25 Apr 2025 22:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745621310;
	bh=uZ7Nij1He0NEHxrCoUqJ8etb02FXoOVlBiScFBXmcTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GuF+Vo47m67DiYMeumVcO4FoO3N+IdYgOhgA5lt1ClG52fex9iKKO/TDekvw7jCKP
	 TdnRYe5CnKWMna9pi9K5WZAN7PJn7004Vmm412j2RlKgGWbVuA1q6nQ5JgzgQBVvmi
	 pwyzMtsVsu1eNCGpz5hEKOO8IqPDcNBJ/r4eoesPUEKknn4NRPyRoYVuIZ5Sw8e14Z
	 Rx77qY+RnVKyeooD3IIX7ShvLd3fhePPOnhHRELs6mCEld/6hanBmoWD64PA+cdVnF
	 1RMs2+n+sZpY/XhGDc3QbL4RsjC7KXzHYhZjQ88hsQK4oeD5Z5a4P7UELTI6VOaa0V
	 Nl+rcLX+lGJpQ==
Date: Fri, 25 Apr 2025 15:48:27 -0700
From: Kees Cook <kees@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux-MM <linux-mm@kvack.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: BUG: vdso changes expose elf mapping issue
Message-ID: <202504251546.FC8A40CB98@keescook>
References: <f93db308-4a0e-4806-9faf-98f890f5a5e6@arm.com>
 <aAvWchSUlnAfg42x@arm.com>
 <202504251158.D3D342410@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202504251158.D3D342410@keescook>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_154832_104465_9E048A22 
X-CRM114-Status: GOOD (  17.15  )
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

On Fri, Apr 25, 2025 at 12:56:21PM -0700, Kees Cook wrote:
> For fixing the former, the below change might work (totally untested yet,
> I just wanted to reply with my thoughts as I start testing this). Pardon
> the goofy code style, I wanted a minimal diff here:
> 
> diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
> index 7e2afe3220f7..9290a29ede28 100644
> --- a/fs/binfmt_elf.c
> +++ b/fs/binfmt_elf.c
> @@ -1284,7 +1284,7 @@ static int load_elf_binary(struct linux_binprm *bprm)
>  	mm->end_data = end_data;
>  	mm->start_stack = bprm->p;
>  
> -	if ((current->flags & PF_RANDOMIZE) && (snapshot_randomize_va_space > 1)) {
> +	{
>  		/*
>  		 * For architectures with ELF randomization, when executing
>  		 * a loader directly (i.e. no interpreter listed in ELF
> @@ -1299,7 +1299,9 @@ static int load_elf_binary(struct linux_binprm *bprm)
>  			/* Otherwise leave a gap between .bss and brk. */
>  			mm->brk = mm->start_brk = mm->brk + PAGE_SIZE;
>  		}
> +	}
>  
> +	if ((current->flags & PF_RANDOMIZE) && (snapshot_randomize_va_space > 1)) {
>  		mm->brk = mm->start_brk = arch_randomize_brk(mm);
>  #ifdef compat_brk_randomized
>  		current->brk_randomized = 1;

Unsurprisingly, this patch was broken, but the idea appears to be
valid. This new patch works for me so far, though I haven't finished
getting Ubuntu 22.04 installed in an arm64 VM. Please let me know if
this fixes it:
https://lore.kernel.org/lkml/20250425224502.work.520-kees@kernel.org/

-- 
Kees Cook

