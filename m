Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3360AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 12:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nrRq/rqP6CPHqJ5bPla9J1CX1DPLvJIFTJzunN36uJQ=; b=rKoER7I1FiTVM7bb2tVQVqquQ5
	88ZTd+raWE15TcE0as6zo5czzfisyj1iSQZvCZeQauKhdSnexqKaFhLO9eZBXnU7UugPob/azgmnh
	+u1PlE8sZI/+L98J8bjkCIVG+qWGBkmcMQh9m5tE0KsOMmyyR08gmGWnFPgpPVHcWR6YPBz9sAzV5
	DHrez9KoVXV1Q87kxVVZgEjOGjYTVO3rbTfdKO0ec4S5Hla7d/d2q1XgNbEHAVOgi/qwFl7SUceXi
	1EmafVhF/ggMQ8jXEMYkQDn9b+mHDUmj1oVeRjQZb2RaFVC54oBUU1m5UWzLBd7ucf42m1kNOJMuc
	Ml7PRmmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weAsK-0000000EWlR-0rEE;
	Mon, 29 Jun 2026 12:14:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weAsI-0000000EWlD-3Edd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 12:14:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 26E8243910;
	Mon, 29 Jun 2026 12:14:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 034CD1F000E9;
	Mon, 29 Jun 2026 12:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782735246;
	bh=nrRq/rqP6CPHqJ5bPla9J1CX1DPLvJIFTJzunN36uJQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=bIOJGuAkRUeEsVyXg2f4w6mVqSoSoGesHWg/LiHk1eKwRDY89MEN0tl0S4VO1WPXy
	 2Sqd1qdNgX35zyEUdU5bTL4UPaDxzlgDZ3ek654UY/c5LO38Tsw0tuTZEvTKyDXq6L
	 BjknxvL2Qg9GjjiXkSKFFdYBQgNU4p7hfawjXKgvtiDKy/M/c4E+j+60uyUbxJVc6M
	 JwMfNX7yRv71qNizXLd1i5SSXn1Pp2a0htEwDJOSQzgiMq5qDwt1V4h6Lljw6ywzWD
	 zV9PJCikwOT1EDedQaCR+SuuFCG1az0nrI1bgueqMks/dtJsMTMfUmQfnRsW0OK7SE
	 owmwQPzsqjNgQ==
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Carlos Song <carlos.song@nxp.com>, 
 linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Javier Fernandez Pastrana <javier.pastrana@linutronix.de>
Cc: stable@vger.kernel.org
In-Reply-To: <20260624151958.18626-1-javier.pastrana@linutronix.de>
References: <20260624151958.18626-1-javier.pastrana@linutronix.de>
Subject: Re: [PATCH v2] spi: imx: reconfigure for PIO when DMA cannot be
 started
Message-Id: <178231999027.43395.1514985035115232415.b4-ty@b4>
Date: Wed, 24 Jun 2026 17:53:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139; i=broonie@kernel.org;
 h=from:subject:message-id; bh=I8SxFiR4w7yQ2Mzp5iIXtB1nJWVUCK0u8oqOK9del00=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqQmGLTSMvPD+Qz2hu2SvAp+EQjs8+4wlCDYYXX
 1Pz9qVf13CJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakJhiwAKCRAk1otyXVSH
 0KSeB/92Zvp4edp2JAXF83YCsb7VKwwI8k9+1fxKerRxav/oc0lreCiVnEvWOxEY0a88/8aAKHw
 L0mOKSavZWuZzlat6yzPzrn8pskTjGQ20NqU7dKPR0RbOgjmhKfBkX+MCoHFzQOKUveZZL/W/Jb
 JUHlAN77K3hZHFLf04upFHGqu4m45Tg+TNpMWZdtPTZgFaqjLUPvGzTh8KR8P/Pa47jortjrABh
 VvDU4dMjH8hkcHoRhrLDhv/yzGqMXi8Jbzz57gcI+jaZ8z9ISAhXc4TVPck7A40WO4u9xsCX61t
 Ajxl6jN96Rfx2MCV/gdet1mnhwsbtYwAYJJiDTDlA1Fm+aZK
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

On Wed, 24 Jun 2026 17:19:58 +0200, Javier Fernandez Pastrana wrote:
> spi: imx: reconfigure for PIO when DMA cannot be started

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.2

Thanks!

[1/1] spi: imx: reconfigure for PIO when DMA cannot be started
      https://git.kernel.org/broonie/spi/c/245404c26563

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


