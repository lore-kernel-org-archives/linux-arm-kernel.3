Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE917C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 08:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wqi1um5PAaZyo2+n4k2LLobJS4X4i8mP6TZ569vtW5U=; b=skkldPJJgOA0n54/CVihPVasAt
	CA4bnPhdbhnBP+2zU6S9sl5HKkQhsrJ38oayD7p1gRaUHlbPFw/0pBO9t2+SB8FLVXHSBAXvGF/Nz
	cTNGAS4MOg0gE6NqnOJl3a9KmZO3Hl7CUmJL2VR3B23FYUv8TZhiLOdcMMjI9TctbR0oxtCyFuh/K
	PKouZPKzdF9jfqizb6nHbDxaYtg4bQvwEWL3MSyij6dtn6j0pS5zz9Dxf1cuwitVNSNrDxYjXQgxP
	/0x28hJWRhiMRbjCQVlLe/CMfCp/BPHBCuidNPibqj432PEYfWHpnCNlfjNJ5ruM6W1c6SSKaB80C
	7G6lvDuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI0v0-00000000DuC-2ZPd;
	Thu, 22 May 2025 08:04:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI0jJ-00000000Bpw-0Tga;
	Thu, 22 May 2025 07:52:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 58DD461129;
	Thu, 22 May 2025 07:52:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AD75C4CEE4;
	Thu, 22 May 2025 07:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747900330;
	bh=T6UY1TqGv//MKV9QGiY+pagJxws1WT6fHX3Dckvh8xc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jhoVKYdEO+x6EgNOUvVzOtcWCsJW/PERVPRppCRhBEYlRsbztMloi3w6rNpXaC6cQ
	 XEima4m1fFyVB8RUEoezKyuuoC0BCx9rgwPH2MtW+R5LiqeCqUwzQU54pesJXFAu3f
	 ZsWRoxrPv0lrWj3NzRWjY2kDdAf3m2bFFcFpW+XlmhV/zAO0D79dECPPg/FSQBLlZ+
	 bjgQig4eXpbHM0mfvMiYSSPhv6f6zDSdqRGwdim1muGBD9cTgVtP/DsaTDzZT3ZybJ
	 JOwTxPwiNYDTSsBlDqFH7nZXxFFYWAwpmc3PCt5NiYXpWQAbNSHg8F49jeKeP9CYiE
	 iyViKA7eIJ7ug==
Date: Thu, 22 May 2025 09:52:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Julien Massot <julien.massot@collabora.com>
Cc: kernel@collabora.com, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>, Hui Liu <hui.liu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Tinghan Shen <tinghan.shen@mediatek.com>, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, iommu@lists.linux.dev
Subject: Re: [PATCH v2 1/3] dt-bindings: mfd: mediatek: mt6397: Add
 #sound-dai-cells property
Message-ID: <20250522-independent-ginger-bullfrog-4552d1@kuoka>
References: <20250514-mt8395-dtb-errors-v2-0-d67b9077c59a@collabora.com>
 <20250514-mt8395-dtb-errors-v2-1-d67b9077c59a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250514-mt8395-dtb-errors-v2-1-d67b9077c59a@collabora.com>
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

On Wed, May 14, 2025 at 10:19:56AM GMT, Julien Massot wrote:
> The 'mt6359.dtsi' file already uses the '#sound-dai-cells' property.
> Add the corresponding property to the binding to fix the following
> dtb-check error:
> 
> mediatek/mt8395-radxa-nio-12l.dtb: pmic: '#sound-dai-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
> from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#

If this is a random drive-by, would be fine, but if that's your platform
which you should know, then I expect this to be a real reason instead
something which can easily be rejected with: what if DTS is wrong?

I could not find the ASoC driver for that compatible and quick glance to
MFD shown me no usage of dai cells, so you need proper explanation here.

Especially, that there is a subnode audio-codec, so adding dai cells to
the parent node feels just wrong. One is wrong - either subnode or
parent is a codec.

> 
> Fixes: 9bc8353be720 ("arm64: dts: mt6359: Add #sound-dai-cells property")
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> index 6a89b479d10fad3c8b61cab5a3af1453baca4d1a..9580c4ec1ae00f1dd1182357d8b0a5035a1b7f82 100644
> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> @@ -30,6 +30,9 @@ description: |
>    See the following for pwrap node definitions:
>    Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
>  
> +allOf:
> +  - $ref: /schemas/sound/dai-common.yaml#
> +
>  properties:
>    compatible:
>      oneOf:
> @@ -53,6 +56,9 @@ properties:
>    "#interrupt-cells":
>      const: 2
>  
> +  '#sound-dai-cells':
> +    const: 1

Also extend the example, if there is one for such device.

Best regards,
Krzysztof


