Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61671E909AF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 14:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fTZKyBXhecWYkSVZASYPq/Jp9aqiNsqKvaKKrRMFrgI=; b=Snrq18L+/xG8cWThciXy0avt1I
	yifB/paFtSREZYRm+f8rqa3A0EvSCIzz/0Q9ulvpM+GMDyObmGE96rTlFXeZK88LxLmjzSar4sptu
	BJVkqbClfM4fTGaozqUxkRwh9d/6P7rd+NRgPgA7PY1fWb+qTtXWomxe1QjVzXfj/cTnq2Cwb3W0K
	qFrXoh7E7CrnEsGXuaMJto33oLlZVPnMpicWT24E0/4SPBlSNN411L9Oqga+5Dezw3N2Fqo4KnDa7
	NYBu2/zEX0m73BTLeEOg2eG4/i3V7urCAAPCuvC46GYyMnMZKfQmRACgSCLfu5B5HjrL5lN+j+lSf
	WQvEv5Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsM1r-00000008QnH-00FA;
	Tue, 17 Feb 2026 14:26:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsM1o-00000008QmF-2L9Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 14:26:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C66A040140;
	Tue, 17 Feb 2026 14:26:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49FC7C4CEF7;
	Tue, 17 Feb 2026 14:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771338375;
	bh=VehWWkmgu07iCydxagS32dNxJbtfdPA16Ye7cVaDBKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uw4lkXZdkllu/Jx7rdQ4TjmCxsefwBeoysvMRmAN/sKwTZ/l8GtrvPZWe4Ct+u0Sk
	 6JG2UtED1mEXuRRw/VmTNIYOLqHQK75G9CiwpTIVsuoR6lHgwTq4WMQeDGdpPXfU9e
	 r9LA+9AWRQPjr5nruVXggcz5msiMTQI5kK63BQI0=
Date: Tue, 17 Feb 2026 15:26:12 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: stable@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jack Aboutboul <jaboutboul@microsoft.com>,
	Sharath George John <sgeorgejohn@microsoft.com>,
	Noah Meyerhans <nmeyerhans@microsoft.com>,
	Jim Perrin <Jim.Perrin@microsoft.com>
Subject: Re: [PATCH 6.6 0/3] arm64: Speed up boot with faster linear map
 creation
Message-ID: <2026021758-subsidy-tinfoil-ee2c@gregkh>
References: <20260217133411.2881311-1-ryan.roberts@arm.com>
 <2026021700-chafe-jurist-cb24@gregkh>
 <17c9efaf-6c33-4485-bde2-345cc15ac000@arm.com>
 <2026021718-citrus-parakeet-dc60@gregkh>
 <7f30a8e4-49c3-421d-be05-08afb544aa41@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f30a8e4-49c3-421d-be05-08afb544aa41@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_062616_635465_16731C73 
X-CRM114-Status: GOOD (  25.75  )
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

On Tue, Feb 17, 2026 at 02:21:30PM +0000, Ryan Roberts wrote:
> On 17/02/2026 14:10, Greg KH wrote:
> > On Tue, Feb 17, 2026 at 01:58:36PM +0000, Ryan Roberts wrote:
> >> On 17/02/2026 13:50, Greg KH wrote:
> >>> On Tue, Feb 17, 2026 at 01:34:05PM +0000, Ryan Roberts wrote:
> >>>> Hi All,
> >>>>
> >>>> This series is a backport that applies to stable kernel 6.6 (base v6.6.126), for
> >>>> some speed ups to enable significantly faster booting on systems with a lot of
> >>>> memory. The patches were originally posted at:
> >>>>
> >>>>   https://lore.kernel.org/linux-arm-kernel/20240412131908.433043-1-ryan.roberts@arm.com/
> >>>>
> >>>> ... and were originally merged upstream in v6.10-rc1.
> >>>>
> >>>> I'm requesting this be merged to stable on behalf of a partner who wants to get
> >>>> the benefit of this series in Debian 12.
> >>>
> >>> Why can't they just use a newer kernel version (i.e. 6.12)?  Surely they
> >>> would be able to justify moving to a newer kernel for performance
> >>> reasons, why enable them to stay on an older one, just delaying the
> >>> inevitable upgrade they will have to do anyway in a year or so?
> >>
> >> I can't answer this presicely, but I did ask and push for that approach. As I
> >> understand it, they are stuck with Debian 12, which is stuck with kernel 6.1.
> >> The Debian maintainer apparently requested that these go through stable in order
> >> to get them into Debian 12.
> > 
> > I understand the position of Debian not wanting to take patches for new
> > features that are not already upstream, but really, Debian offers a
> > newer kernel for hardware that wants to use it for things like this,
> > right?  Why not just use that instead?
> 
> Let me go push a bit harder. But I expect we are in the grey zone between bug
> and feature here; this is a performance bug fix, not a new feature. By
> selectively backporting I'm guessing they are avoiding the risk of new features
> that a new kernel brings introducing new bugs? I'm guessing there is a higher
> qualification bar for that.

That's a broken "qualification system" if that is the case, given that
the patches that flow back into stable kernel releases should be
triggering "full qualification" if anyone actually paid attention to
what goes into there :)

Anyway, good luck!  And same for 6.1.y, if they are ok with 6.6.y, why
would they even care about 6.1.y?

thanks,

greg k-h

