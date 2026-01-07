Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90AED0D16B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 19:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=MldaEfbjcVC2b7Y9Q7MdTrFDUGsg6SwZoadzt/x4YTI=; b=AZXyDttWtQMZkR
	dJbk8rxZTyfoGXE0KFd2Kxam2lHjXkjHIWGXL1V3cyeL0zerWzSdcOu4cpt5ezxoLy3eiPytF8Lrr
	uJiHjONyvEPW5vfnTd8O1Xmp6MlbBC36c6Nb/F5h9r9955VAxmm4n71RGP+UwE1dIIGVlh3mdl7By
	CwXs1LcmiqFy2dFI56edAC29yYcDyRvoVAt1RkTUkTeYuKPpXtvILdhTud0klDyOc3KoEWT/ulo42
	lpjT0W8y+LrFxoillDMleqemasU1Uf3Gyy/ENhMPqBvfvaMkyNRGwmAqAy1ntyvbyzckTHaRyxcCv
	Tl+QgxwCizHgmVnZybcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdYqf-0000000FVXd-2Bnv;
	Wed, 07 Jan 2026 19:05:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdYqe-0000000FVXN-2wR8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 19:05:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B20A96000A;
	Wed,  7 Jan 2026 19:05:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F10CC4CEF1;
	Wed,  7 Jan 2026 19:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767812735;
	bh=cXrxAzv98+rTuAo6AZR2IpL01l/GgbnBK6hzUkgo918=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=A4RHJTdVg2eo8w4IuucYp7SsRoCH3YT//hVw93Zkkrf5yuY7VdVHzXn5p17rzjL12
	 qFhnYO1sBxAF8pzvUHMpneAhxajxGMSSn/P5eWKV8DgEr+V8cC0I0it/mxBoIwnpzA
	 ZTG5e65Y87dMZvAKJQ5K5dt9Ppt1bkZCnEZg46y9U/FleUdZZwCi/IwOgRoSRZueGl
	 wWU3xb2cH5R7JKWBRu+isqhIrXzOJQiW5H8Z0OLzuYO0YHMw3moiytq6UZetkvnrs/
	 q+BCtxWtQqAd1Xg6v3hFI08liH2/hzx+9bPTHbu7bb9UT4hw/68aVlXtLjWeg5+mZk
	 TljZ3k+3lL8bg==
Date: Wed, 7 Jan 2026 13:05:34 -0600
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
Message-ID: <20260107190534.GA441483@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260101221359.22298-2-frederic@kernel.org>
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

[+cc Jinhui]

On Thu, Jan 01, 2026 at 11:13:26PM +0100, Frederic Weisbecker wrote:
> HK_TYPE_DOMAIN will soon integrate cpuset isolated partitions and
> therefore be made modifiable at runtime. Synchronize against the cpumask
> update using RCU.
> 
> The RCU locked section includes both the housekeeping CPU target
> election for the PCI probe work and the work enqueue.
> 
> This way the housekeeping update side will simply need to flush the
> pending related works after updating the housekeeping mask in order to
> make sure that no PCI work ever executes on an isolated CPU. This part
> will be handled in a subsequent patch.
> 
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>

Just FYI, Jinhui posted a series that touches this same code and might
need some coordination:

  https://lore.kernel.org/r/20260107175548.1792-1-guojinhui.liam@bytedance.com

IIUC, Jinhui's series adds some more NUMA smarts in the driver core
sync probing path and removes corresponding NUMA code from the PCI
core probe path.

Bjorn

