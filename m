Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9998FC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 17:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EcC4byrcEUPIdKwUEd3oRWjU7qMWY/kqFoLn+sap6V0=; b=y6oRGHbBf+s2wmDClzEpV8fKJv
	+R12dusGIKa3UG/0lG9JAoBQ1J4wInT0EdRMc8rk8+PHVyrOqIP9aJdAHjz1I497DnWOo+Y4qatY6
	NMD3P1rZRvIeWCmSN1nTFqpcJLtfyDTyFMY4WfWD7vbrcNWK37FaPoNd2wct2zgDlfo4oPX7gVTlF
	0FUAOxWC7XZ/5QQ5eZX4ZQC66q4PtWq5y3DX+d/K7BW/HkbDgjZUdkECrbsl4gEVR6/Qvvh1eDVTj
	p2QRyAPujm6wWPZVvAeZTQKLjK4vX78xkb/mBXmd8kZKYhSE9qw5Z22Bxh3qRaFbC2PguxzvFzj0u
	w9WLFzbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRDLs-000000055et-0gSJ;
	Mon, 16 Jun 2025 17:10:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBMt-00000004n2C-3xIr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 15:03:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750086206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EcC4byrcEUPIdKwUEd3oRWjU7qMWY/kqFoLn+sap6V0=;
	b=iVWlI9gHv2QeXgkY92CizPX7/MEKb/RKJffqGT7wr16KSExUWYx0+sca2jqJ7Ihw4TBZ6q
	KnQ2Lrcw0l879SM7YqL8N3DcTVuVNWyhN82pkoPgYSMkRK/O+tJuEm3lLdE3sz/BDHbhKP
	x4wR/7qAl6jRcRUq2vxBGIRTwSmLgZs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-CaThpF1INDyH8vhGIeVdug-1; Mon, 16 Jun 2025 11:03:25 -0400
X-MC-Unique: CaThpF1INDyH8vhGIeVdug-1
X-Mimecast-MFC-AGG-ID: CaThpF1INDyH8vhGIeVdug_1750086204
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45311704d22so30500105e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 08:03:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750086204; x=1750691004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EcC4byrcEUPIdKwUEd3oRWjU7qMWY/kqFoLn+sap6V0=;
        b=AmZVvwMkc43SO0y0BqMDv1PKpscw1OAddFEPHKiA0Xw3hD0jMJAa8fnWl7GxGKtPCK
         M3xcfCIh/u2kVr6uFtCaPfEJpgs2/8mgmQxAH6B68y6dGkbYD5KNiwxjnRLa7ZyPWx7C
         Ln0SqWpqYiLjN8UJYgJwZmmm8s5YzRwx+vRQUu0fbsZgRWKa+92IYSp1p063SfKcX79X
         sn0lyk5N17EWxQrDJoDdYSGI2ZxHbK3SvgBkTDPJhyky1v9Fgm1ImSJGf7yJJ0hRJbHl
         tU8pIvwwh4Qvjk2in4+XYb/tDE0g7c4tgW40SSnXszxLFlC0mHj/uBXWOIbc7HttU1Ti
         iIYA==
X-Forwarded-Encrypted: i=1; AJvYcCX0FSHgo94WQP0QsLo/4RaNzDzYnmNytfzxjdev5KaXqG9Z1ggFjdsNELJ9jPs16UyihfLY8Svar+ygrcVvBrPV@lists.infradead.org
X-Gm-Message-State: AOJu0YwBw9dqO6l37Rhf0SrtxBthX8fUx3a/JdcQ0CmCXmUqtyeyyHQa
	C3dtBwGMxNkJ3Q6pHv+8NVI6HwV2vGFnoXU59rTAuXBkvoMEmEvsNMNH3P8vsYYILnOx8AoYwBO
	3a0uI5U9NtWjb5DBwYu9BbQ2izYTCiSZKJrV4uPeMu3LDkMAoAnDpttK3CXc0fMn3HG1sEK/yqG
	rH
X-Gm-Gg: ASbGncuOdrIVcN8krN+ibJ05EwYa7vnV/LAYTCPlPnuwYu7lI4VvbZK/jK7BIbhfZLy
	J3k0Y4Z0KbChlM3p8Pwtr1kQwq1mePxxUfivKml44G/lqABA0dxzzsB72ynwyodmiJ1Lgow3C6D
	CZZXn+OB6AZ5/kMMSSrsGa+qSAJBEy66FCvRdsHdUM5g7Lumh9BAbQPsdnpxA8fmUsA3a9ehRe+
	cVI5ZbBq8JaGGKzEvuFUv3vu1ezMH54URJE6k+zYO2fB83w/6zZZlRN6zKfpj+Z6Sf9IjWXJEEg
	tklU4BWsbF4NHS9S3aaFFMpO3pX8dsWajnAXZZzzXBoGUCvF/2sfQQ==
X-Received: by 2002:a05:600c:1c0b:b0:453:1058:f8aa with SMTP id 5b1f17b1804b1-453418d1130mr80887085e9.15.1750086202706;
        Mon, 16 Jun 2025 08:03:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwbopF1lAROE8wS+9Rv9HcGYsH05oxJyFYV2hv8O12MmuXoDowsfWwuiEaJ3XXZOmwYHksiA==
X-Received: by 2002:a05:600c:1c0b:b0:453:1058:f8aa with SMTP id 5b1f17b1804b1-453418d1130mr80885955e9.15.1750086201916;
        Mon, 16 Jun 2025 08:03:21 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.151.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8f2e0sm145748335e9.8.2025.06.16.08.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:03:21 -0700 (PDT)
Date: Mon, 16 Jun 2025 17:03:19 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Kuyo Chang <kuyo.chang@mediatek.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	jstultz <jstultz@google.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [RFC PATCH 1/1] sched/deadline: Fix RT task potential starvation
 when expiry time passed
Message-ID: <aFAyN4rfssKmbUE5@jlelli-thinkpadt14gen4.remote.csb>
References: <20250615131129.954975-1-kuyo.chang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20250615131129.954975-1-kuyo.chang@mediatek.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8Gn9n0NKtvmlLGPz2aHoapoBCXxLhONgh7_8z6Pm5PA_1750086204
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_080328_053257_5ABBB6C8 
X-CRM114-Status: GOOD (  23.51  )
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

Hello,

On 15/06/25 21:10, Kuyo Chang wrote:
> From: kuyo chang <kuyo.chang@mediatek.com>
> 
> [Symptom]
> The fair server mechanism, which is intended to prevent fair starvation
> when higher-priority tasks monopolize the CPU.
> Specifically, RT tasks on the runqueue may not be scheduled as expected.
> 
> [Analysis]
> ---------
> The log "sched: DL replenish lagged too much" triggered.
> 
> By memory dump of dl_server:
> --------------
>     curr = 0xFFFFFF80D6A0AC00 (
>       dl_server = 0xFFFFFF83CD5B1470(
>         dl_runtime = 0x02FAF080,
>         dl_deadline = 0x3B9ACA00,
>         dl_period = 0x3B9ACA00,
>         dl_bw = 0xCCCC,
>         dl_density = 0xCCCC,
>         runtime = 0x02FAF080,
>         deadline = 0x0000082031EB0E80,
>         flags = 0x0,
>         dl_throttled = 0x0,
>         dl_yielded = 0x0,
>         dl_non_contending = 0x0,
>         dl_overrun = 0x0,
>         dl_server = 0x1,
>         dl_server_active = 0x1,
>         dl_defer = 0x1,
>         dl_defer_armed = 0x0,
>         dl_defer_running = 0x1,
>         dl_timer = (
>           node = (
>             expires = 0x000008199756E700),
>           _softexpires = 0x000008199756E700,
>           function = 0xFFFFFFDB9AF44D30 = dl_task_timer,
>           base = 0xFFFFFF83CD5A12C0,
>           state = 0x0,
>           is_rel = 0x0,
>           is_soft = 0x0,
>     clock_update_flags = 0x4,
>     clock = 0x000008204A496900,
> 
> - The timer expiration time (rq->curr->dl_server->dl_timer->expires)
>   is already in the past, indicating the timer has expired.
> - The timer state (rq->curr->dl_server->dl_timer->state) is 0.
> 
> [Suspected Root Cause]
> --------------------
> The relevant code flow in the throttle path of
> update_curr_dl_se() as follows:
> 
> dequeue_dl_entity(dl_se, 0);                // the DL entity is dequeued
> 
> if (unlikely(is_dl_boosted(dl_se) || !start_dl_timer(dl_se))) {
>     if (dl_server(dl_se))                   // timer registration fails
>         enqueue_dl_entity(dl_se, ENQUEUE_REPLENISH);//enqueue immediately
>     ...
> }
> 
> The failure of `start_dl_timer` is caused by attempting to register a
> timer with an expiration time that is already in the past. When this
> situation persists, the code repeatedly re-enqueues the DL entity
> without properly replenishing or restarting the timer, resulting in RT
> task may not be scheduled as expected.
> 
> [Proposed Solution]:
> ------------------
> Instead of immediately re-enqueuing the DL entity on timer registration
> failure, this change ensures the DL entity is properly replenished and
> the timer is restarted, preventing RT potential starvation.
> 
> Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
> ---
>  kernel/sched/deadline.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index ad45a8fea245..e50cb76c961b 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -1556,10 +1556,12 @@ static void update_curr_dl_se(struct rq *rq, struct sched_dl_entity *dl_se, s64
>  		}
>  
>  		if (unlikely(is_dl_boosted(dl_se) || !start_dl_timer(dl_se))) {
> -			if (dl_server(dl_se))
> -				enqueue_dl_entity(dl_se, ENQUEUE_REPLENISH);
> -			else
> +			if (dl_server(dl_se)) {
> +				replenish_dl_new_period(dl_se, rq);
> +				start_dl_timer(dl_se);

But, even today, enqueue_dl_entity() is called with ENQUEUE_REPLENISH
flag, so I don't get why you say 're-enqueues the DL entity without
properly replenishing'.

Also, why restarting the replenishing timer right after having
replenished the entity?

Thanks,
Juri


