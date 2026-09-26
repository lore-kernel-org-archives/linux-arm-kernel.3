Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8036CC9831E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 03:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jf1FH52jwHgmL5zPjI/lMbEvsc5J4y9mrndOtK0fvKQ=; b=routXRoaevMg6Eceb0BeG8syFG
	gO1CaSHa9PppaHPgOPqHrt5F6lqsAEXnTkQCjxFvDHPHKaWQOTut0cyg/QcJlLO6IkiuQE2rCtseX
	EOZVRE09rPdswgJQRN+rsR5uy22AU2dh/YrFSGV8ODcbuAwmfz/P71MZOriRpJ44lOPAMghdx3LJR
	Am58NVBd0AfKDkWixUuqSOB2JqqT4eiP0C4RAdmFOYpV6ps1r9tvRWWrLgvwYlLjiCx5ohfzkTlOY
	904abzLQmNcpe3A7rpiSQvGJ7PeHjab8Q0T2Z/V9+Vtc0oDPPmpOBF3e81L5XX9o5ClQl5DpBUyzr
	cZ+CHZ3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAJAg-0000000EujE-1Zos;
	Sat, 26 Sep 2026 03:33:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAJAe-0000000Euiu-2ixz;
	Sat, 26 Sep 2026 03:33:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E8E960136;
	Sat, 26 Sep 2026 03:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA58B1F000FF;
	Sat, 26 Sep 2026 03:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790393630;
	bh=jf1FH52jwHgmL5zPjI/lMbEvsc5J4y9mrndOtK0fvKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TPYWDtP0OrK+F8SdC2HWTJnV2b8oqaGUweRy3xPpc4tDcfq6EnyVNF+j/5lkEkXef
	 w4bnEjb2qPZtAFtCGuvLi0QxxwWfOD2LCVg6qaRyg1QaFDlYZYJkbyvQ8e8+cdyvX9
	 lx39p7JslJ6B4FZ9ntwMb6By7qjJPc8HXdB/Hhd3aq8a3tldQMztprMNFBwTyovcii
	 0PfwTh8OMFjNvL4coegGmIJbeYdUccEq2u4NBbvHvzp/2rK7w3z7oMNfEH0vO6wjfL
	 SdalEgR5RQW3nDTY9QYGCXzitRBNmHMYLsC58uaSyoYXc4A3d7ATGEUpCQCdF0hHuW
	 oVfdcFn7kwTVg==
Date: Sat, 26 Sep 2026 05:33:34 +0200
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
Subject: Re: [PATCH v15 06/16] phy: rockchip: usbdp: Drop seamless DP takeover
Message-ID: <zuabgt3rv3bhpjxayb5rvdak6ocnigy6ip4avzkjo3lltwtjps@f3hc5lrqjj2t>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
 <20260915-rockchip-usbdp-cleanup-v15-6-80e2c11d1ce8@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-6-80e2c11d1ce8@collabora.com>
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

On Tue, Sep 15, 2026 at 03:49:53PM +0200, Sebastian Reichel wrote:
> Right now the DRM drivers do not support seamless DP takeover and I'm
> I'm not aware of any bootloader implementing this feature either.
> 
> In any case this feature would be limited to boards using the USBDP PHY
> for a DP or eDP connection instead of the more commonly USB-C connector.
> With USB-C's DP AltMode a seamless DP takeover requires handing over the
> state of the TCPM state machine from the bootloader to the kernel. This
> in turn requires a huge amount of work to keep the state machine
> implementations synchronized. It's very unlikely we will see somebody
> implementing that in the foreseeable future.
> 
> As the current code is obviously buggy and untested, let's simply drop
> support for seamless DP takeover. It can be re-implemented cleanly once
> somebody adds all missing bits.
> 
> Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/linux-phy/20260612164107.C7DB21F000E9@smtp.kernel.org/
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

