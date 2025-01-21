Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBC8C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 09:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s1rCtb9CHfG/RBN5TK4bRIuTJwFB/pLSpTfyuDz9ifw=; b=m4Npuu5cz9ogVzYtjRPefAivJU
	MjwaE3GyXDLXAGE6myvxLl9U1+U8o90qfl4GygtI7nHKNrCQMdzgI+3KYhGTMpmQqVVDPsewGLNFI
	64SYm+nx9+BE8+ATBJvNwLGW3HWnDDPDPIkfT2T78mt7zwUeDfxdlWNAX0OI2ZEJEpHskJ4iHfQhW
	X+3JHi5u/KwK1ULKnQ1uNJUWdmoWAwKXmj6/LwNUwZpo5yTifbKO16RbqGfE0z61UH/HYHen3h98C
	Hom/vnD2FC/nbj2YLkw/JE8zpyUsJIDwVOYZ15BK3ivhdkt2dWPKfGLH+O5H0IYu3M8zTtLZvGEGD
	1KOwSofg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taASV-00000007OhZ-1Haa;
	Tue, 21 Jan 2025 09:22:07 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taAQz-00000007OXh-2CI9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 09:20:35 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YchTW1C8Cz686xP;
	Tue, 21 Jan 2025 17:18:39 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id 0A7AE140367;
	Tue, 21 Jan 2025 17:20:28 +0800 (CST)
Received: from localhost (10.47.73.154) by frapeml500003.china.huawei.com
 (7.182.85.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 21 Jan
 2025 10:20:27 +0100
Date: Tue, 21 Jan 2025 09:20:20 +0000
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: Radu Rendec <rrendec@redhat.com>, <robh@kernel.org>
CC: Rob Herring <robh@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Sudeep Holla <sudeep.holla@arm.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Borislav Petkov
	<bp@alien8.de>, <jonathan.cameron@huawei.com>
Subject: Re: [RFC PATCH 0/1] arm64: cacheinfo: Avoid out-of-bounds write
 when DT info is incorrect
Message-ID: <20250121092020.0000044d@huawei.com>
In-Reply-To: <e2a49840672c89f87916611cb5973600e4e014a6.camel@redhat.com>
References: <20250116185458.3272683-1-rrendec@redhat.com>
	<20250117130811.GA445389-robh@kernel.org>
	<e2a49840672c89f87916611cb5973600e4e014a6.camel@redhat.com>
Organization: Huawei
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.47.73.154]
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_012033_900544_D078637F 
X-CRM114-Status: GOOD (  54.63  )
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

On Fri, 17 Jan 2025 11:59:36 -0500
Radu Rendec <rrendec@redhat.com> wrote:

> On Fri, 2025-01-17 at 07:08 -0600, Rob Herring wrote:
> > On Thu, Jan 16, 2025 at 01:54:57PM -0500, Radu Rendec wrote: =20
> > > I found an out-of-bounds write bug in the arm64 implementation of
> > > populate_cache_leaves() and I'm trying to fix it. The reason why
> > > this is an RFC is that I'm not entirely sure these changes are
> > > sufficient.
> > >=20
> > > The problem is described in detail in the patch itself, so I won't
> > > repeat it here. The gist of it is that on arm64 boards where the
> > > device tree describes the cache structure, the number of cache
> > > leaves that comes out of fetch_cache_info() and is used to size
> > > the cacheinfo array can be smaller than the actual number of
> > > leaves. In that case, populate_cache_leaves() writes past the
> > > cacheinfo array bounds.
> > >=20
> > > The way I fixed it, the code doesn't change too much and doesn't
> > > look ugly but it's still possible to write past the array bounds
> > > if the last populated level is a separate data/instruction cache.
> > > But I'm not sure if this is a real-world scenario, so this is one
> > > of the areas where I'm looking for feedback. For example, the DT
> > > may define a single unified level (so levels=3D1, leaves=3D1) but in
> > > fact L1 is a split D/I cache. Or the DT defines multiple levels,
> > > the last one being a unified cache, but in reality the last level
> > > is a split D/I cache. I believe the latter scenario is very
> > > unlikely since typically only L1 is a split D/I cache. =20
> >=20
> > I think it is a safe assumption there is not a split cache below a=20
> > unified cache. The DT binding doesn't support that either as=20
> > 'next-level-cache' is a single phandle (though I guess it could be=20
> > extended to allow multiple phandles). =20
>=20
> If I'm reading the code correctly, even though 'next-level-cache' is a
> single phandle, the node it points to can still have 'i-cache-size'
> and 'd-cache-size' properties, which would make it a split cache - at
> least as far as of_count_cache_leaves() is concerned.
>=20
> But I'm more worried about the scenario where the DT defines only L1
> and defines it as a unified cache but CLIDR_EL1 reports it's a split
> cache. In that case, populate_cache_leaves() would still write past
> the array bounds, even with my proposed changes.
>=20
> I'm starting to think it's much safer to just check the size correctly
> instead of relying on assumptions about what cache layout is
> (un)likely.
>=20
> > > The other thing that doesn't look right is that
> > > init_of_cache_level() bumps the level at each iteration to
> > > whatever the node corresponding to that level has in the
> > > `cache-level` property, but that way one or more levels can be
> > > skipped without accounting any leaves for them. This is exactly
> > > what happens in my case (the Renesas R-Car S4 board, described in
> > > arch/arm64/boot/dts/renesas/r8a779f0.dtsi). In this case, even if
> > > populate_cache_leaves() is fixed, the cache information in the
> > > kernel will be incomplete. Shouldn't init_of_cache_level() return
> > > -EINVAL also when a level is skipped altogether?
> > >=20
> > > Last, and also related to the previous question, is a device tree
> > > definition that skips a cache level correct? Or, in other words,
> > > should the definition in r8a779f0.dtsi be fixed? =20
> >=20
> > The answer depends on whether there's L2 caches in in the cores=20
> > or not. They are optional in the A55. Calling the L3 level 2 when=20
> > there's no L2 would be confusing. So if there's not an L2, I think=20
> > the description is correct (though perhaps missing L1 cache sizes
> > if that's not otherwise discoverable). If there are L2 caches, then
> > there should be a cache node under each cpu node.
> >=20
> > It could get even messier with heterogeneous systems where some
> > cores have an L2 and some don't.
> >=20
> > So the cacheinfo code needs to deal skipped levels. =20
>=20
> I just checked the technical documentation (I should have done that in
> the first place), and it's consistent with the DT. There is no L2 on
> that system, and this reconfirms what you just said.
>=20
> But this is where it gets interesting. CLIDR_EL1 is 0x82000023, so it
> reports L1 and L2. That means the information populate_cache_leaves()
> puts into the kernel data structures is not only inconsistent with the
> DT but also incorrect.
>=20
> Is CLIDR_EL1 supposed to "skip" missing levels i.e. report L2 instead
> of L3 if L2 doesn't exist?
>=20
> Thanks,
> Radu
>=20
>=20

Hi Radu,

I believe this discussion is heading in the right direction, especially
when examining the code. Currently, data is sometimes retrieved from
the device tree and other times from the system=E2=80=99s registers. While
there are cross-checks in place, it can still be confusing and
error-prone.

One scenario that comes to mind involves QEMU, where not all system
registers=E2=80=94particularly those related to the cache CLIDR_EL1=E2=80=
=94are
implemented in TCG =E2=80=9CCORRECTLY=E2=80=9D. Additionally, at this point=
, QEMU does
not generate any cache descriptions in the device tree, which is
something I am actively working on [1]. This patch-set will likely
require the kernel to handle various cases and address these
inconsistencies effectively.

I also found it challenging to understand how the number of leaves is
calculated and utilized in the code. While I wasn=E2=80=99t specifically
looking for bugs, my focus was on identifying the best approach to
share caches between SMTs. There are some existing discussions and
trials already [2,3]. But in the new one that I will share soon, I allow
adding another layer l1-cache referenced by next-level-cache at each
CPU node. This also will reduce the complexity when counting leaves
instead of just looking for different properties in the CPU node. This
might allow for easier testing and experimentation of more complex
scenarios. It also would be good to know what are the thoughts on this
one too.

1) https://mail.gnu.org/archive/html/qemu-arm/2025-01/msg00014.html
2) https://lore.kernel.org/linux-devicetree/CAL_JsqLGEvGBQ0W_B6+5cME1UEhuKX=
adBB-6=3DGoN1tmavw9K_w@mail.gmail.com/
3) https://lore.kernel.org/linux-arm-kernel/20250113115849.00006fee@huawei.=
com/T/#m1fc077e393ca2a785e67d818a67c20e1032ca31e



