Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F17C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 08:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/xcej/j7S2rGPSD8Gyx86eUYHBjb6muKeX/bEp2HCY=; b=HvnYszF8UeCEnwsuB8qkYikUqm
	Fwb8BYhSpwY3aqliOXQAZH+Eg4h0z1j0HVa6QyPyOd79s9ImSqf9JC8y3pIlYs7bRi+IThKnN4gMI
	oRWcHGQ1ePswmcdCcXJZhTrEPfQOrh1KwZzlPWvq3qc8Vej3pi5qKm1rDCuCMEBnO3iubxX7gRKFP
	wLvsyxXbDhJ5zpelmIPohe8yGPIjBJx++p8HbM6v+GvDvma0O9cV2MkRgAaMN7nLkM1VsMS5vREiK
	EUOrjJNoOORVTdgYRnwRIHA/YU9tyN7BxSF9Sp8eOsJmiC5Ezf6UkhVvigyGR12Tha2wWNjhNP6el
	hnmrkzLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ORu-00000005bqa-1Lqh;
	Tue, 15 Sep 2026 08:23:30 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ORr-00000005bpl-1saJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 08:23:28 +0000
Received: by mail-pz2-x10.google.com with SMTP id d2e1a72fcca58-85469d249c6so2904714b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 01:23:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789460606; cv=none;
        d=google.com; s=arc-20260327;
        b=r0ioO8lOM+bMOWMXxQyjolaOBb+sq4nfL5TKr/RTfBZ+e/iRrN0T2DQYjQPCPZwFxX
         2nlvYWVusWLOLgucVMvPMPuxObvw+FGa/c/C3TcT4DkqHfvzCL/C3JbwWAXdzP5soXKF
         Izhc3hFcDhoNQZzWSc1tuwojNV7js8cPDu/xZI/8o9IPqu5fjIxRoNANXr40K/EJOXLN
         R3QmKkIf3lQrsRDisxflSXyO5EfaoIsJ3W457oOuE/tjKNbFEsiF197J1+2Z4/0ZIAjy
         PfFRolHMQfV2fOEoVVkc7Ob3l0RhMJ6XHadwy+TdO5qNRJIA4i60aLHEFEA4xt3JSUXc
         fyOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=h/xcej/j7S2rGPSD8Gyx86eUYHBjb6muKeX/bEp2HCY=;
        fh=COnGuCUxo7ZH4QYYl8nPurhJliOmKxGYD5cS9sg29KA=;
        b=KaJUm1TMWa/iqCd05GO9WCUOn5lRkzZ4nufrq2+9b9ahjjHw2+vK0XcQo8NhXTuKcD
         DYGX06VKgLuJP0/HXUQeHhghZEnYycN+LOSbNJ/29D2wnOBHwHrHfUqdm1IbidgPG0kV
         Vle+xdUFM91FR/tTBoOHdTo+NUPCBF74W1vL3bF4EvBlL+ehkU9ICOCItCXMeAOxsH/H
         1Deih3E5fJ5Xtf6dJstLuj02A1hhePPIJZuYCUEHjmUhW4IyJliHzoG6BoRXGAW2zgv9
         pUkWK7Ddzpgn7rTrwalIpYJW0BQhLIcuhfwSkeUIiAxgA1bnYgLFUkqru17gNNcnwMvA
         Xp8A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789460606; x=1790065406; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/xcej/j7S2rGPSD8Gyx86eUYHBjb6muKeX/bEp2HCY=;
        b=n3cgDVnQlAbW79lis1lUoR4pfj9FLc/9w+4MuQcLgAHa9DCJeQkjYPX6S+bUtPmXDX
         CK2sXQ7oXLjenxNA2rJicTFhxQ0GUQog+Oauk3H14sCVdpLgKt2hjfq8ys//4+CJaugF
         +ITV/FTzpUppynIFgZXBqx1lM2WPST2EXioJIn2WsAjkL9JJwTUtJBedQEbiI17SaU4k
         gmZQo0OytVSFnUFTbnlMxBG9FIklk/w+18RHw3H/DLVfHRNm7BLfBnyoSWkMA5UDVs9S
         mJyv6X3/+n35m8ufhC03+5zHYfjgGalD08xn2DOY42+t/dUwz18HWQMojMqkcMo2i6XQ
         tjBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789460606; x=1790065406;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h/xcej/j7S2rGPSD8Gyx86eUYHBjb6muKeX/bEp2HCY=;
        b=pVt/RLbSAnb1IImfbwD8atA/VlvXgVWUZf0GloXGpPaREFPdkyyJWN1X5Kwf57vw7W
         6+6eDA2AiGFxxs84wq/W1CA3shYeAor900IYXauOVOqbNA9xHXAXkPTBT3ZdAgWlmrKU
         LuW1rrWirVk/wBT7rs6CS9QHoyWjvcS2WXXULP2h0KzddZsTzeeBYv+lUbmzC2yUOQVC
         MgDj7IpsOsLp8wC7Dq4YBGLuc//pD2/W3jVOucMbK8Zm30Fs+wdibq7KqKeJ19MfgqX3
         1Dek3tcQaAsT0I3DtA3oRN6WNMuGBaitqb777SDAGHtqaDONZEKTFzxExBXrRumWl3wR
         xmww==
X-Forwarded-Encrypted: i=1; AKwUvBxvVXR+XIm0yGtu8zMRwiCgREbFcFOcp0rgZesE0+TJfJU1OtjWNa7ZgyqXdh4f4FhMG9fRhsqRVE780Y31t2qk@lists.infradead.org
X-Gm-Message-State: AFuF++lVMCHnS64NuN8X/79FJQchwszU/R/bkYNJQQMgQ6+Oi3c3W1Dg
	fYc6v2hc8pkRZFSxzXa3rSTG5M5FzN9L96pvADbJTQW0j9K6ETvu2zUBNYiYiHEOhP2Ui6fT3Dr
	IgoK1vwdAzYiBbixeXuXY4K1eG5JPw4A=
X-Gm-Gg: AYBFou07k+dyjF2H/r3JS2XV4Fk1/XkkeXbWR08lXH00hzAFfWYneItp+jCfdKCdyLe
	fpez4vKi99aIgtmtYCcrNRN524sr4LpP02NjKjsMceVc2zTXk/ylbngo4YGD3AQm98EMcAPu2ic
	4x7ZtVX642zbc+/MM+AR8Ii9MCBkdSrn9/sNpQcxHzCRJrua5Zoq1+hbJqhUoRh6kxVqOaiLmzW
	aE57w+xUK4a0m7L8iN9efzBHmuonBCCvggIg+QuBinmEjmARqdz+evMrLsX8Kk5V/ZGAfCnCqd2
	xh3722Tq6FSXzYUj4Zx02gH8IyRHqg1QRLcTlpmQgNxvrdFqvQQB74QXbij5zBIyUeQMF4ik9/A
	iftLYn3TCNe46khzuNexV3MenLVGTTZ1OZ7DrA+8H9gVLrca8FXdZZLAeMSy5wrCVTgA=
X-Received: by 2002:a05:6a00:3995:b0:84f:a82e:d32f with SMTP id
 d2e1a72fcca58-86f82e5bc49mr11440122b3a.3.1789460606294; Tue, 15 Sep 2026
 01:23:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260914072842.24420-1-phucduc.bui@gmail.com> <20260914072842.24420-8-phucduc.bui@gmail.com>
 <693fea96-1905-49c9-b1c5-3fa1ceb4874a@collabora.com> <CAABR9nH5e=kKRsHQYx7u3HtWgA3C897d9dH4h+wQTpZNGaTRHQ@mail.gmail.com>
In-Reply-To: <CAABR9nH5e=kKRsHQYx7u3HtWgA3C897d9dH4h+wQTpZNGaTRHQ@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 15 Sep 2026 15:23:14 +0700
X-Gm-Features: AcwNN1VJxWS0kfmgYMTWj5HmLKEavOhSqOjDUWyYXdNn-q4rjwexIxFPMbacpHc
Message-ID: <CAABR9nGVYghGE-kshpeJQJrvuUFJmDATW_mBCoJfVwDNVnSErw@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] ASoC: mediatek: mt8189: Propagate runtime resume errors
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Dan Carpenter <error27@gmail.com>, 
	cassiogabrielcontato@gmail.com, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_012327_520899_C87A8AF0 
X-CRM114-Status: GOOD (  17.17  )
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

Hi Angelo,


> >
> > In the probe function, there's a call to devm_regmap_init_mmio(), and that's being
> > correctly checked for error as in, if any, probe will fail.
> >
> > So... during suspend or resume or anywhere else in this driver really, the regmap
> > pointer can't be NULL.
> > The right thing to do here would be to just remove the useless check.
> >
> > Mind you, this comment applies to some other commits in this series as well.
> >

I found something interesting:

in mt8189_afe_pcm_dev_probe()

-------------------------------------
afe->runtime_resume = mt8189_afe_runtime_resume;
afe->runtime_suspend = mt8189_afe_runtime_suspend;

ret = devm_pm_runtime_enable(dev);
if (ret)
return ret;

/*
* Audio device is part of genpd. Registering it as a syscore device
* ensure the proper power-on sequence of the AFE device.
*/
dev_pm_syscore_device(dev, true);

/* enable clock for regcache get default value from hw */
ret = pm_runtime_resume_and_get(dev);
if (ret)
return dev_err_probe(dev, ret, "failed to resume device\n");

afe->regmap = devm_regmap_init_mmio(dev, afe->base_addr,
   &mt8189_afe_regmap_config);
if (IS_ERR(afe->regmap)) {
ret = PTR_ERR(afe->regmap);
goto err_pm_put;
}
-----------------------------------------------

Here, it looks like mt8189_afe_runtime_resume() gets called
before devm_regmap_init_mmio().

So if we remove this part:
---------------------
if (!afe->regmap) {
        dev_warn(afe->dev, "skip regmap\n");
        return 0;
    }
-----------------------
from mt8189_afe_runtime_resume(), that could actually trigger the bug
we were just discussing.

Best regards,
Phuc

