Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14905C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 23:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5gMr5+DTslOZVCDZsu46UT/fRe5DJWudyq04bxbQQ94=; b=uES7nI1yuo/DXtxVUUaHjr8H/A
	ctp08NtqGYpnJ7CfIO+V7/r/Ff5V91/UpCNlKdNkJ+bksebhTH1GXRstOJYNzMvGHnmM2pOOC7dj7
	4PUXlwM6+K40fVVq30P0Xf+3dCFjbZIpqixjmlrcKhVkFRME1gxzOKP9asSIQo6aEOUABp2vv9vd/
	AeW14WnZTYDEMKDOnocGzGHzx/GigMuXVkHYnmkq9u8Evx2S+AW2m8qHJtTnrZm2Ufc1lPgsxcs9i
	9dzIHNQgSq/L/yBeJW1VgorMvCv+4VQWUkPFjPfnqr7eWGrxsjHswSKq7We1lFyrROaJHBfFLmeHE
	YTCfYLAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUwV0-0000000D896-1Ruk;
	Thu, 26 Jun 2025 23:59:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUurP-0000000CujS-0PbA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 22:14:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 927765C66FE;
	Thu, 26 Jun 2025 22:14:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DABFEC4CEEB;
	Thu, 26 Jun 2025 22:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750976060;
	bh=NdFw2ADpTfpWgA0EQty53QwutKobBhj7JUQ3fk3v3jc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tLYfMXdCW6YGCUJHyniUaCmkNb0lqs7cdAY65UBz4bkI5WMCtUqTCK4qqcdTnXtyw
	 kpsW0gE81tmoVoxhxuCCDDE2oUQL6IFSUUFJM1nZI+QeEQrmkkGzoSeCvinzRrme7l
	 4dT/KhxsSUkbqz7GWorCOGv3hSjPplJDbNF1V4cE09akN8IlG3jMaKE+ijUDziSRVa
	 iJmGaEz4jZ7/wmgH/w263OrbDqTuSGQz5+p7BaP9dTvSm2C+HtfMM6ykN7wxoVOAIU
	 99e9KHEAvHV9baLK1Ea39f0tuZ9oeChnjjFJXnVF+OqXBzQV6EBCxmwMpWIQm6xZCQ
	 CIIlddlDGQ/EA==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Cc: Mark Brown <broonie@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250610082256.400492-1-csokas.bence@prolan.hu>
References: <20250610082256.400492-1-csokas.bence@prolan.hu>
Subject: Re: (subset) [PATCH v7 0/2] Add `devm_dma_request_chan()` to
 simplify probe path in atmel-quadspi.c
Message-Id: <175097605979.58944.6982488308454095610.b4-ty@kernel.org>
Date: Thu, 26 Jun 2025 15:14:19 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_151423_177738_80C2D6CC 
X-CRM114-Status: UNSURE (   7.79  )
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


On Tue, 10 Jun 2025 10:22:52 +0200, Bence Csókás wrote:
> The probe function of the atmel-quadspi driver got quite convoluted,
> especially since the addition of SAMA7G5 support, that was forward-ported
> from an older vendor kernel. To alleivate this - and similar problems in
> the future - an effort was made to migrate as many functions as possible,
> to their devm_ managed counterparts. Patch 1/2 adds the new
> `devm_dma_request_chan()` function. Patch 2/2 then uses this APIs to
> simplify the probe() function.
> 
> [...]

Applied, thanks!

[1/2] dma: Add devm_dma_request_chan()
      commit: 56137a53f8ebb400f4098ca26ef18934e9a4de45

Best regards,
-- 
~Vinod



