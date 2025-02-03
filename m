Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F17C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 22:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bKmZfXh0k8QAchA+1H3EvugPvqoTZQZxd+OiB8JSH+s=; b=AnvRU+lo5hh3mdOx1QTZutxd7o
	37zKm6/2fp3Az5kCXJv0UqeJcD4goP0VAvSO8AX3vctNyWSwOupQ32KNfDz55xqAC2NmIJ062YH+A
	Q/vSKduYPDzvWSSqdlvUkmvzh37yosmK084WB+jiqmLO1JwMBcULf07WuZ6GYfG9+YaR7VhtJBaxQ
	gLXbAqghEZUnh2NInEb7vHaJzpjSQGZQxFwJcdry++kHQLtBJAZlIC5daIf5kZId95VviKSXaDAro
	qx4f553lQPoKhsBT2rDDm/xQiK9MTljqQ+B4YWE9PzM44231d8T7HzzalJ9J7gXsDnuVmmjs0h2Bu
	S82GW+OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4Xr-0000000Gkt4-3jQB;
	Mon, 03 Feb 2025 22:03:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4WW-0000000Gkid-32ua;
	Mon, 03 Feb 2025 22:02:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2B50E5C3086;
	Mon,  3 Feb 2025 22:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F7D4C4CED2;
	Mon,  3 Feb 2025 22:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738620151;
	bh=4MG6GO9DO9XXRUtRL6e1XPm8IlP29lzu4zko2OYSN4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oMpqO6VkqzpV+wbAibm7M8luRjJhxkCgqeGU7rn9lXqAg4ZtVc1T5FmKx3eq6W2xG
	 consJmclmmkd7RVsl+PIG1Q+LinmL9Pdm8cQUnkzO1Z0+W8n8tv68OC6VXmiEkUuTv
	 XKrEH3CIw0jZ3VZTlKR6LaRLO1+2hFrG/0zATTbcycZoicVhtSsWTp5Y08uOMR9dYk
	 SrsKZaSDuCfNnW9LmkBev3uEA6lv01VdSgyO5nYUzYJ370KV1Jz3F8blq6rLpDsyxx
	 I86WpWwDG0MWroQky/1hjH/4JLm8IbI1FwI92BqwtDQ67KZN6WMGZahMdroT3yz7vS
	 WEucqe692Lp4Q==
Date: Mon, 3 Feb 2025 16:02:30 -0600
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, "Guoniu.zhou" <guoniu.zhou@nxp.com>,
	Robby Cai <robby.cai@nxp.com>,
	Robert Chiras <robert.chiras@nxp.com>
Subject: Re: [PATCH 01/14] dt-bindings: phy: Add MIPI CSI PHY for i.MX8Q
Message-ID: <20250203220230.GA120569-robh@kernel.org>
References: <20250131-8qxp_camera-v1-0-319402ab606a@nxp.com>
 <20250131-8qxp_camera-v1-1-319402ab606a@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131-8qxp_camera-v1-1-319402ab606a@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_140232_852600_98D56C2C 
X-CRM114-Status: GOOD (  14.27  )
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

On Fri, Jan 31, 2025 at 04:33:46PM -0500, Frank Li wrote:
> Add MIPI CSI phy binding doc for i.MX8QXP, i.MX8QM and i.MX8ULP.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/phy/fsl,imx8qxp-mipi-cphy.yaml        | 53 ++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8qxp-mipi-cphy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8qxp-mipi-cphy.yaml
> new file mode 100644
> index 0000000000000..c6cbedd9ed114
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/fsl,imx8qxp-mipi-cphy.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/fsl,imx8qxp-mipi-cphy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8 SoC MIPI CSI PHY
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  "#phy-cells":
> +    const: 0
> +
> +  compatible:
> +    enum:
> +      - fsl,imx8qxp-mipi-cphy
> +      - fsl,imx8ulp-mipi-cphy

Where's imx8qm?

> +
> +  reg:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - "#phy-cells"
> +  - compatible
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx8qxp-mipi-cphy
> +    then:
> +      required:
> +        - reg

How is the device accessed with no registers?

> +        - power-domains
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    phy@58221000 {
> +            compatible = "fsl,imx8qxp-mipi-cphy";
> +            reg = <0x58221000 0x10000>;
> +            #phy-cells = <0>;
> +            power-domains = <&pd 0>;
> +    };
> +
> 
> -- 
> 2.34.1
> 

