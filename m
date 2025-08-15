Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38FF3CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 10:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y1X3F7dbnZ0snSUAsFiYe9cqrlQ43Ji4aMI8M7O2NtY=; b=h3seFs+4w7YGOmZFx3rIEChooy
	VM040ND4ZFgnuDwDPXYbKAKnF63DKywfZ+blRA/8ALX4KZ7TKRD1AYh8Tr0714/BvxsNAZLnrwi3w
	c+g/AMmZI59ARy/28wU0Ez8wyRdkLl7Z/fO3bm75r5RIGV/Kje26ANVZFKfZlByDf71CpH3qk1duf
	JiqnqwSQoPikHWz+aSfyhQbZ01AXjRELJL+TzNDgQopER2LqBG5P+/Mm6uAmvvlT3ROe8duo3CEp2
	4Ts6tkE1192MJDl/EQ/0kXTCnM5nazsXql17FB8/QU8cg4SvPUu+qsNa7QxrUplczCF6IlTlF7I2N
	fCGwT+Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umrHc-000000029FP-3MrC;
	Fri, 15 Aug 2025 10:03:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqCK-00000001vDf-3zJ2;
	Fri, 15 Aug 2025 08:54:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 447AB4635B;
	Fri, 15 Aug 2025 08:54:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68880C4CEF5;
	Fri, 15 Aug 2025 08:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755248044;
	bh=fkLFrZT5rOePvj8oL1FKGxrVLn/3EwqTARx7crpxGnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i6+BpbAdMl1b7cUK3TpFifshNNefnhQLvVcVU+acszFV7a8rNmULcOC0ybwIMtZ0X
	 LpLegNnz/QMJLIak1ZcpGljvgrWbliBYbaYC0m0DV4TJEpOatp2i9cKrr3K7SxuO8n
	 rqMNnDHnMRNRkqKWS3JuZ3cyMKFQ52+lUAo/r7nHsfQu3h9G3t+AhcDXEAyUwy8lKk
	 jLxFc6Ji/coGoghOWOl72f7EdOjamppbzH7YP2nlHoMWWFqH8N0UPv0QHKYHumx2KR
	 kidWdhhIu+Xnj/Nx/1e5oeVv0ZgmMkeOHAW7h6S2Ek2CE0ZFpJR6fhDw6u8AAPFEo4
	 kA8uhr/n5yulg==
Date: Fri, 15 Aug 2025 10:54:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Nathan Hebert <nhebert@chromium.org>, 
	Arnd Bergmann <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, 
	George Sun <george.sun@mediatek.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Subject: Re: [PATCH v3 5/6] dt-bindings: media: Add MT8196
 mediatek,vcodec-encoder
Message-ID: <20250815-meek-porcelain-oarfish-1411e3@kuoka>
References: <20250814085642.17343-1-kyrie.wu@mediatek.com>
 <20250814085642.17343-6-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250814085642.17343-6-kyrie.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_015405_029289_84B1BE51 
X-CRM114-Status: GOOD (  15.79  )
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

On Thu, Aug 14, 2025 at 04:56:41PM +0800, Kyrie Wu wrote:
> From: Irui Wang <irui.wang@mediatek.com>
> 
> Add MT8196 encoder compatible string, which will reference VCP device.

You ignored comments from v2.

> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>

Incorrect SoB chain.

> ---
>  .../bindings/media/mediatek,vcodec-encoder.yaml | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> index ebc615584f92..bb4dbf23ccc5 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> @@ -24,6 +24,7 @@ properties:
>                - mediatek,mt8188-vcodec-enc
>                - mediatek,mt8192-vcodec-enc
>                - mediatek,mt8195-vcodec-enc
> +              - mediatek,mt8196-vcodec-enc
>        - items:
>            - const: mediatek,mt8186-vcodec-enc
>            - const: mediatek,mt8183-vcodec-enc
> @@ -58,6 +59,11 @@ properties:
>      description:
>        Describes point to scp.
>  
> +  mediatek,vcp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Describes point to vcp.

For what? You just repeated the property name. You must say here
something useful instead: why this is needed, what is its purpose.


> +
>    power-domains:
>      maxItems: 1
>  
> @@ -76,6 +82,17 @@ required:
>    - iommus
>  
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8196-vcodec-enc
> +
> +    then:
> +      required:
> +        - mediatek,vcp

else

mediatek,vcp: false


Best regards,
Krzysztof


