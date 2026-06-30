Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFADC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 06:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N9sVQgkbOfiThVXjaJ4LhvYdhIVzMO8gt6AUByFIZ+A=; b=H8/pb8x7o2SRK4mHyZEDT6VQb+
	jciVx6vHPVYhwmIPvLQJZ9Wg5+JDU/JLy2IjCAryRnu+ewEYE/NrsYPzK+4QZpCATWsPA1wgSWVpY
	6Q1wBMB93xA2gAD/3uHDwPLo58UtB1VZjvr26nEmCwkdRDz/D2y70Tyf/08g7CBjuKD6QepOFJg4o
	7ATrnsu3UKn/0Yanv2K5WNGqJ43ysptuv8hxBJ3vxT7lv5mXiUFcFa2g8bm/cemkVy1VEYM5KD5Ly
	Ury1H3k+pyIh3Y2AYY1vxAnD4bAZebkR92RUDl9Nq6kADlZ4V6ciA/6BwBOyBRwRQciuCUseP6ttC
	RsvZWprA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weRrO-0000000FvV8-3MuB;
	Tue, 30 Jun 2026 06:22:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weRrN-0000000FvUl-0vJU;
	Tue, 30 Jun 2026 06:22:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 74CB6600FC;
	Tue, 30 Jun 2026 06:22:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 104AE1F00A3D;
	Tue, 30 Jun 2026 06:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782800536;
	bh=N9sVQgkbOfiThVXjaJ4LhvYdhIVzMO8gt6AUByFIZ+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AOZ2LkPOc1zEjYkhUJx3UNTNuuEhwi49bJW/wbpqOxehVX0NXldS2cksO6+5BDz8S
	 ajDZINz25hbuju7xg3VCbe9rcxWDLnh/t9k+gfAy6/pc5w33jp3/7gUwM1WtH56He7
	 L3+YTagsWAuUr7sYFxA71KUM9PfooG/zUWR9m43vXDnJ44Ciwz7b+B4Y7aTS/LYGkz
	 A7wGLJQSRio8RG9qcBYJY1uiNh39b9rhIQlHJWHpV2swSr5fLolrBjBOG0pBWMqLVD
	 ESKXDXPIjRwBgxXixc83JDgWFhQUs4wtd0LIvrvZZvSCyu1ZRj+fPHMm1ouVI7DIkw
	 S/xAG+302oaMw==
Date: Tue, 30 Jun 2026 08:22:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Vinod Koul <vkoul@kernel.org>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Radu Rendec <rrendec@redhat.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
Message-ID: <20260630-exuberant-dramatic-bustard-068bf8@quoll>
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
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

On Mon, Jun 29, 2026 at 01:28:47PM +0200, Bartosz Golaszewski wrote:
> Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p platforms.
> This is essentially the same hardware as sa8775p rev3 but the PHY is
> managed by firmware over SCMI.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  .../bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml | 51 ++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..4cea6926d1c28872ea7b7aad53088dbbcb74fa99
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SerDes/SGMII ethernet PHY controller (firmware managed)
> +
> +maintainers:
> +  - Bartosz Golaszewski <brgl@kernel.org>
> +
> +description:
> +  The SerDes PHY sits between the MAC and the external PHY and provides
> +  separate Rx Tx lines.
> +
> +properties:
> +  compatible:
> +    const: qcom,sa8255p-dwmac-sgmii-phy
> +
> +  reg:
> +    items:
> +      - description: serdes
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  power-domain-names:
> +    items:
> +      - const: serdes

Drop names. Not useful if it repeats the device block name.

With this:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


