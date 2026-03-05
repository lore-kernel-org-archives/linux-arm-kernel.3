Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2895CF30955
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 12:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1Soi4u0zOToM+4cvb9M54dFFqUFlTLNETgvWAKHxCU=; b=sEAOMHgTdsm9mEYTC6ZR1ItWpG
	LiKAxmYQE5s2GTk7R/m7qncDIXC9utB4GZevYgNMjC0L+2sTitIBo5jXcHUssOADq/0Zw0j7Nr2K2
	GnXxGgZ42N6R1IROYoNlXnFZUAzFBAnAF2O3wWfmlmW40SfXt3ctoqCqa9lwr95FxSHuVOdTKcFIb
	uVjmo9WGlqqQp2/DcMAcO31Abvseq0AXqDJuYdIVH3xt/I4VvlnYiiExC0IsqhZhvAf/tCAlkzTKT
	NCnGu/AtciklRSCJb/nNTl02Ld3k2T//RlqmKwVdMDOaZ33CDhJcoOcmYkoOHssYATmH5YTEtVeLm
	6Y+N/OGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy83d-00000001nYg-2YQ5;
	Thu, 05 Mar 2026 12:44:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy83c-00000001nYG-0Fxc
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Mar 2026 12:44:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+1Soi4u0zOToM+4cvb9M54dFFqUFlTLNETgvWAKHxCU=; b=gi1d0vZ33cAQl9faWzKoukPyzL
	buHcsWoekmrzpSAmswVQXcifC5401sSrmtUIsMmp7nHPiyFS0LzA1abygLpu+Pibc6G25WhxUYyaf
	yieEJPI7F2o8nj7bdDZOIAA/TwWjJB8eu7J223Mk+kRz3rG2jxofjRx5Jq6tl6PBTnUMaPvdC5ayF
	/zRnycvgv7jWDlWxJFU91XPIrSx4G0EXqThjOeg3yWv9jepPn69xmNLYOjKUl3x7W9FmnzKYtu0GS
	M91QNnCbgc9GqGw2JKPNW1kAEd09dfe/m4VDNMVx3AimtCFFDqxrmazyWe4aVRjZxUaPOralecAhY
	4bcAVPWQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy83X-00000006koR-3NJy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 12:43:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DDFAB424C9
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Mar 2026 12:43:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3BC4C2BCF6
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Mar 2026 12:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772714631;
	bh=+1Soi4u0zOToM+4cvb9M54dFFqUFlTLNETgvWAKHxCU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Qb0jG97edmb3U2qfJOZ8W4namHJQLjHdyLa/yO8Shzxok1cow1oGiOPDZPwW1C2aX
	 qfpAXVF5aCFXZLxPSzvgKeKSxO9o5XsLWHV8Z2J8C79wGhUQOpuNdTpOU9Dzdkkz3p
	 TWGjcAKnefLsljHAnEj5fjLLXkP0UfERnPvGWuc0ZQekEOQjNXH5K1HWRbh9ma16qv
	 6TkLXMUEkXlMirlttkcaQYFOEfMZ+oBljrNq1F3YIMePzlnhhwMurIVZGke7gCj1z9
	 cdj00Q5OZUBdizfbKPYLlLKP8RyJI5QMF03gjMx1z3TalYyUwSwiQn9mCL6ZfAo7SC
	 0i9QiFLq3vXMw==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-793fdbb8d3aso98541747b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 04:43:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVi2cgQhA2ZMlVsKjZUgaFQyOtlkttKCavBgD01rR69J5ZB8wmVfaXeqghf8omTIuUPM9Q+zdWeB7xNxKv/n0nU@lists.infradead.org
X-Gm-Message-State: AOJu0YyLZKBovO44GYYkv68pK2nDhdSQrkYBSnkcM1K5geaPbuug4E8e
	kQy8/uvR3uBZnwi+8lvQtRGiSYV8ODJm/NydS/XNkqQE5gcvsa1otvFKhhFesf2PnnBUpn1pFRU
	9Czj0o18e8p/188hZEejuHsh5Wu3Gu7E=
X-Received: by 2002:a05:690e:448d:b0:64c:ac70:9420 with SMTP id
 956f58d0204a3-64cf9bdb391mr3524893d50.76.1772714630723; Thu, 05 Mar 2026
 04:43:50 -0800 (PST)
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com> <20260304175735.2660419-19-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-19-vladimir.oltean@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Mar 2026 13:43:38 +0100
X-Gmail-Original-Message-ID: <CAD++jLnCtu20rXcg7sMVLBi24EohscJoz0kN46XJaKPJt00O2w@mail.gmail.com>
X-Gm-Features: AaiRm53Fhg5bHrVPoZ7KkxLKre-rHWPjFXtzmvz74i7G3hPs_-fZQdYeAKMF5Bw
Message-ID: <CAD++jLnCtu20rXcg7sMVLBi24EohscJoz0kN46XJaKPJt00O2w@mail.gmail.com>
Subject: Re: [PATCH phy-next 18/22] pinctrl: tegra-xusb: include PHY provider header
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_124356_214754_05BA9D51 
X-CRM114-Status: GOOD (  13.43  )
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

On Wed, Mar 4, 2026 at 7:00=E2=80=AFPM Vladimir Oltean <vladimir.oltean@nxp=
.com> wrote:

> The tegra-xusb pinctrl driver is also a PHY provider (calls
> devm_phy_create() for PCIe and SATA). However, according to Vinod Koul,
> having PHY provider drivers outside of drivers/phy/ is discouraged,
> although it would be difficult for me to address a proper movement here.
>
> Include the private provider API header from drivers/phy/, but leave a
> FIXME in place. It will have to be moved, eventually.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Fair enough, is this a regression so I should merge it for fixes
or just a nonurgent fix that I can apply for next?

Long term a custom device can be created from the pin
control driver so that the Linux device model can be
used to move the driver over to phy.

Yours,
Linus Walleij

