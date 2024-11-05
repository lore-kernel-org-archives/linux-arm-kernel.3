Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90452D3E765
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 21:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V+vyhukru1uIeE+kCfGRSTvksfHKtqzKauF6SWXFu/M=; b=SRXP7M7Pv96njeZttT8i/uHpHA
	cq8jwZ0HA5cXVcjeFLyseVDrZ5Dziutu14iKILlgjqe59vckamesdtDYQOEGOcOJ7O8fJaJm3/HwL
	E2URXfmTWugYNGYyUxKTLhZ4jRYcZGBgR7E+hRqsC6gSCJhFYTTW7IeHLwyLh+hHtBNt47ULHtXWc
	XqHmn4Haat/HarjjwUaWvjumLJMHEMqkSSeHpwGAIFaCsf+iucT2xHFPMmdZ18LEE7qT794OGWSqX
	/WK4JCtM244VOGXuszz89O3bBk2PjYDwFd2h7WDoaQDNPsI7xP1a5grobEAwtI0Mo+10JTS9rxPy1
	jnSNr00A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Qgv-00000000oVL-2b4i;
	Tue, 05 Nov 2024 21:02:21 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8QfB-00000000oAn-1QXJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 21:00:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=V+vyhukru1uIeE+kCfGRSTvksfHKtqzKauF6SWXFu/M=; b=EMLOHdhRqzpI6dSuwpLRH3iGqb
	RGYoKlpFPRnoA/Fh6kyX2tOZFXigDkaI5v/cE074EzYFnfmnOMeNfPJezJL1wdDi/FPpPP9frAKCr
	V+sL7N38ufFpzmbopw4WvkugHzE9+gEX7oFn7DqYGOYhAWj42L4FDV34AIZoEZw7j4q8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t8Qex-00CFpl-6A; Tue, 05 Nov 2024 22:00:19 +0100
Date: Tue, 5 Nov 2024 22:00:19 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Malladi, Meghana" <m-malladi@ti.com>
Cc: Jakub Kicinski <kuba@kernel.org>, vigneshr@ti.com, horms@kernel.org,
	jan.kiszka@siemens.com, diogo.ivo@siemens.com, pabeni@redhat.com,
	edumazet@google.com, davem@davemloft.net, andrew+netdev@lunn.ch,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, srk@ti.com,
	Roger Quadros <rogerq@kernel.org>, danishanwar@ti.com,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>
Subject: Re: [PATCH net v3] net: ti: icssg-prueth: Fix 1 PPS sync
Message-ID: <6a230b28-9298-410b-b873-21000af4c0f3@lunn.ch>
References: <20241028111051.1546143-1-m-malladi@ti.com>
 <20241031185905.610c982f@kernel.org>
 <7c3318f4-a2d4-4cbf-8a93-33c6a8afd6c4@ti.com>
 <20241104185031.0c843951@kernel.org>
 <e5c5c9ba-fca1-4fa3-a416-1fc972ebd258@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5c5c9ba-fca1-4fa3-a416-1fc972ebd258@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_130033_422320_5ABB855F 
X-CRM114-Status: UNSURE (   7.82  )
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

> > I think you need to write a custom one. Example:
> > https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/drivers/net/ethernet/meta/fbnic/fbnic_time.c#n40
> Ok thank you. I will add custom function for this and update the patch.

Maybe look around and see if they could be reused by other drivers. If
so, they should be put somewhere central.

	Andrew

