Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AA3C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 10:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bsrA2A2QMyCV/Ikd00XgPWtG5DcZPDcgRSJ6z3M0gt8=; b=djLJHBdto7r5NFJUXvFKXlGElz
	RJgDeu9C7cTN8DvphnscNPhjPUvjARSsLClp43J7wzZtkr15kaXu27RYnD070tr4QRNcQe2i/NuBp
	MO+HG5khNbMTOMYrx91s2gyOgaNINAO1UQcC49QZeTJxsU2H3cjX2TrdtHcsshg7lldg4XHE29gBs
	5rrJQQ80RMFS2DWLNw8qiXCLEBEUtgelph/OdXovcr8P6mHp4GDsAdz0zXpVkejT0dk6lXQ6I8D7Z
	xl3/nNq3ZmOjSswBk9COYBW0LXoHJ4oXfNSZCZ6jghOTaTTxUMaHCCOck326MjqZpJFElInaFWzNh
	T2XWBagg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh3kM-00000001CYm-3fx7;
	Wed, 30 Jul 2025 10:09:18 +0000
Received: from mail-ua1-f42.google.com ([209.85.222.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh3hq-00000001CJW-2mMe;
	Wed, 30 Jul 2025 10:06:43 +0000
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-87f1b3a3e7bso1501950241.1;
        Wed, 30 Jul 2025 03:06:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753870001; x=1754474801;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bsrA2A2QMyCV/Ikd00XgPWtG5DcZPDcgRSJ6z3M0gt8=;
        b=e7ecGuV+Y777Ako5km/2GQFhZ8WyKldKajoppBJbOF/oyw5egJDcFDgOkQhqfbsxqr
         r9NlFu0OsHSfSzOjzREontZHi24llzGdY8T3joHu5TnjI0Amy+g3rgduiAitu0mL1Pb5
         /T5Rr2pKZ7ACmRirXLinf/Uon9rnokqxD86AyxWjhoZidv3128VzYZnflgt9RopLhrJO
         pIYl/xUOTynZlS80nn1kP5Rw4nUJL0IH7YKJGWql3Yjrt1dNaCHH4AwjMXypEQK2DB63
         xJVMiUcZRDEdNy3CwD4MVKHiCaO/Nug4MjH85uNeipeiZr0ejYawmhqIeOeCd3wpJ/Gi
         6I8A==
X-Forwarded-Encrypted: i=1; AJvYcCUJFxdXjcqF7vUeZE+MNQ5Ga3+SJSRjXSZ+EfQvLLDoJ96hNT0rDtWQe8Yhhvn5u7fC9LPggh0UmCAk/7EnPqE=@lists.infradead.org, AJvYcCXMAqQzworKFYAOD0MoYdy5GznH57uL/G45Mwpro0LwojOK8o+mSA9QJTGEWZAj2vbckiOh5COUvwTqXJ+ow+VL@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3amD5DLct2LLlqwT124Y7JnWSEZL1w2ShTE1j6gdvQBZAimvi
	DYY0oUSNPmX5AKHJXtQ7F4xxEMgfLRHUngJkYxF9/GTeTq0OAqi9BLTFlpU9RnN6
X-Gm-Gg: ASbGncvmycIrYpaWrps7eCT2OMWSqjxkUUXFzuplyJOEhJ7h15OkBOdNu9SXPWMDCgc
	4othv8xULX4mWRQ0Q9sNG9IsK7XpHgV1YoJgs9CdcJtDCCV7eJofTN2ZLtORfIHbO8ocDNU46Ym
	p0DDnb+i57TpvrqesyI1TuAm0CoiZHrRFt5P5xUHS3lgq/HUDpPhh7RO+sphDh7XfuR5vtOpVbk
	k75zOvGkC86n4Sgw6sK6ml6jJ5dmQMuVKq14T+dDbydCRKzS71S7D20YU1kQW5BmB84Mt4li/RX
	uIwZ1gEaB0TT2fhzU8avgDDRggZ0HcoFHia21wfIPLrdwACfRdX//91JAuxZmwFv+nyk3kj/+wc
	uvwfqm6RseICn6hA8beSj4VLvNyPfKBe8zSeWTSAxtSe+ObaQjMsKb2MdC49y
X-Google-Smtp-Source: AGHT+IEM6ew48HomVl6yxyiNu8vmOgLDYS7CMyQVLquJMNNa0lun+yUpo5dCqJf69jprIpLjIUsS0w==
X-Received: by 2002:a05:6102:3e92:b0:4fb:dde8:76cf with SMTP id ada2fe7eead31-4fbe8753b11mr1756226137.13.1753870001452;
        Wed, 30 Jul 2025 03:06:41 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4fa678adeb5sm1185880137.18.2025.07.30.03.06.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 03:06:40 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-88bacb82a6dso705358241.3;
        Wed, 30 Jul 2025 03:06:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUnARc9EDXvSzIrqH+NAhS+B6LrEPCQ2D958X+P1/M5gKT86e8y0SCegY6oE7unOlrOGbrDvCV/yYWvGPFGq/ET@lists.infradead.org, AJvYcCVv5TUCpMKT38ZQS3FdmpSOiiHojtvGwAefPssiRcazepJdK8V8SW6lhag40occHIHad0XkDpUUfTuGsgWD7Po=@lists.infradead.org
X-Received: by 2002:a05:6102:3c81:b0:4fb:dd65:b97f with SMTP id
 ada2fe7eead31-4fbe87dd1aamr1637733137.23.1753869999913; Wed, 30 Jul 2025
 03:06:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250615131129.954975-1-kuyo.chang@mediatek.com>
In-Reply-To: <20250615131129.954975-1-kuyo.chang@mediatek.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Jul 2025 12:06:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWZHwr_nmMbVREKC9nQCYigT_gvKH3M9v+oyYqk6FLONw@mail.gmail.com>
X-Gm-Features: Ac12FXwS-l7uHGU1oTYcgJSesd4W3K8Q8G2IZz1kbq4jmTeRDTrEyXIFWqDBxL0
Message-ID: <CAMuHMdWZHwr_nmMbVREKC9nQCYigT_gvKH3M9v+oyYqk6FLONw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] sched/deadline: Fix RT task potential starvation
 when expiry time passed
To: Kuyo Chang <kuyo.chang@mediatek.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, jstultz <jstultz@google.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_030642_693614_B298E133 
X-CRM114-Status: GOOD (  24.58  )
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

Hi Kuyo,

On Mon, 16 Jun 2025 at 14:39, Kuyo Chang <kuyo.chang@mediatek.com> wrote:
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

Thanks, this fixes the issue I was seeing!

Closes: https://lore.kernel.org/CAMuHMdXn4z1pioTtBGMfQM0jsLviqS2jwysaWXpoLxWYoGa82w@mail.gmail.com
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

