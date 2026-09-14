Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5438BC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 08:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BUCr1hCoUskeeRd1t0HVarnyydWOErIB1Udlw4P/HQo=; b=Zsd6nu3tEnS4OFMXm7C5nEDfl8
	vNPOHzFGjLbhCxmuz6EXlkZ4ObbdEZhL/LkZVkbQsc6PRHkw+Ze+1zcNZtmEaPa0zgH/5wcl+S4EK
	Dx0P8drTt8QOfHnCiXso0/Jts2cn/VIfdfeNH/hyblhfcmQXyQvT4Jnm7YoCYdF+inxLI8IhNoWiQ
	RfGKneBjMbQ+oH1sc1SIE4sFaW87ZvA0g54eZwj27IHN36SSD+7AiXc8yrXJyrT7RBlad9btPho2N
	VP8l3nUI+M5Sv/s2qtCYlBKMUxLoGCCW+h6uIWg6H8GmFdlGWj81ADNwe1ND2ApiQmWr93lbAwZeh
	oDOansdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62EB-00000002mF0-0C9r;
	Mon, 14 Sep 2026 08:39:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62E7-00000002mD0-0L7A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 08:39:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 86ECA601F9
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 08:39:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4137C1F0089E
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 08:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789375186;
	bh=BUCr1hCoUskeeRd1t0HVarnyydWOErIB1Udlw4P/HQo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JbTP3wcYks75Mjgv5GfkFxY4k1AJjcMpSMFg3kCfhpyE4EzTcZO0ftMWrxxbbuu2m
	 u1r+DcPPXzlBvpiUg+eLw0fy+Rf7votcjMMjziDvtnF69VUC/6RysdYev0VC1luuFZ
	 GtUL3kVNRee8rwX11kVCcZjL9qh9pajKXwBhJ1JVPbjVJ1snNSzoAinZ8fiNgGeLtk
	 LOOhmVztA1B2bs1pwxysJXWFxiZHiqlhugWARM/qcw8DF8aERknttF5BNE3tW/1i0f
	 RT1RnJaR3Ww83frfhNV6V/iT9TO357gEWMfpvXDUClFilxgTadKdAG829A5nvwOE6t
	 kIiERIlbTSebw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b4a9994c20so3489545e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 01:39:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx8sm2agnCBf/Do8h8oCW78ct+hfDN4fzR8AM0T1AuptZijhqceENzYTG6rRuOv1yeouFPGls2gWvghblktJQwg@lists.infradead.org
X-Gm-Message-State: AFuF++nOwl8J8UOcEAT9ozQZ8Jv7k6kDt8fdjm5Y698uBKY8fmZD2OCj
	DWkd+5o+3xsYR+tz3++4N0+jMeIEFVIRImvxu1KhBLP3V0EvFPc4sKsGZKUF7jmC6CB329bGk1h
	8XpI29Nb6oAQgBrinMtoH7buhMhBc0fQ=
X-Received: by 2002:a05:6512:128b:b0:5b6:4ae:d87 with SMTP id
 2adb3069b0e04-5b8ae66d39cmr415473e87.27.1789375184969; Mon, 14 Sep 2026
 01:39:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260817162212.1890616-1-sanderson@brivo.com>
In-Reply-To: <20260817162212.1890616-1-sanderson@brivo.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 10:39:33 +0200
X-Gmail-Original-Message-ID: <CAD++jLkWtC=ZOX13azEEk0haZHfk3ZRJE=i3hDRY_xcPddA_9w@mail.gmail.com>
X-Gm-Features: AcwNN1UCot4Htkr3dgs4fFXOL_85ODTx5oGWTY6F54hzJDKQ7exHT5L-odqwr7M
Message-ID: <CAD++jLkWtC=ZOX13azEEk0haZHfk3ZRJE=i3hDRY_xcPddA_9w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: Fix typo in s4 group name
To: Sean Anderson <sanderson@brivo.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-gpio@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-kernel@lists.infradead.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, 
	Qianggui Song <qianggui.song@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>
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

On Mon, Aug 17, 2026 at 6:22=E2=80=AFPM Sean Anderson <sanderson@brivo.com>=
 wrote:

> One of the i2c pin groups has some junk at the end. The name should be
> i2c2_scl_h1, and indeed that's the name used by i2c2_pins3 in
> meson-s4.dtsi.
>
> Fixes: 775214d389c25 ("pinctrl: meson: add pinctrl driver support for Mes=
on-S4 Soc")
> Signed-off-by: Sean Anderson <sanderson@brivo.com>

Patch applied for fixes, sorry for slow mail reading :/

Yours,
Linus Walleij

