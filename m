Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1C8C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 15:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=diW/n+zGxvGDpxVk/ZgSzyZog+KkJSnqzTSDKmaxmiI=; b=3LGF6toOn7+FP1BFnq9+SUtXgq
	s6LC1M8bGwiguLtivyixU1yhTf32/LImuk3Ds34WbiFOXjPOiuGa4a0mQb7/xu9g/DU3/DPsRQkGY
	6H62hN7BXUblA6WaLtcnEIb/FU+KW5p6SEX4KljNreZ6jxtTGgDH27cT1iQ6Oxh/ZaI6hjF+QG52w
	Uj4oOGg7zkLVJLehMg1td8NMr+XCVLwbAXab89CugfFSS31kBGdjkPR9Hb8Amn7WthDClel3bnQ0i
	9xcl98qYG5NnOk+mVqJ4xZr5R+KJlPgwPGpvBn7gc/QuJmlmELAabdKfGTmZol1m22upElGbm6ts7
	8ll2WHLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tacov-0000000Aad7-3GHw;
	Wed, 22 Jan 2025 15:39:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tacnb-0000000AaQk-1ePP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 15:37:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737560266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=diW/n+zGxvGDpxVk/ZgSzyZog+KkJSnqzTSDKmaxmiI=;
	b=HO5x8ix36vbKAfRSpgO2qRkkmD/XaF6YUkJ7N0svg4lKN2rTdzo+bLAyWt6WKYBrlsXEjN
	8f35xZZHMaDskfej4zCJErC3edO1fP1YEDup45A67BFbxiz5WdONNVglhj56nEy4KEP6Hj
	XbGLOrZeg6tiMPVIcEN3sHAVOl7fVpg=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-40YN10ohMLKzsQ2bODp2qw-1; Wed, 22 Jan 2025 10:37:45 -0500
X-MC-Unique: 40YN10ohMLKzsQ2bODp2qw-1
X-Mimecast-MFC-AGG-ID: 40YN10ohMLKzsQ2bODp2qw
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b6e178d4f8so1136926485a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 07:37:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737560265; x=1738165065;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=std1s7CP6I3Z5JSHHIA8jhMp80dXMvBDivAes1x2g7k=;
        b=HLtaVLBY9ECbXdOHrbqK6NL3F2FP4aAL2yXzb2DyiJNnf++ijO/Q60RC5hfgEae+nf
         8C3/zhGX2aaDSy8fHdKl6dMIO0kKf/gEOHj/atdijYr5HdGeWdAeZGZpAUMmTHR5AFNj
         IkJdOGXZnmcnoIQZB20mgExtnnFC/jd4+ukIuottt0hGkSofN7XeO7ACPJAp2/ml6kkd
         fBSJ2mU8HIhsFnAy6jCjati+HtcwfIjc4UqayRgEiLa6yhtSdouBTCIspcHNFdTfR+jj
         t2dqeMCnB709NJKXVj9QZOZkiFu6XJisf0wfErs6X+jzprPvjcNwXAWIwTTRRHgvmU80
         lARw==
X-Gm-Message-State: AOJu0YyyOO4nKY1jyAoik7lk376k6G33ZCO9+esazUwOtesIx3a122Q/
	HenY1KhSOGPsduESB7qvtqjTho3aHKwH2yg/RBDJZ5REpS+T/fu0EstCWLTcRJF45S3P3gX9HP1
	v0E9KmKv6gDd3mcR8m5/8G2auCtFsbzD3mJXb4ZF/oc/bcn2rvnhFe6AxjaidJhZdX2PsPIjW
X-Gm-Gg: ASbGncvVwDEnopY+Z8VPNRQQ+H1w1Mj/6LjjPpr2e8QNsDHQVWuK03WDZdzvdpJikLT
	lZkQnvFi5n076hcbSnPZV13Ig2deztIa8EQ4ruF0i82dShN29h1kBdle2cendJRJXPiYVBVOqg7
	oU4Hu1uJNqrDoCCp2ZGe8zq+4H7o3u8+86KorOPHkdYMvVFThrHFqe5+Y62mKW9FnVWo0RSFIZS
	cXUDePHPOdMDsLG3KvbadpG1w0y7bU7WXGLtoPrpkzhHEcXsuV8MMXVFTmlVoCL/jsngY5uNUg2
	/CBFb+ZIyO+lCx7aD42mDnqMcoO3Rk5Wl7OVY1z3bn8zVoaGroiMOYaL+DWwXg==
X-Received: by 2002:a05:620a:4513:b0:7b6:eab3:cdd4 with SMTP id af79cd13be357-7be63289389mr3531694185a.50.1737560264796;
        Wed, 22 Jan 2025 07:37:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmtXGzwOd+JEJohcwOEZl6iNc7MwyBtM4fNimm2zpwuhxPeTUgjOZ+2IHAmX60p/BTvf8yzA==
X-Received: by 2002:a05:620a:4513:b0:7b6:eab3:cdd4 with SMTP id af79cd13be357-7be63289389mr3531690285a.50.1737560264373;
        Wed, 22 Jan 2025 07:37:44 -0800 (PST)
Received: from thinkpad-p1.localdomain (pool-174-112-193-187.cpe.net.cable.rogers.com. [174.112.193.187])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be614d98e6sm673528885a.84.2025.01.22.07.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 07:37:43 -0800 (PST)
Message-ID: <f2524ce4b52ba70ba7e1e17f194f1ae9137751c6.camel@redhat.com>
Subject: Re: [RFC PATCH 0/1] arm64: cacheinfo: Avoid out-of-bounds write
 when DT info is incorrect
From: Radu Rendec <rrendec@redhat.com>
To: Alireza Sanaee <alireza.sanaee@huawei.com>, robh@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Sudeep Holla
 <sudeep.holla@arm.com>,  Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Borislav Petkov <bp@alien8.de>, 
 jonathan.cameron@huawei.com
Date: Wed, 22 Jan 2025 10:37:42 -0500
In-Reply-To: <20250121092020.0000044d@huawei.com>
References: <20250116185458.3272683-1-rrendec@redhat.com>
	 <20250117130811.GA445389-robh@kernel.org>
	 <e2a49840672c89f87916611cb5973600e4e014a6.camel@redhat.com>
	 <20250121092020.0000044d@huawei.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Mrj8oJHSNT8e7o3lSCirxEjco1AKkuhkdFGt6ZuDK1w_1737560265
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_073747_510220_A99BB87B 
X-CRM114-Status: GOOD (  71.06  )
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

Hi Alireza,

On Tue, 2025-01-21 at 09:20 +0000, Alireza Sanaee wrote:
> On Fri, 17 Jan 2025 11:59:36 -0500
> Radu Rendec <rrendec@redhat.com> wrote:
>=20
> > On Fri, 2025-01-17 at 07:08 -0600, Rob Herring wrote:
> > > On Thu, Jan 16, 2025 at 01:54:57PM -0500, Radu Rendec wrote:=C2=A0=20
> > > > I found an out-of-bounds write bug in the arm64 implementation of
> > > > populate_cache_leaves() and I'm trying to fix it. The reason why
> > > > this is an RFC is that I'm not entirely sure these changes are
> > > > sufficient.
> > > >=20
> > > > The problem is described in detail in the patch itself, so I won't
> > > > repeat it here. The gist of it is that on arm64 boards where the
> > > > device tree describes the cache structure, the number of cache
> > > > leaves that comes out of fetch_cache_info() and is used to size
> > > > the cacheinfo array can be smaller than the actual number of
> > > > leaves. In that case, populate_cache_leaves() writes past the
> > > > cacheinfo array bounds.
> > > >=20
> > > > The way I fixed it, the code doesn't change too much and doesn't
> > > > look ugly but it's still possible to write past the array bounds
> > > > if the last populated level is a separate data/instruction cache.
> > > > But I'm not sure if this is a real-world scenario, so this is one
> > > > of the areas where I'm looking for feedback. For example, the DT
> > > > may define a single unified level (so levels=3D1, leaves=3D1) but i=
n
> > > > fact L1 is a split D/I cache. Or the DT defines multiple levels,
> > > > the last one being a unified cache, but in reality the last level
> > > > is a split D/I cache. I believe the latter scenario is very
> > > > unlikely since typically only L1 is a split D/I cache.=C2=A0=20
> > >=20
> > > I think it is a safe assumption there is not a split cache below a=20
> > > unified cache. The DT binding doesn't support that either as=20
> > > 'next-level-cache' is a single phandle (though I guess it could be=20
> > > extended to allow multiple phandles).=C2=A0=20
> >=20
> > If I'm reading the code correctly, even though 'next-level-cache' is a
> > single phandle, the node it points to can still have 'i-cache-size'
> > and 'd-cache-size' properties, which would make it a split cache - at
> > least as far as of_count_cache_leaves() is concerned.
> >=20
> > But I'm more worried about the scenario where the DT defines only L1
> > and defines it as a unified cache but CLIDR_EL1 reports it's a split
> > cache. In that case, populate_cache_leaves() would still write past
> > the array bounds, even with my proposed changes.
> >=20
> > I'm starting to think it's much safer to just check the size correctly
> > instead of relying on assumptions about what cache layout is
> > (un)likely.
> >=20
> > > > The other thing that doesn't look right is that
> > > > init_of_cache_level() bumps the level at each iteration to
> > > > whatever the node corresponding to that level has in the
> > > > `cache-level` property, but that way one or more levels can be
> > > > skipped without accounting any leaves for them. This is exactly
> > > > what happens in my case (the Renesas R-Car S4 board, described in
> > > > arch/arm64/boot/dts/renesas/r8a779f0.dtsi). In this case, even if
> > > > populate_cache_leaves() is fixed, the cache information in the
> > > > kernel will be incomplete. Shouldn't init_of_cache_level() return
> > > > -EINVAL also when a level is skipped altogether?
> > > >=20
> > > > Last, and also related to the previous question, is a device tree
> > > > definition that skips a cache level correct? Or, in other words,
> > > > should the definition in r8a779f0.dtsi be fixed?=C2=A0=20
> > >=20
> > > The answer depends on whether there's L2 caches in in the cores=20
> > > or not. They are optional in the A55. Calling the L3 level 2 when
> > > there's no L2 would be confusing. So if there's not an L2, I think=20
> > > the description is correct (though perhaps missing L1 cache sizes
> > > if that's not otherwise discoverable). If there are L2 caches, then
> > > there should be a cache node under each cpu node.
> > >=20
> > > It could get even messier with heterogeneous systems where some
> > > cores have an L2 and some don't.
> > >=20
> > > So the cacheinfo code needs to deal skipped levels.=C2=A0=20
> >=20
> > I just checked the technical documentation (I should have done that in
> > the first place), and it's consistent with the DT. There is no L2 on
> > that system, and this reconfirms what you just said.
> >=20
> > But this is where it gets interesting. CLIDR_EL1 is 0x82000023, so it
> > reports L1 and L2. That means the information populate_cache_leaves()
> > puts into the kernel data structures is not only inconsistent with the
> > DT but also incorrect.
> >=20
> > Is CLIDR_EL1 supposed to "skip" missing levels i.e. report L2 instead
> > of L3 if L2 doesn't exist?
> >=20
> > Thanks,
> > Radu
> >=20
> >=20
>=20
> Hi Radu,
>=20
> I believe this discussion is heading in the right direction, especially
> when examining the code. Currently, data is sometimes retrieved from
> the device tree and other times from the system=E2=80=99s registers. Whil=
e
> there are cross-checks in place, it can still be confusing and
> error-prone.

Agreed. And the more I look at it, the more I think that information
should not be pulled from different sources because they *can* be
inconsistent.

For arm64 specifically, the information that's extracted from CLIDR_EL1
does not seem to include more details than what the device tree can
provide. Essentially it's just the level and type of cache (instruction,
data, or unified). The same information can be extracted from the device
tree, and looking at init_of_cache_level() it already is but it's used
just to count the levels/leaves.

For that reason, I would argue that for arm64, if the device tree (or
ACPI) provides information about the cache, it should be used as a
single source of truth, and CLIDR_EL1 should not be used. Even if the
device tree (or ACPI) description is incomplete, we still can't extract
information about more levels/leaves from CLIDR_EL1 because the number
of leaves is pre-determined from DT/ACPI and populate_cache_leaves()
will stop at that number of leaves. Or at least it should (that's the
bug I'm trying to fix).

> One scenario that comes to mind involves QEMU, where not all system
> registers=E2=80=94particularly those related to the cache CLIDR_EL1=E2=80=
=94are
> implemented in TCG =E2=80=9CCORRECTLY=E2=80=9D. Additionally, at this poi=
nt, QEMU does
> not generate any cache descriptions in the device tree, which is
> something I am actively working on [1]. This patch-set will likely
> require the kernel to handle various cases and address these
> inconsistencies effectively.
>=20
> I also found it challenging to understand how the number of leaves is
> calculated and utilized in the code. While I wasn=E2=80=99t specifically
> looking for bugs, my focus was on identifying the best approach to
> share caches between SMTs. There are some existing discussions and
> trials already [2,3]. But in the new one that I will share soon, I allow
> adding another layer l1-cache referenced by next-level-cache at each
> CPU node. This also will reduce the complexity when counting leaves
> instead of just looking for different properties in the CPU node. This
> might allow for easier testing and experimentation of more complex
> scenarios. It also would be good to know what are the thoughts on this
> one too.

I looked at the links you provided and I can understand what you're
trying to do there. I believe this is an orthogonal problem though
because struct cpu_cacheinfo is a per-cpu data structure.

In the discussions you had, it was pointed out that physical CPU
threads need to be modeled as distinct CPU nodes in the kernel, which
means they will also have distinct cpu_cacheinfo structures. Even if
the cache is physically shared, you will still have a separate struct
cpu_cacheinfo for each of them in the kernel, regardless of where the
information extracted from.

> 1) https://mail.gnu.org/archive/html/qemu-arm/2025-01/msg00014.html
> 2) https://lore.kernel.org/linux-devicetree/CAL_JsqLGEvGBQ0W_B6+5cME1UEhu=
KXadBB-6=3DGoN1tmavw9K_w@mail.gmail.com/
> 3) https://lore.kernel.org/linux-arm-kernel/20250113115849.00006fee@huawe=
i.com/T/#m1fc077e393ca2a785e67d818a67c20e1032ca31e

--=20
Best regards,
Radu


