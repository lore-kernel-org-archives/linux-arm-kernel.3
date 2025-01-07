Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE7CE77199
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 16:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PGtI1Byt9Pcn8gKN9HdLiOqUShOUvAUef3OSlC+uX9g=; b=rGwcsHa2kXnwx6t787QouowupZ
	MzZqIQOKNx+ynXsMuTnszx/lTCKXaW8QukJT7d1ZH1txyVGa759XwlBlgzbznyxQ7Xuo8I6Osfa6S
	Ed7A40ZjFdA+zPO6jzF2B6zm/DZNePOJ1IIeqDHE9QiyGOAwDRAn1swvROP/LfhX7+b7zXZZlPRbR
	F+JUquviYE9DImaqfaEP196eKtKm+RXJrRfMuSVeL73ys4NtsyJi1SScR7g+5EpHWlu3+p6dw1xAM
	m9WsyKDjgvRyye1ANrF+IvzRq0x+HepkUVnxfitNpGctp/eDpU9TaTPywsEPo7DDCI5+5Xi/Ei9Ql
	LzTeOV5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCGQ-00000005aZW-14HX;
	Tue, 07 Jan 2025 16:17:06 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCDM-00000005ZuZ-47ox
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 16:14:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=PGtI1Byt9Pcn8gKN9HdLiOqUShOUvAUef3OSlC+uX9g=; b=4KbfYPHM9Lhi0tUQSaLF0UyLN3
	mp/Ts72StG/qKGze4Xgp6K5tkUylI//qhEeLjxCfxASWlXSvseWGQLMWsz+l8SZPqwKVafc+mzJ/W
	qXrnxhp6KLjdsUtoOxkc2a+azJmxaIZXGg+EI93pulOquGoILLNRbCuXnFgzbmlVhOqQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tVCD8-002Hks-6g; Tue, 07 Jan 2025 17:13:42 +0100
Date: Tue, 7 Jan 2025 17:13:42 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Kory Maincent <kory.maincent@bootlin.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	davem@davemloft.net, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	=?iso-8859-1?Q?Nicol=F2?= Veronese <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>
Subject: Re: [PATCH net-next RFC 0/5] net: phy: Introduce a port
 representation
Message-ID: <1b2cb926-803f-4440-9c6c-54e3d7bdcf04@lunn.ch>
References: <20241220201506.2791940-1-maxime.chevallier@bootlin.com>
 <Z2g3b_t3KwMFozR8@pengutronix.de>
 <Z2hgbdeTXjqWKa14@pengutronix.de>
 <Z3Zu5ZofHqy4vGoG@shell.armlinux.org.uk>
 <Z3bG-B0E2l47znkE@pengutronix.de>
 <20250107142605.6c605eaf@kmaincent-XPS-13-7390>
 <Z31EVPD-3CGGXxnq@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z31EVPD-3CGGXxnq@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_081357_019627_6498C72A 
X-CRM114-Status: GOOD (  17.04  )
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

> What I think we both fear is having a complex DT description of a
> port that the kernel mostly ignores. While we can come out with the
> "but DT describes the hardware" claptrap, it's no good trying to
> describe the hardware in a firmware description unless there is some
> way to validate that the firmware description is correct - which
> means there must be something that depends on it in order to work.
> 
> If we describe stuff that doesn't get used, there's no way to know
> if it is actually correct. We then end up with a lot of buggy DT
> descriptions with properties that can't be relied upon to be
> correct, and that makes those properties utterly useless.

This is a real issue we have had in the past. A property which was
ignored, until it was not ignored, and then lots of boards broke
because they had the property wrong.

I would strongly recommend than any property you define is always
used, validated, and ideally will not work when wrong.

      Andrew

