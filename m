Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A8FCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 21:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vB94mPddW4cgqmg6+HeYmIAiKVTW0/CQoLSLEX8gs+I=; b=fP4C+Zv9Pg0Kc5rVd9C40XOOA7
	r/SCjGxYLdLI6QI/1bdoJV9e5hA/gfXbpHDD8495R8HucxVJzR50RjDvAp7IH0iKglgaryfwH8fIA
	SSxVjQRNe6KqZHAS3isa9kK7QIc8Fn/S7O1YNfBv8KybiCEOaaR05jDzHxNJqwAGKcoKlp2+1aMlZ
	Y2prb0+/pBqDksIoedFT/xivzTkv/8QY90Xw5CmYc0Er9ckHPAvkesD0qmc3SBLVUBLzG425TG4BF
	IL97i/AD2VSJIaODPinMeO8hMsRn2doa5QaXBDRcUda+ZZvOIyRK+fk37FAohmMNKNCktG6ltVyLk
	wFxh/OZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw6BE-0000000AUIJ-1hJy;
	Tue, 09 Sep 2025 21:47:12 +0000
Received: from smtprelay0013.hostedemail.com ([216.40.44.13] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw6BB-0000000AUH7-34BM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 21:47:11 +0000
Received: from omf18.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 8E31F140119;
	Tue,  9 Sep 2025 21:47:06 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf18.hostedemail.com (Postfix) with ESMTPA id F1A102F;
	Tue,  9 Sep 2025 21:47:02 +0000 (UTC)
Date: Tue, 9 Sep 2025 17:47:50 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 06/24] tracing: Add events to trace remotes
Message-ID: <20250909174750.72be9bbc@gandalf.local.home>
In-Reply-To: <20250821081412.1008261-7-vdonnefort@google.com>
References: <20250821081412.1008261-1-vdonnefort@google.com>
	<20250821081412.1008261-7-vdonnefort@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 7ej5srhi7m6dgtzrcpzb7hsqh8cx9fhr
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: F1A102F
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+a22/GqU1qf8xhKUjNZ3RQSMe8o75J0/I=
X-HE-Tag: 1757454422-816481
X-HE-Meta: U2FsdGVkX1+MvwcffwkTYY4ptHTCjtVWAhsGAZBNw+vbcSDhGOmJ57KfO9RcRgJyDZ7EMrHLo//as4KF2ZC7464Edt85xLb32cnKLFN690CNFKswW4Bz3sjDMJN1RrqzpF7mk143fnM1ZtLJSfThUbqWXcvj3Zg1Lu9AxVbp41YNt6DG5haSE/V1tiaKAj/2e0X+WCTO9Lf0X6lRMxGO8TRxXK/mlnv8xXdxBXd8kCltiEIFf0LsNw5Ycq2HHG8zVEfoFYFr57k1wrlzWpuzmMY7SvwVs+bIvAvytdIqtaLvCHQR1r90l/Clh7yLvQbsvk1lSpG27MYvzlTzDWhENKoRw42PjCZq
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_144709_834064_9899D4C1 
X-CRM114-Status: GOOD (  12.79  )
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

On Thu, 21 Aug 2025 09:13:54 +0100
Vincent Donnefort <vdonnefort@google.com> wrote:

> @@ -265,16 +272,19 @@ static struct trace_remote_iterator *trace_remote_iter(struct trace_remote *remo
>  static bool trace_remote_iter_next(struct trace_remote_iterator *iter)
>  {
>  	struct trace_buffer *trace_buffer = iter->remote->trace_buffer;
> +	struct ring_buffer_event *rb_evt;
>  	int cpu = iter->cpu;
>  
>  	if (cpu != RING_BUFFER_ALL_CPUS) {
>  		if (ring_buffer_empty_cpu(trace_buffer, cpu))
>  			return false;
>  
> -		if (!ring_buffer_peek(trace_buffer, cpu, &iter->ts, &iter->lost_events))
> +		rb_evt = ring_buffer_peek(trace_buffer, cpu, &iter->ts, &iter->lost_events);
> +		if (!rb_evt)
>  			return false;
>  
>  		iter->evt_cpu = cpu;
> +		iter->evt = (struct remote_event_hdr *)&rb_evt->array[1];

Hmm, shouldn't this use ring_buffer_event_data(rb_evt) instead?

If the events get big, then it would be array[2]. But the
ring_buffer_event_data() hides that detail.

>  		return true;
>  	}
>  
> @@ -286,7 +296,8 @@ static bool trace_remote_iter_next(struct trace_remote_iterator *iter)
>  		if (ring_buffer_empty_cpu(trace_buffer, cpu))
>  			continue;
>  
> -		if (!ring_buffer_peek(trace_buffer, cpu, &ts, &lost_events))
> +		rb_evt = ring_buffer_peek(trace_buffer, cpu, &ts, &lost_events);

Ditto.

> +		if (!rb_evt)
>  			continue;
>  
>  		if (ts >= iter->ts)
> @@ -294,14 +305,18 @@ static bool trace_remote_iter_next(struct trace_remote_iterator *iter)
>  
>  		iter->ts = ts;
>  		iter->evt_cpu = cpu;
> +		iter->evt = (struct remote_event_hdr *)&rb_evt->array[1];

Ditto.

-- Steve

>  		iter->lost_events = lost_events;
>  	}
>  
>  	return iter->ts != U64_MAX;
>  }
>  
> +static struct remote_event *trace_remote_find_event(struct trace_remote *remote, unsigned short id);
> +
>  static int trace_remote_iter_print(struct trace_remote_iterator *iter)
>  {
> +	struct remote_event *evt;
>  	unsigned long usecs_rem;
>  	u64 ts = iter->ts;
>  

