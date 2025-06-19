Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1CCC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j6QZTbgBsBIWN9k4dZ6Hk3/RHB+MOYXXgpk4gPxs+OQ=; b=K2Ie5QGfXhIzzBlcJN/oEY0KyT
	bK7f21Jhyzo57le7eICIllllkcSQ9Vdy9bSQDdhA0NQYzUEGzuDymvl8pbx/nhlKnvc23Av2XEWib
	F8JVMjmg8JhpF+LFGVI5keTflv81WB2eB2Jc6ix7gWvQLv0IcDtF95aS93jI4nsEZM48uQqACmW5d
	NHL7b+FnsL26QFnxu2Z2Yw/S+gi1FCRovpERLCfO2w45gEifkKrJMjamsikn/E4SU3Ta+vY+/Ot2u
	MFRhnGzMmjoRLiEp3H4VnU3abYTRBHLj/G+gwjlunsrXhpnsTZN3Xx11ew2w1s2yRUDTBPtnNTj22
	kB05aXKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHW0-0000000DYNk-1JGQ;
	Thu, 19 Jun 2025 15:49:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSF5A-0000000D8NQ-0xG8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 13:13:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750338810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j6QZTbgBsBIWN9k4dZ6Hk3/RHB+MOYXXgpk4gPxs+OQ=;
	b=ZiwUK6U9Dh8BXbjJ9Iir0vOTGt0Kq78Reuuwyfgect2pjqlGCdwb3RdVeRfJb+SgtkWWRX
	SvFZ6ykq4ifbe8p45U0SfRh7xFA54ZYhdAf3U0tIrfzyoDRyZAp8xB0MBjzjtHGxXBmS8s
	FRmlJOmdWo4FYU98y82OBpf+ewT7r1M=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-dEA50u7pMU-HiAnQaY4hkA-1; Thu, 19 Jun 2025 09:13:28 -0400
X-MC-Unique: dEA50u7pMU-HiAnQaY4hkA-1
X-Mimecast-MFC-AGG-ID: dEA50u7pMU-HiAnQaY4hkA_1750338807
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-451d2037f1eso4751485e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 06:13:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750338807; x=1750943607;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j6QZTbgBsBIWN9k4dZ6Hk3/RHB+MOYXXgpk4gPxs+OQ=;
        b=De2fTYuv51yOi1PA3Jqh+Ru16q2EIt7TeVx+nUyUCbL2ZqD+iPDqAzBa0rpWTISsfS
         iKLD30bR1oHUXGrSdjGHCvjgNow9EuntTTTv0h/klCVM+NZsVU0Cw1kNKUfWUzbxykvl
         bpIkPH/VICrMxRc3EHh5y3EmukeCa4XAGttMOQLWW6Db7Br3FzxYwzlIgK9Byhpbpm6U
         9g0jlK7CvxpiO0vVxW0VUXO81sRuPm6LEDAJxaYyNSHnMjjCZbYLQXZCkD4gW9OlIeyy
         bypCwYTOJ/v+H3bRYF1TBETzHJdzAWMONaebvKCQW1aQWrNHgV7CMmHG2P3GkhbvBaN0
         wKsw==
X-Forwarded-Encrypted: i=1; AJvYcCXdU+FAcwuZ7cK66BNlewDZ0LOwGHHW85+QOLapJcBHcrMTb468q34vmTipU2qvcSfWFO6R6NLKhqMca3xpd3fX@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/q2EzCcXP6r9jiM0LmpoW9XGrtt5gsZLC/BeboKl9RQmkzTMI
	ynh2rYcgJNElyxorNXBe5sLEx/f6PghJX5ZUITHwTfoM52o+uSfxxIeuNSRJyN8iJFQ2ZdFyxbB
	iPGoeJPpEPD8ftrCCCgYWih59KQQyYW9pV7qt5+HSJUV99b2DWqI6djPROhgMeiGBgYCRq/uc4m
	k6
X-Gm-Gg: ASbGncvKvfZFvH959so6kVd2Z5FEiklIRPAZ9W74PttXd5iTuxPdky43acj3YVjGrC/
	erIyLqY6Cqyc7dgMfQ2JUd7uYH0eZdCrFuDbJSnVJUCecpHcCZNvq4SXZY/8HnzZmxu9NT4ATV8
	DDRs07T3P1T47djkBF+XKPxtMXwsvq+Qq8zyKDMJJ2newTlnDN4zAnmwDzhNgL2v2KGu9RaNLmM
	DgD4da2GUUbfY5M72FkBNVRsD2sN7prP+KWY9WEhhPONPE6wUezYgiPx+p5855I7z0anFpbNQhc
	usBL77Vgh8TO0CETN6H03TL0ZcS0EjhvWwxf9dAKNgb2/WWHd3TP1g==
X-Received: by 2002:a05:600c:1c12:b0:44b:1f5b:8c85 with SMTP id 5b1f17b1804b1-4533caf5e9fmr223551185e9.13.1750338807287;
        Thu, 19 Jun 2025 06:13:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMD/1y+DW1U7YZaLtAM718HwgsMR2hyVtSoS0D2IF1BJD9ZA4K+FKXjkc1zCzOuZWEA10NWA==
X-Received: by 2002:a05:600c:1c12:b0:44b:1f5b:8c85 with SMTP id 5b1f17b1804b1-4533caf5e9fmr223550895e9.13.1750338806871;
        Thu, 19 Jun 2025 06:13:26 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.47.246.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4536087c247sm16215935e9.9.2025.06.19.06.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 06:13:25 -0700 (PDT)
Date: Thu, 19 Jun 2025 15:13:21 +0200
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
Message-ID: <aFQM8TdZIIvvGv8T@jlelli-thinkpadt14gen4.remote.csb>
References: <20250615131129.954975-1-kuyo.chang@mediatek.com>
 <aFAyN4rfssKmbUE5@jlelli-thinkpadt14gen4.remote.csb>
 <089882f95b1b910f7feecddd0ad9b17f38394c64.camel@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <089882f95b1b910f7feecddd0ad9b17f38394c64.camel@mediatek.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: I_m7iDBSBINkmV6NFxKbcGFzLZH_nGIT3z7jJeSJgIY_1750338807
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_061332_350231_043FC3CD 
X-CRM114-Status: GOOD (  21.97  )
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

On 18/06/25 22:20, Kuyo Chang wrote:

...

> When dl_defer_running = 1 and the running time has been exhausted, 
> it means that the dl_server should stop at this point.
> However, if start_dl_timer() returns a failure, it indicates that the
> actual time spent consuming the running time was unexpectedly long. 
>  
> At this point, there are two options:
> [as-is] 1. re-enqueuing the dl entity with ENQUEUE_REPLENISH will clear
> the throttled flag 
> and re-enqueue the dl entity to keep the fair_server running. 
> enqueue_dl_entity(dl_se, ENQUEUE_REPLENISH);
> => replenish_dl_entity
>   => replenish_dl_new_period(dl_se, rq);
>   => dl_se->dl_yielded = 0;
>   => dl_se->dl_throttled = 0;
> => __enqueue_dl_entity(dl_se);
> 
> [to-be] 2. To avoid RT latency, the fair_server should remain throttled
> while replenishing the dl_se. 
> Once replenishing is complete, we can ensure that a timer is
> successfully started. 
> When the timer is triggered, the throttled state will be cleared,
> ensuring that RT tasks can execute during this interval.
>  
> It is a policy decision for dealing with the case of failure in
> start_dl_timer().
> The second approach is better for real-time (RT) latency in my opinion,
> as RT tasks must be prioritized.

OK, I think I see your points, but I am still not sure I fully
understand the link with the issue you describe in the changelog - the
relation with "DL replenish lagged too much", that is.

Could you please expand on the details of the situation that is opening
up for the issue your patch is addressing? Do you know why we hit the
corner case that causes the warning in the first place?

I would like to understand exactly what we are trying to fix before
deciding how to fix it, sorry if I am being dense. :-)

Thanks,
Juri


