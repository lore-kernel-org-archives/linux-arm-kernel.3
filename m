Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC8EC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 00:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xS/901HelupphCtabHLAVeFJMXbBv7LKYzmobKqPT3I=; b=kDVwdylyEu50HChlOL1bfoxD77
	ttmU7NNGfx0N2f3EVlqjcKM8NFE023gKJYuCfupSU+ycKc5hTonBaqvz6XbNmyORO36AgxY3zVlJq
	OorThZPVV53R4xzNN7fbxqkUrEyb6NiA+7kQPMYdXE8e80qIzBGm7/Zbg1pegUAadLp4Op0mShIGL
	HXWNYYUDrP2PaVz3Bn3oESGZkLwyRR8sFZyIqrGfOxJXSlZAX2YqWDUqMWxvz/L0kAw1PsHjiKrGD
	j8eDZqHoFR+W284mgwg6q69Q3r4e0jJTCHoj60hC3WJlUM8c7WAhIslqyrNJBj85IGj2LLTlidtX9
	o/CSyrgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4UQi-000000042ev-3p3K;
	Tue, 15 Apr 2025 00:45:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4UOu-000000042Uh-3xe1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 00:43:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D7C8961127;
	Tue, 15 Apr 2025 00:43:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51250C4CEE2;
	Tue, 15 Apr 2025 00:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744677823;
	bh=4ae4V/iCsu7Dm/UVFu21GxYfPTorOCXdVBpV9LrqHHk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Yt3PGILq/RNZhYPUlG+8q/pUOPhjI1fV/t/Xmev9/0Pk6iLyytypHcMQmAXS9RkfT
	 pqD29Icaa4wo3UDg8Rw3Sl6W9s3tJCv9U51Vv9oLXSm9jfsROpODvS8ywTxbTUswB5
	 YrvHrqXg2Rb9ToqcEz5XJ/XwNxTPNBKItGNzAVgDObSVSFKlf0/aAWBatzGrRSbvGY
	 Ip9WcR3s72Y0xF4h/xUaVZ4d8Z8QQYphlNqRxPU5bkStf3MUp6ChYJ/vesgIWXuWVb
	 /yCW+eerjUeHPHINLfAdHAoCn0zjQLKt0k/JNjR4iUJpDgWXlEOrcw3XQyMUGJHamJ
	 bwBb60QHiHlhg==
Date: Mon, 14 Apr 2025 17:43:42 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>
Subject: Re: [PATCH net-next 1/3] net: stmmac: call phylink_start() and
 phylink_stop() in XDP functions
Message-ID: <20250414174342.67fe4b1d@kernel.org>
In-Reply-To: <E1u3XG6-000EJg-V8@rmk-PC.armlinux.org.uk>
References: <Z/ozvMMoWGH9o6on@shell.armlinux.org.uk>
	<E1u3XG6-000EJg-V8@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sat, 12 Apr 2025 10:34:42 +0100 Russell King (Oracle) wrote:
> Phylink does not permit drivers to mess with the netif carrier, as
> this will de-synchronise phylink with the MAC driver. Moreover,
> setting and clearing the TE and RE bits via stmmac_mac_set() in this
> path is also wrong as the link may not be up.
> 
> Replace the netif_carrier_on(), netif_carrier_off() and
> stmmac_mac_set() calls with the appropriate phylink_start() and
> phylink_stop() calls, thereby allowing phylink to manage the netif
> carrier and TE/RE bits through the .mac_link_up() and .mac_link_down()
> methods.
> 
> Note that RE should only be set after the DMA is ready to avoid the
> receive FIFO between the MAC and DMA blocks overflowing, so
> phylink_start() needs to be placed after DMA has been started.

IIUC this will case a link loss when XDP is installed, if not disregard
the reset of the email.

Any idea why it's necessary to mess with the link for XDP changes?
Is there no way to discard all the traffic and let the queues go
idle without dropping the link?

I think we should mention in the commit message that the side effect is
link loss on XDP on / off. I don't know of any other driver which would
need this, stmmac is a real gift..

