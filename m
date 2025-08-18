Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4654CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 19:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hy1ydd23Nn35o5rYJin/74Vz+k+dmzBV43TZon9livk=; b=bTmqYI/4Is00WMsWEJswYlKd5z
	h061Rn3Sxz6NaAG8XE1hwtrFGzW7yIxZvykAND4+NOyGF66YucuWP2Kgv+5p6yKfI/bwZsEWor+IA
	5ANCPAv146H6Kt9W6BOASS2tEuAfjG7oT/ITQTj0xb06VbZ7mZE13gGWPErwrbINXWAJCf8aP9u9J
	kX6o9x4eybmWfwW49RH++xnZychEfXXTXedrQ6C7GXOycQYmqgZSxyxA5kAT6GpyFoQmw6nmoE8Gn
	OfJXOEDqbdGdfspNJ/6g9lDPIKBarb3cs3lFSRrmW0bDESWIGzlGtHjAE2SydTutXAjyiGyDPkfqv
	Wm3j4Etw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo5Rv-00000008VMS-1FmZ;
	Mon, 18 Aug 2025 19:23:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo4wN-00000008Pnp-3B4c;
	Mon, 18 Aug 2025 18:50:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 12E71600AE;
	Mon, 18 Aug 2025 18:50:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26CF6C4CEEB;
	Mon, 18 Aug 2025 18:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755543042;
	bh=O7W48Fc++HUPE3zXQ8Whd5Cxn4EyCN0S+wvkwo8T5RE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=t3vXP1eM67XEvvowb0QFpyCezDN/pZI5ZonNHywmtRNwjqYiwwo4HOOkRTBUzUiqh
	 zRxRu+B7O0nMt/iXbOMtr8GdI5eyMt3HjI2JwE6p/b3P9y9BZt3r/gr4kg/jMRIUaE
	 z4EgCJcsh+WymXdCGnjgiZsg7tp8a98/L3Gpd3lAVsgtqieOk559Jnsf+xUPuE41Tr
	 bgNN8BZo8r4jw9s2r8eNna1mjOQzZFYMFpKts6aMsJsnXyTQzzVz9OBu7hrpr8XTxI
	 LGY7FyLcMhw75D1yy7mBAOtpn3Ek/s8IUQUF2GBqwITGDW0nKyJpU52Awn1N1ybQh8
	 dvaOQQaUpAUvw==
Date: Mon, 18 Aug 2025 11:50:41 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Stanimir Varbanov <svarbanov@suse.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrea della Porta <andrea.porta@suse.com>, Nicolas
 Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Phil Elwell <phil@raspberrypi.com>, Jonathan
 Bell <jonathan@raspberrypi.com>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 0/5] Add ethernet support for RPi5
Message-ID: <20250818115041.71041ad6@kernel.org>
In-Reply-To: <4c454b3c-f62c-4086-a665-282aa2f4a0e1@broadcom.com>
References: <20250815135911.1383385-1-svarbanov@suse.de>
	<4c454b3c-f62c-4086-a665-282aa2f4a0e1@broadcom.com>
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

On Mon, 18 Aug 2025 11:02:15 -0700 Florian Fainelli wrote:
> > Few patches to enable support of ethernet on RPi5.
> > 
> >   - first patch is setting upper 32bits of DMA RX ring buffer in case of
> >     RX queue corruption.
> >   - second patch is adding a new compatible in cdns,macb yaml document
> >   - third patch adds compatible and configuration for raspberrypi,rp1-gem
> >   - forth and fifth patches are adding and enabling ethernet DT node on
> >     RPi5.
> > 
> > Comments are welcome!  
> 
> netdev maintainers, do you mind if I take patches 2, 4 and 5 via the 
> Broadcom ARM SoC tree to avoid generating conflicts down the road? You 
> can take patches 1 and 3. Thanks

4, 5 make perfect sense, why patch 2? We usually take bindings.

