Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C27D6B092
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 16:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HJrcfOpQGIrdQ7cqjcCBXiMfiCGuwMdtJ5VZPKLOtiI=; b=yU5dj8KU3uN+FxTyksxsyYFWic
	MCp4tLojDjtMOUge9kNd4yA6+znossupjsdjO2q1xpcXG5wf1Pgv5T4sQlq1tufIpAk+l1gwSP8/H
	5Jl3DBPi7H4Wm66vvL1HwxDDKIvOofR8W3KlvCvQaOvNmJLM3D7xS2dhXRk+Dz7Ua2B3oKWjsBADj
	Ih7urTrpaJCtKw/0N6kiQt3f9gBYgEyfLygTviVF7D3eKe6LRKwbgo/7/U3VuhYeRkeUNubjsaZGp
	vXToz76qvB/eQKvrtSgmJlrjNqcEAGNSOSqra6tgksj0CjTZQ8PStJjd91U2yyjy5RWAdaN/bwhAT
	Jpl8OPxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlUyo-00000000M0J-1WVL;
	Thu, 29 Jan 2026 16:34:50 +0000
Received: from smtprelay0017.hostedemail.com ([216.40.44.17] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlUym-00000000Lzw-0c7v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 16:34:49 +0000
Received: from omf13.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 423591A023A;
	Thu, 29 Jan 2026 16:34:44 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf13.hostedemail.com (Postfix) with ESMTPA id C464A2000D;
	Thu, 29 Jan 2026 16:34:40 +0000 (UTC)
Date: Thu, 29 Jan 2026 11:34:52 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 14/30] tracing: Add a trace remote module for
 testing
Message-ID: <20260129113452.190d4d79@gandalf.local.home>
In-Reply-To: <20260126104419.1649811-15-vdonnefort@google.com>
References: <20260126104419.1649811-1-vdonnefort@google.com>
	<20260126104419.1649811-15-vdonnefort@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 4tom6osz9gk1nhda1dzgtdp7p96fbuiw
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: C464A2000D
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/a+lc9Olbj8FpxYo0Mp5Ylas9xx3xZcTc=
X-HE-Tag: 1769704480-893928
X-HE-Meta: U2FsdGVkX18dLCxZERBXmsSnTHc5UPwrkXX13Ws3zkTLaDeMkhnHCasYaI+Sr7OfeoIfJg6HaL+GXQSIRPrgee/ppnYTHOMGsF+4/o+HSxUs66/wi+KtzK1ewXbHsX9bBs2dwl4hZz4XBnkFcMjWDtU+5554hrEVsVGXB80izeoRE4V4YCNmj8mhj2TTxh0P4endb8Wx8qLHcg4lClo4dI5DZGdscWODASEPnrcVD0ZOPbhJsAzv7WLHH9ZpkSNxFD+Ht74oI4OTwc1OBU2hBn+/5qt+DXoOn1MAJWq2vZbHYzVjg+QO6QwBar5kO9jBz5TOTi3IEKi/GygYU3hf0bYIZxRpAEXw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_083448_272758_35C42666 
X-CRM114-Status: GOOD (  21.71  )
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

On Mon, 26 Jan 2026 10:44:03 +0000
Vincent Donnefort <vdonnefort@google.com> wrote:

> diff --git a/kernel/trace/remote_test.c b/kernel/trace/remote_test.c
> new file mode 100644
> index 000000000000..059127489c99
> --- /dev/null
> +++ b/kernel/trace/remote_test.c
> @@ -0,0 +1,259 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025 - Google LLC
> + * Author: Vincent Donnefort <vdonnefort@google.com>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/simple_ring_buffer.h>
> +#include <linux/trace_remote.h>
> +#include <linux/tracefs.h>
> +#include <linux/types.h>
> +
> +#define REMOTE_EVENT_INCLUDE_FILE kernel/trace/remote_test_events.h
> +#include <trace/define_remote_events.h>
> +
> +static DEFINE_PER_CPU(struct simple_rb_per_cpu *, simple_rbs);
> +static struct trace_buffer_desc *remote_test_buffer_desc;
> +
> +/*
> + * The trace_remote lock already serializes accesses from the trace_remote_callbacks.
> + * However write_event can still race with load/unload.
> + */
> +static DEFINE_MUTEX(simple_rbs_lock);
> +
> +static int remote_test_load_simple_rb(int cpu, struct ring_buffer_desc *rb_desc)
> +{
> +	struct simple_rb_per_cpu *cpu_buffer;
> +	struct simple_buffer_page *bpages;
> +	int ret = -ENOMEM;
> +
> +	cpu_buffer = kmalloc(sizeof(*cpu_buffer), GFP_KERNEL);
> +	if (!cpu_buffer)
> +		return ret;
> +
> +	bpages = kmalloc_array(rb_desc->nr_page_va, sizeof(*bpages), GFP_KERNEL);
> +	if (!bpages)
> +		goto err_free_cpu_buffer;
> +
> +	ret = simple_ring_buffer_init(cpu_buffer, bpages, rb_desc);
> +	if (ret)
> +		goto err_free_bpages;
> +
> +	scoped_guard(mutex, &simple_rbs_lock)
> +		*per_cpu_ptr(&simple_rbs, cpu) = cpu_buffer;

Should there be some kind of check before blindly assigning the cpu_buffer?
If not, what is the mutex protecting from?


> +
> +	return 0;
> +
> +err_free_bpages:
> +	kfree(bpages);
> +
> +err_free_cpu_buffer:
> +	kfree(cpu_buffer);
> +
> +	return ret;
> +}
> +
> +static void remote_test_unload_simple_rb(int cpu)
> +{
> +	struct simple_rb_per_cpu *cpu_buffer = *per_cpu_ptr(&simple_rbs, cpu);
> +	struct simple_buffer_page *bpages;
> +
> +	if (!cpu_buffer)
> +		return;
> +
> +	guard(mutex)(&simple_rbs_lock);
> +
> +	bpages = cpu_buffer->bpages;
> +	simple_ring_buffer_unload(cpu_buffer);
> +	kfree(bpages);
> +	kfree(cpu_buffer);
> +	*per_cpu_ptr(&simple_rbs, cpu) = NULL;
> +}
> +
> +static struct trace_buffer_desc *remote_test_load(unsigned long size, void *unused)
> +{
> +	struct ring_buffer_desc *rb_desc;
> +	struct trace_buffer_desc *desc;
> +	size_t desc_size;
> +	int cpu, ret;
> +
> +	if (WARN_ON(remote_test_buffer_desc))
> +		return ERR_PTR(-EINVAL);
> +
> +	desc_size = trace_buffer_desc_size(size, num_possible_cpus());
> +	if (desc_size == SIZE_MAX) {
> +		ret = -E2BIG;
> +		goto err_unlock_cpus;
> +	}
> +
> +	desc = kmalloc(desc_size, GFP_KERNEL);
> +	if (!desc) {
> +		ret = -ENOMEM;
> +		goto err_unlock_cpus;
> +	}
> +
> +	ret = trace_remote_alloc_buffer(desc, desc_size, size, cpu_possible_mask);
> +	if (ret)
> +		goto err_free_desc;
> +
> +	for_each_ring_buffer_desc(rb_desc, cpu, desc) {
> +		ret = remote_test_load_simple_rb(rb_desc->cpu, rb_desc);
> +		if (ret)
> +			goto err;
> +	}
> +
> +	remote_test_buffer_desc = desc;
> +
> +	return remote_test_buffer_desc;
> +
> +err:
> +	for_each_ring_buffer_desc(rb_desc, cpu, remote_test_buffer_desc)
> +		remote_test_unload_simple_rb(rb_desc->cpu);
> +	trace_remote_free_buffer(remote_test_buffer_desc);
> +
> +err_free_desc:
> +	kfree(desc);
> +
> +err_unlock_cpus:

Where was the cpus_read lock taken?

> +	cpus_read_unlock();
> +
> +	return ERR_PTR(ret);
> +}
> +
> +static void remote_test_unload(struct trace_buffer_desc *desc, void *unused)
> +{
> +	struct ring_buffer_desc *rb_desc;
> +	int cpu;
> +
> +	if (WARN_ON(desc != remote_test_buffer_desc))
> +		return;
> +
> +	for_each_ring_buffer_desc(rb_desc, cpu, desc)
> +		remote_test_unload_simple_rb(rb_desc->cpu);
> +
> +	remote_test_buffer_desc = NULL;
> +	trace_remote_free_buffer(desc);
> +	kfree(desc);
> +}
> +
> +static int remote_test_enable_tracing(bool enable, void *unused)
> +{
> +	struct ring_buffer_desc *rb_desc;
> +	int cpu;
> +
> +	if (!remote_test_buffer_desc)
> +		return -ENODEV;
> +
> +	for_each_ring_buffer_desc(rb_desc, cpu, remote_test_buffer_desc)
> +		WARN_ON(simple_ring_buffer_enable_tracing(*per_cpu_ptr(&simple_rbs, rb_desc->cpu),
> +							  enable));
> +	return 0;
> +}
> +
> +static int remote_test_swap_reader_page(unsigned int cpu, void *unused)
> +{
> +	struct simple_rb_per_cpu *cpu_buffer;
> +
> +	if (cpu >= NR_CPUS)
> +		return -EINVAL;
> +
> +	cpu_buffer = *per_cpu_ptr(&simple_rbs, cpu);
> +	if (!cpu_buffer)
> +		return -EINVAL;
> +
> +	return simple_ring_buffer_swap_reader_page(cpu_buffer);
> +}
> +
> +static int remote_test_reset(unsigned int cpu, void *unused)
> +{
> +	struct simple_rb_per_cpu *cpu_buffer;
> +
> +	if (cpu >= NR_CPUS)
> +		return -EINVAL;
> +
> +	cpu_buffer = *per_cpu_ptr(&simple_rbs, cpu);
> +	if (!cpu_buffer)
> +		return -EINVAL;
> +
> +	return simple_ring_buffer_reset(cpu_buffer);
> +}
> +
> +static int remote_test_enable_event(unsigned short id, bool enable, void *unused)
> +{
> +	if (id != REMOTE_TEST_EVENT_ID)
> +		return -EINVAL;
> +
> +	/*
> +	 * Let's just use the struct remote_event enabled field that is turned on and off by
> +	 * trace_remote. This is a bit racy but good enough for a simple test module.
> +	 */
> +	return 0;
> +}
> +
> +static ssize_t
> +write_event_write(struct file *filp, const char __user *ubuf, size_t cnt, loff_t *pos)
> +{
> +	struct remote_event_format_selftest *evt_test;
> +	struct simple_rb_per_cpu *cpu_buffer;
> +	unsigned long val;
> +	int ret;
> +
> +	ret = kstrtoul_from_user(ubuf, cnt, 10, &val);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&simple_rbs_lock);
> +
> +	if (!remote_event_selftest.enabled)
> +		return -ENODEV;
> +

You want a guard(preempt)(); here...

> +	cpu_buffer = *this_cpu_ptr(&simple_rbs);

Otherwise this triggers:

 BUG: using smp_processor_id() in preemptible [00000000] code: bash/1096
 caller is write_event_write+0xe0/0x230 [remote_test]

-- Steve

> +	if (!cpu_buffer)
> +		return -ENODEV;
> +
> +	evt_test = simple_ring_buffer_reserve(cpu_buffer,
> +					      sizeof(struct remote_event_format_selftest),
> +					      trace_clock_global());
> +	if (!evt_test)
> +		return -ENODEV;
> +
> +	evt_test->hdr.id = REMOTE_TEST_EVENT_ID;
> +	evt_test->id = val;
> +
> +	simple_ring_buffer_commit(cpu_buffer);
> +
> +	return cnt;
> +}
> +

