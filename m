Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6495EC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 21:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wqENPvGBHFWUsyFgZ18/L+kH9jVbtb5/qgokMbAREj4=; b=V2rQGR5V4JUC9ZEvdATgnzWcJf
	FUsY4FzzeFjaB58Ny1t8MDgYTUf5H6XmGc5gE+FbZ7zOPW3N5bRB2jhIlzIJVrZTtyRDUQmrCUWEw
	kJP7Ewc9UtbmLgtLIDDnk0cB/ZiJvvwlOeiBxh/tmIPkRiZQoqBSLT0Tk3G4b7VxN2dh9iZnDbno7
	Ad7dRdkeMQuFlt3S+kQo1JMbXw3xj7YoqzwzjH/PakDCtA5uguvvKHk4RvogYyd7PvRqXX7vfV2V/
	YjZ1BKfCh3GkATJueuVdSMYsKwCEaz+rJCl93Md8Zti8lB/PsRHYXHQ0gc+4gc2ZO7KUExweSKi1Y
	3U09gYlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVH0a-0000000Ftn7-41pJ;
	Fri, 27 Jun 2025 21:53:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGsB-0000000FsWW-2kBM;
	Fri, 27 Jun 2025 21:44:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 15E0461435;
	Fri, 27 Jun 2025 21:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4687C4CEE3;
	Fri, 27 Jun 2025 21:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751060678;
	bh=b4bjcqtYTMlbCBJkkYv4E30QbkPwT0gz6mXrIsFMar4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X7LZXGuMzoYAPwAVmFLgM9ZXHBrFMbRhTDriRlOw/PJEGiL5TsFIW55+ILevN3XMZ
	 e0I6+5cJhuher+4bqd+U2LfXSYPU1v+C8ZXAhGEOqJ0SfhsGyEAePZNtQCakduJ0tv
	 3UTT1loKWWpkGN1J0XT9NCfWxPctHlKYyf4GuAqyB+iDe6ka2AUX82cXGALqIwXk7F
	 1a/R2EQr9ihzEcrnjSusgAEB93D6/wSeg0xDv4Wy5aDEHyotgzbh+Fg5R3SWQa0qXs
	 0ka6FS6xpazzLpq5KgRvPF2slmlnFRq1YDEQ/rCtEWQMLOPQH07iLvCdIQjCNuvKhX
	 JK3kJJ14iL/tg==
Date: Fri, 27 Jun 2025 16:44:37 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
	Russell King <linux@armlinux.org.uk>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>, devicetree@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Eric Dumazet <edumazet@google.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Simon Horman <horms@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [net-next PATCH v15 02/12] dt-bindings: net: Document support
 for Airoha AN8855 Switch PBUS MDIO
Message-ID: <175106067736.193475.3574090852380015869.robh@kernel.org>
References: <20250626212321.28114-1-ansuelsmth@gmail.com>
 <20250626212321.28114-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626212321.28114-3-ansuelsmth@gmail.com>
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


On Thu, 26 Jun 2025 23:23:01 +0200, Christian Marangi wrote:
> Document support for Airoha AN8855 PBUS MDIO. Airoha AN8855 Switch
> expose a way to access internal PHYs via Switch register.
> This is named internally PBUS and does the function of an MDIO bus
> for the internal PHYs.
> 
> It does support a maximum of 5 PHYs (matching the number of port
> the Switch support)
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/net/airoha,an8855-mdio.yaml      | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


