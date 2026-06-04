Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FABCD6E6D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 16:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K2gTdGqeWQGOtaG+ilrpEBWckxkrsv+W6qkg6Sctvwc=; b=zf9CiQhQ4EQiWWRVQ35xXv3BM1
	TaabXp9Bdq7tGiInTfSLiajfOYHxPMfNlTk8Q3U+NBmG2QbKWZiPxidxhAOONEPk/LOXSoGmkdG4n
	FtRJgtAh3KMI3nKKj3no30UaTquRJ7veDsTJ9e9GlYuwypEiNiHwARii0eJRVFQPBbXxf7++efSEq
	oNs75tOPYZ4bUDpnw+LBxSMR0jyCwAu90TqEncD1YZgXTBf7KRy/e+dtuEjorPWc6tQxkSvlgACHr
	m1JUvg7c3mtEpBk6FCWAT7mVgNC1BrBMiBmnyvlbTMTs9GLR08+bzEDgKRLyRgsyBtDz4ZyUiei2g
	XLv1QQow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVAkb-0000000H3H1-27CU;
	Thu, 04 Jun 2026 16:16:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVAkZ-0000000H3Gu-2t3K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 16:16:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3EA7E408E2;
	Thu,  4 Jun 2026 16:16:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED9DB1F00893;
	Thu,  4 Jun 2026 16:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780589815;
	bh=K2gTdGqeWQGOtaG+ilrpEBWckxkrsv+W6qkg6Sctvwc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hvJF/1yG1XBu/K1o5Van8/R29t0hjvN6UK73WdFPAWIBQRbzgDf6IMMlRCY1/oRJJ
	 ymKdiIiVoGnG0Q5e0r5augl4QYSwcTAAN0USPUavLbLYXW7IMqkDrPvD1VkgPmNMZI
	 6zLNL3lnYeSgd+fzJBLYnZURLAC3YiZJ06p1BLu1F0ckRe6UdJ9JPcPRkP4KFCX8WA
	 FAgImivvlr4NFgte2uRi/9o+110jq8aPIVqUgXSKx3npwrqo6z+mNnKrLFuCzsVziG
	 CahWhFZUc8/T+K6dyonjTQXjiREXe8yUy9tBQWKnD5F65R7IN6h8MNyb330PBh7Iza
	 giMd6Vyi9eDWQ==
From: Lee Jones <lee@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Bartosz Golaszewski <brgl@kernel.org>, Lee Jones <lee@kernel.org>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: patrickw3@meta.com, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 BMC-SW@aspeedtech.com, openbmc@lists.ozlabs.org, 
 Andrew Jeffery <andrew@aj.id.au>, linux-clk@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260521-pinctrl-single-bit-v5-1-308be2c160fc@aspeedtech.com>
References: <20260521-pinctrl-single-bit-v5-1-308be2c160fc@aspeedtech.com>
Subject: Re: (subset) [PATCH v5 1/3] dt-bindings: mfd: aspeed,ast2x00-scu:
 Support AST2700 SoC1 pinctrl
Message-Id: <178058981070.94985.5862783114211800915.b4-ty@b4>
Date: Thu, 04 Jun 2026 17:16:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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

On Thu, 21 May 2026 17:17:44 +0800, Billy Tsai wrote:
> The AST2700 SoC integrates two interconnected SoC instances, each
> managed by its own System Control Unit (SCU).
> 
> Allow the AST2700 SoC1 pin controller to be described as a child
> node of the SCU by extending the compatible strings accepted by
> the SCU binding.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: mfd: aspeed,ast2x00-scu: Support AST2700 SoC1 pinctrl
      commit: e78aa289e86e3e5da6fd115e6a0faf1623bacb05

--
Lee Jones [李琼斯]


