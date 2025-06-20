Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A44C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 15:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cN1LA4ycWLYTHnDpp5XY9WIgVZkngojcPUNGmlqXWbc=; b=VG65Ar+TfjcCuGWp4lHcJXMuzt
	iJNHiYw0lBM8GDCGzcj13qZSaoDj0nHgbvTn22hwtxC7CzSSzkW7JLWL9b3+6BjulTUK+SMtMkjre
	VGgPvZ4RFUlkkh8PSItmCiw05+f82ctbukAOG+VDk+B8OyHTs8mBwy/+nR6qX1V5fgy799i2uH1gB
	QpLcnPpg0SG6Q+vU0xU6dmtvf4986naGvuAa3IY+vNz4Ln4ek9J+POo+nCASg5F7DKcMcTc/798t+
	1JF7cXTgaQg+hWYbXAewf/OQOiUMpdB4hhJoQV9BVNL9DzxyOC4jX/XsMtOPPs9SZuALy+j98R89e
	ktwzWVeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSdm8-0000000Fzo8-0gke;
	Fri, 20 Jun 2025 15:35:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSdZU-0000000FxCv-3ksL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 15:22:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750432946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cN1LA4ycWLYTHnDpp5XY9WIgVZkngojcPUNGmlqXWbc=;
	b=d0caeUqITTRgH3jrOPfV9zlRVfxR/NRN9XGg9QL5+UGDSYaj1/gEg42n1RK1irXgq7sA7B
	9Z0eNdQRomWmIv1lFx8eYCFQamV2GF9TE54WGQTaiItKMgioQ8k4hPJSf22dCu9Jof+1Yc
	/Ubi+fbS6h7FjepitrTG6KipbCHiOek=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-rsvmqMAZOy-QIBjrDcfQ8g-1; Fri, 20 Jun 2025 11:22:24 -0400
X-MC-Unique: rsvmqMAZOy-QIBjrDcfQ8g-1
X-Mimecast-MFC-AGG-ID: rsvmqMAZOy-QIBjrDcfQ8g_1750432943
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450d64026baso12297575e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 08:22:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750432943; x=1751037743;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cN1LA4ycWLYTHnDpp5XY9WIgVZkngojcPUNGmlqXWbc=;
        b=iU+DmVb/NhkZOUwyNAkbyH9scuMZvXEiSomIYrY/Rfi8HRja5yWN8aA8Hlzz4TRlnD
         5mpE2jCuIIv3MgvUaL4zEDTJHmjmqXGU8JqIlGOUY3AGY+ngc14YNWKvrPHqNIl/gJz8
         2KvV8A+DYmK5xJMmife1gyGbxaOYHMKgV4PSVHNAALMjLj9A6IKdxgclH1BUYgus54iL
         +EGYCDagQamkwLgSJm/iwxvcqzMxZbb8nZqhpic89olxB0bRGLdfhoBLWlEbXkePfovz
         i7rb2FdNodAhALsgOtUbRULzQB6JxlmpAddgC2pDftJfpYMKPvzF0YinLsyG3nEqJ9sr
         HLew==
X-Forwarded-Encrypted: i=1; AJvYcCWiZeJDWS//0iPljLmqjTu8VkfCswTRkwaY4mw/nyA+Sy2H+CML+hs8HOW6pcWN6buqZmBdFVGFw1/JgUlQEcSu@lists.infradead.org
X-Gm-Message-State: AOJu0YziFYY0/aPXNmrZmhlZVydTDhK83BbrBBpvRxulsXhmgJrgxyDW
	quPjVvyInrPV63TtZmCruArTstwV2ofZ+mh5LEDpnWpFtIIYlfvguGDAmcr0jfjC3es98Zo61Bj
	PcYbnM0F32ny7lZLLXD0EPzY5F1r6Kqplh/nOHxJ+VudO5TWcM6kEzhoZIdniCn9f84oGtlBZGu
	n4
X-Gm-Gg: ASbGncu92qnYyHZdmdEUQp/4tXKKV1uaKXxzIKy9VKIn+m7QjQy2crjq9lkzNrzz8Yi
	BfvskCqzILwHeOGvU5TW0C1iP6UYOObjMv2j31GKRQ4cJR1AbICa7jvPSVkbD+xgTAvtQ4a3iBR
	m+GXDXDeBcZywH6zx+V7eCrJHXis5fJjhjdrD92BlQZb++mpEN0ZdtisqMCWfRnGw8lAh9GsPpI
	r1cyqRaXTIXQOH/x+BXps9bYJ9kaq9xvokjgdIh5pHrB71WoocG4C1KlTZvbZzaAi82ZQCLxBZh
	nhpiZOXjGN+nhKq8lCnpx1phdAnkqDUtv0Vy2YxZk9dNZxCBRtHI
X-Received: by 2002:a05:600c:4ec6:b0:43d:94:2d1e with SMTP id 5b1f17b1804b1-453659c5990mr33686665e9.13.1750432943258;
        Fri, 20 Jun 2025 08:22:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZmVpv8KaX6/5zmsF8suS17BhoS4C59H1HpKJfGYz4l67tvqNN65MS3ZSI+H8wSDwwq8cC1A==
X-Received: by 2002:a05:600c:4ec6:b0:43d:94:2d1e with SMTP id 5b1f17b1804b1-453659c5990mr33686485e9.13.1750432942892;
        Fri, 20 Jun 2025 08:22:22 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.47.238.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45364705748sm28034795e9.28.2025.06.20.08.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 08:22:21 -0700 (PDT)
Date: Fri, 20 Jun 2025 17:22:17 +0200
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
Message-ID: <aFV8qeH__bw0chWM@jlelli-thinkpadt14gen4.remote.csb>
References: <20250615131129.954975-1-kuyo.chang@mediatek.com>
 <aFAyN4rfssKmbUE5@jlelli-thinkpadt14gen4.remote.csb>
 <089882f95b1b910f7feecddd0ad9b17f38394c64.camel@mediatek.com>
 <aFQM8TdZIIvvGv8T@jlelli-thinkpadt14gen4.remote.csb>
 <6ec534be0618de3e2b4d81555e5f24155326c0b9.camel@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <6ec534be0618de3e2b4d81555e5f24155326c0b9.camel@mediatek.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iAq7KcuiD8l0XMSuDgcdVUKEIn0FPhHlQ4MIsf5g4yg_1750432943
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_082229_005735_E866F18B 
X-CRM114-Status: GOOD (  19.70  )
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

On 20/06/25 11:00, Kuyo Chang wrote:

...

> "DL replenish lagged too much" means the fair_server took much longer
> than expected to use up its running time,
> so the deadline fell way behind the clock (which is also why
> start_dl_timer() failed). 
> In this situation, just replenishing one dl_period isn’t enough to
> catch up.
>  
> A corner case is when there are too many IRQs or IPIs in the system.
> In this case, runtime gets consumed very slowly, and the fair_server
> keep running without being throttled.
> Even the runtime is exhausted finally, the fair_server would be
> restarted immediately.
> In the end, IRQs, IPIs, and fair tasks can take over the whole system,
> no chance for RT tasks to run.

Thanks for the additional explanation.

The way I understand it now is the following (of course please correct
me if I am still not getting it :)

- a dl_server is actively servicing NORMAL tasks, but suffers lot of IRQ
  load and cannot make much progress
- it does anyway make progress, but it reaches update_curr_dl_se@throttle
  only when its current deadline is past rq_clock
- dl_runtime_exceeded() branch is entered, but start_dl_timer() fails as
  the computed act is still in the past
- enqueue_dl_entity(REPLENISH) call replenish_dl_entity() which tries to
  add runtime and advance the deadline, but time moved on so far that
  deadline is still behind rq_clock() and so "DL replenish ..." is
  printed
- replenish_dl_new_period() updates runtime and deadline from current
  clock and the dl-server is put back to run (so it continues to run
  over/starve FIFO tasks)

It looks like your proposed fix might work in this particular corner
case, but I am not 100% comfortable with not trying to replenish
properly (catch up with runtime) at all. I wonder if we might then start
missing some other corner case. Maybe we could try to catch this
particular corner case before even attempting to start the dl_timer,
since we know it will fail, and do something at that point?

Thanks,
Juri


