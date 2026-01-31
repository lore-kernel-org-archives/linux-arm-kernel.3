Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FF9D79768
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 12:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o2hEtjB3vGUr1RvLvra8FnQ23d7eG/R6cE9Zgtr/AEg=; b=hHYgdjomJM6Zb/Ib4Kor72kk1K
	kknviX0ZdSF1Pr4Nu8OmbsEo2ShNrwNyXsjumdKwPNDJT6c54hYWD3XsRzkEWQ2a7R/kHP1i9U6gy
	T8j/bX8GsJZot94EWh26hpGAb0I8XLi3gRK9T95A+WzCMre9Tlvw/NKbyUVOixPCagPCtudt4m0qy
	EXf0MI8IVRphbVvaTuloDBUgDl3GO1iCGa93WslR1XHRaXymrWnSN8rXXqwEu5Ouibu+Zw942c2c4
	KSwLfK/shKij2Blfkk50ADuW6q0xboWCXTd/f9bnSHJ0eROmT7wmEzVNFXCqxnBkeDK4d4NiT6RpL
	iDuNcAhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmAUc-00000002adg-492H;
	Sat, 31 Jan 2026 12:54:26 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmAUZ-00000002adL-3VAI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 12:54:25 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-48039fdc8aeso17563865e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 04:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769864061; x=1770468861; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o2hEtjB3vGUr1RvLvra8FnQ23d7eG/R6cE9Zgtr/AEg=;
        b=wcyT7i1AnUEtsNt+0/iRX+8AdMyPWr+ZRbfOf+nGLY/co713qmkmh0njOJquEJ++EH
         5qgkdjuoK7nfnVAicSL9r6j2A8PAAz//I2zKFDUvSPVefpQ+pTXGj2vpAweHXsv6AtPB
         tK2b1XpAloRx1GXKeJH9wL8jGqvK3m5LNOsCXk+gK3K8jsonbEVbdzdl+MX9QynUlBEU
         S7XDhFjZq2UKckX9hriZUaw9M+yRy4Wp57h+9zDQ/KbpDmqCGelRyxUyLYO9rKrmShW7
         OwFb9kcI/e2PqaE4rHMkIEGqz2WVULSjzoDB22LyMBUSOmYFd7+fOUPlNWj0FKQPqn8k
         CWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769864061; x=1770468861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o2hEtjB3vGUr1RvLvra8FnQ23d7eG/R6cE9Zgtr/AEg=;
        b=MTtSerVQ/VtqRwpNNb/RVau1AKfJuvMr4s/5Wvv5b/xcv1B4yNkNEZChO+ssGJJiAq
         dKzqI6VlF/iWqkRQKvJv/WVh/K7gU66VlQl46EbbR8zACfwh7vvOG8KwvCPSCyo2/7kZ
         CGROEtfSj/5CgpV9nhZtwBCcDgpgiNpNgpJK1X6g/wR21bQ646MA9ud20x4kZLtjlzPz
         H8LMPFPf8Jpmt/uxraelRA2OCT2aX9c7AoVsYVra8GMfp4klLSz0QQW9TfFJwubitsr4
         /UPTqoMLmNRozksC+ztySG2jVUK1aB8Drv5zRMbUeb5tMle1L0+OwcI5IXX5C4f60b6l
         mOuA==
X-Forwarded-Encrypted: i=1; AJvYcCVw4ly3oF0KH3rd3Mb9FK1HGnZeWt/d61pC8hbgOwaQRJPQ9avpAQ1/2HrNgKSjZ/brZlPT9N08sgIGthkIczTh@lists.infradead.org
X-Gm-Message-State: AOJu0YzFmkmSJWmX6Fyp6k+dmEQB5yUhAg3uvZqXQ6QoaiWNwGXyioIr
	xJF5MTBBXTeMWxmLDDF4b42cBDxFoMOmBMBIC/VEtHFZYHXQRoNIZgcujrHpzHt0Xg==
X-Gm-Gg: AZuq6aIqBhgUZsTDO3BpTiZOXWGYM0UePtVcXc2gMOxPt/fT1RIlDyhCreUFGd6Jdkz
	FnaqPEW20+YpGIsJRSi7GO5bG2HnnZBHg/Fu04amYi7qG7igRFdMjbM3kmVj34JqQuAZPp/1ycb
	1JWc2ePI8lnfu1p6xA9k3Nbs8VJEqPL9OqYlYtQeBu1izcBvuegcXhui4bLKYifQllo/Aem90kw
	cLVp/YO5EDskVPV/9e3qVUw7zbwwRP+GdjEolDsYpuakeGSitNLCBUomUcmXb0i1oDwcrCHJFU/
	F6J15biftfc253rr0zInSpK5oEl8sGmTKG8/zl+qdI9FbMZkLkDrBFu8oeasfP8e3VcuS0HBvoc
	ZMcqaZmbEtD9TG967WQhLkeo/STm7BIDx0nLnHt/bNjwEp/ZqiG+EWIaR4w+U2Xd4KQTJGvqBM6
	iBdtoeYoiJjefoOplP+aCwBPPJjYf8ID+e8tZYdwXhr2fUMyo1pg==
X-Received: by 2002:a05:600c:c0cd:b0:471:700:f281 with SMTP id 5b1f17b1804b1-482db623765mr62756295e9.25.1769864060981;
        Sat, 31 Jan 2026 04:54:20 -0800 (PST)
Received: from google.com (44.145.34.34.bc.googleusercontent.com. [34.34.145.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e483asm28108377f8f.3.2026.01.31.04.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 04:54:20 -0800 (PST)
Date: Sat, 31 Jan 2026 12:54:17 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
	linux-trace-kernel@vger.kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jstultz@google.com,
	qperret@google.com, will@kernel.org, aneesh.kumar@kernel.org,
	kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 14/30] tracing: Add a trace remote module for testing
Message-ID: <aX37eRjYBP4WmyS6@google.com>
References: <20260126104419.1649811-1-vdonnefort@google.com>
 <20260126104419.1649811-15-vdonnefort@google.com>
 <20260129113452.190d4d79@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129113452.190d4d79@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_045423_948060_2B982507 
X-CRM114-Status: GOOD (  28.82  )
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

On Thu, Jan 29, 2026 at 11:34:52AM -0500, Steven Rostedt wrote:
> On Mon, 26 Jan 2026 10:44:03 +0000
> Vincent Donnefort <vdonnefort@google.com> wrote:
> 
> > diff --git a/kernel/trace/remote_test.c b/kernel/trace/remote_test.c
> > new file mode 100644
> > index 000000000000..059127489c99
> > --- /dev/null
> > +++ b/kernel/trace/remote_test.c
> > @@ -0,0 +1,259 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2025 - Google LLC
> > + * Author: Vincent Donnefort <vdonnefort@google.com>
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/simple_ring_buffer.h>
> > +#include <linux/trace_remote.h>
> > +#include <linux/tracefs.h>
> > +#include <linux/types.h>
> > +
> > +#define REMOTE_EVENT_INCLUDE_FILE kernel/trace/remote_test_events.h
> > +#include <trace/define_remote_events.h>
> > +
> > +static DEFINE_PER_CPU(struct simple_rb_per_cpu *, simple_rbs);
> > +static struct trace_buffer_desc *remote_test_buffer_desc;
> > +
> > +/*
> > + * The trace_remote lock already serializes accesses from the trace_remote_callbacks.
> > + * However write_event can still race with load/unload.
> > + */
> > +static DEFINE_MUTEX(simple_rbs_lock);
> > +
> > +static int remote_test_load_simple_rb(int cpu, struct ring_buffer_desc *rb_desc)
> > +{
> > +	struct simple_rb_per_cpu *cpu_buffer;
> > +	struct simple_buffer_page *bpages;
> > +	int ret = -ENOMEM;
> > +
> > +	cpu_buffer = kmalloc(sizeof(*cpu_buffer), GFP_KERNEL);
> > +	if (!cpu_buffer)
> > +		return ret;
> > +
> > +	bpages = kmalloc_array(rb_desc->nr_page_va, sizeof(*bpages), GFP_KERNEL);
> > +	if (!bpages)
> > +		goto err_free_cpu_buffer;
> > +
> > +	ret = simple_ring_buffer_init(cpu_buffer, bpages, rb_desc);
> > +	if (ret)
> > +		goto err_free_bpages;
> > +
> > +	scoped_guard(mutex, &simple_rbs_lock)
> > +		*per_cpu_ptr(&simple_rbs, cpu) = cpu_buffer;
> 
> Should there be some kind of check before blindly assigning the cpu_buffer?
> If not, what is the mutex protecting from?

This intends to order accesses with write_event_write(). trace_remote ensures
that load/unload are always balanced, so I don't believe there's anything to
test.

I could add a WARN_ON though. and probably guard(mutex)(&simple_rbs_lock) is
enough.

> 
> 
> > +
> > +	return 0;
> > +
> > +err_free_bpages:
> > +	kfree(bpages);
> > +
> > +err_free_cpu_buffer:
> > +	kfree(cpu_buffer);
> > +
> > +	return ret;
> > +}
> > +
> > +static void remote_test_unload_simple_rb(int cpu)
> > +{
> > +	struct simple_rb_per_cpu *cpu_buffer = *per_cpu_ptr(&simple_rbs, cpu);
> > +	struct simple_buffer_page *bpages;
> > +
> > +	if (!cpu_buffer)
> > +		return;
> > +
> > +	guard(mutex)(&simple_rbs_lock);
> > +
> > +	bpages = cpu_buffer->bpages;
> > +	simple_ring_buffer_unload(cpu_buffer);
> > +	kfree(bpages);
> > +	kfree(cpu_buffer);
> > +	*per_cpu_ptr(&simple_rbs, cpu) = NULL;
> > +}
> > +
> > +static struct trace_buffer_desc *remote_test_load(unsigned long size, void *unused)
> > +{
> > +	struct ring_buffer_desc *rb_desc;
> > +	struct trace_buffer_desc *desc;
> > +	size_t desc_size;
> > +	int cpu, ret;
> > +
> > +	if (WARN_ON(remote_test_buffer_desc))
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	desc_size = trace_buffer_desc_size(size, num_possible_cpus());
> > +	if (desc_size == SIZE_MAX) {
> > +		ret = -E2BIG;
> > +		goto err_unlock_cpus;
> > +	}
> > +
> > +	desc = kmalloc(desc_size, GFP_KERNEL);
> > +	if (!desc) {
> > +		ret = -ENOMEM;
> > +		goto err_unlock_cpus;
> > +	}
> > +
> > +	ret = trace_remote_alloc_buffer(desc, desc_size, size, cpu_possible_mask);
> > +	if (ret)
> > +		goto err_free_desc;
> > +
> > +	for_each_ring_buffer_desc(rb_desc, cpu, desc) {
> > +		ret = remote_test_load_simple_rb(rb_desc->cpu, rb_desc);
> > +		if (ret)
> > +			goto err;
> > +	}
> > +
> > +	remote_test_buffer_desc = desc;
> > +
> > +	return remote_test_buffer_desc;
> > +
> > +err:
> > +	for_each_ring_buffer_desc(rb_desc, cpu, remote_test_buffer_desc)
> > +		remote_test_unload_simple_rb(rb_desc->cpu);
> > +	trace_remote_free_buffer(remote_test_buffer_desc);
> > +
> > +err_free_desc:
> > +	kfree(desc);
> > +
> > +err_unlock_cpus:
> 
> Where was the cpus_read lock taken?
> 
> > +	cpus_read_unlock();
> > +
> > +	return ERR_PTR(ret);
> > +}
> > +
> > +static void remote_test_unload(struct trace_buffer_desc *desc, void *unused)
> > +{
> > +	struct ring_buffer_desc *rb_desc;
> > +	int cpu;
> > +
> > +	if (WARN_ON(desc != remote_test_buffer_desc))
> > +		return;
> > +
> > +	for_each_ring_buffer_desc(rb_desc, cpu, desc)
> > +		remote_test_unload_simple_rb(rb_desc->cpu);
> > +
> > +	remote_test_buffer_desc = NULL;
> > +	trace_remote_free_buffer(desc);
> > +	kfree(desc);
> > +}
> > +
> > +static int remote_test_enable_tracing(bool enable, void *unused)
> > +{
> > +	struct ring_buffer_desc *rb_desc;
> > +	int cpu;
> > +
> > +	if (!remote_test_buffer_desc)
> > +		return -ENODEV;
> > +
> > +	for_each_ring_buffer_desc(rb_desc, cpu, remote_test_buffer_desc)
> > +		WARN_ON(simple_ring_buffer_enable_tracing(*per_cpu_ptr(&simple_rbs, rb_desc->cpu),
> > +							  enable));
> > +	return 0;
> > +}
> > +
> > +static int remote_test_swap_reader_page(unsigned int cpu, void *unused)
> > +{
> > +	struct simple_rb_per_cpu *cpu_buffer;
> > +
> > +	if (cpu >= NR_CPUS)
> > +		return -EINVAL;
> > +
> > +	cpu_buffer = *per_cpu_ptr(&simple_rbs, cpu);
> > +	if (!cpu_buffer)
> > +		return -EINVAL;
> > +
> > +	return simple_ring_buffer_swap_reader_page(cpu_buffer);
> > +}
> > +
> > +static int remote_test_reset(unsigned int cpu, void *unused)
> > +{
> > +	struct simple_rb_per_cpu *cpu_buffer;
> > +
> > +	if (cpu >= NR_CPUS)
> > +		return -EINVAL;
> > +
> > +	cpu_buffer = *per_cpu_ptr(&simple_rbs, cpu);
> > +	if (!cpu_buffer)
> > +		return -EINVAL;
> > +
> > +	return simple_ring_buffer_reset(cpu_buffer);
> > +}
> > +
> > +static int remote_test_enable_event(unsigned short id, bool enable, void *unused)
> > +{
> > +	if (id != REMOTE_TEST_EVENT_ID)
> > +		return -EINVAL;
> > +
> > +	/*
> > +	 * Let's just use the struct remote_event enabled field that is turned on and off by
> > +	 * trace_remote. This is a bit racy but good enough for a simple test module.
> > +	 */
> > +	return 0;
> > +}
> > +
> > +static ssize_t
> > +write_event_write(struct file *filp, const char __user *ubuf, size_t cnt, loff_t *pos)
> > +{
> > +	struct remote_event_format_selftest *evt_test;
> > +	struct simple_rb_per_cpu *cpu_buffer;
> > +	unsigned long val;
> > +	int ret;
> > +
> > +	ret = kstrtoul_from_user(ubuf, cnt, 10, &val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	guard(mutex)(&simple_rbs_lock);
> > +
> > +	if (!remote_event_selftest.enabled)
> > +		return -ENODEV;
> > +
> 
> You want a guard(preempt)(); here...
> 
> > +	cpu_buffer = *this_cpu_ptr(&simple_rbs);
> 
> Otherwise this triggers:
> 
>  BUG: using smp_processor_id() in preemptible [00000000] code: bash/1096
>  caller is write_event_write+0xe0/0x230 [remote_test]
> 
> -- Steve
> 
> > +	if (!cpu_buffer)
> > +		return -ENODEV;
> > +
> > +	evt_test = simple_ring_buffer_reserve(cpu_buffer,
> > +					      sizeof(struct remote_event_format_selftest),
> > +					      trace_clock_global());
> > +	if (!evt_test)
> > +		return -ENODEV;
> > +
> > +	evt_test->hdr.id = REMOTE_TEST_EVENT_ID;
> > +	evt_test->id = val;
> > +
> > +	simple_ring_buffer_commit(cpu_buffer);
> > +
> > +	return cnt;
> > +}
> > +

