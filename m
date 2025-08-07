Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF75C87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 13:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dHA46DuTY9pFuv3EKrWijSQmC2yks3Je0CkaUrfoHJU=; b=wTwNGcDsJY9Cvbf0/afA2Ihs4z
	drWprtn50EGXrSdyKKd04cRN4j3G+FRPEDpqapnmvxwOctzC53o6dhGlZ3BsxZmQ7RhIVmLyo0p54
	BnyhZr9sB1csR5+cE2PB0XH4dNSQxY6K8b/wqB3idkAUzd76TLHm0VQPQEuOndY/85ERLJwIH9n6d
	K79znDFWZD5m1MfGLYo1gXXdNDW0ojfwjkROl42OIig4ioTxiPJR3BPMSERBNi999QoYfRrKbeuve
	AqpcIYhAdpDl6wkAHz/Tud0buWDWrfro6xOtPYkjIwm7GroR5maUkD96waAA3QRiZlybpEgVaO9jl
	mslspoUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk0dp-00000000h2M-3iQi;
	Thu, 07 Aug 2025 13:26:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk0aq-00000000gcx-1Mzs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 13:23:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754573018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dHA46DuTY9pFuv3EKrWijSQmC2yks3Je0CkaUrfoHJU=;
	b=IKiCcbvWfpXKRHFMSX4zua9l+mOHQna50VO2bNx5yjF6zk1nlPl120t4ZLKQvS3oCRLgo1
	3KnL8o0Ro9zfTdKFbLulGIZ7AnGgMpYYBIdrpPgVTelaKM5k508M2CjVdzQj+pwOSOonWg
	+W4+RPK1MAncokoTD5yQynHFDtTX2G4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-n2fFPIlWP1uP2VCNsY24hA-1; Thu, 07 Aug 2025 09:23:37 -0400
X-MC-Unique: n2fFPIlWP1uP2VCNsY24hA-1
X-Mimecast-MFC-AGG-ID: n2fFPIlWP1uP2VCNsY24hA_1754573016
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3b785d52c19so451240f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Aug 2025 06:23:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754573016; x=1755177816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dHA46DuTY9pFuv3EKrWijSQmC2yks3Je0CkaUrfoHJU=;
        b=kQXpcqmutHyy0gN3Z4P4O/Qp7YsInzXIodNwxjH7CpPMGFAvRc8IvvRCFlvnDj7D82
         G7q5qxOnThzqwFwDxZbrEk5BhRrLKmAMZnlRmmkROUlBj492iQ31I7AheFf1IQe3l5yh
         0LwN0J+axaUTnBXctO3t4ifLuMu9I/fozyz6YhsIFBfl06AovR3kZbqBj8UBP1E5NvQl
         /3oI5CfRoGdrDsrValWkVzGeQ892Y7z0hGsBc2T3TgizfPiCgJUCFmexppEew1xXdxj+
         v9buJfEfXkzShA8yUgvNPEpTo6bxXKzTWHLdUCAls3o35enO97vwhU4kRtN8Gq+BrYAm
         RrYA==
X-Forwarded-Encrypted: i=1; AJvYcCUCCM7bzJcIfgXYoiwK6fs5jg/oiiIhG87goikDRcElSl0kPvcGhviFSxmYt99ETre5E4C2blDRFiXcYApxxsHD@lists.infradead.org
X-Gm-Message-State: AOJu0YyXxf7Kl+bmDgg4mEk3lzTNr4SPktzCrp3tbHJMZqVwfOY+s2B7
	jVka1Zn7CjXY6lFG70jav2xICKpap3ap0lMALHcVnvWXg1dcWW2Mfmj/BwPU/rqjQTCrxaSbVYY
	rH+EyoaUxo34XUTCEeG9Hol0OjyYEaeBr+j2LVgi56XUYwKtdHmecQg2FXdLISP5bPwgCRx1XXd
	jy
X-Gm-Gg: ASbGncsRc7dKYzo/RRXJrK431T/nblQyzw3b6coq0veenhTHkOMn7o7ARYsi8Rz0Ti9
	WsMAVWAEhW+7m7AEDJ4eoWk6J07e496kEgITFL3F4oaKzDej9xd4cMjR+y7myVWzuyd7oVqiUv4
	nPcRdatXGoawDoxX641XwIwww9GcROdr8POQ/Y3woXHphyAk7jmAToBwqtVlCqf5q1XsrzjXqDx
	HGAqsxCdycB/WBMD6ka5WdMTPD8TTH3TZ2/GKB9T2LWPPJP0fWqaxFdycP0UGLz2NHIxF5K0LDz
	LZZsggtT4DI1/CLZPObCdb43s0cIzqTCffkIpbEYep6UMOOf2ti4FEmzZSQH0iR0VlY51DLdks4
	/ntgCFwY5f2t+1Y2GdTRXQGo=
X-Received: by 2002:a05:6000:18a9:b0:3b4:9721:2b32 with SMTP id ffacd0b85a97d-3b8f48d4f26mr5474489f8f.10.1754573016390;
        Thu, 07 Aug 2025 06:23:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGK7RPK/BHk+aiKWpB1FOVkMIFKk4URmY7R5cJde+3vREbiJsn51qHzJTF0lGZx3w/Ix4ugKQ==
X-Received: by 2002:a05:6000:18a9:b0:3b4:9721:2b32 with SMTP id ffacd0b85a97d-3b8f48d4f26mr5474465f8f.10.1754573015962;
        Thu, 07 Aug 2025 06:23:35 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb (host-2-102-14-151.as13285.net. [2.102.14.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3c33fesm27226884f8f.29.2025.08.07.06.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 06:23:35 -0700 (PDT)
Date: Thu, 7 Aug 2025 14:23:33 +0100
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
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] sched/deadline: Add DL server activated message
Message-ID: <aJSo1bvZ54Kl_vKb@jlelli-thinkpadt14gen4.remote.csb>
References: <20250805155347.1693676-1-kuyo.chang@mediatek.com>
 <aJRSmWCJI-GlApsR@jlelli-thinkpadt14gen4.remote.csb>
 <9f91f77e5f39857aa84373fe1ae504de2a881533.camel@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <9f91f77e5f39857aa84373fe1ae504de2a881533.camel@mediatek.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: e7EsZzbOiwxJmDXeAZX4Ju0pOPxeRa55OUVp6LE9dT8_1754573016
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_062340_438662_B8E8EBAA 
X-CRM114-Status: GOOD (  29.86  )
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

On 07/08/25 15:52, Kuyo Chang wrote:
> On Thu, 2025-08-07 at 08:15 +0100, Juri Lelli wrote:
> > 
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> > 
> > 
> > Hi,
> > 
> > On 05/08/25 23:53, Kuyo Chang wrote:
> > > From: kuyo chang <kuyo.chang@mediatek.com>
> > > 
> > > The DL server is introduced as a replacement for realtime
> > > throttling.
> > > When RT throttling is activated, a message
> > > "sched: RT throttling activated" is shown. However, it is currently
> > > difficult for users to know when the DL server is activated.
> > > 
> > > This patch adds a similar message to indicate when the DL server
> > > is activated, which helps users debug RT/CFS contention issues.
> > > 
> > > Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
> > > ---
> > >  kernel/sched/deadline.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> > > index e2d51f4306b3..8e0de6cdb980 100644
> > > --- a/kernel/sched/deadline.c
> > > +++ b/kernel/sched/deadline.c
> > > @@ -2042,6 +2042,9 @@ enqueue_dl_entity(struct sched_dl_entity
> > > *dl_se, int flags)
> > >       }
> > > 
> > >       __enqueue_dl_entity(dl_se);
> > > +
> > > +     if (dl_server(dl_se))
> > > +             printk_deferred_once("sched: dl_server activated\n");
> > >  }
> > 
> > Not sure if we want/need this, but, if we do, I believe
> > fair_server_pick_task() might be a better place to put it, as it's
> > really when the dl-server is called to do its job.
> > 
> 
> Thanks for your suggestion, maybe the minor patch as below
> 
> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index e2d51f4306b3..82d1091e56f5 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -2395,6 +2395,7 @@ static struct task_struct *__pick_task_dl(struct
> rq *rq)
>  			goto again;
>  		}
>  		rq->dl_server = dl_se;
> +		printk_deferred_once("sched: dl_server activated\n");

Guess it could work. If we are going to add this, maybe printing
information about the task dl-server is servicing might also be
interesting.


