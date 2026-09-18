Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1B8C982DD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 19:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2aZ2SRdSwMAy6l7corBl6TSn3cdYhbUcwCmUTuq+Lz0=; b=H24/BfwAjRjY985X8dNGZi0Rju
	eZJYy9qbRGkvEOjw4sMNw7uL5NCCQl4STiDeqiWFhWhNQLi3eFesF/qYDez1ROrtMkoghFqCZ4IT/
	a6/Lk6HS6i0CKFqDxS7b8Pu16FSyzGxdvXZWWVKUp12Gexv8sqwz4uQFgo8Q4AHiWrxd9sFQ6fB9p
	KY3lrxEV09DQne0oMYJo9IXtEA+uOiFZUpGEbYn/AUEbie/sSXpBEknS/uoYXAY8/i1NzDDTBfhTY
	Az2+ihT2/aZfU33hP7OOUgSe3AX8WCk20QMeznYMpGbmE4Gt57+zwWZTJfVyQ8Z2nzTTmJpTXOPHa
	S0V6br+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ed1-0000000FS4b-3YHq;
	Fri, 18 Sep 2026 19:52:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ecz-0000000FS4A-2xXI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 19:52:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D5F243712
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 19:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0215A1F00899
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 19:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789761129;
	bh=2aZ2SRdSwMAy6l7corBl6TSn3cdYhbUcwCmUTuq+Lz0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Gm6qzNfWy5SaEaZiWboTlhe73I5Y3sKUdV6dA1lzHfVwoETVwe+9hP7CmVBl37W43
	 X8HruD8sWl9SRDFkfNmCHKrzypv+Oh0peVFrVCV026JEEP8+eguYm8Yy+gakSLDM+e
	 h+m+fv9lnjTbvJ0rf5+NYRXRuQ5NW4+Vjc2dCMAq2MKfiznZQPeqnMlra/QJxE3iaC
	 KzUnoA71jnKCeftkRbab5KjOcfPHnTV4eVW8WJUJwQFgArkQpF4yQyg/dR7XURkReL
	 1QIjIi01Po7Ajp4zITvll8Yj5PdiraLijx4XpY+89UhP1uEzsw2oSatYZ9aWf2cc/X
	 F/+VsHDt6R/cQ==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1801fso1218777e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 12:52:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxNxnR5I+lfSLlS6hZ/Hc7E+kdG75SjjpxXDe9EThKV2xEJyJnEASZasLFmUhxthxSULl/TL1AdMRlEl7BqdxIO@lists.infradead.org
X-Gm-Message-State: AFuF++lfIHlaVnFwCprWZHf/Cm0AHuil/mI7vRlxmXLqOhL8dMTpVozp
	PkSLJlWg+Jd6P/lJEXH+9m39kzRTv2BQI7hfPM716Xq8ryGq+jh+nxHQnRahYTInb1/1OQjG57c
	5razddtJYrBNB8PdptV0ZEvE20XbCPzQ=
X-Received: by 2002:a05:6512:a94:b0:5b6:183b:d1fb with SMTP id
 2adb3069b0e04-5b8c184918cmr1248231e87.34.1789761127739; Fri, 18 Sep 2026
 12:52:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260914-ux500-power-domains-v7-1-v2-0-9d0c17e1f816@kernel.org>
 <20260914-ux500-power-domains-v7-1-v2-17-9d0c17e1f816@kernel.org> <aqhg8fCuVBqDvRrh@lizhi-Precision-Tower-5810>
In-Reply-To: <aqhg8fCuVBqDvRrh@lizhi-Precision-Tower-5810>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 18 Sep 2026 21:51:54 +0200
X-Gmail-Original-Message-ID: <CAD++jLm-_-a1ROYBYPo96Tp+qdUr2Ka=F1H0O=ngoqJ9wrqyqg@mail.gmail.com>
X-Gm-Features: AcwNN1VfgwBXDgi6e_-s2oKD27ppfBOu9eGlZ28XYdT8IngR0jAuGkn-SUSGs0s
Message-ID: <CAD++jLm-_-a1ROYBYPo96Tp+qdUr2Ka=F1H0O=ngoqJ9wrqyqg@mail.gmail.com>
Subject: Re: [PATCH v2 17/20] dmaengine: ste_dma40: Use power domain for LCLA SRAM
To: Frank Li <Frank.li@oss.nxp.com>, Saravana Kannan <saravanak@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, Lee Jones <lee@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	dmaengine@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Sep 14, 2026 at 11:02=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wr=
ote:
> On Mon, Sep 14, 2026 at 01:54:45PM +0200, Linus Walleij wrote:

> >       if (base->plat_data->use_esram_lcla) {
> > +             np_lcla =3D of_parse_phandle(np, "sram", 1);
> > +             if (!np_lcla) {
> > +                     dev_err(dev, "no LCLA SRAM node\n");
> > +                     ret =3D -EINVAL;
> > +                     goto destroy_cache;
> > +             }
>
> sram is used at many place, is it good to put into
> drivers/of/property.c DEFINE_SIMPLE_PROP to avoid set up device link by
> each driver?

I have absolutely no idea if that is a good idea or how to
even use that macro.

But Saravana will know, so let's ask him!

Yours,
Linus Walleij

