Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13CACA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 13:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nvaGfG5po310924tWdFlbGKV3vnFi2Daw5X+Y5l+SdE=; b=kw0ZJJXCweVFy01IvToAcE6Phm
	ChmL6FS7n+/izVGHv1nt/Jo7l/hTbdsP2bGUDQRhzTJxP9IlcoS10G08HvI18XD+0/kQR3kra22+c
	DnM4TeBy0zpMYzQiTmZ94DoUAD8yc0C7eD9eCaCN89cDCmRHokwDwRiL5u7a3Y75h/O2nTU0BhRGf
	eAeilkx0MK87MGxhey3FMSDH7bDxolKt6SFFQgnBzZfAzJ5Wu2Se85Jr+W/0gW5PTw+Z5TTx5RicY
	olxSpPKq4iS54GqFhbPZCA3pMQ0wczR4kF/k/LWGuDgB1mAiZBUZI/wn++00YnNv2gjfu8GPmjANB
	XolTg8jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuNd-000000068Fs-496h;
	Wed, 30 Sep 2026 13:29:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuNc-000000068F7-0iA1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 13:29:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F06B43A5C;
	Wed, 30 Sep 2026 13:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A35061F000FF;
	Wed, 30 Sep 2026 13:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790774991;
	bh=nvaGfG5po310924tWdFlbGKV3vnFi2Daw5X+Y5l+SdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BImizp0pcOo86qSBUaEKZtafbOxXv4ougbDwjERwnQ6CKlE/QwoMHh4eItftccdfP
	 pHXj+IRllK8sWCWTmM9Hsrx7ZWITsOBfDCvBe0ArJGVR+8/VdYoYxXVljSS4v6HfTp
	 RqU6zJwI7EJhiPZZD3qDdlbUqkuAIDVR67kNnkhceDYvdRSnVY5rbuLsfNm3j1BloA
	 nc+WvnMpPlu+d3R00bvlMKqcQ5QkVFXY54hHWF8COxldFwQBj3HbVlLFeWhQiKGY/e
	 2qi1HHOt7mxYT111BgykY6aHThWeIk9VfCUwfnLYgzE/ebSuWoteMpuMXK4Eh9Yt2b
	 zJT3n4h1v/TMw==
Date: Wed, 30 Sep 2026 14:29:46 +0100
From: Will Deacon <will@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Billy Laws <blaws05@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Ryan Houdek <sonicadvance1@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com
Subject: Re: [RFC PATCH v3 1/1] arch: arm64: Implement unaligned atomic
 emulation
Message-ID: <ar0OyoPqGfmrkdH5@willie-the-truck>
References: <20260930020138.2377090-1-andrealmeid@igalia.com>
 <20260930020138.2377090-2-andrealmeid@igalia.com>
 <ary-2rOs_b2IY6M1@willie-the-truck>
 <00227dc1-e01c-4de8-b3e3-3cd8de74cba9@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00227dc1-e01c-4de8-b3e3-3cd8de74cba9@igalia.com>
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

On Wed, Sep 30, 2026 at 07:29:22AM -0300, André Almeida wrote:
> Em 30/09/2026 04:48, Will Deacon escreveu:
> > On Tue, Sep 29, 2026 at 11:01:38PM -0300, André Almeida wrote:
> > > Implement support for emulating unaligned atomic operations on arm64.
> > > User applications that wish to enable support for this should use the
> > > pctrl() flag `PR_ARM64_UNALIGN_ATOMIC_EMULATE`.
> > > 
> > > Signed-off-by: André Almeida <andrealmeid@igalia.com>
> > > ---
> > >   arch/arm64/Kconfig                   |   6 +
> > >   arch/arm64/include/asm/exception.h   |   1 +
> > >   arch/arm64/include/asm/processor.h   |   5 +
> > >   arch/arm64/include/asm/rwonce.h      |  14 +-
> > >   arch/arm64/include/asm/thread_info.h |   1 +
> > >   arch/arm64/kernel/Makefile           |   3 +-
> > >   arch/arm64/kernel/process.c          |  15 +
> > >   arch/arm64/kernel/unaligned_atomic.c | 521 +++++++++++++++++++++++++++
> > >   arch/arm64/mm/fault.c                |  10 +
> > >   include/uapi/linux/prctl.h           |   5 +
> > >   kernel/sys.c                         |   7 +-
> > >   11 files changed, 579 insertions(+), 9 deletions(-)
> > >   create mode 100644 arch/arm64/kernel/unaligned_atomic.c
> > 
> > No.
> > 
> > I already explained to you why this doesn't work:
> > 
> > https://lore.kernel.org/r/aV1YnOetDHhKe4hz@willie-the-truck
> 
> Indeed, last time you raised some points, and then Ryan replied them. Is
> there any specific point that doesn't work? I couldn't find a reply for
> Ryan's answers:
> 
> https://lore.kernel.org/all/CABnRqDf5EQUoXu=pJ6mj4-JfwAzEfcAE2cYrNzJANFycx7cMUA@mail.gmail.com/

So rather than get involved in the discussion, you did nothing for almost
a year and then resent the exact same patch? Why?

I don't think the implementation is correct and I don't think we should
be emulating this either. I hope I made that clear last year. Ryan
thinks it's "fine" due to the locking, but I don't see how that helps
with the example I gave.

You are apparently the author of this code, so you need to get involved
in the discussion if you want to move the needle.

Will

