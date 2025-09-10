Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4393CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 16:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Z5dAjV7oKQmSuilggnfDGLIk07Vnzobo9EXaHv71xA=; b=XCR2QcshNMKGRgUpqxpJc4G0wS
	Uf8vPqbKgpQ1JPWJNoQ0vNCRYZYg96UT+NiXUJeZ6J0jd34siod+zx0fXmmcmzhSV2ytSfHQyngHv
	GKQNLaoTNFe8jsHGHM/9C2AUNm4JeIgDr9jMiqWiJ0quOvXZm2+/bhHVe8lwAXAFXZcUjDmqOfPyJ
	AOsiDQFUmfW9cAFW6v8N8wDHaQ16Jpjn5CDxZ/DOKWMSgRhtls2vuQEoIAL0TyOPi6GNbTw/yH+62
	UDIUrlDJ/pjdlLv6H2gxcSJEfOrnsPd9g6e08fIfop0cIgzByOeaZH9Zu7LLrN6taQ1yRBQGf4F99
	lYs9Xygw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwNyt-0000000Fb63-48ZG;
	Wed, 10 Sep 2025 16:47:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwNys-0000000Fb4z-2kc9;
	Wed, 10 Sep 2025 16:47:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4994C418C7;
	Wed, 10 Sep 2025 16:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80388C4CEF9;
	Wed, 10 Sep 2025 16:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757522858;
	bh=5LVOay0CBSTzKX6JQb+omIyOhnTXbtPDOJBt3OJI80U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=s0zO5tM1IFmM+YDTx3+eUjNq80Vk0WVQ5hpj3j1jEG1rmZUYEX1OZDKOH2XNRAS95
	 X1wL4schmp48KEFQjOmi6xash8eHMiP54yqP4d77D2PbfYJ1pCy4iriDnSECOUB8J/
	 b6q37uHO0fW/DgcgJgOmX/PUc1vxSP4xdQVyDPOJXwREgy8HpPhVEtsCAoo/OxOA3c
	 MVk68IchiwQ+qzWpwB9yGeuEDVtYocvjMvzOyxpDk+ww0bu38FiseL95MY2C3JPXYN
	 aPR4zTs9SJlWAM3bG2XXeprrgLvP8fm13dkSdhtrHem84BgZz4IyrWhCg+D+Z524yM
	 wm2qvXkYyiG2w==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Diederik de Haas <didi.debian@cknow.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Michael Riesch <michael.riesch@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, stable@kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250616-rk3588-csi-dphy-v4-0-a4f340a7f0cf@collabora.com>
References: <20250616-rk3588-csi-dphy-v4-0-a4f340a7f0cf@collabora.com>
Subject: Re: (subset) [PATCH v4 0/7] phy: rockchip:
 phy-rockchip-inno-csidphy: add support for rk3588 variant
Message-Id: <175752285211.484319.18097786132863236205.b4-ty@kernel.org>
Date: Wed, 10 Sep 2025 22:17:32 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_094738_725945_C9DD1E70 
X-CRM114-Status: GOOD (  10.67  )
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

[2/7] dt-bindings: phy: rockchip-inno-csi-dphy: make power-domains non-required
      commit: c254815b02673cc77a84103c4c0d6197bd90c0ef
[3/7] dt-bindings: phy: rockchip-inno-csi-dphy: add rk3588 variant
      commit: 5072b8e98eef4685a5a9a8bae56072cb65a2ef69
[4/7] phy: rockchip: phy-rockchip-inno-csidphy: allow writes to grf register 0
      commit: 8c7c19466c854fa86b82d2148eaa9bf0e6531423
[5/7] phy: rockchip: phy-rockchip-inno-csidphy: allow for different reset lines
      commit: 260435153c90c8e90553e456ec43578834a14a71

Best regards,
-- 
~Vinod



