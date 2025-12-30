Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0BFE92FE3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 01:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f9UsiHfhMknAiPQQC7T1s1S0P752ar4mzqRSdIE1dXU=; b=CsL7rKdJpNEyTbtd4kjNFhbIyI
	K/gbDntOY7tWowVPD0Ip4e9TOw/+yxQzw8qXQak5YOjCDQir5puDQ8SCwGTsbVHyuXfTBJprlW3W1
	o4Xv+zKPpCa6rRIbq2LVUiIBY+ibWixbwpUxPHu4wBAVGun5UCedvyaTk4ksEhs/ojTF2HFoPnIC9
	pc0EJvw5+cR6eRstqmUkC0iwsZKCA9RJmzlf3lBpKwKCTLL9pJ3KtzyL2GwuuC8vZ8wpjXI6Z07zv
	Q7FFJVO0MwpyMZ0sJCebIiR70vh02CQcDP5WWzLmCcP/HKJkRxZnl6yVNOdIbVH/1bJIo+HTo9mzK
	Mm7ZvhAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaOdg-00000004GTB-3dQO;
	Tue, 30 Dec 2025 01:35:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaOdf-00000004GSv-0QHA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 01:35:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 43F9F6000A;
	Tue, 30 Dec 2025 01:35:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9493C4CEF7;
	Tue, 30 Dec 2025 01:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767058506;
	bh=Tj9LHQA+IIT2RlXp2c5HhaFtv0tgYyyX0N8rDKsQDgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DjBBMpBn+cZZetPVWGTzI+d5MWX9W8emEsUr69Bw1L8QtapARppZ4FwAlP3y/guwa
	 c2LuKMi2BWOmbt7eDYDIclvlePNZVTmgtZOJQwAbdU6SQ1eMoobyrW3NFEGNzgGZZQ
	 3Z4ZQWmaEaI7+71ahs9FAP381YmEfru0JF79TCF7pN/EgnrIXPxpSS57G5aUU3TEFY
	 GOxUoAiLJO+7E+D0cB1x14WZmTQeFmx0NoajJvGhJ6bQ4Y0X8UGe/GlyGSWTUDP54e
	 AGxqgBGJOqmVtGVESheapDugYywmjmnrt3Sxt8aeA6S9l4WDAUEgikrHoaxgFc7+yn
	 7wNfPVdjJNjkw==
Date: Mon, 29 Dec 2025 19:35:04 -0600
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
Subject: Re: [PATCH v2 1/7] ASoC: dt-bindings: convert tdm-slot to YAML
Message-ID: <20251230013504.GB3037280-robh@kernel.org>
References: <20251221-tdm-idle-slots-v2-0-ed4d96413aec@gmail.com>
 <20251221-tdm-idle-slots-v2-1-ed4d96413aec@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251221-tdm-idle-slots-v2-1-ed4d96413aec@gmail.com>
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

On Sun, Dec 21, 2025 at 07:35:57PM +1000, James Calligeros wrote:
> This schema was still in plaintext form. Convert to YAML format.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../bindings/sound/tdm-slot.txt          | 29 ---------------
>  .../bindings/sound/tdm-slot.yaml         | 49 +++++++++++++++++++++++++
>  2 files changed, 49 insertions(+), 29 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/tdm-slot.txt b/Documentation/devicetree/bindings/sound/tdm-slot.txt
> deleted file mode 100644
> index 4bb513ae62fc..000000000000
> --- a/Documentation/devicetree/bindings/sound/tdm-slot.txt
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -TDM slot:
> -
> -This specifies audio DAI's TDM slot.
> -
> -TDM slot properties:
> -dai-tdm-slot-num : Number of slots in use.
> -dai-tdm-slot-width : Width in bits for each slot.
> -dai-tdm-slot-tx-mask : Transmit direction slot mask, optional
> -dai-tdm-slot-rx-mask : Receive direction slot mask, optional
> -
> -For instance:
> -	dai-tdm-slot-num = <2>;
> -	dai-tdm-slot-width = <8>;
> -	dai-tdm-slot-tx-mask = <0 1>;
> -	dai-tdm-slot-rx-mask = <1 0>;
> -
> -And for each specified driver, there could be one .of_xlate_tdm_slot_mask()
> -to specify an explicit mapping of the channels and the slots. If it's absent
> -the default snd_soc_of_xlate_tdm_slot_mask() will be used to generating the
> -tx and rx masks.
> -
> -For snd_soc_of_xlate_tdm_slot_mask(), the tx and rx masks will use a 1 bit
> -for an active slot as default, and the default active bits are at the LSB of
> -the masks.
> -
> -The explicit masks are given as array of integers, where the first
> -number presents bit-0 (LSB), second presents bit-1, etc. Any non zero
> -number is considered 1 and 0 is 0. snd_soc_of_xlate_tdm_slot_mask()
> -does not do anything, if either mask is set non zero value.
> diff --git a/Documentation/devicetree/bindings/sound/tdm-slot.yaml b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
> new file mode 100644
> index 000000000000..5bc46048d689
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/tdm-slot.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Time Division Multiplexing (TDM) Slot Parameters
> +
> +maintainers:
> +  - Liam Girdwood <lgirdwood@gmail.com>
> +
> +select: false
> +
> +$defs:
> +  dai-tdm-slot-num:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Number of slots in use
> +
> +  dai-tdm-slot-width:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Width, in bits, of each slot
> +
> +  dai-tdm-slot-tx-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: Transmit direction slot mask. Optional. Drivers may specify an
> +      .xlate_tdm_slot_mask() to generate a slot mask dynamically. If neither
> +      this property nor a driver-specific function are specified, the default
> +      snd_soc_xlate_tdm_slot_mask() function will be used to generate a mask.
> +      The first element of the array is slot 0 (LSB). Any nonzero value will be
> +      treated as 1.
> +
> +  dai-tdm-slot-rx-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: Receive direction slot mask. Optional. Identical to TX mask.

Just move each of these to the properties below as they are only used 
once.

> +
> +properties:
> +  dai-tdm-slot-num:
> +    $ref: "#/$defs/dai-tdm-slot-num"
> +
> +  dai-tdm-slot-width:
> +    $ref: "#/$defs/dai-tdm-slot-width"
> +
> +  dai-tdm-slot-tx-mask:
> +    $ref: "#/$defs/dai-tdm-slot-tx-mask"
> +
> +  dai-tdm-slot-rx-mask:
> +    $ref: "#/$defs/dai-tdm-slot-rx-mask"
> +
> +additionalProperties: true
> 
> -- 
> 2.52.0
> 

