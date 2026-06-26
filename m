Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72A6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 19:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WHIpLp9HI+rPAwCzsNS6avOzV6ru9OowfuhFK1lFRb0=; b=ctFtF17GXBnyvLM/Z7TGHAN5zD
	bEsGcDMCcVXZMp7Fkf1M/Aj+ynMO/8YebNlcKZscPOYeUigJEfSSaN16Eylwf1VYHF4TR/8GWsnU9
	s9Xbi9/XOt+xVVvugfwNmMqafaL7ySKr1x9ZsSWb817KBAoefNd8EdZsW1c1Fc8mGpBB2IhVkOCZF
	qUV/Bv0JzI18jN+yga8WL7G4wsui0ni12e5UB56t9LgvVzHIYycimfqFUfrttQj7dWt44sShhkVXJ
	nQEWlKin+pwAydgeC5EdUN8IUqL9hVn6tCW7NsCw3O7Ydh7jC7Qq9DoBtUK6ELGEHY080EH1w9FTC
	wGKRBtpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdCce-0000000Bo04-1GO0;
	Fri, 26 Jun 2026 19:53:56 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdCcb-0000000Bnzj-2djO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 19:53:54 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-1363fe80fe8so2839769c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 12:53:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782503632; cv=none;
        d=google.com; s=arc-20260327;
        b=pE7k+RF71s8z//sMwcQnj88NQVjO2MmQ0Wl5q2cr7QOAus+WunUtMVOqmhWJ+d8Fes
         KHQFEAgordS+ljHRoFjSQYxh2eV4+mWM0uCdf50uVtkkqhxqcPHD30Cad0xbTrPLvmWv
         nXDzlbWhz2beZ/oymi0tsMJhpZhnFX2ZpnZpAsUnljZgV2NFYFHa6LgJCX5zZTq3w660
         kaQ+u5zpRo+BvHXd12DZg5CF7dBWq2bI2iYSdCpHtnGxBFn/9HQdsW0GbZ56tEBpPa8Y
         Ko9mjKIS4k3/Cgxbr/tM9oOGw36zA1ctMx5D/4tVhDpEwyQJnCC/mZhDOHoL+hBopguW
         5ZFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WHIpLp9HI+rPAwCzsNS6avOzV6ru9OowfuhFK1lFRb0=;
        fh=MSuF6+ceMPxILic7Nn1PjsI3mfP2OSfP6OfKVYuPXvg=;
        b=bSUj+mLokK8QFU0MliKVd9OyfPHsvFFaAWCAqtq0hUrE1FW56jocwhyA9w1XQH0Kfk
         2OnBMMOfKuwkLUhEWGkXNNldNP/K4V4wtMZLw86RDUWFz34u8Hoj6/hHytBGF9lW4uE6
         fI6b7wfjxdDWgrThrm+OfzlFyP0VaAwfB675XER5mcuEaYiHCoxg2OWlBrIP2RZF1/Ja
         D4RR4TLk0BgR65D1v3DY36V7OV5aNJ/7W6NcWx8o2tt68rhSlaMPMPdIAp5QCkKVy7i7
         hxqXLSlM+jN2XPRNteqAkFVoZ3SaFQDjfuq8UlYMOKpf8z9GU0EB085mMR4YZQJk5f/F
         yR3A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782503632; x=1783108432; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHIpLp9HI+rPAwCzsNS6avOzV6ru9OowfuhFK1lFRb0=;
        b=OUrO3EfLONJunimmoNUNRn4kSRq/tQz6cjrh3H3lQbl4AXfGeyixoTJueRXnud8p8+
         8rM41LwwBDyqVeFk2epbOBjUhYfNbAt8lV0rJAT2jAe5RsXPx1X1huNUQw9HzctvMbHb
         AMUBTRjU4IstTerY7by9cmZ4F9jmViixmWLP5c62IbPAtxR5s966DFUfVu9G0QRyto9s
         HfmJ0lB1eWblD0QRvKzlwqmgv6nCN3nxeo6QAYgQNXIi24j6u6bL3GhaHQfrza2rPAcR
         qan5ArkZ/gkeq8CN8HepnUwGyl+6a5+l9/+23rR9vOqtIIjuTXCC11iex7D03pZlTpf3
         iY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782503632; x=1783108432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WHIpLp9HI+rPAwCzsNS6avOzV6ru9OowfuhFK1lFRb0=;
        b=IZkkM/M+0IhAPx6q2VMqg+lFUH2AaEZvcsfNMCUDieReU+IjUr3GnLZjnYQm41qz8j
         ae5JK/XZ+NgpEfaRxDfH+pq8YPykeeNKU2vTc+I1GmbUiIU9M2DrZTczVu4hMlN1mbdx
         OIfo27Ki4dfP8/29gDLH6QopJKN781KMDPpnWgtmOE6PBFHK3XSsoXPPwhn/F4mNsMWy
         0ou0w/Yl8dwTPI//7qrx+z/nGOLpNSa1mGWa3Gnlz0OJd/OCI0Kt8DBrOkOGP8bQ0jMj
         CBZban44kgUcZ6gr/Tkbza86qDnAc7fM8+VfVKMV7lSkBSTNGUCRHMrMv1CzTM44Xs1l
         xoQQ==
X-Forwarded-Encrypted: i=1; AFNElJ8qWodj4iBiqZdfuylEdfixNVQONzP7ECQxnrcwD1Ipj4FcjXcliwbhOdrgtV4te4UfawgBcZx+lFNLguE0eO1H@lists.infradead.org
X-Gm-Message-State: AOJu0YwYl2iIzQ6tugg3fJIRjgOa+WKTkuTrWaXtH5yPK9DtLv+waJeC
	le2KH59UDDiw4wDpV2TQ0T5klT4toK7cEzNjsWSztFpkiZUJvP2aYYTLTmRDpaxk7kCOsDT/ic6
	oDLETPlFArkZSBZjRyvjsugEfxhyfx7A=
X-Gm-Gg: AfdE7cmZTFYDfgdY6L1XAnO2Vvbp3xB6Xt5/qKsI2GmvPTQiJwDiYRRBKBZbMaXpn9R
	Br805vI6kkSHDqz9JeY2D/AlPErP0XL5EGjkNIf/XIpGrUwFvYDsDDFL2sZKyX3ZHl3Lm2X719d
	6qmS5tFs3CshoNq4WLFmtTVh4jEHyXY0sd4LSecxzpmduEqxSX4sgES004cTiVtPFLAKWLyN3oz
	PlH1aSmTbPotI/wCHypheFoR8unr5OU83OSDcnlQeKMpWKPqUPK1mb5C5k4gPRDoBVTMzch7Iyp
	pzF30y2/T+sZM72irogDzB6f8RlBpMzObwZkLW56JmBi/qGxwifLPJYiqrP7pLQ=
X-Received: by 2002:a05:7022:2528:b0:136:959a:abf2 with SMTP id
 a92af1059eb24-139db9e5eddmr6574649c88.2.1782503632436; Fri, 26 Jun 2026
 12:53:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260624100326.413699-1-piyushpatle228@gmail.com> <aj5MNiKSCiEDvDzL@raspi>
In-Reply-To: <aj5MNiKSCiEDvDzL@raspi>
From: Piyush Patle <piyushpatle228@gmail.com>
Date: Sat, 27 Jun 2026 01:23:13 +0530
X-Gm-Features: AVVi8Cc8J5b8utQLMkVEyLYbA13emlJ_chAaoJA4TJ2pE9djj-ndQ8odlJXm0ws
Message-ID: <CAMB+xkbpqNbYpQH331aiXxEhkp6mZTcfkCeELyeS1qbiLTN-9A@mail.gmail.com>
Subject: Re: [RFC] drm/imx: upstream direction for i.MX95 display support
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, marex@nabladev.com, 
	daniel.baluta@nxp.com, Frank.Li@nxp.com, shawnguo@kernel.org, 
	tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	airlied@gmail.com, simona@ffwll.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_125353_677027_59381D50 
X-CRM114-Status: GOOD (  31.06  )
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

On Fri, Jun 26, 2026 at 3:22=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wrote=
:
>
> On Wed, Jun 24, 2026 at 03:33:18PM +0530, Piyush Patle wrote:
>
> [...]
>
> > The current dc/ implementation is a multi-device component driver with =
one
> > platform_driver per block bound via the component framework. The downst=
ream
> > i.MX95 driver is a single monolithic platform_driver mapping all blocks=
 from
> > one register base. Unifying appears to require reconciling two bind mod=
els,
> > rather than only adding match_data.
>

Hi Liu,
Thanks for the detailed reply.

> I think that upstream i.MX95 display controller driver would also be base=
d
> on the component helper.  That's something for sure.
>
> [...]

That answers the biggest question I had. Knowing that upstream i.MX95 shoul=
d
follow the component helper makes the overall direction much clearer.

>
> > There is also anticipated divergence which is not yet upstream (i.MX8QX=
P
> > prefetch/PRG, LTS and tiling modifiers, and the downstream i.MX95 blit
> > engine), although mainline dc/ is KMS-only today.
>
> Just want to point out that I sent out v5 patch set[2] to add i.MX8QXP
> prefetch engine(DPRC + PRG) support for KMS.  That changes the driver's
> mode setting code a lot.
>
> [2] https://lore.kernel.org/all/20251027-imx8-dc-prefetch-v5-0-4ecb6c6d49=
41@nxp.com/
>
> [...]
Thanks for pointing that out. I went through the v5 series together with th=
e
downstream i.MX95 driver. Although the modesetting paths are diverging, man=
y of
the common display blocks still appear to share very similar register
programming, with most differences being SoC-specific data such as register
offsets and tables.

>
> > One question for Liu Ying is whether the separate-driver plus shared
> > helper-library approach is still the preferred direction, and where the
> > helper boundary would be drawn (which blocks/ops are shared versus
> > implemented per driver).
>
> Yes, separate DRM drivers + a helper library approach is still the direct=
ion
> I want.  I think that the drivers and library would sit in the same
> directory drivers/gpu/drm/imx/dc/.
>
> The purpose to add a library is to share code to reduce overall code line=
s.
> I'd assume that shared blocks or common part of slightly different blocks
> should be covered by the library.
>
> [...]

Thanks for confirming that.
Based on that comparison, my current plan is to prepare a refactoring serie=
s
that shares the common implementations for ConstFrame, ExtDst, LayerBlend,
FrameGen and the FetchUnit base through a helper library, while keeping the
i.MX95-specific blocks as separate component drivers.

One implementation detail I'd like to clarify: would you prefer the shared
code to remain in the existing dc-*.c files with additional i.MX95 match
data, or would you rather see it extracted into separate helper source file=
s?
>
> > how the component and monolithic driver models
> > would be reconciled given the differences described above.
>
> Like I said above, I don't think upstream driver would be monolithic.
>

Understood. I'll treat the downstream monolithic driver as a reference
and follow these plan for the upstream implementation.
I'll start by preparing a refactoring series for the shared blocks. If the
approach looks reasonable, I'd be happy to post the series for review befor=
e
working on the i.MX95 driver itself.

Thanks again for the guidance.

Regards,
Piyush Patle

> --
> Regards,
> Liu Ying

