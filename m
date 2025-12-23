Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0685E6F093
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 15:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6i6STglztduNNN/BxT8GuFiTUc1VSfue7E9LS9V7obQ=; b=YOsQKWMX0ZUMVPnwIEUfnaQq/S
	1AjMJzQYS+SsojX8lEg2SfW4IOguWe3zprZMnZN6Gl6YS54tjdbB4xt0zhCms9CSJcIJBwbdEXo9e
	7SYo8Uw1OuXMVle7j/GCZRkaQvJpvUdmCtwWt8gRwEb+YCecCewHcXiCJvrfOQXeEa3iCWLFMcz82
	AfR8h3Za6XlYKgVu10TCb+2R7hUAgbyQfuNIXvmnzHlGMF5O6W/qob6Ph0KqeKGyq4wIbQrZSKw3k
	BybO965gDiggCxN1RquzJEmamJEhiFf/4PvuoavtX6QkVXR3VRuS9hFliBFdtl7/xGWJuyGGAOg/5
	wK1tAZVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY47m-0000000FfFz-3FbD;
	Tue, 23 Dec 2025 15:16:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY47m-0000000FfFn-0KQ7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 15:16:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CE0C860123;
	Tue, 23 Dec 2025 15:16:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00827C113D0;
	Tue, 23 Dec 2025 15:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766502992;
	bh=MX0UEBGbGjeyT7I+fhRvt8AzC7Kbdy82QaHX7EWOjB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GNmmWNv5axguqpzzF5TE4K9OHVqQuwUPYn7m9Xy4O5zQEcBhdYuWYACcupNC3GUbK
	 oW2+cfENHoMcqbRbby7jWn2BmUXrd1fauW3pFEup7BKEk47nyIqle6LD9w6eOTMd9J
	 MAZqcMh2EGy49IdXJUbrDxuE/UiNrY1dxeXDWBoB4oPhLs9w0s/VtwK9L1yAqkvUhU
	 shf41UdhHRQXcM2m+TWEW/Amg+72ajreOtvYGVs4EFEnbxlGuB9fq0Yu/V+s3AuQkW
	 bEj1psfGTsi3frtp7vlRosrykLLEo7oh/Z2lOA3Qv6uVrDq80/wGYWOfg0mzPNyeo+
	 4OWUjWsJreuuw==
Date: Tue, 23 Dec 2025 16:16:29 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Chen Ridong <chenridong@huaweicloud.com>
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
	Vlastimil Babka <vbabka@suse.cz>, Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>, cgroups@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org,
	linux-mm@kvack.org, linux-pci@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 13/31] cpuset: Update HK_TYPE_DOMAIN cpumask from cpuset
Message-ID: <aUqyTUm2NipItcVu@localhost.localdomain>
References: <20251105210348.35256-1-frederic@kernel.org>
 <20251105210348.35256-14-frederic@kernel.org>
 <e0c0f8b7-112f-40d7-b211-89065e9003b2@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e0c0f8b7-112f-40d7-b211-89065e9003b2@huaweicloud.com>
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

Le Sat, Nov 08, 2025 at 05:05:10PM +0800, Chen Ridong a écrit :
> > +int housekeeping_update(struct cpumask *mask, enum hk_type type)
> > +{
> > +	struct cpumask *trial, *old = NULL;
> > +
> > +	if (type != HK_TYPE_DOMAIN)
> > +		return -ENOTSUPP;
> > +
> > +	trial = kmalloc(cpumask_size(), GFP_KERNEL);
> > +	if (!trial)
> > +		return -ENOMEM;
> > +
> > +	cpumask_andnot(trial, housekeeping_cpumask(HK_TYPE_DOMAIN_BOOT), mask);
> 
> Since there's no comment for the 'mask' parameter, would it be better to name it 'isol_mask'? This
> would make it clearer that this is the isolation mask input and what is doing
> here.

Good point! I made the change.

Thanks.

-- 
Frederic Weisbecker
SUSE Labs

