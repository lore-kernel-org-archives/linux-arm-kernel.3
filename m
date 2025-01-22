Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CF9C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 20:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uvex5e6pxn9WjTg+8tgFaEeT8EWGYbla2zLRi8ei0vU=; b=zZutXsok80z6OapNCF2G1A96X4
	bDKp5T3gnN15VyNHr0+47ZPu8Tc1Bxp4NuO7LZzIv2bgeujeNNmbSJj81t15IMJfZpLTfZm+A4q1B
	uVCRQifmkhDAhsd8pxESTn0s9kg5yBAMrdXclo4z/79Mm+KYLLW+1LRAoLMECIXtotvIfe+oSGnZ4
	zcJXZ01REt9F3RgIYWlW9jWRokv4m8S2SKdNOge85RBYZom7TdY4yAEvROldRYE3CDqFzU4+dEDr1
	Az0+vvJRs7PGSqL+Sbllz+ZicWXOiARoOnvRPuMH+39f6+MD8//ygbjLH0euerMFZyu4Pp/pPUiMC
	EhbJdoyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tahAV-0000000B98S-2hCG;
	Wed, 22 Jan 2025 20:17:43 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tah9D-0000000B8wB-0n8M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 20:16:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Uvex5e6pxn9WjTg+8tgFaEeT8EWGYbla2zLRi8ei0vU=; b=ECvxqBxOD0UQYqU745zOkC8kqV
	GU0uaQ/iOnKqSb4C4pQUiYXZGrrxl7aGurYPqTCNxR8I3pShWNVaRYOb/fd+e6rpmLU5E2mst0iIu
	BQjVKs75+8Hu0eS3tp7PzMVa8Fob84KRUqjCaBXNOPbX73+TaE1grEzZszt52cqKiirkcszyVkMKa
	XJGnHHC52zQmZy+d77rcM6cmPpR6u6qzLlv4oUEs0UROkz+OXRI0SJoFAdacBex0w/dpxU0hQZGnc
	KpeSF5lQ6gdA3YdJDym3HxgvwGK67Umcmb5qqVha0UdO87GAi2+dxrK7ZCjwVXhB5UHrhBCPahTrH
	UjKJd24A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48414)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tah92-0000G3-1x;
	Wed, 22 Jan 2025 20:16:12 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tah8y-0005CZ-11;
	Wed, 22 Jan 2025 20:16:08 +0000
Date: Wed, 22 Jan 2025 20:16:08 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?iso-8859-1?Q?Nicol=F2?= Veronese <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH net-next RFC v2 0/6] net: phy: Introduce a port
 representation
Message-ID: <Z5FSCF7u5a7r-ssD@shell.armlinux.org.uk>
References: <20250122174252.82730-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122174252.82730-1-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_121623_224003_52610713 
X-CRM114-Status: GOOD (  11.35  )
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

On Wed, Jan 22, 2025 at 06:42:45PM +0100, Maxime Chevallier wrote:
> First, a short disclaimer. This series is RFC, and there are quite a lot of
> shortcomings :
> 
>  - The port representation is in a minimal form
>  - No SFP support is included, but it will be required for that series to come
>    out of RFC as we can't gracefully handle multi-port interfaces without it.

Agreed - because I think SFP brings with it a whole host of issues that
describing the media facing port would be error prone - and to do it
accurately, we'd need a table of quirks to fix lots of broken modules.

For example, many SFP modules with RJ45 connectors describe themselves
as having a LC connector!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

