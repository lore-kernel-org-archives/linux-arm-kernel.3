Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEEBC83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 09:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k5NQhJgWl8rKLUrK+rYkf3bttZheM31PZhqJ5EtdPyE=; b=gbAzV972VqNX0dL2ME4zSTN867
	o4hl7pefJ5sT+GfgaTSiJ4pd9LVY5/cZQxwhfSD9U6WrP41iRwYMzZkff/rmmhEpb0CfzbEnIYgN5
	G4V8z35AjgRgZj6093eXQ476EnIwDyT44nobjBV2fXON6y9pVzwTh8JD9Kj2HeQQdkTq5qqLGv0Ys
	EvuU2Pe2XK+UpShNc38EnxWgjRDNqLedx0SiXiaaVEqxAvuJ3FYiy4saSeXwK8OwZWACxlzHGTLBy
	83wNhhdrws5Wo/T8bgdvHp8/kLPb6UtH7D+PBQUDjjSM2hot7+4z5yYm9wO+FH7txbcgbvnC4DpqJ
	9kub4bEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ4B8-00000004pIi-2iY8;
	Tue, 08 Jul 2025 08:59:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3pn-00000004loN-2Xxi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 08:37:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B56E40C1E;
	Tue,  8 Jul 2025 08:37:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF175C4CEED;
	Tue,  8 Jul 2025 08:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751963870;
	bh=paqPxHEdzhlttb29VSY2z8qUYi4dbUOpAoAFZ9cfki8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nPCyrBfbyFocXcBr2vfBUH8EPiTc/v9Uw0Kj171Ef8kfs0hITcljpMhh569e2qyqe
	 QN6ERv57n0PHWoY3kIi+WCa+GLZ8jqhKXMcb7hcHYamam6f+gOFyT/Lwyr9P5RIPXk
	 ZM3QT2vMxKv6dx4myo0VfUm3ZCNN5nl4IWoijqHWPKb+JAiTsCbaY+gTxJbJCJETGj
	 SO6K+G8D/DXuvdYQJrdX29xumEnMuUeRB+qlDU8Xd1SCRqWzr5Ge/NMpzAALw4Bniu
	 cYC6IDKzynBFlAgdlVTN8LI4f9oCymvmQpArbCEYoVAZd68dxAsX140UQBJeusE+EY
	 T0oe6AZCQsyqQ==
Date: Tue, 8 Jul 2025 10:37:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stuart Burtner <sburtner@d3embedded.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Spencer Hill <shill@d3engineering.com>, Sebastian LaVine <slavine@d3engineering.com>
Subject: Re: [PATCH 0/2] media: i2c: Add driver for Sony IMX728
Message-ID: <20250708-evasive-elephant-of-justice-ce6f5b@krzk-bin>
References: <20250625-imx728-on-6-12-v4-v1-0-cfc6e18c3e23@d3embedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250625-imx728-on-6-12-v4-v1-0-cfc6e18c3e23@d3embedded.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_013751_716540_D840AFCE 
X-CRM114-Status: GOOD (  14.01  )
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

On Wed, Jun 25, 2025 at 02:20:02PM -0400, Stuart Burtner wrote:
> Hello! My name is Stuart Burtner.  I will be continuing the work done by Sebastian & Spencer
> on this driver. I will finish this patch series and maintain this driver moving forward.
> 
> This series adds a V4L2 sensor driver for the Sony IMX728, and related
> devicetree overlays.
> 
> v3 [0] -> v4:

So that's v4, but yout patchset subject says v1.

Please version your patches correctly, e.g. use b4 or
git format-patch -vX

> - Drop set_fps() function because it doesn't actually change FPS
> - Use "guard" instead of mutex_lock()
> - Fix error checking on imx728->reset_gpio
> - Fix attribution of Spencer Hill as Co-Author
> - Fix maintainer entry for Stuart
> - Clean up documentation for gpios, per notes from Krzysztof Kozlowski

Cleanup? I asked for changes in the ABI What exactly happened?

> - Removed defconfig modifications
> 
> [0]: https://lore.kernel.org/all/20250212195656.69528-1-slavine@d3embedded.com/

That's also v1.

Confusing.

Best regards,
Krzysztof


