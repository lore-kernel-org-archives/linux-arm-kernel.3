Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10AB8D46BFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 21:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xp9Fgd2RIw247dmeHBhZGyViCdcfCoSm8F9wNiqAlQI=; b=XjdswVPv5rGWHEdd4Yd2CuhKIX
	vFbMsjVFBfg2bqcy3n+L3RmfmkaAOG/VBSy0UOGceNmTd2sZE2rivi2BfXFzchxadlPosG9NTNRPD
	OC+DFe4UPQUczY2fTPjTiCWOpmwC7dmtQ63/Fo/DiMr7CNXyVyywDcHjNbK/Gz7EVUOm8ZqOlquCu
	tDfutdKtJokn2SSkUKmylTeSqv6QmPSbQ7Eoy/xJk7znJ3v8iedc9QbFhuYwcJLyxHqfsntN8Hp9h
	aGRkzzR8ktFHl5F/SkdYYCqaqf7DdCSiYtr/EGJEh3F3kzmv5Ej9s9CxXDT9h9yZFsZBD7QxTeHC7
	HO1yruKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCvw-0000000GpX6-2dFJ;
	Wed, 28 Jan 2026 21:18:40 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCvs-0000000GpW6-40Qk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 21:18:39 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4806bf39419so8819125e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 13:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769635115; x=1770239915; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xp9Fgd2RIw247dmeHBhZGyViCdcfCoSm8F9wNiqAlQI=;
        b=FN4W1yi0CpHazFKHJbB/Hj63cAosG779xqzOZP7oeIvnmq6FeS7if2tUzGoGuwI+1s
         xbt72Y7LY1LSUg6TOjS/1QS7mCMEs0ZtNcp+z/f7O37pec+AY3UmqLe7lH1p20HEjBU2
         R87RpaZdMyw5TN6LKurqYk9InNAMzUbuV+PK86+HEYDYwCWB8vtD+RZmDae2iGI19Z7j
         eGEzHUAb9Ahfcjg36w880txg6V5B5KAyPPOU7vBzd/RQZ2IsFSoKHnya3tnb+++pEPNE
         25tKqHBXlAxq9SVn2nFFO656GzNfFlL9noj7Cr4JbYMPIP2Oh4O6iKN9EynRPf5Tj1p4
         VM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769635115; x=1770239915;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xp9Fgd2RIw247dmeHBhZGyViCdcfCoSm8F9wNiqAlQI=;
        b=SDMmPOK/bcObMd0D+SJHD8aV/4UoX0MBNIng+1OasDClvWRqoPIz4+ui5x6lDoBU23
         AkIJL57Vyl2aqU6+h2AeY/ixAcCTTHS/nKxCFEfa+ly8Bw4YFj3W671+4XJhjpKjV/1k
         hz/UxdvDETiMdihsScF/Zk8IKh+/QN9ESD/vAoiT+s0k/N4D2+Qp/6BtiCXtvmp0LvDm
         TfuwVtXDkCcNeNtF4FUQj6PzxloeZK+3oV3eWc/jTBpc/kjMVt2t30f/uZtPNB3PB+ub
         +DzGethaxxOqJaNSeUU7RBW8geQuv86Z3D9VaKCzLZ0PaRB3ae07DeV2pAQmRNsXRIaF
         SFpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfob49h3i5/SKKep8xsw5nofFfyrIcMtDFeOe4SBWU6Q+4CFHnUT1uwI4RrxavwN8QKxhWHrwU+bantOqGu/z9@lists.infradead.org
X-Gm-Message-State: AOJu0YyjFPHCto0fTfrUcwn7kXPXquCGl+bYDYbgGujy5qBsgTN/2JQq
	NgM5km0I9o49I9VewNKxTWA85QPJ/l2emQroItYUXhfaFReiMwcSGpJ0b2VZqv+YW0o=
X-Gm-Gg: AZuq6aLOkX7wOaMBIDBpHtbJDO6ydpT8ApGmOkTd9LGAK1yJ7qbrCLnxgWnf8hhbGxK
	VCLInHGbSs7J1+7LOGbLSV/6sCnnytl98JBflfsKVenbRKd6c7loCSTrKZEv44zwHDnEowh1sn8
	Xg0GFj2pZoGzb//oB8d5Rp91OE3pNbJDMZXjQAMI/m8SK4xuTEgUpAnx+lf5whhrCrRoYgZGar6
	w7XH1JlOBBj5YtMX3zuJP7+pPsIp2b8cE8utPo+hOCkPFLknuORMaCtWOOFEpAnf2osCgC24KfD
	vEqdNY/akHdQzGHlOLAW2o6naoRlzq3k0EMJKN1PYPpzLSbHKK+tBnNjREiXTHEOVxlbKYp1Ou1
	ZZR/eyKDtDNTFuPb9/fUKo9uDyMCXeJU7qsHa1eguAkigPVKwcFx6CLZI42vU++74Q28ihQukIL
	MpcmAIFbliMpbouQkO8f/+LL1S
X-Received: by 2002:a7b:ca47:0:b0:47e:e38b:a83 with SMTP id 5b1f17b1804b1-480828828dcmr6056415e9.7.1769635114891;
        Wed, 28 Jan 2026 13:18:34 -0800 (PST)
Received: from localhost (109-81-26-156.rct.o2.cz. [109.81.26.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce64sm9991967f8f.26.2026.01.28.13.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 13:18:34 -0800 (PST)
Date: Wed, 28 Jan 2026 22:18:33 +0100
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
Message-ID: <aXp9KWl3VaNDMKPp@tiehlicka>
References: <20260125224541.50226-1-frederic@kernel.org>
 <20260125224541.50226-4-frederic@kernel.org>
 <aXeZQoSHJ9QX7B6W@tiehlicka>
 <aXizUsfywjtIIN50@localhost.localdomain>
 <aXnMj1phN3TJZkNz@tiehlicka>
 <aXnymtIZSc-fw1b8@localhost.localdomain>
 <aXp9CzgCTBEhlDqM@tiehlicka>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXp9CzgCTBEhlDqM@tiehlicka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_131838_021149_1A5FB191 
X-CRM114-Status: GOOD (  30.16  )
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

On Wed 28-01-26 22:18:04, Michal Hocko wrote:
> On Wed 28-01-26 12:27:22, Frederic Weisbecker wrote:
> > Le Wed, Jan 28, 2026 at 09:45:03AM +0100, Michal Hocko a écrit :
> > > On Tue 27-01-26 13:45:06, Frederic Weisbecker wrote:
> > > > Le Mon, Jan 26, 2026 at 05:41:38PM +0100, Michal Hocko a écrit :
> > > > > On Sun 25-01-26 23:45:10, Frederic Weisbecker wrote:
> > > > > > The HK_TYPE_DOMAIN housekeeping cpumask will soon be made modifiable at
> > > > > > runtime. In order to synchronize against memcg workqueue to make sure
> > > > > > that no asynchronous draining is pending or executing on a newly made
> > > > > > isolated CPU, target and queue a drain work under the same RCU critical
> > > > > > section.
> > > > > > 
> > > > > > Whenever housekeeping will update the HK_TYPE_DOMAIN cpumask, a memcg
> > > > > > workqueue flush will also be issued in a further change to make sure
> > > > > > that no work remains pending after a CPU has been made isolated.
> > > > > > 
> > > > > > Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> > > > > > ---
> > > > > >  mm/memcontrol.c | 21 +++++++++++++++++----
> > > > > >  1 file changed, 17 insertions(+), 4 deletions(-)
> > > > > > 
> > > > > > diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> > > > > > index be810c1fbfc3..2289a0299331 100644
> > > > > > --- a/mm/memcontrol.c
> > > > > > +++ b/mm/memcontrol.c
> > > > > > @@ -2003,6 +2003,19 @@ static bool is_memcg_drain_needed(struct memcg_stock_pcp *stock,
> > > > > >  	return flush;
> > > > > >  }
> > > > > >  
> > > > > > +static void schedule_drain_work(int cpu, struct work_struct *work)
> > > > > > +{
> > > > > > +	/*
> > > > > > +	 * Protect housekeeping cpumask read and work enqueue together
> > > > > > +	 * in the same RCU critical section so that later cpuset isolated
> > > > > > +	 * partition update only need to wait for an RCU GP and flush the
> > > > > > +	 * pending work on newly isolated CPUs.
> > > > > > +	 */
> > > > > > +	guard(rcu)();
> > > > > > +	if (!cpu_is_isolated(cpu))
> > > > > > +		schedule_work_on(cpu, work);
> > > > > 
> > > > > Shouldn't this in the guarded rcu section?
> > > > 
> > > > This is what guard(rcu)() does, right?
> > > > Or am I missing something?
> > > 
> > > I am probably misreading the patch. But I've had the following in mind
> > > 
> > > 	scoped_guard(rcu) {
> > > 		if (!cpu_is_isolated(cpu))
> > > 			schedule_work_on(cpu, work);
> > > 	}
> > 
> > guard(...)() protects everything that follows within the same block
> > (here the whole function) whereas scoped_guard only applies to the
> > following scope (here what is inside the {} in your example).
> > 
> > So both work.
> 
> I see. Thanks for the clarification. I would probably prefer a more
> explicit call convention but no strong opinion on that.

Forgot to add
Acked-by: Michal Hocko <mhocko@suse.com>
Thanks!
-- 
Michal Hocko
SUSE Labs

