Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88DBFC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 21:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HthLGN/sYy4G5ZEItBiXR6BZ17LHLJmy0/1JjMGCGyc=; b=XyW9TpdbFXNXu2dKCz7rMGmj6o
	yTTyrJM0P3cDkmr/UjRNoc1kCmu8neaQHni6BRAiREgoQBCkfIRchAHEAmm8XNsTpZIwZS7Efkgth
	BjKIuaUe/9+gG4xofqmBXvbOvesa6KdWsb+oc1qghQsrSMlXoMf66cBJiej8dM/+TrBbQxDQN2FWW
	+/gitCjGWLKjpI5jerzBhQp1xekrF/za+EhRitPoodwGjoInjVtvTJu+eCXIPDLaRp4oDEZ1yMYTx
	0PMuJdOhWdVRvgxmaqqjQGsBM5jGG+GkbpCWWwbM6diWZL8X2XF3BZLH2vy4cDRTPsvMEeasDPYo8
	nXoFxHMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKOjD-0000000EBAm-15rx;
	Wed, 28 May 2025 21:54:27 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKOh2-0000000EAuI-35JW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 21:52:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B0214A4FB01;
	Wed, 28 May 2025 21:52:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A33DC4CEE3;
	Wed, 28 May 2025 21:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748469131;
	bh=4gXpD5gzsKHRkYAgF4556xWhjY838szvkedKjVZOZZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Reto9zlKGiybocpiqah7bOX9Od88N96vwzlIu8vXB+ZFGRtU+/eLYy7rOFlhMi8kB
	 TQMP/NMKZnIhY/FPg2vxg00XUA/NJUekkNvO0vjgOxMz+SYPRsVTaFXP7xqPHTut17
	 /+RQ4qNvDJqV8aLXAfB20aBmYMQTq+WrjxfSVlc4IGrT2BQOtpNQfSrElc21Y89zP9
	 LSeHJ4gNVCaXyF9gFtlgsT3Uo6U9mMbGSOIyLRDotymboT/Bvgm4cCh/sjLB9/MC4c
	 LxZPPDMycuk7qc7f2WAM7u6xF4ZzwrE1TgmjlEcQBSshVKoyoFZvlx1WU7pNp2Uyr4
	 gJRRFowAgpApw==
Date: Wed, 28 May 2025 16:52:09 -0500
From: Rob Herring <robh@kernel.org>
To: John Ernberg <john.ernberg@actia.se>
Cc: Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Gaurav Jain <gaurav.jain@nxp.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Frank Li <Frank.li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 3/4] dt-bindings: crypto: fsl,sec-v4.0: Add power
 domains for iMX8QM and iMX8QXP
Message-ID: <20250528215209.GA862463-robh@kernel.org>
References: <20250528144259.2603914-1-john.ernberg@actia.se>
 <20250528144259.2603914-4-john.ernberg@actia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528144259.2603914-4-john.ernberg@actia.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_145212_903801_B6240769 
X-CRM114-Status: GOOD (  17.99  )
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

On Wed, May 28, 2025 at 02:43:07PM +0000, John Ernberg wrote:
> NXP SoCs like the iMX8QM, iMX8QXP or iMX8DXP use power domains for
> resource management.
> 
> Allow specifying them for such SoCs.
> 
> Signed-off-by: John Ernberg <john.ernberg@actia.se>
> 
> ---
> 
> v3:
>  - Fix warnings discovered by Rob Herring's bot
>  - Declare the compatibles correctly (Krzysztof Kozlowski)
> 
> v2:
>  - Adjust commit message (Frank Li)
>  - Only allow power-domains when compatible with imx8qm (Frank Li)
> ---
>  .../bindings/crypto/fsl,sec-v4.0.yaml         | 45 ++++++++++++++++++-
>  1 file changed, 44 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml b/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml
> index 75afa441e019..a4ada0e2d97c 100644
> --- a/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml
> +++ b/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml
> @@ -46,6 +46,7 @@ properties:
>        - items:
>            - enum:
>                - fsl,imx6ul-caam
> +              - fsl,imx8qm-caam
>                - fsl,sec-v5.0
>            - const: fsl,sec-v4.0
>        - const: fsl,sec-v4.0
> @@ -77,6 +78,9 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  power-domains:
> +    maxItems: 1
> +
>    fsl,sec-era:
>      description: Defines the 'ERA' of the SEC device.
>      $ref: /schemas/types.yaml#/definitions/uint32
> @@ -106,7 +110,9 @@ patternProperties:
>                - const: fsl,sec-v5.0-job-ring
>                - const: fsl,sec-v4.0-job-ring
>            - items:
> -              - const: fsl,sec-v5.0-job-ring
> +              - enum:
> +                - fsl,imx8qm-job-ring
> +                - fsl,sec-v5.0-job-ring
>                - const: fsl,sec-v4.0-job-ring
>            - const: fsl,sec-v4.0-job-ring
>  
> @@ -116,6 +122,9 @@ patternProperties:
>        interrupts:
>          maxItems: 1
>  
> +      power-domains:
> +        maxItems: 1
> +
>        fsl,liodn:
>          description:
>            Specifies the LIODN to be used in conjunction with the ppid-to-liodn
> @@ -212,6 +221,40 @@ required:
>    - reg
>    - ranges
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx8qm-caam
> +    then:
> +      required:
> +        - power-domains
> +    else:
> +      properties:
> +        power-domains: false
> +
> +  - if:

This 'if' belongs under the '^jr@[0-9a-f]+$' subschema which will then 
remote a level here.

> +      patternProperties:
> +        '^jr@[0-9a-f]+$':
> +          type: object
> +          properties:
> +            compatible:
> +              contains:
> +                const: fsl,imx8qm-job-ring
> +    then:
> +      patternProperties:
> +        '^jr@[0-9a-f]+$':
> +          type: object
> +          required:
> +            - power-domains
> +    else:
> +      patternProperties:
> +        '^jr@[0-9a-f]+$':
> +          type: object
> +          properties:
> +            power-domains: false
> +
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.49.0

