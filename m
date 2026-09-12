Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9CCC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 19:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frZxPsvBVeqqB8BxzOhZbWb1UNk2/xKGtRE4rwWtWZ0=; b=wgz4rpnIch2ycNzEbDFL9JZEg9
	P2JoXjC9IbnD2rYOzcrhQnySDs+nEQy1Q80qflXA1SUlxnEtAWWm1v/X6+dxeAkrXnRPLf4YFywDh
	gNkwuv4xcveipbmlE8WKYf5GN94I6dejgO/GCl/0qylheWsxiBKeOWFD3D4gJvpantihzFqhH9ivX
	Ns4bX7hrO4gxc1p978G/npL6jBCkqy6AgigRGAZaHVBjo3d/m85MUedPhAKYt/oyYsSCWyDI6Eqfz
	CClz9UzF2mpI4ZMvIw+e4FbLDmMxmFBtn9sw7O7CSbtlavobY82HeYyBp4AyB528ui6/cMTl8BHp0
	NF23HQxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5T4v-000000015UF-2doi;
	Sat, 12 Sep 2026 19:07:57 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5T4q-000000015Td-1NUW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 19:07:55 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-857ff9fef54so16191667b3.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 12:07:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789240070; cv=none;
        d=google.com; s=arc-20260327;
        b=JAccX6jtIdJlpo16RsHchinn3MJM5n3n3kj3l0eDAWi/ulzlAps+igm3HL43vNkESC
         J3wP2Eag9pKbGaSHGA4giH3tXYypGuPoDrr6nhl0t91sQm1sMwfAV3zNYzTMKFfB1j/g
         7qkFiE3Cy6SuMpW8CuuC8f0mn6Tcng4YVH6VJLzYqWH1wBimDEhML1bHMKNfgeFpOTDJ
         7o/bf2V96UYitv6j1vrVYUr3t32lKQ1sjNrVIGdIV3cSuy8jpxd60EM1VOsxMPan9C55
         P/uDOBEqkd04gT1cklqy4QPOesyd/X7VXQcRyYtWDZ2tItU7K1h+a9No2OgtqYBC+fjh
         O22w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=frZxPsvBVeqqB8BxzOhZbWb1UNk2/xKGtRE4rwWtWZ0=;
        fh=i4cu+CGEdUQygsjaBW4OYUEZY9+bChs7oL8QZUR0xjo=;
        b=hecVQqtKoYA/YWRGAotU+h7PcDhQ76Dexlg6wDlQTEFB4zl1X6R7EwR8XhgyfnUE9t
         xWyC+ZN9kgQshLjsAwA5BtRNn3a0Go7tBgJrvEQIwAsaj34XJCz4zyyTHvL6ePW7G+/j
         KFKzXz/9EUQUhHK/ATSyvaQI6K9CvAZzn86GMo1aALHfpWPKD05Avtw30KL+9dRj9lMH
         eOP39iwTzIoIZ8LzDAgzChgGWy6pifaDaA5KpIwVuNisZV12OKbkf/1vO+N2iUIUnzuy
         bEDmByRl2FWVsKlqwfUTJVUpiD1Y0MhpUeik6ni3NKO1DQGud1OJYZ27unqCvsnafidv
         5H0w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240070; x=1789844870; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=frZxPsvBVeqqB8BxzOhZbWb1UNk2/xKGtRE4rwWtWZ0=;
        b=qCv8c04Q4NbLcBTBB8PD1Xnx+cnTZH5DyLXZdQReL+VTB/x90uAblpll1CHIe87Rvn
         c4LGBNbn80UqIg0A9QYb0jBAtN8MAIm1gEtUqKgVtS3Je08ZvsGWV+kb29Sjgk2T7iOM
         SM4l4+ZpxjCRkKF9hEfzGiuavifx6lxAOdAUrR9hbMCZdFezlWeskwJb8AJBtY5TXNEF
         ngEO7WroZ860219zZqjN6NIPgAEETUfY5zz85mE3KaZ9FS67ZxT6PuKlDD7cWy94jJue
         sDOC0FXRExUM88bqpMlaltnmB3D7/aQqq58eLMdbRa9anFiPmFfJZecRDUAgSDhvKLQb
         Ir4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240070; x=1789844870;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=frZxPsvBVeqqB8BxzOhZbWb1UNk2/xKGtRE4rwWtWZ0=;
        b=boJKqtodyeXbSj4vQ4cItQhcxE31lgDURpJbcESSsdTVLAg5yJrHReWthv/t+kbvt7
         zShpKgBfABAl4Mf4Ddp2ajs6TwDN+hd8DmAxKfPbBlXRl4EF+XC5LCQ2sCHYopuifAFm
         j7cLMV+LG/Etka3sOY90X0ZvLfZSjz6LYiOLgCmKvK+YeBGhVqtKF+HhXhhzlD1c49i0
         8t3KbsNwxb6aGiF4DAXh2uy+4NWTQx3B3yXRpl2dYoBH5O82yiPjiTKDOVIqUvFhqabM
         ISxIm14UVjeDIebGClX8l/ntwyzqp7ltxIzhAiPsDA3ioVT6K+0YJiBHLmbyciBPDT7+
         MqTw==
X-Forwarded-Encrypted: i=1; AKwUvBz55UBSOtMpNjJeImUa8nQtNtkDLJkxwkfRVrQ27EufpaH0mgr0lOGifFAOo3Esb+VPkO6V5OVEYXoJD94jM2H4@lists.infradead.org
X-Gm-Message-State: AFuF++nLAM3vZez/UoyPb8+wBn31/GRuA80+1uRLKA3TYc0f91PylvAD
	ee1VzOG+4o4UEz99NzIU0vXUnJw66qgGRRQadhFmKhWc7xz0tZPLUfzsdSBkXdPv1u/3RrMdbTH
	aWxoyQlbDW2K5IGAP6HtANCJcgAa48Xo=
X-Gm-Gg: AYBFou2TBlnTumSd1ExHPR3BiwnnipRD13WIxwC4PyPuj9oT7jonstXBe4SXyIKcqIA
	tQQHceI4V3UqgrcWy2RFqnYCoEOMV5odz3Mhgt+/r+8/E1Pskllh42az3XwrSDuk9Yzg2MmWo4R
	e0gm1X9aD56f7D4fdWzcEAJ3onjwxYgkNeSA1YPDZrObMuxs9aTdbGU1FEpOf1XCk6IugQOOy3l
	l8U0SsPA3mz3KOsPezNvH1oralcswMHbvVnLzQVaCpPjoebPO3QA4MiJoSV1BkJT1tcOVtlEyuR
	2Mv7GbzpWJYg+yZPstPwsg+TvTQk/VPvnA6T/+mhKjTA+ngtH2h7
X-Received: by 2002:a05:690c:a790:b0:873:5bb2:6c0a with SMTP id
 00721157ae682-884b6f29b6bmr21177167b3.52.1789240070580; Sat, 12 Sep 2026
 12:07:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260906061755.5103-1-sumeet4linux@gmail.com> <20260906061755.5103-5-sumeet4linux@gmail.com>
 <98a0dbf7-9724-4ccc-8810-645dfe715656@kernel.org>
In-Reply-To: <98a0dbf7-9724-4ccc-8810-645dfe715656@kernel.org>
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
Date: Sun, 13 Sep 2026 00:37:38 +0530
X-Gm-Features: AcwNN1XqTP8GoNHaMkR4dokovXZ0UiUGTDkYaF2EyUFt2qLbm2siHwKKSL9BVhQ
Message-ID: <CAJ9orWStxJLN-0Dk2LqmyxEagC_nH-veS7wWrN_kXvb6WEUWiw@mail.gmail.com>
Subject: Re: [PATCH 4/5] devfreq: Use %pe to print error pointers symbolically
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
X-CRM114-CacheID: sfid-20260912_120752_408437_6DC527DC 
X-CRM114-Status: GOOD (  11.70  )
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
> >               ret =3D -EPROBE_DEFER;
> > -             dev_err(dev, "failed to add devfreq device: %ld\n",
> > -                     PTR_ERR(drv->devfreq));
> > +             dev_err(dev, "failed to add devfreq device: %pe\n",
> > +                     drv->devfreq);
>
> Instead you should use dev_err_probe and drop the last argument.
>
Sure. I'll do this suggested usage of dev_err_probe in different patch
series for *_probe() functions update.

Planning to post V2 for this original series to use %pe to print the
error pointers symbolically, reverting the change for dev_err under
*_porbe() function.

Thanks,
Sumeet.

>
> Best regards,
> Krzysztof

