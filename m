Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549A0D64091
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 08:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WyEicKDWvbOdhrtnqhenW6ok8Fe3+pewjhCT1n7IggM=; b=wZiETdisYUKyaCkSPRWpeuHcR9
	GJE66XH+BZ6qdmBFC5Q7BB4+OLFiLa8+YRDkmP/aNdmyheLJvPoARXYBLNQET2oSvt5eiGEZb66Bs
	JxHLQ7CHLTfqHYOHRGb9Fkxl/MsRBQ3rVtSNYzphKe5Aq7eJQ/hU/DsbL5FWX8sE/7zi2vFBpncSt
	1jexLUioDMFQAcAs+p0dVCmFyEwjg7rplbWciABwkluh1gYu1icu2rCMNLPQQzKkSnA4hLTFU18JC
	ZTg0CnOHvpCR+IRgAGfaWgZxn1uzeai0ETLNTekXVw31eEDHftwbIyhaVmZWUInL81F/r8DIefG+t
	+ckq7qrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVn55-00000006Ml9-2sDN;
	Wed, 17 Dec 2025 08:40:23 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVn53-00000006Mk2-0iIy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 08:40:22 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-430f2ee2f00so1915698f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 00:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765960819; x=1766565619; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WyEicKDWvbOdhrtnqhenW6ok8Fe3+pewjhCT1n7IggM=;
        b=dQYbjlm9I4pblOgoAlwpyXMwSlM5CrBroEw4SZyVLmGo6WakmSALEs7jA7v/IwBEmj
         IAi2PUMyqw2jHeIclD3Dg9HOnuS5weqzvnpo3d5z2wm/VgMpMXb0MaJg/faJ4iT6J/UM
         IFTZa6n2qVc6hmdfa4NbYWU2viEEfj8n5hyG7lHRVk2Pg59uCRpvHz6JrEjyWNubHtP7
         WZnO6nmHs7bjnme0AJDHiVEshoD9XkaRVGrgqWBZlO+y30sE96RQYuqseCGQpRrx1NT2
         gCjsRFK6XUnzm9GVta3ZimdrvrI23h5qU3cQlBiGpiL2YXYOWung/o/cuJfAPorWnFUO
         J4ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765960819; x=1766565619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WyEicKDWvbOdhrtnqhenW6ok8Fe3+pewjhCT1n7IggM=;
        b=rfxSlfe5M0NHVLqgJpM+qucIujzh6KdM5zQXgU0iMkvKP9dWSJjavWvB+J59y/oOOp
         /a6OaitctwS5J/EAKY5pUShuazr6kaavgc84IA52hgpuhyMBry+yUnMoOEeGS5gWCroF
         MPxCBqOX8LTGcOGjFBotWkGr48rJur95jkIySISWOrkYPyXp1ojQi1GeY8utemL2H6rv
         fRVO3g/ZC3WjVPHErDSzQItxRwUWlwsXfZOk6ur7mB/mJudYprLwxU6gQhl5pgjM9TlI
         ZtP7c2tAzFtzFqW4gzvU78Z0Z7/4/oP+xGuGWTU9aBpRsfSS+E8Jm3Lc48sqRQfe1m1r
         lrxw==
X-Forwarded-Encrypted: i=1; AJvYcCUB3uc9YY+O0iro27OIaHsRkmGdI13RJBbvnzqs23qHb1fnx3hhQXUzGgrxuIhen8GaSOF6+WGlia/8b042Ykfe@lists.infradead.org
X-Gm-Message-State: AOJu0YxNONc8XS1EOQB/guaoewiisMzHfxJVg9rL/1ULVpic9zF6bnnk
	LetxHvgVQzaj0WbBJE03xAwbpnHnxmRycLF/JsRYzB8KrEpXmSK+N2U9
X-Gm-Gg: AY/fxX4sowIUe4AjOm27f1O4bYYnX1LpE67A6BAvXm9WeV6uBbu5gRrULj8CmaR31JA
	baPpq/S2DKKSJv64H/eYn2ld2IEVJb0iumT6YZ7Gl0bScweNPX8qkE/GHTUTSaVGNpZoErhaL27
	uT4+Fs6q8SRX52kEZaco/YCHc7Wu5f3jiGUSGo+/4Xr+FUeiymdxWdlcJBGPjnRFnHwP23fjyRa
	ck/3Cs4N9cWFTNyXsQpTeXzROWVnTqtKrXWYVr0uWYZhveK1UJ3iPg0+JmvXRxfrJiUiOvrR/oy
	+rHdAh72WgDEHkJzb3aXFejDSDFNJxZOwsqOVVm7DUdYRrzm/t9Yubj0GpKAU4Z3nYsAyDT2VBR
	EEc4fq3Pa8LUwAwa2/cCzDB24WdBdkR5vVxKLKX4s7vs9iO3st+TG18Whpd1zfv7atwGPeUd6hR
	bbyf25F3noPQ==
X-Google-Smtp-Source: AGHT+IGoh419rwOYueEWLJrPRU9q7UxlpRrhqIOwtlvWqYF627uT3OFlm5Gvl02pYhi1ZP6rxwR5NA==
X-Received: by 2002:a05:6000:26cd:b0:431:35a:4a97 with SMTP id ffacd0b85a97d-431035a4dcdmr5954508f8f.59.1765960818614;
        Wed, 17 Dec 2025 00:40:18 -0800 (PST)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4310adacfbbsm3637780f8f.12.2025.12.17.00.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 00:40:18 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 17 Dec 2025 09:40:15 +0100
To: bot+bpf-ci@kernel.org
Cc: rostedt@kernel.org, revest@google.com, mark.rutland@arm.com,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, ast@kernel.org,
	daniel@iogearbox.net, andrii@kernel.org, menglong8.dong@gmail.com,
	song@kernel.org, martin.lau@kernel.org, eddyz87@gmail.com,
	yonghong.song@linux.dev, clm@meta.com, ihor.solodrai@linux.dev
Subject: Re: [PATCHv5 bpf-next 1/9] ftrace,bpf: Remove FTRACE_OPS_FL_JMP
 ftrace_ops flag
Message-ID: <aUJsb2up5zHDfIpC@krava>
References: <20251215211402.353056-2-jolsa@kernel.org>
 <95c13c0b793604796037ca67c191e1bfce22770dd020107c7179a698c5d49b91@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95c13c0b793604796037ca67c191e1bfce22770dd020107c7179a698c5d49b91@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_004021_243222_AA13D26B 
X-CRM114-Status: GOOD (  23.47  )
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

On Mon, Dec 15, 2025 at 09:31:51PM +0000, bot+bpf-ci@kernel.org wrote:
> > diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
> > index 015dd1049bea..505b7d3f5641 100644
> > --- a/include/linux/ftrace.h
> > +++ b/include/linux/ftrace.h
> 
> [ ... ]
> 
> > diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
> > index 976d89011b15..b9a358d7a78f 100644
> > --- a/kernel/bpf/trampoline.c
> > +++ b/kernel/bpf/trampoline.c
> > @@ -214,10 +214,15 @@ static int modify_fentry(struct bpf_trampoline *tr, u32 orig_flags,
> >  	int ret;
> >
> >  	if (tr->func.ftrace_managed) {
> > +		unsigned long addr = (unsigned long) new_addr;
> > +
> > +		if (bpf_trampoline_use_jmp(tr->flags))
> > +			addr = ftrace_jmp_set(addr);
> > +
> >  		if (lock_direct_mutex)
> > -			ret = modify_ftrace_direct(tr->fops, (long)new_addr);
> > +			ret = modify_ftrace_direct(tr->fops, addr);
> >  		else
> > -			ret = modify_ftrace_direct_nolock(tr->fops, (long)new_addr);
> > +			ret = modify_ftrace_direct_nolock(tr->fops, addr);
> >  	} else {
> >  		ret = bpf_trampoline_update_fentry(tr, orig_flags, old_addr,
> >  						   new_addr);
> > @@ -240,10 +245,15 @@ static int register_fentry(struct bpf_trampoline *tr, void *new_addr)
> >  	}
> >
> >  	if (tr->func.ftrace_managed) {
> > +		unsigned long addr = (unsigned long) new_addr;
> > +
> > +		if (bpf_trampoline_use_jmp(tr->flags))
> > +			addr = ftrace_jmp_set(addr);
> > +
> >  		ret = ftrace_set_filter_ip(tr->fops, (unsigned long)ip, 0, 1);
> >  		if (ret)
> >  			return ret;
> > -		ret = register_ftrace_direct(tr->fops, (long)new_addr);
> > +		ret = register_ftrace_direct(tr->fops, addr);
> >  	} else {
> >  		ret = bpf_trampoline_update_fentry(tr, 0, NULL, new_addr);
> >  	}
> 
> After this change, register_ftrace_direct() receives an address with
> the LSB bit already set (via ftrace_jmp_set) and stores it as-is in
> entry->direct. This address then flows through to ftrace_find_rec_direct()
> which returns entry->direct unchanged.
> 
> In available_filter_functions_show():

hum, there's no such function.. AFAICS it's t_show called through
ftrace_avail_fops->ftrace_avail_open->show_ftrace_seq_ops

> 
>     direct = ftrace_find_rec_direct(rec->ip);
>     if (direct)
>         seq_printf(m, "\n\tdirect-->%pS", (void *)direct);
> 

but yep, it's related problem, that Menglong said he will address in
separate patch

thanks,
jirka

> Can the debug output show misleading symbol offsets? When the LSB is
> set, %pS will resolve addresses like "function+0x1" instead of just
> "function". This makes ftrace debug output harder to read for users
> trying to understand direct call attachments.
> 
> The fix would be to strip the LSB bit before printing:
>     seq_printf(m, "\n\tdirect-->%pS", (void *)ftrace_jmp_get(direct));
> 
> [ ... ]
> 
> > diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> > index bbb37c0f8c6c..b0dc911411f1 100644
> > --- a/kernel/trace/ftrace.c
> > +++ b/kernel/trace/ftrace.c
> > @@ -6017,15 +6017,8 @@ int register_ftrace_direct(struct ftrace_ops *ops, unsigned long addr)
> >  	if (ftrace_hash_empty(hash))
> >  		return -EINVAL;
> >
> > -	/* This is a "raw" address, and this should never happen. */
> > -	if (WARN_ON_ONCE(ftrace_is_jmp(addr)))
> > -		return -EINVAL;
> > -
> >  	mutex_lock(&direct_mutex);
> >
> > -	if (ops->flags & FTRACE_OPS_FL_JMP)
> > -		addr = ftrace_jmp_set(addr);
> > -
> >  	/* Make sure requested entries are not already registered.. */
> >  	size = 1 << hash->size_bits;
> >  	for (i = 0; i < size; i++) {
> 
> [ ... ]
> 
> > @@ -6146,13 +6139,6 @@ __modify_ftrace_direct(struct ftrace_ops *ops, unsigned long addr)
> >
> >  	lockdep_assert_held_once(&direct_mutex);
> >
> > -	/* This is a "raw" address, and this should never happen. */
> > -	if (WARN_ON_ONCE(ftrace_is_jmp(addr)))
> > -		return -EINVAL;
> > -
> > -	if (ops->flags & FTRACE_OPS_FL_JMP)
> > -		addr = ftrace_jmp_set(addr);
> > -
> >  	/* Enable the tmp_ops to have the same functions as the direct ops */
> >  	ftrace_ops_init(&tmp_ops);
> >  	tmp_ops.func_hash = ops->func_hash;
> 
> [ ... ]
> 
> 
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/20247816064


