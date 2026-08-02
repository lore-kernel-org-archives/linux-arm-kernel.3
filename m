Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C209C55171
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 19:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ShKaSqVzpoKTOwv2WVILmoiM0sd7wX/pCkyn8buCZc=; b=V8BzeRXGqaTYAXtoT1uAFcOulo
	2IFgqhJacgzU6/sDnEAXOvFgTy3+fl+5RdIEX8/RhYgqEtDLilCkWe8N9OM4dWiVJNoTXGPYyigCo
	wNkMVdnnhE3hDWYpBpvAaQKPYvv+w+aNet0jwYbUf1Crd4QKfms+YMiRHSQ3sHeXU5ca3OZPBfHER
	o7pOm5xfSekmnz00HYGQkRNEecCqGYhxsKW9oTmY5kbDYJLsmIrDCF8oAV5aoSHNHVWO5qA6xpOs6
	uWN4Xt9qIFsGkxWMR59O9uBkCr4bc5Roet3tsSNhUSv/DN29FcBdHisQNVyVyHtQ2qM9u1dc+XSts
	foGAK3VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqbQj-0000000Fxuv-1M8C;
	Sun, 02 Aug 2026 19:01:01 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqbQg-0000000FxtD-214g;
	Sun, 02 Aug 2026 19:00:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=3ShKaSqVzpoKTOwv2WVILmoiM0sd7wX/pCkyn8buCZc=; b=fXRZGqyY1gL41dRfLIFcq8Dokz
	GcgcZXVeYXq1zbgcc5ZyBAmzbC0u5hqrStplnQZ+iEp3PSZv6NSCpp4rA/5VTitgS30L+YNtgrGUO
	x5bt2Yd5UN+G+vh9LuyONS2h6wd3zjmS5kL3nfrgY3k8KYHafnC4x7RR5ggbjSC9pUfk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wqbQM-00FbXo-49; Sun, 02 Aug 2026 21:00:38 +0200
Date: Sun, 2 Aug 2026 21:00:38 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Coia Prant <coiaprant@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 07/10] net: pcs: xpcs: add Rockchip RK3568 platform
 glue driver
Message-ID: <ba5522ab-1e77-4236-89cd-9483ed1f2da0@lunn.ch>
References: <20260801142244.679437-2-coiaprant@gmail.com>
 <20260801142244.679437-9-coiaprant@gmail.com>
 <23d8e994-8552-466f-98e6-c47d5783525b@lunn.ch>
 <CALj3r0i5yVcJY8V75y0Hm5xjtZSBpH0DXSAWKsAUqguChVcxYA@mail.gmail.com>
 <302c67b0-6729-4930-a409-a2408dde33fc@lunn.ch>
 <58C6FD30-02CF-4DC8-BE7F-4E2AAC5985E4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58C6FD30-02CF-4DC8-BE7F-4E2AAC5985E4@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_120058_515347_367FB697 
X-CRM114-Status: GOOD (  11.90  )
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

> Hi Andrew,
> 
> You're right that the xpcs core uses C45 exclusively, and modern kernels
> no longer require C22 callbacks for mdiobus_register().
> 
> However, I'd prefer to keep them for two reasons:
> 1. Debugging tools (mdio-tools, ethtool, etc.) often use C22 reads to
>    inspect PHY/PCS registers. Having these callbacks makes debugging
>    much easier without having to patch the driver.
> 2. It keeps the driver consistent with pcs-xpcs-plat.c, which also
>    provides both C22 and C45 callbacks even though the xpcs core
>    only uses C45.
> 
> If you strongly prefer removing them to keep the code minimal, I can do
> that in v3. But I think the debug benefit justifies keeping them.

Keep them. I was thinking it side steps the issue of accidentally
mixing up C22 registers and C45 registers. But there are useful use
cases for C22.

      Andrew

