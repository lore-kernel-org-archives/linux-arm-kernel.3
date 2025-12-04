Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF8E5D216A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 16:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MT4boO2cphmK9DGnkIdXqQBZimD7TYvesOT3TsL3NCU=; b=SLNkYss4SLAgiQjUTyVGq5uFp7
	33FiIKdaHUm5+5WSVzGsLYBdCfqwISyemhhs7ofp59gEtzjvEsuhGsuBOQakOp8aAzLK83825QLWU
	Xwir5zHp2slLtqM4hFPDlLBAaRK1NKhZqhwBcYFTHfDmQlJtlCqghfrO5BshoeypR+pesjK8YmHPO
	3vp8sFix3jieDK2fL3gLfXGy9MYK7VrBX3Si1DlAJSTP/jGEga9b4rSXjVX6n47BaahIgeluBzIIq
	lC+zq5kajuLXe2tv2n0ZKG4LfoemrFHhsoyVJVeErEaJkbTrSfJW+Y2cHuKuAkedsHk4lW8jrWOzq
	MGFH7i7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRBxe-00000008GXc-1w5O;
	Thu, 04 Dec 2025 16:13:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRBxc-00000008GWj-3uAe;
	Thu, 04 Dec 2025 16:13:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D07760204;
	Thu,  4 Dec 2025 16:13:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3513C116C6;
	Thu,  4 Dec 2025 16:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764864820;
	bh=G6tjXLsXI6Ra3ZBQPtPCBFR2m7OZSlhpuiykHbxlWLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gvY5YyGLWoJ1UD14j17xypppwNb6yor4vMuIxOAnWGeYrPivqAY/q+1rXAnSiK0OI
	 5vsF8CXo2h6aP3v7ocODRoI7oaW2IeqPFctjWr9ONiigqXTp0qzAQ22bBnaH4lHJDX
	 aKsP0TH7bw+IJoI94hNk1N1mNZgJgdc2cKWTOMdJoDVBdm7uTZcozeGxImb1czuGHA
	 p86Dw2VqEEU/vnD93MjmCgWQ+6gfUUjBVAZnuMw3e8JAYhV+h1JAveW2G0Wnk4Xw0P
	 fgK6C191t/woAjv6tuHY8Nb2wKG2NVT0vFhhs9jsAa2mFeXclFKTHWUhiZgcUkibfG
	 mPRsrko9qOuog==
Date: Thu, 4 Dec 2025 10:13:37 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Eric Woudstra <ericwouds@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Lee Jones <lee@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	linux-mediatek@lists.infradead.org,
	"David S. Miller" <davem@davemloft.net>,
	Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	linux-phy@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH net-next 9/9] dt-bindings: net: airoha,en8811h: deprecate
 "airoha,pnswap-rx" and "airoha,pnswap-tx"
Message-ID: <176486481672.1580073.2236762382059854935.robh@kernel.org>
References: <20251122193341.332324-1-vladimir.oltean@nxp.com>
 <20251122193341.332324-10-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122193341.332324-10-vladimir.oltean@nxp.com>
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


On Sat, 22 Nov 2025 21:33:41 +0200, Vladimir Oltean wrote:
> Reference the common PHY properties, and update the example to use them.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
>  .../devicetree/bindings/net/airoha,en8811h.yaml       | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


