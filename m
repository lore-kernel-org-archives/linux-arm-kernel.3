Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A7DFC9831E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 05:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cwcHuq8u8FHk1FhGe1zoIDQ4d8vQB2fIMXLhU4nJyvo=; b=XIfq9k5mCvmSYkb07u8L1PSm7c
	2+fEHsXpEqLGzOCwdTP22mZ+1pTSqWLmgCo5N3QIoyX9fAyaU+yOGeyMWMe0ireDIX6B9dFz7pDIc
	evE6OzbPS/xU5AGZ2S8F25pZhp1n2Rv5RpxAXZ7s9z6TTdYt+n2OIlYHjDtxQF5lP0HjRwb8addoe
	735ipo2HmLVDO+V2N+OxVSSfMp3TVWizqv/7xkcLZAA1eJb6xSvXgSkTAh8ou1pJfQXrEaEte9M3J
	PPkqCbbnbM/TksG/VVGhfR1l6v0qowmWMCgfOpW+uO6CVeg/lIBWK/44I46ku0QAcywbtNGYauigY
	7jDnuk0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAKew-0000000Ezie-02z8;
	Sat, 26 Sep 2026 05:09:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAKeu-0000000EziR-2wek;
	Sat, 26 Sep 2026 05:09:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 22F9743E18;
	Sat, 26 Sep 2026 05:09:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36F871F000FF;
	Sat, 26 Sep 2026 05:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790399352;
	bh=cwcHuq8u8FHk1FhGe1zoIDQ4d8vQB2fIMXLhU4nJyvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mks3qAiBGR93ufgz/Xo+BYSXDzczpPlBZniZYq2OgkBMacrDNz9Oe8AFi0IMCxL3r
	 2xYo9pX2hPtn15inzJWMZkLli0QEFcQSajWd44u/rkVfXW4eHmiqqU1dfGu2dapBN7
	 50m0clm7/lE7QZnHRwX2G5wUzdU8r8di00MpJCclyGUsitXn9eKOZGuhEE0r0FHcCR
	 KEh6vwQEo7VfL83jDqCnRwWyt8hdQgK8GFXGf8nZWhHSUaQai7TK+vQReuWr/a4PeW
	 JDLtMfmphMbkHalT76BUVKvCEtFPQHB4sccXEAen0/2N2YnkEPv5J9puAyB4U+rfx7
	 Qeo909NLQX3qA==
Date: Sat, 26 Sep 2026 07:08:54 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, Frank Wang <frank.wang@rock-chips.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v15 03/11] phy: rockchip: usbdp: Re-init the PHY on
 orientation change
Message-ID: <5rmluc5rcni32h2f4yv63xvcfnavzfckibj3vls2spt5nnxynh@3bjtgsqhvm4j>
References: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
 <20260915-rockchip-usbdp-cleanup-part2-v15-3-8d507cb1174f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-part2-v15-3-8d507cb1174f@collabora.com>
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

On Tue, Sep 15, 2026 at 05:06:06PM +0200, Sebastian Reichel wrote:
> Changing the cable orientation reconfigures the lane muxing, which
> requires re-initializing the PHY. Without this DP functionality
> breaks, if the cable is re-plugged with swapped orientation.
> 
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

