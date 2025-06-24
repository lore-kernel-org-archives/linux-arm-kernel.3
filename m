Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A44EC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 08:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g4ZpB9QYe/vHW5TrF/e0KNkeZL99BYPtMSLAvAw4mI4=; b=U1XdDvrnPW6ipyPUIwrzP/X59q
	Ng50b3v9tmYfTGZZid5Pe7mFjSHuEgxaJBPb+E4NJUwJqxrWdmr78aniCHTvwMor5L2ptaD19yTIC
	K2xFiqvBP6hYmmACXPQkcFQlMkSkSB9ebvzj9CQ3ubgPQ7JLXctUk6CDJEFzEyj8ThSR822AA3JlN
	uQWY0NMj4tDTSBBTJMGMuNoiGIOb04iu7BH4bPhPSpOyxXk657pLMhZOfO9HLPrhpYYSE0uD5l2WV
	h4vWwJRIklJ7/vQrLcCvhtESyXRXasZkxDtcxJjjw48gTgk8o8dMN10jcsXKnPPRNdR8Iubgo7g4g
	q7ipp7Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTyxG-000000050Re-1K7P;
	Tue, 24 Jun 2025 08:24:34 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTy5H-00000004rth-0QAp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 07:28:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5A23CA4F508;
	Tue, 24 Jun 2025 07:28:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 532B9C4CEE3;
	Tue, 24 Jun 2025 07:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750750126;
	bh=g0pXc/fIN30kvH2Virs4nkVnamuyy0huOlw1+j0TCiE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gukn8GYs+wpCJs8dwZyrg7QtHcLeHxgvHUf5Q6yYFg2C9BOEmDGLZizI6sGEa26dd
	 AXs2VFgQ42jn313Jggk4V0ILiINJVwDGLMci1cSQWA/Wnat7vTWZPJqUqLwIF40C2w
	 DB5SetH/wVRGB4WLiqemm7k1keA5ZvZmhtE6Frd6ifdr8+9XFWkT36y+r7uY0iPWVK
	 7wqVd1s0PcAv5xA2AqsBduQdkOjE/CGEwb+m9pvBvE3rpcfh+prPNg4r7+X/NZWbZj
	 vz5KuBRA5M7nLhYwD3ZCbZbORFWCzuMpELU5hnh9Hkq8OxdNOzUNWWy2+/pxZnl9TL
	 tv2j3pfN4Gt8w==
Date: Tue, 24 Jun 2025 09:28:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joy Zou <joy.zou@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, catalin.marinas@arm.com, will@kernel.org, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	ulf.hansson@linaro.org, richardcochran@gmail.com, kernel@pengutronix.de, 
	festevam@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-pm@vger.kernel.or, frank.li@nxp.com, ye.li@nxp.com, 
	ping.bai@nxp.com, aisheng.dong@nxp.com
Subject: Re: [PATCH v6 2/9] dt-bindings: soc: imx-blk-ctrl: add i.MX91
 blk-ctrl compatible
Message-ID: <urgfsmkl25woqy5emucfkqs52qu624po6rd532hpusg3fdnyg3@s5iwmhnfsi26>
References: <20250623095732.2139853-1-joy.zou@nxp.com>
 <20250623095732.2139853-3-joy.zou@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250623095732.2139853-3-joy.zou@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_002847_267029_B4C8597A 
X-CRM114-Status: GOOD (  16.37  )
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

On Mon, Jun 23, 2025 at 05:57:25PM +0800, Joy Zou wrote:
> Add new compatible string "fsl,imx91-media-blk-ctrl" for i.MX91,
> which has different input clocks compared to i.MX93. Update the
> clock-names list and handle it in the if-else branch accordingly.
> 
> Keep the same restriction for the existed compatible strings.
> 
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> ---
> Changes for v5:
> 1. modify the imx93-blk-ctrl binding for imx91 support.

This is just vague. Anything can be "modify". Why are you doing this?
What are you doing here?

> ---
>  .../soc/imx/fsl,imx93-media-blk-ctrl.yaml     | 55 +++++++++++++++----
>  1 file changed, 43 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> index b3554e7f9e76..db5ee65f8eb8 100644
> --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> @@ -18,7 +18,9 @@ description:
>  properties:
>    compatible:
>      items:
> -      - const: fsl,imx93-media-blk-ctrl
> +      - enum:
> +          - fsl,imx91-media-blk-ctrl
> +          - fsl,imx93-media-blk-ctrl
>        - const: syscon
>  
>    reg:
> @@ -31,21 +33,50 @@ properties:
>      maxItems: 1
>  
>    clocks:
> +    minItems: 8
>      maxItems: 10
>  
>    clock-names:
> -    items:
> -      - const: apb
> -      - const: axi
> -      - const: nic
> -      - const: disp
> -      - const: cam
> -      - const: pxp
> -      - const: lcdif
> -      - const: isi
> -      - const: csi
> -      - const: dsi
> +    minItems: 8
> +    maxItems: 10
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx93-media-blk-ctrl
> +    then:
> +      properties:

Missing constraints for clocks

> +        clock-names:
> +          items:
> +            - const: apb
> +            - const: axi
> +            - const: nic
> +            - const: disp
> +            - const: cam
> +            - const: pxp
> +            - const: lcdif
> +            - const: isi
> +            - const: csi
> +            - const: dsi

Keep list in comon part.

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx91-media-blk-ctrl

This should be before if: for imx93. 91 < 93

> +    then:
> +      properties:

Why imx91 now has 10 clocks?

v6 and this has basic issues. The quality of NXP patches decreases :/

> +        clock-names:
> +          items:
> +            - const: apb
> +            - const: axi
> +            - const: nic
> +            - const: disp
> +            - const: cam
> +            - const: lcdif
> +            - const: isi
> +            - const: csi

No, look at other bindings how they share clock lists.

Best regards,
Krzysztof


