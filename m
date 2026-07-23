Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F137C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 00:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MTE3ekRM/dUuD7swK2qnfDz3MgDaOVtmfU7rqUsKiP4=; b=2ayY99Ujch1JcCedVZhMMj6ywD
	x01dcZzwh6NAb5FL/nrCOYQpUA+mkNuxgzK9lJosHzm9i2AFpt2/KOtHrC4Ies2H7ZXvQyyZdnYnd
	xcKIBs3vYVVzU0C/BK/reM9FHHBdK1XZRLsPjHvnD33DY8U8AbEK0ekduiTjqRwMM6vQLhT6GYlsX
	iJXcKoRYSjX2R1aG1VhOaeHHIbHb9VXyGY/NhVev7yXfNgOccjH3TFZzvwxBgfrQJuLwR+hKctKVn
	e33WZR+Ax1KCiCC4KxgzzvtfHo4oc8xW92GVF6eGDNlgERB4Uyqd1wzKGYRodxoQI2YMa6eUlXBiq
	qMPrwKOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn4FU-0000000FJVO-1zLx;
	Fri, 24 Jul 2026 00:58:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn4FP-0000000FJUa-0ePt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 00:58:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 971A760A5E;
	Fri, 24 Jul 2026 00:58:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DACC1F000E9;
	Fri, 24 Jul 2026 00:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784854722;
	bh=MTE3ekRM/dUuD7swK2qnfDz3MgDaOVtmfU7rqUsKiP4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MiRHR6MywchzHg5bAjcpNQsAP3QwCZ9F6go+5x2rrZmZBlEQSP3glnevKs3MZrq5Z
	 0oWnwY3FqG/cc+HMdd3C0UlxVSYrRQRcj8uuFRsCIqplOKDZk6KHIdR90SJu2wxIsO
	 maFC8w7owyJCu2TyrtgzbsXERxXrp5Zv+iFstjsxujzbjhbQF/o0a2xejuLxcQcSgl
	 TxElx9XPZvETJVDkbO8whoOMtmwJ4MNp+VPJVwNrjjVfltgo8+j0eqq1AhnxxeeKYa
	 sWG6TOxf7oLbkIqoO3jCYx/cglEGNrFQnF75MPwYvnKs9q/1FUMJSKxQQUQ+giFdVN
	 lp2aPj34bWYWg==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Haibo Chen <haibo.chen@nxp.com>, 
 han.xu@oss.nxp.com
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-spi@vger.kernel.org, Han Xu <han.xu@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260722-xspi_dma_upstream-v3-0-6b7ff50cae8e@nxp.com>
References: <20260722-xspi_dma_upstream-v3-0-6b7ff50cae8e@nxp.com>
Subject: Re: (subset) [PATCH v3 0/3] Add DMA support for i.MX94 and improve
 AHB read performance
Message-Id: <178481660524.53486.16709271966474677924.b4-ty@b4>
Date: Thu, 23 Jul 2026 15:23:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1547; i=broonie@kernel.org;
 h=from:subject:message-id; bh=paT0EgDOjc3vEpgjmtYJsq9rFphaCgtgbuM51+hgsUY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqYri+L5XkQxLBYrzQPKVS4j973YIp6flIsz7cu
 cgR3QQNbPmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamK4vgAKCRAk1otyXVSH
 0JXwB/9y9jkv9rM1aQpigs8h/xGon6ocqEPIndgStSKUfsm4LIyO9J7p58WgCdMBzxVSI92Tk8P
 c4XxY8edb5msw7tUI4kF4PN4HwQLuU4KaBHnedu4q0MNr2d0XeV550syZw7AUiJE6RS5YmTwlry
 TxqToN0IH3lpt7EpuScWdtrnJFx4mQWyWH0ODuYR3bWJ4W2+R3GMn9kmKZZq8ufjZbSdh7ZwdX5
 hEBBbkIYHNTavPNloeft0g2ZupEdq4KCET/Dx1E5Hqndi3ssen66KGr6zGpsVnK6tAIWZmsFh1G
 I76lI6lSD7gCTdCMy0mXRCngcLXT/YIVd8fC0u2ulIpQfBS9
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Wed, 22 Jul 2026 17:00:41 -0500, han.xu@oss.nxp.com wrote:
> Add DMA support for i.MX94 and improve AHB read performance
> 
> This series adds DMA support to the NXP XSPI controller on i.MX94
> and enables the use of DMA for AHB read operations to improve
> performance.
> 
> On i.MX943 EVK, the measured read throughput improves 4x higher, from
> approximately 70 MB/s to 290 MB/s when DMA is used.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.3

Thanks!

[1/3] spi: dt-bindings: nxp,imx94-xspi: add DMA properties
      https://git.kernel.org/broonie/spi/c/6f99efb11526
[2/3] spi: nxp-xspi: Improve AHB read performance with DMA
      https://git.kernel.org/broonie/spi/c/38d11bb2cd1d

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


