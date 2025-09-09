Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5438ECA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 22:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yw7T3JsUc0RPouqKRz9Cm9GGOHHzRswV/b97PySgcRY=; b=odGEmO3+TVeFlmJlXOtl8oe5Ha
	2uqYdBW+rg30BbS5mXeuOFMu+YflNz/fu9ZdV2kN1n+zqwknWbB3bfneeXH6IWcmvYGHowuciDJ9G
	YNDQAQvfB2DZzNoKatZmXlLhVTzULIn4+70kWMIa0WhDyyvEp+xKbB8MEPfO9UB7Emb3E13UzFuAg
	Ab7Yl+4RTyWsjwl7lqGGK8Q49I0wuOghDpWbdp0vFFSIdWYIEIffxAWf48X7VNVCiGpHvHqAt0bRC
	47Bl2VOlHAJa7DQ003moOagJatujknsH7jGE0LFy+mLDT4ncvu+dwxdd/inat+bGRL3bo4/xGpdXA
	G+pylGlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw6mp-0000000AeLO-3xv5;
	Tue, 09 Sep 2025 22:26:03 +0000
Received: from smtprelay0011.hostedemail.com ([216.40.44.11] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw6mn-0000000AeJQ-1jMD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 22:26:03 +0000
Received: from omf15.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 45F441A0625;
	Tue,  9 Sep 2025 22:25:59 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf15.hostedemail.com (Postfix) with ESMTPA id DBC9E17;
	Tue,  9 Sep 2025 22:25:55 +0000 (UTC)
Date: Tue, 9 Sep 2025 18:26:44 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 10/24] tracing: Introduce simple_ring_buffer
Message-ID: <20250909182644.092b3e85@gandalf.local.home>
In-Reply-To: <20250821081412.1008261-11-vdonnefort@google.com>
References: <20250821081412.1008261-1-vdonnefort@google.com>
	<20250821081412.1008261-11-vdonnefort@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: DBC9E17
X-Stat-Signature: qekbbyyh8kfegcoqasdqbewhs4eyqhh9
X-Rspamd-Server: rspamout02
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/UjcafN7NImhCEZVMW2McIasMCJ9sknvk=
X-HE-Tag: 1757456755-177696
X-HE-Meta: U2FsdGVkX1/VwciSUcPZizGHp+txkjEwetKGK9p/xXLU+4DcFBk0WN1LhVSSvg8WXCYYMLAsGmRj5o+0BvjG8l7vJ/Fqh+gjnrQkYes83XdNnoezxyV0/LPtQT1AXK3igsajNKIOWGojKqcpLx7GU8rfeVnoWRAcowDo7oQyfm9VlmUIK21/lJ6bruR8TZVsnM4+VV8w/bl4O3tzxBTCUy+hU5Gu5S9jt6YZuGaGlmsh5UrbVt7jzA3fI4xt/LyiumJMgeu5BRb9qB0NmsWm8rcez9kmecU6lpdIcpSdi5PErDcfecZwHdgPtm8L51JvoPJRLkPN/87DuwAhLNmARYNXDCcffz2q
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_152601_535726_BA7B116A 
X-CRM114-Status: GOOD (  36.10  )
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

On Thu, 21 Aug 2025 09:13:58 +0100
Vincent Donnefort <vdonnefort@google.com> wrote:

> Add a simple implementation of the kernel ring-buffer. This intends to
> be used later by ring-buffer remotes such as the pKVM hypervisor, hence
> the need for a cut down version (write only) without any dependency.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> 
> diff --git a/include/linux/simple_ring_buffer.h b/include/linux/simple_ring_buffer.h
> new file mode 100644
> index 000000000000..d6761dc2f404
> --- /dev/null
> +++ b/include/linux/simple_ring_buffer.h
> @@ -0,0 +1,50 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _LINUX_SIMPLE_RING_BUFFER_H
> +#define _LINUX_SIMPLE_RING_BUFFER_H
> +
> +#include <linux/list.h>
> +#include <linux/ring_buffer.h>
> +#include <linux/ring_buffer_types.h>
> +#include <linux/types.h>
> +
> +/*
> + * Ideally those struct would stay private but the caller needs to know how big they are to allocate

Please keep comments within the 80 column rule.

Code can go beyond if it makes sense, but comments rarely make sense to be
extended. This does look funny in my emacs screens, as I do have them be 80
characters by default.

> + * the memory for simple_ring_buffer_init().
> + */
> +struct simple_buffer_page {
> +	struct list_head	list;
> +	struct buffer_data_page	*page;
> +	u64			entries;
> +	u32			write;
> +	u32			id;
> +};
> +
> +struct simple_rb_per_cpu {
> +	struct simple_buffer_page	*tail_page;
> +	struct simple_buffer_page	*reader_page;
> +	struct simple_buffer_page	*head_page;
> +	struct simple_buffer_page	*bpages;
> +	struct trace_buffer_meta	*meta;
> +	u32				nr_pages;
> +
> +#define SIMPLE_RB_UNAVAILABLE	0
> +#define SIMPLE_RB_READY		1
> +#define SIMPLE_RB_WRITING	2
> +	u32				status;
> +
> +	u64				last_overrun;
> +	u64				write_stamp;
> +
> +	struct simple_rb_cbs		*cbs;
> +};
> +
> +void *simple_ring_buffer_reserve(struct simple_rb_per_cpu *cpu_buffer, unsigned long length,
> +				 u64 timestamp);
> +void simple_ring_buffer_commit(struct simple_rb_per_cpu *cpu_buffer);
> +void simple_ring_buffer_unload(struct simple_rb_per_cpu *cpu_buffer);
> +int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_buffer_page *bpages,
> +			    const struct ring_buffer_desc *desc);
> +int simple_ring_buffer_enable_tracing(struct simple_rb_per_cpu *cpu_buffer, bool enable);
> +int simple_ring_buffer_swap_reader_page(struct simple_rb_per_cpu *cpu_buffer);
> +int simple_ring_buffer_reset(struct simple_rb_per_cpu *cpu_buffer);
> +#endif
> diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
> index 99af56d39eaf..918afcc1fcaf 100644
> --- a/kernel/trace/Kconfig
> +++ b/kernel/trace/Kconfig
> @@ -1241,4 +1241,7 @@ source "kernel/trace/rv/Kconfig"
>  config TRACE_REMOTE
>  	bool
>  
> +config SIMPLE_RING_BUFFER
> +	bool
> +
>  endif # FTRACE
> diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
> index 6dab341acc46..03d7d80a9436 100644
> --- a/kernel/trace/Makefile
> +++ b/kernel/trace/Makefile
> @@ -111,4 +111,5 @@ obj-$(CONFIG_TRACEPOINT_BENCHMARK) += trace_benchmark.o
>  obj-$(CONFIG_RV) += rv/
>  
>  obj-$(CONFIG_TRACE_REMOTE) += trace_remote.o
> +obj-$(CONFIG_SIMPLE_RING_BUFFER) += simple_ring_buffer.o
>  libftrace-y := ftrace.o
> diff --git a/kernel/trace/simple_ring_buffer.c b/kernel/trace/simple_ring_buffer.c
> new file mode 100644
> index 000000000000..3efdb895d77a
> --- /dev/null
> +++ b/kernel/trace/simple_ring_buffer.c
> @@ -0,0 +1,360 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025 - Google LLC
> + * Author: Vincent Donnefort <vdonnefort@google.com>
> + */
> +
> +#include <linux/atomic.h>
> +#include <linux/simple_ring_buffer.h>
> +
> +#include <asm/barrier.h>
> +#include <asm/local.h>
> +
> +#define SIMPLE_RB_LINK_HEAD	1UL
> +#define SIMPLE_RB_LINK_MASK	~SIMPLE_RB_LINK_HEAD
> +
> +static void simple_bpage_set_head_link(struct simple_buffer_page *bpage)
> +{
> +	unsigned long link = (unsigned long)bpage->list.next;
> +
> +	link &= SIMPLE_RB_LINK_MASK;
> +	link |= SIMPLE_RB_LINK_HEAD;
> +
> +	/*
> +	 * Paired with simple_bpage_is_head() to order access between the head link and overrun. It
> +	 * ensures we always report an up-to-date value after swapping the reader page.

Same with the above.

> +	 */
> +	smp_store_release(&bpage->list.next, (struct list_head *)link);
> +}
> +
> +static bool simple_bpage_is_head(struct simple_buffer_page *bpage)
> +{
> +	unsigned long link = (unsigned long)smp_load_acquire(&bpage->list.prev->next);
> +
> +	return link & SIMPLE_RB_LINK_HEAD;
> +}
> +
> +static bool simple_bpage_unset_head_link(struct simple_buffer_page *bpage,
> +					 struct simple_buffer_page *dst)
> +{
> +	unsigned long *link = (unsigned long *)(&bpage->list.next);
> +	unsigned long old = (*link & SIMPLE_RB_LINK_MASK) | SIMPLE_RB_LINK_HEAD;
> +	unsigned long new = (unsigned long)(&dst->list);
> +
> +	return try_cmpxchg(link, &old, new);
> +}
> +
> +static struct simple_buffer_page *simple_bpage_from_link(struct list_head *list)
> +{
> +	unsigned long ptr = (unsigned long)list & SIMPLE_RB_LINK_MASK;
> +
> +	return container_of((struct list_head *)ptr, struct simple_buffer_page, list);
> +}
> +
> +static struct simple_buffer_page *simple_bpage_next_page(struct simple_buffer_page *bpage)
> +{
> +	return simple_bpage_from_link(bpage->list.next);
> +}
> +
> +static void simple_bpage_reset(struct simple_buffer_page *bpage)
> +{
> +	bpage->write = 0;
> +	bpage->entries = 0;
> +
> +	local_set(&bpage->page->commit, 0);
> +}
> +
> +static void simple_bpage_init(struct simple_buffer_page *bpage, unsigned long page)
> +{
> +	INIT_LIST_HEAD(&bpage->list);
> +	bpage->page = (struct buffer_data_page *)page;
> +
> +	simple_bpage_reset(bpage);
> +}
> +
> +#define simple_rb_meta_inc(__meta, __inc)		\
> +	WRITE_ONCE((__meta), (__meta + __inc))
> +
> +static bool simple_rb_loaded(struct simple_rb_per_cpu *cpu_buffer)
> +{
> +	return !!cpu_buffer->bpages;
> +}
> +
> +int simple_ring_buffer_swap_reader_page(struct simple_rb_per_cpu *cpu_buffer)

If this is going to be used outside of this file, please add a kerneldoc to
it.

> +{
> +	struct simple_buffer_page *last, *head, *reader;
> +	unsigned long overrun;
> +
> +	if (!simple_rb_loaded(cpu_buffer))
> +		return -ENODEV;
> +
> +	head = cpu_buffer->head_page;
> +	reader = cpu_buffer->reader_page;
> +
> +	do {
> +		/* Run after the writer to find the head */
> +		if (!simple_bpage_is_head(head))
> +			head = simple_bpage_next_page(head);

Should this be a loop?

		while (!simple_bpage_is_head(head))
			head = simple_bpage_next_page(head);

But probably want a failure check:


		for (int i = 0; !simple_bpage_is_head(head); i++) {
			if (i > 2 * (nr_pages))
				return -EINVAL;
			head = simple_bpage_next_page(head);
		}


> +
> +		/* Connect the reader page around the header page */
> +		reader->list.next = head->list.next;
> +		reader->list.prev = head->list.prev;
> +
> +		/* The last page before the head */
> +		last = simple_bpage_from_link(head->list.prev);
> +
> +		/* The reader page points to the new header page */
> +		simple_bpage_set_head_link(reader);
> +
> +		overrun = cpu_buffer->meta->overrun;

We probably want another fail safe in case the links get corrupted somehow:

		if (loops++ > 1000)
			return -EINVAL;

> +	} while (!simple_bpage_unset_head_link(last, reader));
> +
> +	cpu_buffer->head_page = simple_bpage_from_link(reader->list.next);
> +	cpu_buffer->head_page->list.prev = &reader->list;
> +	cpu_buffer->reader_page = head;
> +	cpu_buffer->meta->reader.lost_events = overrun - cpu_buffer->last_overrun;
> +	cpu_buffer->meta->reader.id = cpu_buffer->reader_page->id;
> +	cpu_buffer->last_overrun = overrun;
> +
> +	return 0;
> +}
> +
> +static struct simple_buffer_page *simple_rb_move_tail(struct simple_rb_per_cpu *cpu_buffer)
> +{
> +	struct simple_buffer_page *tail, *new_tail;
> +
> +	tail = cpu_buffer->tail_page;
> +	new_tail = simple_bpage_next_page(tail);
> +
> +	if (simple_bpage_unset_head_link(tail, new_tail)) {
> +		/*
> +		 * Oh no! we've caught the head. There is none anymore and swap_reader will spin
> +		 * until we set the new one. Overrun must be written first, to make sure we report
> +		 * the correct number of lost events.

 80 char max.

Hmm, as the comment says, as the buffer is missing, it would cause the
above to spin. Perhaps we should add a flag somewhere that this update is
in process so that it doesn't trigger the exit?

		for (int i = 0; !simple_bpage_is_head(head); i++) {
			if (i > 2 * (nr_pages))
				return -EINVAL;
			if (cpu_buffer->head_moving)
				i = 0;
			head = simple_bpage_next_page(head);
		}

 ?


> +		 */
> +		simple_rb_meta_inc(cpu_buffer->meta->overrun, new_tail->entries);
> +		simple_rb_meta_inc(cpu_buffer->meta->pages_lost, 1);
> +
> +		simple_bpage_set_head_link(new_tail);
> +	}
> +
> +	simple_bpage_reset(new_tail);
> +	cpu_buffer->tail_page = new_tail;
> +
> +	simple_rb_meta_inc(cpu_buffer->meta->pages_touched, 1);
> +
> +	return new_tail;
> +}
> +
> +static unsigned long rb_event_size(unsigned long length)
> +{
> +	struct ring_buffer_event *event;
> +
> +	return length + RB_EVNT_HDR_SIZE + sizeof(event->array[0]);
> +}
> +
> +static struct ring_buffer_event *
> +rb_event_add_ts_extend(struct ring_buffer_event *event, u64 delta)
> +{
> +	event->type_len = RINGBUF_TYPE_TIME_EXTEND;
> +	event->time_delta = delta & TS_MASK;
> +	event->array[0] = delta >> TS_SHIFT;
> +
> +	return (struct ring_buffer_event *)((unsigned long)event + 8);
> +}
> +
> +static struct ring_buffer_event *
> +simple_rb_reserve_next(struct simple_rb_per_cpu *cpu_buffer, unsigned long length, u64 timestamp)
> +{
> +	unsigned long ts_ext_size = 0, event_size = rb_event_size(length);
> +	struct simple_buffer_page *tail = cpu_buffer->tail_page;
> +	struct ring_buffer_event *event;
> +	u32 write, prev_write;
> +	u64 time_delta;
> +
> +	time_delta = timestamp - cpu_buffer->write_stamp;

The remote buffers never get preempted do they?

That is, it doesn't need to handle different contexts like the normal
kernel does? (normal, softirq, irq, NMI, etc).

-- Steve

> +
> +	if (test_time_stamp(time_delta))
> +		ts_ext_size = 8;
> +
> +	prev_write = tail->write;
> +	write = prev_write + event_size + ts_ext_size;
> +
> +	if (unlikely(write > (PAGE_SIZE - BUF_PAGE_HDR_SIZE)))
> +		tail = simple_rb_move_tail(cpu_buffer);
> +
> +	if (!tail->entries) {
> +		tail->page->time_stamp = timestamp;
> +		time_delta = 0;
> +		ts_ext_size = 0;
> +		write = event_size;
> +		prev_write = 0;
> +	}
> +
> +	tail->write = write;
> +	tail->entries++;
> +
> +	cpu_buffer->write_stamp = timestamp;
> +
> +	event = (struct ring_buffer_event *)(tail->page->data + prev_write);
> +	if (ts_ext_size) {
> +		event = rb_event_add_ts_extend(event, time_delta);
> +		time_delta = 0;
> +	}
> +
> +	event->type_len = 0;
> +	event->time_delta = time_delta;
> +	event->array[0] = event_size - RB_EVNT_HDR_SIZE;
> +
> +	return event;
> +}
> +

