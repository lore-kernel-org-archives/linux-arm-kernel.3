Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37861CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 15:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v5C7QxURq//NocpIY9CEsDLZ2QT+8QdYxClseUAsngY=; b=1p0h6YUoa9mPuJ4kx6rvPPUccE
	XKDkYdtBbQTNNdrsF5wXZ6EO+nfbbtCIxJXOaTszWyqjdlQnjyIF2wiJXv0CdCvB/tslz9/jwCsea
	q6PEygowYTL/ISJZAYhZTRzV4pnjkRO0A5mwW0EnW8edwyXX2wsrA+5QoWicy1Oc9Nb/FoD18eBEm
	njeDlHgMMjGUH9LDktTdYXyzxYfJB7K+PryFI50E9xlKcV7f4wT5WCAQUCDoejLqUmRWjakKCEKj8
	wUykwubyivNdconFzmn0mRyFchIZ8gEE0fpLIlWyZfMfbMKw3by3ANJPPZj9LI8neo5I26OFloPdL
	kHgRuguA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfLn-0000000DvAf-3lRV;
	Wed, 05 Nov 2025 15:23:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfLl-0000000DvA6-07aX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 15:23:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0418844362;
	Wed,  5 Nov 2025 15:23:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CEDBC4CEF5;
	Wed,  5 Nov 2025 15:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762356183;
	bh=fusB0gibvJKJQXePl8CXgegfMzOrPm+adEItFF8rn4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fI54FeAijnMRfBlbxLG2+Iek1ya9gdrVicMOy6ppH48QNJY1JwCA0YIcMTsGcAyyZ
	 KuEb2RQHhUEh749M7gs858+NV46mLYZbGP/8Mp4QmoJ81PcA4BX5I+j9kHoraKETyY
	 5/xsZ+pDWMBJe6yrYwpFs/GuyQIvd/XVyzYLrl689vn8XudarKTwU0ZOlC8B+b3wxA
	 4M04j8KUlHVMArmw92JUAxOG0ooE93fYnwL/Ap60WXkOAbqG1sxhteuwbYCz02ush8
	 Nel4ht9ZvEnSBScs7Jx0YygYSCSf5Dvon/HzaCuHFaOaiCZMR0DrRHFWElXp1YaKVm
	 4kzXv9mqOHBdg==
Date: Wed, 5 Nov 2025 16:23:01 +0100
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
Subject: Re: [PATCH 12/33] sched/isolation: Convert housekeeping cpumasks to
 rcu pointers
Message-ID: <aQtr1VM9k5-uJbfu@localhost.localdomain>
References: <20251013203146.10162-1-frederic@kernel.org>
 <20251013203146.10162-13-frederic@kernel.org>
 <083388fb-3240-4329-ad49-b81cd89acffd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <083388fb-3240-4329-ad49-b81cd89acffd@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_072305_087658_95011FE3 
X-CRM114-Status: GOOD (  10.31  )
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

Le Mon, Oct 20, 2025 at 11:49:53PM -0400, Waiman Long a écrit :
> >   bool housekeeping_test_cpu(int cpu, enum hk_type type)
> >   {
> > -	if (static_branch_unlikely(&housekeeping_overridden))
> > -		if (housekeeping.flags & BIT(type))
> > -			return cpumask_test_cpu(cpu, housekeeping.cpumasks[type]);
> > +	if (housekeeping.flags & BIT(type))
> > +		return cpumask_test_cpu(cpu, housekeeping_cpumask(type));
> >   	return true;
> >   }
> 
> The housekeeping_overridden static key check is kept in other places except
> this one. Should we keep it for consistency?

Indeed!

Thanks.

-- 
Frederic Weisbecker
SUSE Labs

