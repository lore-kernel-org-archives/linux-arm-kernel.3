Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD40C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 15:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J20cEnp8PovEA/g12VR916ZnfHt50GcHPHMTtaTEiVg=; b=i3uE2ZrwhQWjN7M6DweSi5m0ce
	78vlXlu3ykzPZQ2ulH4lP7zJ6UgX9fVjMDvhJ746WMjI5YXh6PF8yMG1dGGVtgQDb0Y2IqqpNqwwS
	ZaOohssaAie9muEyAOWCXFDHtWkae1ScAmTz1f/e/uQRNph8wf27h1M+s5QRzAXC20+XACzuH4jL8
	gTYWwp4tnCVfJoOBjds+0DFx6+uGQwZ+p7o1MjD+kS2YoXwDkPd9uPBfr5zgTSPIXXfEF9avY0g6R
	6oHiTNUaPzIw0+AtbdqQkJshA5+O2/yhmHYTWS+ojcdawqdCxSsMXmlXoUaCxr7V1u4y1V9fWbcap
	qVSmkSSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHSU-0000000Gdot-1v1v;
	Fri, 24 Jul 2026 15:05:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHSM-0000000Gdln-1cfa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 15:04:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B005F600B0;
	Fri, 24 Jul 2026 15:04:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC9031F000E9;
	Fri, 24 Jul 2026 15:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784905497;
	bh=J20cEnp8PovEA/g12VR916ZnfHt50GcHPHMTtaTEiVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BAk4wQ+/Wa6HGA5fWaRxaMM4erqhLgYbfehDK/3pX/9VFTbUAT0LmZV0FOCA7WAUW
	 lXh3hVmb6hP/EwvEs8l8FF4/1f0OEdvvhfGp/nqgBuD/biTEwc/KzeIbwO0Y5sh6sY
	 1qCUaFBnq6Tgf0xoqRlO/qc77rUF64i7CDr3kXIQ=
Date: Fri, 24 Jul 2026 17:04:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Demi Marie Obenour <demiobenour@gmail.com>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH] crypto: qce - Remove driver
Message-ID: <2026072455-subtly-prayer-0a8a@gregkh>
References: <20260724050645.223799-1-ebiggers@kernel.org>
 <2026072410-drained-acts-3502@gregkh>
 <CAMRc=MdJTFokXLEbJMQW3V4FAMQid50Vx3fDB+CaNGUrzX-Pwg@mail.gmail.com>
 <2026072412-decrease-sandbag-70a1@gregkh>
 <CAMRc=MeFoG0UXYOAqYhCiKBTs12EjX2-Bz4wDnbeYXmQA3-OaQ@mail.gmail.com>
 <20260724141414.GB1876@sol>
 <CAMRc=MfU1egvJwmgPEN-GXPbz8_JL2XnP-LV0T2+jG-drfXYwg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfU1egvJwmgPEN-GXPbz8_JL2XnP-LV0T2+jG-drfXYwg@mail.gmail.com>
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

On Fri, Jul 24, 2026 at 02:47:48PM +0000, Bartosz Golaszewski wrote:
> On Fri, 24 Jul 2026 16:14:14 +0200, Eric Biggers <ebiggers@kernel.org> said:
> >
> > And with the defaults QCE is *never* used.
> >
> 
> It's almost EOD here and I'm going to disconnect for the weekend but I just
> wanted to say before I leave: this has never been a reason for an aggresive
> removal of any driver. We remove drivers when we stop supporting entire
> platforms, not mostly unused drivers on actively *supported* platforms where
> they can still be used for experimentation and testing. I'm fine with dropping
> this from arm64 defconfig but with fixes, the BROKEN tag should be removed
> and I definitely object to removing it from the tree. How many people still
> use greybus? Should we drop it from the kernel too? And I'm saying it as
> a project ARA alumni. :)

I agree, if someone is willing to maintain it, and there are actual
in-kernel uses of it (meaning not just a stand-alone library that can
never be called either by userspace or hardware), it should stay.

thanks,

greg k-h

