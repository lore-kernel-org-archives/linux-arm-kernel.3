Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DD8CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 07:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BYQ1SuiowZ8289ANJ63KzwleHPzYKHuMoLUndme32H0=; b=R4c/7VXen367Qyj73ShfZ192Wi
	WQjsWgs7d4VR6YFf7frbeNHzzD2RRm9yrsUWMGoBQ0cAqB0gPtQUyRpmLH51lyn42I0mKVje/dbO5
	fuJGwhaoaBXxMvrfzZmOaMsDW1sC52aKHO02DB4WGUgiX3HUAlYzm7qtrD26xXVLg9G5JRqbl4W2x
	G6yiSkALJJh0fU4ZTWIiMd4yCyj0nj4vpvUEffVmOQHX7HE44GlY7bS1v0KxluzIPIlHTiWWE1sv0
	v4ls7fo1O18aruVe39fnsVXP6Azyi92mxoqpaKjXEAQciTxMRh2nzl5Z5N1KVyYm7uri1MF6nb9VT
	rV6okHLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utLuf-0000000FsFO-05h0;
	Tue, 02 Sep 2025 07:58:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utLqI-0000000Fqhs-2lCJ;
	Tue, 02 Sep 2025 07:54:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 671F843DDC;
	Tue,  2 Sep 2025 07:54:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EDD7C4CEF7;
	Tue,  2 Sep 2025 07:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756799654;
	bh=3nc/wkBY2bIc1bkSOsEmjMvNtgdGFa44cp61YSHyt68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J+9aQw9ulXkFfxweHD0usIU9tUka6m/saOX7lfURvNS73/s+vZUjXpPiwvIF0aPs9
	 kMLLegURfcv+TrpfzoGri1z3EELyoDPZTwLlumruzT4Fg+71EWCh3/KqtjQM+nO+5O
	 WA39kPdE4IiGiY/L1BCXWnJ6etZuDIqW3nZ27GXvyUGBAjbKtYmDWY02Lj+OteWC/+
	 UTmSurQWJz12coiGLFdRx21aeS1Zu61/y8B5sgauy4bW/kXhH6rf5GliYRFALACxP7
	 gWN+LYta+UqsP667bGMEMOzWMGDIofIa1g12JVsHTsdlx2kpD/IO9C6Ps14ZUVIiSC
	 UztVm3kqf4aCA==
Date: Tue, 2 Sep 2025 09:54:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kever Yang <kever.yang@rock-chips.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Diederik de Haas <didi.debian@cknow.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Collabora Kernel Team <kernel@collabora.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	stable@kernel.org
Subject: Re: [PATCH v3 2/7] dt-bindings: phy: rockchip-inno-csi-dphy: make
 power-domains non-required
Message-ID: <20250902-diligent-satisfied-oxpecker-10ea0e@kuoka>
References: <20250616-rk3588-csi-dphy-v3-0-a5ccd5f1f438@collabora.com>
 <20250616-rk3588-csi-dphy-v3-2-a5ccd5f1f438@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250616-rk3588-csi-dphy-v3-2-a5ccd5f1f438@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_005414_721613_869D3A3D 
X-CRM114-Status: GOOD (  15.06  )
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

On Mon, Sep 01, 2025 at 10:47:43PM +0200, Michael Riesch wrote:
> There are variants of the Rockchip Innosilicon CSI DPHY (e.g., the RK3568
> variant) that are powered on by default as they are part of the ALIVE power
> domain.
> Remove 'power-domains' from the required properties in order to avoid false
> negatives.
> 
> Fixes: 22c8e0a69b7f ("dt-bindings: phy: add compatible for rk356x to rockchip-inno-csi-dphy")
> Cc: stable@kernel.org
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  .../devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml   | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> index 5ac994b3c0aa..9ad72518e6da 100644
> --- a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> @@ -51,13 +51,26 @@ properties:
>      description:
>        Some additional phy settings are access through GRF regs.
>  
> +allOf:

Please move it after required: block.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


