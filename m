Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF997C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 01:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ku5Akarjli+xuPW4RW8MtHS1hZOaclGkQ3HVUes51ds=; b=DYzJOp7JbAwITT1dCL8hy7cOSg
	5B8Htj4ejR5/a3MejQU6xk39+KMng1AVYvYl2EyCQDA2nZLP/69yaoooH56/frMUjChotkmfEv555
	eqnpkN62YwNSo/6Jd1xASBGqaeoMByUYFiW76Eyc2cmp//5XF0p0ErgqSnlHIiQrSxvnoqEnyM6ol
	YS6sklTKKrTltfSC03P3fHKiDQuGigFDzy2hhujs8852Wlu7YjjarkLVbXJcpd9vlrPiYKmrrb5RX
	c21m0zvsQRnka6rnTQtf6CuwXEPZQVuM7ScG+L6Pjl4c2aYZUQG4Q2rjerdd2bXjMqpP6FTM9iWRI
	Bg7zuBhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Q4p-0000000FGnV-0YrE;
	Sat, 12 Apr 2025 01:54:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Q2z-0000000FGfA-2pkF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 01:52:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A5254356F;
	Sat, 12 Apr 2025 01:52:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E88C4CEE2;
	Sat, 12 Apr 2025 01:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744422760;
	bh=CRE+SY7bJNk+uYBL0kKrvVkutDrMpSNs63eSfb8DWaY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FTsKhQKfNS53TwGA68TBYkM3vurdB5bj1Ko9Gpc+0gpB+MqPUB1bN/seKZlpIgRPD
	 9LkD7Qjws5wnZ3Oj3cWaac/ZmZu0cJlhWsjdkyUR6wy/UdsZzypX7kvgZ4CSUjnIf+
	 dC/fpN2qL+xSQO4WnuFw6LjyjjIAAngtQrA/Ts95FvXciOX6S891KPXyv0P/ucO5im
	 FqC5btjsNAk6Y6TKgWswQ8HaJE70xXrLwNKaYtE1+tTxVM1jraUcDkoO3s803+O7ao
	 CRxI24QIIdzLSCKoMQ9luXAJJ6vjgaMVPmbC1zOsmiCx9851lxC4f0datcZbI/qBxr
	 8pwL5B7ENu0tw==
Date: Fri, 11 Apr 2025 18:52:38 -0700
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
Message-ID: <20250411185238.77372b15@kernel.org>
In-Reply-To: <20250411092619.722b7411@fedora.home>
References: <20250410123350.174105-1-maxime.chevallier@bootlin.com>
	<20250410123350.174105-2-maxime.chevallier@bootlin.com>
	<20250410172155.3cd854d8@kernel.org>
	<20250411092619.722b7411@fedora.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_185241_736677_5EA272C2 
X-CRM114-Status: GOOD (  12.27  )
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

On Fri, 11 Apr 2025 09:26:19 +0200 Maxime Chevallier wrote:
> > Transient warnings here that the new functions are not used :(
> > Would it work to squash the 3rd and 4th patches in?
> > Not ideal but better than having a warning.  
> 
> ah damn yes indeed... meh sorry about that, I'll squash the other
> patches in (except for the net/ethtool/phy.c patch). That said are you
> more comfortable with this approach ? I was unsure this was what you
> were expecting from the previous iteration.

I'm not sure if I did expect anything in particular after the idea I had
proved to not be feasible :) This looks good at a quick look.

