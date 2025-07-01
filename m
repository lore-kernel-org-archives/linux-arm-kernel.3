Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C497C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 10:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ddBFBPzbnf0YkGeiYFfOnISLgT7HwdwnXCPaNqmBGeE=; b=ibpnpzbTqaq2F2vxS8Y29CRDx5
	nPRLN1L8EcpIRvK7EgYBom76FonRuApRr/kAEz/SB/f/uMllEZHWUNVemdsazUhQrr/lectYg1lK6
	SGyAaADSxnApN9zHYa7Y/U08PCwgUWXC1SfZj6LO7I4N6kIqdJhRvB/KX2SDSciUfDfvBX2zzQcJJ
	dJCihX7gE3jBHmjMI8MW0NZTxb8SJwZxyA50N6FHXxlltLj7oR8334gIiK61EEWw5wnoq+XP+3GNh
	cBSBdcHOR9+YVePR7kZFuF8bZ9OCwzYJyCDQxLbElm0ObDXa2NHuQJcfiKDzJGNgBeIvlsQxgeCcn
	yEP7dHrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWYad-00000004nXp-0abz;
	Tue, 01 Jul 2025 10:51:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWYYH-00000004n6n-3c7w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 10:49:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751366963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ddBFBPzbnf0YkGeiYFfOnISLgT7HwdwnXCPaNqmBGeE=;
	b=ZbyP7B67kIg2VxWy8A8jm1/ruLc3gUFy2r5huj/157foWRHmxJYaGNxmDIQY2/zPedqtV7
	0wmSjEI1STS/uIPyBgLN1lcxxpFqkOGPgr59RsPqy0Cs5z9IAxwGT937DWbgooNjQYOCGW
	lYAglPDkzL0zIYz+0P7me1iaeeSBqog=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-TAi4ibNnM96vh6vUV-Luxg-1; Tue, 01 Jul 2025 06:49:22 -0400
X-MC-Unique: TAi4ibNnM96vh6vUV-Luxg-1
X-Mimecast-MFC-AGG-ID: TAi4ibNnM96vh6vUV-Luxg_1751366962
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d444d21b24so606531285a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 03:49:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751366962; x=1751971762;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ddBFBPzbnf0YkGeiYFfOnISLgT7HwdwnXCPaNqmBGeE=;
        b=FZRm1NPClXQ26u6Txj1dZ8NHs0ZElXVBCVJwrJiTOCDGLZpUoegnzBvKzCzVQBkVml
         LpF2yTqKhUELMbBLmUuByQStmN57ZWtoTQjdCkWvxjlGmBf8+QuBGuJ9bo+ElJcKgPCR
         vAnQI2eXQ3OA3+tQ/eOu84w+zLK6/R/Lz08fsy78oFSNUj6nAl05KvsTaS5BsfNK2mJ3
         HSGOBOM1CgiNoWsiow3jfISHUDp5FNfWraMKYGOB5T6zIRSk5Dq6OeOupOY4yRgBAtN7
         Fs0/ofrL6J6B1i+lDs6WQBbnLYNk8FBHimZ8WG2oPeK0ozfoRV/AylXz97BKJsgnfk4l
         hqbw==
X-Forwarded-Encrypted: i=1; AJvYcCXDcLoT3clR4C3v9E6r53PYZQ6DO1McJ62U/Z0AAiytgHGNNejqVk4J+LIPjj9ZkoUus4Vdjc71XtH5HXe14L92@lists.infradead.org
X-Gm-Message-State: AOJu0YyKlo26uUo+FFPJGUfjP6iI+oO3WWIhmd6B2bmpvHM6mrVRnT9E
	vHRfzhUqMzqvp0+yRQOn425p3dFD2lAqtm8pgiocJYYfqi6MDV1iCVYSy2PD86bA4zPhO/hRlyY
	SFmQZI9i/9x7hgeFm460IxyS+hOoNVxuogBNGg1BG1TpRJSDAa1njO8SDTwZr58iim0t7eZIl3q
	nl
X-Gm-Gg: ASbGncuB99vQ2q49wdrR4xTZy2E/yulqi47vLMMCFlr9zCpbuZHxlv4upMNFQ/sSxW2
	pSs40WACwZoWhfLlJO87UBBo7I9B5ygpIc7zoFurqwykLnQxpEZb54dv2Lfl+UX2erfcAsmvX7s
	79yy3+YCI3MK5l4QkKj+/okf/IKlGowEGGAGRoiwDF6oA5iuTrwzNbE52rjbzdIolKE2wZvdVKU
	2KFeNC1xke7jX8f7Y8Rz/QEzZfTM56pUlQ+BdnSjVxLCSzcqpdbVKWN1V9J5tzBUEJTEf+DGPr+
	vifWXzzDzrnNgqKNimFWSgEZWJlbxvQ6Bdj0IT4+pT42jZy9envbbDROUNIuWDvIY0btj//TAER
	NUfmxhA==
X-Received: by 2002:a05:620a:3946:b0:7d3:a66d:4f3c with SMTP id af79cd13be357-7d443920b10mr2626489485a.7.1751366962086;
        Tue, 01 Jul 2025 03:49:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnx1+CJslWQPujj9MUyy/pZg3IhJl9cLZ/bmEw7NJQYC0MyetSF73gR/8qFtva/Zgbza2a/g==
X-Received: by 2002:a05:620a:3946:b0:7d3:a66d:4f3c with SMTP id af79cd13be357-7d443920b10mr2626484485a.7.1751366961461;
        Tue, 01 Jul 2025 03:49:21 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb (host-2-102-80-182.as13285.net. [2.102.80.182])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d443167d48sm748686385a.32.2025.07.01.03.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 03:49:20 -0700 (PDT)
Date: Tue, 1 Jul 2025 11:49:15 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: John Stultz <jstultz@google.com>
Cc: Kuyo Chang <kuyo.chang@mediatek.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH V4 1/1] sched/deadline: Fix dl_server runtime calculation
 formula
Message-ID: <aGO9KyiJNAm7DLb0@jlelli-thinkpadt14gen4.remote.csb>
References: <20250627022837.3331827-1-kuyo.chang@mediatek.com>
 <CANDhNCorm58L9CqHyNORgfk=++HkCttmyCkM23Pn8rXV7cF41Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANDhNCorm58L9CqHyNORgfk=++HkCttmyCkM23Pn8rXV7cF41Q@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VVqiurrKBt3Q7olfZnMRNxj2fMUcMM2Xc2xP0XVO0_0_1751366962
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_034925_966201_0C2881A1 
X-CRM114-Status: GOOD (  45.33  )
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

On 26/06/25 19:48, John Stultz wrote:
> On Thu, Jun 26, 2025 at 7:28 PM Kuyo Chang <kuyo.chang@mediatek.com> wrote:
> > In our testing with 6.12 based kernel on a big.LITTLE system, we were
> > seeing instances of RT tasks being blocked from running on the LITTLE
> > cpus for multiple seconds of time, apparently by the dl_server. This
> > far exceeds the default configured 50ms per second runtime.
> >
> > This is due to the fair dl_server runtime calculation being scaled
> > for frequency & capacity of the cpu.
> >
> > Consider the following case under a Big.LITTLE architecture:
> > Assume the runtime is: 50,000,000 ns, and Frequency/capacity
> > scale-invariance defined as below:
> > Frequency scale-invariance: 100
> > Capacity scale-invariance: 50
> > First by Frequency scale-invariance,
> > the runtime is scaled to 50,000,000 * 100 >> 10 = 4,882,812
> > Then by capacity scale-invariance,
> > it is further scaled to 4,882,812 * 50 >> 10 = 238,418.
> > So it will scaled to 238,418 ns.
> >
> > This smaller "accounted runtime" value is what ends up being
> > subtracted against the fair-server's runtime for the current period.
> > Thus after 50ms of real time, we've only accounted ~238us against the
> > fair servers runtime. This 209:1 ratio in this example means that on
> > the smaller cpu the fair server is allowed to continue running,
> > blocking RT tasks, for over 10 seconds before it exhausts its supposed
> > 50ms of runtime.  And on other hardware configurations it can be even
> > worse.
> >
> > For the fair deadline_server, to prevent realtime tasks from being
> > unexpectedly delayed, we really do want to use fixed time, and not
> > scaled time for smaller capacity/frequency cpus. So remove the scaling
> > from the fair server's accounting to fix this.
> >
> 
> Thanks again for revising the commit message, this version is easier
> (for me at least) to follow.
> 
> 
> > diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> > index ad45a8fea245..96a21f38fcc3 100644
> > --- a/kernel/sched/deadline.c
> > +++ b/kernel/sched/deadline.c
> > @@ -1624,7 +1626,9 @@ void dl_server_update_idle_time(struct rq *rq, struct task_struct *p)
> >         if (delta_exec < 0)
> >                 return;
> >
> > -       scaled_delta_exec = dl_scaled_delta_exec(rq, &rq->fair_server, delta_exec);
> > +       scaled_delta_exec = delta_exec;
> > +       if (!rq->fair_server.dl_server)
> > +               scaled_delta_exec = dl_scaled_delta_exec(rq, &rq->fair_server, delta_exec);
> >
> >         rq->fair_server.runtime -= scaled_delta_exec;
> 
> As I mentioned earlier, I still don't see this conditional as making a
> lot of sense, as I don't believe there is time when this function
> would be called and (!rq->fair_server.dl_server) would be true.
> And even if there were, I'm not sure it makes sense to scale the time
> interval based on the fair_server.dl_server flag.
> 
> From a separate discussion, you highlighted that it might be useful
> once we have multiple dl_server types, which may want scaled
> accounting, but I think in that case we should use an explicit flag
> instead of the dl_server bit to denote if the accounting should be
> scaled or not.
> 
> So, since your patch is a fix for a pretty bad bug, I think it should
> be focused on fixing the issue in the simplest and clearest way for
> the existing code, and not be too worried about integrating with
> future changes that haven't landed.
> 
> Then, as those future changes land, we can see how best to generalize
> the decision to scale or not scale the accounting on a dl_server.
> 
> That said, the conditional is a bit of a moot point, since I don't
> think we'll actually hit it, and I'm motivated to get the bug you are
> fixing resolved, so I wouldn't object if this went in as-is, but it
> seems like it would be much cleaner to just drop that conditional as
> you did in the original version of this patch.

I agree. It would be better to drop the conditional.

Thanks!
Juri


