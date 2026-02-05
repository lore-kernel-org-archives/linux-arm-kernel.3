Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434C0EA7945
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 02:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D+86YAsyA6bU1wm76V9m/Ln82AVueA/iQz6cYgVERVY=; b=WX8ww6JazppMVddK2UfX3YAElj
	UEEJcrSMfYqmNHU2o1VX7snhnmVt9Zo5X4V3hseKrSvbPFubUoT3yXnSoAQslWIyK8573RSTZFFwv
	TEzleSzlIYO+zC66N+ZkB0UbIT6lFviynDivKPmZZ0kK7rBN5qz+7n545M1VzDq3rLxhfIG0gdQPe
	SdWxnEjRzQAfApE1HlMRex9xnuhF+d7ol4IsyFPVxWnoJKJOcNKX8NLiAi1wICxtNAa5mkYIse++p
	gTzFoVIYvWj/w6mEXiB7G8HQgbdU46oIO6iwYNwtO0OEq8Cw5ZkE7drsjlns7RaQMHEdEZi2EmNO/
	ZAuZADyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnozS-00000009JOw-15gK;
	Thu, 05 Feb 2026 02:21:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnozQ-00000009JOl-38O1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 02:21:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B8CE60010;
	Thu,  5 Feb 2026 02:21:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B999C4CEF7;
	Thu,  5 Feb 2026 02:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770258063;
	bh=1p0q+XL1NkDEIGz0jM/jqZKOiumpLaYIkMgzoq+3IDs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p/e42ZGNlSTUkphkNgB026mUr99Q0qJU57Zb+bRhlmIJjYTMAXkQbjQl9DvfNhxJq
	 XP3L9tVmkDVFlt3/wKPPKhYePp+x+MokrVqmzZzC+AQzM6dMUeHjoHuTYv8AS0DRap
	 HpnpMw2HAonYxYNN2nDpDX6JihICKlUmT226oKgRMct5vUZ+0MGpJUkeeHwG7b3aj+
	 L9VImKdCjBqwTogikjGsJpJ4DGU1xLtp+yBNwB0aEQlGYrbQbl1gv7LLELWTTXjguT
	 XPEU4evKDFLVbxMQIyonNP5VwBnIWxKLQfmjdFZ3xUCcCIKccsVGQHtkhYiDlQLIEl
	 q9bBaXizD/NoA==
From: SeongJae Park <sj@kernel.org>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: SeongJae Park <sj@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Yushan Wang <wangyushan12@huawei.com>,
	alexandre.belloni@bootlin.com,
	arnd@arndb.de,
	fustini@kernel.org,
	krzk@kernel.org,
	linus.walleij@linaro.org,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	fanghao11@huawei.com,
	linuxarm@huawei.com,
	liuyonglong@huawei.com,
	prime.zeng@hisilicon.com,
	wangzhou1@hisilicon.com,
	xuwei5@hisilicon.com,
	linux-mm@kvack.org
Subject: Re: [PATCH 1/3] soc cache: L3 cache driver for HiSilicon SoC
Date: Wed,  4 Feb 2026 18:20:58 -0800
Message-ID: <20260205022100.68997-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260204134447.00000afd@huawei.com>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On Wed, 4 Feb 2026 13:44:47 +0000 Jonathan Cameron <jonathan.cameron@huawei.com> wrote:

> 
> Fixed linux-mm address that got added a few emails back.
> 
> On Wed, 4 Feb 2026 13:40:20 +0000
> Jonathan Cameron <jonathan.cameron@huawei.com> wrote:
> 
> > On Wed, 4 Feb 2026 01:10:01 +0100
> > Linus Walleij <linusw@kernel.org> wrote:
> > 
> > > Hi Yushan,
> > > 
> > > thanks for your patch!
> > > 
> > > On Tue, Feb 3, 2026 at 5:18 PM Yushan Wang <wangyushan12@huawei.com> wrote:  
> > > >
> > > > The driver will create a file of `/dev/hisi_l3c` on init, mmap
> > > > operations to it will allocate a memory region that is guaranteed to be
> > > > placed in L3 cache.
> > > >
> > > > The driver also provides unmap() to deallocated the locked memory.
> > > >
> > > > The driver also provides an ioctl interface for user to get cache lock
> > > > information, such as lock restrictions and locked sizes.
> > > >
> > > > Signed-off-by: Yushan Wang <wangyushan12@huawei.com>    
> > > 
> > > The commit message does not say *why* you are doing this?
> > >   
> > > > +config HISI_SOC_L3C
> > > > +       bool "HiSilicon L3 Cache device driver"
> > > > +       depends on ACPI
> > > > +       depends on ARM64 || COMPILE_TEST
> > > > +       help
> > > > +         This driver provides the functions to lock L3 cache entries from
> > > > +         being evicted for better performance.    
> > > 
> > > Here is the reason though.
> > > 
> > > Things like this need to be CC to linux-mm@vger.kernel.org.
> > > 
> > > I don't see why userspace would be so well informed as to make decisions
> > > about what should be locked in the L3 cache and not?
> > > 
> > > I see the memory hierarchy as any other hardware: a resource that is
> > > allocated and arbitrated by the kernel.
> > > 
> > > The MM subsytem knows which memory is most cache hot.
> > > Especially when you use DAMON DAMOS, which has the sole
> > > purpose of executing actions like that. Here is a good YouTube.
> > > https://www.youtube.com/watch?v=xKJO4kLTHOI  

Thank you for Cc-ing me, Linus.

> > Hi Linus,
> > 
> > This typically isn't about cache hot.  It it were, the data would
> > be in the cache without this. It's about ensuring something that would
> > otherwise unlikely to be there is in the cache.
> > 
> > Normally that's a latency critical region.  In general the kernel
> > has no chance of figuring out what those are ahead of time, only
> > userspace can know (based on profiling etc) that is per workload.
> > The first hit matters in these use cases and it's not something
> > the prefetchers can help with.
> > 
> > The only thing we could do if this was in kernel would be to
> > have userspace pass some hints and then let the kernel actually
> > kick off the process. That just boils down to using a different
> > interface to do what this driver is doing (and that's the conversaion
> > this series is trying to get going)  It's a finite resource
> > and you absolutely need userspace to be able to tell if it
> > got what it asked for or not.

And thank you for clarifying, Jonathan.

> > 
> > Damon might be useful for that preanalysis though but it can't do
> > anything for the infrequent extremely latency sensitive accesses.

I also find no good idea to let DAMON help in this scenario.

If I have to make a brain storming idea off the top of my humble head, though.
Maybe we can ask DAMON to monitor address ranges that assumed to have the
latency sensitive data.  And further ask DAMOS to find sub regions of the area
that getting colder than desired, and make an access to cache lines of the sub
regions so that they can be in the cache for "most cases".

It is just a brain storming idea off the top of my head and probably not work
for your case, since...  It ain't work if there is no good way to know or
guarantee the address ranges for the latency sensitive data.  It ain't work for
extremely latency sensitive case, as DAMON is just a best effort.  It ain't
work with DAMON of today because DAMOS doesn't support such kind of
cache-granularity access generation action.  So, it sounds like not a good
idea.

Nonetheless, if you get any question for DAMON in future, please feel free to
reach out :)


Thanks,
SJ

[...]

