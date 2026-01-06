Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E90CEFCE2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 18:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vw2AF+cnO7WA+Uc+FpEPiP4GFi07pf0iu01Cj+SSmKw=; b=GoayLHqN/HZHm3b6yq6WVfF251
	j/nTs4B9Ne1/y0CRGxPSWgWhCTlsM91omBV0nGar9FJYGIAbZzit8EQpl5jshZCUDypR0GfjCp0Bx
	0aTq/p2to2dRKC0XO+UkStK7j/9h0ZVEOS+t3tMmRyQKSFJe2d2ldVd1EwmNEE9emvUcnSSx0A0H1
	m1XJCXsGlzt1r3q6VC5PYHrsrMhanSu1lI/jJ41EnsRippdX/8Be+eUfrjG4GfZS7XZZ2Mxm/Md+v
	k+z54ImOM99NgXGVSD/QFB6k8EGswsjqEywyj6Y51f0XsxnHT/B7zZSJ6x+ZyllMwZtGd4LA6XINS
	O7z9hkHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdBjg-0000000DfbV-02Nx;
	Tue, 06 Jan 2026 18:24:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdBje-0000000Dfas-0rbx;
	Tue, 06 Jan 2026 18:24:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6706942A73;
	Tue,  6 Jan 2026 18:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DD87C116C6;
	Tue,  6 Jan 2026 18:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767723889;
	bh=IqwxW4H8IUPPZK3EaAi+GlNg4T3+lt8kFJ64tmM76u8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T+Xgogpg1Wp7TNMKDYKrQq3HMboaKX3mPD5b0jFOsUnywRSPuBxhq4qccvqS0o1xN
	 wUCZoXfplvSXeenRq5c7QFFQmEA9AKKI/BEEJF3D/mDpmyNzFB9n9USSJ6+LR1KPr8
	 wu7h+enj9RwNOaayYb8myNwnpj21NFmLg98P4k5A1gjkyfenp6ee4H0m1k+USrfMuK
	 J9JGEmlSQS1j7mPBEx4YsvARguUbkL+oKME0LaTskxOpkP8xI2QL6YuXp3Ex8JbnT/
	 k2NkQ/tlH8k4TvRy+STaBzgbxodcFrWjxDgHm+LyB323coiRzprhtAVdpf4e0PAoum
	 3CMeg+bnz90MA==
Date: Tue, 6 Jan 2026 12:24:48 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>, Eric Woudstra <ericwouds@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Russell King <linux@armlinux.org.uk>,
	linux-mediatek@lists.infradead.org,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jakub Kicinski <kuba@kernel.org>, Lee Jones <lee@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-phy@lists.infradead.org, Eric Dumazet <edumazet@google.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Subject: Re: [PATCH v2 net-next 08/10] dt-bindings: net: pcs:
 mediatek,sgmiisys: deprecate "mediatek,pnswap"
Message-ID: <176772388791.2506483.17745230367283833244.robh@kernel.org>
References: <20260103210403.438687-1-vladimir.oltean@nxp.com>
 <20260103210403.438687-9-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260103210403.438687-9-vladimir.oltean@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_102450_282775_4072A82B 
X-CRM114-Status: GOOD (  11.82  )
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


On Sat, 03 Jan 2026 23:04:01 +0200, Vladimir Oltean wrote:
> Reference the common PHY properties, and update the example to use them.
> Note that a PCS subnode exists, and it seems a better container of the
> polarity description than the SGMIISYS node that hosts "mediatek,pnswap".
> So use that.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
> v1->v2: none
> 
>  .../devicetree/bindings/net/pcs/mediatek,sgmiisys.yaml     | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


