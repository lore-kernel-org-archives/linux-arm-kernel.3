Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511BCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 15:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ww+pHKZg74DUFG6ncydDQKKCwcpR6a+00OV8GPhy5PI=; b=tHN/K7c4AmvyQb
	YEHk7xYN8xZemUeIyEdhcs8uWqKuaxXNpqbevoKpVCk/r8UVWn2k2rmCNromKNQrcPbcNHmbzhJcc
	iA4uSAq9z4QP3iCSq1x3im7YfSdEp2dgrFpXj+I5IzejcKtV8OtVjKXFTCrdZdgr/BuVKIklSzsBZ
	rD37usVU4KRpQ/g18eOIgKlmKc1qawkhaRgeclQDHQPNwOqNXF68tgeoRRmZyRkV7PjTKOHQrixbo
	Y+WAXxsyxZxL9stLWggo5P5hzI6PL4iSxOoUf1Ii8XPNTCI6D+HlE4IFJ8qASTP5zDXNSfPo1+g+Q
	yAT+Rusc/XEpfeFP2H8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weE3K-0000000F5xo-0KHL;
	Mon, 29 Jun 2026 15:37:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weE3I-0000000F5xO-0vdF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 15:37:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 90931600B0
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 15:37:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4921F1F01559
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 15:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782747459;
	bh=Ww+pHKZg74DUFG6ncydDQKKCwcpR6a+00OV8GPhy5PI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=S4bo1/NS6LVLt5l47pmDWhy7nNPQkUumHquEuongQIuqIhcd0m26CxdETJ9yztM0u
	 edKF4Fb5m9z8JVhHO1QocawGXc/p8+zXptZkHYSvAS3QWel/xYrIkY9wZUNSHBmawl
	 HvUH52/1UJhxSo2klJYMiEsw4rOpIre7iRfUuY7Kdd0T6JmLjkqa7p+X1WK40ChBVC
	 2MCgTsKC4QKW5rerwlBjtFrWvu638DkXbt08mgE6pC44LJv0Edrm/D2HHEA7bN9iMC
	 hdvZxly1QJepLYDgJ+JPWd9uNQ3ut+L1vqBsuYAdcMxsBqt05ZmyxzTQI+qet6//py
	 C6h1ToSdTwurg==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39b14cf91b9so5415921fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 08:37:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq3uDPMlNPo/0QFZBpb1T28bydOj8R3YEjasOG649cCrqKRb4rkxtoFhpM+slnk4yaS18EuX3d017Hu5VAx6+UQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz44b9z17I7rANiLhVm52v2nx/+IVagdB15ssJ6Ej5fKPeGa8jk
	nkkZRlVe8wn5M9/dvrLMk7gnyU5dQhJ00DaLuHHeX2Kg80D6fJWljv6hLJjYKP19Hr/684yz7y8
	dPlwkknc57Ew/9oDJRfSjR8EZ+sZi9SA=
X-Received: by 2002:a2e:bc20:0:b0:39b:14c5:968f with SMTP id
 38308e7fff4ca-39b14c59b59mr7009611fa.16.1782747457276; Mon, 29 Jun 2026
 08:37:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com> <20260629-a733-rtc-v2-2-7b72112784f8@baylibre.com>
In-Reply-To: <20260629-a733-rtc-v2-2-7b72112784f8@baylibre.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 29 Jun 2026 23:37:21 +0800
X-Gmail-Original-Message-ID: <CAGb2v64axqUmObk1XSEQSvGHSSvHP=T5gMOkfo8ae05Qb7HB5g@mail.gmail.com>
X-Gm-Features: AVVi8Ce8qbicWoJYXojluhV5Day0h0aZX_ul2VgZck3W_NUcJMBDtHnhi2_S0Y0
Message-ID: <CAGb2v64axqUmObk1XSEQSvGHSSvHP=T5gMOkfo8ae05Qb7HB5g@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] clk: sunxi-ng: sun6i-rtc: clean up DT usage
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
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

On Mon, Jun 29, 2026 at 8:42=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
>
> With sun6i-rtc compatible devices, the "ext-osc32k" clock input
> is optional for the devices that support this input (r329 and onward).
>
> Probably preparing for older SoC support, the driver does something funny
> when parsing DT. It check if "ext-osc32k" is present in the clock-names a=
nd
> if it is not, it uses the first clock as "ext-osc32k". This clock will
> actually be the rtc bus clock so what the driver does is wrong.
>
> At the moment, the driver does not support the older SoCs that would have
> an external 32k clock provided on index #0 so just remove this quirk.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

