Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7907CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 14:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gfecz+ZWs/BTOXCnvzAkst5tZtXH0lgY7BHeUFyc1xs=; b=avAZigw+NWi3eFvTQwXdDDXSWQ
	WCflJnprvfAqAwBXQCG51r1FbXtjwoO9Ksxr1/RGbHWpkJ6X16C+N7mpmqbnVhWP9fF0zj6QDEDms
	RiNW7OjTzGqrRU4Nw2PxwCdrhYLw/MItJMK4QqSGZwPvu/NM4r4auNSydXheVDNgHhnG4hadNsMmY
	/9vHN2h9q+CwEhfmeTexmxjC32kTbTaXetW8h+uVlwnKNt6n6bm/68WBBwGRo1Ged/8GlsNctM5In
	f+kKSOcxorQXHJpAmWJg2BNwnU3SM7EvhhZ3WDnMybtREWLoE1iV6SC1cGyl7oPOXVil/pDIexU1k
	n3wX9vMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU453-0000000BKFX-3BuG;
	Mon, 01 Jun 2026 14:57:29 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU450-0000000BKEh-3JqH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 14:57:28 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-45ee5cdbd28so2681501f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 07:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780325845; x=1780930645; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gfecz+ZWs/BTOXCnvzAkst5tZtXH0lgY7BHeUFyc1xs=;
        b=KB4oJ2p80RVFvXFXxZ7L65XS2V4IiLVqeBHhQAIzxo8iQIbUhBga6NDP3XGqkw6r9U
         x/wu75/J0zSGUwJGN6kHBBs5w8XbzacJt3xSt23kdoI9pi2GH7laEGpRrzhL2/Ri/Fys
         ZuaTorLFRHntl7I8zfKXXlpG+q3PI3OMDuOwXERGpgUBrYbDq679WgYJpWHfX4js2am1
         KAEpQ8wH0quWK8vU3mlsmYACjbV1uJKK401F84vf4LAQWGa7ofwlg38C/YkwXIxMlGtd
         jpSQd3erhTm8Kahj3prQhbzfc99yEtJwAUjOF8Fp9H3PfDWonXwIJuMJ2lT7E+9/Onos
         ocug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780325845; x=1780930645;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gfecz+ZWs/BTOXCnvzAkst5tZtXH0lgY7BHeUFyc1xs=;
        b=sS90YPGgNP7s5HP0GVdiZBZCr2/sPRj8pgigDlTXroLy5irvUKla2YYNkINhQ0nEzR
         nrZQfu5sy7tDEEIwSA0+MyFLrisKQSjHU+T8sdkE0h1PH8rlDT0gnPfayexDK1LzcYnE
         CinmX9quncoa836mhtA+wZPEKk3sQSPGFF6HnjSccBUP1kVCDo2iE7UNamsQVGER7OAX
         fL+fYwTJf3Y089Xev3fE8hxgy8VTySMnYHaC8yVcA8NGw9KZz2Qr5jUgJmAtrglbye6c
         lrDmPXNSiSSXgxfYZDi1ZuoA+pS57HBPThxvFZYeIfMPHtl7skp91eYUZ0tw3h+e7/O/
         SMbA==
X-Forwarded-Encrypted: i=1; AFNElJ/H8vp2Rg3UV1sFdE+qr73sAoKX+cBCXIW7Dam586ITLwN+Ox/HgcMYnj3hhE4JmL4AVKrIaTOHZoawdyz+7fCZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy19rzpmEvIQ9C8KT+Znr2GYz7xCn0Frr89XJvgHhGFeAfKt3dJ
	HtuB5cmQnKXpY2IbQ039q4/pqkwCf6vIjzo2assFXimyvckLs2lc1nez
X-Gm-Gg: Acq92OFKi0doj6UpGdLbWp+HjHLTYVhfTJQfCbqoDcxdN6GxBrlJVbbxhw7hzo/h25T
	4+50XUE7YfS/+uNBLZI7jJ6CGPwjZ0RGq55fGfWH9PjSesaTST09C5gAwbnID5RqRHelpes0RPL
	L6u764JEPp1HsmOrSvNvigmOSd3dIK0NPUU8dYNAV/ClrL8eHyOzS7i8Bch+gbV0Li9sP36OTFl
	H5fKDE3Wn6pzdd39fzJbt/kySYJrgxJBprhm8M6VkQ/HSORgeKXLfW/Ew5CYYwiLnn/OTklg8wc
	4B/m6AQg0/1r2ktSa+CQ7H35kOhSDJQTFPEvZ3CGNc5gQ0cEi4OWwh/bvsRHebmACrfgG/RxLhU
	ToBKPlk7iAoFvFK6FcfqmYWk/jNKEjaStT828d1zmPFtp4Tokg5gWSN/lwcJMgcMPUKhpX7s6PW
	rhq3u1IhTC3L7BoJYmYXTLHmhjQi+AyeS87w==
X-Received: by 2002:a5d:59c6:0:b0:45e:e936:5e30 with SMTP id ffacd0b85a97d-45ef6e696cbmr18803207f8f.6.1780325844434;
        Mon, 01 Jun 2026 07:57:24 -0700 (PDT)
Received: from Red ([2a01:cb1d:897:7800:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45ef34a03f8sm27548200f8f.7.2026.06.01.07.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 07:57:23 -0700 (PDT)
Date: Mon, 1 Jun 2026 16:57:21 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Tianchu Chen <tianchu.chen@linux.dev>, herbert@gondor.apana.org.au,
	davem@davemloft.net, wens@kernel.org, jernej.skrabec@gmail.com,
	samuel@sholland.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] crypto: sun4i-ss - clamp PRNG seed length to prevent
 heap overflow
Message-ID: <ah2d0RyZcVp614_k@Red>
References: <af749a8447bd7f0e9dd26ca6c87e9c6afecb09d9@linux.dev>
 <4d4407c05835a50413fa1e974e3aa3f4abfe2d5b@linux.dev>
 <20260529161057.GA2706@sol>
 <ahnIbpBLyn5z_siT@Red>
 <20260529173341.GA566433@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260529173341.GA566433@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_075726_875473_61732D83 
X-CRM114-Status: GOOD (  24.19  )
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

Le Fri, May 29, 2026 at 05:33:41PM +0000, Eric Biggers a écrit :
> On Fri, May 29, 2026 at 07:10:06PM +0200, Corentin Labbe wrote:
> > Le Fri, May 29, 2026 at 09:10:57AM -0700, Eric Biggers a écrit :
> > > On Fri, May 29, 2026 at 08:08:01AM +0000, Tianchu Chen wrote:
> > > > From: Tianchu Chen <flynnnchen@tencent.com>
> > > > 
> > > > sun4i_ss_prng_seed() copies the user-supplied seed into ss->seed
> > > > using the user-provided length with no bounds check. The crypto core
> > > > does not enforce slen <= seedsize before calling into the driver, so a
> > > > userspace caller via AF_ALG setsockopt(ALG_SET_KEY) can pass up to
> > > > sysctl_optmem_max bytes, overflowing the fixed-size buffer and
> > > > corrupting adjacent heap memory.
> > > > 
> > > > Clamp the copy length to the buffer size, matching the approach used by
> > > > loongson-rng for oversized seeds.
> > > > 
> > > > Discovered by Atuin - Automated Vulnerability Discovery Engine.
> > > > 
> > > > Fixes: 6298e948215f ("crypto: sunxi-ss - Add Allwinner Security System crypto accelerator")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Tianchu Chen <flynnnchen@tencent.com>
> > > > ---
> > > > v2: Silently clamp oversized seeds with min_t instead of returning
> > > >     -EINVAL (Herbert Xu).
> > > 
> > > sun4i-ss-prng.c is useless, is still broken, and should just be deleted.
> > 
> > Hello
> > 
> > useless ? clearly no, it helped a lot on devices where it is.
> 
> The only way this code is reachable is via "rng" algorithm type in
> AF_ALG, which is almost never used.  Everyone just uses the regular
> Linux RNG (/dev/random etc) instead, as they should.
> 
> In fact, anyone were to accidentally use this it would be a security
> vulnerability, seeing as sun4i_ss_prng_generate() doesn't actually fill
> in all the bytes that were requested.  It also doesn't wait for the FIFO
> to be ready when reading data from it.
> 
> Is it possible that there's a misunderstanding here and you think this
> provides entropy to the regular Linux RNG?  It doesn't.  hwrng does
> that, crypto_rng does not.
> 

I believe to have used rngd for that. ( or something like that)

Anyway, I understand why want to remove it.

