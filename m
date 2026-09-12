Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B645EC88E56
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 19:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=daj75kJ6ldxZJz9wLYTKbQQmIUWSVox4tdaNBDn6j84=; b=s37H8PAvTT40wcKvk+lcGYwJiB
	8joBDC2c+Y+Op0mi+oWVCDrIkS0Dnn3II0+ReDpbfrIU21z6RU0quJnPBfA8NitoFchmYdFEbG02+
	LnCj2VckgHs2tUv/gwE4UPCxZxXlq+UDkVSyGVLARoGDanYq1Z/rhdKb0forzNklZFpNj7iPHHzOI
	8kI9dhSfMD2PdejtOSNkX01MV4IyhVpHKT2+hbCv6LkHw8NxyYY7QEYimaByHQ4Mq1ww132HD8erZ
	x0aoxQhsGWB5MNU65JUN+Za/E9621tsTP+r20boB0YsBdNEEuzbonzZ96WaUxJKiq8GsNY7ErNtQd
	mgyU+mJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5T7Y-000000015bk-0PDC;
	Sat, 12 Sep 2026 19:10:40 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5T7T-000000015bO-45E9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 19:10:39 +0000
Received: by mail-yx2-x10.google.com with SMTP id 00721157ae682-85d43da99e9so7536627b3.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 12:10:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789240234; cv=none;
        d=google.com; s=arc-20260327;
        b=s8DgrbgzHXkfiNDA3RLrgJZ9DW2b0MD5G6Ph/pv4St8j5oGliO4LIDx5E4erKpFZHB
         d1kVkO474LuC/6lLZ14/v3s9cXnLkIO43ADReTkW0n45wdMLJvCtBY/tLP2jTskagsVT
         ODOf7FqQfHf9ORLmxTLBa819cl3ABvShhP4o7uJzHvbnOpZkSd6fLomPSpoA4ZvfWTog
         bryw/VXR+G9XnjMXkeNWo23e6h2H45y+J5UTD9fE1pQ7hJDOAcj/sctu6epaYWSjmVNc
         L1uRy4mowhX+UCbI3pWcVtk+NSGp60udWmU7OpmlZndBimdw428Xt4CKGLAs7Dun3bs8
         KUOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=daj75kJ6ldxZJz9wLYTKbQQmIUWSVox4tdaNBDn6j84=;
        fh=V/sxEt9qbOoj/SFry1dyny9fAW/RVFnxAM5SkSZMROc=;
        b=aELkZlu8NBYBL1mjKM6bQSs6lz8Z0LHO/49NGNJsINfDjp1a3KhwstMW/QSPwEnDMo
         gUJ4w6tujf4fnzMCM9YlPUbYVkw2ZDSG/jyeCM2+zoJ+5I4c1AP9af1eYnSP+/70iuHF
         91bZrnOfb1KRSfyWjc2lzQU0u4GbCVVJDAS3Q7KnBnAnRP2pFEWlU53c6GqNLR1ELSY7
         3k/BN12SD27up2jwq8J8AJlNAkkuUTxE7cA/w7EY0t57KjDuAyYZUlwdlbGQoQfA9+io
         T//r0RpcJFDpYig3ekBF49VWa+z8q+5zuhb8KkdL1VsRRg8fRSrYBrh6F7RA5Cob6n93
         gkKQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240234; x=1789845034; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=daj75kJ6ldxZJz9wLYTKbQQmIUWSVox4tdaNBDn6j84=;
        b=awym6Pkkln3mz/u0gDp8DqPphb0SOtI+GvnXMGaTiq9S9ez0A+lyQlzcoEW2w60X5x
         5T0gW9wSX+uTW9QBxWpURbCdoDdRDm/LeV9Nv0n089n+SKcOhrroeMaaUrTMPscE5/jF
         t6jc91Zm34+zG84s26KQynwbYZYuvUVVrooSw4fupoYhdV1emVJehhgSQ37kpsNcuubm
         0wiRX/ccG3inw+AyVsJAxO0shUBPsOzWGcAAQGhwLfhAR7Ajsd0dtZCo1yIkmSEhnirw
         M3tGTJsjgaV6V3MqwfESWMXg8aC9M7TEPxjn7r43W7NCUNtvQwafA/yFPKwwCH7iJ2A8
         X2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240234; x=1789845034;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=daj75kJ6ldxZJz9wLYTKbQQmIUWSVox4tdaNBDn6j84=;
        b=DXzV77tt2zEdCT4wM5hwzfq3jEorDmardjddjpO+i5p8jedE/+r+cFwO8XjeD/rpOJ
         N11/tRN5J+eBZIBwMy5wc/QtzQzCW+u2H4s9p7hrIeiL8R/xxfbAD2VklNtCWIiWhTww
         Ns+vD9iDB7LuuKnUACMK+9i46ebbDSHRSpaiEy2FdSumSeMFtbroOJE50XcMmaehHW0K
         NM7Z+sQpzbuZvCKB0kjloV6lZ/0su3wZlD8cFtOtRDovKxyj6Iex/sOs48EX2HMwRdIO
         YSKMPeMxxa3BOU02gdEF3inndo0I46SdviU/x9P82kNq1G25NJZdJAv7N47b6M/mVW6Y
         SN9A==
X-Forwarded-Encrypted: i=1; AKwUvBwSbSZxymmYBL0GS1qKL2zFwMJBQ/WggY0y706DsKsxI8umsAjFGYRUvWa2CBBT7b9cDBbeVZT45qUm13eKaWTo@lists.infradead.org
X-Gm-Message-State: AFuF++lCYipNEDYikplrMJpUrYY8/PDZi6tYHfZLZn9tbIJ+PQwiaoq1
	82dR13zhndfpbBWtayucPpq8y/xdBxsoakcMqOlX0pL94vTclCA7P+p+LiPZztPnqTmLewGHDir
	AnudVk7muQWbB9TF4ttsokMA4E8cd+UM=
X-Gm-Gg: AYBFou3Qg8roqrTR9nbTRYgU4OA3VaAakU1e/VadNWr50/zCwNnsBfTD1IujT6t7NmA
	ls+k1oUBwG2GN61AephtSPfGRqN7Y7yCQaj1NbgtzbbMZy6lZ/hmvTZXA43aZi3zmSoMlQldW2X
	Jh9bihUuc3kDAQZwFDyBDKhEXAHzFFLd0f9fBRJYie9rN2xkS5BGc9iHDHGXNmaGf1/I3XSzGC3
	3yWn8Nt3I8s8Dju7ImIA0rWWbnTjo7Eko8EqnnjTqw0AFy9f0mP7YDoXPyoxXuEiqs9Y5WZFvsB
	CyATa1PwRefVULjVQdLcASAyDUbE10mVEPtufDbjgiFLj5r+nEZ4
X-Received: by 2002:a05:690c:9a91:b0:873:5bd1:98b5 with SMTP id
 00721157ae682-884b200e9d9mr29464677b3.39.1789240234520; Sat, 12 Sep 2026
 12:10:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260906061755.5103-1-sumeet4linux@gmail.com> <20260906061755.5103-6-sumeet4linux@gmail.com>
 <1a5fb9bb-d057-4579-8b2c-b81aa16a61cb@kernel.org>
In-Reply-To: <1a5fb9bb-d057-4579-8b2c-b81aa16a61cb@kernel.org>
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
Date: Sun, 13 Sep 2026 00:40:23 +0530
X-Gm-Features: AcwNN1WFgZ6qmRCXqz0Ywv_tzPCCXsJ0jqSiA_xFTFPzs4rsV6HyVJPe6GfuozM
Message-ID: <CAJ9orWRgatqn5gLx5+eDu7-T4s2PWcoVQPvuyMBgEp-KwDwkfQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] power: Use %pe to print error pointers symbolically
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: rafael@kernel.org, amit.kachhap@gmail.com, daniel.lezcano@kernel.org, 
	thara.gopinath@gmail.com, talel@amazon.com, hayashi.kunihiko@socionext.com, 
	mhiramat@kernel.org, mmayer@broadcom.com, viresh.kumar@linaro.org, 
	sumitg@nvidia.com, peter.griffin@linaro.org, myungjoo.ham@samsung.com, 
	kyungmin.park@samsung.com, cw00.choi@samsung.com, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, sven@kernel.org, j@jannau.net, 
	marcan@marcan.st, casey.connolly@linaro.org, sre@kernel.org, wens@kernel.org, 
	t.schramm@manjaro.org, bcm-kernel-feedback-list@broadcom.com, 
	linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_121038_438739_CFC9969C 
X-CRM114-Status: GOOD (  15.55  )
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

On Sun, Sep 6, 2026 at 12:00=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 06/09/2026 08:17, Sumeet Pawnikar wrote:
> >       }
> > diff --git a/drivers/power/supply/cw2015_battery.c b/drivers/power/supp=
ly/cw2015_battery.c
> > index 1bcb60cf763d..48643f7bf503 100644
> > --- a/drivers/power/supply/cw2015_battery.c
> > +++ b/drivers/power/supply/cw2015_battery.c
> > @@ -658,8 +658,8 @@ static int cw_bat_probe(struct i2c_client *client)
> >
> >       cw_bat->regmap =3D devm_regmap_init_i2c(client, &cw2015_regmap_co=
nfig);
> >       if (IS_ERR(cw_bat->regmap)) {
> > -             dev_err(cw_bat->dev, "Failed to allocate regmap: %ld\n",
> > -                     PTR_ERR(cw_bat->regmap));
> > +             dev_err(cw_bat->dev, "Failed to allocate regmap: %pe\n",
> > +                     cw_bat->regmap);
> >               return PTR_ERR(cw_bat->regmap);
>
> return dev_err_probe
>
> Instead you should use dev_err_probe and drop the last argument.
>
Sure. I'll do this suggested usage of dev_err_probe in different patch
series for *_probe() functions update.

As of now reverting the change for dev_err under *_porbe() function
and planning to post V2 for this original series to use %pe for review.

Thanks,
Sumeet.

> Best regards,
> Krzysztof

