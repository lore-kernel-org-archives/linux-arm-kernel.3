Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4B7C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 14:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5QavDf4YfF4g6incDfR8g3M+4C53fdbJxU8hmz4md/c=; b=pdxZnSkG5L7QMvH+Od+NJ3XFlc
	2hEn15zrBj8A27q5Nxyxc82uP033BsSJKBp9Ke72J77U8XTO3maDyTnGC60MSm5eK6XFOY+Img7uk
	0Qs8y32Pqafze+Zkv72p/LaKiQFMua0i4lBb5y35yHG2x0tRKbk9avnmkM7jJXBJlHXCHk21Snh9a
	QYfuE1EWJ+muJCL11n8UtNvR0RNb2ThvxOstAQAaOScrRmHhYgb3kODc2Dkany1imXC4TefMwu/3A
	WCLDXHqPT+Xp/F5M9Qrfl/coTTm8UBPBDM8o4vZbXY6lYKlgv03cJL1iBHnK9KpwQ6/rDP5el3Wwj
	nDJ20sBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twiYP-00000003MOh-2edy;
	Mon, 24 Mar 2025 14:13:25 +0000
Received: from out-182.mta1.migadu.com ([95.215.58.182])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twiVx-00000003M8x-45Pu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 14:10:55 +0000
Date: Mon, 24 Mar 2025 10:10:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1742825449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5QavDf4YfF4g6incDfR8g3M+4C53fdbJxU8hmz4md/c=;
	b=dgM8qoQKNJIEi0dY32L6hBabt7HjG8XUm1NhIZaImSKprfR8JXsfBfhH9cTCPrcLg9wfGD
	o23+bo8cMWxTi36khM1fvKGG4apkYQpsaXdP8sgYZRtIQ6jZU1waJ/RfnEJxDXhZnj6hMt
	l4zSCzE8vSv3ylcINppjWvFaV7fjmBwjcieTx3E9R4I0dwULWMbcw+IcB7uU72j8Pi/ESl
	15pJTFdt9S+sGypIz635REFAIlyLDRUk/TZpfAg/E3oncgVQLclL0tPPh5xQu2kDhPTHMJ
	CFfNp00ClfbxNtP9JaOZCdso+fJ06mjS+jj+Drg6EAouBFLpdKHMNTre/Gp2cA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Faith Ekstrand <faith.ekstrand@collabora.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Sergio Lopez Pascual <slp@sinrega.org>,
	Ryan Houdek <sonicadvance1@gmail.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	rust-for-linux <rust-for-linux@vger.kernel.org>,
	asahi <asahi@lists.linux.dev>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-doc <linux-doc@vger.kernel.org>,
	Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH v3] drm: Add UAPI for the Asahi driver
Message-ID: <Z-Fn4niI6_Yd06Ze@blossom>
References: <20250314-agx-uapi-v3-1-3abf7e74ea2f@rosenzweig.io>
 <195b507d4b3.b25d0dad175771.7566427576910952468@collabora.com>
 <195b582682b.121ba4d5e219032.3109114844776468245@collabora.com>
 <Z-B6uc7EEAdBPXmt@blossom>
 <260D98E1-7204-4535-A84F-D55A4527FF7E@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <260D98E1-7204-4535-A84F-D55A4527FF7E@collabora.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_071054_635735_FD389A46 
X-CRM114-Status: GOOD (  18.34  )
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

> >>>> +    /** 
> >>>> +     * @DRM_ASAHI_BIND_SINGLE_PAGE: Map a single page of the BO repeatedly 
> >>>> +     * across the VA range. 
> >>>> +     * 
> >>>> +     * This is useful to fill a VA range with scratch pages or zero pages. 
> >>>> +     * It is intended as a mechanism to accelerate sparse. 
> >>>> +     */ 
> >>>> +    DRM_ASAHI_BIND_SINGLE_PAGE = (1L << 2),
> >> 
> >> Does this require the BO to be a single page? If so, does it require offset==0? Or does it just take whatever page is at the specified offset?
> > 
> > I believe the intention is that it takes whatever page is at the
> > specified offset and just maps that a bunch of times. HK doesn't use
> > this yet though it probably should (this was added to help reduce
> > overhead when emulating sparse with scratch/zero pages, which is still
> > very new functionality in hk).
> > 
> > Accelerating this properly involves GPUVM patches - although even without
> > that, moving the loop into the kernel so it's only a single ioctl
> > (user-kernel roundtrip) seems worth keeping the flag for.
> 
> FYI: I will be posting a patch for the GPUVM abstraction soon.

Great to hear :) Although in this case, I meant that accelerating
DRM_ASAHI_BIND_SINGLE_PAGE requires patches to extend the actual C
implementation of drm/gpuvm, not just the Rust abstraction. Which is a
bit annoying for non-essential functionality with regards to upstreaming
things...

