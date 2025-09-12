Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F210CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 07:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tm8wW8rJ5HamB+GNi2R+gRL0uomrNvvmECVxM72VZuQ=; b=opRuzNs9vCI2qCcmpeq/9rwODa
	n+Jj2F1Hm2R9sEf8VEzLcpBc7AEHkAzPz9Oe+8/OJUDUNQrzFkZr4oPbHyx/Q5bv17sqegcUC+HMU
	TmQvsH+B9MQ5xOiWB0y07//J3OHtaZHftoGjFpsmUrm6Q6yeuAthFjFDgQLM1PSKZnghoRo55uv87
	eOn2RZ0fF/vwRTtOm5hbi9+oeMbLAjkhqy62YWSti/Fk4CFP3Rs2rUkUCqy+sNvMcQGASHK/jPdSJ
	lVZyboEuQgZxNpvkiZNeK8Mbht62w5opnDwE7uM4yVa1Ve5HhTkBLpKdGYlS0sjVzU2m00RoX8OFn
	YkX4aHjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwxvu-00000007ZTe-17ff;
	Fri, 12 Sep 2025 07:10:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwxvt-00000007ZTA-2BCR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 07:10:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E6EF5601AE;
	Fri, 12 Sep 2025 07:10:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06063C4CEF4;
	Fri, 12 Sep 2025 07:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757661056;
	bh=kH1ZM5L4t7BfvEeteK0MeurL3A2A3KfYQStVeT0e7fA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KPfvSSjsZrLz0w+4+qKCW/w0uxxDtpAr5FGV9S+UJferb4XSoBgysLuh9LNPiHll8
	 aKeTJNbroC7g6vje85A/9un+W1ka6y66ClNuJUALbjCO2JqFVTZ2r2N1C3mh60dgu9
	 tJNxl/dNFJiDhVEzn4Xe+gIQRDPiJsZKiHqiag0WQ1VQ829A+xagoCahWf6t6+T/v3
	 H3ppT2q2MElm6rKl9VEogHoDIb7HB2dbvuHFXsQNVZ5Y2d/1MvvkN4YnnOSrYPJLWv
	 c9FK9clfLleg6DSR0/uRoOES+6hM7iz1yiPjPbZMx/MipFc/P/AvMV/xibbLACvYuS
	 /42U14aQ1xWnA==
Date: Fri, 12 Sep 2025 09:10:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, Abel Vesa <abelvesa@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 6/9] dt-bindings: clock: nxp,imx95-blk-ctl: Add ldb
 child node
Message-ID: <20250912-flawless-ruddy-mushroom-83bd39@kuoka>
References: <20250911-dcif-upstreaming-v5-0-a1e8dab8ae40@oss.nxp.com>
 <20250911-dcif-upstreaming-v5-6-a1e8dab8ae40@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250911-dcif-upstreaming-v5-6-a1e8dab8ae40@oss.nxp.com>
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

On Thu, Sep 11, 2025 at 02:37:06PM +0300, Laurentiu Palcu wrote:
> Since the BLK CTL registers, like the LVDS CSR, can be used to control the
> LVDS Display Bridge controllers, add 'ldb' child node to handle
> these use cases.
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  .../bindings/clock/nxp,imx95-blk-ctl.yaml          | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> index 27403b4c52d6219d31649d75539af93edae0f17d..d4a20d17fc5758453e9c59c94893380ccb34f3de 100644
> --- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> +++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> @@ -26,6 +26,12 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
>    power-domains:
>      maxItems: 1
>  
> @@ -39,6 +45,26 @@ properties:
>        ID in its "clocks" phandle cell. See
>        include/dt-bindings/clock/nxp,imx95-clock.h
>  
> +patternProperties:
> +  "^ldb@[0-9a-f]+$":
> +    type: object
> +    $ref: /schemas/display/bridge/fsl,ldb.yaml#
> +
> +allOf:

Please put allOf: after required: block.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


