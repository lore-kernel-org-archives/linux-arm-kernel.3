Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D4EC71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 13:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jo+IXIxSNIYAuiTCVjY+MjOblSENU+5Bkagj0uUgN34=; b=Mgcf5+2nrN0uqIKPD+y0GmkMLT
	gU4C85x50cgTPvB3qLw7WI4sX0a/Y+Ir/w0F2DBPKYgIKkTNyF/XmjqFnjDAb4SL6+Jbgpc/1hncx
	bh9TS88vgTxOq3wjJQ0zelwUCGiIl4bm+O6kN8OfFmbHSRzGIMfvbnNX3y/Uc0CAQbcz+8/57f3xa
	aPW5uTGD9yn0FyHKNp5mCYAYi4/juF99hKYAf6qijFLr757pic4jG2L751GWoerwjuZJ0o5CMWSef
	IWNNkCDkGDmyklDkseMxRag6PUCAo3UNjj0iMfvQjNymeJCqFxBZS24qsdviwhL2SBZmAUyWZuZmN
	cQnhpvaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWE4-00000007K8O-18Kq;
	Tue, 17 Jun 2025 13:19:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRVVC-00000007Cbw-0sB0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 12:33:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750163601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jo+IXIxSNIYAuiTCVjY+MjOblSENU+5Bkagj0uUgN34=;
	b=CapEiCO/ELiSKdE/ZT8m97KIMN9HMhemALxizF/VZsdPbdpf/3Q3fSV/4YVZzDccyLg359
	Q1qrCAn7pP+qUmCc3dZAapJbGNgUg61D53YxX5jpFvkjCky8CQ+ApB4xZkpQefM01t4v+s
	tScF7da/DbZMSvzwiHoIy+BBGTHo27E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-487-4xiU0yWsM5u4UgYUsmsoaw-1; Tue, 17 Jun 2025 08:33:19 -0400
X-MC-Unique: 4xiU0yWsM5u4UgYUsmsoaw-1
X-Mimecast-MFC-AGG-ID: 4xiU0yWsM5u4UgYUsmsoaw_1750163598
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450787c8626so42796415e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 05:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750163598; x=1750768398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jo+IXIxSNIYAuiTCVjY+MjOblSENU+5Bkagj0uUgN34=;
        b=kLYFUoXjeCu+Mfka7NQXs98JPgkcHIzWX1GtFv/REtEe3Fjl7GRAcKcs4LqyWKB7eh
         R68/EH8TFo1JOmjOExxG8uAMYv0+L3SgyrehVzknd4YCL7X+LixJrZCyo1pBEChcji+Y
         ng4hrz0BbKeCT9U1K1XNYPag54py7FF1sGYWeVpxUBePrALyvlCFcoH1HGy4OofoBvad
         nTYca4dTC0n3wyf3DXzx8GHqJK0VePwpY1t6Xn9gW/Dd5L4OXCVYPmE/7sbQucvHX4M6
         R6OxZITfhjcGvDnTCtRGCqFGbfLHDDL7pZ7rz+0BNEOxXROiOtuOWsr/o8/HebENhwd6
         5/4w==
X-Forwarded-Encrypted: i=1; AJvYcCUx1NwiUmugK61ShjQXJdvKSjvr1dVICSnNAZyk2W+rA0aw+Pb83riN99H8snvDqSCLhpa/C+glpCGAC++FoLF0@lists.infradead.org
X-Gm-Message-State: AOJu0YymRpblCQdhKCgQF89LmntSr7dZrORdMl7Op4OGq/peqI93PD4E
	foWOEhzHuMDjWNQIIoEmQYd+H/4FSaSUHsa5EKIlFwCG/G/pIm3g4efVCqZa7ZoFYH+vHgsZEVb
	iWw28BfjgaLGHK+BehA65QIQMZnPGxVQF1Vex2/HusGF3KaiSEuTeN7VGqN9CExcpF+YlvPgDfK
	A1
X-Gm-Gg: ASbGnctRp72nx80w122i1sFSqB3hY5IAevzf6ozCLko5s8+5Igyvx2bSmCPJhH+bqJ1
	t+EbwT2sEDZUQBpgZa/1o7Q0xHfCU4IxUzscYuYauA9wK3LvbVGd7SpsGRN78J+JKO00GzbATZz
	95fXoprn/5xhogYZKidbEgMcTGuQUWY36YSIz1pxb5w3wdi7SWcpqzqa3VIY321CeOjglMajAWI
	TQgl/Mln+YS7rV+rYVV3GiyPyqd4a0t+hgptVPVqdFi7gKi3L/3vFh2MtxU5qso+ZZOyqaKxk8R
	KvpjqBuzDISMTe7ZWoxTMTWwjScX/gC2ZqNLi7z13Fx8EDwvqS3Zmg==
X-Received: by 2002:a05:600c:3587:b0:43c:f70a:2af0 with SMTP id 5b1f17b1804b1-4533cb48951mr120533825e9.16.1750163598481;
        Tue, 17 Jun 2025 05:33:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEk1xWsef/FxGyotWPmKQtLjGTobu8UAwOJhzqxxuFF2cZ9pfD3uHBQHPFjkme52CF+GzKbfg==
X-Received: by 2002:a05:600c:3587:b0:43c:f70a:2af0 with SMTP id 5b1f17b1804b1-4533cb48951mr120533385e9.16.1750163598021;
        Tue, 17 Jun 2025 05:33:18 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.151.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea1cc5sm179772325e9.16.2025.06.17.05.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:33:17 -0700 (PDT)
Date: Tue, 17 Jun 2025 14:33:15 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kuyo Chang <kuyo.chang@mediatek.com>, Ingo Molnar <mingo@redhat.com>,
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
Subject: Re: [PATCH 1/1] sched/deadline: Fix fair_server runtime calculation
 formula
Message-ID: <aFFgi_9yxLN-auBE@jlelli-thinkpadt14gen4.remote.csb>
References: <20250614020524.631521-1-kuyo.chang@mediatek.com>
 <20250617085558.GN1613376@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
In-Reply-To: <20250617085558.GN1613376@noisy.programming.kicks-ass.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IzkgdwpP90zNugP2cgvgeMrr8m-Ifm4lNJ-Dt7py9g0_1750163598
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_053322_329740_F8577DEE 
X-CRM114-Status: GOOD (  22.34  )
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

On 17/06/25 10:55, Peter Zijlstra wrote:
> On Sat, Jun 14, 2025 at 10:04:55AM +0800, Kuyo Chang wrote:
> > From: kuyo chang <kuyo.chang@mediatek.com>
> > 
> > [Symptom]
> > The calculation formula for fair_server runtime is based on
> > Frequency/CPU scale-invariance.
> > This will cause excessive RT latency (expect absolute time).
> > 
> > [Analysis]
> > Consider the following case under a Big.LITTLE architecture:
> > 
> > Assume the runtime is : 50,000,000 ns, and FIE/CIE as below
> > FIE: 100
> > CIE:50
> > First by FIE, the runtime is scaled to 50,000,000 * 100 >> 10 = 4,882,812
> > Then by CIE, it is further scaled to 4,882,812 * 50 >> 10 = 238,418.
> 
> What's this FIE/CIE stuff? Is that some ARM lingo?
> 
> 
> > diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> > index ad45a8fea245..8bfa846cf0dc 100644
> > --- a/kernel/sched/deadline.c
> > +++ b/kernel/sched/deadline.c
> > @@ -1504,7 +1504,10 @@ static void update_curr_dl_se(struct rq *rq, struct sched_dl_entity *dl_se, s64
> >  	if (dl_entity_is_special(dl_se))
> >  		return;
> >  
> > -	scaled_delta_exec = dl_scaled_delta_exec(rq, dl_se, delta_exec);
> > +	if (dl_se == &rq->fair_server)
> > +		scaled_delta_exec = delta_exec;
> > +	else
> > +		scaled_delta_exec = dl_scaled_delta_exec(rq, dl_se, delta_exec);
> 
> Juri, the point it a bit moot atm, but is this something specific to the
> fair_server in particular, or all servers?

I believe for other servers (i.e., rt-server work from Yuri and Luca) it
might be useful to have it configurable somehow. I actually had a recent
discussion about this concerning single task entities (traditional
deadline servers) for which as well there might be cases where one might
want not to scale considering frequency and capacity.

> Because if this is something all servers require then the above is
> ofcourse wrong.

To me it looks like we want this (no scaling) for fair_server (and
possibly scx_server?) as for them we are only looking into a 'fixed
time' type of isolation. Full fledged servers (hierarchical scheduling)
maybe have it configurable, or enabled by default as a start (as we have
it today).

Best,
Juri


