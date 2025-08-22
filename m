Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE25CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 21:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xhd4zX0xr/bjx+0XpdiN833qSdKEzeUKgasarfH8c44=; b=Fb4e9153N6q+HVOlj9q3FYdigw
	P4GkjvkTWHC3BMnAwBT8qS5iiNkc03d0cZFwKO6MaPPzM+9O3DT7w3oaw8AucSRrFKkgdBF5VIRFd
	UPuoY/hACsUHfhmBlQua9UwcGYg+neBPqP3xY/5SeuGdlYAxFTDeJFxsvqkyyCdTy8oIM0uH9AdTk
	7+kDNZyiqV5+/yBWON/8jGxFMCRxofY5VKYZARd3ZAGmGet6Xufjm3cotGKwCrTtwGm9tkLd3PMaf
	LXQAkegMlRHqbERywCkDmgzcp7ndYAfUFy3PJpQSlavqXrLFGSpXWwYNxOKoYm2nbA2LHpAzfXsFY
	c5uRR3Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upZbL-00000003XWq-1GPo;
	Fri, 22 Aug 2025 21:47:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upO9i-000000023l8-2KMS;
	Fri, 22 Aug 2025 09:33:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 05D8C60263;
	Fri, 22 Aug 2025 09:33:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 281C9C113D0;
	Fri, 22 Aug 2025 09:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755855233;
	bh=l/Mx1B8W3cmAkQuq0/d3MKrqsLFHRjyPr8nhD/OLtq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qW8Dkhm50XyxlTPMvx55jL4RnR3x8r5pj34wFRwmGzkdty04mftV1GHHALpktBWG2
	 JvRyRTQOGAAJlDnm0MPFfbM7RMiPv/E7bfGMlNFGqumhPqqYrOkG3Own1BOmnKdmhg
	 jAKbQqlaOvj3kuJPTgubvk5Rm/pjYd5LOk7TP0fypKuRb20WXtHLkj7lyizx4n5Y/2
	 jUUe29woLYmRD5K1NytUiu/O6GLVLwNQuoBlFqkqCguypfotlahlckKJiTTWac1XJX
	 wcNXXq2KmnsXJjkSZx59ji1v+aaDLbwghzDGLD4vI/nxZKeM4CiCB9D18IUcxx9Yc1
	 7GRLI4UbKJfJg==
Date: Fri, 22 Aug 2025 11:33:51 +0200
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
Subject: Re: [PATCH v2 2/7] dt-bindings: phy: rockchip-inno-csi-dphy: make
 power-domains non-required
Message-ID: <20250822-chirpy-capuchin-of-apotheosis-1133fc@kuoka>
References: <20250616-rk3588-csi-dphy-v2-0-7a94f079b712@collabora.com>
 <20250616-rk3588-csi-dphy-v2-2-7a94f079b712@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250616-rk3588-csi-dphy-v2-2-7a94f079b712@collabora.com>
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

On Tue, Aug 19, 2025 at 01:00:36AM +0200, Michael Riesch wrote:
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
>  Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> index 5ac994b3c0aa..42da616ae2e3 100644
> --- a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> @@ -57,7 +57,6 @@ required:
>    - clocks
>    - clock-names
>    - '#phy-cells'
> -  - power-domains

This could then be restricted per each variant in if:then:.

Best regards,
Krzysztof


