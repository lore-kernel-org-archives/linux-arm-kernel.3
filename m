Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025D9CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 17:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XEa79tV2eMzpcPWIo8LBBqUX2PeWclrMmzllPIEalhs=; b=KkEX+xfaT8LaiEKQ41L/Fakaft
	+OMTLVIB8ilmKGNPW9W+H8lU43paAuM4JZ5S+jlwdiHu3h9r7aDgwRA31pKKp45GoeVPOBvswHhmQ
	T76h1/1T75ALCp6pejh41ffcca2PdyO+rrNnEF3RPSBsrTy0LmI154LUC23fHlFyZpOaaYUcAuI8d
	KsqlDcXsJnZ41o0+/pLgxYxDmHhkPGhZZz2gjTSRpDVgNx+6fYyacgBwvMTIe59fnosFjMvAxcwUT
	gQW3o8OSYZqSTGr5vMWNomkT+3fjC8AlS88kanAtD2jmwt3O/L34wWRtsKT/Mz315/UknERNRvAIn
	jEfi40gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT0it-00000007xfg-1wwS;
	Fri, 29 May 2026 17:10:15 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT0ip-00000007xf3-48w3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 17:10:13 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-7c0de780bf1so128862177b3.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 10:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780074610; x=1780679410; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XEa79tV2eMzpcPWIo8LBBqUX2PeWclrMmzllPIEalhs=;
        b=N6jhM0F67yRBFXMAzu71k3szz6SSIrZIQ5VH65xLfhvGtUX8D2N0NE2BWfIwOesc2s
         nw3IEfsGyvhaHJcPKH1PrGPw0RYNVTAcsvgyTEzLwcoM1C3wrQLU+7nBDcxgPAbhS9dg
         iFsmaVAkiO3+5twMqB4HN+aOfjwLhZxLz6V4hqsfYRa/0AMsIHYO9pf12AtzUkT/FsCf
         JUUyKRZqhJwfWOzMM55131MgMrOOsWLTNZZuIh/U298foE3KT9hVp1iQcCL5skjUE2oi
         O792//C50kmThXGquRMN3w3w+qibj5gTf8WdoZ/LuYqqplh0FqR7H6KmaXn8R4EAJ+zH
         OgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780074610; x=1780679410;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XEa79tV2eMzpcPWIo8LBBqUX2PeWclrMmzllPIEalhs=;
        b=CYpx0ZzJ8rY4W92OEyPatG6VFepwb7wUW9lIHnmGgE6dAMCNKNMvhQYR7xIuG+KKHH
         aVY8CFh8BMAqPdhh13tzwoga2fmJcWFOy7eHY3fvK0XPSq03OOvxXFCfdR4MbOKoWAV3
         r59N7Au4E1uMOfmWpAdMnyXiAeF03id5gwG10iXXF+AY/LMXBtIwTFLblsao+OyOldH7
         N3Z96jE4kL6b+dQjv5+9LwUC+jFZkZsq1rxfL96BTj7WVUaapBvkK4oNY/EyQHfVYxZd
         j/FILdbjv9ZrgpPsFI5Y85zA3Q7w0Yw7D7Bq3O49R07UkxCRY4LzhocicxBr5SeOVPr+
         O3ZQ==
X-Forwarded-Encrypted: i=1; AFNElJ+TP8NRlFLUlsWvLWmH2dlQb2uYIakv8d89VETdGt4/BkShi/qLRFElj1Y2UZq8qKzMf0thjpyDmcwr6ukV1YJV@lists.infradead.org
X-Gm-Message-State: AOJu0YwAwjKtSQGxnRAtdxmhBIBNRfdG0M0MAAD4QfThRvmA0UW3Cac8
	Aof16za4QZWeBecUV/zMW42WVXa+o2MactOEJbK/56mFMQyxbKiqNn/z
X-Gm-Gg: Acq92OGdXUSO6dJnAjAWFE5Ei9m2oreUigZgXsK8ALHY18JaWKaeCJxTmvEnL/HDC5r
	1dm6YnRwLSFZjmdJciUimNJNQytwltENaw2WGN143LpiS49xCAMLNaxlcWc3Xz7+qSmocc3DhQE
	cjtdlLtD/3qKfrsb+2pFht9edRRURS/VYZKmyMYx+B627VRHMUqz4UL4J8j8y7FGnKauAliLhE8
	UnbPwhyZKuwz1FWYSJpOxnVM6C+JkIB7OyNz3On8y+A0W7T0tIAeUY9ioICbalFleozJehwVTKq
	5tZhxbMwvJJr0ouBTeHBujBgIp44+aFAvA/mXnC8v/JwLAlvRK6VIP+etHHR4R2QIBwT8YuJKRn
	u+h4PJfeXHmxByfwr/JssPfEcf8FY4IwAT2OCQiV43jG+T1bt4o8rAbkpKbiCa9KbuT/EoA8h0t
	Ra+bWgwqE9jOXPX8lmzKNy1vxglwqR/BQWVg==
X-Received: by 2002:a05:690c:e34b:b0:7d0:261a:6bd with SMTP id 00721157ae682-7e05f11c4ffmr1672527b3.44.1780074610517;
        Fri, 29 May 2026 10:10:10 -0700 (PDT)
Received: from Red ([2a01:cb1d:897:7800:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id 00721157ae682-7de689e58d9sm8427927b3.21.2026.05.29.10.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 10:10:09 -0700 (PDT)
Date: Fri, 29 May 2026 19:10:06 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Tianchu Chen <tianchu.chen@linux.dev>, herbert@gondor.apana.org.au,
	davem@davemloft.net, wens@kernel.org, jernej.skrabec@gmail.com,
	samuel@sholland.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] crypto: sun4i-ss - clamp PRNG seed length to prevent
 heap overflow
Message-ID: <ahnIbpBLyn5z_siT@Red>
References: <af749a8447bd7f0e9dd26ca6c87e9c6afecb09d9@linux.dev>
 <4d4407c05835a50413fa1e974e3aa3f4abfe2d5b@linux.dev>
 <20260529161057.GA2706@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260529161057.GA2706@sol>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_101012_036834_43B82B28 
X-CRM114-Status: GOOD (  15.15  )
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

Le Fri, May 29, 2026 at 09:10:57AM -0700, Eric Biggers a écrit :
> On Fri, May 29, 2026 at 08:08:01AM +0000, Tianchu Chen wrote:
> > From: Tianchu Chen <flynnnchen@tencent.com>
> > 
> > sun4i_ss_prng_seed() copies the user-supplied seed into ss->seed
> > using the user-provided length with no bounds check. The crypto core
> > does not enforce slen <= seedsize before calling into the driver, so a
> > userspace caller via AF_ALG setsockopt(ALG_SET_KEY) can pass up to
> > sysctl_optmem_max bytes, overflowing the fixed-size buffer and
> > corrupting adjacent heap memory.
> > 
> > Clamp the copy length to the buffer size, matching the approach used by
> > loongson-rng for oversized seeds.
> > 
> > Discovered by Atuin - Automated Vulnerability Discovery Engine.
> > 
> > Fixes: 6298e948215f ("crypto: sunxi-ss - Add Allwinner Security System crypto accelerator")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Tianchu Chen <flynnnchen@tencent.com>
> > ---
> > v2: Silently clamp oversized seeds with min_t instead of returning
> >     -EINVAL (Herbert Xu).
> 
> sun4i-ss-prng.c is useless, is still broken, and should just be deleted.

Hello

useless ? clearly no, it helped a lot on devices where it is.

Regards

