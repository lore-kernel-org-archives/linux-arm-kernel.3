Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B6AC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 12:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OUGnto1UaSVcuSLfG7pwMcvHQ5YpEL5urexadRMv+b4=; b=Pny5gBhGJxHh7o4CFJ43iP2nGk
	eFMGzxeaMj3RVVzztvOGzNDffOCyJBHkrXDOARCSr2RS2IVNVMEjNy1ZP/+nJAXlQ7WTagRF1oy+I
	+03pU0tI34fA0OJS3L3/qb/ZcCtYswVKItdnvSAOqUyqIJmBrahKeEQBqbur9keUue7rlFI/wabhe
	NKJ0fsYmo7nZqOt67DTMCWZh6iofEuaa4XI7Cpq7TSdD8LLrQBTrgeKOPftoJHYrDrlSWql88/AC/
	U6t8WiA5z5S1STLbaYaEqwAYCpgTtBx2LC0TGnhIPmeJEEmGIgGBW1sepexN5Lumrs9zE3IURc7PL
	Urukyhuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Nwl-0000000C8kv-1MhA;
	Tue, 01 Sep 2026 12:50:39 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Nwj-0000000C8k7-13Jy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 12:50:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=OUGnto1UaSVcuSLfG7pwMcvHQ5YpEL5urexadRMv+b4=; b=dzTDo7UWrxhi/79t+KXfXVjfZj
	iSMYrlWJogstEozyrLiHn7FSbOc6etkayF5o43T1k/alRXkAUHA7U+9N1A8B7GTk/QJw+lW78DYO4
	ivXWA2g52xJApIuPXUZLRhCD0HoWDz3T1g/gUKh2/paEgSc8yn6JPezMO3iRjW8oAYDQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x1NwZ-002MA8-Mz; Tue, 01 Sep 2026 14:50:27 +0200
Date: Tue, 1 Sep 2026 14:50:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>, thomas.petazzoni@bootlin.com,
	Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac4: Use the full perfect
 filter ability for UC filter
Message-ID: <5a5b9bcb-f845-4b05-b213-7b7f09721198@lunn.ch>
References: <20260831070121.349778-1-maxime.chevallier@bootlin.com>
 <20260831070121.349778-3-maxime.chevallier@bootlin.com>
 <285c8969-2f0d-46de-b098-60ff10f30cf6@lunn.ch>
 <493afde2-8603-41e8-b6ce-f8e399c53275@bootlin.com>
 <c7819431-d33d-4e9c-ab36-be55b94d29f4@lunn.ch>
 <6f395b75-d5ed-4536-9f9b-9de2f56dd9fb@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f395b75-d5ed-4536-9f9b-9de2f56dd9fb@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_055037_285218_73817319 
X-CRM114-Status: UNSURE (   8.77  )
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

> Looks like it yes. I'm starting to wonder if we should maintain this
>  kind of TODO list in the kdoc. I know these types of lists have a
>  nasty tendancy of falling into disrepair, but this could help.

drivers/staging has such lists. You could follow that format.

	Andrew

