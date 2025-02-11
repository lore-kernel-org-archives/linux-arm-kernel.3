Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26D7C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 14:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VSeuhfOw8yfHQ+TWsCEpeuHvxKiIbFJlwEB/VaRLJIo=; b=W0fZbjJNZSSazne6Xruarqn8V7
	/ExDVU0nIwzCv5jHGYlS+7DYvI9s9xlT9OU0a/neWrmQeJbVDUDRJizeXKXv7BxOkMETJ/zDYSjx1
	lWkNwIHL1PmJ2fAmiFWcNBV27KYqifBXE7iu2CSBZCLuH6zG5PZLnZaaQljFXzBWpeLqiayOVP9yR
	8VNf76iFp6SOfkLPTTdZ21neicpootuJXR592CccSG+J2oKGWCAj16mxcVFslVeEU6CT+wbla9VKK
	F2rJcaMLPCJ3ywx8tmvigxMAzbqqL8iCV4HeA6Dy+F+0eXVwWTw8nNWQrUDLpL+2OA9qXZn/eG0Qa
	KxBC9MSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thqzZ-000000044Qf-2LO8;
	Tue, 11 Feb 2025 14:12:01 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thqsQ-00000004337-3uXB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 14:04:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=VSeuhfOw8yfHQ+TWsCEpeuHvxKiIbFJlwEB/VaRLJIo=; b=QNZeXL/pfPJhHnQAz1R1qzLi/w
	OXuJqpxpgy+GIdKnoz+ivHnrTcVOJCAocPLD/vCv7xQKdndoeO0D2qz5w+wltF5y9aOof+SxqAzKM
	KSWnELbT/2kglIv9CgYbcoMgLbTf7acKQyJ29q2shPGklCJADXPgB5JOHE4ek1FKiLtk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1thqsF-00D4ti-T7; Tue, 11 Feb 2025 15:04:27 +0100
Date: Tue, 11 Feb 2025 15:04:27 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?iso-8859-1?Q?Nicol=F2?= Veronese <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>
Subject: Re: [PATCH net-next 03/13] net: phy: Introduce PHY ports
 representation
Message-ID: <0ae41811-e16b-4e64-9fc4-9cb4ea1da697@lunn.ch>
References: <20250207223634.600218-1-maxime.chevallier@bootlin.com>
 <20250207223634.600218-4-maxime.chevallier@bootlin.com>
 <20250211143209.74f84a10@kmaincent-XPS-13-7390>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211143209.74f84a10@kmaincent-XPS-13-7390>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_060438_966177_E3CA63C7 
X-CRM114-Status: UNSURE (   9.83  )
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

> With net drivers having PHY managed by the firmware or DSA, there is no linux
> description of their PHYs.

DSA should not be special, Linux is driving the PHY so it has to exist
as a linux device.

Firmware is a different case. If the firmware has decided to hide the
PHY, the MAC driver is using a higher level API, generally just
ksetting_set etc. It would be up to the MAC driver to export its PHY
topology and provide whatever other firmware calls are needed. We
should keep this in mind when designing the kAPI, but don't need to
actually implement it. The kAPI should not directly reference a
phydev/phylink instance, but an abstract object which represents a
PHY.

	Andrew


