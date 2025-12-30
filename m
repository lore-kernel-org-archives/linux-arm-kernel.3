Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5114CE92FE3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 01:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZR01wDLXfeVLgjQ9DoBqi1cHsnDT+MJQBOGRvBziLWQ=; b=x3uCbYupIpslBBKeEHz7o9nENV
	kmId+n80Kz3qjE0NWqtdq1Q135zrBoJ4L0nUNGwJdrQhA92KObuv93qx/214pk7lNe64ZFXew+ea9
	lz21p+qo+8my3zxNq0P/Afqc976CQAqXsQ25FtmEQDLHVHhIiem6Y5HCDy5nixhm9q1o7H8Mn32th
	Jb0anuctISdWX1XVF8BJkyumgJe+RC4RHSy+cAQj084+T/YPTXwnx2a563REdrt8tJVfon5ZXAV9m
	5NHiAMlBPGtQ+cDvMPi4onOaDqOx57foCE+MihRBK5UZKHgZIA77Uj6YZwS3gQ5Yl4SdnKavyA1V7
	YMsjz4bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaOgd-00000004Gef-1wK7;
	Tue, 30 Dec 2025 01:38:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaOga-00000004GeD-49XM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 01:38:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 571CA440D8;
	Tue, 30 Dec 2025 01:38:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15B2DC4CEF7;
	Tue, 30 Dec 2025 01:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767058688;
	bh=urCIY28Bgg/DWNEhGAokKr3T2XA/0hKP4bHhcr/Cd8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ane3J7yRRaqVeKXcNFl0zPb8F1eUzeet5WWEV7XMk7579tlwZy76sgoUiQbfEF+Uq
	 ye+KSU7k9a2XiwxqzgEuGpB7PwVPHtuVxyk4j5Wk0GkwFkLoTPwbKv+hNFR7qLqjm4
	 eYZfS6OUXYMcEmDJbeas4P5nVszIgcs8/MPstXi+7ZPL5DHpj1eSXag+gfkGqu3fLd
	 tpczmQLTtvsK3yW7drKcusScsXyQROhfD5Z7lBsRQbBuSEYO1wkgsxBgr2QYas4PdM
	 4cIMyPzt30MRC6PpladfWCKr1uBgJtYFiD3UrD+Dw3AyDVR2Fy7mdH2HZxVAxUD8pA
	 /8Pfl0Ckj9I8w==
Date: Mon, 29 Dec 2025 19:38:07 -0600
From: Rob Herring <robh@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Subject: Re: [PATCH v2 3/7] ASoC: dt-bindings: add TDM slot idle mode
 properties
Message-ID: <20251230013807.GA3063323-robh@kernel.org>
References: <20251221-tdm-idle-slots-v2-0-ed4d96413aec@gmail.com>
 <20251221-tdm-idle-slots-v2-3-ed4d96413aec@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251221-tdm-idle-slots-v2-3-ed4d96413aec@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_173809_069016_3758310C 
X-CRM114-Status: GOOD (  19.08  )
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

On Sun, Dec 21, 2025 at 07:35:59PM +1000, James Calligeros wrote:
> Add properties to describe TDM slot idle behaviour. These properties can
> be used to describe how a DAI is supposed to behave when not active.
> 
> For example, Apple Silicon laptops split a single I2S bus between two
> physical lines which are combined at an OR gate in front of the
> receiving port. One codec on each line is expected to transmit zeroes
> during the active TDM slots of the opposite line, or we will have corrupted
> data at the receiver.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../bindings/sound/tdm-slot.yaml         | 33 +++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/tdm-slot.yaml b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
> index 5bc46048d689..e8b2d35a7c37 100644
> --- a/Documentation/devicetree/bindings/sound/tdm-slot.yaml
> +++ b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
> @@ -33,6 +33,17 @@ $defs:
>      $ref: /schemas/types.yaml#/definitions/uint32-array
>      description: Receive direction slot mask. Optional. Identical to TX mask.
>  
> +  dai-tdm-idle-mode:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum:
> +      - none
> +      - off
> +      - zero
> +      - pulldown
> +      - hiz
> +      - pullup
> +      - drivehigh
> +
>  properties:
>    dai-tdm-slot-num:
>      $ref: "#/$defs/dai-tdm-slot-num"
> @@ -46,4 +57,26 @@ properties:
>    dai-tdm-slot-rx-mask:
>      $ref: "#/$defs/dai-tdm-slot-rx-mask"
>  
> +  dai-tdm-slot-tx-idle-mode:
> +    $ref: "#/$defs/dai-tdm-idle-mode"
> +    description: Transmit direction idle slot mode. Optional. For hardware
> +      that can configure its behaviour during idle TDM slots via
> +      .set_tdm_idle(). "None" represents UB/unspecified behaviour and is the
> +      same as not setting this property.
> +
> +  dai-tdm-slot-rx-idle-mode:
> +    $ref: "#/$defs/dai-tdm-idle-mode"
> +    description: Receive direction idle slot mode. Optional. Identical to TX
> +      idle slot mode.
> +
> +  dai-tdm-slot-tx-idle-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Transmit direction idle slot mask. Optional. 1 represents
> +      an idle slot.
> +
> +  dai-tdm-slot-rx-idle-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Receive direction idle slot mask. Optional. Identical to
> +      TX mask.

These can be under a patternProperties:

patternProperties:
  '^dai-tdm-slot-[rt]x-idle-mode$':
    ...

  '^dai-tdm-slot-[rt]x-idle-mask$':
    ...

And then remove the $defs.

Rob

