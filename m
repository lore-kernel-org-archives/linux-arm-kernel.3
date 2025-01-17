Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79577C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 17:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2XC8zcL/+7C/w5xFnSmVapIblxmOh2TKAaamq4LipJ0=; b=1wYK6Se77+Rn+8uZiUI/bzItk9
	0s+sE9REcvJ851PmCwP5GRpessfW02cSJXWnQFFoZzuWSaJP6PiFGFNSwi4fOMmyBUzGxbqf32Bo9
	hI1DBU9g6fvtwoUpkaxPq6ymGZw3uvg6OeH7QfeQh0q7WULwJISuDERgmcFZyHRVKObiKeGUcMEh5
	DvtVNn2e9gysT1mIsQjSwolj14+Eh6GXDW18lUa61xJkXhXGRtHG8kiI8SeKVn7RriGSET01BczEm
	Z4a/euGKwkIa3Ny1souqdSSXnyhp1acwgtIyC0HWHh/Bk9S832NCHrVzmzCfCrYia3QfopOSCwTs3
	3uJyXhpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYprc-00000000ugz-0vFk;
	Fri, 17 Jan 2025 17:10:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYph7-00000000snz-2J6g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 16:59:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737133180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2XC8zcL/+7C/w5xFnSmVapIblxmOh2TKAaamq4LipJ0=;
	b=cF3A/D1lYwS9LvL47HffEQAoN1dWrQjK+OHRqWIZ6/S0uz66qZdGr+5+6ry1OYdPTGKaOR
	F/PcQsnKjkWf8ynE0IwMMOSgSdr110xL7gWL12aj65ybE+zNwsIHo081prvUOFFV4FtPTs
	ZiKadFqeAy6bwtZPBYyFe70kFGFhz20=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-hL3uw7TvOpmMO9WGR_y8VA-1; Fri, 17 Jan 2025 11:59:39 -0500
X-MC-Unique: hL3uw7TvOpmMO9WGR_y8VA-1
X-Mimecast-MFC-AGG-ID: hL3uw7TvOpmMO9WGR_y8VA
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b6eeef7cb8so366291585a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jan 2025 08:59:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737133179; x=1737737979;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=btZPx3PxIabefFJalK8Hn+Kp682QbE4FvOnykKdCU0A=;
        b=fV9JhEyDQgWDbGQNQUNDgoBKvGBxMWPbFWxcB4mJ4T8EdC/0N2dvwmU3toVXmZBTyv
         Q6w2FtGY6tCfhAh3Qu6e+s+6VNJ9tndQSwy2tGfhb5E/KloNuXuy2n0QB19WslrjfVT1
         wlIa976uuiowokAr4PZwNAy9ML9Glfvmp9n4guwTfFvQbg8tlIqLrY/+4HJv4EWJU8FH
         RYXQLBuSF+i++o1lISWgyruN+CkyDw1B6wYF6/+LN7Hvrpe3zDjjVeTTJT5+vTcQaf+N
         NpQs5b6JFqXmlNAIEhac6iMIuLbEnDGG9nYXXu10OJAJlhRn9uqVQxg4INDOcZg5vOLs
         JxKg==
X-Gm-Message-State: AOJu0YxuYUbbgoJR3Vf00B2K28J5ci4JmwCfgeko38z2k+1stlfLwZmb
	tWCYYn7woJ649u+hTlPwUKejIEChnrx69To/TXI9cQ52QysQzQIyebMPzSprgGRWMOdbXva8enq
	FEjDfk1wjx7zea+uCeqtE/o1tHVHEH0OqM6IBEIUXCg288Ogb2MgXOlhssb6Z8c17O52MQZ4f
X-Gm-Gg: ASbGncspC8mFxwaO+tFKhmWvs4PAP2o+gBRmJaxqesUoWjGigPofsiFxGjW52Z5cANi
	mJjuLJzAgSoV1gvTEEjUO2/9dFfVCcys0m135wn+oUipv8Gb9/+3jW6IBtsQ5OMH90SQCJvJSp5
	/9HTkaLv3fj3tgYQgf8ho6cai/DaLbgaxb5w5RZfs4kj/NELgzsDQhX23DJv8GUjrSMDI82QL8S
	K2Awg+WKM1ulyPLUFpjK8aWWB9IohZ/75x4Eb+bmNMGKBzvEZPVpuhjzAQG9Qp/btv3fBAhFi/P
	9nEzUDFFu+eoKp7Y9Sp2WqTQ2U9eIE8vyPYTYWWXzpUM/cAV
X-Received: by 2002:a05:620a:2496:b0:7bc:dc89:3703 with SMTP id af79cd13be357-7be6323b5b3mr612661385a.14.1737133178941;
        Fri, 17 Jan 2025 08:59:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIgPn/FpCgcfLQ1Kp57Q7NSHlxd5rAVRMz+S2y33gyVQ9MBEAVpNrtDJ60PozEZbURDdCvhQ==
X-Received: by 2002:a05:620a:2496:b0:7bc:dc89:3703 with SMTP id af79cd13be357-7be6323b5b3mr612657885a.14.1737133178541;
        Fri, 17 Jan 2025 08:59:38 -0800 (PST)
Received: from thinkpad-p1.localdomain (pool-174-112-193-187.cpe.net.cable.rogers.com. [174.112.193.187])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be614eee58sm130119885a.90.2025.01.17.08.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 08:59:37 -0800 (PST)
Message-ID: <e2a49840672c89f87916611cb5973600e4e014a6.camel@redhat.com>
Subject: Re: [RFC PATCH 0/1] arm64: cacheinfo: Avoid out-of-bounds write
 when DT info is incorrect
From: Radu Rendec <rrendec@redhat.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Sudeep Holla
 <sudeep.holla@arm.com>,  Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Borislav Petkov <bp@alien8.de>
Date: Fri, 17 Jan 2025 11:59:36 -0500
In-Reply-To: <20250117130811.GA445389-robh@kernel.org>
References: <20250116185458.3272683-1-rrendec@redhat.com>
	 <20250117130811.GA445389-robh@kernel.org>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1-gjFBYkhBEX232T-6ImC1PpwXwwGGgf0CkIZR2rL8k_1737133179
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_085941_661543_504D0642 
X-CRM114-Status: GOOD (  43.62  )
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

On Fri, 2025-01-17 at 07:08 -0600, Rob Herring wrote:
> On Thu, Jan 16, 2025 at 01:54:57PM -0500, Radu Rendec wrote:
> > I found an out-of-bounds write bug in the arm64 implementation of
> > populate_cache_leaves() and I'm trying to fix it. The reason why this
> > is an RFC is that I'm not entirely sure these changes are sufficient.
> >=20
> > The problem is described in detail in the patch itself, so I won't
> > repeat it here. The gist of it is that on arm64 boards where the device
> > tree describes the cache structure, the number of cache leaves that
> > comes out of fetch_cache_info() and is used to size the cacheinfo array
> > can be smaller than the actual number of leaves. In that case,
> > populate_cache_leaves() writes past the cacheinfo array bounds.
> >=20
> > The way I fixed it, the code doesn't change too much and doesn't look
> > ugly but it's still possible to write past the array bounds if the last
> > populated level is a separate data/instruction cache. But I'm not sure
> > if this is a real-world scenario, so this is one of the areas where I'm
> > looking for feedback. For example, the DT may define a single unified
> > level (so levels=3D1, leaves=3D1) but in fact L1 is a split D/I cache. =
Or
> > the DT defines multiple levels, the last one being a unified cache, but
> > in reality the last level is a split D/I cache. I believe the latter
> > scenario is very unlikely since typically only L1 is a split D/I cache.
>=20
> I think it is a safe assumption there is not a split cache below a=20
> unified cache. The DT binding doesn't support that either as=20
> 'next-level-cache' is a single phandle (though I guess it could be=20
> extended to allow multiple phandles).

If I'm reading the code correctly, even though 'next-level-cache' is a
single phandle, the node it points to can still have 'i-cache-size' and
'd-cache-size' properties, which would make it a split cache - at least
as far as of_count_cache_leaves() is concerned.

But I'm more worried about the scenario where the DT defines only L1
and defines it as a unified cache but CLIDR_EL1 reports it's a split
cache. In that case, populate_cache_leaves() would still write past the
array bounds, even with my proposed changes.

I'm starting to think it's much safer to just check the size correctly
instead of relying on assumptions about what cache layout is (un)likely.

> > The other thing that doesn't look right is that init_of_cache_level()
> > bumps the level at each iteration to whatever the node corresponding to
> > that level has in the `cache-level` property, but that way one or more
> > levels can be skipped without accounting any leaves for them. This is
> > exactly what happens in my case (the Renesas R-Car S4 board, described
> > in arch/arm64/boot/dts/renesas/r8a779f0.dtsi). In this case, even if
> > populate_cache_leaves() is fixed, the cache information in the kernel
> > will be incomplete. Shouldn't init_of_cache_level() return -EINVAL also
> > when a level is skipped altogether?
> >=20
> > Last, and also related to the previous question, is a device tree
> > definition that skips a cache level correct? Or, in other words, should
> > the definition in r8a779f0.dtsi be fixed?
>=20
> The answer depends on whether there's L2 caches in in the cores=20
> or not. They are optional in the A55. Calling the L3 level 2 when=20
> there's no L2 would be confusing. So if there's not an L2, I think=20
> the description is correct (though perhaps missing L1 cache sizes if=20
> that's not otherwise discoverable). If there are L2 caches, then there=20
> should be a cache node under each cpu node.
>=20
> It could get even messier with heterogeneous systems where some cores
> have an L2 and some don't.
>=20
> So the cacheinfo code needs to deal skipped levels.

I just checked the technical documentation (I should have done that in
the first place), and it's consistent with the DT. There is no L2 on
that system, and this reconfirms what you just said.

But this is where it gets interesting. CLIDR_EL1 is 0x82000023, so it
reports L1 and L2. That means the information populate_cache_leaves()
puts into the kernel data structures is not only inconsistent with the
DT but also incorrect.

Is CLIDR_EL1 supposed to "skip" missing levels i.e. report L2 instead
of L3 if L2 doesn't exist?

Thanks,
Radu


