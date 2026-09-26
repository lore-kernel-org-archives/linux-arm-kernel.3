Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79E3C9831E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 04:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xOUdZyaE4ZM74h/zxVnXNgegJ6IkaZJcYOAv1Dl9nzE=; b=mjUKAXhwRZNmLgQemCHPuwyCq7
	t0DQr5Ez4MZJGlCQhDYqusy2Hiy8V3WBiZTPyGBspr2BJYruD25TRpFQg43gI3SYhxtKO6vVw2ZGq
	u0oiA+YGnuzkSiFgQaNMpTATOypX7AoeTeWyG4/BRarzyAs144Xwd+v38NUwlOunTEhva3kWtIUzq
	wu0NCtSfOw6Up3JyOgvYeUkAjh4MJCSsmVy4XqtYHbelfrz0fq7otw9uJWmtp2+Y6xxptRnmnqQ0Z
	TDlVgJtA/eth4x2XPLu6zA3xLPsUPkYhRnVF6K49Ogx8I30mWn2wmcMrsUlpq+DYr9FKW2LsRd1Td
	YiWcmZ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAJeP-0000000EvyH-0PRa;
	Sat, 26 Sep 2026 04:04:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAJeO-0000000Evy3-1F3M;
	Sat, 26 Sep 2026 04:04:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F3F5943DB2;
	Sat, 26 Sep 2026 04:04:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED4BD1F000FF;
	Sat, 26 Sep 2026 04:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790395475;
	bh=xOUdZyaE4ZM74h/zxVnXNgegJ6IkaZJcYOAv1Dl9nzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FpM5+rnVVdGtECbvQlEoMK/d8cozDmixctv/d+o5Q68UYuWWjUE5b3QM3bEtuna1v
	 xeAvjVWg9mOisCT6dkPzPHbD6I2b3WetxQMK2N35naNQINRGZ7AO0UwiuHKakbqOXY
	 f+3A0clTtptG0MApsK2tZ05Idw98vZLzGfzuKbxZbGxWmiVsBeH8TULsr+8VFkQ5Tb
	 UnruqkD+Xl8jI7dK3BpQcEl4Hv4oU1DEffFOO5FoqSa5cxCeJpfWRoGDc3jNJAOpsZ
	 +s/zbtOWFrkPHeh96WiHvs4R2iAt6OPLt32e+oc/RnkE8souTrvCbO6L1HLy6yDESb
	 mOqnK7avDNFEg==
Date: Sat, 26 Sep 2026 06:04:16 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Frank Wang <frank.wang@rock-chips.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Yubing Zhang <yubing.zhang@rock-chips.com>, 
	Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	devicetree@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v15 12/16] phy: rockchip: usbdp: Limit DP lane count to
 muxed lanes
Message-ID: <rzxb3np7snoj52rn2cx2rfemelk3kyjpd2dr5v357td4vkrpma@cxun5v7lnojp>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
 <20260915-rockchip-usbdp-cleanup-v15-12-80e2c11d1ce8@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-12-80e2c11d1ce8@collabora.com>
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

On Tue, Sep 15, 2026 at 03:49:59PM +0200, Sebastian Reichel wrote:
> In theory the DP controller could request 4 lanes when the PHY is
> restricted to 2 lanes as the other half is used by USB3.
> 
> With the current user (DW-DP) this cannot happen, but as the check is
> cheap and users might change in the future protect things accordingly.
> Not doing so would corrupt USB3 usage by the following code configuring
> the voltages.
> 
> Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/linux-phy/20260612165546.98E1F1F000E9@smtp.kernel.org/
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

