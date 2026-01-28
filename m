Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0035D35692
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 08:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzZ5aaJur2cGbo3tv1Z3AlCZuGpqhSu9RlDH7L/IIPI=; b=mNoQMw/057S4JLIfVUoLh2p6TK
	8sg5bme17ETNv6HkTImIA+zT1hQBOXqIEGR+3dUnN/wkQ+OUb0+CYLxM5S8FP5rgJYouTiDL9YA0c
	sG8rzvnINkGRYf1xPOCaNJgOc0wfzrG5vwH3ojfGAObcclAY/wQVyyR3AyVlpYu9v+mqH5ZQKMgdi
	+mpSN386k2weNgGxuUmM5XfWWF5PP/tCldQOHDbLSB33awFoN+4ENoD7OpujIqxs7sPuGY7JBmiH8
	KRBgJqvC8KULkD80X8Ivu7TUj0mAuEeyl0mywHUTUbiugVB6benInnqxFskvNVqTA7vmhMT3nPf65
	somvVGDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1Am-0000000FgUs-1oZS;
	Wed, 28 Jan 2026 08:45:15 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1Ah-0000000FgUK-43UW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 08:45:11 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-48069a48629so15201345e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 00:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769589905; x=1770194705; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yzZ5aaJur2cGbo3tv1Z3AlCZuGpqhSu9RlDH7L/IIPI=;
        b=KC9FMTAfVvxg4bZmevt6+hMJ0LjWn/ViqILN1JiDGNOX09a6wVslS0WpgvQu+WlJn9
         AmYfEV5CJx7lWcV39Nmvu8pAb4Gznp/tab6yxbCzr7RHry8mxEKsRKlckV2BSdlAGHan
         8UItnpev0N8Z2pfXkb9lSng7cDSriM7DZ+PPPJbF6XUeOwgEoOWy2etxW/h03DLbznB3
         zsDYoSfgUdztT2wvopqluXAuylTQMJo02z4hEILv/aPpmtGAqxMYyJvrMaXo6CeT1mbw
         ib9w9R0dKpz63vtJo809b898+tlTxAZH9w/QDcudV3GSlEFhYK4GSzumFtccpCZfj0kj
         YT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769589905; x=1770194705;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yzZ5aaJur2cGbo3tv1Z3AlCZuGpqhSu9RlDH7L/IIPI=;
        b=UIqNK9+MhYwMEOPDtr+mlPeYrHeM1NGRpT5w9T2T7/x9MEbKrN/k7WBsGyq9mE3N+x
         +pfm25KHjvTrt6OkpIyHZ4vD8XEOBgrjW9pWRA1+v9X4ZZUGEhyb9hCX5Y5kNtqC+RFP
         KymGHmqjBM7vjeZWxXIo7jui8+tMh7mamruZ52rkHHEz7en6gQgRIKBCj0e0a8F2E99c
         QhbH6j7VeeFGV1OiAHbXHReQDh3w+8qxnxYo9bKSSBPRyz/dCTPNw9fWU3usbR2rfiDs
         vMi/WLZfgLdDrqsqWv5CXoJ4sIw5WKVbn35FP9hb1wWdTfXwEvKzssMzYaRyUG7H2ILL
         f5RQ==
X-Forwarded-Encrypted: i=1; AJvYcCV34OqA7CLpMtHQLPOJWRV8Guf5HKsVz7szsUoVjFMYcd++QhzlRG8Xjn/cnEoSvqjaFXDgfu6fQJRFNWFnwAzB@lists.infradead.org
X-Gm-Message-State: AOJu0YzbnLqe6L0u1KfVpmPCpCIM/KaR8iuFw9Ksb7didKN44H6AjqWu
	aMlxkQ7C72/yPHKJsquxNb4BaE4563puejYvD+YayjVQ8CkhlWRMnKDufOUqt/TdGY4=
X-Gm-Gg: AZuq6aIdqi5Ga/R9LFx6hhkJNBEDJkM4hjBV/hN86UK3Fvq0jRL6tTd+hs9Lj4+XaRT
	CEQEUisFB49ubb9dcKLlWdpTxO2ec78c8+A/LANVsL0kNUlJXT5EeEzM5reTWuJxScMcZ+LGFgU
	KgIU8MvExxsQgqwKaMXkfkIdyItCNAOt5EA8WUbr06WgM8ORdTLAjh4VqpJCW1hCegprFkPY4nt
	dLeq41AHTNspe/46Kyc/Vz0E2aDVfbHl1arjRGPcxTrPsospY/zo61W7rMim8zLzDvwj60UOZ47
	zQ2KWutjbkk85mU06oqHI5AwxWzE9/NA8uf6R9poU+ekHwrrbvJytdShvEwYNg4hKDCJ8z9//9t
	3+UZBhhS97FeEekI8VmQVkvR2Uw9uYZkchooY/zE6xFLRTLLLKNesxg8axzbS6/jiVfZDZlrNtC
	NaJvAiwnFj6Xu8Qzq9cvhP0xzU
X-Received: by 2002:a05:600c:4e12:b0:480:6873:b2f6 with SMTP id 5b1f17b1804b1-48069c557d0mr54819185e9.20.1769589905328;
        Wed, 28 Jan 2026 00:45:05 -0800 (PST)
Received: from localhost (109-81-26-156.rct.o2.cz. [109.81.26.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066bee7d0sm121124905e9.4.2026.01.28.00.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 00:45:04 -0800 (PST)
Date: Wed, 28 Jan 2026 09:45:03 +0100
From: Michal Hocko <mhocko@suse.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chen Ridong <chenridong@huawei.com>,
	Danilo Krummrich <dakr@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Muchun Song <muchun.song@linux.dev>,
	Paolo Abeni <pabeni@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>, Phil Auld <pauld@redhat.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Simon Horman <horms@kernel.org>, Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>, Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>, cgroups@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org,
	linux-mm@kvack.org, linux-pci@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 03/33] memcg: Prepare to protect against concurrent
 isolated cpuset change
Message-ID: <aXnMj1phN3TJZkNz@tiehlicka>
References: <20260125224541.50226-1-frederic@kernel.org>
 <20260125224541.50226-4-frederic@kernel.org>
 <aXeZQoSHJ9QX7B6W@tiehlicka>
 <aXizUsfywjtIIN50@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXizUsfywjtIIN50@localhost.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_004509_437978_36A49F23 
X-CRM114-Status: GOOD (  23.33  )
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

On Tue 27-01-26 13:45:06, Frederic Weisbecker wrote:
> Le Mon, Jan 26, 2026 at 05:41:38PM +0100, Michal Hocko a écrit :
> > On Sun 25-01-26 23:45:10, Frederic Weisbecker wrote:
> > > The HK_TYPE_DOMAIN housekeeping cpumask will soon be made modifiable at
> > > runtime. In order to synchronize against memcg workqueue to make sure
> > > that no asynchronous draining is pending or executing on a newly made
> > > isolated CPU, target and queue a drain work under the same RCU critical
> > > section.
> > > 
> > > Whenever housekeeping will update the HK_TYPE_DOMAIN cpumask, a memcg
> > > workqueue flush will also be issued in a further change to make sure
> > > that no work remains pending after a CPU has been made isolated.
> > > 
> > > Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> > > ---
> > >  mm/memcontrol.c | 21 +++++++++++++++++----
> > >  1 file changed, 17 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> > > index be810c1fbfc3..2289a0299331 100644
> > > --- a/mm/memcontrol.c
> > > +++ b/mm/memcontrol.c
> > > @@ -2003,6 +2003,19 @@ static bool is_memcg_drain_needed(struct memcg_stock_pcp *stock,
> > >  	return flush;
> > >  }
> > >  
> > > +static void schedule_drain_work(int cpu, struct work_struct *work)
> > > +{
> > > +	/*
> > > +	 * Protect housekeeping cpumask read and work enqueue together
> > > +	 * in the same RCU critical section so that later cpuset isolated
> > > +	 * partition update only need to wait for an RCU GP and flush the
> > > +	 * pending work on newly isolated CPUs.
> > > +	 */
> > > +	guard(rcu)();
> > > +	if (!cpu_is_isolated(cpu))
> > > +		schedule_work_on(cpu, work);
> > 
> > Shouldn't this in the guarded rcu section?
> 
> This is what guard(rcu)() does, right?
> Or am I missing something?

I am probably misreading the patch. But I've had the following in mind

	scoped_guard(rcu) {
		if (!cpu_is_isolated(cpu))
			schedule_work_on(cpu, work);
	}
-- 
Michal Hocko
SUSE Labs

