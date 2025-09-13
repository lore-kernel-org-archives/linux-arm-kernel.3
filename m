Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C42CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 13:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E5mab86645Sapfjkb/w4wFvZdTEM2XTRwTZw9cv1dew=; b=jsiH5OCM72unnTacNpFcjJ818q
	CKMS7z8wze1Ppk+JpuhNDW5Piz388McFD6GJ9996VX5t410kOFm5lRSD0XKGwhf3VH+DRWIyYCpP4
	DvIMTeArNeW6rMTvSxP8nQSscvy19BZFPx4qBXtTkGGI1iLbkk6hjqa5QzrQ4H5AbHo1y2TX4G0JO
	gMWPBOIJxbnkJZ9I6dEnZ8Y/zeiviA7twFOoQmX8Fw6xnPFonlEWQUZ0dd3HWL2JjWaPCI0Wj/MBU
	IeHzQBLGfUa15vDzcse+7CIV291n8TSXlmh1cfyh99ESFWssmLPstq2GMtoJfT8NQscLq+ejuA5bv
	DKzh/kVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxPts-0000000EnK3-0hCA;
	Sat, 13 Sep 2025 13:02:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxPtq-0000000EnIe-0Gze;
	Sat, 13 Sep 2025 13:02:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B7CA940176;
	Sat, 13 Sep 2025 13:02:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CEB1C4CEEB;
	Sat, 13 Sep 2025 13:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757768561;
	bh=RaiIJcx5VZn7srWuUvK70Cr15E5gF3Rk7CVplrhCHBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RRwKCehsNlWZ0JEhm1e74Yx3g9bGNycmX5+uuaJCFHcVXBA59nEIegT2KIyj2B1Zw
	 shNbGrZHubISMRpvGtuuG3KHVrEM+WpDRQ1yfZ1erRoNFgxhggBPFVxSUEIrq+odIh
	 mVYCvKNGej7fuI3wxT5dbQ2SH/FarfidvRP8wM/aVPTtD3T15+rptBjI78ncAQ0YiM
	 v2QULault82d8Fe0yaNgSWQ3UMRR9lJ0qdr4QNzuJNLV1ZEtmCShzgjc/Nm6dT6n7L
	 Xc1RwFHoADmA6JZBR8w+D71MNYoCMqg+IR8l7HdkRitFXXJA8POMhKn8u1CfNjmqHu
	 M8NQNNjFiEI/w==
Date: Sat, 13 Sep 2025 14:02:35 +0100
From: Simon Horman <horms@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH v17 1/8] dt-bindings: net: dsa: Document support
 for Airoha AN8855 DSA Switch
Message-ID: <20250913130235.GM224143@horms.kernel.org>
References: <20250911133929.30874-1-ansuelsmth@gmail.com>
 <20250911133929.30874-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911133929.30874-2-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_060242_123681_172AAD8C 
X-CRM114-Status: GOOD (  15.48  )
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

On Thu, Sep 11, 2025 at 03:39:16PM +0200, Christian Marangi wrote:
> Document support for Airoha AN8855 5-port Gigabit Switch.
> 
> It does expose the 5 Internal PHYs on the MDIO bus and each port
> can access the Switch register space by configurting the PHY page.

nit: configuring

> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../net/dsa/airoha,an8855-switch.yaml         | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
> new file mode 100644
> index 000000000000..fbb9219fadae
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/dsa/airoha,an8855-switch.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha AN8855 Gigabit Switch
> +
> +maintainers:
> +  - Christian Marangi <ansuelsmth@gmail.com>
> +
> +description: >
> +  Airoha AN8855 is a 5-port Gigabit Switch.
> +
> +  It does expose the 5 Internal PHYs on the MDIO bus and each port
> +  can access the Switch register space by configurting the PHY page.

Likewise here.

...

