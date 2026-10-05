Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43D7CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 08:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q1T4SsA9cY1Wq3Hbv74FXfyPET5SOEe7zIh1TvR0e2E=; b=Z5c23bbDJtG9THn7u48bzE9Izs
	whGSQrnPEHq1UT/SYAbbk9JoP7+nan6K/1FCFevNdkFurIatfSx2LcjoN5if+HYjkxpIEBiGSRZLO
	5E464SQdLNDif7BL5bpqMKRQ4zSI+Ugd/TulN0LJlyGi7OE5+2DmvFp++Z4EsuPHZtZ79bEOS0ffC
	M4pziAEcEPWhCs/2O1pc4OE+elMCtT0CGeIcIgOYX7kx/ATc8phzPSSidvujYmlCJ1Ks7MzEhlK8w
	0YuFhXV8m0NnPVRSy92W3eba43NaQc9EkJUv74poLcLIr2hWaNNN6GLjFKiEyN6tAYHwoe+qWpVhi
	tsghqUWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE0J2-00000000GtH-1xQ7;
	Tue, 06 Oct 2026 08:13:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE0J1-00000000GtB-02bE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 08:13:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4A838434DC;
	Tue,  6 Oct 2026 08:13:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 716231F000FF;
	Tue,  6 Oct 2026 08:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791274426;
	bh=Q1T4SsA9cY1Wq3Hbv74FXfyPET5SOEe7zIh1TvR0e2E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=bZUV1UVMswQRIb7ckKMEglOX2Lfp3F0LP7orGSpFUe3+NUt8gZEkqXP9ESeeitW3k
	 SZLIlA5anCqpmcCWlUWTP4Hlfc0LS+hdrBBAMOKkG0758wG/8Yq2uEwTbeRc4vODWH
	 CxYyJ0V6tl+kO5eJJmTZf/J1vQJE6Z7xJMRQMJl+0GBmYxutqmH6yBWr8khQSfuXUb
	 wURhE7A6dvmCpc5lcXysrpXM+Xp6z9OXOAUt9gL+qTEcGx68nwpXmL1kSleVosH9wK
	 mwWAUoGSZZOWVtAp4EYk+7MzhNGIZGJgRo2jXN/Jp+Da2uvSjNSg8mOOacbw3NH+kH
	 oBpRP582VVrnw==
From: Mark Brown <broonie@kernel.org>
To: Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Radu Pirea <radu_nicolae.pirea@upb.ro>, 
 Ryan Wanner <ryan.wanner@microchip.com>, linux-spi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank.Li@oss.nxp.com
Cc: vkoul@kernel.org, imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20261002192616.161440-1-Frank.Li@oss.nxp.com>
References: <20261002192616.161440-1-Frank.Li@oss.nxp.com>
Subject: Re: [PATCH 1/1] spi: use dmaengine_submit() instead of
 ->tx_submit()
Message-Id: <179120912507.150114.2210463827298762700.b4-ty@b4>
Date: Mon, 05 Oct 2026 16:05:25 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1126; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Q9vvcmVBRhpRz4C85yLdcNbZrICgW6aw5aF8WscT2f0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqxK2z4yfag+huYeSHQiiV2RWVwh9cfdo/5MeNE
 sKQW0snmweJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCasStswAKCRAk1otyXVSH
 0BXmB/9BzBhmi/lfw68HGvnsbRuqqfe/EtZ6MgdZ3G+uMmanQnuOStMW2NppVyb0y6B3026WRDj
 27T4owhfLSBjHLugF9LdQ13iP2EMWQx/1KLGA6p2pZtoTHkp0nNh3USTZf+ALMhHBl5whv4v2i7
 gRZD51qQ8q6I4ulLfKhykyWQqe3TEK/AVILdVz/OmsFdbHlGUldyysSSxCC9Mu9UWkh3WjdYA0Q
 yPUrLDkDTqACI7vslyhz/PCyL5CnsIu2At86RSgIl1My6ZFDZEnqYs4GnQHa01AWHhIJuH93col
 deBPBWcrSOTTfBrzt8Q1PpxChKDCVjVIcQyx96lkSbNdv+mU
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

On Fri, 02 Oct 2026 15:26:14 -0400, Frank.Li@oss.nxp.com wrote:
> spi: use dmaengine_submit() instead of ->tx_submit()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.4

Thanks!

[1/1] spi: use dmaengine_submit() instead of ->tx_submit()
      https://git.kernel.org/broonie/spi/c/ec79a280e8dd

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


