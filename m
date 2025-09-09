Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A30DCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 08:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=He+M1AWH7LptBKK77tITWBQ2UW3f7vtD14QgbeDAK84=; b=tgwdREbQ4Y3sjYz+pchYOwqOj6
	vkKGZFZEdFfTFTLOP5uTvuudIboiLE74CKdty4gkEvrxNVivg9lpFiqhTtIWsdcGiWhQi7aQcG1Kv
	wWlmK4tnmqIKS5zkRQ47nPkPDkD6sNS5s4vf4+Wy640KMHYgs/l3dyAIiE9/45AkXxHH+ZqSy7l7d
	z0kGVIl+hFw3g9uudW6X35ir0Chbg/yzfLUPdk6A/sXyArSV8tUQMrfA6D0QdeuBCjwSDoLROK3On
	k9YywhTaS4tWInAl8qkbz/XOHARaEZVjPyMg6q/tO2GpDivo20oXLj5TB5f7xo5v5xDW6ONA7wORA
	N8UjLOTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvtsk-00000005cwP-3SIv;
	Tue, 09 Sep 2025 08:39:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsYu-000000055gy-0njQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 07:14:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A926943667;
	Tue,  9 Sep 2025 07:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0328C4CEF4;
	Tue,  9 Sep 2025 07:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757402083;
	bh=9eG5fnaSGiqXsw4eiPV/yIEg2n0/EzNdL6QuKQ4J0G4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PyuPtYAwzhNuKU4CSjN/l5NrjK4jQlq9+Gd6w3rSIGppeuJ0CPZX6VeWqDtHL4h65
	 RPH4fFhyVl7Dh0ieAdIQZbCjO5GMIckLfwxIZrzUVa9RdVZB3IOQkZFrdEbMdvmobG
	 GZOgJb3ByAtgslNt9n6hMSayDcghNkFv9NbfbDyA1ePzq4ZqnsZ4dqiGdQ1tpArVy8
	 PfdTXAuLyA6+jiPGJG6XjNEmrkQpwBiBILIhyYjhVhaTgRTWiUKGI9AJ/H7NbjLHB9
	 MdhAX5tTLBe9r/FHQBAHLTl6KgqZH1IZTlhwM4hgonvAzGZDXtuuK+sBNZjRXi3hiD
	 VS+HP22zctCDA==
Date: Tue, 9 Sep 2025 09:14:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v3 1/3] dt-bindings: net: renesas,rzv2h-gbeth:
 Document Renesas RZ/T2H and RZ/N2H SoCs
Message-ID: <20250909-charming-tuscan-mouse-abc1e0@kuoka>
References: <20250908105901.3198975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250908105901.3198975-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250908105901.3198975-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_001444_275949_8465B21B 
X-CRM114-Status: GOOD (  14.61  )
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

On Mon, Sep 08, 2025 at 11:58:59AM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add device tree binding support for the Gigabit Ethernet MAC (GMAC) IP
> on Renesas RZ/T2H and RZ/N2H SoCs. While these SoCs use the same
> Synopsys DesignWare MAC version 5.20 as RZ/V2H, they are synthesized
> with different hardware configurations.
> 
> Add new compatible strings "renesas,r9a09g077-gbeth" for RZ/T2H and
> "renesas,r9a09g087-gbeth" for RZ/N2H, with the latter using RZ/T2H as
> fallback since they share identical GMAC IP.
> 
> Update the schema to handle hardware differences between SoC variants.
> RZ/T2H requires only 3 clocks compared to 7 on RZ/V2H, supports 8 RX/TX
> queue pairs instead of 4, and needs 2 reset controls with reset-names
> property versus a single unnamed reset. RZ/T2H also has the split header
> feature enabled which is disabled on RZ/V2H.
> 
> Add support for an optional pcs-handle property to connect the GMAC to
> the MIIC PCS converter on RZ/T2H. Use conditional schema validation to
> enforce the correct clock, reset, and interrupt configurations per SoC
> variant.
> 
> Extend the base snps,dwmac.yaml schema to accommodate the increased
> interrupt count, supporting up to 19 interrupts and extending the
> rx-queue and tx-queue interrupt name patterns to cover queues 0-7.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


