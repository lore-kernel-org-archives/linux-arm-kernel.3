Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D46CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 15:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s2Mm0MsrMQG2Og7FMXueo+n8c9h6gOgi1Q8m4UCT67k=; b=JbxNKpjNrtKTY/LKNXd2Ci+K1+
	Y6klboXr9Ip7hztzuzpNjexaIEfLSeeOPCSdZWvAf2WhSpNGUYvpKQAXXcn3aX9joAZgo/Tt2KgA3
	nGj9zapa5C6VpYHPhT8VHfK/yghl1w7ca0S99wiJz4UV1uifY8u6A9pgxSA3BpmSaQu5PpMW/oURa
	GCl+FQf97gdmLWeoq4ROYaWt5xM3hshnXUfak9emvPloi3C1tYUdHrt0tHKL1cof8RvyEYvtuxJUl
	/NdexcUTSHW5HeOxjREEsc6hnbFfmfeaAAma0NLrRhkfGv5cjKe0f1H0f6gF9M1fVGzZGfoIoMe+V
	yKCHjXvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGftR-0000000E0Gd-3ZGf;
	Wed, 05 Nov 2025 15:57:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGftP-0000000E0Fq-2pEJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 15:57:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0AFF6446E4;
	Wed,  5 Nov 2025 15:57:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 626DAC4CEF5;
	Wed,  5 Nov 2025 15:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762358270;
	bh=QE/o0Mh+dZdKXtnvDA4J2WYsUMjW6VDyfclBimdmgSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oICOgyYKQxTIre82iUXxYQa+v511n78p0LH/55yOrC/qPcixKX87gwddDj+41MvaU
	 udDR3K3EBQpgaowODsG18JDcxc/9Tm00bcjPVXc3wnknNjtgfgAbq406aWeHYZjI5z
	 4uu77joC5oJffXn+3DZusDdh4FUBNZjP+i+b3b0F4GSCsrwLEaBgWDor4d6LqO/29r
	 Pv3KNro8m3YZiHAE2j4eVhzRxEZTXzdKwYbom7E6szRwPYBQga2bH0zXkFLHi9b4jL
	 AJ2ZrrbUyJI3JInBqsQp2I7DwoEBzEHAGOgWbygjatGbYoaDoSc1t79LMgiLlaLprW
	 4ShYMDmkm4j5A==
Date: Wed, 5 Nov 2025 16:57:48 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Phil Auld <pauld@redhat.com>
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
	Peter Zijlstra <peterz@infradead.org>,
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
Subject: Re: [PATCH 13/33] cpuset: Update HK_TYPE_DOMAIN cpumask from cpuset
Message-ID: <aQtz_ODTgiCGS_oB@localhost.localdomain>
References: <20251013203146.10162-1-frederic@kernel.org>
 <20251013203146.10162-14-frederic@kernel.org>
 <20251031125951.GA430420@pauld.westford.csb>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251031125951.GA430420@pauld.westford.csb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_075751_739233_6768AC2C 
X-CRM114-Status: GOOD (  13.96  )
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

Le Fri, Oct 31, 2025 at 08:59:51AM -0400, Phil Auld a écrit :
> > +int housekeeping_update(struct cpumask *mask, enum hk_type type)
> > +{
> > +	struct cpumask *trial, *old = NULL;
> > +
> > +	if (type != HK_TYPE_DOMAIN)
> > +		return -ENOTSUPP;
> > +
> > +	trial = kmalloc(sizeof(*trial), GFP_KERNEL);
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
> 
> Isn't this backwards?   If the bit is not set you save old to free it
> and if the bit is set you set it again.

That's completely backward!

Thanks for pointing out!

-- 
Frederic Weisbecker
SUSE Labs

