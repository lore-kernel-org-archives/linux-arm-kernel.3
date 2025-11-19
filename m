Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D306FCEBF9A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 03:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zaGAWSHfr3ksqPWjaHUuPDmEpIitMsTy0P1Y+UXB3fM=; b=K8iu77izFMSgnXfpTfnCo3AM78
	POar98le8QatoohZCe996e50hy3esjoiE9iDUtYq25lnnyFSAPS+0ehrrXfHmetilTwL35Jt4vrhn
	ElhpgFlyZcbxuDBa1RpFhXm/25LMo+sEtirayynqE0d/LGYvCstBRyKN+4r7dhMq+a4NPemwnDZzw
	qcUE4HVeMG/xcttRcacx7RmKaV1O/19onP6WhyWmahklB9kuDIUSYTuRVK1OdkmIqnGMpGrQIVk2a
	rq2HwN0rAQ/u5VIyvGD6up+bmBBDB1GOE+sr0cSsyBBZcFV2CdZ6FPz8d2dMTiWO2obmmUhLW7/te
	7cNrCbuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYhu-00000001S8a-0nIr;
	Wed, 19 Nov 2025 03:18:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYhr-00000001S7z-3GXj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 03:18:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D9D56435A3;
	Wed, 19 Nov 2025 03:18:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C28C4AF17;
	Wed, 19 Nov 2025 03:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763522283;
	bh=gxvdTPLxCEGTom2KcOW4d2OIxzZkBK8tZnnpHG/Yqoo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tz3RVSUy64qcOSIcwGieM3noZcd3gVKOBEsnFaJrFLXtpbA/sXEgOIkMFERtQTbrb
	 QTKvesIgOdtS5i3FRmBXs7ketsUPEin/mSp8UmqjIWq4OFdocC67Awp06GItVRjDgy
	 tTrNzx6NEEZNcpeMgtk3TkwS4JZxK5fhT2cR881LhEsLu3rHB62Huwxh5Wv6Vq4B16
	 97EH5U6In+fmrPnMMJd9CX3/fwL3GuVMQXnaWt+ph17MMrpUKRorloA8YTQAq3CNnb
	 L8JvbyckRFfPAgOBSC4kpAgwVkaGZsdH8pa6sSjp5O7JDr03peT2fZJ7Aw86EJzc5X
	 4v8jmCJGZS3Mg==
Date: Tue, 18 Nov 2025 19:17:59 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Russell King
 <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Herve Codina
 <herve.codina@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner
 Kallweit <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Romain
 Gantois <romain.gantois@bootlin.com>, Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v16 15/15] Documentation: networking: Document
 the phy_port infrastructure
Message-ID: <20251118191759.28d14e32@kernel.org>
In-Reply-To: <20251113081418.180557-16-maxime.chevallier@bootlin.com>
References: <20251113081418.180557-1-maxime.chevallier@bootlin.com>
	<20251113081418.180557-16-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_191807_840306_6ED66E10 
X-CRM114-Status: UNSURE (   9.63  )
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

On Thu, 13 Nov 2025 09:14:17 +0100 Maxime Chevallier wrote:
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9281,6 +9281,7 @@ F:	Documentation/devicetree/bindings/net/ethernet-connector.yaml
>  F:	Documentation/devicetree/bindings/net/ethernet-phy.yaml
>  F:	Documentation/devicetree/bindings/net/mdio*
>  F:	Documentation/devicetree/bindings/net/qca,ar803x.yaml
> +F:	Documentation/networking/phy-port.rst

I think you should add a MAINTAINERS entry like the one we have for
NETWORKING [ETHTOOL PHY TOPOLOGY] no? Please include some keyword matches
on the relevant driver-facing APIs if you can:)

