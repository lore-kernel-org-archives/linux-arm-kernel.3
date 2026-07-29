Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22DFC53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 17:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ovttOnJiDeqpmyIhx6sFDE+BfoHo1gmKUBQh2Vi1bb4=; b=2uDqPkcROIO9C8/ZPuOBuR72tg
	T5Wx7nLPcv8aflKBt2zwdC6a5iF8qarzZX08Ni6AyCzglq5Oi3lXm4wpHSW+T8c63KTu5F0YjE9W+
	OSFxMmm3wgWLrw1vygWXCvU/Ap85IyTvOjYHEjdFv2/O5ngnGgIs1v5f2XvYJyLwIFwoIrcypsLfm
	pgr+6eIYpr5Sa/9F6cikeqYsLJO1dYIevHxr8XuLONyVp6+NEKEVYShq6gy2xXEZ6ZUzU1jfDaer7
	RRhEvefJy8TOQ8VbGSVbvZBCPsOYlmXncicm0bA3TpC6NQBZ6VrZWHStRIZ7Jc3cB4AbyeTvNicb+
	WbEhkBXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8Ek-00000008izb-2Ssd;
	Wed, 29 Jul 2026 17:38:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8Ej-00000008izS-1est
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 17:38:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BD21F600AB;
	Wed, 29 Jul 2026 17:38:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB401F000E9;
	Wed, 29 Jul 2026 17:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785346711;
	bh=ovttOnJiDeqpmyIhx6sFDE+BfoHo1gmKUBQh2Vi1bb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WL1ksy9k2ADLdlp4kAEC30y2vC66MEl7DPMkQPZ9mhjRebWbqd9+uLjPwZMjR75zo
	 oA3wqOubjgP6BS1tz8Gm55mMh/FS2WyGdWiRJ1Q5kjq2P6fps9oiN5iW3MKqk9SJXD
	 UARBLYBOeFDIryVgcHDRIYMFOvGahbXjgAh1FuUdda89ZW6GAchXekC3kzhGTLIDVI
	 Ez3U94KDtQ4VWFVAzvNQ3Alw96pJ57TLGB8SIIqAuWR5WCD12GIVkyiKnadm1sauBW
	 yp2Hp1ojIT5bJ0FarBl6CtCR5mC+aqrMws20zc4SUNmj71LlBRZx9gdcIuhF5MVg1D
	 Mur3cJwH1Bhgw==
Date: Wed, 29 Jul 2026 10:38:29 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Demi Marie Obenour <demiobenour@gmail.com>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] crypto: qce - Remove driver
Message-ID: <20260729173829.GB4454@quark>
References: <2026072412-decrease-sandbag-70a1@gregkh>
 <CAMRc=MeFoG0UXYOAqYhCiKBTs12EjX2-Bz4wDnbeYXmQA3-OaQ@mail.gmail.com>
 <20260724141414.GB1876@sol>
 <CAMRc=MfU1egvJwmgPEN-GXPbz8_JL2XnP-LV0T2+jG-drfXYwg@mail.gmail.com>
 <2026072455-subtly-prayer-0a8a@gregkh>
 <20260724150932.GA6763@sol>
 <2026072428-ungodly-outsource-b20c@gregkh>
 <20260724155144.GA2032@sol>
 <20260728152241.GA4281@quark>
 <CAMRc=Mch_3fFqq+khutEMQG3P-ojBE2dnLy_U2_gDV4e1ro6aA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mch_3fFqq+khutEMQG3P-ojBE2dnLy_U2_gDV4e1ro6aA@mail.gmail.com>
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

On Wed, Jul 29, 2026 at 05:02:08AM -0700, Bartosz Golaszewski wrote:
> On Tue, 28 Jul 2026 17:22:41 +0200, Eric Biggers <ebiggers@kernel.org> said:
> > On Fri, Jul 24, 2026 at 08:51:44AM -0700, Eric Biggers wrote:
> >> It is consuming a lot of the community's time to help maintain,
> >> including dealing with LLM-found bugs, with no clear benefit to anyone.
> >> Even considering *just today* we can see someone sent a bug fix:
> >> https://lore.kernel.org/linux-crypto/20260724081537.191992-2-thorsten.blum@linux.dev/
> >
> > Another example:
> > https://lore.kernel.org/linux-crypto/d5de5a55-eb35-4ad5-8d53-12e188e156cb@oss.qualcomm.com/
> >
> Are you seriously complaining about people sending fixes to a driver we want
> to see fixed? We don't remove maintained drivers, this has been the kernel
> policy for years. Unfortunately if we want to fix it, then it'll take some
> work involving sending patches to the mailing list.

This again completely misses the point.  The point is that maintenance
is a community effort, and just because you have a M: entry (without a
git tree) doesn't mean it isn't taking time from other people too.

Now if it actually provided a benefit to users that generally would be
fine.  But in reality it just causes problems (with the possible
exception of the one point raised today where the driver is "needed" to
power off the hardware, though that part is broken too).

- Eric

