Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B1CC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUczLkRV8qjArZtk6FessQZEPVmtECpm4crTZuTEAzg=; b=sLbYtxi2jBEtot/fYZLiNTXNVm
	3bxC2xgiyGSM/oYPCetbk1hjSiQl3avxKSrG6nlmpAqY7q8Z8iocmVrQhj81KuK5V8crSpNu3ptmV
	O8k2arX/UI8I1oLFQrAymVTW52w5jfA6Je7i0RWryl+LwJI6aTmzbh3kmk32xsrL8Hbr36/OHufNA
	1eN5mf/JWwBsHQY35yWnhAxMaBeXEqoUVoDs28Iv0TSEUvjioEfHH1zG2hzFLzk7R77oJQTrF3PGQ
	t9lLEC3KjgZtHuOWN2Eh6ugO/VoP8JqNStLD7cai4I24T/y90fpI88otLvL74LBtJYvEnNiwdL9w9
	2K9SowmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUHp-00000004mft-48xs;
	Fri, 09 May 2025 20:25:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQXk-00000004HCM-3uRZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 16:25:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 434446111F;
	Fri,  9 May 2025 16:25:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B95B4C4CEE4;
	Fri,  9 May 2025 16:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746807948;
	bh=pWBgsTEX8GV7+i3t+seP0AVeCM2U+ftwb9bTfHMqsr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fjckqt4ff3yPZ9Z10wyhN9E27yWp8UPgNgf6MpU6+T/JD774nJHwwYaNW4sDl/SIv
	 tfg1KoT010YGjS4DsOoZ9apCkuuoMfDPErP3HTTF2W39sCgP4tBvFreluPtO5wau4d
	 2uhFEKXxRJl3DYzqRfZYf6lOtv1XFS4TpcbM+wktnwpetlf4PeuLGT6Bkqc9DgfxTi
	 QgdakWKRAagwX8iDrcCZy7OUbgA0CasETjjnktKwlZ1fLZ3yogIzz/V+0gl87d4Nrh
	 B1JmU4CKusHRWfFkwq077jjNOpgz//HQO7ovyXp1sTub4/91Pzypmi9kQQJEqm1NwS
	 oaDsGvN7jKTFA==
Date: Fri, 9 May 2025 11:25:46 -0500
From: Rob Herring <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com, Abel Vesa <abelvesa@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v12 16/19] dt-bindings: clock: imx8m-clock: add PLLs
Message-ID: <20250509162546.GA3704130-robh@kernel.org>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
 <20250424062154.2999219-17-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424062154.2999219-17-dario.binacchi@amarulasolutions.com>
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

On Thu, Apr 24, 2025 at 08:21:46AM +0200, Dario Binacchi wrote:
> Though adding the PLLs to clocks and clock-names properties will break
> the ABI, it is required to accurately describe the hardware. Indeed,
> the Clock Control Module (CCM) receives clocks from the PLLs and
> oscillators and generates clocks for on-chip peripherals.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> (no changes since v11)
> 
> Changes in v11:
> - Fix conflict while rebasing on master
> 
> Changes in v7:
> - Add 'Reviewed-by' tag of Krzysztof Kozlowski
> 
> Changes in v6:
> - New
> 
>  .../bindings/clock/imx8m-clock.yaml           | 27 ++++++++++++++-----
>  1 file changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> index 4fec55832702..e83f08abd44c 100644
> --- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> @@ -29,12 +29,12 @@ properties:
>      maxItems: 2
>  
>    clocks:
> -    minItems: 6
> -    maxItems: 7
> +    minItems: 7

Increasing the minimum entries looks like an ABI break to me. The .dts 
files not being in linux-next confirms that (from 0 warnings in 
mainline):

arch/arm64/boot/dts/freescale:859:50
    122  clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
    120  clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
     61  clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
     61  clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
     60  clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
     60  clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
     36  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
     36  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
     32  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
     28  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
     26  clock-controller@30380000 (fsl,imx8mn-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
     17  clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
     17  clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
     14  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[44], [45], [46], [47], [48], [49]] is too short
     14  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[23], [24], [25], [26], [27], [28]] is too short
     13  clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
     13  clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
     12  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[26], [27], [28], [29], [30], [31]] is too short
     10  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[38], [39], [40], [41], [42], [43]] is too short
      8  clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
      8  clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[20], [21], [22], [23], [24], [25]] is too short
      8  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
      8  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[28], [29], [30], [31], [32], [33]] is too short
      8  bcrmf@1 (brcm,bcm4329-fmac): $nodename:0: 'bcrmf@1' does not match '^wifi(@.*)?$'
      6  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[41], [42], [43], [44], [45], [46]] is too short
      6  clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
      4  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[43], [44], [45], [46], [47], [48]] is too short
      4  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[40], [41], [42], [43], [44], [45]] is too short
      4  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[36], [37], [38], [39], [40], [41]] is too short
      4  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short

Please fix the binding or drop what's been applied so far.

Rob


