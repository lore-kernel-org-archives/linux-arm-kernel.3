Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C7FCD342F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 19:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G5+NNyyxPxYROTl5/sBNxEkLDQhLS7g8md3d9cMY7P0=; b=tBYeiMpXFPnFEgXohy7Y+POIJL
	fUoXkNBx4h2ooCG7Y8PhBnO7uxVJ2Y0mxbT/l6IUmaGj93P2UJewCXwOvOaIesK4oT9CxxB4d59TO
	iFtljV6581+b6PyLoh1jfR8bN+/H5/eR52FDXvi77Iuar8P/iRf403dYriSmNHh0Nyj/HNq5EYXdr
	5Rj65exRTZ0Nf3rMrvpxud2XZnBNep0ATAfRL33viV0R46NggsVLPzrOSa88RaQHgzvvZwIhT6aOg
	MKpatK1+uu98ZFyzx/Dxeml62lnsrUZqykKcB973zc6+H97JEc2WrXpH1YdTH91olBfdX9nQAkHfb
	rRVXggTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLQcR-00000007KSH-1FRC;
	Fri, 08 May 2026 19:12:15 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLQcN-00000007KRn-2M23
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 19:12:13 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-366089e42eeso1644954a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 12:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778267530; x=1778872330; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=G5+NNyyxPxYROTl5/sBNxEkLDQhLS7g8md3d9cMY7P0=;
        b=VYftUTIYx8oiwYnlk3OSnzQQuzPmXH+qWvQ0+rU4T73Shz7aMHJQV4BnmLehKZsva6
         Oqmqo5uYOYTA3dQlyJwFD4fgLwMlkMXc25uqqdazM/otWk3kMx760010U2hSh9FG/b7b
         T8lKUmE24MW2rIPlSfdbHuGaEFtEoNPL923CbZyYEmZF1Fx7+/pgeqoijRsGxSFSys3e
         SRnND9wPdDtXV6gAekvfUK09h4Muwb7xXcrfeGdVR0LEf1l7Hm6ioAZDqU39DqR0tGv3
         vUnxc3rLxVzh/UaoJDk/iTGxRfv9CoyM3NkVVzTTcQZiwb0cavzdem3hbePyg+GnEsaH
         0Tqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778267530; x=1778872330;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G5+NNyyxPxYROTl5/sBNxEkLDQhLS7g8md3d9cMY7P0=;
        b=dJhWs2YrVP94ILLWX79hmMNSsvltE5sQBfOZ9hS3d5+zx+iMhXBwEhSYyTn2Iv0QPj
         UjF7D/iawGJjCeqJrNOY1pZOA97aM24d9uPqZ2lpfBnaAj0IotOyiUOKDRZn51ybkRNR
         JU48ZMNZdI+N9pWhojX0Ky7+Thfg8zV4R2m58QzRHONavw9oPjuBOFEczz44oOsSJ8mD
         ME7GofsEOdZ3nnYKCmQnysky/eBFKbxwQX1YNtEVTYNheA7U78wP/ODWNSOZlIBRZKS8
         nTJE8xt5kduN0BGRbPAx3y5Mxdv66LiWbeTgFaJ7Be84eo8N/y8uIIIojUkudAN4HHsp
         ZWGQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/iv0Jk8zul/VyELOQ8DG+xWOzJsDtlKzcatYXKFN/tXhIiR42Oak+bxhPwfcWglIbXnzshbEE78kFFg9jeRDV@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm/gZIZ5Wve6JJS8OvgyWGMj/MZ+PFMHFV3vIPtudv2S6Fp/mk
	qTRIzpTLLcIAS1sxbuLnUwASBayEhx4Q1PNH8A6CElshX+tZ38zNrK/VC5YAQG5CoZs=
X-Gm-Gg: Acq92OGig7tgZOnlAyIYIcdZrQ5jr5P/xrCpwZxO3osctpguuRFu/V1qaKc/QvlBi96
	4XVuvDRBlVQy8AGvDbOTZEQmyoyZB714e+oD29jBmFrgFUhhDhViuTCuPrei8pAS8fzS8jCWj09
	lVNKrATKd195bF0hkeB2P1qsPnHM17eafYHHSwSDkPoJYsjYpOleFoP9zJieXjjxGkZvAnrGzfQ
	gHAKgO/Fi7SktsgCHBJneXP44mJGIgDqJeFoIv0VmiafoMnYQNNivar6LXtZsFKS1ZiTbagvo8Z
	g8/xAc/sxy67HuuOS1mH6PNLsZEVeTrT7iqjKw+FTlhs62vbmMAAskC46HNEK6Gv+n30rJPVoLt
	TsGv238RCv0ZwfKrOwxrJYzjqDe/LzHDg7hN/Dff928i+nNa+BcqPV1ND0c7zUoQTBH4PCJsIIm
	GEYGaFilIwiZvDAa5+Ce8=
X-Received: by 2002:a17:90a:38c5:b0:367:c442:3f24 with SMTP id 98e67ed59e1d1-367c442412fmr468771a91.19.1778267529688;
        Fri, 08 May 2026 12:12:09 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-367c2ca4f04sm528093a91.10.2026.05.08.12.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:12:09 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Rosen Penev <rosenp@gmail.com>, linux-omap@vger.kernel.org
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade
 <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, Kees Cook
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "moderated list:ARM SUB-ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:KERNEL HARDENING (not covered
 by other areas):Keyword:b__counted_by(_le|_be)?b"
 <linux-hardening@vger.kernel.org>
Subject: Re: [PATCHv3] ARM: omap2: simplify allocation for omap_device
In-Reply-To: <20260330213528.18187-1-rosenp@gmail.com>
References: <20260330213528.18187-1-rosenp@gmail.com>
Date: Fri, 08 May 2026 12:12:08 -0700
Message-ID: <7hv7cx90mv.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_121211_860035_CBB976C4 
X-CRM114-Status: GOOD (  21.81  )
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

Rosen Penev <rosenp@gmail.com> writes:

> Use a flexible array member (FAM) to combine hwmods array allocation
> with the omap_device structure. This reduces the number of allocations
> from two separate calls (one for the device, one for the array) to a
> single allocation, improving efficiency and reducing memory fragmentation.
>
> The FAM approach also enables bounds checking through __counted_by(),
> which provides runtime verification that array accesses stay within
> the allocated size. This improves security and helps catch bugs during
> development.
>
> Simplify error handling by removing the unnecessary multi-label goto
> pattern. The new code is more straightforward: allocate, verify, copy
> data, and either return success or error immediately.
>
> Also removes the now-redundant kfree(od->hwmods) in omap_device_delete()
> since the hwmods array is now embedded in the structure rather than
> separately allocated.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Thanks for this cleanup.

> ---
>  v3: add a verbose description explaining why. Powered by Claude Sonnet
>  4.5.
>  v2: remove kfree and fix compilation.
>  arch/arm/mach-omap2/omap_device.c | 29 ++++++++++-------------------
>  arch/arm/mach-omap2/omap_device.h |  4 ++--
>  2 files changed, 12 insertions(+), 21 deletions(-)
>
> diff --git a/arch/arm/mach-omap2/omap_device.c b/arch/arm/mach-omap2/omap_device.c
> index 79db4c49ffc9..77a75b0b9ae6 100644
> --- a/arch/arm/mach-omap2/omap_device.c
> +++ b/arch/arm/mach-omap2/omap_device.c
> @@ -307,35 +307,27 @@ static struct omap_device *omap_device_alloc(struct platform_device *pdev,
>  	int ret = -ENOMEM;
>  	struct omap_device *od;
>  	int i;
> -	struct omap_hwmod **hwmods;
> +	struct omap_hwmod *hwmod;
>
> -	od = kzalloc_obj(struct omap_device);
> -	if (!od)
> -		goto oda_exit1;
> +	od = kzalloc_flex(*od, hwmods, oh_cnt);
> +	if (!od) {
> +		dev_err(&pdev->dev, "omap_device: build failed (%d)\n", ret);
> +		return ERR_PTR(ret);
> +	}
>
>  	od->hwmods_cnt = oh_cnt;

minor nit: isn't this assignment redundant now, as kalloc_flex() should
assign the count?

> +	memcpy(od->hwmods, ohs, oh_cnt * sizeof(*od->hwmods));
>

> -	hwmods = kmemdup_array(ohs, oh_cnt, sizeof(*hwmods), GFP_KERNEL);
> -	if (!hwmods)
> -		goto oda_exit2;
> -
> -	od->hwmods = hwmods;
>  	od->pdev = pdev;
>  	pdev->archdata.od = od;
>
>  	for (i = 0; i < oh_cnt; i++) {
> -		hwmods[i]->od = od;
> -		_add_hwmod_clocks_clkdev(od, hwmods[i]);
> +		hwmod = od->hwmods[i];
> +		hwmod->od = od;
> +		_add_hwmod_clocks_clkdev(od, hwmod);
>  	}
>
>  	return od;
> -
> -oda_exit2:
> -	kfree(od);
> -oda_exit1:
> -	dev_err(&pdev->dev, "omap_device: build failed (%d)\n", ret);
> -
> -	return ERR_PTR(ret);
>  }

Kevin

