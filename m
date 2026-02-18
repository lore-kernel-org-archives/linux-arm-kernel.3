Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27484E9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 19:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yCczxXvs8QVrwjiAXfOUtxxkudkas2eVt5KXtsgLhPw=; b=vwIpIddPx/ZqfQRx/VE8D7w6uq
	1mB59dP/JbKni7CO31B+VufoN4Dzrcjnw5Na6WYdVlvneXBLGv7j44B2xRyt1UORjzF6kB5a5tdk0
	43oPDvA8lM+GpSfsll95DEOT5rLdXCzamtatQZZSwdUVqIdwLRcbYHTQsnvedSON3McZmx2mJPLpJ
	0G3qA+QeCVZ7Wt8CcVhh5zwkzvQ29QsPPHOnD3mnj9HnkAjTuLYf5ahLz4kmQmyxoWzv5KXvmsuG+
	xUV5E8X+jiw3Yg14qDonRI4dJuSW6trGf0zCF6PPRyZXEkifP60jzFohkgwdkjZny7uJgy9fArCe4
	OcgJh1RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsnY0-0000000AKcB-1OGE;
	Wed, 18 Feb 2026 19:49:20 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsnXx-0000000AKbo-3gaG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 19:49:19 +0000
Received: by linux.microsoft.com (Postfix, from userid 1224)
	id 8ACE220B6F00; Wed, 18 Feb 2026 11:49:16 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8ACE220B6F00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1771444156;
	bh=yCczxXvs8QVrwjiAXfOUtxxkudkas2eVt5KXtsgLhPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lLY65xXznW8Ri//2YhbS/0767eIWD4MA9PzgkubCtYa59cPkg3KIl1OFgLLgge4Qs
	 JWqyvdYedAZDBSaeJlvpozsz6zkzkwPsup/iqW9+Dhz8lt97pZyBbJH/w+7KLJPanV
	 a12bOr4TWqiGvPJ8ZGAvq0i/Pf1jX8aL5EJFo2m0=
Date: Wed, 18 Feb 2026 11:49:16 -0800
From: Noah Meyerhans <nmeyerhans@linux.microsoft.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jack Aboutboul <jaboutboul@microsoft.com>,
	Sharath George John <sgeorgejohn@microsoft.com>,
	Noah Meyerhans <nmeyerhans@microsoft.com>,
	Jim Perrin <Jim.Perrin@microsoft.com>
Subject: Re: [PATCH 6.6 0/3] arm64: Speed up boot with faster linear map
 creation
Message-ID: <aZYXvMvGZfk0muht@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20260217133411.2881311-1-ryan.roberts@arm.com>
 <2026021700-chafe-jurist-cb24@gregkh>
 <17c9efaf-6c33-4485-bde2-345cc15ac000@arm.com>
 <2026021718-citrus-parakeet-dc60@gregkh>
 <7f30a8e4-49c3-421d-be05-08afb544aa41@arm.com>
 <CAGb2v67_UQ9rAFPQ5mqTFdNdPxyAJj0WZ6PwOLbHxU_0XQM6CA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v67_UQ9rAFPQ5mqTFdNdPxyAJj0WZ6PwOLbHxU_0XQM6CA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_114917_950944_5F543879 
X-CRM114-Status: GOOD (  29.94  )
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

On Tue, Feb 17, 2026 at 10:27:53PM +0800, Chen-Yu Tsai wrote:
> 
> On Tue, Feb 17, 2026 at 10:21 PM Ryan Roberts <ryan.roberts@arm.com> wrote:
> >
> > On 17/02/2026 14:10, Greg KH wrote:
> > > On Tue, Feb 17, 2026 at 01:58:36PM +0000, Ryan Roberts wrote:
> > >> On 17/02/2026 13:50, Greg KH wrote:
> > >>> On Tue, Feb 17, 2026 at 01:34:05PM +0000, Ryan Roberts wrote:
> > >>>> Hi All,
> > >>>>
> > >>>> This series is a backport that applies to stable kernel 6.6 (base v6.6.126), for
> > >>>> some speed ups to enable significantly faster booting on systems with a lot of
> > >>>> memory. The patches were originally posted at:
> > >>>>
> > >>>>   https://lore.kernel.org/linux-arm-kernel/20240412131908.433043-1-ryan.roberts@arm.com/
> > >>>>
> > >>>> ... and were originally merged upstream in v6.10-rc1.
> > >>>>
> > >>>> I'm requesting this be merged to stable on behalf of a partner who wants to get
> > >>>> the benefit of this series in Debian 12.
> > >>>
> > >>> Why can't they just use a newer kernel version (i.e. 6.12)?  Surely they
> > >>> would be able to justify moving to a newer kernel for performance
> > >>> reasons, why enable them to stay on an older one, just delaying the
> > >>> inevitable upgrade they will have to do anyway in a year or so?
> > >>
> > >> I can't answer this presicely, but I did ask and push for that approach. As I
> > >> understand it, they are stuck with Debian 12, which is stuck with kernel 6.1.
> > >> The Debian maintainer apparently requested that these go through stable in order
> > >> to get them into Debian 12.
> > >
> > > I understand the position of Debian not wanting to take patches for new
> > > features that are not already upstream, but really, Debian offers a
> > > newer kernel for hardware that wants to use it for things like this,
> > > right?  Why not just use that instead?
> >
> > Let me go push a bit harder. But I expect we are in the grey zone between bug
> > and feature here; this is a performance bug fix, not a new feature. By
> > selectively backporting I'm guessing they are avoiding the risk of new features
> > that a new kernel brings introducing new bugs? I'm guessing there is a higher
> > qualification bar for that.
> 
> Why can't they use the kernel from bookworm-backports, which is 6.12?

Bookworm-backports will likely be our recommendation should this
patchset ultimately be rejected.  Debian 12 uses 6.1.y by default.
While 6.12.y is available for that release via the bookworm-backports
repository, bookworm-backports content is not generally recommended for
production usage. It's not necessarily updated on the same cadence as
the 6.1.y packages, and Debian does not publish security advisories for
it.

Debian does not want to maintain this change as a downstream patch, 
which is fair.  Microsoft would like to make this boot optimization
available by default to Debian 12 users (of which there are still many)
which is why we're pursuing this path.  Naturally, we'll manage if we
can't get the change applied to 6.1.y, but hopefully this explains where
we're coming from.

noah


