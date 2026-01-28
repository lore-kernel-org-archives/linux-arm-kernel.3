Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3281D3F098
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 16:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LX9gDx3KFBF5yxVstQOoU+G8u/eBTnZN64aCXHiziSg=; b=mc3NcfRkymBtdbAab3DLWYtqEM
	YxC1ynp8igFFKdk3VkSSMvhG4k+ldPHuW277N2N+1agARoBuX1YEtZZmHX945p2N19qYBC+e9+aMd
	FUSg0T62o0zQcBdE06aM4pfYxx/Aj3pbw8mat2gZDKk8wDw0MF65v0O+XL3piZ29iCgEzNJb3UTXN
	d/GxCdh+G/6I0c8cLFIE/zCo4lutppYWJTokXT+msJ/e7sXh/gH2BWbYLaK1Dxh8yeB7bYP3SE2JN
	MDX6XC2Wy08EaJS64vLr0QfmIuHon5N5SxFLhWy4ZN0pIbRC7BGFHJq8i99TZRRmY6HWdVA60q5Mz
	xOneIkGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl8md-0000000GQam-0c7O;
	Wed, 28 Jan 2026 16:52:47 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl8mZ-0000000GQZx-1MMt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 16:52:46 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2a871daa98fso14496215ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 08:52:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769619162; cv=none;
        d=google.com; s=arc-20240605;
        b=kwTvMQ6Gb07qFmdqmyCMcMwpQb9TOLkqJn9akLdYwK8UXdgO3gdirt4hfV3tzY0I0c
         xlM4COB9/EnzoYVhcahZG0NpJjNjJZk0TaebZmcXwQDIh8zHzGDYn5gXnPFPhPczr94T
         CCJD6i3YBb6Ibxds3I6azqA9vahxUd6D3DrfEGNzyEZ7H0lpc5s0mxP/HXV7i80Dr42V
         aJYuqPd5C+wHGoQs94mj+AeitQABYetx67L+JqdNESBrIs875WlMPbbnO9h9jQwwl/4O
         L8oTVItDP8M6WDdMdgVZ2Gw/PnevNJkNH2I5Vob+j69uK6gy8JaCsBVKJYBJs4exrieC
         lA4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LX9gDx3KFBF5yxVstQOoU+G8u/eBTnZN64aCXHiziSg=;
        fh=xXCHXPBtPkVGlMJHBnz2QHjghl+i2OIjbQsm390gduQ=;
        b=QkzQDTdGY6ICuPrh67mT/yr2J4RL8DD7j2KvvriZi2BkZrhHfOnlmjd2NiGx4SCrC+
         dbKtwK8EEKcnrI4dwu66zj/nloARNpagIqNYE51z0kQcdb0+JllWvQAMgYdGbM+uHlRK
         X4QmO27prdMOMUCQ2X19z8sKFTEHNJ3e13KXm6FsloIIZNQv+61V+a4/UjImPnxesV/5
         kGN9UmfZ9ekutxiMKX6F2hNox5wGt/mikvv3wmMQLVGfNwlvn44a42YBNmD6sNreh2KP
         9hywEBcwYyq96SdOH9l+xKX9yfKYavnRdvY+sTEsJ3wIZtzFldIhwYDJVuNhS8rnL+19
         NZkA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769619162; x=1770223962; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LX9gDx3KFBF5yxVstQOoU+G8u/eBTnZN64aCXHiziSg=;
        b=I4pgcGmNdhOPl+RRkBJamW79e9+yy5ATKznN5EETEbpihjTDh7jVpjvfh/CBYunZOo
         e/C3dMQguGpoV2162BfILzCOtosmHb8H2EDwkQKV9iEE6bmMrxFREVBs2a66F7zCFfnL
         /xYuINOgb5/guekOqrkW7NOMxXgvX1IFUHSRyq4rlak5fYTUZJw63LJtlLycVxAQtVe2
         a4O+9FSuCy7IpmNydyZHzDIPXE58MtEgxfYIMaJslqswnw71gglkYY2y/EqAVM4HAmCm
         obu0Q4KuKm0G9AF80GWZ7CgZ0dpmZkHV85/iOVYEebG6yP/S4/JxyTFgpjADvUt+X2eu
         UqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769619162; x=1770223962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LX9gDx3KFBF5yxVstQOoU+G8u/eBTnZN64aCXHiziSg=;
        b=AGp/0kczku8ZlyAKKs7s/xYB0cAVXZsD2S3nX3pf9y0Q3CSshhfUxyetCJBg/3U/xq
         aIYBMcKArEJrf9oAl9WLs0VHH97DSLIGV3q1Gv3+tFLRsegEQ9yQWG1yI5sg99VFMn6R
         pgrunxIDU8Vlsrr5tzRmB1GYmElGZpQB14qh8GpzDuQoKqn719JMe0SmHN3G8zIMpDqr
         oS9NlwdqhaxnB5xBXOh5mUudQ7KTzAgC5h9nkH2y/6EE/+Eq1y2P6U/NSXSYUvGYDqZw
         2BU7uuvOmZefgFI8HazwynhQxMChxIUc12h+9pkOa/nZzucmSz0nWqyChrIlCwzyvPHG
         TyXg==
X-Forwarded-Encrypted: i=1; AJvYcCUhjcayj4NgQa8NpuqU46sQBCZ8nAertU0ytnJC03a/mHi2Erjm5bVE147SmzSrxbr8yobH6euTIV18tW2/SJkz@lists.infradead.org
X-Gm-Message-State: AOJu0YxKrk3aQQqo7EUcxqr6tJfxcSnxqVFD+KORZ1A6OdZORbGwuBfU
	tnP13vHWAKxxfHNA51qAkxkofGdKXNJMOZN4R4xbHpqfmY55aTm9oUQ0oeBG+pxKufCepxGr6eD
	1rcxvcoW+4n32ybIAqkI2ZsQMSNnMsg==
X-Gm-Gg: AZuq6aJvzn4HAPoMkm58024HtbTsAUhqjV1gahfdut1gq2z0SGfhoaKMCaoE2VojeLk
	sj3MWBvGhRHdpW4YbzxF+3OkncGuV7pQB3KbuGS4gcs7eBE2WU8n5KhmBxgFK8f9/LfiQx1P0Jk
	bpFzQSNW6wLosXIVZ8XicLqfl08SgWUGa1gZ970Bkh6hP61fp+NLYFQTs6pX8g05xvbCbdfkJVR
	AenpcDJIKfH/nmVkCSiQxc8QiMokz/CLJta0pUVN2bfMBhG2xoV/GWv5DYl+ldYRj5lmyD0
X-Received: by 2002:a17:903:249:b0:2a5:99e9:569d with SMTP id
 d9443c01a7336-2a870d6483fmr54239625ad.18.1769619161524; Wed, 28 Jan 2026
 08:52:41 -0800 (PST)
MIME-Version: 1.0
References: <20250427142500.151925-1-privatesub2@gmail.com> <aXJTqzZaBrCMnTvv@shepard>
In-Reply-To: <aXJTqzZaBrCMnTvv@shepard>
From: =?UTF-8?B?0JDQu9C10LrRgdCw0L3QtNGAINCo0YPQsdC40L0=?= <privatesub2@gmail.com>
Date: Wed, 28 Jan 2026 19:52:29 +0300
X-Gm-Features: AZwV_QjtfqpOuCyYtNE1xKe0593NpcMxJ89wFPIBopBcRc0tp-flqstJbbXGRk0
Message-ID: <CAF4idN=h9u2LX8Oa9_LcyM9ANUNtLbPTMyn_pHbZVBCXc5Orvg@mail.gmail.com>
Subject: Re: [PATCH v12 0/3] Add support for Allwinner PWM on D1/T113s/R329 SoCs
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-kernel@vger.kernel.org, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Cheo Fusi <fusibrandon13@gmail.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_085243_369262_4DD24FAF 
X-CRM114-Status: GOOD (  29.08  )
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

Hi Paul,

Thanks a lot for the detailed review and for testing on A133 - great
to hear it works there as well.

Good point about the naming. I can rename the driver to sun8i-pwm and
send a new patch series.

Thanks again for the pointers and the context.

Thanks again,
Aleksandr

=D1=87=D1=82, 22 =D1=8F=D0=BD=D0=B2. 2026=E2=80=AF=D0=B3. =D0=B2 19:43, Pau=
l Kocialkowski <paulk@sys-base.io>:
>
> Hi Aleksandr,
>
> On Sun 27 Apr 25, 17:24, Aleksandr Shubin wrote:
> > Aleksandr Shubin (3):
> >   dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM
> >     controller
> >   pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM support
> >   riscv: dts: allwinner: d1: Add pwm node
> >
> >  .../bindings/pwm/allwinner,sun20i-pwm.yaml    |  84 ++++
> >  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  12 +
> >  drivers/pwm/Kconfig                           |  10 +
> >  drivers/pwm/Makefile                          |   1 +
> >  drivers/pwm/pwm-sun20i.c                      | 379 ++++++++++++++++++
> >  5 files changed, 486 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun=
20i-pwm.yaml
> >  create mode 100644 drivers/pwm/pwm-sun20i.c
>
> Thanks for your work on this driver!
>
> For context, this PWM controller seems to be a second-generation design f=
rom
> Allwinner, which is found in the following chips: V5, A50, H616, V536, T7=
, A133,
> V833, R329, D1/T113, R128, V851, A523 and A733.
>
> I've tested your driver on A133, which works fine too. It seems that H616=
 uses
> a similar (but slightly different) register layout.
>
> In case you've missed it, there's a follow-up series adding H616 support =
at:
> https://patchwork.ozlabs.org/project/linux-pwm/list/?series=3D409036&arch=
ive=3Dboth&state=3D*
>
> And there's also a standalone effort (which I've redirected to your serie=
s) at:
> https://patchwork.ozlabs.org/project/linux-pwm/list/?series=3D485644&arch=
ive=3Dboth&state=3D*
>
> Now given that the new controller was introduced with the V5 (sun8iw12) f=
rom
> 2018, I think it would be a bit confusing to keep the sun20i-pwm name.
>
> How about renaming the driver to sun8i-pwm instead? That would be more
> consistent with how other second generation designs from Allwinner are us=
ually
> called in Linux and makes it more clear that it also targets sun8i and su=
n50i
> chips, in addition to sun20i.
>
> All the best,
>
> Paul
>
> --
> Paul Kocialkowski,
>
> Independent contractor - sys-base - https://www.sys-base.io/
> Free software developer - https://www.paulk.fr/
>
> Expert in multimedia, graphics and embedded hardware support with Linux.

