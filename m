Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40F8E9271B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 15:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m0JsthEvCkVhqHu4jZiKgW0AI5w7ORfH/FYCDkFLi2k=; b=Vsw7U9N8cRyJZwwc3FCm1Pl+Ax
	ZDJo1RZxTkUv1+sgmaZWdHG9XgOntWQ57WmXCL29s6YQRx4BCZcjVQU4LWinFuG3n5OkIFAhv8ptJ
	mAr7L6EpPNuMB254nsAcTZI78wHrTjwOghiC+SKMFW6LN2hL7myH9F6x9rY9LH1yojN6EI6qQLcG+
	7BTIRQNulmvf1/rCjbJ7enrxnCWG5HIotfl5wHvt56vXVY+5eoaafKYA6XbxBp/GuV+myOiHD9vBw
	xB4HPVHP+rqs+5S4ClS3kd3HPQeS6ZYu2X0yzz8Bv6HoK0vrqaKaZwSx7tXpQbMdWd5e1Dp6VEmlo
	IyvbeBdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZsbB-00000002qCO-2ZVh;
	Sun, 28 Dec 2025 15:22:25 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZsb9-00000002qBx-2FqZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Dec 2025 15:22:24 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-430f5ecaa08so3398351f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 07:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766935341; x=1767540141; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m0JsthEvCkVhqHu4jZiKgW0AI5w7ORfH/FYCDkFLi2k=;
        b=g26TpYEoy8hOabvqlz59MWzRLUyot5C7V5T8ayBRBkaVsnnfHF9Yr9gbQvqePH5s9L
         9bBiVxdg5W+NPkOTSHyqs4o3H5LRXjlK7RJhwH312Q3k+x/+5jQGt5mAW28KGnOBMtmb
         cwkORvpEFCvWWSfSdSzjAqzh6orZgzag5lZHYtANCxpTROjp5rIZHi107i3wH32VJYsL
         uyTzTHLf6KHbNfEaQZw4fIHC5E+ewlkuyYw0gfhiL+qyYP6y9pVq2Hv90qgktE8sPUKp
         YQfXvLXlcspgm9EoeRIHVDvv11VKzFFnzkHpQmjDf+TuqtwSXVmqxvA8Z+ybkxDdrLZL
         pzTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766935341; x=1767540141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m0JsthEvCkVhqHu4jZiKgW0AI5w7ORfH/FYCDkFLi2k=;
        b=IEe0XjdpAKUUgtg3rUN71NX7lIbqRhWqkYYlf4RUvtG4C0K1FFxKLvR3PWB8VS+uc0
         UVQDF/oRkPPdHEiwTsIjKGH8zStghl6VZRVyRlstNjTEFJ50qJ66xy1MYNonVELM3vdQ
         pj8zE3DsyzQn7zlKsNJXkdioNFFu7PieTt/8Z9GFGAqj9AWfks86xydlCFf/V1zeZmB0
         PWKaeG952ro7oCsmaHe5D/nBlEDfVRc3IE//lecg56Dzp3dxwofLAScbRpFHYqmmlnWl
         pCHVtYbv+s/L2xMOkOMEdY8hRLptIx1PGp5lzCKHeVm4iannlhWEsmtWw0S4lqbYUQOP
         XkTg==
X-Forwarded-Encrypted: i=1; AJvYcCWCfRGqFCMKUm5QKTGHPa6p8fjVlnw01IRj9BptP9iRUXthn+yj6rGqK/l1Hb89iateO2thRZh2Wsl160N89Vxx@lists.infradead.org
X-Gm-Message-State: AOJu0YwyvmPVNk5DBvp7PQ63tWWlCq6qSbJl6/a7YOUCZ5RTQSunqJYR
	pjLVHgORwYKg/bRaySAdl7ofMwjXDgdOzio9VKXQ0LC5doLnFW48ZwgC
X-Gm-Gg: AY/fxX7ZFbfdGbsd/vpoqIbHKCWfzG7IDxFdyyByOK52LUZqz1xHyS1gYpvC9x8DWKp
	RY1f6ht4wmFxDMUOrlqbVeTBrD75M2GUvZI62Qtj/R3qTKjWs+/J+fhqmL7ytKsjEgsZt3427it
	ab/5U0souWpHMGwrek4Hfhl0UHLzQTvYyRqbIEu8oaWO+T0ZdaZtnt8wsOBfMdlaY8cFUJm3iQk
	rrGTcy6UezRFDDV1fMRj1xBjQTr2IQqdmGyMzhZ4PH1msPMO6zD5YOhh2L2oUlxcxTyzWxKwO9z
	MbBsQ0LdHJ0m2O/rWn4vJ1XWp1EOjePxPrnm+5yjvp774E7Mk1F8fukqGpiSCifustp2lZYY7Ne
	i7V+iudV1Rh0bWKjxdGyLYteMbivs9FiVNHQWcNXsNOmjfFZ0p5iydwMx7R4V
X-Google-Smtp-Source: AGHT+IHPFPBsAIDT66UxfHwERHI9gdpoiahi8vYWrXU9Jwa5noosDFz27xahiNIPSDggzd0DkhI3xQ==
X-Received: by 2002:a05:6000:2907:b0:429:b751:7935 with SMTP id ffacd0b85a97d-4324e704a80mr36209592f8f.56.1766935340977;
        Sun, 28 Dec 2025 07:22:20 -0800 (PST)
Received: from krava ([2a02:8308:a00c:e200::b44f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b1b1sm56939366f8f.3.2025.12.28.07.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 07:22:20 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Sun, 28 Dec 2025 16:22:18 +0100
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Steven Rostedt <rostedt@kernel.org>,
	Florent Revest <revest@google.com>,
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
Message-ID: <aVFLKgZ56wt5aLci@krava>
References: <20251215211402.353056-1-jolsa@kernel.org>
 <20251215211402.353056-10-jolsa@kernel.org>
 <20251218112608.11a14a4a@gandalf.local.home>
 <aUUanPijlWsDlS0X@krava>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUUanPijlWsDlS0X@krava>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_072223_630274_336D9AF9 
X-CRM114-Status: GOOD (  23.81  )
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

On Fri, Dec 19, 2025 at 10:27:56AM +0100, Jiri Olsa wrote:

> > > diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
> > > index 4661b9e606e0..1ad2e307c834 100644
> > > --- a/kernel/trace/Kconfig
> > > +++ b/kernel/trace/Kconfig
> > > @@ -50,6 +50,9 @@ config HAVE_DYNAMIC_FTRACE_WITH_REGS
> > >  config HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
> > >  	bool
> > >  
> > > +config HAVE_SINGLE_FTRACE_DIRECT_OPS
> > > +	bool
> > > +
> > 
> > Now you could add:
> > 
> >   config SINGLE_FTRACE_DIRECT_OPS
> > 	bool
> > 	default y
> > 	depends on HAVE_SINGLE_FTRACE_DIRECT_OPS && DYNAMIC_FTRACE_WITH_DIRECT_CALLS
> 
> ok, the dependency is more ovbvious, will change
> 
> thanks,
> jirka

actualy, it seems that having it the original way with adding the rest
of the wrappers for !CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS case is
easier AFAICS

jirka


---
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 80527299f859..53bf2cf7ff6f 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -336,6 +336,7 @@ config X86
 	select SCHED_SMT			if SMP
 	select ARCH_SUPPORTS_SCHED_CLUSTER	if SMP
 	select ARCH_SUPPORTS_SCHED_MC		if SMP
+	select HAVE_SINGLE_FTRACE_DIRECT_OPS	if X86_64 && DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 
 config INSTRUCTION_DECODER
 	def_bool y
diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
index e5a0d58ed6dc..a8b3f510280a 100644
--- a/kernel/bpf/trampoline.c
+++ b/kernel/bpf/trampoline.c
@@ -33,12 +33,40 @@ static DEFINE_MUTEX(trampoline_mutex);
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 static int bpf_trampoline_update(struct bpf_trampoline *tr, bool lock_direct_mutex);
 
+#ifdef CONFIG_HAVE_SINGLE_FTRACE_DIRECT_OPS
+static struct bpf_trampoline *direct_ops_ip_lookup(struct ftrace_ops *ops, unsigned long ip)
+{
+	struct hlist_head *head_ip;
+	struct bpf_trampoline *tr;
+
+	mutex_lock(&trampoline_mutex);
+	head_ip = &trampoline_ip_table[hash_64(ip, TRAMPOLINE_HASH_BITS)];
+	hlist_for_each_entry(tr, head_ip, hlist_ip) {
+		if (tr->ip == ip)
+			goto out;
+	}
+	tr = NULL;
+out:
+	mutex_unlock(&trampoline_mutex);
+	return tr;
+}
+#else
+static struct bpf_trampoline *direct_ops_ip_lookup(struct ftrace_ops *ops, unsigned long ip)
+{
+	return ops->private;
+}
+#endif /* CONFIG_HAVE_SINGLE_FTRACE_DIRECT_OPS */
+
 static int bpf_tramp_ftrace_ops_func(struct ftrace_ops *ops, unsigned long ip,
 				     enum ftrace_ops_cmd cmd)
 {
-	struct bpf_trampoline *tr = ops->private;
+	struct bpf_trampoline *tr;
 	int ret = 0;
 
+	tr = direct_ops_ip_lookup(ops, ip);
+	if (!tr)
+		return -EINVAL;
+
 	if (cmd == FTRACE_OPS_CMD_ENABLE_SHARE_IPMODIFY_SELF) {
 		/* This is called inside register_ftrace_direct_multi(), so
 		 * tr->mutex is already locked.
@@ -137,6 +165,159 @@ void bpf_image_ksym_del(struct bpf_ksym *ksym)
 			   PAGE_SIZE, true, ksym->name);
 }
 
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+#ifdef CONFIG_HAVE_SINGLE_FTRACE_DIRECT_OPS
+/*
+ * We have only single direct_ops which contains all the direct call
+ * sites and is the only global ftrace_ops for all trampolines.
+ *
+ * We use 'update_ftrace_direct_*' api for attachment.
+ */
+struct ftrace_ops direct_ops = {
+	.ops_func = bpf_tramp_ftrace_ops_func,
+};
+
+static int direct_ops_alloc(struct bpf_trampoline *tr)
+{
+	tr->fops = &direct_ops;
+	return 0;
+}
+
+static void direct_ops_free(struct bpf_trampoline *tr) { }
+
+static struct ftrace_hash *hash_from_ip(struct bpf_trampoline *tr, void *ptr)
+{
+	unsigned long ip, addr = (unsigned long) ptr;
+	struct ftrace_hash *hash;
+
+	ip = ftrace_location(tr->ip);
+	if (!ip)
+		return NULL;
+	hash = alloc_ftrace_hash(FTRACE_HASH_DEFAULT_BITS);
+	if (!hash)
+		return NULL;
+	if (bpf_trampoline_use_jmp(tr->flags))
+		addr = ftrace_jmp_set(addr);
+	if (!add_ftrace_hash_entry_direct(hash, ip, addr)) {
+		free_ftrace_hash(hash);
+		return NULL;
+	}
+	return hash;
+}
+
+static int direct_ops_add(struct bpf_trampoline *tr, void *addr)
+{
+	struct ftrace_hash *hash = hash_from_ip(tr, addr);
+	int err = -ENOMEM;
+
+	if (hash)
+		err = update_ftrace_direct_add(tr->fops, hash);
+	free_ftrace_hash(hash);
+	return err;
+}
+
+static int direct_ops_del(struct bpf_trampoline *tr, void *addr)
+{
+	struct ftrace_hash *hash = hash_from_ip(tr, addr);
+	int err = -ENOMEM;
+
+	if (hash)
+		err = update_ftrace_direct_del(tr->fops, hash);
+	free_ftrace_hash(hash);
+	return err;
+}
+
+static int direct_ops_mod(struct bpf_trampoline *tr, void *addr, bool lock_direct_mutex)
+{
+	struct ftrace_hash *hash = hash_from_ip(tr, addr);
+	int err = -ENOMEM;
+
+	if (hash)
+		err = update_ftrace_direct_mod(tr->fops, hash, lock_direct_mutex);
+	free_ftrace_hash(hash);
+	return err;
+}
+#else
+/*
+ * We allocate ftrace_ops object for each trampoline and it contains
+ * call site specific for that trampoline.
+ *
+ * We use *_ftrace_direct api for attachment.
+ */
+static int direct_ops_alloc(struct bpf_trampoline *tr)
+{
+	tr->fops = kzalloc(sizeof(struct ftrace_ops), GFP_KERNEL);
+	if (!tr->fops)
+		return -ENOMEM;
+	tr->fops->private = tr;
+	tr->fops->ops_func = bpf_tramp_ftrace_ops_func;
+	return 0;
+}
+
+static void direct_ops_free(struct bpf_trampoline *tr)
+{
+	if (tr->fops) {
+		ftrace_free_filter(tr->fops);
+		kfree(tr->fops);
+	}
+}
+
+static int direct_ops_add(struct bpf_trampoline *tr, void *ptr)
+{
+	unsigned long addr = (unsigned long) ptr;
+	struct ftrace_ops *ops = tr->fops;
+	int ret;
+
+	if (bpf_trampoline_use_jmp(tr->flags))
+		addr = ftrace_jmp_set(addr);
+
+	ret = ftrace_set_filter_ip(ops, tr->ip, 0, 1);
+	if (ret)
+		return ret;
+	return register_ftrace_direct(ops, addr);
+}
+
+static int direct_ops_del(struct bpf_trampoline *tr, void *addr)
+{
+	return unregister_ftrace_direct(tr->fops, (long)addr, false);
+}
+
+static int direct_ops_mod(struct bpf_trampoline *tr, void *ptr, bool lock_direct_mutex)
+{
+	unsigned long addr = (unsigned long) ptr;
+	struct ftrace_ops *ops = tr->fops;
+
+	if (bpf_trampoline_use_jmp(tr->flags))
+		addr = ftrace_jmp_set(addr);
+	if (lock_direct_mutex)
+		return modify_ftrace_direct(ops, addr);
+	return modify_ftrace_direct_nolock(ops, addr);
+}
+#endif /* CONFIG_HAVE_SINGLE_FTRACE_DIRECT_OPS */
+#else
+static void direct_ops_free(struct bpf_trampoline *tr) { }
+
+static int direct_ops_alloc(struct bpf_trampoline *tr)
+{
+	return 0;
+}
+
+static int direct_ops_add(struct bpf_trampoline *tr, void *addr)
+{
+	return -ENODEV;
+}
+
+static int direct_ops_del(struct bpf_trampoline *tr, void *addr)
+{
+	return -ENODEV;
+}
+
+static int direct_ops_mod(struct bpf_trampoline *tr, void *ptr, bool lock_direct_mutex)
+{
+	return -ENODEV;
+}
+#endif /* CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS */
+
 static struct bpf_trampoline *bpf_trampoline_lookup(u64 key, unsigned long ip)
 {
 	struct bpf_trampoline *tr;
@@ -154,16 +335,11 @@ static struct bpf_trampoline *bpf_trampoline_lookup(u64 key, unsigned long ip)
 	tr = kzalloc(sizeof(*tr), GFP_KERNEL);
 	if (!tr)
 		goto out;
-#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
-	tr->fops = kzalloc(sizeof(struct ftrace_ops), GFP_KERNEL);
-	if (!tr->fops) {
+	if (direct_ops_alloc(tr)) {
 		kfree(tr);
 		tr = NULL;
 		goto out;
 	}
-	tr->fops->private = tr;
-	tr->fops->ops_func = bpf_tramp_ftrace_ops_func;
-#endif
 
 	tr->key = key;
 	tr->ip = ftrace_location(ip);
@@ -206,7 +382,7 @@ static int unregister_fentry(struct bpf_trampoline *tr, u32 orig_flags,
 	int ret;
 
 	if (tr->func.ftrace_managed)
-		ret = unregister_ftrace_direct(tr->fops, (long)old_addr, false);
+		ret = direct_ops_del(tr, old_addr);
 	else
 		ret = bpf_trampoline_update_fentry(tr, orig_flags, old_addr, NULL);
 
@@ -220,15 +396,7 @@ static int modify_fentry(struct bpf_trampoline *tr, u32 orig_flags,
 	int ret;
 
 	if (tr->func.ftrace_managed) {
-		unsigned long addr = (unsigned long) new_addr;
-
-		if (bpf_trampoline_use_jmp(tr->flags))
-			addr = ftrace_jmp_set(addr);
-
-		if (lock_direct_mutex)
-			ret = modify_ftrace_direct(tr->fops, addr);
-		else
-			ret = modify_ftrace_direct_nolock(tr->fops, addr);
+		ret = direct_ops_mod(tr, new_addr, lock_direct_mutex);
 	} else {
 		ret = bpf_trampoline_update_fentry(tr, orig_flags, old_addr,
 						   new_addr);
@@ -251,15 +419,7 @@ static int register_fentry(struct bpf_trampoline *tr, void *new_addr)
 	}
 
 	if (tr->func.ftrace_managed) {
-		unsigned long addr = (unsigned long) new_addr;
-
-		if (bpf_trampoline_use_jmp(tr->flags))
-			addr = ftrace_jmp_set(addr);
-
-		ret = ftrace_set_filter_ip(tr->fops, (unsigned long)ip, 0, 1);
-		if (ret)
-			return ret;
-		ret = register_ftrace_direct(tr->fops, addr);
+		ret = direct_ops_add(tr, new_addr);
 	} else {
 		ret = bpf_trampoline_update_fentry(tr, 0, NULL, new_addr);
 	}
@@ -910,10 +1070,7 @@ void bpf_trampoline_put(struct bpf_trampoline *tr)
 	 */
 	hlist_del(&tr->hlist_key);
 	hlist_del(&tr->hlist_ip);
-	if (tr->fops) {
-		ftrace_free_filter(tr->fops);
-		kfree(tr->fops);
-	}
+	direct_ops_free(tr);
 	kfree(tr);
 out:
 	mutex_unlock(&trampoline_mutex);
diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index bfa2ec46e075..d7042a09fe46 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -50,6 +50,9 @@ config HAVE_DYNAMIC_FTRACE_WITH_REGS
 config HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	bool
 
+config HAVE_SINGLE_FTRACE_DIRECT_OPS
+	bool
+
 config HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS
 	bool
 
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 02030f62d737..4ed910d3d00d 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -2631,8 +2631,13 @@ unsigned long ftrace_find_rec_direct(unsigned long ip)
 static void call_direct_funcs(unsigned long ip, unsigned long pip,
 			      struct ftrace_ops *ops, struct ftrace_regs *fregs)
 {
-	unsigned long addr = READ_ONCE(ops->direct_call);
+	unsigned long addr;
 
+#ifdef CONFIG_HAVE_SINGLE_FTRACE_DIRECT_OPS
+	addr = ftrace_find_rec_direct(ip);
+#else
+	addr = READ_ONCE(ops->direct_call);
+#endif
 	if (!addr)
 		return;
 

