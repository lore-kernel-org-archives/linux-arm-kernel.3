Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0655BCA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 21:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W8qN3O9WrYkKGPXlg8iYV8CTpKEkfRh5hc0RvhUPcMo=; b=UO1dvtejwfaoUdAIm0taQX9A9c
	3RP13DMmXmsugehyLzR+oNzw/27BssoklmfvhRLe24FbiWooMbM4jEEv3zRBpWjsYxHnhGOc3Ds4H
	QDjQU14f8PqOjTqE4cD1HhBtO71ljzbmORf2JIrwS0DV8b/lvAWb1YPO1cXY4raHlTngcrWU9la5k
	lRuefnbb/He5x0XSM92e1ioTrjBVI72j2+PKeSbKH4aLiYkO3OebOgE3LcIFmf+kKUleQuPbzgee9
	34tJv++4I+jqxLkdWeh9WguwOMtylkoLNMDEeAKYRUJpBWatmdfANIJ2P6KslbdsOnQRV/Pp3QjMM
	POCsw2yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBIS2-00000001ds9-2WUN;
	Mon, 28 Sep 2026 20:59:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBIS0-00000001drt-1dHp;
	Mon, 28 Sep 2026 20:59:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7928B600D1;
	Mon, 28 Sep 2026 20:59:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C18E71F000FF;
	Mon, 28 Sep 2026 20:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790629191;
	bh=W8qN3O9WrYkKGPXlg8iYV8CTpKEkfRh5hc0RvhUPcMo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BYFs9bkgEqPtrlBXhGu7vr1mkFpD4SSsmRCYJn/DlDo5GGAm85f2pjHIyG6UD6jf+
	 x35z0/gOp2Kqd8XetRL4H5NO7W7qRi0JLWCg+vgVBg18ZQgYvpqN8HsOiB0CF016R+
	 qLSmMT0jf0kDwMpVjTQ2gYqmyfkeEwPG1p/BFMemdmd4u6WUnu0ClL16vukSy0S7Jp
	 FB1Kn1C/SS9V7JWOzASJ+0axKkC34Yerv9R09g5yfI2sHPK0GRJbg0/9Xj35HPuTdn
	 SG5ANMb0WvBEhI/ZMs52qB++cMagSot/Q3Lbqh0fA8T2wOV+2dRRQ1jCjLDF7Od5gh
	 wG2+tBNALuKtg==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
In-Reply-To: <20260924-t7-node-new-v2-0-319d3c19b4b2@amlogic.com>
References: <20260924-t7-node-new-v2-0-319d3c19b4b2@amlogic.com>
Subject: Re: (subset) [PATCH v2 0/3] t7: add some nodes for Amlogc t7.
Message-Id: <179061297157.139547.6136934434151909621.b4-ty@b4>
Date: Mon, 28 Sep 2026 17:29:31 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1354; i=broonie@kernel.org;
 h=from:subject:message-id; bh=AtUlGMucJQXIkXUipk5HYsf9isDfjM54zZfuQl6DZ7c=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqutVBdPxu3mO+/QYSmKez/K5/WoTZFSbypUlv2
 DPfFRtIxKGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarrVQQAKCRAk1otyXVSH
 0K0kB/4mbaGtsi70aV/NFaYYlWlhAifpV/KYYVUg+Ryug7wKdP7e8G+Fvk9UxGU6Zc+YCz+paBN
 fDyw21n8yRALJRkZgbeizIzwv4HX9IsyvC6ENu0r6attk1LapUZJxA3DXYcWFIQ6kWzz6yJyL27
 s/WVlZcX0GpCx1ekpXPirdWzFFCUSAY9kHI7CULFUf8mhdmYRd3ZIe8lncpaJ25gVjovhetpcGJ
 KSE7dldpDwMaIzeGhoJPDxKHJ5vWXT+oT6PvSESvBcLRqY65o05ONmB8yJSp0TmWdnXvjfz25pK
 64kJIVKydHKfb8ONAnKhUXe4N2OV6fMJBVbs+qn64R1IIquB
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

On Thu, 24 Sep 2026 05:51:07 +0000, Xianwei Zhao wrote:
> t7: add some nodes for Amlogc t7.
> 
> Add device tree descriptions for the peripherals on the Amlogic T7
> SoC and the T7 A311D2 AN400 board.
> 
> Add the Amlogic T7 SPICC compatible to the device tree binding.
> Add the T7 compatible to the Meson DWMAC binding
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.4

Thanks!

[1/3] spi: dt-bindings: amlogic,meson-gx-spicc: add T7 compatible
      https://git.kernel.org/broonie/spi/c/2ec5d38037b8

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


