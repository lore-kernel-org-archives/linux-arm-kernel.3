Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D4ACC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 13:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t1wj9rO2IFSB7dG85CS2DKBofK1j0YFHepGvJf5rT3s=; b=xjegQZBxsGZAMsSGeIN6jQ+Tue
	VH3TQbPIW8tvby28KGx9aMXIfmaukP/9084d43zNOWU44Bh6OE/+ptG5BI6FD477/iwzmOdLTSTHr
	xofg6HWWkVQln+u+Q23v2LA8x9aPqraNDXuxmZ54y6cLP8EU/EPEOQxbw/4XXgdmMh1fM930zek+x
	0KWARUHwr8xH8aHa8j4EdNJnjkVjVa92qpQOrpiLPbcdRjRef3Qk3bodW6K1JqidyrImT4vR5s0t8
	z0sSGNgyRq4xPvvuoZn63n+qMDq4ao/agRgBixxkPwxwuiTrMhhv+GBcpGLIOPbIWwg4u9yVxTOga
	vm1zl68A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnuQ-00000006mIz-2ioo;
	Mon, 20 Jul 2026 13:19:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnuP-00000006mIm-0N2o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 13:19:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 77C4A439F3;
	Mon, 20 Jul 2026 13:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD9DA1F000E9;
	Mon, 20 Jul 2026 13:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784553588;
	bh=t1wj9rO2IFSB7dG85CS2DKBofK1j0YFHepGvJf5rT3s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RJAEyx0I65vZuDBLMieKBOi12vn9+6zyKx/1/QpyNKNAfaL90p3fOTtVlDgIaSgKW
	 FRcmTK2DYvf4VdaTUbSqF9IRMS0W3V5v2B+pdHdNKfTpxICm7IGrd50c2ps88de78x
	 BPcB2YQov6UAxvlmqicxETfj081fvhZ+8e4ZrIvTTKnQic6yvtPN6h5RgTnBLbAFJR
	 obYpr1ftUO4qsLFljILczGiY6bU7PD/2fPQJLQHg56afr977K0rsoYBespY/Txr890
	 zhuUDddfSecAsEr3yauRQZtEGRU7csuFPtsBFJvKSlKrAPQgcW8kRnsAiw5KHv00mA
	 GZ4PoTFmqiuDA==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
 claudiu.beznea@tuxon.dev, tudor.ambarus@linaro.org, 
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 daniel.machon@microchip.com, Robert Marko <robert.marko@sartura.hr>
Cc: luka.perkov@sartura.hr
In-Reply-To: <20260709112006.390742-1-robert.marko@sartura.hr>
References: <20260709112006.390742-1-robert.marko@sartura.hr>
Subject: Re: (subset) [PATCH v2 0/5] spi: atmel-quadspi: add support for
 LAN969x
Message-Id: <178449573326.33801.6246293549401710520.b4-ty@b4>
Date: Sun, 19 Jul 2026 22:15:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1648; i=broonie@kernel.org;
 h=from:subject:message-id; bh=RS3A4nuEP3HMeGSV8yRT+qbaALrugi0tf7bndZ8rj5E=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqXiBwa279Sq/RYQDqepDpqicloWUrSZH8jqeiC
 zIt9NkMUK+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCal4gcAAKCRAk1otyXVSH
 0EMyB/wOwEJ29FLnLGCz/y439VZjhPyOPJ5TedoETV4llxTFgGYVB/ttvrO2+0SQvtZKsauW1eB
 CNZI3Kiqp+fD8A550M4dAkVUPAtPkKx6ycObK7/Zpehilm3Is7RR8XKJflpPmsOCmvo9xgFgsB7
 6j2QkBVKqdxCkUx5W+qxdYymSCcmmB+yddxYtcm/ylOU4uGG2mixZr3jbF57/bSo9ta6i8UiZa+
 pwNA939LR0MD9HsHlLDMyTk13wryluffarhR8ePLsnwzvTdkXG+lkcHu4cc1lSomXGtwnTqFMxJ
 2wVIlharDEtJzlu3orV3fdBSVrNmpGg9HWmwwZDh030sG45V
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

On Thu, 09 Jul 2026 13:19:06 +0200, Robert Marko wrote:
> spi: atmel-quadspi: add support for LAN969x
> 
> This series adds QSPI support for the Microchip LAN969x which has two QSPI
> controllers based on SAMA7G5.
> 
> It requires pad calibration, supports DMA, and supports 100 MHz operation.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.3

Thanks!

[1/5] dt-bindings: spi: Document LAN969x QSPI
      https://git.kernel.org/broonie/spi/c/f718ea6cb3f3
[2/5] spi: atmel-quadspi: add controller init callback
      https://git.kernel.org/broonie/spi/c/cbbd5a945e85
[3/5] spi: atmel-quadspi: use init callback for gclk variants
      https://git.kernel.org/broonie/spi/c/b881f1d8d1df
[4/5] spi: atmel-quadspi: add LAN969x QSPI support
      https://git.kernel.org/broonie/spi/c/a3e4130b6ef9

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


