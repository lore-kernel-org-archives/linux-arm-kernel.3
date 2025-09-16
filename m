Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76BBCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 21:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OpA/J3AX6HzUonPe1gSFGJ6Et4Tr2SflzcF2UHTSHC0=; b=4eXPXW6jL5wWkN/CpNvYs06nsl
	popR5sffc0Xs8z0tRd7tadvkEe9QnM+UE9LAARskEAFgSS+yEXpN3udHm09YATaKEB5sTsudJE8I3
	lMISd3zI2/mhDXe2XXACR5f9P1AatCFe3/65mVZJbVNvkokVli2TY7dS9ZntCHpmY6oE6tpH6PRF5
	1IrBKVi+2b4loYAPqWZRa+bmAMHdbmEoF8eoeG7tY8VBH/V7ZxdBCBQnux/+XuVo26s2MhMy3E1rF
	ek5J8Ti3P8YCUcjbNvO82w7KozI+SYO5A3b68bVZ//CVkLOHoP1FpTGUnfNw04WOKyTyFmQ3lAvv8
	2IaZHHug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uydR4-00000009F7c-28Y9;
	Tue, 16 Sep 2025 21:42:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uydR3-00000009F7E-0hGZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 21:42:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 52B09601B3;
	Tue, 16 Sep 2025 21:42:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60407C4CEEB;
	Tue, 16 Sep 2025 21:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758058920;
	bh=tRIfdhsAJMME1a45JIICOi38lqR6oYNtURxnDEmjumg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RiKilsRb4kpDl0//LUuc+uz2OTTgEllKymx7sarK7K5V2gLsr1ROtovFW0kOsUepf
	 CVUdEQwwFLuSUlqYhn6YaIEwVcdS85CEUrDgYJ/g/48X7rp29GP9CNn6aMIQ33PIx6
	 qMTtsWRCJkxlISgeK+B5r9gsmYQwYK6nqqaFNCyItywRMPpokt8mtHhDOYHRiXCGLD
	 KWtBypRC0GLgKb/k4OKDQX3TcZQszrX6kdAAB5qWE85+zq27Y2ISZzvlf2onQxOUXP
	 eVaTIJcnLNpTPwq+FD10s0x7LBVntsCuIxjWMtNZ14xDhjF+mKr+hGMh5HIGCYjgHd
	 JlE06EhPv51FA==
From: Mark Brown <broonie@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Jonas Rebmann <jre@pengutronix.de>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>, 
 David Jander <david@protonic.nl>, Oleksij Rempel <o.rempel@pengutronix.de>
In-Reply-To: <20250910-imx8mp-prt8ml-v1-0-fd04aed15670@pengutronix.de>
References: <20250910-imx8mp-prt8ml-v1-0-fd04aed15670@pengutronix.de>
Subject: Re: (subset) [PATCH 0/4] Mainline Protonic PRT8ML board
Message-Id: <175805891512.247117.14108545633571750279.b4-ty@kernel.org>
Date: Tue, 16 Sep 2025 22:41:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183
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

On Wed, 10 Sep 2025 14:35:20 +0200, Jonas Rebmann wrote:
> This series adds the Protonic PRT8ML device tree as well as some minor
> corrections to the devicetree bindings used.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/4] ASoC: dt-bindings: asahi-kasei,ak4458: Reference common DAI properties
      commit: 8d7de4a014f589c1776959f7fdadbf7b12045aac

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


