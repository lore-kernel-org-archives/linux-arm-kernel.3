Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522F0E9539E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 13:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rBGhlK7c6/fVULA04Vh3OrNuFfQpGEjr9mHBp/kpHzQ=; b=GJaLY/XB3+vlXm81ELx0s25n8/
	a5LMGh1gWjNyyQDeUwyq1YqDTrejo8ZmtDJwI2k3ubna/yCIepU+6bd8Lu6Wuxzgxy832fD1lejaa
	x4AftFqXCFzQQvZfElYQByxcoJOqBts/V9UVG/pgjYE684whlQBF5ElguMDERmR9N/lR+GICHoxp3
	yherxQ5U2EEhT9wDq4TWKJpl/dNysb2GCWVgm3NaBlGJlidlRT9YW9XRTkIAGjOkhwYF1bbca02Ev
	9NSnbUghhBlfuHOMtkblbhiHYyvDfxsG2XKak6h0y3rZPZ3KLCSbtqw9UhDbMo5NTcZZoPSawH3MC
	j3ppfRPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnd7O-00000008Wy4-3H5U;
	Wed, 04 Feb 2026 13:40:30 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnd7L-00000008Wxg-03Yc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 13:40:29 +0000
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4f5hKd6xGpzJ46Zw;
	Wed,  4 Feb 2026 21:39:33 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 118F640086;
	Wed,  4 Feb 2026 21:40:23 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 4 Feb
 2026 13:40:22 +0000
Date: Wed, 4 Feb 2026 13:40:20 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Linus Walleij <linusw@kernel.org>
CC: Yushan Wang <wangyushan12@huawei.com>, <alexandre.belloni@bootlin.com>,
	<arnd@arndb.de>, <fustini@kernel.org>, <krzk@kernel.org>,
	<linus.walleij@linaro.org>, <will@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<fanghao11@huawei.com>, <linuxarm@huawei.com>, <liuyonglong@huawei.com>,
	<prime.zeng@hisilicon.com>, <wangzhou1@hisilicon.com>,
	<xuwei5@hisilicon.com>, <linux-mm@vger.kernel.org>, SeongJae Park
	<sj@kernel.org>
Subject: Re: [PATCH 1/3] soc cache: L3 cache driver for HiSilicon SoC
Message-ID: <20260204134020.00002393@huawei.com>
In-Reply-To: <CAD++jLn+TDfu-aQ+Kfm=unYp4Zjg=endP3GGzZcpuYFR=s1K1g@mail.gmail.com>
References: <20260203161843.649417-1-wangyushan12@huawei.com>
	<20260203161843.649417-2-wangyushan12@huawei.com>
	<CAD++jLn+TDfu-aQ+Kfm=unYp4Zjg=endP3GGzZcpuYFR=s1K1g@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_054027_377945_FA52F51D 
X-CRM114-Status: GOOD (  35.32  )
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

On Wed, 4 Feb 2026 01:10:01 +0100
Linus Walleij <linusw@kernel.org> wrote:

> Hi Yushan,
>=20
> thanks for your patch!
>=20
> On Tue, Feb 3, 2026 at 5:18=E2=80=AFPM Yushan Wang <wangyushan12@huawei.c=
om> wrote:
> >
> > The driver will create a file of `/dev/hisi_l3c` on init, mmap
> > operations to it will allocate a memory region that is guaranteed to be
> > placed in L3 cache.
> >
> > The driver also provides unmap() to deallocated the locked memory.
> >
> > The driver also provides an ioctl interface for user to get cache lock
> > information, such as lock restrictions and locked sizes.
> >
> > Signed-off-by: Yushan Wang <wangyushan12@huawei.com> =20
>=20
> The commit message does not say *why* you are doing this?
>=20
> > +config HISI_SOC_L3C
> > +       bool "HiSilicon L3 Cache device driver"
> > +       depends on ACPI
> > +       depends on ARM64 || COMPILE_TEST
> > +       help
> > +         This driver provides the functions to lock L3 cache entries f=
rom
> > +         being evicted for better performance. =20
>=20
> Here is the reason though.
>=20
> Things like this need to be CC to linux-mm@vger.kernel.org.
>=20
> I don't see why userspace would be so well informed as to make decisions
> about what should be locked in the L3 cache and not?
>=20
> I see the memory hierarchy as any other hardware: a resource that is
> allocated and arbitrated by the kernel.
>=20
> The MM subsytem knows which memory is most cache hot.
> Especially when you use DAMON DAMOS, which has the sole
> purpose of executing actions like that. Here is a good YouTube.
> https://www.youtube.com/watch?v=3DxKJO4kLTHOI
Hi Linus,

This typically isn't about cache hot.  It it were, the data would
be in the cache without this. It's about ensuring something that would
otherwise unlikely to be there is in the cache.

Normally that's a latency critical region.  In general the kernel
has no chance of figuring out what those are ahead of time, only
userspace can know (based on profiling etc) that is per workload.
The first hit matters in these use cases and it's not something
the prefetchers can help with.

The only thing we could do if this was in kernel would be to
have userspace pass some hints and then let the kernel actually
kick off the process. That just boils down to using a different
interface to do what this driver is doing (and that's the conversaion
this series is trying to get going)  It's a finite resource
and you absolutely need userspace to be able to tell if it
got what it asked for or not.

Damon might be useful for that preanalysis though but it can't do
anything for the infrequent extremely latency sensitive accesses.
Normally this is fleet wide stuff based on intensive benchmarking
of a few nodes.  Same sort of approach as the original warehouse
scale computing paper on tuning zswap capacity across a fleet.
Its an extreme form of profile guided optimization (and not
currently automatic I think?). If we are putting code in this
locked region, the program has been carefully recompiled / linked
to group the critical parts so that we can use the minimum number
of these locked regions. Data is a little simpler.

It's kind of similar to resctl but at a sub process granularity.

>=20
> Shouldn't the MM subsystem be in charge of determining, locking
> down and freeing up hot regions in L3 cache?
>=20
> This looks more like userspace is going to determine that but
> how exactly? By running DAMON? Then it's better to keep the
> whole mechanism in the kernel where it belongs and let the
> MM subsystem adapt locked L3 cache to the usage patterns.

I haven't yet come up with any plausible scheme by which the MM
subsystem could do this.

I think what we need here Yushan, is more detail on end to end
use cases for this.  Some examples etc as clearer motivation.

Jonathan

>=20
> Yours,
> Linus Walleij
>=20


