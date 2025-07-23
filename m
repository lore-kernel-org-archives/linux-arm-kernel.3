Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCF5C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 13:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJ4M37xiMdyL/hXlCZIOb76eImyHt1zuF/wBDDSz2o0=; b=SqzPQzN6SatBDK+ehgSmUtqdhl
	f7F74Z8XSXaDF62xRXwnD5o5FKpo8bid4m80hZgO5tZ8IYexlil69kBwbpVX5gP/mo4JcFJ11GEUa
	y7VjBL0WHFGMRic43/tMsZ/Y6wdu6IfruJiuxpNr47AfNj5fx75ogldfEa3qc+nIU6EaItLT3Fz9z
	s/X3buoaztzkzs4FOgJicG73Owes+aTBUtvM+bXkAFZ2VVr5N9Nw22fguF54PYTxi8Yofr4wdwL6m
	OHphfjVMjhf99+iwqRAoSr6E2lcmPrnzbwnBaGIfngyBlZjA+l/mWaq6GPaulEK+tRoKJ8qQeLpg/
	U6ENA5kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueZ6Q-00000004y3y-1TvX;
	Wed, 23 Jul 2025 13:01:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueYbT-00000004ufP-0Up4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 12:29:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 44DE0A52850;
	Wed, 23 Jul 2025 12:29:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38281C4CEF5;
	Wed, 23 Jul 2025 12:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753273785;
	bh=a4fvJoudeLBpuYC8iOBx3Lt7u9y0axaehN+8SLluXMA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BDKXNKuSudGsrwbCFls9lMNbGe3HBVy+R7d3MLycJRWLcWzEYfLnDvyNU4MU3RsPF
	 u+7zPxhRMfOwKd3kfj0WAxcE/L83lYJdVGnlC0Wjd8Xo36b4655zobf8MnN2FVrGRU
	 y+QPZkGGY4QhCmFw+kXE8EdlZiejwd9llsKKPYujKHcc2IF1v8+2TFMtjgLDvAXCIX
	 ydcw72rxfEv/KkLLbGN3Usc8tvgaCOikFKvx+2UZgHJ1MNlAg1QdLDqyDezPrJDsKy
	 hj/Lzvj7apcBLQiy3IxV9yvl+IQMHp0QwDyOWbuPYNPgDC8CVglq+jim+tneF415cw
	 oSWGV//JX1m+A==
From: Vinod Koul <vkoul@kernel.org>
To: linux@armlinux.org.uk, nicolas.ferre@microchip.com, 
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, 
 catalin.marinas@arm.com, will@kernel.org, olivia@selenic.com, 
 herbert@gondor.apana.org.au, davem@davemloft.net, andi.shyti@kernel.org, 
 lee@kernel.org, broonie@kernel.org, gregkh@linuxfoundation.org, 
 jirislaby@kernel.org, arnd@kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, 
 o.rempel@pengutronix.de, daniel.machon@microchip.com, 
 Robert Marko <robert.marko@sartura.hr>
Cc: luka.perkov@sartura.hr
In-Reply-To: <20250702183856.1727275-1-robert.marko@sartura.hr>
References: <20250702183856.1727275-1-robert.marko@sartura.hr>
Subject: Re: (subset) [PATCH v8 00/10] arm64: lan969x: Add support for
 Microchip LAN969x SoC
Message-Id: <175327377884.189941.15214972441246653208.b4-ty@kernel.org>
Date: Wed, 23 Jul 2025 17:59:38 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_052947_354981_7E36EE88 
X-CRM114-Status: UNSURE (   9.70  )
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


On Wed, 02 Jul 2025 20:35:58 +0200, Robert Marko wrote:
> This patch series adds basic support for Microchip LAN969x SoC.
> 
> It introduces the SoC ARCH symbol itself under the ARCH_MICROCHIP symbol
> which allows to avoid the need to change dependencies of the drivers that
> are shared for Microchip SoC-s in the future.
> 
> DTS and further driver will be added in follow-up series.
> 
> [...]

Applied, thanks!

[08/10] dma: xdmac: make it selectable for ARCH_MICROCHIP
        commit: e56982021f5303b2523ac247e3c79b063459d012

Best regards,
-- 
~Vinod



