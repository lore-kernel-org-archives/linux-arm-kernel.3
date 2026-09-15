Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476F2C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 21:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PzoiITKlBLXLGeAi+rEGF1gOP/gOqIhjg40FFryu9dg=; b=evlEaDQxAlWEeLVExM9gHnXq6f
	l/7aXZOPE/kA8AumaWDM3dmHy9nl98ZSHNP1buwCzl42l8O8wMfAImpCvJKz+Wwd+xoP0JNrVwnVX
	Cvjx7YUQoeVQclDQH3teZs3Soe/xYrg7+TE2nBIa1+myfDb4EE+LVwzjms6J22COKQ9DXbktskUBz
	ksl7hTGlZAe3Wh2K1XPF8ZEgMuWXB07jLhw9GqLP5DiJylqVW/n0bo0P5fVr2R7pVvR+goNnMh1to
	1gZ9PAE7azFeeRvIRnfUbk3q1ZNdIjXIb7B9r4anKD0zgE6YxErVvkBEcPU7BImVfq0eUV6uLTaeN
	Tv1EbNXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6b8c-00000007zNV-0Yop;
	Tue, 15 Sep 2026 21:56:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6b8a-00000007zNM-2zAx
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 21:56:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PzoiITKlBLXLGeAi+rEGF1gOP/gOqIhjg40FFryu9dg=; b=LvJWCxt1zvnhtNdA7XSNe4s3Ay
	+qWVP/UzcehI/yOsf7k+tLFjb99o0bOrAuoMkuIF14rN8IxsYbVsbfKYPB3eqhT8KRIpgTPuRQbVO
	0nEX7WcZDIWvxhA4BNky4ZaGGk6v6ArBuUxy+vS+Kje39kFE6Nj2/NiiSWw2NvVOHmaMmrVixVGI9
	TkDtnrxSl6XNNUAcI1zOipF2EYZj3xk/8wR/mQv1TDKr/jNE7xwIR5UpxYoNVBIVZLnkzjcKa8By5
	FxMvQ3vMNxSEop6X1zMxwJDPYsSKCoOG7iinSzZp5J8g2cZ4kod7JBBy24cVoOfOfVjk2caD1Wvfg
	rPBNtBjQ==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6b8X-00000007HTt-2Dez
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 21:56:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=PzoiITKlBLXLGeAi+rEGF1gOP/gOqIhjg40FFryu9dg=; b=Dt7jZt3jUKrYF/Bw0fRTELgb0P
	6fc4mYCyF6yEvUxSgYkrD2a7by0LYTtdU52Weo9aVMHP6kC04ezNoZmbET8Wp1jVF/QqX3AsGkR2f
	ps92mR6CaPMOPQ7pdj9vKxEWxQTBPRDFSCGiDbIPdXKo2FzABqsc1l9IfBJohh+6izAI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x6b8F-005LpS-5k; Tue, 15 Sep 2026 23:56:03 +0200
Date: Tue, 15 Sep 2026 23:56:03 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Maxime Ripard <mripard@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: allwinner: add H616 EMAC1
Message-ID: <7854c5d1-5eec-4d9d-8d52-c597e6fbfcde@lunn.ch>
References: <20260915-submit-h616-emac1-v1-v1-0-195de0bb1f8a@gmail.com>
 <20260915-submit-h616-emac1-v1-v1-1-195de0bb1f8a@gmail.com>
 <5df35a3e-d2c6-4576-868f-d3194de3deb0@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5df35a3e-d2c6-4576-868f-d3194de3deb0@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_225621_906664_9B3215E0 
X-CRM114-Status: GOOD (  17.28  )
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

On Tue, Sep 15, 2026 at 10:33:12PM +0200, Maxime Chevallier wrote:
> Hi James,
> 
> On 9/15/26 21:03, James Hilliard wrote:
> > The H616 secondary EMAC uses a separate system-control clock register
> > and supports only RMII at 10/100 Mbps. Add its distinct compatible
> > without an older fallback, since using the primary EMAC clock register
> > would not work.
> > 
> > Constrain the PHY interface mode to RMII, matching the hardware. The
> > EMAC1 clock register also retains the three-bit TX and five-bit RX delay
> > chains, so allow the existing Allwinner delay properties for this
> > compatible.
> 
> I don't think there's such a thing as RMII delays. RMII has a single
> clock, contrary to RGMII that has a TX and a RX clock with a 2ns delay
> between clock and data.
> 
> I think it's just a leftover in this IP from the other variants that
> can do RGMII ? You should just be able to drop the comment changes here,
> and same goes for the dwmac patch.

That was my thinking as well.

     Andrew

