Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C622CEE57D7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 14:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXYjazt0zE5ZbXPCuIYC2wRZQfZaaSTiX/lQQ7YM9M4=; b=Fu2l1JrjAxsWqg+kYpH16TXnZC
	jsstj1NoV5jfi0+TIyL991XYAS6uFBl8g6Y+QK5LRfxwPiXPh/pWKe7603T/BeQnvW+76QZ3DaM10
	UmleYYNJ6BbXUJjIhFtEw+PDO6kTUeVFIc1M/8vLrpzd2bp4Te2hWTHU0mFh1gnhfa/C5/4SGpVeA
	KyZGYclmMknpqnl7LKIGRW2Q/nysf5eJYfytuSIk0Dyk5XGWbrur/BIuLuRQU12oHmpB/uGjbn001
	ddtQQEVWNpNYfOFp24bictWp3NId2AYUDyiW1qGdoVVBbNSqbbQXIBDlKxYajGO3Bm/s1ttNTC7Uj
	VBujUM/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vax5O-000000062DG-12kN;
	Wed, 31 Dec 2025 14:22:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vax5N-000000062D7-0hW2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 14:22:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A02760008;
	Wed, 31 Dec 2025 14:22:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41D7AC113D0;
	Wed, 31 Dec 2025 14:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767190919;
	bh=ThxbPyVAuuGbA1hxol61p5aRyqgSEJPk5GSWaXCro3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fdkIy6Szlw8k7WZ5M4sr0W+mpchR0nIFJWieDi+fUljSS8EAjYlSchHFr67dKhexm
	 KJJMdMWfYo8IWLH2chBoG8s+ZzgqZmkjbUlBC+Vq0AxW4efi7nbP/ljmMjJI+NbTL1
	 sLgKSLCCNSmx6D/VujTYD1MVuxw2wr6bHhfmYE3B+2Va+JDWfgi0fQhFtPsUzwhJdE
	 cLIAzLkpUT7dXDv7EQ9Fky4+vRRiwgjcI8gk7iiqsUR7/k1wzYboc2OATWu/Ld1MR1
	 jUVkuUAHST53zHzaocUECX2wUK5wFha+6qsdBMVyGyNbCMW4qKIWzEnCyzkbvzH2oB
	 lq9ruU1QKaHig==
Date: Wed, 31 Dec 2025 15:21:56 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Chen Ridong <chenridong@huaweicloud.com>
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
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
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
Subject: Re: [PATCH 14/33] cpuset: Update HK_TYPE_DOMAIN cpumask from cpuset
Message-ID: <aVUxhNlKaT0r6F5c@localhost.localdomain>
References: <20251224134520.33231-1-frederic@kernel.org>
 <20251224134520.33231-15-frederic@kernel.org>
 <8ecb22ab-d719-44b4-ad40-5af0a185682a@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8ecb22ab-d719-44b4-ad40-5af0a185682a@huaweicloud.com>
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

Le Fri, Dec 26, 2025 at 04:08:04PM +0800, Chen Ridong a écrit :
> > +int housekeeping_update(struct cpumask *isol_mask, enum hk_type type)
> > +{
> > +	struct cpumask *trial, *old = NULL;
> > +
> > +	if (type != HK_TYPE_DOMAIN)
> > +		return -ENOTSUPP;
> > +
> 
> Nit:
> 
> The current if statement indicates that we only support modifying the cpumask for HK_TYPE_DOMAIN,
> which makes the type argument seem unnecessary. This seems to be designed for better scalability.
> However, when a new type needs to be supported in the future, this statement would have to be
> removed. Also, the use of cpumask_andnot below is not a general operation.
> 
> Anyway, looks good to me.

Ok, let's remove the parameter for now.

> > diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> > index 475bdab3b8db..653e898a996a 100644
> > --- a/kernel/sched/sched.h
> > +++ b/kernel/sched/sched.h
> > @@ -30,6 +30,7 @@
> >  #include <linux/context_tracking.h>
> >  #include <linux/cpufreq.h>
> >  #include <linux/cpumask_api.h>
> > +#include <linux/cpuset.h>
> >  #include <linux/ctype.h>
> >  #include <linux/file.h>
> >  #include <linux/fs_api.h>
> 
> Reviewed-by: Chen Ridong <chenridong@huawei.com>

Thanks!

-- 
Frederic Weisbecker
SUSE Labs

