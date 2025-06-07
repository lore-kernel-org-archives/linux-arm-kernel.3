Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47BD2C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 16:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ufuEaxC2yIa4KHeeF8qk8yHUhgU23d28qajjcFUIbhc=; b=INjPi99PjYT6kW7iZ0DwOJfaIc
	+oxI2kB/gffQO6dZcKwKCnoAwpZJjz/hrvYcay2E9d/uceMcsgbw06O/ZeKPX84KsXLQPm88uJR/L
	MTBY+3+f1fp5kQbPblN+FIHTf4quIestSr+/xe0p8S14V/OkiYAnmjOf5TcrbYvkoT79M25plkUIz
	rrQ0GOskEq9P0iTmH3Zfl1U6KjKdwZ1eRIKhieGhjg96X/nRHrxVGlfLAOGI6Cax1V8Of2GdGtbgv
	DUzGGd56c+7pgK/EZNdjqv+ZdBl53d9iBRWZ0H4/erRFZbrRmc0PIAaIADeMBkXvVTAWbZbP2w5FN
	Bj2hj1EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNwKV-00000001rr3-3y4D;
	Sat, 07 Jun 2025 16:23:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNwIJ-00000001rXd-1UjS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 16:21:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9BEE25C5950;
	Sat,  7 Jun 2025 16:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD844C4CEE4;
	Sat,  7 Jun 2025 16:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749313275;
	bh=oiI/UBIp22xDHCckuTpupPI1ZnNEyqHPaX1KMdJp0rE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PZBiEfQqujGjVpyqz8adTEM705B7KVMUfSgJlzeViiwwh4N+aqa5a/Z44MmIE5W/c
	 wu1MduHg0/1b7KSea1myrHVzzyPHQ5ZSySxT0Qf7fDH8lfLwlKEpXpPrGtHEud1EPO
	 guAcoYvH5Fa/yuDMFv9ek+dAsNZdp/xrS6YSf2cdWM64frwnZ6DBmIINsbfaCLKVKt
	 qO33LH1aLdDgTMg/RzSXy+nOWBfZidZqCmunLrDXxD2Q5ldmLYD7Py7kpBWjRJ1ggg
	 2KXkk44C1BfY2FX0FFQRfUiDcpdyI9wL3kt7G7wiAGoRKnS+0wr+dI0SqwWpLHlp3e
	 6clzCiH8rFyug==
Date: Sat, 7 Jun 2025 17:21:10 +0100
From: Simon Horman <horms@kernel.org>
To: Bartlomiej Dziag <bartlomiejdziag@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Wojciech Drewek <wojciech.drewek@intel.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: stmmac: Change the busy-wait loops timing
Message-ID: <20250607162110.GB197663@horms.kernel.org>
References: <20250606102100.12576-1-bartlomiejdziag@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606102100.12576-1-bartlomiejdziag@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_092119_441958_C85DDD42 
X-CRM114-Status: GOOD (  12.86  )
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

On Fri, Jun 06, 2025 at 12:19:49PM +0200, Bartlomiej Dziag wrote:
> After writing a new value to the PTP_TAR or PTP_STSUR registers,
> the driver waits for the addend/adjust operations to complete.
> Sometimes, the first check operation fails, resulting in
> a 10 milliseconds busy-loop before performing the next check.
> Since updating the registers takes much less than 10 milliseconds,
> the kernel gets stuck unnecessarily. This may increase the CPU usage.
> Fix that with changing the busy-loop interval to 5 microseconds.
> The registers will be checked more often.

Hi Bartlomiej,

I am curious.

Does it always take much less than 10ms, or is that usually so.
If it is the former, then do we need to wait for in the order of
10000 x 5us = 50ms before giving up?

> 
> Signed-off-by: Bartlomiej Dziag <bartlomiejdziag@gmail.com>

...

