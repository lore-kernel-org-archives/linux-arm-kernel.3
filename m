Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF184CFD36C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 04:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9abnR12V6f9wIFLZjn2vUXAQKKli2tOvJLAdE0+p95A=; b=IhpjISkj14+ku1mbmpzVKPrWFE
	5zfzJVfu8gg+uOFg5TxwRCHt5ciza0ev64YE7TeXzewUhh3knwi/I6dGItl+UsGtaj5ySIwfp1p4Y
	XZ2Umuf7pCgze28XtBHUZdC0Ogfzmxt5yHA3TMteM9r9SkWGhU2ZK1+3kMmn8bYJiWvdutD02yA0M
	l7tYTX/gArN0WH3f3c8brBBPWM3mcd5yhQc0z0zkv/6JxLmdhHzLnA6fn9KbwPqbXwV4hmEhUpzbx
	ravv8wBKPz0wv7GADLx/sVoUit2AHan290BSyeikwLqBo9+0XAAIMOmVrXVCLU5jXmZJCkYebQpRX
	UDIz9qpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNkF4-0000000CiX0-1eWC;
	Tue, 25 Nov 2025 04:01:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNkF2-0000000CiWC-0Jpj;
	Tue, 25 Nov 2025 04:01:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E90041A28;
	Tue, 25 Nov 2025 04:01:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7257C4CEF1;
	Tue, 25 Nov 2025 04:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764043283;
	bh=noWNmsId45ZeifrOlfH6mMR0VrmwkWZ6zYS8nnrBPoY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Qb4W4Rf6dcMuhndBOCJQPmNvmiFZMdJBcyJv3vvyldUdON0Bmt6qM+LfgW6osuSNK
	 U38o9WsY9lI+bUq53QM6ZZhTFAXLau8K1phukRoPrXJh2j/AXDyhQCinlBctfG+fgp
	 6S7J3eOc7OTXdlvNipXaN54KCBAH/+DHl6mEblEiKXs386QpoqIH+69GBL7iIvfwwv
	 kQrKSO/pGakH4jz2x2vIwvSFL9nExiGeiNvnlDkhu/OiCnbc8Dx/e1xam4Q99UFzsI
	 LWTIgsAWsD4Ygh3O1/jyuBiot4F4fMU9uYSC/rAmw74hk3JAU+u70LTvAGmW38Obgk
	 oTQqFyRbTDb/A==
Date: Mon, 24 Nov 2025 20:01:21 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Daniel Golle <daniel@makrotopia.org>, Horatiu Vultur
 <horatiu.vultur@microchip.com>, Andrew Lunn <andrew@lunn.ch>, Heiner
 Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham
 I <kishon@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Eric
 Woudstra <ericwouds@gmail.com>, Marek =?UTF-8?B?QmVow7pu?=
 <kabel@kernel.org>, Lee Jones <lee@kernel.org>, Patrice Chotard
 <patrice.chotard@foss.st.com>
Subject: Re: [PATCH net-next 5/9] phy: add phy_get_rx_polarity() and
 phy_get_tx_polarity()
Message-ID: <20251124200121.5b82f09e@kernel.org>
In-Reply-To: <20251122193341.332324-6-vladimir.oltean@nxp.com>
References: <20251122193341.332324-1-vladimir.oltean@nxp.com>
	<20251122193341.332324-6-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_200124_162155_ED8B4D0A 
X-CRM114-Status: GOOD (  16.17  )
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

On Sat, 22 Nov 2025 21:33:37 +0200 Vladimir Oltean wrote:
> Add helpers in the generic PHY folder which can be used using 'select
> GENERIC_PHY_COMMON_PROPS' from Kconfig, without otherwise needing to
> enable GENERIC_PHY.
> 
> These helpers need to deal with the slight messiness of the fact that
> the polarity properties are arrays per protocol, and with the fact that
> there is no default value mandated by the standard properties, all
> default values depend on driver and protocol (PHY_POL_NORMAL may be a
> good default for SGMII, whereas PHY_POL_AUTO may be a good default for
> PCIe).
> 
> Push the supported mask of polarities to these helpers, to simplify
> drivers such that they don't need to validate what's in the device tree
> (or other firmware description).
> 
> The proposed maintainership model is joint custody between netdev and
> linux-phy, because of the fact that these properties can be applied to
> Ethernet PCS blocks just as well as Generic PHY devices. I've added as
> maintainers those from "ETHERNET PHY LIBRARY", "NETWORKING DRIVERS" and
> "GENERIC PHY FRAMEWORK".

I dunno.. ain't no such thing as "joint custody" maintainership.
We have to pick one tree. Given the set of Ms here, I suspect 
the best course of action may be to bubble this up to its own tree.
Ask Konstantin for a tree in k.org, then you can "co-post" the patches
for review + PR link in the cover letter (e.g. how Tony from Intel
submits their patches). This way not networking and PHY can pull
the shared changes with stable commit IDs.

We can do out-of-sequence netdev call tomorrow if folks want to talk
this thru (8:30am Pacific)

> +GENERIC PHY COMMON PROPERTIES
> +M:	Andrew Lunn <andrew@lunn.ch>
> +M:	"David S. Miller" <davem@davemloft.net>
> +M:	Eric Dumazet <edumazet@google.com>
> +M:	Heiner Kallweit <hkallweit1@gmail.com>
> +M:	Jakub Kicinski <kuba@kernel.org>
> +M:	Kishon Vijay Abraham I <kishon@kernel.org>
> +M:	Paolo Abeni <pabeni@redhat.com>
> +R:	Russell King <linux@armlinux.org.uk>
> +M:	Vinod Koul <vkoul@kernel.org>

checkpatch nit: apparently it wants all Ms first, then all Rs.

> +L:	linux-phy@lists.infradead.org
> +L:	netdev@vger.kernel.org
> +S:	Maintained
> +Q:	https://patchwork.kernel.org/project/linux-phy/list/
> +Q:	https://patchwork.kernel.org/project/netdevbpf/list/
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git
> +F:	Documentation/devicetree/bindings/phy/phy-common-props.yaml
> +F:	drivers/phy/phy-common-props.c
-- 
pw-bot: cr

