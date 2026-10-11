Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08110CA9ECC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 20:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OsRD+F+OLtUmpRSHXSpv9UfMmwgcSUQb/xDcJZ0DHJo=; b=SdP4BFkdBsV/y7fXJOj6D3x0f+
	cF3YplcWOqtoksL9Lvi6q2Q4A8zZC5VrZPGppUD8rSzjbf8XfaNtBk1LKuwi3gdNWxcLYlYlVsc5g
	+grKQYGy+nd9uYcBVXtBDkIiPc6o1GuZ+LAoXYrhoXauy7+3aXMqZ+JZkjRc2soc42R/WYrCjYdpG
	U6tnLxMeHQUv5dWgAWZuRmtIedUkhpMVnDMG4PXUCf4RXZk38LAfXLc3/eLYLElYhN6tbj79EWHmt
	1sjqykoOwNMt8Wyb5WkbheOFCUxQjpEjr05j0gTjHtcek/6zD5teGfaWjxag3YD/BfQnDzqe1/M9U
	s78ug9PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG05h-00000009O79-3kkt;
	Sun, 11 Oct 2026 20:24:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG05f-00000009O6y-0Pfd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 20:24:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7EA3743DE4
	for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 20:24:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 631A91F0089B
	for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 20:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791750254;
	bh=OsRD+F+OLtUmpRSHXSpv9UfMmwgcSUQb/xDcJZ0DHJo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bDwkVR+Mng9JjATCiFJWqiEpR38DGPgfTc3U+ctxg8/zcUPYe6TqXRRdyU3ye9pMq
	 7khAoC94ueck2dwdL60uK4E66jZOkU2aqI2OXJq7u1JJAqaw9VxhBAj0gY5spb92cW
	 +kZv5+LK8cA2iUxOwjmkOQc3O42BTz05jz5D9LL+Y5TLkTdBtzOt+1yx64SZqy9GHJ
	 d0k1ADaHIOl5pGP5HGXGaq7W+xMmorZG1E7eT9Ws81zMZExmRZp7PPjtYaLFGZKJu5
	 BC2NFnqcI9Jxzg+QNaCHVJ009FaM4bblt/P0TJik5hwb/wsdZio2QQe9VyaQGnikLr
	 f/VK0uEoxEFvA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bcdab9a82bso1449921e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 13:24:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz7TlTuaAY5Z+k/dti867pf2SG4NfSwTYFb2kQhjPndNYHlBXdUNkx63oWwtY4GpBRVDRqTxzRSj+A41wXjeIAH@lists.infradead.org
X-Gm-Message-State: AFq9FYLkEclpTsN8viBjT50AG4XKG9lQUv7LWcgAhvwHuKgibSKFRjiX
	ixT9lDV8H03/wju8jhdLM8Rk2kM5GPT0f1ZXeMCn9rxfWJkokHVUGiGAhaHfa4AVSDhezDxXmgy
	XITENlAh88OsRiPa82gBLG/uPoM+thaQ=
X-Received: by 2002:a05:6512:118d:b0:5b8:bc5e:b570 with SMTP id
 2adb3069b0e04-5bcde8c13ffmr2228437e87.40.1791750253189; Sun, 11 Oct 2026
 13:24:13 -0700 (PDT)
MIME-Version: 1.0
References: <20261010-apple-m4-pro-max-initial-devicetrees-v1-0-781fb3f2d9f6@cyberchaos.dev>
 <20261010-apple-m4-pro-max-initial-devicetrees-v1-7-781fb3f2d9f6@cyberchaos.dev>
In-Reply-To: <20261010-apple-m4-pro-max-initial-devicetrees-v1-7-781fb3f2d9f6@cyberchaos.dev>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 11 Oct 2026 22:23:58 +0200
X-Gmail-Original-Message-ID: <CAD++jLk+2iUkJfYQckV4G79JEErH77_mOqwGaZ6TyKGawmnFLw@mail.gmail.com>
X-Gm-Features: AclHuK9cHC-ny7H2OT1BGwCBFcKBYkyqMbq7PnfdAqUY1dh82EQN4ca3xsuP3Cs
Message-ID: <CAD++jLk+2iUkJfYQckV4G79JEErH77_mOqwGaZ6TyKGawmnFLw@mail.gmail.com>
Subject: Re: [PATCH 07/10] dt-bindings: pinctrl: apple,pinctrl: Add t6041 compatible
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Hector Martin <marcan@marcan.st>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Sasha Finkelstein <k@chaosmail.tech>, Mark Kettenis <kettenis@openbsd.org>, 
	Andi Shyti <andi.shyti@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org
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

On Sat, Oct 10, 2026 at 7:00=E2=80=AFPM Yureka Lilian <yureka@cyberchaos.de=
v> wrote:

> The pin controller on the Apple Silicon T604x (M4 Pro/Max) SoCs is
> compatible with t8103. Add "apple,t6041-pinctrl" as SoC specific
> compatible under "apple,t8103-pinctrl".

No Signed-off-by?

Yours,
Linus Walleij

