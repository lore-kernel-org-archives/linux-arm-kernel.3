Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7FCCA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 16:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+VillOJtWalaw/jSDZBznfL15QfMpYdQSSXIanytqE=; b=pKRpAgWourYXh4UVLs5ro0zL7Z
	h5e4aPDmuZgKOzOnMPoPpkiQNdjKwGhmAGIW3IQraZ01mIoGEijaZJeq5Z04VrFPZekIgkaH13OSE
	yDgKy4cR/FNJuX0BfIJZzesmxTInQ/xIhdI5V0OBgHuM3ftnKmeN9EDVOwNmJ8bFeiB1wmRRJrhBX
	DJfTpiZAhMiMFg5VuNWmrfNFF35UHD49y9fti3tGPthdhoKyPKrVeYAuJRi6fYKhMQmT8dVP++Wl5
	3jIkUJW6/01ctrkCzz8AQqw2Ii9qQkjWRE04J3Ko6Lis3bDVz7yH0v1kj894H6674WiAkqi3teTrk
	bdpujGtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDlAL-0000000GoWI-3AhO;
	Mon, 05 Oct 2026 16:03:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDlAL-0000000GoW4-1npn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 16:03:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5BAAC60514;
	Mon,  5 Oct 2026 16:03:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DDCD1F0089A;
	Mon,  5 Oct 2026 16:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791216227;
	bh=j+VillOJtWalaw/jSDZBznfL15QfMpYdQSSXIanytqE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=naR0LI81YLfOeNm6VeqBbtgI34qRJ+qxJqz/URSBK+YBKRkKjx39zGrqBDH2VouEs
	 WeM8EwGR6PytDADsMbgQmlK2xcQu6ZJPVZwcYXvt5hHQ/6tXzmcpUHEJAv+PW9Mq6H
	 YvqCRphUFPLDmxw6A6lt6QL90zj2tTs4L5rQrmZdKemLB9Tcq5rYiwElECAk/aj1dQ
	 8oogT0JUKKeqMCAkoBJj/1X9zyhqcB6B6jZ2v4n0KhGx9Y5iD8wcE1UNPSSO8PdcXV
	 gSUbsJrNIChqoidCIGTsengCDZWtrixfnS3FFqANX6Gmxf6PcidvU6vR7mCwT6y/ZH
	 Sgkg8a8FWiPeQ==
From: Mark Brown <broonie@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Varshini Rajendran <varshini.rajendran@microchip.com>, 
 =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <bence98@sch.bme.hu>, 
 Robert Marko <robert.marko@sartura.hr>, linux-spi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>
In-Reply-To: <20260923012950.15651-1-kmehltretter@gmail.com>
References: <20260923012950.15651-1-kmehltretter@gmail.com>
Subject: Re: [PATCH] spi: atmel-quadspi: balance runtime PM and pclk across
 system sleep
Message-Id: <179114276714.150114.17193721637289577017.b4-ty@b4>
Date: Sun, 04 Oct 2026 21:39:27 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152; i=broonie@kernel.org;
 h=from:subject:message-id; bh=TwCApKgSzLwszhlYokP7yH9qXvdd7jTgvIMJN1h2+3Y=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqw8pcv5EFqGPBUU7JDV4g11HA0yZJRIt92YJam
 aJoPX64gE+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCasPKXAAKCRAk1otyXVSH
 0JRzB/49fPpvqUSexwJD8TEcmWyAxxlv4A9Stb2Lnm6F+I56hcwNbR8X1wVPIiKubVfH2KXaV8Y
 2/VSWIQAziCxSJ0vnIvPI+S1Z1nmvM1dQpy6XxWY5tilmd2RM/J4jrYwj0akzwemrVVbNF7LWD8
 FgH2UWkLXXtAWB1cPX8egTQMjmkl2eMUMPEVg0EWgwenfORN7OIhSTjNzh0fn4C6qcou4yDqJ0N
 zj31DD3WLPB9QB7VbsvcEsF2p6C2at43skxh6VKSkP7hCvLc1Qv5hxu/FV/UYQN6cCHhPzVxPof
 Q2/PoU0Tz6i21AlITv5uYchIPCY/ZjmVf5claccgF3geCtP4
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

On Wed, 23 Sep 2026 03:29:50 +0200, Karl Mehltretter wrote:
> spi: atmel-quadspi: balance runtime PM and pclk across system sleep

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.4

Thanks!

[1/1] spi: atmel-quadspi: balance runtime PM and pclk across system sleep
      https://git.kernel.org/broonie/spi/c/717e45f97246

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


