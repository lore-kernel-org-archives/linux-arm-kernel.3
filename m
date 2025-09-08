Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC7FDCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Subject:Cc:To:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nD7GjWaRllncs0vWRluquCxxcL1VUrY8PY0Pyck9z94=; b=bqwBJKA3wD2tGzaRB5dWUSt/rP
	xCVLGA8mlnWMgl2vQ6tGwUypTIP0PN4vXnAvKEz3CHN8hFgUXBSPth09InjLKyeSzuKGLy4TZMV5G
	OKCI/Yy/OfZkHwgWuo2CoYKnurFLPe7Ywpa6AyU68TarYnPe4/QUdG/2qkajNNZ9OnN01B9BWfC5R
	X4cE5bNFCPPrLO0LHoWZmZh1FjWKUfY7JISNjiTzWaCYh8vd2Vc3kgoE7dz0ay4OqKEIQPbHGoE+6
	vJt8b/H+IhcPfzlzfTvTV4QdBVkyUG+gT5EfV3j62NF+KbSTejiJnoLFvQAEbBM8bRXQ2zmdf8q58
	m0axgBXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsC1-00000004pgE-0HLP;
	Tue, 09 Sep 2025 06:51:05 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvj35-00000002Mn5-23aF;
	Mon, 08 Sep 2025 21:05:16 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45b9c35bc0aso42884385e9.2;
        Mon, 08 Sep 2025 14:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757365514; x=1757970314; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nD7GjWaRllncs0vWRluquCxxcL1VUrY8PY0Pyck9z94=;
        b=PHTB1xSsMt0KInqLbFNU3pnoaEgHutOlb2UngJrTmxocew7KXWZ2NU14ZvSTQct2Hf
         WiaS7QFavAaQvUqynbwFFLnBH/7Jh0AcP8YswUFPW1/n1+m7A9uQbKbTWA4MBATKWfAr
         SeAWCQWxZGJbmWAMSVd4Uvey9BQNICdRTfBAWcyZhuwQXz3Nz2/v7e8grtcwOmYUqHa6
         llbdA5J331NkyyhUz+Wf7ptDVc+dmEheWV3ty6Rhlp0eaDfO3h21gKMCsdWjCIdL4a7d
         SyD3c+NkzoFFvTWrZNkTgoWAGCEY2RGh54m4aNF9pK4ULA0gRjdv9F784zgbBSNYlMhJ
         lOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757365514; x=1757970314;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nD7GjWaRllncs0vWRluquCxxcL1VUrY8PY0Pyck9z94=;
        b=vsHKWaZLQbh2MjtVdsQRDISw0D67sEU6VvoMKFAWw3a1Cl2YtAbbh1hZjeVg0QLvmp
         0aRuODidfRSTyObSwt9MUv2gh64NXUpk8v5stWOaauwkwkh9PPf66MNzBET3Uj/Q5uRt
         SD60vp5J+4otaM99FUClHZa+D3SuhxEP7NPg+cVgvpd2xCBpsGzdYXF7I/A25JYIQd0g
         IAjTlxgpCBJaYrQCYBECWbuPrRaWFXyxJ3ueejeqBaqNdkNnQh+wfpyOuUQxw8J8+l6S
         VsFCMwj0n87bRdmGK8JHKz/c8sWO5XTmNCm0uCYXQ/eRHn14stEy4GHKzMuIXgbwvYRv
         SrwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTG7f5o9mZtVDzEz4XFSILruAKYc2/gIYpuTtNgrAMLYmKmk9UgHqGxCtvobH6HQYRxwk5E+u/y/wFapYRW14=@lists.infradead.org, AJvYcCUZvylwbQUoJLuq+wF5aXXb8FDhNsASatfcWMgLhuYxwGse9tj0i0KvubjNb2C0ACoNrYhh2smTrJYtsrWiwxD7@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2Jw+0afHOWYDoAJWKJRVA2spRRlTcWjVn6xsNW3SJvkfRLArq
	FxSldlkil5DfK+a2Z+warpvz2+UTYsYNNC6Xu8977AEOXpx95AQsjDhK
X-Gm-Gg: ASbGncuBr4OfTBB7Msr0G8NZ4hqpALQNTWYyBOqpLsSf3AAxydX/NN2Sim/HGOWoQ0R
	plhh6TcAlEuR4spDIytPrHFv73druimrVjnzvRwuVCqaTsz7U/4RlWS2AywRlSWh+AdTVq328/t
	/Dmoa1yXYhSfAE20Nkzvtt1Gf9873gnWXS+gYqvFsvXmfg2CsTOxm+k1YpMhUjdj5VnN8g29Mil
	pqGIPCiWSbDxl5kWI+OMwsi6JdonLrSatgXpaGLa1VrqYIX6IaQP4ABdByXW/xgeAhNc5NHzvmo
	P7U+cdnDRUyYTc+WD7bUny6ms8OXjvf9zx/GlKZjYdrgB7HcTB39w7tHamCntxAiL7ru149xAud
	8Z6qjQrLGBQSZ1rk2DQW+lAaiLvJt5Kh5aKsMtWqCikcFp1nnYGsKuj+ASbGFBXCHcgkpbQ==
X-Google-Smtp-Source: AGHT+IEjhWtTt2FqPYcZpCHMHRur4SWcQlNaJiusM1qV0CrfIn2kd8oGgSYbE1m3LqTOp3T97igKcQ==
X-Received: by 2002:a05:600c:5248:b0:45b:6b57:5308 with SMTP id 5b1f17b1804b1-45de078401dmr81273885e9.7.1757365513615;
        Mon, 08 Sep 2025 14:05:13 -0700 (PDT)
Received: from Ansuel-XPS. (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dda202112sm160712185e9.5.2025.09.08.14.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 14:05:13 -0700 (PDT)
Message-ID: <68bf4509.050a0220.345893.9bb4@mx.google.com>
X-Google-Original-Message-ID: <aL9FA7MiwUBFilRV@Ansuel-XPS.>
Date: Mon, 8 Sep 2025 23:05:07 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: airoha: fix wrong MDIO function bitmaks
References: <20250908113723.31559-1-ansuelsmth@gmail.com>
 <583981f9-b2ed-45fe-a327-4fd8218dc23e@lunn.ch>
 <68bf16e5.df0a0220.2e182c.b822@mx.google.com>
 <d1bc3887-5b88-4fb9-8f89-4b520427ccdc@lunn.ch>
 <68bf2b2d.050a0220.7d5a6.b11c@mx.google.com>
 <CACRpkdYuT0x3JSFWHMF5thH0UyNF1Cse+W9joE12yQ0iAAXjuw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYuT0x3JSFWHMF5thH0UyNF1Cse+W9joE12yQ0iAAXjuw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_140515_525939_BCB4F698 
X-CRM114-Status: GOOD (  17.87  )
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

On Mon, Sep 08, 2025 at 11:03:31PM +0200, Linus Walleij wrote:
> On Mon, Sep 8, 2025 at 9:14 PM Christian Marangi <ansuelsmth@gmail.com> wrote:
> 
> > The usage of GPIO might be confusing but this is just to instruct the
> > SoC to not mess with those 2 PIN and as Benjamin reported it's also an
> > Errata of 7581. The FORCE_GPIO_EN doesn't set them as GPIO function
> > (that is configured by a different register) but it's really to actually
> > ""enable"" those lines.
> >
> > Normally the SoC should autodetect this by HW but it seems AN7581 have
> > problem with this and require this workaround to force enable the 2 pin.
> 
> In reply to Andrews comment I copied the two above paragraphs into the
> commit message in the applied patch.
> 

Thanks for handling this and adding the extra info, I was about to send v2.

-- 
	Ansuel

