Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67DE9C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 06:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jk6bAfs2+w41N9G+jSHsBfNZNGb66kO819wQ5i5s02s=; b=1B/e9epXxS68gBvCjkL3CcKB5f
	xuNQXJswOOpIaW1dbXWrt0prAoC0CFcR8wAwEls4S+YZbsfH0CZbNr707M+fq3CnNoJ5T3oPUoKvy
	u+uk1kKleHn3bFlBAJuscNhEStqZKWFnjM732wFrVVJm7HyDY7n6BO5wJQjFvUiEUQHKSVDhBGCbB
	q28SMabi79kR63g8aCct0hVSgxer3oG1cDU/ISrK8w+Ny4nx553T3gZS87sfp/93Pba2YkGYtPDm+
	nkXYSYOeyxvrIPhUlkUNJF6O4TscJ2yqXdnSbcj5X9ulyT9QIgIyuRQa6Q2q5mPfx3I15ZEU+L2uv
	HGCDmFtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9MR-0000000FbCb-2k5v;
	Fri, 24 Jul 2026 06:26:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9MQ-0000000FbCU-3vB5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 06:26:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E13E43F64;
	Fri, 24 Jul 2026 06:26:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F7041F000E9;
	Fri, 24 Jul 2026 06:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784874378;
	bh=Jk6bAfs2+w41N9G+jSHsBfNZNGb66kO819wQ5i5s02s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g/bR6F9l9ISgv1FUXiPIfTE7zbKxEabQDzJ91c97WhtR1BL5rllfywquFz9BZwJmV
	 EtTgsCx70uFKRKzMyge3wFu7u8JxScW8ChlJhnD+/txHLSGKLW1gY5kPA00JQB0XCP
	 QSdxahu7xYuQ75PzhA2HxQ8n9+cQl4gsY8nKeoVnosrgYnct0u59/xm3h5z1L4ZKvd
	 F/HQle4ai+ilUxmU1/JQZcJttt3nuXZUWXJVez2R0U963wJWqxkaXdLbHQ0nBFl7gV
	 AgOf7dehZC3E+mOqhFv18vzdyKm4zpBOHk/cnpz6PRSan967pLspwMrwp5cXnyxGIi
	 gfMWOf69X9iYw==
Date: Fri, 24 Jul 2026 08:26:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frieder Schrempf <frieder@fris.de>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Pankaj Gupta <pankaj.gupta@nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com, 
	Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Re: [PATCH v3 01/11] dt-bindings: nvmem: imx-ocotp: Add support for
 secure-enclave
Message-ID: <20260724-purring-wildcat-of-virtuosity-59a2e2@quoll>
References: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-0-e26930345b4c@kontron.de>
 <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-1-e26930345b4c@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-1-e26930345b4c@kontron.de>
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

On Thu, Jul 23, 2026 at 09:27:23AM +0200, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> The driver currently uses the limited MMIO (FSB) interface to access the
> OTPs. The intention is to support the firmware interface alongside the
> MMIO interface so the driver can pick the interface that is available
> (firmware might not be loaded) and fallback to MMIO.
> 
> Some SoCs like the i.MX9 family allow full access to the fuses only
> through the secure enclave firmware API. Add a property to reference
> the secure enclave node and let the driver use the API.
> 
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> index a8076d0e2737..38fe451f808f 100644
> --- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> @@ -20,6 +20,16 @@ description: |
>  allOf:
>    - $ref: nvmem.yaml#
>    - $ref: nvmem-deprecated-cells.yaml#
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - fsl,imx93-ocotp
> +    then:
> +      properties:
> +        secure-enclave: false

Please move the entire allOf in such case after "required:" block (just
like in example-schema).

>  
>  properties:
>    compatible:
> @@ -56,6 +66,10 @@ properties:
>    clocks:
>      maxItems: 1
>  
> +  secure-enclave:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: A phandle to the secure enclave node

"... for full access to the fuses through firmware API."


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


