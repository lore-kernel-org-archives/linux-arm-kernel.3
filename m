Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADFCFF5104
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 16:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c45xP7QCQsdU6STbt2ndUgKT+Xbt8w0F2DpSmHyz1jc=; b=t9ua76N+gxoBaNEYu0WLBtERYo
	thTgJfL4B0eVYUiXJOHTwipT3EmOzTYyr2Zmco7Z5URr7rMZ0eI89oARmRrTFR6ZSvKHRYAx6tEh/
	b4IM2MJe8gCcwEfFxhE7D9z0v6hdFmLomyus9uq3hCtavcrnIhiLA/UFDZMRXzXsQS3m/A6QFWAtk
	CUlKmm+iVElN3pfbsg5i6p8FprCnLaPTEB/7kYbkNjxHOsswd6tNDRPHpyYnPdHPFe7bcJbY5QdQq
	lmN50VFrdeZMVQ18AVMm+sHRp5auJ4E1u++N0cSXSbhQE7b/YHkME2q0fclXlUp/WMTHtMzQ1CHXy
	qdRF5kjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8yV-00000006lau-1dS1;
	Tue, 07 Apr 2026 16:08:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8yT-00000006laM-3tNo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 16:08:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 60F56600CB;
	Tue,  7 Apr 2026 16:08:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9560C116C6;
	Tue,  7 Apr 2026 16:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775578101;
	bh=PXBAi1nyZNe0POH0mrVfGKnl6R46G/pAs4DRJvmzDcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DJuEw+gYV/IV/rNgCegLEhZWu9yKusTM1hwRgmswBM4lx9MkmxBLHBtA10oBsRSE9
	 jwYiq291dPLBtIpwErtS8e+LJxOCvgtDGNsHujnAy4FwG6ILF1dVcki0gNwOpqNk/I
	 QicjuFPEPsD5nUg1izW//M3psyDyF+idf2LeH1h+dCuW3fvQlMZpxe0tzCO0qKbzMt
	 FeJvIsRc9ivR1FsAI7oSYvXKktKANgo3M1VBOkcfklSgfn90aNMqYN90Jm6A12s+JB
	 Ee159BX70fNy3p5ufpCDLLt/GEIF5oyxprLbAYvaJLI6qinSNgvI6eh3p2tGpUg3el
	 bBf4I1kCpYwcQ==
Date: Tue, 7 Apr 2026 11:08:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Sven Peter <sven@kernel.org>, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	devicetree@vger.kernel.org, Neal Gompa <neal@gompa.dev>,
	asahi@lists.linux.dev, Mark Kettenis <kettenis@openbsd.org>,
	linux-pwm@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH 6/9] dt-bindings: i2c: apple,i2c: Add t8122 compatible
Message-ID: <177557809827.2662834.14463962257840305430.robh@kernel.org>
References: <20260320-apple-m3-initial-devicetrees-v1-0-5842e1e393a8@jannau.net>
 <20260320-apple-m3-initial-devicetrees-v1-6-5842e1e393a8@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-apple-m3-initial-devicetrees-v1-6-5842e1e393a8@jannau.net>
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


On Fri, 20 Mar 2026 13:23:24 +0100, Janne Grunau wrote:
> The i2c block on the Apple silicon t8122 (M3) SoC is compatible with the
> existing driver. Add "apple,t8122-i2c" as SoC specific compatible under
> "apple,t8103-i2c" used by the deriver.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  Documentation/devicetree/bindings/i2c/apple,i2c.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


