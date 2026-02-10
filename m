Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DE7EA812B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 15:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EUhq8bUSDIK8bU/Cf62PUQLvFL3hrikVLXNMzuDuSOI=; b=SnlA1/dKqJ/mr7CIm5CMhwKTiu
	ceLcDi23yd7gJ463GS4SR0x0uzUsyJeiVhjD9yds1Hn6oHhcZnylN2FphciffoE09NTrY19eKRx88
	lNe6fFQQDS8TUp4f21Gae3JHrxbo/Aq7+GQ5YZnovtd2S0R1ByIYcsd8PThUSQQGIz5vDgQpujJFy
	EIOnueAPXFlA/eAYQEN3nZr861IYjnd0PbFG22huhWc4qxZvbOheGjJAVVjZIFMPuP/GRcnaHEuVE
	LBY8YRMydIirlGQxqZZN9Xqo/zuunkT3xkoB/cRVq9wet+Mfjx9J8biO0N3fp+nr1p7ls9Wn5qFme
	1FZ4AU1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vppjY-0000000H7zO-1g55;
	Tue, 10 Feb 2026 15:33:00 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vppjW-0000000H7yr-1k2h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 15:32:59 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-436317c80f7so2083133f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 07:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770737575; x=1771342375; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EUhq8bUSDIK8bU/Cf62PUQLvFL3hrikVLXNMzuDuSOI=;
        b=3r5CwO5x5OXkSwx8Hl08OcnBObRSu+ZKzcCTyZoIhcBYWb89Bu2iRk3XJG2k2NqUPV
         LxAe0+pSGzcJcMaM7UAQJ7Quxnfo9RjxVYY3rKbybsifLFBBOHQuCszZlvhmefu5+aoy
         UV96/KCHib4NrO4dKr22N3TmDkDLUWmAg29vhgAMTfrkREPNj7/ELKoTdVgtLgwAOQtN
         Lxra/NjIjxbPpPcMk1HA1EhN+n7oABK6nS/ZEHDLeFI8fYlrDGPTP+04KzJRKjA8DFTe
         +ae5hCEjRMmc+xOJv+dHPLn4/Y7+UoKALO5LPH+7TlHpr8rrL6wB1MGz1HRJWcwTmVfS
         7Azg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770737575; x=1771342375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EUhq8bUSDIK8bU/Cf62PUQLvFL3hrikVLXNMzuDuSOI=;
        b=DRlkJb/7fj4U+2tsQoae7tLsH3lvDwgxzKfsePC2MgdZO4RtnLgjkdwF1LmrXIMVSP
         eVNIvl6RruCBMNvxhW9ktnVmR95yBiZpquiHbB4IULMjyxpzH9lXkjU8ntUN8w2SSRRt
         Bo9GaQkAk2NiGJkVVzBFMqnoBo9utMMe9sibA6JsAd7DhmA1/vOCFSLz7U8CYUBgO4bo
         kVypz1JIGi83mNa5GLZ9QgJ6Mgp2LEuRGso4gf0ECZ3GI2tjS6idc894VQ0ipkxT+LFR
         bfVcw/QJZC4XjTXT4AQlpIsHzSr7Kxyx82zUaAVnyMgitEcX5KaQ3F1CzF+fxKwgcwOn
         YQ7g==
X-Forwarded-Encrypted: i=1; AJvYcCUYPZKIhaDNsJ4IW/052MCACP7QiocS/tobDNw5frdAAw+cx/aHNOq5lQsdE10TI5/cbcehRuLITgtlYXa6ojXu@lists.infradead.org
X-Gm-Message-State: AOJu0YyRtmEcmuEbGVptirjC73VCP3qOs+wPNBcyptg95Chnx9+qGJot
	wsNivrbbTyn2kw0Yo+kWDEL+8bngVD6KKI6W3UNNR6trBRZvqSkvuZahovSqkqPLtg==
X-Gm-Gg: AZuq6aLj8wdJAtfd9CNk4gWO26Ua506+pKSC2PApBUw6SczFCCXvc65st50SSk+P7Y3
	kJm7/DgGHmdv++0D87YZ+/Dc7kUCRAqoqkwc7CpqNLvT77qcS4jNJYSdDnnDuqVwtMzLwpsGGjX
	Hp0eSWcQEsUwd4p7w5nBW60Q6kryaG/HSDwcajtJUhY5hP0OB2Q82EMPLcxmEo9/HR/2KAAoO06
	ZKkwgRGAfZeT4l92OEoAfxDeB/0wVfami55NE6zwsisMFqjFlGYobM1s1RMv0X3OqXwCDYjvtR6
	V+k7zSEqfXSG3MOocLn605dPgM1Tt7UHoLlijnhXVBYeHEqeg7oHioXeYIQCct1h3UxoEqCmre7
	OT90FGqC0TSyd5j74TKTskQWOMrBoVnjx9430Up16KeQEzRZxTC/vCkjlpjT61XAGMnDV3GiRH3
	3Dp0l42Ckd1krL++Oy5I0rfb211L2Qk8QT3YXzk+F+HpzpeI/cC06dKeHh//0TXB8/90s=
X-Received: by 2002:a05:6000:24c3:b0:436:e875:7911 with SMTP id ffacd0b85a97d-43779e3bab1mr4635624f8f.4.1770737575096;
        Tue, 10 Feb 2026 07:32:55 -0800 (PST)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376686130csm21600376f8f.1.2026.02.10.07.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 07:32:54 -0800 (PST)
Date: Tue, 10 Feb 2026 15:32:50 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
	linux-trace-kernel@vger.kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jstultz@google.com,
	qperret@google.com, will@kernel.org, aneesh.kumar@kernel.org,
	kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 07/30] tracing: Add non-consuming read to trace
 remotes
Message-ID: <aYtPoil91IX7u_9f@google.com>
References: <20260131132848.254084-1-vdonnefort@google.com>
 <20260131132848.254084-8-vdonnefort@google.com>
 <20260204185208.646a6d26@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204185208.646a6d26@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_073258_507338_CDFB43A9 
X-CRM114-Status: GOOD (  25.61  )
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

On Wed, Feb 04, 2026 at 06:52:08PM -0500, Steven Rostedt wrote:
> On Sat, 31 Jan 2026 13:28:25 +0000
> Vincent Donnefort <vdonnefort@google.com> wrote:
> 
> > -static struct trace_remote_iterator *trace_remote_iter(struct trace_remote *remote, int cpu)
> > +static void __free_ring_buffer_iter(struct trace_remote_iterator *iter, int cpu)
> > +{
> > +	if (!iter->rb_iter)
> > +		return;
> 
> Hmm, can't iter->rb_iter be NULL when iter->rb_iters[] is used?

Arg yes, I missed that when I removed the union. And actually I don't think this
can be called with iter->rb_iter or iter->rb_iter NULL anymore.

> 
> > +
> > +	if (cpu != RING_BUFFER_ALL_CPUS) {
> > +		ring_buffer_read_finish(iter->rb_iter);
> > +		return;
> > +	}
> > +
> > +	for_each_possible_cpu(cpu) {
> > +		if (iter->rb_iters[cpu])
> > +			ring_buffer_read_finish(iter->rb_iters[cpu]);
> > +	}
> > +
> > +	kfree(iter->rb_iters);
> > +}
> > +
> > +static int __alloc_ring_buffer_iter(struct trace_remote_iterator *iter, int cpu)
> > +{
> > +	if (cpu != RING_BUFFER_ALL_CPUS) {
> > +		iter->rb_iter = ring_buffer_read_start(iter->remote->trace_buffer, cpu, GFP_KERNEL);
> > +
> > +		return iter->rb_iter ? 0 : -ENOMEM;
> > +	}
> > +
> > +	iter->rb_iters = kcalloc(nr_cpu_ids, sizeof(*iter->rb_iters), GFP_KERNEL);
> > +	if (!iter->rb_iters)
> > +		return -ENOMEM;
> > +
> > +	for_each_possible_cpu(cpu) {
> > +		iter->rb_iters[cpu] = ring_buffer_read_start(iter->remote->trace_buffer, cpu,
> > +							     GFP_KERNEL);
> > +		if (!iter->rb_iters[cpu]) {
> > +			__free_ring_buffer_iter(iter, RING_BUFFER_ALL_CPUS);
> 
> For instance, we call __free_ring_buffer_iter() here, but I don't see
> iter->rb_iter being set.
> 
> -- Steve
> 
> 
> > +			return -ENOMEM;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +

[...]

> > +static void *trace_next(struct seq_file *m, void *v, loff_t *pos)
> > +{
> > +	struct trace_remote_iterator *iter = m->private;
> > +
> > +	++*pos;
> > +
> > +	if (!iter || !trace_remote_iter_read_event(iter))
> > +		return NULL;
> > +
> > +	trace_remote_iter_move(iter);
> > +	iter->pos++;
> > +
> > +	return iter;
> > +}
> > +
> > +static void *trace_start(struct seq_file *m, loff_t *pos)
> > +{
> > +	struct trace_remote_iterator *iter = m->private;
> > +	loff_t i;
> > +
> 
> FYI, this is where you take locks for iteration of files.
> 
> > +	if (!iter)
> > +		return NULL;
> > +
> > +	if (!*pos) {
> > +		iter->pos = -1;
> > +		return trace_next(m, NULL, &i);
> > +	}
> > +
> > +	i = iter->pos;
> > +	while (i < *pos) {
> > +		iter = trace_next(m, NULL, &i);
> > +		if (!iter)
> > +			return NULL;
> > +	}
> > +
> > +	return iter;
> > +}
> > +
> > +static int trace_show(struct seq_file *m, void *v)
> > +{
> > +	struct trace_remote_iterator *iter = v;
> > +
> > +	trace_seq_init(&iter->seq);
> > +
> > +	if (trace_remote_iter_print_event(iter)) {
> > +		seq_printf(m, "[EVENT %d PRINT TOO BIG]\n", iter->evt->id);
> > +		return 0;
> > +	}
> > +
> > +	return trace_print_seq(m, &iter->seq);
> > +}
> > +
> > +static void trace_stop(struct seq_file *s, void *v) { }
> 
> And stop is where you release the locks.
> 
> > +
> > +static const struct seq_operations trace_sops = {
> > +	.start		= trace_start,
> > +	.next		= trace_next,
> > +	.show		= trace_show,
> > +	.stop		= trace_stop,
> > +};
> > +
> > +static int trace_open(struct inode *inode, struct file *filp)
> > +{
> > +	struct trace_remote *remote = inode->i_private;
> > +	struct trace_remote_iterator *iter = NULL;
> > +	int cpu = tracing_get_cpu(inode);
> > +	int ret;
> > +
> > +	if (!(filp->f_mode & FMODE_READ))
> > +		return 0;
> > +
> > +	guard(mutex)(&remote->lock);
> > +
> > +	iter = trace_remote_iter(remote, cpu, TRI_NONCONSUMING);
> > +	if (IS_ERR(iter))
> > +		return PTR_ERR(iter);
> 
> So if iter is bad we exit out here.
> 
> > +
> > +	ret = seq_open(filp, &trace_sops);
> > +	if (ret) {
> > +		trace_remote_iter_free(iter);
> > +		return ret;
> > +	}
> > +
> > +	if (iter)
> 
> Why test if iter exists here?

We only test IS_ERR. iter will be NULL if the buffer isn't loaded and the
userspace output would be empty. But anyway if I move the locking into
start/stop this line will go away!

> 
> > +		trace_remote_iter_read_start(iter);
> 
> But still, the above grabs locks in the open, where it can return to user
> space while still holding the locks? That's a no-no.
> 
> You can use the seq file start and stop for locking.
> 
> -- Steve
>
[...]

