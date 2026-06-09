Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67675CD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 23:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aD95TvwXzD1HaNltihw0RgGiAp/VWUjSzOzfVn/vpJ4=; b=Yy3ehY85ImVXhjcY+o5kcfyYjq
	KC4Dt0PFA3bb5SZoDrhapURMd7TP6WbQLgJSnbxdUfA55s8KeD/7taVW8Yakff2l6tGRRg/RQpbnE
	zJoGgXU/mQw6Sq2hPw3R7/syrZmQKD5eSr7a4G1NAx2x+JKE1+l3Ocr9MERaD2yCSwzcEgYe6oKBt
	62krjwuyWYekvDudsqX40h+kNCXL78uQFBzf4Sk4+041wk1tZXf30+5/RKQBzr/XMBO0gWXEgyWL5
	vcpoHf3XnPCvSpWDqDfjXqcyFFU2gDsKQGwUhZwcuVne/gia2zEw13fnD8nS1vlnbNdN2NpupK8It
	QT0vxL+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX5Vi-00000006UU5-0w5M;
	Tue, 09 Jun 2026 23:05:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX5Vg-00000006UTX-3pab
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 23:05:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 50A7E444DC;
	Tue,  9 Jun 2026 23:05:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FA3D1F00899;
	Tue,  9 Jun 2026 23:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781046328;
	bh=aD95TvwXzD1HaNltihw0RgGiAp/VWUjSzOzfVn/vpJ4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=L28OnAvkY/r0m9bFU1xVoWTX2MnuT/q4O6fdW4fwfJ3lk79I2ImaueEtLj4iwJw6p
	 nOcxnxB2Ag2oqttsiksQZJLmjwDlUbrtHLsndHLHrSzzgxN/VfO2Vtb0zedsbaADvt
	 QFTH7m6Bjat73UujH1+4veGbeOYD0HMuugWodUJ/nQf/J20xxgCVRUi32hPvDLVZTO
	 etkMTzj48eeqTkVcIO7PfMBnRaE8oS6l1bUEO6DtxCbhFOWKSpNdfTwHQKqDND0u4h
	 n9ynxWs/qMEggAXqF7Gg/mTR8CZa7Nwp7Mat6RK5FPCiPjs1B2tcx8AYwEHRz8Ku+p
	 gIeCPZgB62wrA==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Jonas Gorski <jonas.gorski@gmail.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <3fcd432a505bb1bb7f8ef0fba9162243200b3347.1780606153.git.u.kleine-koenig@baylibre.com>
References: <3fcd432a505bb1bb7f8ef0fba9162243200b3347.1780606153.git.u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v1] spi: Use named initializers for platform_device_id
 arrays
Message-Id: <178104146688.34323.8035338642693154122.b4-ty@b4>
Date: Tue, 09 Jun 2026 22:44:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1151; i=broonie@kernel.org;
 h=from:subject:message-id; bh=dD1NfSsfFeqA+ue7kAvizM5ggS1y8qNVvwfe835lrO0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqKJwyRgD+N++a2A9XgQFuhe7FstOHL8se6UVCS
 wsatsTVih+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaiicMgAKCRAk1otyXVSH
 0DkkB/9pWRLnlIpMt6gUTHT5/ks1l2rsbAQWYtvhksDTQCtJzEPseYryqzpaqg32KCS2NucXJvE
 JI6uOk7uDNJ+xtsKKgD3AOoFx2unswqFaYUbadIOX0xhKwpjYN/RRJhw+5C2wSdEJZoDpcv7uFw
 bz5++GgO+W4K2NwXC0kbVGeWW57cRePRLF8mvxYyBgOOPCJ5UsTpx0kaANgT55VB1S+ej3MS3dq
 vP6l1mxvQjGHZUVa+ylqhSKaevGCMTCXk0x1Zp2p2q5vQLd3FWz5XFG8fvCkBudK9xQIKWBJPuQ
 xZBRCCi68SuZvTK9L07OF5krtksdlcCq7Riig3fI8ky9MTKh
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

On Thu, 04 Jun 2026 22:55:26 +0200, Uwe Kleine-König (The Capable Hub) wrote:
> spi: Use named initializers for platform_device_id arrays

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.2

Thanks!

[1/1] spi: Use named initializers for platform_device_id arrays
      https://git.kernel.org/broonie/spi/c/fc82dda1dcc6

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


