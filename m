Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFF6CA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 15:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XiixTDlDdFLvDBK2BVDhKClEh5mA7ObgBz9wlRu3VFU=; b=ixl2a3JdGP9uacXoo1BeMjkgLt
	EjXDP+DTSgHxh4R9RLqFqB01MMzKgRso3fm2bwo1ZePCjIdHarK/AOm0MNc073vgLFCSO5EOPG2pQ
	4FVwUZ7Hj9fLzpUjY71XqiCk2PYA+mFnB85bQzk2wxqNnR6q0QJI5L0inyJapld+4lamcGc/OjZsn
	R00pzGkWwJY9Yo4QZcRVklttWJI382SlMR7+LJNzmDThyiCMNP5EqYARCLjIfro6jTiJ5xhI0EI12
	+oj2A39T0asctIveX4zMkF+nJrPCFfVQuich5Xt4vjnY9YozUCEtekJ4I8qZleXnBYRhMWv9qVu+D
	gPXTPZXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCIP2-00000009TmH-2yMm;
	Thu, 01 Oct 2026 15:08:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCIP0-00000009Tm8-3dfq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 15:08:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 76D8740239;
	Thu,  1 Oct 2026 15:08:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 076441F000FF;
	Thu,  1 Oct 2026 15:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790867334;
	bh=XiixTDlDdFLvDBK2BVDhKClEh5mA7ObgBz9wlRu3VFU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=B7zYW2Uak3WyFAzNtZs3b+uQak24bOqV2hiemB1zFt2VPTOapLYVijif/TMPpAiBn
	 G9JJwvN/vvG41IbehvGLGL71E25H3QzcBi/dxKT9suEw0Zg3hSdgBnzqFXLOSun84m
	 5mmWEZirPc01FTIqehVgsj6RICylWB2l+IIWgmHaXCOtHPSchcZ66qMtWGIBglm0LD
	 oB8RHhLW23aeNcMZNo9UgohubmUTfHUfvGAIUX3sucyN5+5hxC+lcwd0TpBYt5+iQI
	 aRCKkWYbiNEfqKLt8rNZTdcA6TLcs7MELluYrsPXF5iaIfuu6/bY4yTta5oV7t8F5j
	 5SuJIXLJstyDA==
From: Mark Brown <broonie@kernel.org>
To: Radu Pirea <radu_nicolae.pirea@upb.ro>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Ryan Wanner <ryan.wanner@microchip.com>, linux-spi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank.Li@oss.nxp.com
Cc: vkoul@kernel.org, imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20260930140257.490019-1-Frank.Li@oss.nxp.com>
References: <20260930140257.490019-1-Frank.Li@oss.nxp.com>
Subject: Re: [PATCH v2 1/2] spi: use dmaengine public API instead of raw
 ops
Message-Id: <179086451746.90966.11460372629001308510.b4-ty@b4>
Date: Thu, 01 Oct 2026 15:21:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1247; i=broonie@kernel.org;
 h=from:subject:message-id; bh=9Fw3wcsgiryfAv7+hFXzNuu3dAOxf2hLIqyQz2BXWEs=;
 b=kA0DAAoWL+9zsLPQOIkByyZiAGq+d3KjtmBqeEKmY+sfGxu7exPooDtr2c/oeo3Xyu+4GOZHT
 4h1BAAWCgAdFiEEXmoL6X9066wOwaGGL+9zsLPQOIkFAmq+d3IACgkQL+9zsLPQOImVKQD7BScV
 DG66eUzlbgiv0ggSaOOIZojMixcHngbquX7GxXoA/iyq5ti1FMRjxOATpr/TOXfnWG8T9vtHvWP
 lLqp9UPYI
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

On Wed, 30 Sep 2026 10:02:54 -0400, Frank.Li@oss.nxp.com wrote:
> spi: use dmaengine public API instead of raw ops

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.4

Thanks!

[1/2] spi: use dmaengine public API instead of raw ops
      https://git.kernel.org/broonie/spi/c/2d57d6fd1f56
[2/2] spi: use dmaengine_get_dma_device() instead of chan->device->dev
      https://git.kernel.org/broonie/spi/c/853de617c4a6

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


