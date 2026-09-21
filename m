Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA98C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 22:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RxhnBak1xJH1AGk2N4hZ7YSgAZBIEX9Uhz0IHaeExdo=; b=r03lMkPwFNNcEG4tY/JArihjED
	3Arf+y8r7tvyu07esoZMqLLsAV6Fp8FKY8jsmQOXmHTGeUGDNaNKNPJCH2yTJCTXvfgVHGFHRC2/L
	9hPlCP7R8XRLHP+At5VAtCMBPP1Zs7/6aknaGF84iTXsLYysz8I7+DeBfWc1/EMtAxwSJKeXlQYSj
	50xLJKRwbrMx+hvqHGSI5flwoppfBOAhROqwg4YIoJn6G6Tk9/ZaCTP6h2ofsq4dULTLUmE8LZXK+
	GLa67aNKMo1fzh0BtKnOySOsEnRamyxsKQ0+9jhnG6xsimFHRQ98XIBwLvlmBMiUeiPTevNC5p/kY
	My7SMvjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8mOj-00000003YFO-2DVc;
	Mon, 21 Sep 2026 22:22:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8mOi-00000003YFD-1qOK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 22:22:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B96A843BA1;
	Mon, 21 Sep 2026 22:22:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0A1A1F000FF;
	Mon, 21 Sep 2026 22:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790029323;
	bh=RxhnBak1xJH1AGk2N4hZ7YSgAZBIEX9Uhz0IHaeExdo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=eoYGRW1W0ewpO2qK4BMXQphjf2JvipC8nP6hq0uQjXqaVE1dgkgdEAw4LEW03BCrL
	 Wnxkh49j0uxFEuzc4IZVFzNix4STPD4p2tMiPTM3J/PSwR1OXxjCuM7k0hxeTYzFjV
	 X7SEE3sxZAnuosGsCaK8r98QP0fgBijJnNfK5xhT6IfMG7sN8BtO0gbHQJ12sj9sZ9
	 ZbCbc9pe8+B3slQKQwukS7YTsZnrc1qA4OH2TrrkM42B8wxlf4ZB9I+a/+D+5VNVlf
	 gAVIksxVpY96z5orSsZLXEIBAv4UbdK3Np4WXdgjSPHHaW9vvxZaQ+hBpNPjcsOoIp
	 vuBT48B92+zlg==
Date: Mon, 21 Sep 2026 15:22:02 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Russell King
 <linux@armlinux.org.uk>, Heiner Kallweit <hkallweit1@gmail.com>, Alexis
 =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Minda Chen <minda.chen@starfivetech.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jan Petrous
 <jan.petrous@oss.nxp.com>, Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
 Jose.Abreu@synopsys.com, Nicolai Buchwitz <nb@tipi-net.de>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, PKneuper@dspace.de, David Laight
 <david.laight.linux@gmail.com>
Subject: Re: [PATCH net v4 0/7] net: stmmac: More selftest-related fixes
Message-ID: <20260921152202.64d4c67a@kernel.org>
In-Reply-To: <20260917215339.2022523-1-maxime.chevallier@bootlin.com>
References: <20260917215339.2022523-1-maxime.chevallier@bootlin.com>
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

On Thu, 17 Sep 2026 23:53:31 +0200 Maxime Chevallier wrote:
> This is V4 of stmmac selftest fixes, addressing Sashiko's issues over
> the MTU patch. This lead to the introduction of a new one. The
> dev_add_pack races have been addressed, however the double-vlan issue
> stayed there. Ovidiu is actively working on it, let's wait for his work
> to land before fixing that.
> 
> Nicolai, I took the liberty of keeping your review tags on affected
> patches, let me know if this isn't ok.
> 
> This is another round of stmmac selftest fixes, mostly about the selftests
> themselves but a few things were discovered w.r.t MTU and buffer size
> handling, see patch 5 anf 6.
> 
> After this is merged, I consider the selftests to be now reliable enough
> to run them nightly on every stmmac series that's sent, and I'll be requiring
> clean selftests for new glue drivers.

This got to the top of the stack for me, LMK if none of the AI feedback
is legit. You mentioned the VLAN one, not sure about the rest.
The EEE complaints look like nit picks but also some are easily
addressable? LMK..

