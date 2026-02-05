Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB67AEC1E86
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 10:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BjyZX7vvwgIKVSB5unIpZggSr0Cm86kJBywJdAwlhWk=; b=JQyYqSQ1rMdt1Q0uUdsgfWXBwn
	V6sHmoDh/0mq80YccUSsMP5mYyAxxzk+Xi7RniDYjNXNhvQuLxU+jYdEd6vvn6EZV3LPtZBwG250Y
	0VNZGO9ktVO5crQOjlGjoc12SoznxOvx8uqb8UU2PW4eRNZL5MX4GwXj5CqkwgM0kANFSKOM8DXjM
	D0s5cNwBcLS/w70klCw9uXzv/1lV/9zN6fF+iT56ndGLXzcPxYLURGa4kvq3HhjvUmH96/EexQV3u
	FxADDwxs3nh7lcSLjGeCF5hNSODyVwMCzWHsUFXDTbgIR34YWFh9w0XI3LiNU9qvHlqf/dyXgoVOb
	0IKWbCBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnwRP-00000009lYS-2XAW;
	Thu, 05 Feb 2026 10:18:27 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnwRL-00000009lXm-1z4b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 10:18:25 +0000
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4f6Cny1jYbzJ46px;
	Thu,  5 Feb 2026 18:17:26 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id B25A240571;
	Thu,  5 Feb 2026 18:18:16 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 5 Feb
 2026 10:18:15 +0000
Date: Thu, 5 Feb 2026 10:18:14 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Linus Walleij <linusw@kernel.org>
CC: Yushan Wang <wangyushan12@huawei.com>, <alexandre.belloni@bootlin.com>,
	<arnd@arndb.de>, <fustini@kernel.org>, <krzk@kernel.org>,
	<linus.walleij@linaro.org>, <will@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<fanghao11@huawei.com>, <linuxarm@huawei.com>, <liuyonglong@huawei.com>,
	<prime.zeng@hisilicon.com>, <wangzhou1@hisilicon.com>,
	<xuwei5@hisilicon.com>, <linux-mm@vger.kernel.org>, SeongJae Park
	<sj@kernel.org>, <reinette.chatre@intel.com>, <james.morse@arm.com>, Zeng
 Heng <zengheng4@huawei.com>, <ben.horgan@arm.com>, Tony Luck
	<tony.luck@intel.com>, Dave Martin <Dave.Martin@arm.com>, Babu Moger
	<babu.moger@amd.com>
Subject: Re: [PATCH 1/3] soc cache: L3 cache driver for HiSilicon SoC
Message-ID: <20260205101814.000072ec@huawei.com>
In-Reply-To: <CAD++jLkEtpiTxaNB6vfHnbmoV1PPB7W4T_04eQrwk2os_zpfpA@mail.gmail.com>
References: <20260203161843.649417-1-wangyushan12@huawei.com>
	<20260203161843.649417-2-wangyushan12@huawei.com>
	<CAD++jLn+TDfu-aQ+Kfm=unYp4Zjg=endP3GGzZcpuYFR=s1K1g@mail.gmail.com>
	<20260204134020.00002393@huawei.com>
	<CAD++jLkEtpiTxaNB6vfHnbmoV1PPB7W4T_04eQrwk2os_zpfpA@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_021823_821263_B58C5E82 
X-CRM114-Status: GOOD (  71.45  )
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

On Thu, 5 Feb 2026 10:12:33 +0100
Linus Walleij <linusw@kernel.org> wrote:

> Hi Jonathan,
>=20
> thanks for stepping in, I'm trying to be healthy sceptical here...
>=20
> What you and others need to do is to tell me if I'm being too
> critical. But right now it feels like I need some more senior
> MM developers to tell me to be a good boy and let this
> hack patch slip before I shut up ;)

It's good to have these discussions as it makes us actually
explain what they want to do much more clearly!
wangyushan and I have both been taking about this for too long so
it's easy to miss that it's not been explained properly.

Note I was absolutely expecting a non trivial discussion on how to do
this and in particular how generic it should be.
=20
+CC a various resctl / mpam related people.

>=20
> On Wed, Feb 4, 2026 at 2:40=E2=80=AFPM Jonathan Cameron
> <jonathan.cameron@huawei.com> wrote:
>=20
> > > The MM subsytem knows which memory is most cache hot.
> > > Especially when you use DAMON DAMOS, which has the sole
> > > purpose of executing actions like that. Here is a good YouTube.
> > > https://www.youtube.com/watch?v=3DxKJO4kLTHOI =20
> >
> > This typically isn't about cache hot.  It it were, the data would
> > be in the cache without this. It's about ensuring something that would
> > otherwise unlikely to be there is in the cache. =20
>=20
> OK I get it.
>=20
> > Normally that's a latency critical region.  In general the kernel
> > has no chance of figuring out what those are ahead of time, only
> > userspace can know (based on profiling etc) that is per workload. =20
> (...)
> > The only thing we could do if this was in kernel would be to
> > have userspace pass some hints and then let the kernel actually
> > kick off the process. =20
> (...)
> > and you absolutely need userspace to be able to tell if it
> > got what it asked for or not. =20
> (...)
> > Its an extreme form of profile guided optimization (and not
> > currently automatic I think?). If we are putting code in this
> > locked region, the program has been carefully recompiled / linked
> > to group the critical parts so that we can use the minimum number
> > of these locked regions. Data is a little simpler. =20
>=20
> OK so the argument is "only userspace knows what cache lines
> are performance critical, and therefore this info must be passed
> from userspace". Do I understand correctly?

Yes.

>=20
> What I'm worried about here is that "an extreme form of profile
> guided optimization" is a bit handwavy. I would accept if it is
> based on simulation or simply human know-how, such as
> if a developer puts signal-processing algorithm kernels
> there because they know it is going to be the hard kernel
> of the process.

Those methods are part of what I'd consider profile guided optimization.
I wasn't meaning to only including the automatic methods.
For all the ways to tune this, you get lots of data from
simulation or real hardware and use that to understand what makes
sense to lock in cache.  The human involved is often going to guide
those simulations - but follow that with a lot of testing and
data gathering.

One existing user I'm aware did a lot of work to identify exactly
what they needed to pin. It's an appliance type situation where
they know exactly what the workloads are on that server. I'm not
sure how much more we can share on that customer use case / case study
beyond this vague description, so will leave it to Yushan to maybe
provide more info.

>=20
> But does the developer know if that hard kernel is importantest
> taken into account all other processes running on the system,
> and what happens if several processes say they have
> such hard kernels? Who will arbitrate? That is usually the
> kernels job.

Take the closest example to this which is resctl (mpam on arm).
This actually has a feature that smells a bit like this.
Pseudo-cache locking.=20

https://docs.kernel.org/filesystems/resctrl.html#cache-pseudo-locking

My understanding is that the semantics of that don't align perfectly
with what we have here.  Yushan can you add more on why we didn't
try to fit into that scheme?  Other than the obvious bit that more
general upstream support for the arch definitions of MPAM is a work in
progress and fitting vendor specific features on top will be tricky
for a while at least.  The hardware here is also independent of the
MPAM support.

Resctl puts the control on resource allocation into the hands of
userspace (in that case via cgroups etc as it's process level controls).
The cache lockdown is a weird because you have go through a dance of
creating a temporary setup, demand fetching the lines into cache and
then rely on various operations not occuring that might push them out
again.

Resctl provides many footguns and is (I believe) used by administrators
who are very careful in how they use it.  Note that there are some guards
in this new code to only allow locking a portion of the l3. We also rely
somewhat on the uarch and cache design to ensure it is safe to do this
type of locking (other than reducing perf of other tasks).
I'm dancing around uarch details here that I would need to go seek
agreement to share more on.

>=20
> > I haven't yet come up with any plausible scheme by which the MM
> > subsystem could do this. =20
>=20
> I find it kind of worrying if userspace knows which lines are most
> performance-critical but the kernel MM subsystem does not.
>=20
> That strongly inidicates that if only userspace knows that, then
> madvise() is the way to go. The MM might need and use this
> information for other reasons than just locking down lines in
> the L3 cache.

I agree that something like madvise() may well be more suitable.
We do need paths to know how many regions are left etc though so
it will need a few other bits of interface.

I'm also not sure what appetite there will be for an madvise()
for something that today we have no idea if anyone else actually
has hardware for.  If people do, then please shout and we can
look at how something like this can be generalized.

>=20
> In my mind:
>=20
> Userspace madvise -> Linux MM -> arch cache-line lockdown
>=20
> So the MM needs to take the decision that this indication from
> userspace is something that should result in asking the arch
> to lock down these cache lines, as well as re-evaluate it if
> new processes start sending the same madise() calls and we
> run out in lock-downable cache lines.
>=20
> L3 lock-downs is a finite resource after all, and it needs to be
> arbitrated. Just OTOMH, maybe if several processes ask for this
> simultaneously and we run out of lockdownable cache lines,
> who wins? First come first served? The process with the highest
> nice value or realtime priority? Etc.

My current thinking is first come first served with a path to
clearly tell an application it didn't get what it wanted.
Scheduling, priority etc being involved would all interfere
with the strong guarantees lock down provides.=20

That's kind of why we ended up with a device type model as
it's common to have finite resources and just say no if
they have run out (accelerator queues etc).
It's up to the userspace code to know what to do if they
can't get what they asked for.


>=20
> I.e. the kernel MM needs to arbitrate any cache lockdown.
>=20
> Bypassing the whole MM like this patch does is a hack designed
> for one single process that the user "knows" is "importantest"
> and will be the only process asking for cache lines to be locked
> down.
>=20
> And this isn't abstract and it does not scale. We can't do that.
>=20
> That's the kind of resource management we expect from the
> kernel.

I'm with you in many ways on this, but there are other
things for which we absolutely do allocate from a finite resource
and don't let the kernel make decisions - typically because there is no
right way to arbitrate.  If we can invent a scheme for arbitration
for this then great, right now I can't envision anything other than
1st come 1st served being appropriate. Maybe there are other use cases
where other schemes work (e.g. if we ever figure out how to use this
as a form of live optimization)

>=20
> MM might want to use that information for other things.

Absolutely, though I'm doubtful about trying to design a generic
way of conveying latency criticality without knowing more of those
use cases from the start.

Thanks,
Jonathan


>=20
> > I think what we need here Yushan, is more detail on end to end
> > use cases for this.  Some examples etc as clearer motivation. =20
>=20
> I agree.
>=20
> Yours,
> Linus Walleij
>=20


