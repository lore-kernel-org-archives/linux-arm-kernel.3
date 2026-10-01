Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C592CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 21:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XyDDvvco+d3mYshhwaSSq4pDGDpCB4IF/PEVe4NawGo=; b=RV5pHWLFxM040c94MO02tThkYn
	pDruc/2q8s7Ytrlek6l/RTWP/qCZ/94QPID+a4sdrVP8ErEs4s+IJDTpOj4Xw8Kd/eCjKXx1Lfqx9
	teR7iMA/lJhTNWO+0r8kaW0GFG7nddZUKmt6hZlElUhNyHBj2O1bDU4ILSzPGUB9jXF1phVUoNVKj
	iBJN5uH4mtmQsYN9MOKOh/tbbJVB0KoO7isq6N5JmgT9MbazjOHoaZ5m8vOleSxWXkVie3r0FNT8Q
	nndXPJqATNxR8wJOIYzeRkvPBcAk7w0oARL2wiAi4gg1/uLW5oD/HO0HzcJ/HSw5OD0xhQe00Cf4A
	eZSTB7kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCO6F-0000000AFDE-3zN0;
	Thu, 01 Oct 2026 21:13:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCO6D-0000000AFCh-3ZXk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 21:13:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A22942A13
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 21:13:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E7431F0089F
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 21:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790889233;
	bh=XyDDvvco+d3mYshhwaSSq4pDGDpCB4IF/PEVe4NawGo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VJmeh5ksyazvF5b+uHiFuo+Fkk6I2oEkomFcTpQ21cV7s7Ezpvo2WgVusFoCZgkcq
	 0zMsaKO6LO+hSz4EJ60U7PJejykfqbW755h946vLBB6L1w5baFM7MtYHfbgXR7s7Ic
	 DsNON4VsPVifglKVHnHekmWa1Hm32i3mwLRJlEo78moodMhXS9K15e8KCLX2R2eaL5
	 jWWTgRAFbdVHjAHmKmJTCU1aazlhC3iWjD8Ovh+PKsZrpknhpTuTwmQ2Z32CUkGIz4
	 26chOz/4enh/ta858jhMXP5Fok4BYwf53CDVQErWoh0nbDdETeMLinDeFNGQMOQnmo
	 XDskNRObVbmtw==
Received: by mail-lr2-f21.google.com with SMTP id 38308e7fff4ca-3a2ff148dfdso57214541fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 14:13:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxuyLOh5+JsNKhzuqOrY6jVTSJ9RgkFicpW8cm39/YwRwWo3+40oFHT9KFlWN5uGP2BzXJo8aVu7ZGaTPO/ayGQ@lists.infradead.org
X-Gm-Message-State: AFq9FYI+E5G1r3terBglKP/y4dD30Xmv6JRbKudstKb5MeGV32+IB5kV
	hbl3kdSGTffptvYTWzF4a83FGSfcU8ou1Iu7zPFs4GIwtlklL71cwojg+NbwQSgojvzohIrUWgr
	kshfNy1cPjUVlz0mqAk2ZFomjuokxCjw=
X-Received: by 2002:a05:651c:210e:b0:3a6:32a5:efa0 with SMTP id
 38308e7fff4ca-3a8877c5ae7mr1272461fa.22.1790889232244; Thu, 01 Oct 2026
 14:13:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260926-apple-pinctrl-t8140-v2-0-620bd11cd2a1@cyberchaos.dev>
In-Reply-To: <20260926-apple-pinctrl-t8140-v2-0-620bd11cd2a1@cyberchaos.dev>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 23:13:39 +0200
X-Gmail-Original-Message-ID: <CAD++jLm1tFh073xxPx2WzidABvP_fRY0Bhf8DkO64W6VBQ8UYw@mail.gmail.com>
X-Gm-Features: AclHuK_bJIEK2xjDLFUNw_m3k1RB-KhI2mP3RWR1EocLD8uDhL9bs84JVwEtVgI
Message-ID: <CAD++jLm1tFh073xxPx2WzidABvP_fRY0Bhf8DkO64W6VBQ8UYw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pinctrl: apple: Add t8140-pinctrl support
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Sat, Sep 26, 2026 at 4:52=E2=80=AFPM Yureka Lilian <yureka@cyberchaos.de=
v> wrote:

> This patch series has fixes for probing the pinctrl_ap GPIO controller
> on the MacBook Neo. The previous code would crash in the regmap_init on
> this device, since reading the REG_GPIOx for certain pins causes an
> SError.
> To mitigate this, we adapt the gpio-reserved-ranges property to describe
> pins which are unusable and whose REG_GPIOx should not be accessed.
>
> Also add the new t8140 base compatible to the dt-bindings, signifying
> the different behavior of the t8140 pinctrl_ap device, and make the
> driver accept it since it now respects the gpio-reserved-ranges property.
>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>

Patches applied!

Yours,
Linus Walleij

