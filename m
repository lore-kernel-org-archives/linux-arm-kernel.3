Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D8FC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 23:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C3zy2XphgnUkhLOtVMQNYFA3p0SHRDeXpXy0b34dB6I=; b=MOmuLoZQGP+81FdgJiWGWGKfV4
	F0SDiwwJ56FAWXQdkCLgVOU5U1mviFhA0iG5Dhd1cuTlm1dwIkdDNiWrxgBCJaLsbrBO18WG7jArz
	7lQcJ2GwPUTThuvnL7rr2ztEvd+wxwXjOevRb6/2xTPgxATlDaTWGYCwiFMJDuMDtHFHVCGaNwCO7
	VAk7B4KKoPY2wFe7OR0K8XiVyg2BAROfbv0IlKsVC2dOQv5yftRCz49IlsUf58atf4hhXBk6Wc8uK
	RCCG3VW8SRV6lrD1cUMGgVGYkCfRHJH+EpgIyAoodD1uEISDelXRUyhl/5ICnLsUDWNEAYPe11gK2
	cPJ+P40g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uddW6-0000000Fpjd-0xcq;
	Sun, 20 Jul 2025 23:32:26 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uddTf-0000000FpYy-2Ox9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Jul 2025 23:29:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DA7D4A5279D;
	Sun, 20 Jul 2025 23:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9C0CC4CEE7;
	Sun, 20 Jul 2025 23:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753054193;
	bh=9vRFi57eCNNn/RDG1UsnpLJA0b2NK9C+iSXFxF1Bsu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r8V/zCiyA4u/5PyfBrhpwGiPbXUwMo0HTAx+K7zSRwdmp+PKBPT2vii+6hPfcbAjy
	 2E+uTWZ8QZjdX4Z8defLdoE1RtHOnwdeMWfjGsGtRSXdWPp+pMDXXBmabMPFi0t7X5
	 MTeg9th7oSkxf7MG4+Gj/EC+h26qOlzDV9EYcDUzPD1z6ls4lI+4MwTFzBqICzXShD
	 7BLvUbAPGD84WrSLNxuwEP9AFhXNN7/0qmkEwJX5EABaJ2MSfEeTWET8LKrSJZcXeQ
	 5uKxFu29ob4YwEuI5dYLikVQDIyrjpBvw2WgVNlD1qxkp1PFkSuYTK8vxJhWkGC+Yv
	 UE+r0AgmhZ79w==
Date: Sun, 20 Jul 2025 18:29:52 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: =?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	thomas.petazzoni@bootlin.com, Jakub Kicinski <kuba@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	davem@davemloft.net, Conor Dooley <conor+dt@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?iso-8859-1?Q?Nicol=F2?= Veronese <nicveronese@gmail.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Antoine Tenart <atenart@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Paolo Abeni <pabeni@redhat.com>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	Daniel Golle <daniel@makrotopia.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Romain Gantois <romain.gantois@bootlin.com>, mwojtas@chromium.org,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH net-next v9 01/15] dt-bindings: net: Introduce the
 ethernet-connector description
Message-ID: <175305419142.3067276.17489545129976520306.robh@kernel.org>
References: <20250717073020.154010-1-maxime.chevallier@bootlin.com>
 <20250717073020.154010-2-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717073020.154010-2-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_162955_750326_AB8FA59F 
X-CRM114-Status: GOOD (  18.04  )
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


On Thu, 17 Jul 2025 09:30:05 +0200, Maxime Chevallier wrote:
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
>  - The number of lanes, which is a quite generic property that allows
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
>  .../bindings/net/ethernet-connector.yaml      | 45 +++++++++++++++++++
>  .../devicetree/bindings/net/ethernet-phy.yaml | 18 ++++++++
>  MAINTAINERS                                   |  1 +
>  3 files changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/ethernet-connector.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


