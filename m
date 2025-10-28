Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FC6CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 22:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I/ZZy45LaWl74Y6BY6lZZWWarHxQqFY8+u/3TE6bopY=; b=RdmajRIpM+gxMJHCVTydZnyjkW
	6BH9f0HMPWkI6XLY2PImgjkXB++rBErCokYSC9MkqYCdCN90L1+VuIl1y2d93000n0xRIoVCaEDzt
	dwva3GvyqFQRJModlZuDvCxL0CRvFuyr0dcWEWmyUBTUprRGfglqCiGNah/2LGBqvhdjupQZno7tN
	Zd2kvLHKNLBJJWlKLqiq4NBMKGFbHa5tLEx1OwMpu3+jk5uNuO/IAI9UxvlTDH2k+Z9oH6lHagyC2
	iumj4jnxInUOAc9wuoNh3DE1GoeT9N7/Vv+abg8oIlp6WvpjqErXsVTmQK+BTUaUrIqejVNC24uMk
	MqlA1shA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDs2M-0000000Gjl5-01Eh;
	Tue, 28 Oct 2025 22:19:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDs2K-0000000Gjkv-2g4J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 22:19:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C2FAC6026D;
	Tue, 28 Oct 2025 22:19:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C785C4CEE7;
	Tue, 28 Oct 2025 22:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761689967;
	bh=yzrt0FYCMLcKcOf8fkJpIi0sW/mpdZ4QYj6NRuWqX6Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ETgH2vqRVFELtRx6mfXR2jj78Pj7OJ1UhP25bGPbjy2Z3qr2B3AWDbQb6Ee91di0G
	 0EiK455ipRcrCx/Eum8WD9d85EQ388CwVjcM3c6v2RglaQasBguyLUSeFKC4sqyJHl
	 dlMoHSz+6nskNWpFaPgK6O36SLGauKkvnuPk2Lvfi4n/ybY+k2tZS7XQ92I9hqBa80
	 fjeYtAQUUV7WqOjnMoUPlUFIyssJiJ+6JoXbUinYWIQOz7fN5g0/RSSPTi3H9cky4u
	 SdKAgRuxqEQSO681n+jsQIgC6QjY/QAbb8GVUaCxobtFeFivoryWYLc3Hzp4WX+MYZ
	 la612AfZ5BfZQ==
Date: Tue, 28 Oct 2025 15:19:25 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Richard
 Cochran <richardcochran@gmail.com>, Russell King <linux@armlinux.org.uk>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Vadim Fedorenko
 <vadim.fedorenko@linux.dev>, Alexis =?UTF-8?B?TG90aG9yw6k=?=
 <alexis.lothore@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: Add a devlink attribute to
 control timestamping mode
Message-ID: <20251028151925.12784dca@kernel.org>
In-Reply-To: <20251024070720.71174-3-maxime.chevallier@bootlin.com>
References: <20251024070720.71174-1-maxime.chevallier@bootlin.com>
	<20251024070720.71174-3-maxime.chevallier@bootlin.com>
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

Sorry didn't get to review this in time.

On Fri, 24 Oct 2025 09:07:18 +0200 Maxime Chevallier wrote:
> +   * - ``ts_coarse``

This is not a great name IMHO. Is "coarse" from the PRM?
It's the increment that's coarse, right? Not the timestamp
This naming confuses me greatly.

> +     - Boolean
> +     - runtime
> +     - Enable the Coarse timestamping mode. In Coarse mode, the ptp clock is
> +       expected to be updated through an external PPS input, but the subsecond

I guess the definition of "PPS input" got diluted but technically it
means Pulse Per Second, right? Here IIUC we need an actual 50MHz clock
fed in?

> +       increment used for timestamping is set to 1/ptp_clock_rate. In Fine mode
> +       (i.e. Coarse mode == false), the ptp clock frequency is adjusted more
> +       frequently, but the subsecond increment is set to 2/ptp_clock_rate.
> +       Coarse mode is suitable for PTP Grand Master operation. If unsure, leave
> +       the parameter to False.

My understanding based on your previous explanation is that basically
in one of the modes the frequency cannot be adjusted. It's only usable
if a very stable reference clock is fed into the device (or otherwise
we "trust" the clock that's fed in). So that's why Grand Master.

In the other mode we can tweak the frequency more accurately.
But it comes at a cost of the HW time incrementing 2x larger step.

If that's the case I think we should update the documentation and
rename the knob to indicate that it's the frequency adjustment that's
coarse.

