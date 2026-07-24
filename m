Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E00C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 15:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uuUNKxqY+LG3qQIlLd9qfr9KhKPVbYZ6sV4UqffU++M=; b=3pwsVNrD17cCRNdPHmrpJ4ZNGs
	m9aCp/YVDqYBPezNs9qSvEkuorO8gZweb76SOuj+SScXo4M6/yde6LOI0GwNFWDAp5Arp4v4Ty3oX
	La6Lv5BxtxU8+XPRRLNLvOOJRyuElQc5JYsrCrwRA69ZxBRf3+xvmJj1+fuhiB4YjZceqU9yIQHTP
	cZQAROzVlDeuJ7RrYT1Ep9znAP4noynaIfKYsMr/oZMRVZK2rxitOV4icjdSLQ71E1lzY/9ePkr2z
	ZYuLWnBfR7gpjkQX9pl0iPd1qOj64VTKxvfYyDCNwtKaCYbduReonlHgfu1x9N4TDeu7hIWvU23Wi
	OD6A5Atw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHYd-0000000Gek9-2VCW;
	Fri, 24 Jul 2026 15:11:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHYa-0000000GejS-3aFo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 15:11:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D831600B0;
	Fri, 24 Jul 2026 15:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 777591F000E9;
	Fri, 24 Jul 2026 15:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784905883;
	bh=uuUNKxqY+LG3qQIlLd9qfr9KhKPVbYZ6sV4UqffU++M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aKhfvHI6bLFKFB7z6X+qsS4QCJnBrahaBRx3Q/JMuLtPQG+QZ82AtxdGJOSLjb6+P
	 hZuxyfmpixjWi7OE8NnL1tGUa6DudXfIQcogi+bjXFosj5udX2QSa+0E3fRZ5drm63
	 4ZKF57Cqj4rJIIWBdADeDjPOO7h0uUKLR2z2T1lKkZPliw+GRU4JKdSrAH+sABAIsR
	 xwT64UfzODvP53K1U8a6BooGb1uYn+C8+BbeqvQNhTon/oNb/P0TnwDR9kCqzrRZYz
	 QOtPqW6bQ/OLf8qMXXg/CMtpC4kw7fGsk7m1uu4u8lzIBHS9nEmY91V1v1lFfYBdMW
	 6zXqy4qAEz1ew==
Date: Fri, 24 Jul 2026 08:09:32 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Demi Marie Obenour <demiobenour@gmail.com>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH] crypto: qce - Remove driver
Message-ID: <20260724150932.GA6763@sol>
References: <20260724050645.223799-1-ebiggers@kernel.org>
 <2026072410-drained-acts-3502@gregkh>
 <CAMRc=MdJTFokXLEbJMQW3V4FAMQid50Vx3fDB+CaNGUrzX-Pwg@mail.gmail.com>
 <2026072412-decrease-sandbag-70a1@gregkh>
 <CAMRc=MeFoG0UXYOAqYhCiKBTs12EjX2-Bz4wDnbeYXmQA3-OaQ@mail.gmail.com>
 <20260724141414.GB1876@sol>
 <CAMRc=MfU1egvJwmgPEN-GXPbz8_JL2XnP-LV0T2+jG-drfXYwg@mail.gmail.com>
 <2026072455-subtly-prayer-0a8a@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026072455-subtly-prayer-0a8a@gregkh>
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

On Fri, Jul 24, 2026 at 05:04:46PM +0200, Greg Kroah-Hartman wrote:
> On Fri, Jul 24, 2026 at 02:47:48PM +0000, Bartosz Golaszewski wrote:
> > On Fri, 24 Jul 2026 16:14:14 +0200, Eric Biggers <ebiggers@kernel.org> said:
> > >
> > > And with the defaults QCE is *never* used.
> > >
> > 
> > It's almost EOD here and I'm going to disconnect for the weekend but I just
> > wanted to say before I leave: this has never been a reason for an aggresive
> > removal of any driver. We remove drivers when we stop supporting entire
> > platforms, not mostly unused drivers on actively *supported* platforms where
> > they can still be used for experimentation and testing. I'm fine with dropping
> > this from arm64 defconfig but with fixes, the BROKEN tag should be removed
> > and I definitely object to removing it from the tree. How many people still
> > use greybus? Should we drop it from the kernel too? And I'm saying it as
> > a project ARA alumni. :)
> 
> I agree, if someone is willing to maintain it, and there are actual
> in-kernel uses of it (meaning not just a stand-alone library that can
> never be called either by userspace or hardware), it should stay.

What would we be considering the in-kernel uses to be, then?  Just
wiring it up to the framework is enough, regardless of actual use?

- Eric

