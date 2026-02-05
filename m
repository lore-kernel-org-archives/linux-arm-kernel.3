Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF95EA794D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 00:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OyNbnvhDaPu4MAHvNlAEfzIXhL3VUBTKkdtOqiSXQ40=; b=DT8kh4XdE57xGGC1umdZailnJC
	2oeXC4zlaSXeuUOlPr7wtSUAgkF7EKp7/CN7CdyRbTAgMhwJJguWtzzK2mzbHmi3oClwbGcHipFRK
	pnW+NErjve/BAc9fM4H2xMA/r/DI6d0uJ5K42GqcEdcYD9pWD/gQEs0uU4bFNmfC0wSWcFOpTgGLC
	1RXceQJ9J3J6oX9DvRWQbrPGam1hdhzto7PmTF0S/Q7zdIhJbSCpVDkcia0eemofpdu50FTdvtWcS
	zjC8L7Xysm4PSaoqhhaUa3LJ88j3mf644ieLbt0otQ08lvUFTKIN/N5ioPkcgWwGPc7Vb17wxdHSF
	6qqzwmsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnnQU-00000009E6K-2YEN;
	Thu, 05 Feb 2026 00:40:55 +0000
Received: from smtprelay0017.hostedemail.com ([216.40.44.17] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnnQR-00000009E5x-2uXo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 00:40:53 +0000
Received: from omf02.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 80681B8666;
	Thu,  5 Feb 2026 00:40:45 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf02.hostedemail.com (Postfix) with ESMTPA id B5FAE8000E;
	Thu,  5 Feb 2026 00:40:41 +0000 (UTC)
Date: Wed, 4 Feb 2026 19:40:40 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 09/30] tracing: Add events to trace remotes
Message-ID: <20260204194040.30aff151@robin>
In-Reply-To: <20260131132848.254084-10-vdonnefort@google.com>
References: <20260131132848.254084-1-vdonnefort@google.com>
	<20260131132848.254084-10-vdonnefort@google.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout06
X-Rspamd-Queue-Id: B5FAE8000E
X-Stat-Signature: gs59tekaskcuwcy645fm8izpg3hrje74
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+nXosfAYo2fUF2Ivd/Xmy2vCcs9gSfwy0=
X-HE-Tag: 1770252041-244299
X-HE-Meta: U2FsdGVkX1/iA16V/WxPX1xn7eUAz8YuJnJRROkLvYFXycB4HpiSKeqNps6QKewK7Rc+mpitAlABvyauscnWVU+eG7yKgtT9esslqC5i0qdwFo4jzvfl8p22J+uRmdu2Uiz1iGD1Rf9WsmoLBklMsEJnEI95aVbJHpLdztEXRb/3czaENG33tIaapl1OOv6yha4zRdA7b7QPzEPTg29wT2e7A869w8J20fUHdbDbHa7+LhFgfFaPGpzwSHvzTQk/Gf/OaAm7Ig+mXuKUJEJNh/1AdkrMaeEhTn5LKg5Wr1yh5FKQguAs48myZBRjeNdR5U3sxsPYIyowNtoS3YU3ZlYU6Cv2JRgSYEJ4w/boDlMJlYO8vwRPFx6BaJ1nHw1U7eh1+OkluPHn43ftIPOHFQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_164051_818203_971C3C01 
X-CRM114-Status: GOOD (  10.48  )
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

On Sat, 31 Jan 2026 13:28:27 +0000
Vincent Donnefort <vdonnefort@google.com> wrote:

> @@ -487,16 +494,19 @@ __peek_event(struct trace_remote_iterator *iter, int cpu, u64 *ts, unsigned long
>  static bool trace_remote_iter_read_event(struct trace_remote_iterator *iter)
>  {
>  	struct trace_buffer *trace_buffer = iter->remote->trace_buffer;
> +	struct ring_buffer_event *rb_evt;
>  	int cpu = iter->cpu;
>  
>  	if (cpu != RING_BUFFER_ALL_CPUS) {
>  		if (ring_buffer_empty_cpu(trace_buffer, cpu))
>  			return false;
>  
> -		if (!__peek_event(iter, cpu, &iter->ts, &iter->lost_events))
> +		rb_evt = __peek_event(iter, cpu, &iter->ts, &iter->lost_events);
> +		if (!rb_evt)
>  			return false;
>  
>  		iter->evt_cpu = cpu;
> +		iter->evt = (struct remote_event_hdr *)ring_buffer_event_data(rb_evt);

BTW, you don't need to typecast the return of ring_buffer_event_data()
as that returns a void pointer.

>  		return true;
>  	}
>  
> @@ -508,7 +518,8 @@ static bool trace_remote_iter_read_event(struct trace_remote_iterator *iter)
>  		if (ring_buffer_empty_cpu(trace_buffer, cpu))
>  			continue;
>  
> -		if (!__peek_event(iter, cpu, &ts, &lost_events))
> +		rb_evt = __peek_event(iter, cpu, &ts, &lost_events);
> +		if (!rb_evt)
>  			continue;
>  
>  		if (ts >= iter->ts)
> @@ -516,6 +527,7 @@ static bool trace_remote_iter_read_event(struct trace_remote_iterator *iter)
>  
>  		iter->ts = ts;
>  		iter->evt_cpu = cpu;
> +		iter->evt = (struct remote_event_hdr *)ring_buffer_event_data(rb_evt);

ditto.

>  		iter->lost_events = lost_events;
>  	}
>  

Other than that...

Review-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve


> @@ -536,8 +548,11 @@ static void trace_remote_iter_move(struct trace_remote_iterator *iter)
>  	}
>  }
>  

