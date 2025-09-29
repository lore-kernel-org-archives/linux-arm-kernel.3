Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD189CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 18:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bjmGfI+aM9Ga1Ig2g2mvuKGLXAvr/Dgn4bzVg8VMK/M=; b=yGPVuFgm89W5KAyQ4uIMwzoeO3
	GrBwt9t2L8e5yvqpXcTq5VwrtJBTiiu2iN1tHDwrgi6kfRuuKXehpydO3b5F3PxZyTiIWIJKE4FKi
	v1BGUtSDz0E+5A576aJyk4juYaC/agqAcdCV2vMrFXtTaQn3GP8nUuZiqkVXnWlQVPQdpc2Chfz9G
	U8VMdOofEw5bazW+CLPSw/kupRdyuCH/unhmavMyP+X4Z0QK4AGxocp7TF0aYbKfaZhpucIXceVX3
	IVwHweGdvbhQ4xcGqTzKX+nVvCM9GKOW9bQonD7YJzi91rjwTkoPElI/KfUYI/HXud+HT7Vhv4KIn
	Cx2qoRyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3IKE-00000003DGf-3vc5;
	Mon, 29 Sep 2025 18:10:14 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3IKB-00000003DFe-2ZWV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 18:10:13 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-7960d69f14bso27192226d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 11:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759169410; x=1759774210; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bjmGfI+aM9Ga1Ig2g2mvuKGLXAvr/Dgn4bzVg8VMK/M=;
        b=YGDBMSh/rC0h1tsGjJ3dDtzAVJRWdGcW4KhDcOBgt4WDj89ufy61Mk5doezkbWaBpm
         tFu075RkCkZrrOuSeuwJH8qFlrRAj64vUYGCUWTuCH31WcG1tKLBwU3rweRffOy2Jb+6
         b6vrtXPTtNG0xRxOwxADD/d0KNMpGryT9TkMypqgmC+0DFSItYbqOpQVIKteyuo5QMEM
         sj7yBopwHqI3KHfR0NYvFs5tSc75KeYeq6oC1GWbPHfZRKAQWKx5hKm76DM33r7yvnef
         c+9kGaXwTw3ax9LrhslAjaNns3hHOmfRNIO8Lv9Ga/tjVA4APMtr91MU2OKHj43a8+iB
         d62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759169410; x=1759774210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bjmGfI+aM9Ga1Ig2g2mvuKGLXAvr/Dgn4bzVg8VMK/M=;
        b=Rpx/EVuwXqAMkZ8jBUZEZ6IN+8dnb7JIDzaZZHTVV7v0MR548Z6zz31J4KsOotHslG
         PqHnT5bytrJyjXHoy0sgcFl/IYt/E3rZ4xcpMCPgGgm8HsTIETiea45c4tVEb21U7bha
         JHdLqc6A7lpWxxw5uyP8OGtBXwXQk9AUzCXTeVFwN5eJHr+NM0A59MUcgnAAWI9UzMHS
         UuLrBXsl83vlICF7Tk8LwF8sAlrz7/Z9MRabPXSJZxBfXga0cHN2Ml0FLchPDcuOvHR3
         NosNMZKw40FE4P0aiQm59jv6mQi/0DNWcUoVxcgNkAP5FKEELO6+OQV3lFCuoXipv9sL
         K8LA==
X-Forwarded-Encrypted: i=1; AJvYcCWTdBM7wSK14Bwv8jQ59lEmGjHspa7FE7m4zd1HtIc1D9uJxEm8q6PfNcJveO7dAylN3gcQ3qKB3Ga+vp/j4HSn@lists.infradead.org
X-Gm-Message-State: AOJu0YwUCRVj6LRn/k4yUS7mFoqUm+eDgLBgmPZ5Ey2QWRHwF/FK0zyK
	0xUlkIu8bFttbOz03GMecNDDZ1MGF/BN/Oqk1GXivG6DNMn+2ga4Ou+5+b54R/+sa87cGUr3Nzq
	rMwY/PWWMniSj3knYVEMFtJiW/BK+Se4=
X-Gm-Gg: ASbGncvGRvIBMTo+akzAglyiS40WZhNkdNeB9sPIf/f4l3qzbUNK6o//TSOupm36xqB
	osOZgwbv8RJzD6hXGpZIRWwceL1nlA3rFwdyQ365J2hKrzreKdtZgpgP7MjbaUTUJ2Any7Yt99D
	gV/giUnR/Eur4hp19AfGDJW3675GxgPwF8TdgkkuOb/yJyFxqnYpcfSHCqpEhRkHAPhhOWLD9dJ
	OGlGWHs
X-Google-Smtp-Source: AGHT+IGsvBr58f8GtOgfL+nnwH2k9AWpbMH6XL9pshnNTk2Mp1zqCHalJ+sXa0/EQOqNTHncEJ0efp7KH1rOEknc4fQ=
X-Received: by 2002:a05:6214:27e6:b0:786:2d5e:fdf1 with SMTP id
 6a1803df08f44-7fc28076dc7mr264116426d6.2.1759169410033; Mon, 29 Sep 2025
 11:10:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250929065714.27741-1-jjm2473@gmail.com> <DD57IZJQ4FQM.3T5791FLUQ8KQ@cknow.org>
In-Reply-To: <DD57IZJQ4FQM.3T5791FLUQ8KQ@cknow.org>
From: jjm2473 <jjm2473@gmail.com>
Date: Tue, 30 Sep 2025 02:09:58 +0800
X-Gm-Features: AS18NWBq9CGmQ4er962r1cmMIH84RDNYTi26gLQ7NR29ewoVtK32nqAJCIuNoXA
Message-ID: <CAP_9mL6+uoeG7LX8YCcUFjoU13De1CdPFqxNNfoJvOdsOrYo5Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] arm64: dts: rockchip: introduce LinkEase EasePi R1
To: Diederik de Haas <didi.debian@cknow.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, 
	quentin.schulz@cherry.de, kever.yang@rock-chips.com, naoki@radxa.com, 
	honyuenkwun@gmail.com, inindev@gmail.com, ivan8215145640@gmail.com, 
	neil.armstrong@linaro.org, mani@kernel.org, dsimic@manjaro.org, 
	pbrobinson@gmail.com, alchark@gmail.com, jbx6244@gmail.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_111011_690099_DDEFC5D1 
X-CRM114-Status: GOOD (  19.26  )
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

I will fix that in v4.

I just forget to add `Acked-by` after `git format-patch`.
I will re-patch my local tree, add `Acked-by` to commit message,
then `git format-patch`.

I have another question. If there are reviewers or co-authors later,
do I need to add it to the commit message and send it again?
Or should the reviewer or co-author add the message and
continue to deliver the patch?

Thanks!
  Liangbin

Diederik de Haas <didi.debian@cknow.org> =E4=BA=8E2025=E5=B9=B49=E6=9C=8829=
=E6=97=A5=E5=91=A8=E4=B8=80 18:20=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon Sep 29, 2025 at 8:57 AM CEST, Liangbin Lian wrote:
> > LinkEase EasePi R1 [1] is a high-performance mini router.
> > ...
> > [1] https://doc.linkease.com/zh/guide/easepi-r1/hardware.html
> >
> > Signed-off-by: Liangbin Lian <jjm2473@gmail.com>
> > ---
> >
> > Changes in v2:
> > - Change deprecated "rockchip,system-power-controller" to "system-power=
-controller"
> > - Link to v1: https://lore.kernel.org/r/20250925055906.83375-1-jjm2473@=
gmail.com/
>
> You received an Acked-by on patch 1 and 2 in v1 of this patch set.
> You're supposed to add that to the next/new version(s) or explain why
> you choose not to do that (bc f.e. there was a major change, but that
> does not seem applicable to those patches).
>
> Cheers,
>   Diederik
>
> > Changes in v3:
> > - Fix typo ('status =3D "disable"' -> 'status =3D "disabled"') found by=
 kernel test robot https://lore.kernel.org/all/202509261328.Grjhp029-lkp@in=
tel.com/
> > - Link to v2: https://lore.kernel.org/r/20250925092037.13582-1-jjm2473@=
gmail.com/
> >
> > ---
> >
> > Liangbin Lian (3):
> >   dt-bindings: vendor-prefixes: Document LinkEase
> >   dt-bindings: arm: rockchip: Add LinkEase EasePi R1
> >   arm64: dts: rockchip: add LinkEase EasePi R1
> >
> >  .../devicetree/bindings/arm/rockchip.yaml     |   5 +
> >  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
> >  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
> >  .../boot/dts/rockchip/rk3568-easepi-r1.dts    | 692 ++++++++++++++++++
> >  4 files changed, 700 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-easepi-r1.dts
> >
> >
> > base-commit: d0ca0df179c4b21e2a6c4a4fb637aa8fa14575cb
>

