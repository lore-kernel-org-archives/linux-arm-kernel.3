Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F3CCA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 22:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N2ukRt7u37PXdnASZSDb3u99a4jgfFBtdSx//53lGZ4=; b=bwbvG7W8mcwdbwrzQ0FD+pGds7
	OIuhG6WkNcakhMERZyEBnQT502C9LPx6dV9q88EE899JeuahtkgOQjJb1BEPOeCgdzeUozhwHvxYB
	CIpDEMIkNA0JExQsSfrkDX+HD2ZI19l1CjT6k/wMVkxcS+qMFg0tw55p0//EMEmlxfxISY01QdePu
	E9AiOf/FoxnOicMDfO4Ts7PbxEbfNxM7PKftMyvWrbtr99lvNi0APPJswZyFainnUCTdvSJx2BMGX
	yWQclpnBYMNDROpFoiCAmeEuPrCoIsWxQSmoYI16QrCV1L3S6Aj1zhmUm1ZVuP3ouuhLZVjiiNHST
	LoHO9bOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJiY-00000001k32-3rdU;
	Mon, 28 Sep 2026 22:21:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJiX-00000001k2b-39jw;
	Mon, 28 Sep 2026 22:21:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E58AF600D1;
	Mon, 28 Sep 2026 22:21:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 948FB1F000FF;
	Mon, 28 Sep 2026 22:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790634060;
	bh=N2ukRt7u37PXdnASZSDb3u99a4jgfFBtdSx//53lGZ4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QlQJFuZZWfCYkJ+rkSPhStacQAtPayY0AuRTEXdKHZKQQG45XJcYt8SiCnw7tK5xr
	 6AYyCV5dmefdeXfmvg7qABChpiaNCZgNS0YnfehR7FMAgS4oqRW3mBy6tGopfo3GWf
	 qSF1ousuAloL5pRpIz53wa9HTYU+h9DvO7peDqnwsH3YbNcL38APH6aVSs84SvN4mu
	 9oH+QTL3naN5Oj8DzxIpjC7IYTBbCVGFX6iG5Zf/mibQilbiSpq/QocXCBuhyL7JEu
	 kvozwTVZ0DuRCkD/oKV5KbRl001OjxDSzbFmgUUIWfUKcW9OfpThBnv0lUt1KB2s1+
	 J6r6wm+/QWEjg==
From: Mark Brown <broonie@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Lucas Costa <2000.costalucas@gmail.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, linux-spi@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20260925193008.127314-1-2000.costalucas@gmail.com>
References: <20260925193008.127314-1-2000.costalucas@gmail.com>
Subject: Re: [PATCH v2] spi: bcm2835: fix device_node reference leak in
 bcm2835_spi_setup()
Message-Id: <179061518603.139547.16962778636816952777.b4-ty@b4>
Date: Mon, 28 Sep 2026 18:06:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147; i=broonie@kernel.org;
 h=from:subject:message-id; bh=a7FrXxhQPMQAuv6iDAAZDyVzytS2J0lG9A91Y2NaZH0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBquuhIYWG6ndBfp+OlehjuoDhwjsUU9LLllcNTT
 NExYikIodyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarroSAAKCRAk1otyXVSH
 0BgVB/9XXw1Q3FbKpo0WVt/Pgygdodbp9KfiZO2rH39IViEj90XIV/v8aJ0m0xwHNahKv6MRrjn
 1Al56hG8Tpwo7gZyYhTEoY2KDjy64K1DppOD9pjJMVGTdI7HvR+i3ZkPyT/PS991b1Yk5AhsbuL
 qD1hcGbVuxDTw3QGXsq86OR85J2zQOwvY7cmEOidh7yxEGesppsV3H0+IO2aDUMYsPFlZ7oaCyo
 Im0ygHKxyS4bVORrg5Rr3Yr9ZWeuYNRXztaPj0BJhskDm5rYuNVQcMwL+0NAMpxl9CaWTbal2LX
 i7R+A3kaQUoHDCMgmF0xZmJO/K1Ary06cq57k5dT47vxp+/3
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

On Fri, 25 Sep 2026 16:30:08 -0300, Lucas Costa wrote:
> spi: bcm2835: fix device_node reference leak in bcm2835_spi_setup()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.4

Thanks!

[1/1] spi: bcm2835: fix device_node reference leak in bcm2835_spi_setup()
      https://git.kernel.org/broonie/spi/c/8db44cca03df

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


