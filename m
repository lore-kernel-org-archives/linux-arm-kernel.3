Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF533CA600A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 20:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iBnT7QbK9u0Gs8c95AjLx+P8e034rEiTzbi8S3Cwpwc=; b=gBQqXxw3vHnixkcgRJKW60wwVp
	ICXwKmKJ7V+ZEFlRpQUawVCw7ph4lkXjy6OlvmvARKMo2dbvolvncDwO3AUOhPZycDGWWxemGVl+m
	SI5FdBMNJXbNvdwe+hkCE6F/bwwrRawWdUVmbOSfEKU/FsHmKLsOjIS5SrVZouiisBXSosDKHR/Tu
	/41UpUniQTYe8LcrYQj+hfySdo0CB1lsdVLEr994Wb2iFVHtmaSgNn8baMysug5yBooi1ocw26TrP
	OWNBnQmyvELk8XU9gqva/26tZ88xpAc5mRq3nh6e5/Hgcn+VFcwTbV5ipcOPp6nVmI/LZEWGbaS0o
	AoVJ4TIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEYMn-000000038iR-49HZ;
	Wed, 07 Oct 2026 20:35:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEYMn-000000038iJ-0raA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 20:35:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 94F4643435;
	Wed,  7 Oct 2026 20:35:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BAFC1F000FF;
	Wed,  7 Oct 2026 20:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791405356;
	bh=iBnT7QbK9u0Gs8c95AjLx+P8e034rEiTzbi8S3Cwpwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EAnTrrZ9FBxijRk+eVs2T8pzlvv92TXfyUbTV4OOYhJre5ukKSsgV9PDEl3ZM+B/D
	 UohnG4dEbUub4MM3HZ38Jz8NzciIgVZ3pdUwgnYDSHNfCyok4rFESVz8jIPMAOt+lm
	 dLJi2vVZjTU6/qHvBm1tgWJ5EH9e6YdQCeJgHq57YAs7cqBq9Bu2WMWUiaYh+CFRoj
	 kDX9aClQniHp9CYj9DR1YS1/4rwJcuF7H5sDiaNL3ZG/MiyEpfTNQBayP8HMjRxGEP
	 VTC5XO9OIp2tx4YpIPk5+pAQ737aGag1CtbkztZTAz3ll2Rl2Z/egQvBmn+7T+ZbIy
	 XKqbZAf0OIRNw==
Date: Wed, 7 Oct 2026 15:35:55 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
	Josua Mayer <josua@solid-run.com>,
	Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	pierluigi.p@variscite.com, Sascha Hauer <s.hauer@pengutronix.de>,
	Joseph Guo <qijian.guo@nxp.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Stefano Radaelli <stefano.r@variscite.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, Conor Dooley <conor+dt@kernel.org>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>
Subject: Re: [PATCH v4 05/13] dt-bindings: net: micrel: Fix RMII clock select
 property type
Message-ID: <179140535486.208329.1445143309084105314.robh@kernel.org>
References: <cover.1790693249.git.stefano.r@variscite.com>
 <9a0f70dc168278a484bb336835bf2e419a9d089d.1790693249.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a0f70dc168278a484bb336835bf2e419a9d089d.1790693249.git.stefano.r@variscite.com>
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


On Tue, 29 Sep 2026 17:17:32 +0200, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
> 
> The binding describes micrel,rmii-reference-clock-select-25-mhz as a
> boolean. dt-schema requires properties ending in -mhz to contain an
> unsigned integer value. A bare property therefore produces a
> property-units.yaml type warning.
> 
> Describe 25 MHz selection as <1> and keep the property restricted to
> KSZ8021, KSZ8031, KSZ8081 and KSZ8091 PHYs, which have the RMII
> reference clock select bit. The driver checks only for the property
> presence, so this does not change runtime behavior.
> 
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
>  .../devicetree/bindings/net/micrel.yaml       | 27 ++++++++++++++-----
>  1 file changed, 20 insertions(+), 7 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


