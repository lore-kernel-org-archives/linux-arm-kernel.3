Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB524FF510C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 16:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gINgrjUCXI8vmWxUebN1bYq2mnML8TTMprzUknzcKTo=; b=zWlgvAPCvSzRh8EajVVNFaF5TQ
	aGRtzkYEX9VnprMu59CYsYjaQYSPQDab5ql6MiXLcfa1Ml7uYznDI4WJShjCXglJRJilwpbG+3mU0
	6IEVygBKzW0maUoL4hNUO7apuX3C/+eNFT9HTMchVKSWuc3c0XEzojlO+8iqE6isDzkU/VyQCmlZr
	LyctzwrkxSt5r4nQDvBuPPPOY20afGKHlyeJAKS6kKPTo/KewZBPRhatz1DTTe/xYgGmQAYwx9Ly3
	L3UA27yOwo0IXucpe5SXSDsXNVI0Jyal7C0Peb6eaOrQppamz5JyI/s2kUS5cwwxI4v1Sukyj7PFU
	Yvx6VTfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8xy-00000006lNL-3IId;
	Tue, 07 Apr 2026 16:07:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8xw-00000006lMP-3iQa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 16:07:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F2C543D11;
	Tue,  7 Apr 2026 16:07:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D78F0C116C6;
	Tue,  7 Apr 2026 16:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775578068;
	bh=a8f50lh5fA9hxzVyPE4idNgBqFtpQ3j17xPrmyDtRAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uIAC5Y/LBhLO9INatQI6tmlUtW5UHotCnMhrz2f6dSE1am4z1kzi5V7ideheHP3MO
	 z2MYeMxfqcRI/fnvc4sC7BMxyHnUymQOpY44/CLIbSpqdYrduI4EMuBV6++ugdU9OD
	 oqeM5oEC1JnyUXszbv+WIxUUHt1oNpMFVhKQJdfS1IC+dDDmRudnTIX4cSNT2NWmnS
	 fT8t5TApXAuIs+7IOqn7zAcK8ZLSBawLkg6xk3IJdWU8fwBMmmumEVT3vofmawZ/kl
	 qkptwfxGa2006RXFhO3ZtJ/e2CLA5rgIDY8+8f4XpoO4++x0KBjdGk9L5nKNlktkFO
	 q4TG+e6v1x8xg==
Date: Tue, 7 Apr 2026 11:07:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Neal Gompa <neal@gompa.dev>, linux-i2c@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	devicetree@vger.kernel.org,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Sven Peter <sven@kernel.org>, asahi@lists.linux.dev,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH 4/9] dt-bindings: watchdog: apple,wdt: Add t8122
 compatible
Message-ID: <177557806556.2661973.776224786066669604.robh@kernel.org>
References: <20260320-apple-m3-initial-devicetrees-v1-0-5842e1e393a8@jannau.net>
 <20260320-apple-m3-initial-devicetrees-v1-4-5842e1e393a8@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-apple-m3-initial-devicetrees-v1-4-5842e1e393a8@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_090748_955572_A08F8800 
X-CRM114-Status: GOOD (  10.85  )
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


On Fri, 20 Mar 2026 13:23:22 +0100, Janne Grunau wrote:
> The watchdog on the Apple silicon t8122 (M3) SoC is compatible with the
> existing driver. Add "apple,t8122-wdt" as SoC specific compatible under
> "apple,t8103-wdt" used by the driver.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  Documentation/devicetree/bindings/watchdog/apple,wdt.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


