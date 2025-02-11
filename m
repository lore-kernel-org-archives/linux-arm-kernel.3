Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE962C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 08:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H5X7mNS0fzaFL/Jeh+IGtto2CR/ZZblr9gdWcO8Sg48=; b=2c+DQODeXGB/dT1udc3wr6oZyw
	HcwXO6na4lkaZvpPlzKL+HHS/Dou5273+kFCXbP8u46G7WRxk0NSGGxT+D2szKZzNbUAcmxgqGO2M
	4QvGKyl+cVG4OH//wgTn6tEmyM/cj6i7XNvlMyuYcKGHr10Ri9rTTnLSaz3x+Cda5gZGUTjrmVRnR
	AjlKAEnRee7dg0GCo8VrwRK9tvXU1CNFtca5wKrNnyVfAhANPZimWcSRiuFMDxcZ4P3Dt5is5sTtD
	dA3Q7TiJcP28wRq80q/T+NEJpHu5R8AY9poZVynqo+XCxLUakgfrfrp7olkRQ4NVON9U9GaBQw4TY
	6SomeU5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thlnm-000000031TB-3xUT;
	Tue, 11 Feb 2025 08:39:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thlmM-000000031Ia-1HJu;
	Tue, 11 Feb 2025 08:38:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C93F1A400C6;
	Tue, 11 Feb 2025 08:36:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BA10C4CEDD;
	Tue, 11 Feb 2025 08:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739263081;
	bh=acDJAoI2Hy9Ib3oKvNTqC5QM2P0qdH2TPw3xnelV7Aw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZKc2PE6UVRp+bbtAjc45TWebgPOJ3XvV+R4FKs0hwT7YQvom7Gc2tdw4AlDDH/gCK
	 fEu9mhJNsNjcYEU4y7jH5SkbfWHqJpHzBzbj/t3Y2lzpn6aSIIZfrEdqjrm47e5O8j
	 UqfOooY02/rHae3bIhMBz5XW/Ui1srWUPKF9mGL69E3sUO5c/LQyZKt9kpIlrBuEIv
	 Lr2oI2qGEjajZTYdz/tsgr5RYcmZ/b5ZyK9xEDR5OTTtL7DrS2hdm1v0lfSxUwHHh2
	 Rh6o8o3qx3VGDiIoGocinaEQlfEbAW7Z3OEfIoMhKO75UkbUVSSUqEDpKvMypA1ibz
	 aXDVKjQIY67fA==
Date: Tue, 11 Feb 2025 09:37:57 +0100
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
Subject: Re: [PATCH net-next v3 11/16] dt-bindings: arm: airoha: Add the NPU
 node for EN7581 SoC
Message-ID: <20250211-judicious-polite-capuchin-ff8cdf@krzk-bin>
References: <20250209-airoha-en7581-flowtable-offload-v3-0-dba60e755563@kernel.org>
 <20250209-airoha-en7581-flowtable-offload-v3-11-dba60e755563@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250209-airoha-en7581-flowtable-offload-v3-11-dba60e755563@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_003802_481004_ABB23A19 
X-CRM114-Status: GOOD (  17.06  )
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

On Sun, Feb 09, 2025 at 01:09:04PM +0100, Lorenzo Bianconi wrote:
> This patch adds the NPU document binding for EN7581 SoC.
> The Airoha Network Processor Unit (NPU) provides a configuration interface
> to implement wired and wireless hardware flow offloading programming Packet
> Processor Engine (PPE) flow table.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../devicetree/bindings/arm/airoha,en7581-npu.yaml | 71 ++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/airoha,en7581-npu.yaml b/Documentation/devicetree/bindings/arm/airoha,en7581-npu.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..a5bcfa299e7cd54f51e70f7ded113f1efcd3e8b7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/airoha,en7581-npu.yaml

arm is for top-level nodes, this has to go to proper directory or as
last-resort to the soc.

> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/airoha,en7581-npu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha Network Processor Unit for EN7581 SoC
> +
> +maintainers:
> +  - Lorenzo Bianconi <lorenzo@kernel.org>
> +
> +description:
> +  The Airoha Network Processor Unit (NPU) provides a configuration interface
> +  to implement wired and wireless hardware flow offloading programming Packet
> +  Processor Engine (PPE) flow table.

Sounds like network device, so maybe net?

> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - airoha,en7581-npu
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 15

You need to list the items.

> +
> +  memory-region:
> +    maxItems: 1
> +    description:
> +      Phandle to the node describing memory used to store NPU firmware binary.

s/Phandle to the node describing//

Best regards,
Krzysztof


