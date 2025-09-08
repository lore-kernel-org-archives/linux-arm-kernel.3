Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10435CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pj5jeNFrqMJ9iLEsWEXtk/dXDgsiyM2wZqLSz72IzAY=; b=pvl56JdZ1Qd/RtNSMa2dRhsMvt
	ctLt8TT0XIfa6B92+ku9mJR61RiZ4axK5YUUmFIHXy2B7zVyRgDc/15od9ZDONtXCyKY/DkHGxeD1
	2RFqaR237AelIjyTBq3pbCvetT3UNmd+2VI3tTKwLNHXsYoHTBty/7KypOQOZgzTHNrMxs4UH7hXL
	/qxH/ukKXyXjV4sYSdBjSWeo05lHPQ4mFsobmdJ0NZyPg2rCoSDKcEQEDbtSKnxB788GrvhlR681d
	TbP7DcopTxxxhGs91glf01N+DVJXVh8AM18U9GJKgLgafTb8PcWf+XqKdkHR/IgTKndObLGV90wOn
	kRilk8eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsEF-00000004sQv-11nk;
	Tue, 09 Sep 2025 06:53:23 +0000
Received: from smtprelay0017.hostedemail.com ([216.40.44.17] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvlOQ-00000002zB6-3rAr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 23:35:28 +0000
Received: from omf19.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 76607587E5;
	Mon,  8 Sep 2025 23:35:23 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf19.hostedemail.com (Postfix) with ESMTPA id D82D620025;
	Mon,  8 Sep 2025 23:35:19 +0000 (UTC)
Date: Mon, 8 Sep 2025 19:36:05 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 03/24] tracing: Introduce trace remotes
Message-ID: <20250908193606.47143d09@gandalf.local.home>
In-Reply-To: <20250821081412.1008261-4-vdonnefort@google.com>
References: <20250821081412.1008261-1-vdonnefort@google.com>
	<20250821081412.1008261-4-vdonnefort@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: xtst64tqoj6xjbmrgzuhtq7zud5fp9as
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: D82D620025
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/3BmdESBq9p494ClBbvWR0lF9SP2rHtf8=
X-HE-Tag: 1757374519-315858
X-HE-Meta: U2FsdGVkX18HK0U95OOl89BG5VQk6Kg6LVWbCl2CSVbrRvvl0YewdCSxa2DMdr13EvJ36GqGgAb6i5dTOnngrPPskeRf/ygEGARJOHoyjR92z/s4KlkYwQ0+DovGgFCn+m4yIDXhWN7EwuSDh1iED41HI2KBatpqMccYhffxFanar2pH/0PBqgVWIwTFUT6HfY4gcYbpBZ5RdTK136SiOfTDWQLwfH1GYKNhlMl8HnNGJfyGPEV6umjeSskEpfNTFrYJ5ulfZOh8mL9TtACyIp1EX+FzZQrlRFT7+xXhWIfjcoINLWtJ8UNg3Ys91GTJTQI7e02RE/MYgB7xq/lIVjKRi64GpTn/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_163527_022259_66984BFD 
X-CRM114-Status: GOOD (  25.66  )
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

On Thu, 21 Aug 2025 09:13:51 +0100
Vincent Donnefort <vdonnefort@google.com> wrote:

> A trace remote relies on ring-buffer remotes to read and control
> compatible tracing buffers, written by entity such as firmware or
> hypervisor.
> 
> Add a Tracefs directory remotes/ that contains all instances of trace
> remotes. Each instance follows the same hierarchy as any other to ease
> the support by existing user-space tools.
> 
> This currently does not provide any event support, which will come
> later.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> 
> diff --git a/include/linux/trace_remote.h b/include/linux/trace_remote.h
> new file mode 100644
> index 000000000000..de043a6f2fe0
> --- /dev/null
> +++ b/include/linux/trace_remote.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef _LINUX_TRACE_REMOTE_H
> +#define _LINUX_TRACE_REMOTE_H
> +
> +#include <linux/ring_buffer.h>
> +
> +struct trace_remote_callbacks {
> +	struct trace_buffer_desc *
> +		(*load_trace_buffer)(unsigned long size, void *priv);

I believe this is one of those cases where the 80 char limit is more of a
guildline than a rule. It looks better to keep the above as one line.

> +	void	(*unload_trace_buffer)(struct trace_buffer_desc *desc, void *priv);

Heck, this is already passed 80 characters ;-)

> +	int	(*enable_tracing)(bool enable, void *priv);
> +	int	(*swap_reader_page)(unsigned int cpu, void *priv);
> +};
> +
> +int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs, void *priv);
> +int trace_remote_alloc_buffer(struct trace_buffer_desc *desc, size_t size,
> +			      const struct cpumask *cpumask);
> +void trace_remote_free_buffer(struct trace_buffer_desc *desc);
> +
> +#endif
> diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
> index d2c79da81e4f..99af56d39eaf 100644
> --- a/kernel/trace/Kconfig
> +++ b/kernel/trace/Kconfig
> @@ -1238,4 +1238,7 @@ config HIST_TRIGGERS_DEBUG
>  


> +
> +int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs, void *priv)
> +{
> +	struct trace_remote *remote;
> +
> +	remote = kzalloc(sizeof(*remote), GFP_KERNEL);
> +	if (!remote)
> +		return -ENOMEM;
> +
> +	remote->cbs = cbs;
> +	remote->priv = priv;
> +	remote->trace_buffer_size = 7 << 10;
> +	remote->poll_ms = 100;

What's with the magic numbers?

> +	mutex_init(&remote->lock);
> +
> +	if (trace_remote_init_tracefs(name, remote)) {
> +		kfree(remote);
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +void trace_remote_free_buffer(struct trace_buffer_desc *desc)
> +{
> +	struct ring_buffer_desc *rb_desc;
> +	int cpu;
> +
> +	for_each_ring_buffer_desc(rb_desc, cpu, desc) {
> +		unsigned int id;
> +
> +		free_page(rb_desc->meta_va);
> +
> +		for (id = 0; id < rb_desc->nr_page_va; id++)
> +			free_page(rb_desc->page_va[id]);
> +	}
> +}
> +
> +int trace_remote_alloc_buffer(struct trace_buffer_desc *desc, size_t size,
> +			      const struct cpumask *cpumask)
> +{
> +	int nr_pages = (PAGE_ALIGN(size) / PAGE_SIZE) + 1;
> +	struct ring_buffer_desc *rb_desc;
> +	int cpu;
> +
> +	desc->nr_cpus = 0;
> +	desc->struct_len = offsetof(struct trace_buffer_desc, __data);

The above is better as:

	desc->struct_len = struct_size(desc, __data, 0);

As it also does some other checks, like make sure __data is a flexible
array.

> +
> +	rb_desc = (struct ring_buffer_desc *)&desc->__data[0];
> +
> +	for_each_cpu(cpu, cpumask) {
> +		unsigned int id;
> +
> +		rb_desc->cpu = cpu;
> +		rb_desc->nr_page_va = 0;
> +		rb_desc->meta_va = (unsigned long)__get_free_page(GFP_KERNEL);
> +		if (!rb_desc->meta_va)
> +			goto err;
> +
> +		for (id = 0; id < nr_pages; id++) {
> +			rb_desc->page_va[id] = (unsigned long)__get_free_page(GFP_KERNEL);
> +			if (!rb_desc->page_va[id])

What exactly are these pages allocated for? Is this what the remote will
use to write to? There should be more comments about how this is used.

> +				goto err;
> +
> +			rb_desc->nr_page_va++;
> +		}
> +		desc->nr_cpus++;
> +		desc->struct_len += offsetof(struct ring_buffer_desc, page_va);
> +		desc->struct_len += sizeof(rb_desc->page_va[0]) * rb_desc->nr_page_va;

Shouldn't the above be:

		desc->struct_len += struct_size(rb_desc, page_va, rb_desc->nr_page_va);

?

> +		rb_desc = __next_ring_buffer_desc(rb_desc);

Is there no check to make sure that the cpu mask matches what the rb_desc
will have?

-- Steve

> +	}
> +
> +	return 0;
> +
> +err:
> +	trace_remote_free_buffer(desc);
> +	return -ENOMEM;
> +}


