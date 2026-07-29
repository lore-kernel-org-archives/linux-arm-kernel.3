Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24B2C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 07:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ot46wtUCSvLaFPk3Tzd2lHn9BHDi6euTPMRIGmIYQUs=; b=Kspyueqntrw2wBJ/ufDzWXEuHZ
	S7D99SMg4QcV1uWKbNFqoybq8Sawc/I9JdA0TbA8AA4llAZsbBy136cMAW18qY8xRKz5aQx4N8A9o
	9zHhFZVQPrkfKsV3Of06KJLqnB5seGuyeiWGkNALtBlNuekvv2cyWD1qsM2BOVnwKYM2Ku8roLcQw
	ynCnAjzmb2WSaPm2KGx1vWYJqmYXGljYPFhWtwvMHPKnekbk2jHb1sfYjv7iN/6gJ4recVI7I+P8T
	Yk0z6n4sCq5lqdWjHmbArk6HOjhVsmru9E9B3EY5rIatk9IQdc7/JGvqZfRYA6qzmUSPC+KWLf8tW
	1KDsg71w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woyxT-000000079by-1sce;
	Wed, 29 Jul 2026 07:44:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woyxR-000000079bc-1crW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 07:44:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9CA8260A99
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 07:44:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 524A31F00A3A
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 07:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785311044;
	bh=ot46wtUCSvLaFPk3Tzd2lHn9BHDi6euTPMRIGmIYQUs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=POpn12y/mRNEVBNOEb9px8uTYLCjMqqXdWNSvaTtaiYYHsw3H2bYuqkKIRBy8l1N8
	 BINql2rHJXkdn1PmYHRFxoE0YeGK/BX5zw1WkUZwvBeB3ITz7Bgv8/MhIA6n/Tm/DE
	 XlQCW5v5z9YnzDaXOsxKOTkQ/8cFX8pZ2CnSqLwVJOfcwkxt8mFMWr77dNi8BYDTf+
	 OMry0SrRRNWX7TsFmLoTGMgXJFkwAbM6L0mNA5cpCLoPf4LMjvSZR+3HviOJMsNAm6
	 zo+RYw6SPj/Fwl4vqzA7AavXWp2ipHEZPJZptjszyRpFsFMSbYOUTwXTulWoP8/Cmo
	 w+21lyYI+3zgw==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39c908d6cb6so5425781fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 00:44:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro24++G+QQ2tSYUeAakaxuiu8ma9TEDWmYKCyMrzzkKX+hobLhKaRKcuf8RtDUnCv0YWvyMYWlX/ujkoXIlaVkR@lists.infradead.org
X-Gm-Message-State: AOJu0YwMBEaqd52IqdeDOstt3DrJi6kHdh1HjpTTIkwkFmkTBW6rrr3g
	2zO/IB+l2WF1pcLncGoVq2+17aBETJyUdiacET/Sb5PzbI0WUPtWsLU/kfUZHnrpqIPD5KL/62y
	rgF2hSuxZVYIVg+XT5T7wB7vMbpiM46g=
X-Received: by 2002:a05:6512:3d87:b0:5b0:1b78:4969 with SMTP id
 2adb3069b0e04-5b2d0253d4bmr1263858e87.46.1785311043134; Wed, 29 Jul 2026
 00:44:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260724-zinitix-modes-v1-0-f6df7d86a878@disroot.org> <20260724-zinitix-modes-v1-5-f6df7d86a878@disroot.org>
In-Reply-To: <20260724-zinitix-modes-v1-5-f6df7d86a878@disroot.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 29 Jul 2026 09:43:51 +0200
X-Gmail-Original-Message-ID: <CAD++jLkRHgLHLenBPsvO+sFpj0Um6-2P5Ap_eBSq5K=dr2+mWA@mail.gmail.com>
X-Gm-Features: AUfX_mwvn_ui2ZSBDvNroUCnVv97gaxxHNTnHQtdrsBXAAI1m0EXRHGlkojbzCs
Message-ID: <CAD++jLkRHgLHLenBPsvO+sFpj0Um6-2P5Ap_eBSq5K=dr2+mWA@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: exynos7870-j6lte: set mode 0 as default
 for zinitix touchscreen
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

On Thu, Jul 23, 2026 at 9:25=E2=80=AFPM Kaustabh Chakraborty
<kauschluss@disroot.org> wrote:

> The ZT7548 chip in the Galaxy J6 is actually able to support mode 2 (the
> recommended mode) just fine.
>
> However, the downstream kernel driver utilizes mode 0. This creates a
> problem in the aftermarket world where fake touch digitizers only
> implement the bare minimum functionality, as used by the downstream
> driver, to compromise on cost, which leads to such chips implementing
> mode 0 only. To ensure touch works on those devices, set the default
> mode to 0.
>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>

I guess it is not possible to detect in software which digitizer is used?
In that case:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

