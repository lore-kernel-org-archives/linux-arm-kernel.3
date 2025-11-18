Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C670CEDDA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 14:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/1LOV6UJgF8pp/yoSNQCb03IJjkgAZf5/3ALMFD0JY=; b=LDIWztBiuNrrmZOKKfKupz1SXl
	mH0WPD1AD9fB0R0LHQq67sS+pzvV2ugsBMGSNgw418q4sabQGJ10SXLU4gGW5Ot6HEyBQ3pC8v/Ps
	Fos9osDVb9GoyJiL3ppSRKID/ziefQaDx0Om+rhZaj7ps9jgmqd3olxnMjN8JX58TSQbFqfRrYUNa
	p7V9LO5eQdg+BMAGh6cdYzEpOtSmnffJRTAfCQyl6hgLH6I9x1cHupbdwsBbWhqJvU0QYnh5xXWhN
	/zX/IWzUDVjx9wYCUvoK+EX/GrsgYj06iHeFAfS4VqmUtOWfR4ODmZLdTZjp/f6oZ39jEg2d/Bmaw
	WNEvJdZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLN2R-00000000a4j-09Il;
	Tue, 18 Nov 2025 14:50:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLN2N-00000000a4A-03Pv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 14:50:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 31622438B3;
	Tue, 18 Nov 2025 14:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2768C4CEF1;
	Tue, 18 Nov 2025 14:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763477428;
	bh=1E4X4gefkIzYTETLSk5bvLuWm/KtogFFY1CDdvW0meU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o7rOXQoIC0LO3wczFpoOQkwAuSw/7ccNNDU0xkAt6kMBsNFiC7Grv6uzr3Jdg+aJf
	 xatZa4QuZIveV8uod2MgfDR/jbedLBEq3f0wVmruwv/5JoErT9nXzlOSErGMQZ/hBE
	 Jpl6chGel83nyc3+/mxHgkG6T2tOEOd8tXDH+VzOyVHZbuqZ4BNziVcJ47R7Gh2e+J
	 uc8sxipRcDiRMPEPJ0bg7yLwLlrpRzM2pFiaS+nRTy68gAuYu5/atdRyaIWFKe70ch
	 AN/Gx0+4HQkh8zegPQvCEBX2GPDpAjghwXKS0ENrlouwlQJcfSE+MhTp05ax1fMsD0
	 PdRSVsPzP6kPg==
Date: Tue, 18 Nov 2025 08:50:26 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Romain Gantois <romain.gantois@bootlin.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	=?iso-8859-1?Q?Nicol=F2?= Veronese <nicveronese@gmail.com>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>, davem@davemloft.net,
	linux-arm-msm@vger.kernel.org,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Paolo Abeni <pabeni@redhat.com>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	netdev@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org,
	Simon Horman <horms@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Eric Dumazet <edumazet@google.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH net-next v16 01/15] dt-bindings: net: Introduce the
 ethernet-connector description
Message-ID: <176347742560.3223087.13861755734926034941.robh@kernel.org>
References: <20251113081418.180557-1-maxime.chevallier@bootlin.com>
 <20251113081418.180557-2-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113081418.180557-2-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_065031_448379_96123ACE 
X-CRM114-Status: GOOD (  18.43  )
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


On Thu, 13 Nov 2025 09:14:03 +0100, Maxime Chevallier wrote:
> The ability to describe the physical ports of Ethernet devices is useful
> to describe multi-port devices, as well as to remove any ambiguity with
> regard to the nature of the port.
> 
> Moreover, describing ports allows for a better description of features
> that are tied to connectors, such as PoE through the PSE-PD devices.
> 
> Introduce a binding to allow describing the ports, for now with 2
> attributes :
> 
>  - The number of pairs, which is a quite generic property that allows
>    differentating between multiple similar technologies such as BaseT1
>    and "regular" BaseT (which usually means BaseT4).
> 
>  - The media that can be used on that port, such as BaseT for Twisted
>    Copper, BaseC for coax copper, BaseS/L for Fiber, BaseK for backplane
>    ethernet, etc. This allows defining the nature of the port, and
>    therefore avoids the need for vendor-specific properties such as
>    "micrel,fiber-mode" or "ti,fiber-mode".
> 
> The port description lives in its own file, as it is intended in the
> future to allow describing the ports for phy-less devices.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  .../bindings/net/ethernet-connector.yaml      | 57 +++++++++++++++++++
>  .../devicetree/bindings/net/ethernet-phy.yaml | 18 ++++++
>  MAINTAINERS                                   |  1 +
>  3 files changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/ethernet-connector.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


