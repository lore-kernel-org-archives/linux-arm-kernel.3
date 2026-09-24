Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40C7C98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 14:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cvAmkNGNZHIJA9jAO4iSuxQA1wy1fFQU2RxWWTWGcPo=; b=w8V0ObxOCBgC/JLOj5aSTgtCWa
	igA7N1Ax0d1mVrTnZFToeCwMpNJiEzHNR4pBDnf5Q2EraaxI2cm6TBYLKeyLHHGyhyN9eeFWN5by7
	q3zqDHTc0I9r8Q1xhqEWOTl+ZDA+ZVa9Gh0Hj3WqCy4Z43Dx45ne21jOFasb4CAC/NhFsGWfd7e3x
	NVjJYlKdbXY9pwXXSyJDiL9lw/J43EKGkqfZHQLI/W5s22zJJdPADZLEpLQNI3KxIZTf/nI9y9xux
	ue8wu7nu6hMwwKbwwWA+fFSPuiyIjrs6faHxBX22RhRPXKxJW0RjMc/VSUw/rtJV3wv5D1nctrNgJ
	ymb1GQYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA73S-0000000DcUt-21Sx;
	Fri, 25 Sep 2026 14:37:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA72k-0000000DcHJ-3wvj;
	Fri, 25 Sep 2026 14:36:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 800E243934;
	Fri, 25 Sep 2026 14:36:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64FD31F000FF;
	Fri, 25 Sep 2026 14:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790347014;
	bh=cvAmkNGNZHIJA9jAO4iSuxQA1wy1fFQU2RxWWTWGcPo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Ov7XUgnOGfeuQqMWBzw8TAUmlsxOjlYGNRkhwVaVb/cDv/ZAFrRVhfuMwNRsmxO7b
	 M+WEwlYs6It+jmHao5vOANPLJDfiKFWwYYQmioam2jhzxhyVO8Xry0cHU8XuznySNl
	 LsgqjXHwF2Id8OweWjjKe4+38tjqhNFljURadZYe2SkJtxHMDL4pRvCfzk/Z3n7Zh+
	 s3SXEarNW/1FdBL0ki+zNU6eH8v+ZMqRN83FDWji0U7uMGjVus1IqU+nhd5Ke3tJ1W
	 2DG2Ri5QeUZe18TZxcG/fg2M2D+jQkW2+2LZwycUc3zvxptM0pyeLjWO64Vn+6Q6y5
	 /gZsLupZyQkGQ==
From: Mark Brown <broonie@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>, Myeonghun Pak <mhun512@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Ijae Kim <ae878000@gmail.com>
In-Reply-To: <20260912190056.42192-1-mhun512@gmail.com>
References: <20260912190056.42192-1-mhun512@gmail.com>
Subject: Re: [PATCH v2] spi: rockchip-sfc: skip DMA cleanup in PIO mode
Message-Id: <179029098401.149798.8341951933332552529.b4-ty@b4>
Date: Fri, 25 Sep 2026 00:03:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1109; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Bl8IIvnrQVF78k9CwRS6UimdhKGAw+yT6CR0DBASK9c=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqtocBvqGTj+b5fo6Ahw9OKlEee+FqycNDOFXcf
 4naZISe77eJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaraHAQAKCRAk1otyXVSH
 0FyUB/9K285S1zV+w4jnqNyJaxxOfonuY+dEOlOwwYn+cq/TTxG1z8ppKzl2MN5xDBiThkbyZxL
 U9aZVjdBU6dUu+3iwHlS00noXjkICx/tiGEfn1DAcuXuAlfqcL7n1cfcGEuImw8ApSAoROOQLij
 SCx6guIZmMjyBW5HalzHAjwWy2/RlRO3RYxA9CLABj+Ecg22ewvlZYAiLdpPfktoaDJU9V9RJuV
 Sw2kcn4xC8w1u1vMKuUP+70Ei786DkATT04pK+8SpBToFjqhS9EykIIz5oJ15Wu3Y3Yca1MDiCY
 7+D/YcT3TIh6cqLm3Tz28p77Tn86/cDckwll52oe4pcU2re/
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

On Sat, 12 Sep 2026 15:00:56 -0400, Myeonghun Pak wrote:
> spi: rockchip-sfc: skip DMA cleanup in PIO mode

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.4

Thanks!

[1/1] spi: rockchip-sfc: skip DMA cleanup in PIO mode
      https://git.kernel.org/broonie/spi/c/926f9c44a76f

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


