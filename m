Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0857FC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 19:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/3xJoKdM3gyie4Vp+Pn4E86xGTE8T5kp+MMMBUjTDI=; b=TAI38232amxn9RKhqMVzRHyj3v
	/rd2e16dAiqy1c7VkbZHNE0X5tzRL55ZekkWC2VqghaIRVDQGLeEP9M/+0C6otRv6hHagg7/fP/cV
	tMtrJoAz0aSI7f8nviGqnbhzo00ahgtIcbk5NJATjxH0P4WxUWeqYiYqkAOnMFlS7uOnzfkzFgxG5
	4W26iXu+07YDe8EkZI5c6OtSiYHfx4dazvS7TtzdHl0EflvxdGHTp4ZE9BzFtsrVvcbsC3yR3q4+h
	3za0Tba5CkiiK1lB1+3ud/0/xhwELR928BTlLm5SLjSqLoWAQgrRp9ZwqWPfqY/ZukH5dSdIdmKrq
	B27C++sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ENM-00000005DGB-1OiF;
	Tue, 08 Apr 2025 19:12:48 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2D38-000000050tc-20oN;
	Tue, 08 Apr 2025 17:47:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BCCFCA48F86;
	Tue,  8 Apr 2025 17:42:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D13BFC4CEE5;
	Tue,  8 Apr 2025 17:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744134469;
	bh=R0H4qB2DWVusKSacLmBvQoYOkD35Q2qxSrY8UFIpCvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g6gm00BSrUC9a67VqfO6wzWEjAiHCtHL+S0ONbWlZMdtU1RGAA1v7JyzyXBXm7oSF
	 KWVxyk524MPRmVUAXoOjqyy4XmLat4bzEnXeICTAI7M/iXAG/DfNTO5TZZKyaz4YsX
	 Bo3rtDRoRI1SfJkbJ4gFnuNg4WKEKp1x7kJcK4QbPLDo5ycUvUouZonsO/zCJvwPpZ
	 ldDNwn1Tb4+9MCZVY8ms0z8w+ON0h4iyZ/frlBQjdm7lWsEf1EGE16myKTLJthgtqJ
	 T7L+/DmJH52x5aDEygZvRGYbYNULH/VQ3VuFk71ev3vNdUzfF/xwpP5V77GJG3c5NX
	 l+GMF4NLDc27g==
Date: Tue, 8 Apr 2025 12:47:47 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, upstream@airoha.com,
	linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-mediatek@lists.infradead.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>, devicetree@vger.kernel.org,
	Vladimir Oltean <olteanv@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>
Subject: Re: [net-next PATCH v14 03/16] dt-bindings: net: dsa: Document
 support for Airoha AN8855 DSA Switch
Message-ID: <174413446086.2421916.12520938934401150643.robh@kernel.org>
References: <20250408095139.51659-1-ansuelsmth@gmail.com>
 <20250408095139.51659-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408095139.51659-4-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_104750_584791_37F8CDFA 
X-CRM114-Status: GOOD (  13.25  )
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


On Tue, 08 Apr 2025 11:51:10 +0200, Christian Marangi wrote:
> Document support for Airoha AN8855 5-port Gigabit Switch.
> 
> It does expose the 5 Internal PHYs on the MDIO bus and each port
> can access the Switch register space by configurting the PHY page.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../net/dsa/airoha,an8855-switch.yaml         | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>




