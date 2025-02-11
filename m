Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C147C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 21:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4qLtdoZdXJfijz3zHPx5hluXf6Zqob6TaL6IaJB7r1g=; b=iwywbgyzZRxa1tL+41ithbjGfb
	pOXPviAkNiSdZtahBYOoVp8pnDcsE9S4GOTZg27SwpYk6mhCAKH3qxtV5zxEW40kvSxg9Osaw4gsX
	6fBKgRqfyi/uwS3rlG2oHiv8U7t4F0M1WOQUOG6qMmDGXSkODuoplAcsQzFan+rRLWcnwm2P2pSyH
	eH+x3CcKktdKG27rRPDUK+TI6JJ/2NKn3x2BnPAvHoavI0DVdaUZL87Trjryt5eqAmjC/XpLAw7PK
	39SffA3YGejyIp+GwjejMzWn+xJc4XWAGQtyhTW2K0ILDmYch6S5YH6ZLMd7lhL2oEI3LIsXm8aXp
	0IYZb8vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thxRQ-00000005Hbe-1WPI;
	Tue, 11 Feb 2025 21:05:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thxPF-00000005H90-2SGw;
	Tue, 11 Feb 2025 21:02:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 40543A40D5B;
	Tue, 11 Feb 2025 21:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 260A5C4CEDD;
	Tue, 11 Feb 2025 21:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739307776;
	bh=mPDIGAOPfFORI7LS1qh2u5u7JxUaNOD3vSVK0HFG47E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DXFA0YVrKBjSTeI63HmZL4q9NOLOskpQ7vqBrMooWe36Cuqzu/Fe+33bDLUiC0BPb
	 qRXHUIYzAKySmdpEp5p3VRGbv8rVJxclJX/lJy3H62dMSLu/jlYLyTnXYPlmlFeH0K
	 A+c6wJAWZfp/vyBSdxOLe47iUdwd38VA6RYMiGUP3M07qJt6oRx0nTTPdTM5AnbJ+7
	 NjteYhk+aYmcokeq2hOdPfyjux6obELcimRdEmdMbtDclA/kIyiBMt5VnMh126I822
	 dgS/KwesBkGVd+nNWIGcBNLIzn10nzeiUk0i/vlx7Gs3f0GXYZuBuXtQ3ZkpAHnBYq
	 9KQOD3olOP/hA==
Date: Tue, 11 Feb 2025 15:02:55 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andras Szemzo <szemzo.andras@gmail.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel@sholland.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, linux-clk@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-sunxi@lists.linux.dev, Albert Ou <aou@eecs.berkeley.edu>,
	devicetree@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/10] dt-bindings: power: add V853 ppu bindings
Message-ID: <173930777478.1171902.17591605192329357737.robh@kernel.org>
References: <20250205125225.1152849-1-szemzo.andras@gmail.com>
 <20250205125225.1152849-6-szemzo.andras@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205125225.1152849-6-szemzo.andras@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_130257_691253_2228C11E 
X-CRM114-Status: UNSURE (   9.39  )
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


On Wed, 05 Feb 2025 13:52:20 +0100, Andras Szemzo wrote:
> Document V853 PPU compatible.
> 
> Signed-off-by: Andras Szemzo <szemzo.andras@gmail.com>
> ---
>  .../bindings/power/allwinner,sun20i-d1-ppu.yaml        |  1 +
>  include/dt-bindings/power/allwinner,sun8i-v853-ppu.h   | 10 ++++++++++
>  2 files changed, 11 insertions(+)
>  create mode 100644 include/dt-bindings/power/allwinner,sun8i-v853-ppu.h
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


