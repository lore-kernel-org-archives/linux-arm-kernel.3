Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C70D2D11B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 14:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OXrfj5rjnNlaXrZacAn+dmq3hagGp9vMiZGCz2JpJAg=; b=4ZzA+kAi3reHodm0jFR4u7mzDz
	orA5x9wnLfLbEz5bM59aUiQPmDjnqBrdKbtSMiKVch6A7eYZgXQdVYGgazH7i+EvDKrWxagpR0y0X
	vvFvYRjUUeKX4Vw3A3cn0cRgbV+YzJVKpqt7KfovsZC7eU9eyThYXZcXECwNjrwcs1qM6f3CN8P8/
	3f0Ts/GAv060FcNherNFHW2Cn63b5//xSD2LdbA/ZOEmNXY8WTyWGdndbPnpNeaNVKFHYZ3sswZ3w
	Ex9/3T8LkVA886LsF2EM92FVzXvdWmnCV8GLeI3Gj5TgI/cb18C/w1KHmxxediA7uDUfhCR+sITva
	Vg0etFZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfff1-00000007HVg-0dl7;
	Tue, 13 Jan 2026 14:46:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffez-00000007HV3-27wK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 14:46:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DE22B6001D;
	Tue, 13 Jan 2026 14:46:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68BD9C116C6;
	Tue, 13 Jan 2026 14:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768315576;
	bh=cEyiVLjNwfdDXJ0451AwNlqy8+a2Ag+lY1jlX6JLTDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k1UJICsWnKR2goQAsuExFImjT+eFEgpQjbCn0i5tvA/k95KQgHuEfHWabfCo+6Db6
	 9svQn2BaVk+2sQ6ujwqRGONZITsj+220A1aY4SwFzU5YAcBAxC+GywH7gTGuuc1B+4
	 tiKFkQ7kxBF3i9wBtnNadL9pSMYwCecxMURmjbVijmuChN4/9GnWBP2lem64Lb8qF0
	 hhF+fEfxqHVM+lNuqC/SRooItfr1lUEujnaArVkqu1CKMAP14hyEyPhFjku9KRqJxk
	 lTgv8gv+OOqwo5FezVP1Kg/P7NzSojA5ovnHWZBE6s3w71SMHflg38zqdsUUO/+0Ps
	 bBkd5y2nQBz8A==
Date: Tue, 13 Jan 2026 08:46:14 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: linux-arm-msm@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Antoine Tenart <atenart@kernel.org>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	mwojtas@chromium.org, devicetree@vger.kernel.org,
	Romain Gantois <romain.gantois@bootlin.com>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
	netdev@vger.kernel.org, davem@davemloft.net,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	=?iso-8859-1?Q?Nicol=F2?= Veronese <nicveronese@gmail.com>,
	thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Tariq Toukan <tariqt@nvidia.com>, Simon Horman <horms@kernel.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH net-next v22 01/14] dt-bindings: net: Introduce the
 ethernet-connector description
Message-ID: <176831557374.3740779.1775436338458125748.robh@kernel.org>
References: <20260108080041.553250-1-maxime.chevallier@bootlin.com>
 <20260108080041.553250-2-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108080041.553250-2-maxime.chevallier@bootlin.com>
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


On Thu, 08 Jan 2026 09:00:26 +0100, Maxime Chevallier wrote:
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
>  .../bindings/net/ethernet-connector.yaml      | 56 +++++++++++++++++++
>  .../devicetree/bindings/net/ethernet-phy.yaml | 18 ++++++
>  MAINTAINERS                                   |  1 +
>  3 files changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/ethernet-connector.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


