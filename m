Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12F5D0D17D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 23:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=OfTUMyeeUEOAjKZC4R5wKa9dyNi8tHQWmoqO7Afja6s=; b=xhWrKeR5dUKu7x/5GIzalQ82fv
	pqJfVuUrGWr59ERbCtE8DcFu0gQOIOcxzaQaS9Qk9uCuI0CIMX24S3tAV35lSI+BjqvQw2qms86GJ
	oHmNG9cN4xye2KpoxXUYsEux6H2PUjcS1JRotdDCfUba99EivAY+PxkFvZ0jfB91/UHPJ+o/XQkCv
	JbqrHBDtIGyM530t09ADAXZnxfA3bYaTWE0fjwmO3oDSEu5/iO16U94CYz7RjkOahnYRfqwDy/WE4
	E3qFKMP7dS7YJa7hcFDWRnkbFMnAfi7LzKvZq2WHXWy5Ec/NTETFoKVhbXGnU+dwB9Xl9frWhU0m+
	/2eLd88Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdd8E-0000000FkhS-03hd;
	Wed, 07 Jan 2026 23:40:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdd8C-0000000Fkh2-17tE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 23:40:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 136A06000A;
	Wed,  7 Jan 2026 23:39:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B94C19421;
	Wed,  7 Jan 2026 23:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767829197;
	bh=TkPExvuLRdk+twI/ygMh7+/Ril+KIPyMUG6oDC8D2N0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=QWc2qayRWh0hWdOy89mtUEyGFJiHeys6+PiJCJTh8FCimQmcF4f3KQLBEmA88hw10
	 /bZvZR94ATDjonBzReJDFiH2CWArObd+a8i78tc4q18E6ySfp6xu9HbUNc002v+3Yq
	 RGKRTbINxcjSZwP2MCkG/EPm88+Wt+jCjRwufGQCj4FqHeIPPOqf1yag/eYPs1lfGY
	 0bomX+d4DHXHvJjAMgVdrHQ5b5Gkap3ilsfChy/O55qxjVWHBeLNB4E2bl8dBsU0At
	 VIu+/mFZCjqTLTppjOwLawF4UDXaj7ciEXXMrX3JN+4r082FGEWMC4M7mH52MCEL+J
	 Klea0ah1V/qsA==
Date: Wed, 7 Jan 2026 17:39:56 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>,
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
	netdev@vger.kernel.org, Jinhui Guo <guojinhui.liam@bytedance.com>
Subject: Re: [PATCH 01/33] PCI: Prepare to protect against concurrent
 isolated cpuset change
Message-ID: <20260107233956.GA453841@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aV7sheFKQWb23lsc@pavilion.home>
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

On Thu, Jan 08, 2026 at 12:30:13AM +0100, Frederic Weisbecker wrote:
> Le Wed, Jan 07, 2026 at 01:05:34PM -0600, Bjorn Helgaas a écrit :
> > On Thu, Jan 01, 2026 at 11:13:26PM +0100, Frederic Weisbecker wrote:
> > > HK_TYPE_DOMAIN will soon integrate cpuset isolated partitions and
> > > therefore be made modifiable at runtime. Synchronize against the cpumask
> > > update using RCU.
> > > 
> > > The RCU locked section includes both the housekeeping CPU target
> > > election for the PCI probe work and the work enqueue.
> > > 
> > > This way the housekeeping update side will simply need to flush the
> > > pending related works after updating the housekeeping mask in order to
> > > make sure that no PCI work ever executes on an isolated CPU. This part
> > > will be handled in a subsequent patch.
> > > 
> > > Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> > 
> > Just FYI, Jinhui posted a series that touches this same code and might
> > need some coordination:
> > 
> >   https://lore.kernel.org/r/20260107175548.1792-1-guojinhui.liam@bytedance.com
> > 
> > IIUC, Jinhui's series adds some more NUMA smarts in the driver core
> > sync probing path and removes corresponding NUMA code from the PCI
> > core probe path.
> 
> I see. I can't drop my change, otherwise my series alone could crash
> dereferencing garbage. But Jinhui's series removes the need for my
> changes.
> 
> So an unpleasant conflict will happen in -next (and if everything
> goes well, further in next merge window) and it should be resolved
> with simply ignoring my changes and only apply those of Jinhui.

I don't want to derail your series, and I don't think you need to
change anything right now.  Jinhui's series is early and might not be
ready to merge until after yours, which should be fine.

Bjorn

