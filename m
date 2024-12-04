Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A06E7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 13:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DxJGDQiokXdnBDutg8BRJ6ed0FV85bCGCnc9t0BKeSk=; b=fpmGY5TcddqDRk4a7wcAcD1WXa
	GKIqJ7BN6ZyBck2nkam8gVdabg1p4MADift+piD3irIUZ8xSr00lxYUuE4xOSphhH4TwMzNOSG6Y8
	hN9cIUU4xEanEzh9DYcK0OUx7aXExXyV4rUUq5NYnXVvUceARXE1Y63SpADvUFBB46s+3SM6F1SFp
	iRpahKK4iHK2hcSW1h66BqMN2SNsUIojkbVdETItbBPN4qlficZNOjtFeivLshPqw5mP6z2QJ862V
	jKS+oiRjcJ2O3HeaEfOF/2UyjFtkKrbwStqpdPIVt+cI1roWcCWSEM1aNuEMD54x3TCPQqoJ8AQd+
	Joq7i/zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIpJB-0000000CfVa-3rvP;
	Wed, 04 Dec 2024 13:20:49 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIpHV-0000000Cf9n-2nVq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 13:19:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9A371A4133E;
	Wed,  4 Dec 2024 13:17:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61BEBC4CED1;
	Wed,  4 Dec 2024 13:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733318344;
	bh=NUA39rehtYvADj0ngQK4ICqhBTOri7NSzSD38ajApu0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JpIhi9Rk6VDqzd/TCwaIKHRQ9AhtoQ0+q8XLZSuQJodlDw1PDO4pTWd1aV2ZsCtG3
	 JfIGMg787zQKNQdyh/e/HnX2lv+6r/iN3pkBQMFWg+az2yrRDod+yEDDNQk8tM2Ev0
	 x+jCTOlWwzV569YVuQYJeq9keA4bHrpWWJyYeBVewaXXlXYrBT5oMglETZOdivhxmv
	 UWoZWSAXFGLkCZWzz+ug0IyxVQZsszp6xLb23fC+TV+2UBz4y53PcTjNRWZxQ4MbE4
	 01L+XzqHVsdnV5xxTRfhxN9q9+qRt6BdDow+JoTjgZXDreWwM5do1i6VFpoRuXWIWz
	 B9EyGWxrxtFbA==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?Cs=C3=B3k=C3=A1s=2C_Bence?= <csokas.bence@prolan.hu>
Cc: Mark Brown <broonie@kernel.org>, Mesih Kilinc <mesihkilinc@gmail.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Amit Singh Tomar <amitsinght@marvell.com>
In-Reply-To: <20241122161128.2619172-1-csokas.bence@prolan.hu>
References: <20241122161128.2619172-1-csokas.bence@prolan.hu>
Subject: Re: (subset) [PATCH v5 0/5] Add support for DMA of F1C100s
Message-Id: <173331833897.673424.223627111827356616.b4-ty@kernel.org>
Date: Wed, 04 Dec 2024 18:48:58 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_051905_769481_0EA4702F 
X-CRM114-Status: UNSURE (   8.75  )
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


On Fri, 22 Nov 2024 17:11:23 +0100, Csókás, Bence wrote:
> Support for Allwinner F1C100s/200s series audio was
> submitted in 2018 as an RFC series, but was not merged,
> despite having only minor errors. However, this is
> essential for having audio on these SoCs.
> This series was forward-ported/rebased to the best of
> my abilities, on top of Linus' tree as of now:
> commit 28eb75e178d3 ("Merge tag 'drm-next-2024-11-21' of https://gitlab.freedesktop.org/drm/kernel")
> 
> [...]

Applied, thanks!

[1/5] dma-engine: sun4i: Add a quirk to support different chips
      commit: eeca1b60138189ef1b9636709e578d0c9e0de517
[2/5] dma-engine: sun4i: Add has_reset option to quirk
      commit: 1f738d0c2f67ae3551e4543e8dddbfb44cdd9f53
[3/5] dt-bindings: dmaengine: Add Allwinner suniv F1C100s DMA
      commit: 1ad2ebf3be836e62792788f4cd105b30ca9178b6
[4/5] dma-engine: sun4i: Add support for Allwinner suniv F1C100s
      commit: 61785259d1eb4e4c4acef8551a2524441683dbf3

Best regards,
-- 
~Vinod



