Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEEECCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 16:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=stxcgJFM7XAuSjQbOIOh1iIf0ZpMvw60UV2xtTfCjKk=; b=TOOWPikNzNdgF1q63SsagPOWAt
	aTrYIZmAPfGQSM9Zn1d3XSHrD2MNoe1VgLxFHqScWWMIaG1oQhUDtQZR9pinSAVYp1Wfl1tms9clg
	ELqca4BEyLyBYCTzc6Hck33QwRVsuzDIzBS7UOuPJ4msteEmmrp40qk7Kzoqb6M+UqCSIuP8YQiKJ
	wjpfQRjOrn/Tp4oYD8DNQUY0K3FKDeBHzzTJ00wfqnMq3gaklBWrFRGdbkfYJXYCDwvHN8ZUGHVBs
	mLw77Xcbti+kih4nJJQrtHn2n8jhdm1n6Ez6AeEJzIhcSj8sP0yTXSJNU11DhqhgZ32tbSjbGaY3v
	wNNtA2EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgFe-0000000E3Ua-2B0n;
	Wed, 05 Nov 2025 16:20:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgFb-0000000E3UE-2kOX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 16:20:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D073E4032C;
	Wed,  5 Nov 2025 16:20:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32444C4CEF5;
	Wed,  5 Nov 2025 16:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762359646;
	bh=HORUZlleqGnWgVcZ+zlwYb20knRrXuIZGW9gxPsBS1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HiLfEowj7vPT6Pl4dqLOpNLY19tVHGFP0v47Tp5DoiLPK3xnsdZTSTMYbQBZuDYTo
	 O8ghL6BtQTDv8INj+VzQMymaj/H6sDCtq2nZ1z93yqc/wAajbl0PM7tSyFsYTz/oVH
	 c8csoGsf6nUZsLr93DkgsE+Cs/pZZf/8MxHEhKtdWeWCWhSg8sO1fmV2EZOdjzsLTO
	 H7H0v2Y693fEb83TENOJX76XqlJgw1m/0x88JXsiSnJDU06mdLum59RV1AgxSyyYbj
	 J7MczXFdDh7ckB3jsb1hJrEMmddJbXEPtYbA3ja1mjnnM9yqIi9xRpUsUZ4UKN/XOw
	 qCnVKl+dXmmFg==
Date: Wed, 5 Nov 2025 17:20:44 +0100
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
Subject: Re: [PATCH 14/33] sched/isolation: Flush memcg workqueues on cpuset
 isolated partition change
Message-ID: <aQt5XImgRtxYYt0e@localhost.localdomain>
References: <20251013203146.10162-1-frederic@kernel.org>
 <20251013203146.10162-15-frederic@kernel.org>
 <364e084a-ef37-42ab-a2ae-5f103f1eb212@redhat.com>
 <a01172d1-d902-4d55-bc1e-c8234985e65a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a01172d1-d902-4d55-bc1e-c8234985e65a@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_082047_732583_4A2D6228 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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

Le Tue, Oct 21, 2025 at 03:28:42PM -0400, Waiman Long a écrit :
> On 10/21/25 3:16 PM, Waiman Long wrote:
> According to commit dadb3ebcf39 ("workqueue: WQ_PERCPU added to
> alloc_workqueue users"), the default may be changed to WQ_UNBOUND in the
> future.

Ok, well if necessary it will be easy to change.

Thanks.

> 
> Cheers,
> Longman
> 

-- 
Frederic Weisbecker
SUSE Labs

