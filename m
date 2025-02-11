Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFFEC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 08:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=alK85kQSykN7KGu9xzLMvJjUUV/IfmgP1oUnM+MoMxE=; b=xd0cXlh6BvHGOe8B/mTL3BSzLS
	YvY0zdAxC4GeVY/WisxMhb1fL3vst420MOZe2pofuSFEYenVgMX6hLmxRIDNFnOd+SREKlMTFixM4
	lzcpoqdJoll23DyFUmKoNZZnTPKSDKi8zJSa6juO+wOUmYbqA/C5sE0jlAW/bDa7HcED0LX1Rj9/h
	XQ2LhfdbbFkeLaqMwSptH7D5j38lzifYc1ODM6ByNdVHb0sdJmGXWM9bxqnSQxuZ4j6TC1ryZ13QR
	5zfTRtcpiGnWgxFrlkj2bVwvL/vScBYaJvIbqPqf6txQGcXD2l8DYFl3IMKWP7mJytNRdKPQ0XgIz
	KMHuWzVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thlrF-000000032Eg-0ydB;
	Tue, 11 Feb 2025 08:43:05 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thlp2-000000031h3-2kb6;
	Tue, 11 Feb 2025 08:40:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5D422A40144;
	Tue, 11 Feb 2025 08:39:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4D22C4CEDD;
	Tue, 11 Feb 2025 08:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739263247;
	bh=yfxUOCmD0cUqeG9HoTFs80RQBFgDMIs07GaFv6eezd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LVdIrvsA3Ht1DgAfLA+b9wt7TVUMk00P//UZrubEEcFld6Uu3p36AS3GGw3PAn9d2
	 GxW2sE+52XrKmk0bkzeYTqAWAcJxcVLo8lVhMgErfYJsMFNn9aT2aZ04Y8ihOporMv
	 pdRCPmNUoOIpSjgsFUJTjVEVbpnXisDLwKjN5hP5hVWsXwhDNLAuCkc3PGEgwpoy9w
	 +e4g8LhB+VnpQ9iWHDwq93J+rKf63T1Ir6mMwTs2fq4J1hT9AxRpqaYdJfYw4Jejhi
	 OPM70gsFKgKLHOh+yAozEUPNV3g0QHdph2IyrxRfQMQudr0Y+6KGUNun4HU/ErFrxL
	 Ysn/NLU3MXudA==
Date: Tue, 11 Feb 2025 09:40:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Felix Fietkau <nbd@nbd.name>, 
	Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, "Chester A. Unal" <chester.a.unal@arinc9.com>, 
	Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, upstream@airoha.com
Subject: Re: [PATCH net-next v3 12/16] dt-bindings: net: airoha: Add
 airoha,npu phandle property
Message-ID: <20250211-chinchilla-of-luxurious-focus-950fc7@krzk-bin>
References: <20250209-airoha-en7581-flowtable-offload-v3-0-dba60e755563@kernel.org>
 <20250209-airoha-en7581-flowtable-offload-v3-12-dba60e755563@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250209-airoha-en7581-flowtable-offload-v3-12-dba60e755563@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_004048_757943_670292C0 
X-CRM114-Status: GOOD (  15.23  )
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

On Sun, Feb 09, 2025 at 01:09:05PM +0100, Lorenzo Bianconi wrote:
> Introduce the airoha,npu property for the NPU node available on
> EN7581 SoC. The airoha Network Processor Unit (NPU) is used to
> offload network traffic forwarded between Packet Switch Engine
> (PSE) ports.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> index c578637c5826db4bf470a4d01ac6f3133976ae1a..0fdd1126541774acacc783d98e4c089b2d2b85e2 100644
> --- a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> +++ b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> @@ -63,6 +63,14 @@ properties:
>    "#size-cells":
>      const: 0
>  
> +  airoha,npu:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the node used to configure the NPU module.
> +      The Airoha Network Processor Unit (NPU) provides a configuration
> +      interface to implement hardware flow offloading programming Packet
> +      Processor Engine (PPE) flow table.

I see Conor had here objections, but it looks fine to me. So unless
Conor naks it:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


