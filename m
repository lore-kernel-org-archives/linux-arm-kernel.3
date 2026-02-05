Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFD8EA794F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 01:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VhWkkCzJN0N9yRylLQl9JKfe5H7ytruJ5BAIgGxyQNc=; b=fXPN64ogPc7laKYY1SECqjmDSr
	OnNGJ8XedAkFhaBp/vwTthRy+ovdH//zOuffkT27YnfP1xXTFbMChm57WAUvFMTaxzwQMNFaD+R2q
	1vzmTxnVEtGSi/c+3VSxRuf4NMjtoQ7T347TP/ph19hkPqwoJRVn+SmArBOgSgc6LZtphkyuEHkRw
	P33wVbqUsp2vN4mOvT8r80uOpAQEFnVIDzdgqNY6rtaM7n6exJL/MSX+nk92quAYTZ51/+VyTJQcn
	qF8Hg5ISDpH8sZRws8mjD9vic0KG3cKI0a2UerWtG1X7hxjU6aIpGRaqAgCww6H1KqCLXYmuf32h5
	5qPCuh5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnnpt-00000009FVP-0Mg0;
	Thu, 05 Feb 2026 01:07:09 +0000
Received: from smtprelay0015.hostedemail.com ([216.40.44.15] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnnpp-00000009FTV-45YI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 01:07:07 +0000
Received: from omf09.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 66120587F8;
	Thu,  5 Feb 2026 01:07:02 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf09.hostedemail.com (Postfix) with ESMTPA id DFED820028;
	Thu,  5 Feb 2026 01:06:58 +0000 (UTC)
Date: Wed, 4 Feb 2026 20:06:57 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 13/30] tracing: Introduce simple_ring_buffer
Message-ID: <20260204200657.17b3cdf7@robin>
In-Reply-To: <20260131132848.254084-14-vdonnefort@google.com>
References: <20260131132848.254084-1-vdonnefort@google.com>
	<20260131132848.254084-14-vdonnefort@google.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout06
X-Rspamd-Queue-Id: DFED820028
X-Stat-Signature: 5qob6dma66gy78hnjtp6k5iesqm3q9jf
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+4FRyj2vp7Nvy6LqntMnnAcizFJFW9tug=
X-HE-Tag: 1770253618-87722
X-HE-Meta: U2FsdGVkX18EsP4u1JFWAo2oi/hgYNjRb6eNiUDejPAqeQ5fvKQvhuZztF8lVOpYQitvRWwCRWEudkXElSXUkWuD9+pm67E9sxtUrNfmXuucWwh8j3IPpRTiRb/DoBglMGZZfVPTwWALYS2R9W1MMhSOW5+EpYy6oQYpOU6qMFyy2aOevgLdN+S0fpLG8LMaIuGJlCdqYKPWwFsJGjFxzocrD8cXuXyflbyYL5X+YSV3UD78TaLYuQiNEFjnIYx5lIgIwiQWJfZuReSxzaredv6xEG933m/GGclTn1WlAoFre4T6L7MzWG+qwJjMXSjmVFqS5UAGsqQ4q0b98zcTgZozHAUXUmXLPzdmVcBdRoeHrazg/cnJt73JJkLgyQvoHMChnrlXjBAcwj1Nat0mXw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_170706_101582_31CDB6C3 
X-CRM114-Status: GOOD (  22.06  )
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

On Sat, 31 Jan 2026 13:28:31 +0000
Vincent Donnefort <vdonnefort@google.com> wrote:
\
> +/**
> + * simple_ring_buffer_swap_reader_page - Swap ring-buffer head with the reader
> + *
> + * This function enables consuming reading. It ensures the current head page will not be overwritten
> + * and can be safely read.
> + *
> + * @cpu_buffer: A simple_rb_per_cpu

And if you're going to do kerneldoc, you need to do it correctly ;-)

You put the description before the parameters.

> + *
> + * Returns 0 on success, -ENODEV if @cpu_buffer was unloaded or -EBUSY if we failed to catch the
> + * head page.
> + */
> +int simple_ring_buffer_swap_reader_page(struct simple_rb_per_cpu *cpu_buffer)
> +{
> +	struct simple_buffer_page *last, *head, *reader;
> +	unsigned long overrun;
> +	int retry = 8;
> +	int ret;
> +
> +	if (!simple_rb_loaded(cpu_buffer))
> +		return -ENODEV;
> +
> +	reader = cpu_buffer->reader_page;
> +
> +	do {
> +		/* Run after the writer to find the head */
> +		ret = simple_rb_find_head(cpu_buffer);
> +		if (ret)
> +			return ret;
> +
> +		head = cpu_buffer->head_page;
> +
> +		/* Connect the reader page around the header page */
> +		reader->link.next = head->link.next;
> +		reader->link.prev = head->link.prev;
> +
> +		/* The last page before the head */
> +		last = simple_bpage_from_link(head->link.prev);
> +
> +		/* The reader page points to the new header page */
> +		simple_bpage_set_head_link(reader);
> +
> +		overrun = cpu_buffer->meta->overrun;
> +	} while (!simple_bpage_unset_head_link(last, reader, SIMPLE_RB_LINK_NORMAL) && retry--);
> +
> +	if (!retry)
> +		return -EINVAL;
> +
> +	cpu_buffer->head_page = simple_bpage_from_link(reader->link.next);
> +	cpu_buffer->head_page->link.prev = &reader->link;
> +	cpu_buffer->reader_page = head;
> +	cpu_buffer->meta->reader.lost_events = overrun - cpu_buffer->last_overrun;
> +	cpu_buffer->meta->reader.id = cpu_buffer->reader_page->id;
> +	cpu_buffer->last_overrun = overrun;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(simple_ring_buffer_swap_reader_page);
> +
> +static struct simple_buffer_page *simple_rb_move_tail(struct simple_rb_per_cpu *cpu_buffer)
> +{
> +	struct simple_buffer_page *tail, *new_tail;
> +
> +	tail = cpu_buffer->tail_page;
> +	new_tail = simple_bpage_next_page(tail);
> +
> +	if (simple_bpage_unset_head_link(tail, new_tail, SIMPLE_RB_LINK_HEAD_MOVING)) {
> +		/*
> +		 * Oh no! we've caught the head. There is none anymore and
> +		 * swap_reader will spin until we set the new one. Overrun must
> +		 * be written first, to make sure we report the correct number
> +		 * of lost events.
> +		 */
> +		simple_rb_meta_inc(cpu_buffer->meta->overrun, new_tail->entries);
> +		simple_rb_meta_inc(cpu_buffer->meta->pages_lost, 1);
> +
> +		simple_bpage_set_head_link(new_tail);
> +		simple_bpage_set_normal_link(tail);
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
> +/**
> + * simple_ring_buffer_reserve - Reserve an entry in @cpu_buffer
> + *

And you don't leave a space between the one line description and the
arguments.

> + * @cpu_buffer:	A simple_rb_per_cpu
> + * @length:	Size of the entry in bytes
> + * @timestamp:	Timestamp of the entry
> + *
> + * Returns the address of the entry where to write data or NULL
> + */
> +void *simple_ring_buffer_reserve(struct simple_rb_per_cpu *cpu_buffer, unsigned long length,
> +				 u64 timestamp)
> +{
> +	struct ring_buffer_event *rb_event;
> +
> +	if (cmpxchg(&cpu_buffer->status, SIMPLE_RB_READY, SIMPLE_RB_WRITING) != SIMPLE_RB_READY)
> +		return NULL;
> +
> +	rb_event = simple_rb_reserve_next(cpu_buffer, length, timestamp);
> +
> +	return &rb_event->array[1];
> +}
> +EXPORT_SYMBOL_GPL(simple_ring_buffer_reserve);
> +

Other than that:

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve

