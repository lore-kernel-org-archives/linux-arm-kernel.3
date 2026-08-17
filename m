Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEB7C5DF7A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 11:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tV4PQbMLFFgyHeT+5vlbh1R9csfOU7q00rfgp5Wi+ME=; b=31lDt/1cNPswVBRTTLMXxWWof+
	LM7SgCU93T6hHpszeXe2PEw2veTZXIzV9RkZd4/CLz1TjDxjfKs0RpBDrydoKPo5SwyAhyezTQ/QE
	lowtFZMhQw3PJC0dx6M0eDEiqwg3mQwCq7mvUVwnGr5SslsvF75JlF8fqKkT2Hsni4dVMmkoQ43Gq
	4lhReoyUyJr1pDViQbmMwgsj6InqEDj/9pCD81JRaVVr8Vz1ZPidZfHhPhVPZbAePd+ROQDWzKQtK
	ehB9QmZiYMi9EF7p862L/qnjk65AADbx/FHjxB5j/IDjZlTLD0L7uTGljB4zc09dARzxdOiy+R5kP
	Uh1wW7ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvvww-000000065XF-46sG;
	Mon, 17 Aug 2026 11:56:18 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvvwu-000000065Wj-2kGC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 11:56:17 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso16898585e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 04:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786967774; x=1787572574; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tV4PQbMLFFgyHeT+5vlbh1R9csfOU7q00rfgp5Wi+ME=;
        b=IdPnqO7SRznHLGCOHBGcOeqtpMApSmMKtWHKddJpgYTDO4L478Q3uret7JsY59ts68
         vWr7LpAUlnyqVs085ivVImZ13cH34JkLVKeJYl7cgo1+/IeMbXk6vJwMtjXD1t4U4ZqB
         1KS6Ib/oZymk3Zl766liC1/bFXpa3Bm1AWlRIbuEni2TSz14hQyXPsK7GRldvMz57H1D
         d/qhwzs6lbFVKE3iwCHwBvpkaVOjbVOoTvw9VuKl0baUwqqefkX6wGCF6dCDSdZsu9st
         MFoebo1ibU/cfl77qbcrWxuGYbEH1vvqtq9VffdsbneIh0UIo5zUSw5XHzFUjN75BU8E
         AlrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786967774; x=1787572574;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tV4PQbMLFFgyHeT+5vlbh1R9csfOU7q00rfgp5Wi+ME=;
        b=GuZKCWVaJ0cB8QqmmKTOaebD1Co8LpCZtfy+GX8eCq9t98iC/Zg0VTlORo0/8eTiwX
         ZqnvDfh8djvFszEDtGIbl4zpSU8y3PhPbrXLwC6qSsghEKCl1raImjwL+cV2EPcb/yVE
         xFxqBaNNycw6rMPbzLcgHuAejBJLO44a18axEcuagG+tDen9EGH7aOIEbN0VBjXU9znu
         HP4GhyzhYoSxLYf/kItn4chU91aM+KQuCbwfdVPZ8kxGuQn8440JL/OgCy48x4J2mKC0
         B7ggSn1QXmeYa61r0Ov3JakTaQsPMHwszrBxppWmfDLeUOT97lgWtwhMD6f9gg9VyXup
         1zJw==
X-Forwarded-Encrypted: i=1; AHgh+RoA0NTiRTn7llkNqHWWKVGZo1rgqVBoHAbsrrV5kiNVSlSwS2UVJMPXlBcYiJe2Rtu05raouBNHnliougJotkto@lists.infradead.org
X-Gm-Message-State: AOJu0YwwQftTZhlfKM26NlVe1BYqkrp270Cbfg3QaTe/+kNaU9Ulpt+d
	ZWDCRCJFdHfQYKsKIdjyhaCLRJAiWFit3mum0lQbJCufFHGfG9H1na52
X-Gm-Gg: AR+sD118hFS/geQnorBG59bkeC5k2cLsIm+AIC9jNKfOW+Pch5W/vHFxw6M1rVzqE9q
	FJcxyzeO3G28siHzXBt2tiT4zPbBO8iOV3FZwHCWq1qUgi23RMAQsoVvPlHMDx/LBCFNY1mQX8y
	2l1QDSnYf7l0FBGwFSyeyxxkhL2khn18byZeOmGIDAjF9e9gmPLY6SIjPzpmwgeupABIt4QSjKi
	QqvvIYvuaUehyIS0g2ASA5fyfrYXrsRVLkpwqLCxqsR4du0A13C76ZCyBLqFE5TAnWXTVEzNWAV
	n2zBto1qRaj2Ud+0Z7cKWFbdQZv62uHpjK5QsfPFCd/z9jc699wdOQaZGC8HONdVH2RCn4/mtw6
	FW6Z5hOEO9itxGmbvUwRVsECfPd3NDEWJEWEVOWTSOpovqY5ny63F+HjnMHb77gXYhReuMBIRqQ
	rJCOWF2X3WwLgFd2O07b8i90gsrQLg9e+8U6WnBhDYSJ5yhB/JhNa/pIe8SAT4sCJllGfCFC0wZ
	d2YT3PXGjaOAzqbC4F2v6DY5DbdElOBMwt23cNgdzKkYis8NBPE9cE7Ym3zoMl0PVrLTAY7X48b
	T2CXQ1XV2anLkToXDEPAA81a7mbtnv17AVyAsuMT4s/2LR1RFb/zdl4IDL5xN3fRspGSNFnKuQm
	fCwsnGwsrm0z0qPtIs80QumuHhXSh0TcsCgCgONe1+G8D1o4sex1qOGwPgWOsLFfjZaM2tw==
X-Received: by 2002:a05:600c:3b1d:b0:499:87b6:f3c0 with SMTP id 5b1f17b1804b1-4998807e4c9mr371138435e9.14.1786967773981;
        Mon, 17 Aug 2026 04:56:13 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4998777a4bdsm203726505e9.0.2026.08.17.04.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 04:56:13 -0700 (PDT)
Date: Mon, 17 Aug 2026 13:56:10 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Petar Stepanovic <pstepanovic@axiado.com>, Akhila Kavi
 <akavi@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>, Jonathan
 Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Harshit Shah
 <hshah@axiado.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] iio: adc: add Axiado SARADC driver
Message-ID: <20260817135610.00000c0c@gmail.com>
In-Reply-To: <anoYDi-bt-t6ZeeD@ashevche-desk.local>
References: <20260810-axiado-ax3000-ax3005-saradc-v5-0-bb0df3ecedaa@axiado.com>
	<20260810-axiado-ax3000-ax3005-saradc-v5-2-bb0df3ecedaa@axiado.com>
	<anoYDi-bt-t6ZeeD@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_045616_714915_21558A11 
X-CRM114-Status: GOOD (  10.20  )
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

On Mon, 10 Aug 2026 21:27:26 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> 
> > +	soc_data = device_get_match_data(dev);
> > +	if (!soc_data)
> > +		return dev_err_probe(dev, -EINVAL, "failed to get match data\n");  
> 
> -ENODATA

Hmmm, I always thought it should be -ENODEV. (`grep -Rb5a5 "device_get_match_data"
drivers/iio/` confirms this, but maybe it's just wrong to begin with, a few
instances even have checks missing).

-- 
Kind regards,
Joshua Crofts

