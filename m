Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04FF9CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 08:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XT6w4vc0Qoe3DQquv1ih38xI5xPmjmTxa5U+zj2Fats=; b=2o6g0Sz+pknlZXHgiA6EjdCffQ
	+cLFIVYH/otfPrWKBk6P1YSh21DLanHPtps3U+BRCrDIjTCJ2gfYaS3qf1QcwpXMLSlmwlq+y2+Qt
	GTOP7w2H8sNhd4rsJlsmQcro6Zt8rGMS+9HgLgx3KmP1OSG1fa2HJXqNCK8awRnCg2CIENmkWfJ3g
	WMafLjGFtIS1sEK7oLjK4AK1O6F4Wgrr6WEmvapPsyvIuno7VcjEFeiW3NnRsDBG/hvkI5hy6snky
	TrjrTni5oD+Hycp1Iaip2SY0g2FewEICWR76A6p+NeS3vbQOUv3UdhiPdJBT3HApsqGRPSAchzZmN
	RgOcJpmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSsAr-00000006vIl-2FHM;
	Fri, 29 May 2026 08:02:33 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSsAo-00000006vHP-1Xvv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 08:02:32 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2bf22d29dabso2848565ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 01:02:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780041749; cv=none;
        d=google.com; s=arc-20240605;
        b=E80xJvLdTylY3p80v4oZsiSzXLEvxSG2cPmK1oI1g1pZinDNVF5sVwMAXVpMGRVpem
         7fktMMBOGbQeKrJVdB9sxbkFxsz/9W6BLH6ABEbSSSuDRDWKn5AXAX6qT8G+TjDkov+Y
         VAmh97NDkonlnbwQLCwwY7eLKZsFtPdrsuoCqeKXI9ABajhvnA9m2RJToTsSseFvxJx2
         MIq8MTE463b9DMeoDs9H3uZN4uqnoMQ6pWKe/vpAWKqMw6qa/4rrsWbB5vmgQ4g0znCK
         f3f84KYGFzHSr6sFQQgMINSL132U3qJPCcveSjKSlQl5aErMti2485A0BZD1f+5pw5b0
         3UIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XT6w4vc0Qoe3DQquv1ih38xI5xPmjmTxa5U+zj2Fats=;
        fh=RCj+ofD6cDRxFXlHJ87CproW6umiH5RyuncQz/DDI1I=;
        b=VUy8VPgbPE5Fu7SIpswO6AlmFbUrHawywL94tUMabN17spmuh4xuvSz90SDunOIZGn
         eaqvU2zgVWNDl6QvVlNmcsg6x1cjDGtalAc6nzUkRGB5Y7WTDPRzdNFaSOloWyKY+dDW
         rsySBibw4OSvKaa4zxGMH9XHO/khGbWoKnUY4apIcaeEr8skzLAqjMkzHeARXxojQz/H
         CT4prLJO2PZRr1CIYMUzcGfYZ766wENrcBfpmSBmSLrciCRk0VTKJu5/nNKW59XOkUNO
         7WJvL+xgCoHohOjueWDpqdQnbCd+QLUP/qkotO6GOa2x1SAbYnJPnL0rDijjTYU0N9Fg
         uL0A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780041749; x=1780646549; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XT6w4vc0Qoe3DQquv1ih38xI5xPmjmTxa5U+zj2Fats=;
        b=njEQ814Mff7yd8+WoMZITyqiy+IkM7EHGGvme5x8t2NXtAZDm2MA1OfqtCugAWFy6a
         Qk0j+qB5Lw5M54UlJQJzr4U3Hrt8FGuBe6zpRLEVXbhU+eaWGpbYfEjlNvGhXSLH4xv+
         MBKeulUArJ0WAM3b4QkU62/UoE+a81KeOLfoDVF/FrP3BsxgZ8Jn9DDfLKC4MCfgwkqv
         bzueZpkx3eCTAHkeOMEcyac1o3YjmHe3ylTJ3YXmAKZnn/PVkWZqx9h1jFAw57kcNmnO
         0vO3ZGIh7yQQaPTjK5xhYPs4YWT9x9IZN5ywNFAnwmULdLyS4BC7YWTyysoj8bofQfgP
         K9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780041749; x=1780646549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XT6w4vc0Qoe3DQquv1ih38xI5xPmjmTxa5U+zj2Fats=;
        b=lYOGNcaHuzhYE113wcej4a8jH9cTQK8r7DCzZMp39phGrx9aO0ISmYhI0tHHZyWkY+
         XaPR3YrQwUxMhSh+mQnqrmliqczMqYcD/6aWRUCZbC4niWXYe+rNvJ3ok+2LC5hdsoh4
         dRopEBs/7/anQ21RdPwC/y95k071tQ+4GI4H2ngeUgsgFVYnlBc3NYk+fgd5D40e4HE2
         PyX5Kh/JNjMT5mogT9BYu9aX5WZrwQ6Sj6QYjcmZOzTZhZJbVgVq0ir4Rthcyjsb/NuW
         wGp4bO2GQ9uEsiX9N82AvW8Eaedmy3HVLgMdDLfvGOzPtjjGlFw0MoLI4lr0sg/bVkdx
         kbMA==
X-Forwarded-Encrypted: i=1; AFNElJ/dDDvB8ftTYNUPlHuu6lYMP2S4NONoubV2T/hnJ/CnUCVSz+g+z6Qem9XpDlhpEorWAA0o07B/UneMZVRkZw9Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yxlumuj4ZeNxJg0+HG+bRyIYHKvukC8byVrn7IplrK6PRoCFhUn
	x8gtHmBRjJTndoNzvr+OD6D+jDW2muZDktIYY9+2QdQL1Zcq5k7RX5xklsNithIdN+k4wntkzcs
	nMyackFLQbgxo4qjuhobufpvLO4VwN7Q=
X-Gm-Gg: Acq92OGgQ6y2tawciKuExLQeX8UFzzJHgS90VUpl7zIDeQ2FDdTLNkAN9S2TehDMEh2
	/UVXsoGtzZmAUbpqODl9IfaEMQHteU8TQ8V/W0rvirClz4UekSQU9YRaH8GMtukvj01hUKulDss
	lfmaUGQnyf0AhNBbZPXJnsnyM2WVarc2Nfkut4K0uTSGMqNM4A7XvqlUhQoqSl6y/E4fJR3D/EE
	c0pUdfVhVTN4kzBNeeJVDQdO0XvckImimI+W32cshKYGcip9Df+hdM4XsIrKXoUVO54NPwtDJ3F
	e1PyojaY3j96A10rLK4=
X-Received: by 2002:a17:903:fa5:b0:2ba:6ca2:be0 with SMTP id
 d9443c01a7336-2bf2053340bmr25566605ad.4.1780041749021; Fri, 29 May 2026
 01:02:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1779878004.git.u.kleine-koenig@baylibre.com> <d02f55dfd5bdd743ae5cd76f2a5af0d346226a68.1779878004.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <d02f55dfd5bdd743ae5cd76f2a5af0d346226a68.1779878004.git.u.kleine-koenig@baylibre.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Date: Fri, 29 May 2026 11:02:17 +0300
X-Gm-Features: AVHnY4KLQby2GKgYCaNbHrRuPj0X0-ETK3PqgCK0q7F1iL-UnUKeln5tOfAvRio
Message-ID: <CANhJrGNyB7aqMhR5DiLXd6OPmsE4Vox=K7UwMPZ1ZZc2-Ciw3w@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] regulator: Use named initializers for
 platform_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Karel Balej <balejk@matfyz.cz>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Samuel Kayode <samkay014@gmail.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_010230_415403_7CE2BEB2 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

ke 27.5.2026 klo 13.48 Uwe Kleine-K=C3=B6nig (The Capable Hub)
(u.kleine-koenig@baylibre.com) kirjoitti:
>
> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous unit.
>
> While touching these arrays unify spacing and usage of commas.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>
Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

--=20

Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

Discuss - Estimate - Plan - Report and finally accomplish this:
void do_work(int time) __attribute__ ((const));

