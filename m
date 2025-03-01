Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C2CC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 02:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X4A2P0pAL5w+zEE9x8XbTmTjGewsrBxr+F1DGFTT8Jk=; b=ekFegzPL+b5WEkwYLABWJFUQX7
	GmgkN9S+g5fgvla3M6gRQx0Sa+yxLG4biOYBbTLRAIgXql9ADDt+7FddwnUnaX2Z0z0SpFMQD2M8b
	Un8o5vUfee2TOLPWk75n9BSaFgG2KPJedcEOEF/jBZpU7cRtT+SDO8KaW+G7HmVGoVnRKzqq16zwV
	771XWTl+6LP/FgYRDTxk1fWpg6M/YwmHe2UN0fG1lkSW/dNn2WpERLkJVB1vGlGQShZiWlLs2bqp7
	Tpbgbqk251OGrVzOfZgZlqsOZJnGIf0TYrZNiVxRv/YqFaEqFoaSAVDxwRHPlhWoR6UtDACJBuFgx
	q0xBaQfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toCYW-0000000DGNz-01r4;
	Sat, 01 Mar 2025 02:26:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toCWx-0000000DG9G-40vL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 02:24:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CA2D55C67E4;
	Sat,  1 Mar 2025 02:22:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C1D9C4CED6;
	Sat,  1 Mar 2025 02:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740795882;
	bh=X4A2P0pAL5w+zEE9x8XbTmTjGewsrBxr+F1DGFTT8Jk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SqOPMblYHxWBy67SUWSrGjjjiQUJFZN5EZ/kkbU8ho8C3apRfWXcy1prcKCZHr7SG
	 MKHBs8IzsTlZiHrGdl0bGeD3qYY9bzu2cETN8EOoTinC4ZHKCIDHMk8z6rZOqq3nQh
	 rEpKNhke6shCtG8QqAqWEoQEp/d8vYn/HZ/Xeyruz1IEzNUgLE+Ql7l9nMiSjRDpoC
	 bTgg4+PupGZYjEP52NnwKFZqCj6SHpC5sD7EJ688AodWFUHVACVWLXa28+b5h6eci3
	 Rt2xFZxzrn+HesWhjeutzl4rLwrWBdbLhUBk0RU5Pm9LqALqus+XV7aHSjIjZgXxgN
	 0XNuN/Wv+U9OQ==
Date: Fri, 28 Feb 2025 18:24:40 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Parthiban Veerasooran
 <parthiban.veerasooran@microchip.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <vladimir.oltean@nxp.com>, =?UTF-8?B?S8O2cnk=?= Maincent
 <kory.maincent@bootlin.com>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Simon Horman <horms@kernel.org>, Romain Gantois
 <romain.gantois@bootlin.com>, Piergiorgio Beruto
 <piergiorgio.beruto@gmail.com>
Subject: Re: [PATCH net 2/2] net: ethtool: netlink: Pass a context for
 default ethnl notifications
Message-ID: <20250228182440.3c7f4709@kernel.org>
In-Reply-To: <20250227182454.1998236-3-maxime.chevallier@bootlin.com>
References: <20250227182454.1998236-1-maxime.chevallier@bootlin.com>
	<20250227182454.1998236-3-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_182444_054674_80FF0652 
X-CRM114-Status: UNSURE (   7.75  )
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

On Thu, 27 Feb 2025 19:24:52 +0100 Maxime Chevallier wrote:
> The only relevant user for now is PLCA, and it very likely that we never
> ended-up in a situation where the follow-up notif wasn't targeting the
> correct PHY as :

PLCA uses the ethnl_default_* handlers but it seems to operate on PHYs
now. How does the dump work? Shoehorning the PHY support into
the ethnl_default_* handlers is starting to look pretty messy.

