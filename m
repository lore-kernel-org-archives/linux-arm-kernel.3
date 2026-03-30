Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9298DFB3D00
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 10:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nzbPas/zVRhWvMIP9KSmda2kkwwqeTULljeMJhCNvcc=; b=S/GlMQdw9IFSKlbz2RjdJhl9rU
	vR5yTZ7x5p2qXZ12e6omhjhdcIoOW5nmFe1JhDyjTLvKmi0xjfU7jrFqoeW4nxgNMVIS51TrG7pug
	JNel9qq6h4OiBse7Xt5uptqU+c27s+B42qTdW+XhGvg3b9uzaieypCPF7wTEp4q4WSGOUr76+Q167
	Ntk4G0cC/LJFiM/lTfxP6I8Z2MAbMdbgx7O8KwugIt5CanoxTgUEzyaDYAFURMV046QbDPV+M/GQ/
	vaIzYVGJg6iow/9yuSQsclaPwyQUGLgAIc106DfB7i9syidKf2b7SJ506/MWU9gMEj2WZJYJM+ORY
	39lOTPtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7AF7-0000000B6f2-0bcm;
	Mon, 30 Mar 2026 10:53:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7AF2-0000000B6eC-3rbq
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 30 Mar 2026 10:53:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nzbPas/zVRhWvMIP9KSmda2kkwwqeTULljeMJhCNvcc=; b=q60t7vX0vRveiIk43AZuZfHioI
	1RDnbvsw8ZqjocY89wMo5sYKvXKcUoaX2bFPb0OlgYg811nbhw7+RLKv6g050nqfRmInOFjBVxQ3+
	+W/+WY857k5xo58jwGCF9V4aVe7oUGW0EgCp1gmNeXMxy/SS1DQzgi75YXVLRj3l5VcvPjAwWqUCL
	WL5sQwiqulefJWKfFZmUqlyHEOqHfgkeBKmhcncF4Pl7nN5xI4AVqKjPD+2lX7UbvwZTMyRc4oCOq
	Os0USiMN6eid++9Rv6lB0JVYvY42qzrM8I+H+edYlGbaQD8i/rOxhgUwRv2/1OTm4j1Dcm+hrZZBk
	Oig2TYsw==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7AEz-0000000DdXD-3zTR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 10:53:07 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-439d8df7620so3076317f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 03:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774867983; x=1775472783; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nzbPas/zVRhWvMIP9KSmda2kkwwqeTULljeMJhCNvcc=;
        b=s/RoLG/fbU98Gycx5eXmKidcmvFlVnhquH6hOwuu9X/hzgQ3JwoCgmbvieNP/K7iz0
         TcDu40YvM3Y98R20lO6Qvbl+k/CbQblvLMh8y/mXQJGMXtCnkfvwGr8/TrJdQTDlrZD4
         UCMzCMh/WzJWLUgtR/EKl1A5YFVMV+LiK7mKSIVOZJYgfE3pbdHZwlLsuc5/EENpjv7/
         eC2aI1XwrfUSzN6PoFhSQXYHzNm1HXDvg4leJe5JD9Jxt8um1v/0Q0WNHKni642Fzuh2
         dGXQVOvpocLE2m+XcTA4VRq5BoZgxDnMuTmp3CCHVp3LvO1yMWkTD4a6KSVC9kbCvK9u
         4q1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867983; x=1775472783;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nzbPas/zVRhWvMIP9KSmda2kkwwqeTULljeMJhCNvcc=;
        b=ioSvxg+jIHw9DPVxkOPG+Gmn5gq7BqFnntgbjVZEK49/aNjy+ahjv8RFE4wA8CJgoY
         A/cNyQQtcv3zcPCwDDQSc30B0jSFi0q+V1ujccZCNiA/l12+s816oPVCeRYqDm4QQDug
         UZG7ijDXjcNqTPSa/pqa+B+58GcxdVzAptdM7J8ANftmmrSKndBj/QktOoPxJkXB8O7Y
         NjLmQ2NeWyQH5VzWjUt0T8vYXhhEnOSt9Y7Ob9cYTV+spdTPrVMOXYrLIiKKeDMPo7BB
         fpNuglLGZIl+hUyHvRazZB4eNSRGv+CB92JWXJNqIaUtuDD1H6WjdM1bxsd57WnSTlrM
         7YGw==
X-Forwarded-Encrypted: i=1; AJvYcCXswwFh3bUKqxdxNiks3Ij83kLRKP9rECLxoFbgWJ3N2Aar1QNMxhc06wkuP/1kZSGRdItYoocotWJDJx5c9D2/@lists.infradead.org
X-Gm-Message-State: AOJu0Yz67uyQfTMGq1JG8bVgVK7kIvgJ3oyYUkjozC8SuWdQXlQ09OEk
	NZwiXbXZqwCkf72ivk5b8ER4LjQgvcP1CYEler/sVC0gvPoZTRPur49nKrjuBG5eBK8=
X-Gm-Gg: ATEYQzx+FoY9v9JWMQoNfZHVrtYIJ0AjA03Vy02yrHte3I8j2XvRjeUxNz5mQDMania
	wxgjiWb5O/RwS7E9pJIhJDXClihdaoe1F5UCRkgCht+FOr+Kc5yJqWofj6Uy1JQ0eFifHlz87s9
	XedqY+twiybRDKR/QD4AuuIDSwqNTJ9i7c17BnlLicFZJM6DIkbuxPxHgDonxDBHizlHokWDicx
	Tj9L2hPmflqUOGAMP7XUAYIG45mIUW5aS0C8xxPm15cg3LyaKruqKXrj4I2LmDQrTO4bM0+B+zh
	/7UIOtmmP4Jw2AH3My7WZy9vL9V8kINnIiKgV8bn1DWjqXgeJkkW4EMK7EyPmgbHD1Ftlz9wv80
	vCRBbGM96GJZwHmo2Nvb9RFZyIyf3xqqlxjeeIP6HPuiwqJlI1/q32Iuhvt1wdCFD2wUGg774+R
	oQdrd4xIH+8AgEfzFpnRUGVqr7WSOh
X-Received: by 2002:a5d:64e6:0:b0:43b:8fa4:1937 with SMTP id ffacd0b85a97d-43b9e9d5ea1mr20787372f8f.5.1774867983379;
        Mon, 30 Mar 2026 03:53:03 -0700 (PDT)
Received: from draszik.lan ([212.129.78.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf330872asm16354366f8f.17.2026.03.30.03.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:53:02 -0700 (PDT)
Message-ID: <61f4ba09a77a255008078a8655e8f4791e4c87ff.camel@linaro.org>
Subject: Re: [PATCH v8 05/10] pmdomain: samsung: convert to using regmap
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Ulf Hansson	 <ulf.hansson@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown	 <broonie@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus	 <tudor.ambarus@linaro.org>, Juan
 Yescas <jyescas@google.com>, Will McVicker	 <willmcvicker@google.com>,
 kernel-team@android.com, 	linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-pm@vger.kernel.org, Marek Szyprowski
 <m.szyprowski@samsung.com>
Date: Mon, 30 Mar 2026 11:53:03 +0100
In-Reply-To: <177409897341.266364.2957933304869869135.b4-review@b4>
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
	 <20260318-gs101-pd-v8-5-241523460b10@linaro.org>
	 <177409897341.266364.2957933304869869135.b4-review@b4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_115306_310839_5E63A885 
X-CRM114-Status: GOOD (  12.96  )
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

On Sat, 2026-03-21 at 14:16 +0100, Krzysztof Kozlowski wrote:
> On Wed, 18 Mar 2026 15:27:50 +0000, Andr=C3=A9 Draszik <andre.draszik@lin=
aro.org> wrote:
> > diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmd=
omain/samsung/exynos-pm-domains.c
> > index 5c3aa8983087..68b1e7ba8729 100644
> > --- a/drivers/pmdomain/samsung/exynos-pm-domains.c
> > +++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
> > @@ -120,9 +140,26 @@ static int exynos_pd_probe(struct platform_device =
*pdev)
> > [ ... skip 20 lines ... ]
> > +
> > +	reg_config.max_register =3D resource_size(res) - reg_config.reg_strid=
e;
> > +	pd->regmap =3D devm_regmap_init_mmio(dev, base, &reg_config);
> > +	if (IS_ERR(pd->regmap))
> > +		return dev_err_probe(dev, PTR_ERR(base),
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "failed to init regmap\n");
>=20
> PTR_ERR(pd->regmap)

Thanks!

A.

