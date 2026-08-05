Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8CBC55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 17:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WBGLmgn1KuR6ekaDfS9NzoAp0N4ym3eZDjfC7Q20pVI=; b=Pi+bVD52mJF08I
	YBsT9CeJSgOJJo+406pNRJUGdiPigA3Y0QaKSBiC7VCLfcjvk8Wikr/TUbe6+/JSYaO67vlt6vGd3
	Z3pfcSehMLCZhkzd4VBQbZR/fQDhd8jM3rHiewdKLOJG/9tQrsNRS4xnFmKauT+sbP9/dJy582MnD
	yQGJXEQGBR3Kj4amlKMwGPxiU1b74mVDxRieYqyDFfFJxMUzXhsoDyYPOMBwH+ZB6ZA2R9JSvLjdH
	7C8oMcR/oKoBEoyUUBW/nO9PZDP2eIfOo0d3saWEdMeBxw7K9LDjdYWKvoZI0QQLT7laaU/U+V2Bm
	Xp8TSJYMmck04lYsj19g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wreyZ-00000004J9Y-3s4s;
	Wed, 05 Aug 2026 17:00:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wreyY-00000004J9K-0iS3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 17:00:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A03943C8A
	for <linux-arm-kernel@lists.infradead.org>; Wed,  5 Aug 2026 17:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E8231F00A3F
	for <linux-arm-kernel@lists.infradead.org>; Wed,  5 Aug 2026 17:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785949217;
	bh=WBGLmgn1KuR6ekaDfS9NzoAp0N4ym3eZDjfC7Q20pVI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=SMWCYEvcM74kJ2TgjQBqvWi4t4taCknixxdGSZjw76yTmZQgqVCHjoSNcC7dx3lF8
	 JlG6+1yM5zXvibUGlYm6788ep6CZfz+1ar5kTlKPrZ7aujiOudwt8i8xq9HrNG5OQ9
	 ZZWSqdMBikBMNTBBXvUemGwNQ9Z92E8gukI2Gw9bzwjlsCMn1GVttbrrcRfQuass9V
	 BxS/F+1nrvQ7i2+4hW3sF4VYf8ctqZHfmE1bBfGuc2IGjf875mk8T0UqP3RCqtJr0t
	 8LGsjrqufehPnoxwzYCrJ1BZqOHDM0ixpygJhMMO72tZPVLd9yul7BPzpabN6l+XNS
	 QndKgDwiWk5HA==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39f91ba1ef7so8564811fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 10:00:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpQCk9mjBZvEIQqgra7AGbOmOecdC2up1hPpI37wNbv+9sMva/GqoYVnbgGBBS5IS756ShxC24Yss2NnvD1zGdl@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7gfON1HPP89wiGmLcEqGcGwKNTzy9nIC96nbhKD603ZEJP+fS
	wf9879ycM6abMtashVseacckQ9zvSA5/HfQyJgvmk8ven/ky2V00kPlV7OiR4ALGeCvvl5q+HUD
	SYUhNI3dRcGjruPJ3g4G0CHaLv/jy4YU=
X-Received: by 2002:a2e:9a0b:0:b0:39e:b3b2:e95f with SMTP id
 38308e7fff4ca-39fbb2646cbmr11047971fa.18.1785949215957; Wed, 05 Aug 2026
 10:00:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260624123914.1767374-1-hello@superkali.me> <178267399833.3089434.5140309637329023610.b4-ty@sntech.de>
In-Reply-To: <178267399833.3089434.5140309637329023610.b4-ty@sntech.de>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 6 Aug 2026 01:00:02 +0800
X-Gmail-Original-Message-ID: <CAGb2v64kcadr1nAisu_3kyE-=-4oypDXTvAy--jQHa0VhmYoXg@mail.gmail.com>
X-Gm-Features: AUfX_mzxTaQi5lmCrQEStGQqjdfqlwh8KWbld4ds13aZOb9Ofar8XPEAC5gsAkU
Message-ID: <CAGb2v64kcadr1nAisu_3kyE-=-4oypDXTvAy--jQHa0VhmYoXg@mail.gmail.com>
Subject: Re: [PATCH] clk: rockchip: rk3588: don't disable unused I2S MCLK
 output gates
To: Heiko Stuebner <heiko@sntech.de>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Daniele Briguglio <hello@superkali.me>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Diederik de Haas <diederik@cknow-tech.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Ricardo Pardini <ricardo@pardini.net>
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Jun 29, 2026 at 3:13=E2=80=AFAM Heiko Stuebner <heiko@sntech.de> wr=
ote:
>
>
> On Wed, 24 Jun 2026 14:39:14 +0200, Daniele Briguglio wrote:
> > No in-tree board references these gates yet. Boards drive the codec
> > MCLK through the parent I2S*_8CH_MCLKOUT, and now that the gates are
> > managed clocks, clk_disable_unused() turns them off at boot. On a board
> > that relied on firmware leaving the output enabled, that cuts the MCLK
> > and analog audio stops working.
> >
> > Mark the four gates CLK_IGNORE_UNUSED so an unreferenced gate keeps the
> > state firmware left. A board that wants the kernel to own the gate can
> > reference I2S*_8CH_MCLKOUT_TO_IO from DT instead.
> >
> > [...]
>
> Applied, thanks!
>
> [1/1] clk: rockchip: rk3588: don't disable unused I2S MCLK output gates
>       commit: 946352b2f88fd2378f0341312e47dff1e8dc2fac

In hindsight maybe it would have been a better idea to map the existing
clock ID I2S*_8CH_MCLKOUT to the new gates, and add (or not add) new
clocks for the internal MCLK gates.

Then you wouldn't need to update the DTs, wouldn't need this workaround,
and wouldn't depend on the bootloader to set the registers correctly when
booting an old DT.


ChenYu

