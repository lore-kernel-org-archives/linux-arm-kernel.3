Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C042FCEFCE2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 18:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jtFh1RfwhoevH3GL0jAB9uVZgLhflOxObdndOTyXxgU=; b=YaMTQYv2xz+IDDjERMcWVZ66Q/
	svupTUf4ofZE9whomRQtYxX62KqxFHCo+B5QgJGDl5+vzcaQ/Hc+nmbQlVvplvu3R5NLOuP0Jxah+
	AYCxAD9dJ9KmT5ig6dgmom5f8yilMlulO5UWyV1xyWY5eO+BHglUx8pmvhwXYaWUWx0kWN4A3bR8f
	mdHLl1quqJwYwgF8mGWUVXOlEcyUpCfYQ9A9/2/Cu9uGQ3hHv/11GKcqrfiIYpTPT7gnv8ohqQh1j
	RpADb3ooA8FxGOKvsS8qDp00aCVTyGsiSOndn9eylnngz3Aw2mbE6Y6syTYb+TLmIvIWJUwZqz9m8
	fL28vxhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdBiT-0000000DfQD-0RiI;
	Tue, 06 Jan 2026 18:23:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdBiQ-0000000DfPi-3rLP;
	Tue, 06 Jan 2026 18:23:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AAA2C43269;
	Tue,  6 Jan 2026 18:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64299C116C6;
	Tue,  6 Jan 2026 18:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767723812;
	bh=AhJ1lzOGYQf9Hfp3F9faEN/s8MDeBK5fnyeZLDXT7rA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JlUhVLsEmPAYT5hY7p1DsA5ueIVR9VHyt+IqJgSD/PH68Vbyyfz71zRJRqdQHkf5w
	 G38KnsUcV6mftOFazP5ELfmQVveXDmRMETJ30hWnqOgg1W+Ntp4ryrlRo8e8VzD7+C
	 NhnzEi+CcLTIpX87Y5k2jrcciJxJt/ifBrXT/OMGFl48kaDc9NkkD5GVyAjl2rN9Sg
	 4OImrlaFa3i1W7zaB5SYaLB6efeOQEYvrjF3RgF0uuTdlq3eBOxaHivrnAlPkVAQSJ
	 RxMR9H3XFgqwakskfmSU1II/s0V+KZxp2qoG+DExBEj+TpxkSpokCq897qXCbvumUe
	 VOC22ZvWRYfuQ==
Date: Tue, 6 Jan 2026 12:23:31 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Daniel Golle <daniel@makrotopia.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Eric Woudstra <ericwouds@gmail.com>, Lee Jones <lee@kernel.org>,
	devicetree@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
	linux-mediatek@lists.infradead.org,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Vinod Koul <vkoul@kernel.org>,
	linux-phy@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 net-next 02/10] dt-bindings: phy-common-props: create
 a reusable "protocol-names" definition
Message-ID: <176772381112.2505111.12870885701162521979.robh@kernel.org>
References: <20260103210403.438687-1-vladimir.oltean@nxp.com>
 <20260103210403.438687-3-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260103210403.438687-3-vladimir.oltean@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_102334_977344_BABC1006 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
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


On Sat, 03 Jan 2026 23:03:55 +0200, Vladimir Oltean wrote:
> Other properties also need to be defined per protocol than just
> tx-p2p-microvolt-names. Create a common definition to avoid copying a 55
> line property.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
> v1->v2: none
> 
>  .../bindings/phy/phy-common-props.yaml        | 34 +++++++++++--------
>  1 file changed, 19 insertions(+), 15 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


