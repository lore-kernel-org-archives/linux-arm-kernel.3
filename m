Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608B5D46BFB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 21:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZU7FEnl0OZQVA7ODIpy0SKJAEacHqZRjK4EaXTvPIzs=; b=oQxqIBR8/OVsSS6ZclnmgpWuxz
	XweDydDQ/HaE0PJ0xY68PqtrrZku6+Bt3+DpLFqMS7d51UksOKOzyq97AEE7IjQrkVfnxFXe4t24q
	3jq3QhxcJ7iP68QziwrC35/gyU979X71C2ETBpsOcgCU/Qm7doZp2fwGVtj1vuCrQ+uul1c5g6kek
	Lnfs64tRjXBZDs+SeoPxwsleTdTyh9YKhSdMYJp3AQ17iGyNNJLNgXB4q7/vr5pRp/gkuP+dfoSwo
	9x2Wvn4Yzp14siKr8lU6Pa7txdhCy1+Gk1tUIzf1mZpSfa+kXxp88pEFp2VrLqic8MVmbd6H4BDiR
	H7KuyEDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCvV-0000000GpS8-1K75;
	Wed, 28 Jan 2026 21:18:13 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCvO-0000000GpRg-2tIG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 21:18:11 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-47ee07570deso2229895e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 13:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769635085; x=1770239885; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZU7FEnl0OZQVA7ODIpy0SKJAEacHqZRjK4EaXTvPIzs=;
        b=SSxKV3w4lOXD0elgq/1qKuopqAQKWeUQFtLzl1EYMikMdfBYPBvQpit9bEzidUZt/N
         +KB+weal/tj9gtbjdI9W3bzb+mvP8yrfr/lAkWv+L1szSNgNSdnphpyYFPLCxXF9kL8v
         iuVqCFpv6HsMMdDFB+3mxPSX3TgZLeyXNG9F0cKI1MY0M/JihNnwUNiV8hEoL3caAUB0
         MciorrroVgB0GITItzrcqAvWGFLmoOVTQ5kjLWxplgUi0hEu8AS84M+iEtT6jS7pzMaN
         fnK7JNTKDk7XuB2Qg8XJ2Prd+/Uc22zaT3Po/Ohb3DtFp4zyiCECLv//ZShSgkoRh1Y4
         p4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769635085; x=1770239885;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZU7FEnl0OZQVA7ODIpy0SKJAEacHqZRjK4EaXTvPIzs=;
        b=AWE43FL8ikTocmkgKcbcaJ2jiw0N1zzNLIdDF1xFV4UMEcNYiSR6Dlmmu68XdiAWRZ
         CXFZHw12/zhCBHv5qbUwzL3/5mKu2wAw6n1uoN8jvNM+CK8OoITySuAeTPfgnpouwnU8
         F1bDtb2RHpNka0G2CeWx6wVXhL8nkDDrrGrjpDUgjw0SV7jUDLomA+Ni8XGhtx3dUvam
         cM07VplWvCO0ZSMrpfHxqPusurGkEWfMR1Ra/3h5o6roGzcmmT53iP6YTjGjdW8iTCXG
         reKn5MJyCS5wYJjFwUIPnDtgIvbISuWLVtRpzxMWfFUoJ0S9ug+KW5M6qYC7B90CIoC9
         v8SQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGrL54SbRRzDkrY+ytoMmUkO/YaAo8R3lsOgkN2GHjxxk1rR5zjzDAqVUxF/PhPKrHhLFuwv59EwGB5EQoA7FJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0cHlGoiPVkFhLnnyKWdPOyQMqayXoLGOgqPCV+4Lw1ZdybawB
	sCBBCKq7w2Uh8ILouJ6ey/EeoDJD1Dmhxg40zo18dEDSVbTOlZfyAYt8dvHCX62IRR0=
X-Gm-Gg: AZuq6aKDaODod9EZfR3R1UEc46rHqiupm5eQqX9ll69Z60TyLBQxX5KtwMdJxaSqbSg
	kGkeSfP4OdzIgd4MeDzRJvpPGVjLZVmK/kjFHVX/exm7qW2fUsrPuBkGdJyfZb3Pxn3QlrlPupY
	l6vkin57zUYwnAcIvyP4WjNcVjYmSsi9BHOuV7clYEjKgpaB96vxWOYI4MNzcCsmYeXRdJ7BPep
	EyY/nAal7hHeL/DyN4mrWNGoYS+Ovb6haS3RwY1iYm8dnoeOf+CxtW0Hd8GhnwTa8fegk7ZhVmK
	TWEYe1QSK0X38bEwFLDH94omn4AqbieBUJwiXBaHK1zmy05aG2lxrZ26UyB2MheYl+x8wfD78tS
	iFh53JtJGVymMyjTLk0ws/8ZrQrxiGSdVcx0teuDck7smi8fR0rNTBaKoE3guKPnx5xJjemQI1q
	d11+9r/2vrFKPDzF/mRzAGEJ8S
X-Received: by 2002:a05:600c:154c:b0:47e:e9bf:dd8a with SMTP id 5b1f17b1804b1-48069cb2fddmr85513805e9.37.1769635084662;
        Wed, 28 Jan 2026 13:18:04 -0800 (PST)
Received: from localhost (109-81-26-156.rct.o2.cz. [109.81.26.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce4c515sm85708295e9.11.2026.01.28.13.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 13:18:04 -0800 (PST)
Date: Wed, 28 Jan 2026 22:18:03 +0100
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
Message-ID: <aXp9CzgCTBEhlDqM@tiehlicka>
References: <20260125224541.50226-1-frederic@kernel.org>
 <20260125224541.50226-4-frederic@kernel.org>
 <aXeZQoSHJ9QX7B6W@tiehlicka>
 <aXizUsfywjtIIN50@localhost.localdomain>
 <aXnMj1phN3TJZkNz@tiehlicka>
 <aXnymtIZSc-fw1b8@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXnymtIZSc-fw1b8@localhost.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_131806_773080_ADE63F9F 
X-CRM114-Status: GOOD (  29.58  )
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

On Wed 28-01-26 12:27:22, Frederic Weisbecker wrote:
> Le Wed, Jan 28, 2026 at 09:45:03AM +0100, Michal Hocko a écrit :
> > On Tue 27-01-26 13:45:06, Frederic Weisbecker wrote:
> > > Le Mon, Jan 26, 2026 at 05:41:38PM +0100, Michal Hocko a écrit :
> > > > On Sun 25-01-26 23:45:10, Frederic Weisbecker wrote:
> > > > > The HK_TYPE_DOMAIN housekeeping cpumask will soon be made modifiable at
> > > > > runtime. In order to synchronize against memcg workqueue to make sure
> > > > > that no asynchronous draining is pending or executing on a newly made
> > > > > isolated CPU, target and queue a drain work under the same RCU critical
> > > > > section.
> > > > > 
> > > > > Whenever housekeeping will update the HK_TYPE_DOMAIN cpumask, a memcg
> > > > > workqueue flush will also be issued in a further change to make sure
> > > > > that no work remains pending after a CPU has been made isolated.
> > > > > 
> > > > > Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> > > > > ---
> > > > >  mm/memcontrol.c | 21 +++++++++++++++++----
> > > > >  1 file changed, 17 insertions(+), 4 deletions(-)
> > > > > 
> > > > > diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> > > > > index be810c1fbfc3..2289a0299331 100644
> > > > > --- a/mm/memcontrol.c
> > > > > +++ b/mm/memcontrol.c
> > > > > @@ -2003,6 +2003,19 @@ static bool is_memcg_drain_needed(struct memcg_stock_pcp *stock,
> > > > >  	return flush;
> > > > >  }
> > > > >  
> > > > > +static void schedule_drain_work(int cpu, struct work_struct *work)
> > > > > +{
> > > > > +	/*
> > > > > +	 * Protect housekeeping cpumask read and work enqueue together
> > > > > +	 * in the same RCU critical section so that later cpuset isolated
> > > > > +	 * partition update only need to wait for an RCU GP and flush the
> > > > > +	 * pending work on newly isolated CPUs.
> > > > > +	 */
> > > > > +	guard(rcu)();
> > > > > +	if (!cpu_is_isolated(cpu))
> > > > > +		schedule_work_on(cpu, work);
> > > > 
> > > > Shouldn't this in the guarded rcu section?
> > > 
> > > This is what guard(rcu)() does, right?
> > > Or am I missing something?
> > 
> > I am probably misreading the patch. But I've had the following in mind
> > 
> > 	scoped_guard(rcu) {
> > 		if (!cpu_is_isolated(cpu))
> > 			schedule_work_on(cpu, work);
> > 	}
> 
> guard(...)() protects everything that follows within the same block
> (here the whole function) whereas scoped_guard only applies to the
> following scope (here what is inside the {} in your example).
> 
> So both work.

I see. Thanks for the clarification. I would probably prefer a more
explicit call convention but no strong opinion on that.
-- 
Michal Hocko
SUSE Labs

