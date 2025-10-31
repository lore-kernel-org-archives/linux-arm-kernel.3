Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CE1CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 16:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=roafZkZWewZsYCQZCghd/+pRCfB9REddQFj/JcoKv2I=; b=TD4Px8UsPhSGdaAAoP8NMRSaIi
	cMxaU25o/f23DboylZvvyLgaBfNum4uUeL+/B2rk6WAUplN16bdhAw5x4nlrs6MxNsySLAI0NaSNk
	aaocncR141GVvU+5Ndy3MCA6dj7RI1BUlldzSAjmRe5cJ1PJzKh1Se1A1+HFeutpyNFAt9u0SyZdF
	FiKQW2tr6PgBiWik6zaaO8L7IpywwzANpMbmT5oHF4cXR/fOx95zzsoxpirWQJ7sPS64wggrzNv+u
	9yljkAbxBLkqNyF+zUo4yrjWAzTkIYhKHb4NS1z4qlsYPE99i0kWlUAG+ygLDJqxwGxBWX/gSAuMb
	V1zuhdSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vErow-00000006OXT-47wF;
	Fri, 31 Oct 2025 16:17:46 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vErov-00000006OWg-1Eip
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 16:17:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=roafZkZWewZsYCQZCghd/+pRCfB9REddQFj/JcoKv2I=; b=Ow9X0/AB6DyPbpW+TJ4tCbWALE
	nr4EJ16lxZ0U0GmG8BgfD/dtxCTNa9HrtEvuThntVYfl73unICSJYgXo6K/p7W1Sjc8YOiGrON4Hq
	KL6YKDquHAdIKb+hNnpiG58T1EWQwN7flQlQ9WMorlXp8ic4CHh8YAD8zF+Wk3LHMrFs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vEron-00Cc6g-F9; Fri, 31 Oct 2025 17:17:37 +0100
Date: Fri, 31 Oct 2025 17:17:37 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 3/4] net: altera-tse: Don't use netdev name for
 the PCS mdio bus
Message-ID: <89b97635-1e3a-489b-be99-67c76c46ca23@lunn.ch>
References: <20251030102418.114518-1-maxime.chevallier@bootlin.com>
 <20251030102418.114518-4-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030102418.114518-4-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_091745_332128_F17D006E 
X-CRM114-Status: UNSURE (   9.21  )
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

On Thu, Oct 30, 2025 at 11:24:16AM +0100, Maxime Chevallier wrote:
> The PCS mdio bus must be created before registering the net_device. To
> do that, we musn't depend on the netdev name to create the mdio bus
> name. Let's use the device's name instead.

The name does appear in /sys/bus/mdiobus, so there is a potential for
ABI breakage. But it seems unlikely.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

