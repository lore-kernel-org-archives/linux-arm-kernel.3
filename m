Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41C5CA5FF5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 13:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vij8nuMtawA4EEgDodwVOo0PtTd64d9d4ZIlMDRzEPI=; b=JXC1nVsw3eeAZn+dDOCVDrqJhq
	FJ2bl8qBwyBw3jC3nh3/uqDlBgNSq9jdhGC6793TW3X+4MqjPgEUVW2l8g5qj4RPxjX83KYvftZCa
	trpPt/eaNNHFaCpkGYTRdO4Io58QeW1VSfkg9hstTnQccfN8ySSG5K4LSrDt04rlCC/Wrt483U3JF
	4SYqJxgwpxo+1XXnZfxRoJ1cZZ/vjUm3XYPJqTl17Lp4aIKU+uXvej0qYiWn6BJBwihVAQohTo5uj
	rTFEhoEGRM9ei+SLkwx4KUWpaUHhFNRPtHxmC65f1P1/91JjuOpbDj3xiRvDINlSbjQxTsHQIm5S0
	hQVhWMFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDiX2-0000000GV9v-2tI6;
	Mon, 05 Oct 2026 13:15:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDiWv-0000000GV6r-2jAk;
	Mon, 05 Oct 2026 13:14:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D4A6E431D7;
	Mon,  5 Oct 2026 13:14:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB95C1F00893;
	Mon,  5 Oct 2026 13:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791206096;
	bh=Vij8nuMtawA4EEgDodwVOo0PtTd64d9d4ZIlMDRzEPI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=UWxpw7+wb4AEgH3i/RbPmgLiISDLNvgTkCc9/4d9oAeNZIRuLJnOgCzp+7DVxk9hR
	 4QMeQS9Z+AmUWp/N2maz0kzleCDawQ+gQxxntnI8GvnCAy5TeID7NYTHuV+vCbJ2cQ
	 /uO4kuzeKWb5yEAiFjk8/L+MmdQnZQJdqQrvcKykbsNV505IC17NDcuj0VOYdkl/cr
	 540Z5UbXWAJvRqgQ2SPEKl+B4Jdfoejyv0XmPgaIMipUImUi40sLNNb1XdnnExHQJq
	 ZjrQpqqiRIhP2NrbwOL4v4wAHeg6xiulwuvs324dj1fyhnfkmNe+FVDohbzTPyaCBz
	 0YX/jtSF8T5VQ==
From: Mark Brown <broonie@kernel.org>
To: heiko@sntech.de, william.zhang@broadcom.com, kursad.oney@broadcom.com, 
 jonas.gorski@gmail.com, Guangshuo Li <lgs201920130244@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linusw@kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, jon.lin@rock-chips.com, 
 bcm-kernel-feedback-list@broadcom.com, noltari@gmail.com
In-Reply-To: <20260924112329.1566051-1-lgs201920130244@gmail.com>
References: <20260924112329.1566051-1-lgs201920130244@gmail.com>
Subject: Re: (subset) [PATCH 0/3] spi: balance remove-path teardown in
 three drivers
Message-Id: <179114318831.150114.12760845139771007579.b4-ty@b4>
Date: Sun, 04 Oct 2026 21:46:28 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1522; i=broonie@kernel.org;
 h=from:subject:message-id; bh=HoRd64CGBSPHAygK6Bwh7r690KCdOZuqMTF0+T31sEo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqw6LKIw6I/a46gzhc7bnqluU5FckkZTqnoRQOa
 iofk9gNG6eJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCasOiygAKCRAk1otyXVSH
 0NlxB/9UJ7TS16VU2H/ap9bXFFDsZ0ziaeNgBroa41aDUN/rR/CBWJwP9doQg+ZZuhlHvGzQ4lD
 QsWQ077htkcLBq+Fwe8B1PsMZv1DIJF2YOBngqVkS08Mh6pmRpGJNMBKyupl05hNrMTWCBzsdTj
 B7BsdVqew3/8vToMJC8+lVuuhoP5X4W4G31gyMGa3nyj9/jYr+axDKI9CBx+pMpKsaEeUWNAMe7
 EqaKmjnXcifikaen1Jsm7rFajHUmh97DzABF9KhJdHR1YKh5tb/6ASnWBdZ8LgNzYJkvLD6jB0g
 Tb3n14IfnKjhBue3Gv8nNc/7qxJj8j1UMov0LNS1T4D6dEt7
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

On Thu, 24 Sep 2026 19:23:26 +0800, Guangshuo Li wrote:
> spi: balance remove-path teardown in three drivers
> 
> Several SPI drivers establish resources or runtime-PM state during probe
> but do not perform the matching teardown after successful removal.
> 
> Add the missing unmap or runtime-PM cleanup in each driver's remove path,
> following the cleanup already used by its probe error paths.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.4

Thanks!

[1/3] spi: fsl: unmap immr_spi_cs on remove
      https://git.kernel.org/broonie/spi/c/af1d882d421d
[3/3] spi: bcm63xx-hsspi: Disable runtime PM on remove
      https://git.kernel.org/broonie/spi/c/38232bd3cea7

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


