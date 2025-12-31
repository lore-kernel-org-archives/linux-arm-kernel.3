Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879D6EE642F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 13:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X9X4Bc+1vqdg/eu+3EHGHwPb27Iw4U5dX3RpkWh8Lcc=; b=4ISTi3dKTsIl9E/mqdH2T+S3k4
	ZON26k6d8n0fMRg6n+j4PPoaTdyFNtTdFdt/wIJ25lFppeH4ZnnVzS9hpHx7l2BJf2JwlJjYVPH28
	lBOk7f1KmVr9W3MxL2E6UClFlKBsznk0sARHwjZy2sZfYRmzOtZEPxDbCjCKjJyjSt9Xu2m5fbcVZ
	5MJF8LZ83+3Fz0uUbLNoZU7mHpYuJJtd6rZ9Sn95f7lmSVKwkVwKnN4VLAcLS3+yyyvOuHzlSplBY
	a+W58QpMwIGv+rvIV0rL6xjRimIdUM1MYjfBQH/9JHduemlKcghY1A6Z4NnSeq0QV2IALN9NiSxNs
	b7cKBM8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaw6X-000000060Gp-314e;
	Wed, 31 Dec 2025 13:19:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaw6V-000000060GO-3Aru
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 13:19:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B7E9143CF9;
	Wed, 31 Dec 2025 13:19:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A1A3C113D0;
	Wed, 31 Dec 2025 13:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767187142;
	bh=ypn/q+ILRrt5uVnU9TRkKLrfFM5tQxriCjP5mEvYBRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sqJJ3lmVMf3teCNuAdVsjiRVupecIds4UPxN86Cxl9KA2fwWuX6h3c50j+Jw9b3mL
	 rCqKrw8OoWIjhaI2tYqbnk0gExYsfn3LbQAa2vQj8o+hbrwPOWtDg6Rjm1DLv13mVm
	 MC5ly2S3u2zhzuY4tSWXwxE7HNPL6YBvMCjC2ff3u3MG+mlfHFcuf6gr5p6k5L4qp8
	 bvHV9dc+xaGru5y/5nJGRRHHaf+Pq3JYeutXzbOGpqsuTFm28PzP8lX+UrxPZuRxh1
	 Xj8ccKa6cuxj20i6EcP4HOb8zAbp0t8x44gLAREO+hbs10vbn7IRasxXyGloGJMJVS
	 suVKTc9BXvBtg==
Date: Wed, 31 Dec 2025 14:18:59 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Waiman Long <llong@redhat.com>
Cc: Zhang Qiao <zhangqiao22@huawei.com>,
	LKML <linux-kernel@vger.kernel.org>,
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
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
	cgroups@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org, linux-mm@kvack.org,
	linux-pci@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 01/33] PCI: Prepare to protect against concurrent
 isolated cpuset change
Message-ID: <aVUiw34NAG3OfOV8@localhost.localdomain>
References: <20251224134520.33231-1-frederic@kernel.org>
 <20251224134520.33231-2-frederic@kernel.org>
 <e01189e1-d8ef-2791-632c-90d4d897859b@huawei.com>
 <81f201cc-395a-48d7-a1b0-db8c62b93c9e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <81f201cc-395a-48d7-a1b0-db8c62b93c9e@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_051907_840920_AEBD9022 
X-CRM114-Status: GOOD (  11.36  )
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

Le Sun, Dec 28, 2025 at 10:53:41PM -0500, Waiman Long a écrit :
> On 12/28/25 10:23 PM, Zhang Qiao wrote:
> > >   	if (node < 0 || node >= MAX_NUMNODES || !node_online(node) ||
> > >   	    pci_physfn_is_probed(dev)) {
> > > -		cpu = nr_cpu_ids;
> > > +		error = local_pci_probe(&ddi);
> > >   	} else {
> > >   		cpumask_var_t wq_domain_mask;
> > > +		struct pci_probe_arg arg = { .ddi = &ddi };
> > > +
> > > +		INIT_WORK_ONSTACK(&arg.work, local_pci_probe_callback);
> > >   		if (!zalloc_cpumask_var(&wq_domain_mask, GFP_KERNEL)) {
> > >   			error = -ENOMEM;
> > If we return from here, arg.work will not be destroyed.
> > 
> > 
> Right. INIT_WORK_ONSTACK() should be called after successful cpumask_var_t
> allocation.

Doing that, thank you both!

-- 
Frederic Weisbecker
SUSE Labs

