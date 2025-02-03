Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75EF8C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 22:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GRqksGqJX1whRMsfGahzsD4T7Iy3Pq9aExXckYWHRyY=; b=FtXEtgNpyVC04DZ2jcGoBQmZpD
	2uMv5GA++xlZOWmN+Q8NU9Ezqru7NVo88XParJTN1lCZKNsbq7Jk+BpdDWg+vlvyRqsBhQioocLLH
	QM+4XZ9moCVluiaA4WRQwpMPEvwdZYKiMyhNFuqF7R1wQVGBBPvVLVlE1kgeLN4QtryKKXMhVXB7P
	kdhXxwrHS3Q+ivWR1fEfWlOgGPY7cYSMJ2OesraTD1NNGil8z0K5mBk8DHnj7X63PJYR+nPHCqjbw
	iIFSYfuLNtTWVnwcypaBg2O7EUv+ED3DTuQxjF9Od6HNz68aDjqw/2qrO20aAIn94oAwYb3kKRZ0a
	6SFOZytw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4ci-0000000GlLQ-3SjE;
	Mon, 03 Feb 2025 22:08:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4an-0000000GlBl-3sRK;
	Mon, 03 Feb 2025 22:06:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D7C8EA41E93;
	Mon,  3 Feb 2025 22:05:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C982C4CED2;
	Mon,  3 Feb 2025 22:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738620416;
	bh=OPQj1Abt3xsx43s9Y7uZoXay8fLRxRNIDzNqC0JHfuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V+hxIZm69ec87/kixoCd7sjM5/QXCqZOvZubHEi9QPXScZMTZ73pCrWL6DBEKZEA0
	 M0vThFr4EA0C1QmAK6oshEBEuNR4VKhqb5cn6tr+z8ViUlGaUVZa/7EZmP3ljnQ5Al
	 PxP8pkQnMguBWsQpLERdnpHB3yLFOPRmSQ+ntL8j3JxE+VRzyKGfAfV4/Jz91c9X60
	 nnvtOvjWLXnZH+k26K5p3FwqFYKfG/v87rpSW7Wtiy14YMl09x380kiBhr93acWWGH
	 ceQnfBYSe8by5T/CoXXRxE+yLxDxgysHiuKwHCb3z8FyPQyro3HoHa52w9pMaFCCQ1
	 3YyJ2+kAmEhYw==
Date: Mon, 3 Feb 2025 16:06:55 -0600
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
Subject: Re: [PATCH 03/14] dt-bindings: reset: Add reset controller for
 i.MX8QM and i.MX8QXP
Message-ID: <20250203220655.GA123074-robh@kernel.org>
References: <20250131-8qxp_camera-v1-0-319402ab606a@nxp.com>
 <20250131-8qxp_camera-v1-3-319402ab606a@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131-8qxp_camera-v1-3-319402ab606a@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_140658_025992_AF3BF0F5 
X-CRM114-Status: GOOD (  14.96  )
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

On Fri, Jan 31, 2025 at 04:33:48PM -0500, Frank Li wrote:
> Add binding doc for reset controller of i.MX8QM and i.MX8QXP, which use
> System Controller Firmware(SCU) reset some peripherals, such as CSI.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/reset/fsl,imx-scu.yaml     | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/reset/fsl,imx-scu.yaml b/Documentation/devicetree/bindings/reset/fsl,imx-scu.yaml
> new file mode 100644
> index 0000000000000..6046df8723262
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/fsl,imx-scu.yaml
> @@ -0,0 +1,35 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/fsl,imx-scu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8 SCU Reset
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +description:
> +  i.MX8QM and i.MX8QXP System Controller Firmware(SCU) provide reset for
> +  some peripheral.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx-scu-reset
> +
> +  '#reset-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - '#reset-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    reset-controller {
> +        compatible = "fsl,imx-scu-reset";
> +        #reset-cells = <1>;

This should just be a property in the parent SCU node. You don't need a 
node for every provider.

We need a binding for the SCU as a whole.

Rob

