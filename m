Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F214C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 20:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jfIx/dOVNK3Zui69zoqhnyuZ295+o15UNvhExnoCsjM=; b=I1SqJq0eTOYi4dfRWJoeD4cw+L
	wehZA+xxQ1zt13Mvcuvb2JxIKQrOMWAZNJSFXQ6RMFITxwz6A0DZHOmZ7Hddl95KaEXn/tW3qxEhV
	ddfdesTH4SEiWWfoQLjvlWdUbo1yZzYYjMKiflX+WTcr6zm81UOIpZcPzFd63gsjnG7tNeVkmlw7+
	uDPzZkBxWNnIJFkuckFU2hMZXd0A0o3Y+dAId4m/DCYKiUl3bASnmH6LDaC9PRQlonWFft/CQr/S0
	UR0k9rT0BtPFA/f36bBYh9+1lBawysMGaxbar76CLkgKM1OMjYgeuPW75oJcbWEyObxpZxDyLAh0O
	2W7GhUfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tudi8-000000072RI-2b8G;
	Tue, 18 Mar 2025 20:38:52 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tudgS-000000072M6-07Ad
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 20:37:09 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so247065e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 13:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742330226; x=1742935026; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jfIx/dOVNK3Zui69zoqhnyuZ295+o15UNvhExnoCsjM=;
        b=MWkmo4kL52p2LptvrF8cP5AtPL3NRaQ45x2onbtDMHFYGzQIQETcJJNk4g4Y/lZ+7v
         F8VvHNm3kqe6IfiG0MjpEOD6DqzsT8slUHGLAIMvt8tt28mh00ZU6cxmkT9b122Qrv6T
         6P6qjMqvfzEp86lqSbEd8PrCg4xuR6wr47NOY8AT3ToSVv/D77rvuQK7F9kztCsIqdRU
         rwRJSIXPhR8QiQ944kxGmGMVHCkbvbrnquTW93HQTU+mr4BmGBs5Gne/J279LZMdcTJd
         TIkV3J2bv2FAt8tcXkVNNJ4J/SYRoL80WX4Nh05FTzecqKXnZjCoddjBu2Hqey94ZRo1
         r+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742330226; x=1742935026;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jfIx/dOVNK3Zui69zoqhnyuZ295+o15UNvhExnoCsjM=;
        b=KX2VqN8UYqFoBGtlT0owf4ZAs86DP1pDE5VJ6JmbsHfvj2wxnC3TT5BaTwJwP8T6Wa
         YR8DviDYavGXl4C8HAIKwmwemXKKBovur7WTviIn159jBff3CftwGQ59QOm5v2KCzkQt
         hR+8pyUJD+EnSoitSAkS/n+lBK+0QsH6EUnmGbDY8+/yeunFQX0avB5qfliLJjVnfTPy
         8cyCmhwKsoHWQyJJ0VBjuTFWwHhHBCSHBkLZzxCxW/IqGLojLcdT12hnXanF4/bqeXBE
         nyKbggH2PjpGf/yL2z607/OjgIDgLuH8+KX/+Olg+zDvlYQl/Urn8K+hqlum9r9PxyWg
         Dk/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWNGYJevEeJXz18U+kJ24ACG4InfdYesADYeoZBnTUY8nQk/AniqUw3Czqo2RnYeIyxgh4L3mCpo4raVN2T8Udo@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1L4+O/E+1TI5LPfKKb6gt1YyATXMIGhNmbKvvDSMlHPmA3tZv
	6hT8gKknjtNSJ9Cn4RHRhoVGDHqIF1M/rbJaXuOWncZfwYv0j83no/Df/NPl0j4=
X-Gm-Gg: ASbGncujgx/OsDvKrO/FcSCheelOZSL7j/NVWmvYFY42wTGFK+1KD5ijx0M4oO64R51
	Df+UPGbFjlnUdiMUbTQTL2kbDhyP/4FkCZuW/gYMkuR4En1fZBq5+ljVi1tRzEPy2evcdAg5xH2
	atoXeed06dgxMWAYSSRhincSqiUTQ5f7sMyXRM+TADA/NLaX0L32I3SS78eT8lUEyYEXFwiA726
	+KXxJ13fxaaVooOXZMxFCayEuqb+PJtMEEyEpznzccr//uh645+6ggSq4E+/cL5u2+bSatfejDV
	9q+2Ewbi3Xi7WOgXKAsXB+A+LoKSemAX642/kaqnFAdU2DZ1
X-Google-Smtp-Source: AGHT+IGKaVnWmA6ubAmSh6+AGtDNLhVaSjlQLGrz3oxVZZzlKeEgo0GAHVg/nYm/WzGxiXM4Eel1zA==
X-Received: by 2002:a05:600c:1c9b:b0:439:4c1e:d810 with SMTP id 5b1f17b1804b1-43d43034b2bmr1001245e9.9.1742330226048;
        Tue, 18 Mar 2025 13:37:06 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d33f5771dsm54780805e9.38.2025.03.18.13.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 13:37:05 -0700 (PDT)
Message-ID: <2d38d2f242bbcce452f6c29f4ee79aa9c5703b7d.camel@linaro.org>
Subject: Re: [PATCH 3/3] firmware: exynos-acpm: convert to dev_err_probe()
 in client API
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Tudor Ambarus
	 <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Will McVicker
	 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski
	 <krzysztof.kozlowski@linaro.org>
Date: Tue, 18 Mar 2025 20:37:04 +0000
In-Reply-To: <801a9754-cd57-42c6-9569-16d9a99bfed9@kernel.org>
References: <20250314-acpm-fixes-v1-0-ab03ca8e723f@linaro.org>
	 <20250314-acpm-fixes-v1-3-ab03ca8e723f@linaro.org>
	 <801a9754-cd57-42c6-9569-16d9a99bfed9@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_133708_080760_DE661320 
X-CRM114-Status: GOOD (  19.97  )
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

Hi Krzysztof,

On Tue, 2025-03-18 at 20:23 +0100, Krzysztof Kozlowski wrote:
> On 14/03/2025 17:40, Andr=C3=A9 Draszik wrote:
> > dev_err_probe() exists to simplify code and unify error messages by
> > using its message template.
> >=20
> > Convert the remaining dev_err() in acpm_get_by_phandle() to
> > dev_err_probe().
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > =C2=A0drivers/firmware/samsung/exynos-acpm.c | 10 ++++++----
> > =C2=A01 file changed, 6 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/=
samsung/exynos-acpm.c
> > index 48f1e3cacaa709ae703115169df138b659ddae44..03f907a95c6acd66d89cd8a=
f2f52e7c6dadf492a 100644
> > --- a/drivers/firmware/samsung/exynos-acpm.c
> > +++ b/drivers/firmware/samsung/exynos-acpm.c
> > @@ -701,12 +701,14 @@ static const struct acpm_handle *acpm_get_by_phan=
dle(struct device *dev,
> > =C2=A0
> > =C2=A0	link =3D device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUP=
PLIER);
> > =C2=A0	if (!link) {
> > -		dev_err(&pdev->dev,
> > -			"Failed to create device link to consumer %s.\n",
> > -			dev_name(dev));
> > +		int ret =3D -EINVAL;
> > +
> > +		dev_err_probe(&pdev->dev, ret,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Failed to create device link to con=
sumer %s.\n",
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_name(dev));
>=20
> I do not see how it is simpler. Three lines (statement) is now 5 lines
> with two statements.

This was part of some patches converting to scoped cleanup, and
there it was shorter. Shouldn't have taken this change out of
that context...

> What's more important, dev_err_probe is supposed to be used only in
> probe context, while this could be called in other contexts.

True. dev_err_probe is nice though in that it gives us unified
error messages.

Happy to drop for now.

Cheers,
A.


