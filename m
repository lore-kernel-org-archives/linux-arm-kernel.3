Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BF3C53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 07:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=osMyXD9bF52+PH//j2kDJlPWHg0XSz5RwrfnJBrCoj4=; b=fhvf5Kwt6IM6rvpo0+1hXVI93c
	yPyXqqAX9wDki2X8QmSumTQpsC68n6Udy650OkfhvuVSWyFDYE5iBXYmzUS2zSlt5ObyMb33E6Dtl
	xOhKB70moCC4RPq+o0joiGw9Myl0apRvE+Hmclw+E3yi7yANayQOpBK1chHso5G6SvSg9RpP99kIq
	lKppg29r0rj2HyFq3lL5FV1UCabvjHql+X2CfJ3kzwALX90wxhhks45RChiLv3i0py3DZk5sSaHPx
	OR1omRU29R5Rxi/HKmoYBYe9/ia/UWwogJIzbzqNDqEdnRQJIawpI2PJb8a/dbdkwVW1b8gK3p1KL
	asV4JjCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woz0i-00000007A6Q-1UVf;
	Wed, 29 Jul 2026 07:47:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woz0h-00000007A62-0con
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 07:47:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5487760A66
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 07:47:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B3A41F00A3F
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 07:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785311246;
	bh=osMyXD9bF52+PH//j2kDJlPWHg0XSz5RwrfnJBrCoj4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=E0K+wGVLBFB5bcDJ5g9po9V99TbFbC/5KkgVjk//bjsdTXqP6fHH9zMES2FMHQgHq
	 Z1p7fEVj39MNnT+YROuRBo1fGfh16YQVmMrx2bopF+qWZ0m1P9K5/Fh3jtzkW/IHGc
	 4aFV4xYaToEeOfwwRdF59BYbYUpm69wZmaejq6b2aFctDUx+xno3UZ02Iq32P4vVVn
	 GSfarRvFAwMnsWx9F301mIfm3ylJy+JnX7XmcZ7oV83dSgYIuBLVhpX7gNui1B+Fl9
	 AwGXU7yhSvAI0MgVUD4JWK00kg5OfSjri2pEPZkNMvP+4npeqG6bAaadyvDu3Antop
	 zHkSrGI78gf2Q==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39c74722e27so6866171fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 00:47:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrhKphDOoScBYDPmoKRHH2HW3F/71TOftTA7dKIgEhcIWkPtlL0AhbQY8OIlIm75gYlynfuS+N9Y/z9ZzX8Z+Pw@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7+YMFvzppu7Zd1NzhOFcWvjXNSweu5l09hbPeKt8G1XOXute5
	K178a0CwFBiNxomkA+vwA0yQodi7Np5IG2danbMP59m3NNdt4KgBtJKEWnBUB+FFRo4BE2u4g93
	oGxoTm32dJVEFI3jdl8Ptiiqfidwv7JU=
X-Received: by 2002:a2e:be0d:0:b0:39a:e32c:1b1 with SMTP id
 38308e7fff4ca-39f606d63b1mr3064111fa.19.1785311244856; Wed, 29 Jul 2026
 00:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260724-zinitix-modes-v1-0-f6df7d86a878@disroot.org> <20260724-zinitix-modes-v1-4-f6df7d86a878@disroot.org>
In-Reply-To: <20260724-zinitix-modes-v1-4-f6df7d86a878@disroot.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 29 Jul 2026 09:47:11 +0200
X-Gmail-Original-Message-ID: <CAD++jLmfsbuFBfbVBV=eMcJ1r7uh5MFoLD4+R=KHc+FWeTaTzw@mail.gmail.com>
X-Gm-Features: AUfX_mxkC3SpPsYSgeGeQ9pahX3w_eSvwBQwmYhfecejjbcDeQVEdwRlJNOgKjg
Message-ID: <CAD++jLmfsbuFBfbVBV=eMcJ1r7uh5MFoLD4+R=KHc+FWeTaTzw@mail.gmail.com>
Subject: Re: [PATCH 4/5] dt-bindings: input/ts/zinitix: document mode 0
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Srba <Michael.Srba@seznam.cz>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
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

On Thu, Jul 23, 2026 at 9:24=E2=80=AFPM Kaustabh Chakraborty
<kauschluss@disroot.org> wrote:

> Zinitix touchscreens support three modes, numbered 0 to 2. These modes
> differ based on their event report schema.
>
> The devicetree schema does not mention mode 0, thus does not consider it
> as a valid state. Add it.
>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

