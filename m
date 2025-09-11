Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6107CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 09:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K0km93K0aEijBUWbpPd5UCCfJKPcIzvJxr0PWIyYCV8=; b=HnCsc4a0pfDeahhp4tfW7XFDPL
	HXswW7CRur8bg2T1s01eySEL8W1I5IZRhAO6Rs1sEHA1+wBc59xkYcccp7DhPtL6jM4xIXzOymMVR
	jOG3WzEs5L5o8KDM2IqNmfDpwzQ/sJPxJpDpIUGoqRqg/AjDNZ5cKX75PGHwn8HHFV3r4E5XslnpV
	CLtF3mv6C2gY1N1zWsXlra+fLsbNY1VoKfFOne8P6pBX9ETn5MBgOFJObWoj2sAC5Tq88fd1MCu1o
	Lgu4uAQ1kXvfktht7Oyw9Pgfm/QOZYYKAphFv+DCLW/sykntNWXiyLykglEuF7XDRFL1G78P/e0zd
	xjx8ZVjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwdFr-000000020CM-1P5Z;
	Thu, 11 Sep 2025 09:06:11 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwdFp-0000000209x-0MgM;
	Thu, 11 Sep 2025 09:06:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=K0km93K0aEijBUWbpPd5UCCfJKPcIzvJxr0PWIyYCV8=; b=f/dE23N60ADgK8SxUUU7fYKFfa
	+wXbwRQoRv2MyKN8CRUydcne/ZBrP+PRhWcxTEakiAYBmAGXvmkU7qXh2a28144dfoCRn+sE2gtVi
	lZdSStcL1CQLukgoqKmW75+1dbZvkmM0gd0I3B9h7FhOnHfPv2ckhq53XDyD54FvhziozSw7TzcqU
	LVqSXEtXSsh7M8bm+BOnYWfVnSk21daLQqQVSLEaROzo07X2x96itgUaRf6PU8umqL5KTTwwxRo7o
	orI35NSlmXti4xLyE8jxPvfFk8g+fUKpmZzgTS9Guwcm/2TS/vCWzO8ZiST8bM6cmRoe62Tql+K7e
	Csj34lEg==;
Received: from i53875b0e.versanet.de ([83.135.91.14] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uwdFb-00005b-5A; Thu, 11 Sep 2025 11:05:55 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Collabora Kernel Team <kernel@collabora.com>,
	Michael Riesch <michael.riesch@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	stable@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v4 0/7] phy: rockchip: phy-rockchip-inno-csidphy: add support for rk3588 variant
Date: Thu, 11 Sep 2025 11:05:43 +0200
Message-ID: <175758154013.610665.15945900188702007855.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250616-rk3588-csi-dphy-v4-0-a4f340a7f0cf@collabora.com>
References: <20250616-rk3588-csi-dphy-v4-0-a4f340a7f0cf@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_020609_125917_ED8A3563 
X-CRM114-Status: GOOD (  12.72  )
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


On Wed, 03 Sep 2025 19:04:48 +0200, Michael Riesch wrote:
> Habidere,
> 
> The Rockchip RK3588 features two MIPI CSI-2 DPHYs (not to be confused with
> the two combo MIPI DSI/CSI CPHY/DPHY blocks). The CSI-2 DPHYs can be
> supported using the existing phy-rockchip-inno-csidphy driver, the notable
> differences being
>  - the control bits in the GRF
>  - the additional reset line
> This patch series adds support for this variant.
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: soc: rockchip: add rk3588 csidphy grf syscon
      commit: 92f96706947e902fd9156cdcdd61c9a44b4b186c
[7/7] arm64: dts: rockchip: add mipi csi-2 dphy nodes to rk3588
      commit: 871b0391ccf3feb831e233ba3e972663c057b946

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

