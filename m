Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AF5C44532
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 13:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SmUuTxTQ6Y4XVw5VWbgQDC5BocSiUMXxazc3MH9NSJY=; b=FtxjDccgnLI2oL2+9G54tYpgPp
	QdbL+Uixd21705MR/hdVckQ/KK8Jm0NzgfBLYe7uilV4+5akWQYXe7Td8cFFzG4pginrc/16uZjL9
	O+CYCT8gcp1KVQw6jepRx25sKwGb0we6gLuIu5w0m96JgTlwSpWF9ahFLzHdYV3yM3cTDMMITLaKB
	RTy1Y3dlGdQKku8NWTZIWnWa1F58QYp82+74Dz0i4938AtVHAyZF0Ym+d7QYQ0W69fjijFA1ZLss2
	ex8VIXYTgDY3evZ86BEG0vamArdLBrnY8Ae0BVEGPvpG8XVz89v+Q3J1CwsPZ4pHRdBf5tN3CywwR
	bLDuIAPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAw0-00000009acK-1Jjm;
	Tue, 21 Jul 2026 13:55:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAvz-00000009abw-09tS;
	Tue, 21 Jul 2026 13:54:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6BC03419D0;
	Tue, 21 Jul 2026 13:54:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B10F11F00A3A;
	Tue, 21 Jul 2026 13:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784642098;
	bh=SmUuTxTQ6Y4XVw5VWbgQDC5BocSiUMXxazc3MH9NSJY=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=MxUbEjvi+S1gmu8+SyRME2gqUdoDm9BlB09MsFm6rJY/CkFAA94CSVST6iCy1hkQf
	 0552ovL5e+xg1ILWMu6AisXcN7swIJpmrFZjlQtakW91UZIcMghsPrAxVxDDEYF6cN
	 AzXSBsNG+T0zucJkbEyYarpGLBiww+H5aKIgFy0qzJEDlJiKYee8QEFPlHNQMuSLF6
	 D6rI2n0IIYl9F5/h5XY0aeEmxo7/UZXGTQiSuf3Sq3l09e3MU1w7ZoHjbpxohxisxN
	 laxZPhd1m6reeyrtqojBJrXmMezjSSqIFbfmHzJnpex5iTk8+TrWgtxb/7DL1bVcSH
	 3pGMwmkVmXYmw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Lee Jones <lee@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>
In-Reply-To: <dcd98d81dede338c9bbb9700a9613c848b702e49.1784336005.git.daniel@makrotopia.org>
References: <dcd98d81dede338c9bbb9700a9613c848b702e49.1784336005.git.daniel@makrotopia.org>
Subject: Re: [PATCH] regulator: mt6358: use regmap helper to read fixed LDO
 calibration
Message-Id: <178456524716.8049.7739435878902568090.b4-ty@b4>
Date: Mon, 20 Jul 2026 17:34:07 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1158; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Or27C09noim0hBLB6vCJhxX5YJBbBMC0apcidh5QXv4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqX3ovGKOmPkSlI5KgbeLNPrHdhSz1U0ye319qu
 t8aj7xPFVOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCal96LwAKCRAk1otyXVSH
 0AZ1B/9ARDcqVWB+vNQ9WKXIDU2LWWO5yfd31xuJmaU/3qWJKcEQXczXC4li19OL8EZo1MPXf6Q
 aRd7vkMgtzv+RBXTnIip/KCFIKW4S8TfSzBom2eAsWw+xzyyoVl2KmpHyNM28r+J2Sra/Ve3nlz
 eaeR9oc6gVOwjUNMFNjPkKKJKinc4owaoSsH4xq7BoB3c7Dm/FB1Y2lvkz442Li945KwXmgcEWV
 G810gmroVW1GN7hoVPY8VmCKCHy9Fi8fg/eiOi2+IxnnA6dhsAD+PSi0DZcvh0ufd1uW7foNvah
 muBEIkem2qoik0jWsiTFHiJXN3uG574qFGE1VH3ZL48/LNCu
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

On Sat, 18 Jul 2026 02:05:59 +0100, Daniel Golle wrote:
> regulator: mt6358: use regmap helper to read fixed LDO calibration

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.2

Thanks!

[1/1] regulator: mt6358: use regmap helper to read fixed LDO calibration
      https://git.kernel.org/broonie/regulator/c/1d26f125501f

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


