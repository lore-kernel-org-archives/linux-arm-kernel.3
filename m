Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06EF9D7496B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 09:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9oGgjLnB4BRLCSerYoS0OtPGacv8L+vjRrbT/ZyiNdM=; b=Huk8YO9E2vvR94aSrA2G5NgoTc
	ksTnbt0HCxTyC/W7DHW7E4uMg3NvjZtB6JAxxJ5dZ7BrA/T7HI6eVTkpfi95OXqt3jGrgG86Bdf+e
	k8VNf5y8WJ/S9T2HEv/YcRXCb64c46ixHSxqTDbHA7O74LdgyFi+SeQ0+wbP6k31pCwwr2pVjGm9I
	e7GVAjIC6erc93srxEQ+vmFHi+eK8ISYRUu2a76ESTpVRwNpGhAxDRndLV77+wJ7z9Zj+BWfsZXlK
	miCfZJlWODQ4xJfjXVx08Mum1vV4/QZbq60i78GXNiyWw5EYjpwmdnIjhajPu+V2T1PmSQP3rFirE
	k/hoGthA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWmN-00000009wsS-2T8A;
	Fri, 19 Dec 2025 09:28:08 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWmG-00000009wor-4C86
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 09:28:02 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-42e2d52c24dso671539f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 01:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766136479; x=1766741279; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9oGgjLnB4BRLCSerYoS0OtPGacv8L+vjRrbT/ZyiNdM=;
        b=UmdaYnw3O64/Ejjy7bUIk3HhG1p9+PFV5dya/iNsaPmOePtpDKzNAJCF9q2diKqY24
         aY6LyZKcs89VVZXDKTXZh7QMHyfS6P2EV7BXBcBoyAQXLp5hfveRxuecYoTT2raiTdgP
         9IOGAsLeTn/+L9+SbDb3g+v3n5eZ0Mr6wCX+sbfg8M1hXwnruUzwZSV64ZOtZBkB5lr/
         +oylWirYBwG2JlAQkVQxdK3gX+h8+qSY3yChVkT2TZ2LX2EDv1LOLZWzMzHdYsY9MAna
         irM6d5V1P6tj11dn2dhfAc6Y5J+Cq43YkMJd6ZHs9Ih/8Mqr9zST5VxcJnAVTuUkJyeH
         sjjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766136479; x=1766741279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9oGgjLnB4BRLCSerYoS0OtPGacv8L+vjRrbT/ZyiNdM=;
        b=dDAOIapFY20rbM2vEO//VADKY9ArzD42vDpLvwxhMJ1/sT4dz1Jjo4iWDGfa8MhqYV
         5rDqNyiCdk0QWa4s0YJQ17GEUA8cfIUgL4v/vP5QuAmRTB/QHFQDE8G4lHluOp4KrTqr
         5/FZMRQVeroa+tupO9A7z06QrRN+e7NOG7M5rNRZurTy1gEiZZxoFoGG+LDyqi12KT8k
         ZPPGbUlOpONDC53qpoJmAWR5yZ93ZpsT0cKjr+ZRSqtHQ6NtcOfhTQisLWkGKjlDICoi
         tFyWs/m24UaQKsyGOOmAfpkH5hRUnxNgGAHDHK0bBERFxHy1YDaLCruqwlTlwd9EBUej
         Z6RQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbTvDaktZ92YbygCwLuu7//4h77Se2/tRc/FNABrX1m1EafWyWIuG9ErxW0KiiasmKeZqksNuyMvJK9ACfnd2i@lists.infradead.org
X-Gm-Message-State: AOJu0YwepTd63GgxVqcs9BLVjR8yLbJauECQF0/FOIIG9/3uqKD8vamB
	ccqkAJ791xWFOsleNap3zfwxi9sOtLU90d8knclyY7SJzlzbtnk2OVXU
X-Gm-Gg: AY/fxX6/dIQ96LIuikVoEEzer/Sp1ScO4UPtm1Y8ufNqk4sv971dHYvSV6Gz4A2i6Ft
	D3ZTo+yQfUS4hwp8nR2Jvmt+W5vHDSa8/PXtXUtA9x7qBVExeV2XuvhKnQvjxoY6cOe1/Hpt+aa
	CxhIZ20DrmIy4sAAYtJhvkYIqlyFg5/sPvCWLpVtE5VbG/8yKiBKbzSwxwrgK/QLMsQ7KE7D4ZG
	wCgXV7J8VuUDlWQ/AaK0GnureVUHKyCCyRxYIJ16tpESHag1mt+NcD4XoSqbv8XUW6A3wT7PncR
	cN/GlEx67lyFQwKCIDCPbzOsxBqAuG4pcEsG81qHXQi9o7LD3QEJYry82UaS7JVvceSxwuR5zdS
	xvsTh0055Hx6lqDnD0lN25lsgR8HBYAVkPgEsvEHp8EaYhRoJdLSnZuiEWCJz
X-Google-Smtp-Source: AGHT+IFl2szXlrHSULap4BBtRF/o7UsYp3zfggM0fI3SQpbqWNjjL70eotggPkLeDniNhGFRNl34Jw==
X-Received: by 2002:a05:6000:2404:b0:42f:bb3f:c5f1 with SMTP id ffacd0b85a97d-4324e506738mr2441194f8f.44.1766136478888;
        Fri, 19 Dec 2025 01:27:58 -0800 (PST)
Received: from krava ([2a02:8308:a00c:e200::b44f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b1bdsm3845068f8f.8.2025.12.19.01.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 01:27:58 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Fri, 19 Dec 2025 10:27:56 +0100
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Steven Rostedt <rostedt@kernel.org>, Florent Revest <revest@google.com>,
	Mark Rutland <mark.rutland@arm.com>, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Menglong Dong <menglong8.dong@gmail.com>,
	Song Liu <song@kernel.org>
Subject: Re: [PATCHv5 bpf-next 9/9] bpf,x86: Use single ftrace_ops for direct
 calls
Message-ID: <aUUanPijlWsDlS0X@krava>
References: <20251215211402.353056-1-jolsa@kernel.org>
 <20251215211402.353056-10-jolsa@kernel.org>
 <20251218112608.11a14a4a@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218112608.11a14a4a@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_012801_766444_09C66141 
X-CRM114-Status: GOOD (  44.33  )
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

On Thu, Dec 18, 2025 at 11:26:08AM -0500, Steven Rostedt wrote:
> On Mon, 15 Dec 2025 22:14:02 +0100
> Jiri Olsa <jolsa@kernel.org> wrote:
> 
> > Using single ftrace_ops for direct calls update instead of allocating
> > ftrace_ops object for each trampoline.
> > 
> > With single ftrace_ops object we can use update_ftrace_direct_* api
> > that allows multiple ip sites updates on single ftrace_ops object.
> > 
> > Adding HAVE_SINGLE_FTRACE_DIRECT_OPS config option to be enabled on
> > each arch that supports this.
> > 
> > At the moment we can enable this only on x86 arch, because arm relies
> > on ftrace_ops object representing just single trampoline image (stored
> > in ftrace_ops::direct_call). Ach that do not support this will continue
> 
> My back "Ach" and doesn't support me well. ;-)

heh, should have been 'Archs' ;-)

> 
> > to use *_ftrace_direct api.
> > 
> > Signed-off-by: Jiri Olsa <jolsa@kernel.org>
> > ---
> >  arch/x86/Kconfig        |   1 +
> >  kernel/bpf/trampoline.c | 195 ++++++++++++++++++++++++++++++++++------
> >  kernel/trace/Kconfig    |   3 +
> >  kernel/trace/ftrace.c   |   7 +-
> >  4 files changed, 177 insertions(+), 29 deletions(-)
> > 
> > diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> > index 17a107cc5244..d0c36e49e66e 100644
> > --- a/arch/x86/Kconfig
> > +++ b/arch/x86/Kconfig
> > @@ -335,6 +335,7 @@ config X86
> >  	select SCHED_SMT			if SMP
> >  	select ARCH_SUPPORTS_SCHED_CLUSTER	if SMP
> >  	select ARCH_SUPPORTS_SCHED_MC		if SMP
> > +	select HAVE_SINGLE_FTRACE_DIRECT_OPS	if X86_64 && DYNAMIC_FTRACE_WITH_DIRECT_CALLS
> 
> You can remove the "&& DYNAMIC_FTRACE_WITH_DIRECT_CALLS" part by having the
> config depend on it (see below).

...

> 
> >  
> >  config INSTRUCTION_DECODER
> >  	def_bool y
> > diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
> > index 17af2aad8382..02371db3db3e 100644
> > --- a/kernel/bpf/trampoline.c
> > +++ b/kernel/bpf/trampoline.c
> > @@ -33,12 +33,40 @@ static DEFINE_MUTEX(trampoline_mutex);
> >  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
> >  static int bpf_trampoline_update(struct bpf_trampoline *tr, bool lock_direct_mutex);
> >  
> > +#ifdef CONFIG_HAVE_SINGLE_FTRACE_DIRECT_OPS
> 
> Make this:
> 
>  #ifdef CONFIG_SINGLE_FTRACE_DIRECT_OPS
> 
> for the suggested modification in the Kconfig below.
> 
> > +static struct bpf_trampoline *direct_ops_ip_lookup(struct ftrace_ops *ops, unsigned long ip)
> > +{
> > +	struct hlist_head *head_ip;
> > +	struct bpf_trampoline *tr;
> > +
> > +	mutex_lock(&trampoline_mutex);
> 
> 	guard(mutex)(&trampoline_mutex);

right, will change

> 
> > +	head_ip = &trampoline_ip_table[hash_64(ip, TRAMPOLINE_HASH_BITS)];
> > +	hlist_for_each_entry(tr, head_ip, hlist_ip) {
> > +		if (tr->ip == ip)
> 
> 			return NULL;
> 
> > +			goto out;
> > +	}
> 
> 
> > +	tr = NULL;
> > +out:
> > +	mutex_unlock(&trampoline_mutex);
> 
> No need for the above

yep

> 
> > +	return tr;
> > +}
> > +#else
> > +static struct bpf_trampoline *direct_ops_ip_lookup(struct ftrace_ops *ops, unsigned long ip)
> > +{
> > +	return ops->private;
> > +}
> > +#endif /* CONFIG_HAVE_SINGLE_FTRACE_DIRECT_OPS */
> > +
> >  static int bpf_tramp_ftrace_ops_func(struct ftrace_ops *ops, unsigned long ip,
> >  				     enum ftrace_ops_cmd cmd)
> >  {
> > -	struct bpf_trampoline *tr = ops->private;
> > +	struct bpf_trampoline *tr;
> >  	int ret = 0;
> >  
> > +	tr = direct_ops_ip_lookup(ops, ip);
> > +	if (!tr)
> > +		return -EINVAL;
> > +
> >  	if (cmd == FTRACE_OPS_CMD_ENABLE_SHARE_IPMODIFY_SELF) {
> >  		/* This is called inside register_ftrace_direct_multi(), so
> >  		 * tr->mutex is already locked.
> > @@ -137,6 +165,139 @@ void bpf_image_ksym_del(struct bpf_ksym *ksym)
> >  			   PAGE_SIZE, true, ksym->name);
> >  }
> >  
> > +#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
> > +#ifdef CONFIG_HAVE_SINGLE_FTRACE_DIRECT_OPS
> 
> Replace the above two with:
> 
>  #ifdef CONFIG_SINGLE_FTRACE_DIRECT_OPS

...

> 
> > +/*
> > + * We have only single direct_ops which contains all the direct call
> > + * sites and is the only global ftrace_ops for all trampolines.
> > + *
> > + * We use 'update_ftrace_direct_*' api for attachment.
> > + */
> > +struct ftrace_ops direct_ops = {
> > +	.ops_func = bpf_tramp_ftrace_ops_func,
> > +};
> > +
> > +static int direct_ops_alloc(struct bpf_trampoline *tr)
> > +{
> > +	tr->fops = &direct_ops;
> > +	return 0;
> > +}
> > +
> > +static void direct_ops_free(struct bpf_trampoline *tr) { }
> > +
> > +static struct ftrace_hash *hash_from_ip(struct bpf_trampoline *tr, void *ptr)
> > +{
> > +	unsigned long ip, addr = (unsigned long) ptr;
> > +	struct ftrace_hash *hash;
> > +
> > +	ip = ftrace_location(tr->ip);
> > +	if (!ip)
> > +		return NULL;
> > +	hash = alloc_ftrace_hash(FTRACE_HASH_DEFAULT_BITS);
> > +	if (!hash)
> > +		return NULL;
> > +	if (bpf_trampoline_use_jmp(tr->flags))
> > +		addr = ftrace_jmp_set(addr);
> > +	if (!add_hash_entry_direct(hash, ip, addr)) {
> > +		free_ftrace_hash(hash);
> > +		return NULL;
> > +	}
> > +	return hash;
> > +}
> > +
> > +static int direct_ops_add(struct bpf_trampoline *tr, void *addr)
> > +{
> > +	struct ftrace_hash *hash = hash_from_ip(tr, addr);
> > +	int err = -ENOMEM;
> > +
> > +	if (hash)
> > +		err = update_ftrace_direct_add(tr->fops, hash);
> > +	free_ftrace_hash(hash);
> > +	return err;
> > +}
> 
> I think these functions would be cleaner as:
> 
> {
> 	struct ftrace_hash *hash = hash_from_ip(tr, addr);
> 	int err;
> 
> 	if (!hash)
> 		return -ENOMEM;
> 
> 	err = update_ftrace_direct_*(tr->fops, hash);
> 	free_ftrace_hash(hash);
> 	return err;
> }

np, will change

> 
> 
> > +
> > +static int direct_ops_del(struct bpf_trampoline *tr, void *addr)
> > +{
> > +	struct ftrace_hash *hash = hash_from_ip(tr, addr);
> > +	int err = -ENOMEM;
> > +
> > +	if (hash)
> > +		err = update_ftrace_direct_del(tr->fops, hash);
> > +	free_ftrace_hash(hash);
> > +	return err;
> > +}
> > +
> > +static int direct_ops_mod(struct bpf_trampoline *tr, void *addr, bool lock_direct_mutex)
> > +{
> > +	struct ftrace_hash *hash = hash_from_ip(tr, addr);
> > +	int err = -ENOMEM;
> > +
> > +	if (hash)
> > +		err = update_ftrace_direct_mod(tr->fops, hash, lock_direct_mutex);
> > +	free_ftrace_hash(hash);
> > +	return err;
> > +}
> > +#else
> > +/*
> > + * We allocate ftrace_ops object for each trampoline and it contains
> > + * call site specific for that trampoline.
> > + *
> > + * We use *_ftrace_direct api for attachment.
> > + */
> > +static int direct_ops_alloc(struct bpf_trampoline *tr)
> > +{
> > +	tr->fops = kzalloc(sizeof(struct ftrace_ops), GFP_KERNEL);
> > +	if (!tr->fops)
> > +		return -ENOMEM;
> > +	tr->fops->private = tr;
> > +	tr->fops->ops_func = bpf_tramp_ftrace_ops_func;
> > +	return 0;
> > +}
> > +
> > +static void direct_ops_free(struct bpf_trampoline *tr)
> > +{
> > +	if (tr->fops) {
> > +		ftrace_free_filter(tr->fops);
> > +		kfree(tr->fops);
> > +	}
> > +}
> 
> Why not:
> 
> static void direct_ops_free(struct bpf_trampoline *tr)
> {
> 	if (!tr->fops)
> 		return;
> 
> 	ftrace_free_filter(tr->fops);
> 	kfree(tr->fops);
> }

same pattern like above, ok

> 
>  ?
> 
> > +
> > +static int direct_ops_add(struct bpf_trampoline *tr, void *ptr)
> > +{
> > +	unsigned long addr = (unsigned long) ptr;
> > +	struct ftrace_ops *ops = tr->fops;
> > +	int ret;
> > +
> > +	if (bpf_trampoline_use_jmp(tr->flags))
> > +		addr = ftrace_jmp_set(addr);
> > +
> > +	ret = ftrace_set_filter_ip(ops, tr->ip, 0, 1);
> > +	if (ret)
> > +		return ret;
> > +	return register_ftrace_direct(ops, addr);
> > +}
> > +
> > +static int direct_ops_del(struct bpf_trampoline *tr, void *addr)
> > +{
> > +	return unregister_ftrace_direct(tr->fops, (long)addr, false);
> > +}
> > +
> > +static int direct_ops_mod(struct bpf_trampoline *tr, void *ptr, bool lock_direct_mutex)
> > +{
> > +	unsigned long addr = (unsigned long) ptr;
> > +	struct ftrace_ops *ops = tr->fops;
> > +
> > +	if (bpf_trampoline_use_jmp(tr->flags))
> > +		addr = ftrace_jmp_set(addr);
> > +	if (lock_direct_mutex)
> > +		return modify_ftrace_direct(ops, addr);
> > +	return modify_ftrace_direct_nolock(ops, addr);
> > +}
> > +#endif /* CONFIG_HAVE_SINGLE_FTRACE_DIRECT_OPS */
> > +#else
> > +static void direct_ops_free(struct bpf_trampoline *tr) { }
> 
> This is somewhat inconsistent with direct_ops_alloc() that has:
> 
> #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
> 	if (direct_ops_alloc(tr)) {
> 		kfree(tr);
> 		tr = NULL;
> 		goto out;
> 	}
> #endif
> 
> Now, if you wrap the direct_ops_free() too, we can remove the
>  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
> part with my kconfig suggestion. Otherwise keep the kconfig as is, but I
> would add a stub function for direct_ops_alloc() too.

ah right.. I think let's do the kconfig change you suggest to make
this simpler

> 
> > +#endif /* CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS */
> > +
> >  static struct bpf_trampoline *bpf_trampoline_lookup(u64 key, unsigned long ip)
> >  {
> >  	struct bpf_trampoline *tr;
> > @@ -155,14 +316,11 @@ static struct bpf_trampoline *bpf_trampoline_lookup(u64 key, unsigned long ip)
> >  	if (!tr)
> >  		goto out;
> >  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
> > -	tr->fops = kzalloc(sizeof(struct ftrace_ops), GFP_KERNEL);
> > -	if (!tr->fops) {
> > +	if (direct_ops_alloc(tr)) {
> >  		kfree(tr);
> >  		tr = NULL;
> >  		goto out;
> >  	}
> > -	tr->fops->private = tr;
> > -	tr->fops->ops_func = bpf_tramp_ftrace_ops_func;
> >  #endif
> >  
> >  	tr->key = key;
> > @@ -206,7 +364,7 @@ static int unregister_fentry(struct bpf_trampoline *tr, u32 orig_flags,
> >  	int ret;
> >  
> >  	if (tr->func.ftrace_managed)
> > -		ret = unregister_ftrace_direct(tr->fops, (long)old_addr, false);
> > +		ret = direct_ops_del(tr, old_addr);
> 
> Doesn't this need a wrapper too?

yep

> 
> >  	else
> >  		ret = bpf_trampoline_update_fentry(tr, orig_flags, old_addr, NULL);
> >  
> > @@ -220,15 +378,7 @@ static int modify_fentry(struct bpf_trampoline *tr, u32 orig_flags,
> >  	int ret;
> >  
> >  	if (tr->func.ftrace_managed) {
> > -		unsigned long addr = (unsigned long) new_addr;
> > -
> > -		if (bpf_trampoline_use_jmp(tr->flags))
> > -			addr = ftrace_jmp_set(addr);
> > -
> > -		if (lock_direct_mutex)
> > -			ret = modify_ftrace_direct(tr->fops, addr);
> > -		else
> > -			ret = modify_ftrace_direct_nolock(tr->fops, addr);
> > +		ret = direct_ops_mod(tr, new_addr, lock_direct_mutex);
> 
> and this.
> 
> >  	} else {
> >  		ret = bpf_trampoline_update_fentry(tr, orig_flags, old_addr,
> >  						   new_addr);
> > @@ -251,15 +401,7 @@ static int register_fentry(struct bpf_trampoline *tr, void *new_addr)
> >  	}
> >  
> >  	if (tr->func.ftrace_managed) {
> > -		unsigned long addr = (unsigned long) new_addr;
> > -
> > -		if (bpf_trampoline_use_jmp(tr->flags))
> > -			addr = ftrace_jmp_set(addr);
> > -
> > -		ret = ftrace_set_filter_ip(tr->fops, (unsigned long)ip, 0, 1);
> > -		if (ret)
> > -			return ret;
> > -		ret = register_ftrace_direct(tr->fops, addr);
> > +		ret = direct_ops_add(tr, new_addr);
> 
> Ditto.

yes

> 
> >  	} else {
> >  		ret = bpf_trampoline_update_fentry(tr, 0, NULL, new_addr);
> >  	}
> > @@ -910,10 +1052,7 @@ void bpf_trampoline_put(struct bpf_trampoline *tr)
> >  	 */
> >  	hlist_del(&tr->hlist_key);
> >  	hlist_del(&tr->hlist_ip);
> > -	if (tr->fops) {
> > -		ftrace_free_filter(tr->fops);
> > -		kfree(tr->fops);
> > -	}
> > +	direct_ops_free(tr);
> >  	kfree(tr);
> >  out:
> >  	mutex_unlock(&trampoline_mutex);
> > diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
> > index 4661b9e606e0..1ad2e307c834 100644
> > --- a/kernel/trace/Kconfig
> > +++ b/kernel/trace/Kconfig
> > @@ -50,6 +50,9 @@ config HAVE_DYNAMIC_FTRACE_WITH_REGS
> >  config HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
> >  	bool
> >  
> > +config HAVE_SINGLE_FTRACE_DIRECT_OPS
> > +	bool
> > +
> 
> Now you could add:
> 
>   config SINGLE_FTRACE_DIRECT_OPS
> 	bool
> 	default y
> 	depends on HAVE_SINGLE_FTRACE_DIRECT_OPS && DYNAMIC_FTRACE_WITH_DIRECT_CALLS

ok, the dependency is more ovbvious, will change

thanks,
jirka

