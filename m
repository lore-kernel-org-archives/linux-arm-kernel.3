Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DDAC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 00:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qgU+Ush40s4PS9AAo5HPcGo6+xYTnCMn0S69tYBKtys=; b=aA0pI858w2CMuODG5j33k1H9Pi
	Z4k8Yw0wHAfaKZhOtLqTNXqtb5x/kyTmIJH2iBysGkxOeoMVMxvOm++SvyginE14ec3Iu6EbWz+6M
	At+xEVlrz8xdls1ai3Zd37OBUSmRManmU9B4nZQVDKGBsgC/W3fBeYNFSRNXQWY/LHO3sgetHv311
	nQSwhpj4aoF8MOgcJp2XugzVsv38Vr8t8Ljbo61HAkssHRbyWos9RavKwdqPS5fBRb9MYE8LiW/sy
	Q4TyZ8mTbdOcEVz7wAFtMWAn/DV6i3p3zTr22OM7872V1+i0pJiaU9du5ObXPm+h5PvSmu83sVuyq
	Xkd4VSMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u32BR-0000000C7ee-2Vku;
	Fri, 11 Apr 2025 00:23:49 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u329e-0000000C7Y7-0yJn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 00:21:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AA95EA40DDB;
	Fri, 11 Apr 2025 00:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00707C4CEDD;
	Fri, 11 Apr 2025 00:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744330916;
	bh=xbce/LIafrkgsAwqwYafme3DNQiuM8+sIryv9oj7aj8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KX5fRREFpGXczmVZ8OzVc0AIahz4FVzSSkMU0suQvvN45aCmItNWu5ZparPs11O89
	 qXhnuXXvyD8r8tVyZXwxeHSQWeBhHQapcy5gBTgU5c1sXwg+7xN64EkrXzN7AoZaHL
	 Y1uNkz4BWufU9hzKYqpkvgsNCZ/2eXD6PDGEo4/WzyniCKRbpfUeLWWi+i9KXTaERK
	 VOq7v2FHaWFKAB0RQu6xai+Z2QEtv/pnAX1jciLDyHuBPk67B4oeKZnMNV3+eJlGGn
	 fEFSNQIfcoNy1nthc4MGowfg3kYkLQnXlQrNWIqJMzQEB6wtSOhHv5PyAbvx1vuze3
	 k3gNWOfq+ebCQ==
Date: Thu, 10 Apr 2025 17:21:55 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Oleksij Rempel
 <o.rempel@pengutronix.de>, Simon Horman <horms@kernel.org>, Romain Gantois
 <romain.gantois@bootlin.com>, Piergiorgio Beruto
 <piergiorgio.beruto@gmail.com>
Subject: Re: [PATCH net-next v5 1/4] net: ethtool: Introduce per-PHY DUMP
 operations
Message-ID: <20250410172155.3cd854d8@kernel.org>
In-Reply-To: <20250410123350.174105-2-maxime.chevallier@bootlin.com>
References: <20250410123350.174105-1-maxime.chevallier@bootlin.com>
	<20250410123350.174105-2-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_172158_339726_F62B23CB 
X-CRM114-Status: GOOD (  10.74  )
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

On Thu, 10 Apr 2025 14:33:46 +0200 Maxime Chevallier wrote:
> ethnl commands that target a phy_device need a DUMP implementation that
> will fill the reply for every PHY behind a netdev. We therefore need to
> iterate over the dev->topo to list them.
> 
> When multiple PHYs are behind the same netdev, it's also useful to
> perform DUMP with a filter on a given netdev, to get the capability of
> every PHY.
> 
> Implement dedicated genl ->start(), ->dumpit() and ->done() operations
> for PHY-targetting command, allowing filtered dumps and using a dump
> context that keep track of the PHY iteration for multi-message dump.

Transient warnings here that the new functions are not used :(
Would it work to squash the 3rd and 4th patches in?
Not ideal but better than having a warning.
-- 
pw-bot: cr

