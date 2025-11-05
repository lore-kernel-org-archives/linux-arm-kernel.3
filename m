Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1FACCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 15:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zoi8Wq3WjA1e5/c0y+vLl6j5XXs28shfJ6lWyOjda64=; b=J4fhe6247DOyhTG1KLSGvvWWvj
	44ereHYCIzW07uRAu9o/OxF/QPRgtXQnxer7kLM9gL7LuOSO0ryzULJHq/BEg9wwKdraFSYSz2rXW
	pRf2f2ZO4xWdB7wuZg2MFMW9oBX/VFi5icszBPZXy0KJ6wOgTFvgqiDPVKirCbdPuNZ1yylVeE2CY
	ks5CGuaou9awhCoHFiJ98UoK2vKbyMpihwEp/gbx5p6UWN9F40TL31AP7wVomUZyiOAyJaz7mefLM
	94LIpkjMTcBfqX04NtyZ0S9gRyxdmGVW+2mkQ+AoY9VrKbvJAsIiVCXCy0LzJX0cLljOg6KxrnzPP
	jNynSJtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfhv-0000000Dyg6-0Waj;
	Wed, 05 Nov 2025 15:45:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfht-0000000DyfE-07aC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 15:45:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1441540A19;
	Wed,  5 Nov 2025 15:45:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70A62C4CEF5;
	Wed,  5 Nov 2025 15:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762357555;
	bh=xmm6nLsTXBCwCytcbyH8QsnB2JeBdkkjUjdkaJjSew8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V49Bcvv4Vr1XD0d8nGugzn6nEJFHU94wKaZlMJvIc+YJdz7x5ju9aDQoREW8ASZJU
	 MW1hUDPpNZJmSffEhIdGydas6VB+w4ctZOakowcXZPe9VCVSOUxeNYJArgQ7UxDpnN
	 G8fLk11CiNYat6qGWS6sf3enIsQ6suuzdkc/xJ+96sXJyCgwm/VCvwN3kn/uST4kQ/
	 n2/u4JFfGzZ4lnX2yMvrfbCe1/yIkfyrIb0MDZJtSXAoqGFqJvvBcFvCehuflcypjt
	 eNy+hH/+vmLM4JvkGDmULWA4wY5yEEwNvPSk59QeVOmmqB4U/icu2vG2nFt6e1YuOS
	 ZRjYiAhWKqFrQ==
Date: Wed, 5 Nov 2025 16:45:53 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Waiman Long <llong@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
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
Subject: Re: [PATCH 13/33] cpuset: Update HK_TYPE_DOMAIN cpumask from cpuset
Message-ID: <aQtxMYmwzfg2NW1O@localhost.localdomain>
References: <20251013203146.10162-1-frederic@kernel.org>
 <20251013203146.10162-14-frederic@kernel.org>
 <ea2d3e0e-b1ee-4b58-a93a-b9d127258e75@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ea2d3e0e-b1ee-4b58-a93a-b9d127258e75@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_074557_126852_5ED87A82 
X-CRM114-Status: GOOD (  20.81  )
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

Le Tue, Oct 21, 2025 at 09:39:10AM -0400, Waiman Long a écrit :
> On 10/13/25 4:31 PM, Frederic Weisbecker wrote:
> > @@ -80,12 +110,45 @@ EXPORT_SYMBOL_GPL(housekeeping_affine);
> >   bool housekeeping_test_cpu(int cpu, enum hk_type type)
> >   {
> > -	if (housekeeping.flags & BIT(type))
> > +	if (READ_ONCE(housekeeping.flags) & BIT(type))
> >   		return cpumask_test_cpu(cpu, housekeeping_cpumask(type));
> >   	return true;
> >   }
> >   EXPORT_SYMBOL_GPL(housekeeping_test_cpu);
> > +int housekeeping_update(struct cpumask *mask, enum hk_type type)
> > +{
> > +	struct cpumask *trial, *old = NULL;
> > +
> > +	if (type != HK_TYPE_DOMAIN)
> > +		return -ENOTSUPP;
> > +
> > +	trial = kmalloc(sizeof(*trial), GFP_KERNEL);
> Should you use cpumask_size() instead of sizeof(*trial) as the latter can be
> much bigger?

Good point!

> > +	if (!trial)
> > +		return -ENOMEM;
> > +
> > +	cpumask_andnot(trial, housekeeping_cpumask(HK_TYPE_DOMAIN_BOOT), mask);
> > +	if (!cpumask_intersects(trial, cpu_online_mask)) {
> > +		kfree(trial);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (!housekeeping.flags)
> > +		static_branch_enable(&housekeeping_overridden);
> > +
> > +	if (!(housekeeping.flags & BIT(type)))
> > +		old = housekeeping_cpumask_dereference(type);
> > +	else
> > +		WRITE_ONCE(housekeeping.flags, housekeeping.flags | BIT(type));
> > +	rcu_assign_pointer(housekeeping.cpumasks[type], trial);
> > +
> > +	synchronize_rcu();
> > +
> > +	kfree(old);
> 
> If "isolcpus" boot command line option is set, old can be a pointer to the
> boot time memblock area which isn't a pointer that can be handled by the
> slab allocator AFAIU. I don't know the exact consequence, but it may not be
> good. One possible solution I can think of is to make HK_TYPE_DOMAIN and
> HK_TYPE_DOMAIN_ROOT point to the same memblock pointer and don't pass the
> old HK_TYPE_DOMAIN pointer to kfree() if it matches HK_TYPE_DOMAIN_BOOT one.
> Alternatively, we can just set the HK_TYPE_DOMAIN_BOOT pointer at boot and
> make HK_TYPE_DOMAIN falls back to HK_TYPE_DOMAIN_BOOT if not set.

Have a look at housekeeping_init() which reallocates the memblock
allocated memory with kmalloc to avoid these troubles.

Thanks!

-- 
Frederic Weisbecker
SUSE Labs

