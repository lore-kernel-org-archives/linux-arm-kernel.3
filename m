Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD363CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 08:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fbXSdjDc2jAtqmW32eHV8YxQuw9xRSnaEkG0ipMCxmE=; b=1iL9LghBoUobUE7L/J1IOQj38H
	Md1GKuR8UGRaPQK8wZ4bw7Ue/tSSI14uGBV9GuQ1PTi/Nvh8EQOCjqXVGaWbhqyFWdYXxwH1dLgI6
	f+a1adbJSHow7eYaatH2GwQA0iSA0bAi9AZPVlfrZZjZdYmE9/jf4HjhzmOyFIFK9O8O2JpmA+Bet
	GrEzwBebAWkSPPsjz4x/cjLTIc/6k6JTXGzuAB5LaT6EXZWeTCxGWo6DWyOCZgUQZQHDpk42Re8xz
	e9huFKLrYN1V9l4RXIf+yWLTeRx+KvJuPI3wqm7W6DTSDX9S/Vpn28MB0OhwI78cTNKOtXKHjrW+Q
	cthVHl/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGuyY-0000000F2Z9-3Sqn;
	Thu, 06 Nov 2025 08:04:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGuyV-0000000F2Yd-3w9u;
	Thu, 06 Nov 2025 08:04:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 41ED744012;
	Thu,  6 Nov 2025 08:04:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BA2CC4CEFB;
	Thu,  6 Nov 2025 08:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762416247;
	bh=ccHkm5qtYzT6iKa2MpQExMHciYd9ipIA4PEh7rQnhmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NvHF5V12wKqbRMiQh9lD2BGO6IANaZaFz4LZfCAwGDwOjoG5QFOJu38rdjOPjw8mV
	 haXxY/iWnRM8GboXg478oHWJpF2vHWZzLbOfM/2L2YdtzCSYDa4Tf4zv/kcfmniEiY
	 d/I6gdIPiAsnEkbIkqaIrnWxY1RTzRJCXPgrWt3P5VaSdknfiowbmC+SZQevCd/ldP
	 blDmJLIhXIIJ4mtoBiVRN9A8X3tPOBUdfcXS/Ag+iQHm1J1rmKsbODJ6dnTxLw4NVG
	 Hq8vSt7CDeRJKm8OSn6K2RRO36AAkqGww9DdqxAFgro75BPf3L6XHde6ydlik4vGXv
	 Skifuqv+5A5tg==
Date: Thu, 6 Nov 2025 09:04:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sjoerd Simons <sjoerd@collabora.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ryder Lee <ryder.lee@mediatek.com>, 
	Jianjun Wang <jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Lee Jones <lee@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, kernel@collabora.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-phy@lists.infradead.org, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, 
	Bryan Hinton <bryan@bryanhinton.com>
Subject: Re: [PATCH v3 08/13] dt-bindings: net: mediatek,net: Correct
 bindings for MT7981
Message-ID: <20251106-unbiased-warping-earthworm-f4f66c@kuoka>
References: <20251105-openwrt-one-network-v3-0-008e2cab38d1@collabora.com>
 <20251105-openwrt-one-network-v3-8-008e2cab38d1@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251105-openwrt-one-network-v3-8-008e2cab38d1@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_000408_015781_4768B097 
X-CRM114-Status: GOOD (  15.54  )
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

On Wed, Nov 05, 2025 at 10:18:03PM +0100, Sjoerd Simons wrote:
> Different SoCs can have different numbers of Wireless Ethernet
> Dispatch (WED) units, specifically the MT7981 only has a single WED.
> Furthermore the MT7981 uses infracfg for PHY switching. Adjust bindings
> to match both aspects.
> 
> Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
> ---
> V2 -> V3: Only update MT7981 constraints rather then defaults
> V1 -> V2: Only overwrite constraints that are different from the default
> ---
>  Documentation/devicetree/bindings/net/mediatek,net.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> index b45f67f92e80d..c49871438efc7 100644
> --- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
> +++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> @@ -338,12 +338,14 @@ allOf:
>              - const: netsys0
>              - const: netsys1
>  
> -        mediatek,infracfg: false
> -
>          mediatek,sgmiisys:
>            minItems: 2
>            maxItems: 2
>  
> +        mediatek,wed:
> +          minItems: 1

Drop, 1 mis already minimum.

Anyway, this does not match top-level schema which said minItems 2. You
need to keep these consistent among all variants and top-level.


Best regards,
Krzysztof


