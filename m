Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFE1D13C13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 13:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ky62GUwPERN/e0pyAb7yB0pYqm86UmimVZKdDJ3jtbo=; b=i/GZbmwC02S85qwva39nzj2sxy
	72lZYEq6QFy5BsY61b8beDPF9gz3/BmsMyk1PIkGWU2RKPigUseaFvTfZV7pH5AEj6aES2aKK/QT5
	knBZujjVnTdyJOGyTLMYKMxBAIHSvbQeVbDO9FLi2TqNAvKuDUMU/Aie3By5CS/XVEMo1T/PJ8D21
	k1sfDAhy/9kFjTTfLXywYRWZGTN7Qj2NhiMTcwKRGEnTY5SGDEKRyLnL8QG8pwwtIzDOf5AWy5zh/
	25lSFLHvZifxIHtlf6FIvjaRXNsK+N6gL2D2YD7N0XhH4ofHAlakreNw+O52C0TH0zIR4YizammYe
	mGm8Qk9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkN0r-0000000Ce3s-3wZc;
	Mon, 26 Jan 2026 13:52:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkN0q-0000000Ce3k-3BLC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 13:52:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ADA94600C3;
	Mon, 26 Jan 2026 13:52:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D689CC116C6;
	Mon, 26 Jan 2026 13:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769435535;
	bh=kcA2cPiJEC19HBEstbYBifZWvAw98I0XK00+8H10mco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kVVmZvFr+CRLz0dBd5XLWyUavbW8nCgjkNtfsZ68viSoUlQzfs77mgqO6yT/jpeN8
	 pg7kQkZ+GT9I3gBbH5KSW1N19v6LZBDwYGLOWXiqcQylBZ5g4+KO6kKGQcqEiAcp10
	 ausowbCOUHsZ9bfKrKj7R3xBLNET1yxkp9J+5MLTEWX7f4No1SfT5XTL6aSPrTfT+N
	 bCZy9asASdQMt42TI+gLu+rK/RLraHfA4D5BqFAPeAolk0a/hyw0wdylU0k19HWyrL
	 x4wXKWwVwt8GOfxwvDBurrXf2OyecnDAn/Q+0+zLdQYHvjvwQgg6PufPEP9PU1/i/q
	 WOFYplVNvnCcg==
Date: Mon, 26 Jan 2026 13:52:05 +0000
From: Will Deacon <will@kernel.org>
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
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
	Paolo Abeni <pabeni@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>, Phil Auld <pauld@redhat.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Simon Horman <horms@kernel.org>, Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>, Waiman Long <longman@redhat.com>,
	cgroups@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org, linux-mm@kvack.org,
	linux-pci@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 29/33] sched/arm64: Move fallback task cpumask to
 HK_TYPE_DOMAIN
Message-ID: <aXdxhfVLqyv-2SDX@willie-the-truck>
References: <20260125224541.50226-1-frederic@kernel.org>
 <20260125224541.50226-30-frederic@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260125224541.50226-30-frederic@kernel.org>
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

On Sun, Jan 25, 2026 at 11:45:36PM +0100, Frederic Weisbecker wrote:
> When none of the allowed CPUs of a task are online, it gets migrated
> to the fallback cpumask which is all the non nohz_full CPUs.
> 
> However just like nohz_full CPUs, domain isolated CPUs don't want to be
> disturbed by tasks that have lost their CPU affinities.
> 
> And since nohz_full rely on domain isolation to work correctly, the
> housekeeping mask of domain isolated CPUs should always be a subset of
> the housekeeping mask of nohz_full CPUs (there can be CPUs that are
> domain isolated but not nohz_full, OTOH there shouldn't be nohz_full
> CPUs that are not domain isolated):
> 
> 	HK_TYPE_DOMAIN & HK_TYPE_KERNEL_NOISE == HK_TYPE_DOMAIN
> 
> Therefore use HK_TYPE_DOMAIN as the appropriate fallback target for
> tasks. Note that cpuset isolated partitions are not supported on those
> systems and may result in undefined behaviour.
> 
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> Reviewed-by: Waiman Long <longman@redhat.com>
> ---
>  Documentation/arch/arm64/asymmetric-32bit.rst | 12 ++++++++----
>  arch/arm64/kernel/cpufeature.c                |  6 +++---
>  2 files changed, 11 insertions(+), 7 deletions(-)

Thanks, Frederic, this looks much better to me. I also chucked my old
tests at it and it looked good, so:

Acked-by: Will Deacon <will@kernel.org>
Tested-by: Will Deacon <will@kernel.org>

Will

