Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5B6CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 07:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HGOm25qUl9vuhZbo6e1871qgU9amlRVti6anmYOi/MY=; b=TLIFJrf5gXiBoGi/WysHITC40h
	sWbQcDCF+ygrsVBbTjFfW2JCjJ6jZwr23DhWNnOrqAorAORBfjesUVkqQujOWzYZKaBm9pAHdXNDi
	NQEdI2AJYF2iqAZ4g4aVEWW97l1OgM0Z+AIbCBOMTcNqg2sIR46H2psO14l7WQf9p/HGDiZG8AOtC
	srg7Cmd1lbpE+eZNALc7zpetEpJlQaLGrD1h1GQDMZuGUzp+940ydyywIhCLeUae8uBCKEUK/QxXq
	51LwJhfLwziDw3gkw+aaCqsxuosHKxP0hwlZBsXW5gd6fAwXaBmo38SlRz9IR8w0Sfm74gBW1hAQf
	YIyi20+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uozdf-0000000G5mI-0ABA;
	Thu, 21 Aug 2025 07:23:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoz1K-0000000Fz2y-00ab;
	Thu, 21 Aug 2025 06:43:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3826D601E9;
	Thu, 21 Aug 2025 06:43:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5356EC4CEED;
	Thu, 21 Aug 2025 06:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755758612;
	bh=zaVWerZTZLJ8YGpnqDKef0xiQVpqgGGNlE3XojBrVrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RlbxLLphD3s6EoJ5D3WCBJhkvpXfyxmkM+Qya8AKcXeBnVJLqM3Vsrc3PdaE1oGl/
	 Qo+edh7KSJ0kTQEF7CnlEohahPoHRRs2dickP/uGTguIIdLZVFlS2b52/8ecx5Nk/m
	 7T2LcSdChTzPHT3itMuL39yH6al0pQprxVmGFsBW9p+lMgWfXyVZWtte+oZjqxv2Uz
	 sksMu6TvOONzSOEaSF9B1dAWw/J39W6ARtM4nHVYp3KwZbqb9VuE1HT0enMMEDhCZW
	 i8kxRu1EZ2sYpSQHNpCitTBsBoN1OR7Lkjq536twpmdXapSiVtjLmM2GbVlIRiytW9
	 +hYeRC8retWSA==
Date: Thu, 21 Aug 2025 08:43:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch, 
	andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com, broonie@kernel.org, 
	chunkuang.hu@kernel.org, ck.hu@mediatek.com, conor+dt@kernel.org, davem@davemloft.net, 
	dmitry.torokhov@gmail.com, edumazet@google.com, flora.fu@mediatek.com, 
	houlong.wei@mediatek.com, jeesw@melfas.com, jmassot@collabora.com, kernel@collabora.com, 
	krzk+dt@kernel.org, kuba@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, 
	lgirdwood@gmail.com, linus.walleij@linaro.org, louisalexis.eyraud@collabora.com, 
	maarten.lankhorst@linux.intel.com, matthias.bgg@gmail.com, mchehab@kernel.org, 
	minghsiu.tsai@mediatek.com, mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com, 
	robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch, 
	support.opensource@diasemi.com, tiffany.lin@mediatek.com, tzimmermann@suse.de, 
	yunfei.dong@mediatek.com, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v1 03/14] dt-bindings: arm: mediatek: mmsys: Add
 assigned-clocks/rates properties
Message-ID: <20250821-electric-kestrel-of-awe-cb89dc@kuoka>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-4-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250820171302.324142-4-ariel.dalessandro@collabora.com>
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

On Wed, Aug 20, 2025 at 02:12:51PM -0300, Ariel D'Alessandro wrote:
> Current, the DT bindings for MediaTek mmsys controller is missing the
> assigned-clocks and assigned-clocks-rates properties. Add these and

No, they do not miss them. I don't understand why you are adding these.

> update the example as well.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index 3f4262e93c789..d045d366eb8e2 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -68,6 +68,12 @@ properties:
>        of the power controller specified by phandle. See
>        Documentation/devicetree/bindings/power/power-domain.yaml for details.
>  
> +  assigned-clocks:
> +    maxItems: 1
> +
> +  assigned-clock-rates:
> +    maxItems: 1
> +

Drop both, completely redundant and not actually in the scope of the binding.

Best regards,
Krzysztof


