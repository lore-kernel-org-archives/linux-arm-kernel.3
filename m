Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC5EDCC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 12:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lBq4SZEcwNj1I/SZaHaY4ubXn6ev37pFFkaWpeQhOVU=; b=c52CBWyrO3xTWLC4IVvg7g8KwY
	s4xLQ/hsMQ+opg5JqYYpkvZ9DL/0QOA1ixkMJ5rB0WHRy0mAjshjb450I3V4NVu4u+gph2QSQ19Oh
	trw1v8wl8M+JiDp385QITTrkfXEvtcDX8gbI9ePKvFoQhJDNbkJG59dN6yhc/lq1O8qT2lsxsIiN0
	bEd6wD/En6qIZW+6ZGB4DcmkD1piWUmPlvlLsGTBKDXWIWsnfRkGxbCC1I/BfuPm0FpVML1GnDaU7
	dqiKyPNE34hOWPnfKMCHUGCZBBmdcXHai7vlvL20RcAWO7hYGookrlXqSzOAxVJ31PzGmtQa4eQIs
	gWbDhRwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKjx-000000008eA-0xw4;
	Thu, 15 Oct 2026 12:39:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKjv-000000008dO-2I6n;
	Thu, 15 Oct 2026 12:39:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F7B843E7F;
	Thu, 15 Oct 2026 12:39:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 433BF1F000C4;
	Thu, 15 Oct 2026 12:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792067959;
	bh=lBq4SZEcwNj1I/SZaHaY4ubXn6ev37pFFkaWpeQhOVU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Y45KVJ0dmr/B5PkXwhasr0fP3fd/QUyN4JPjsKxxqeZlERH+rLc1lOkvysz1c5vdq
	 AUIZeKz1BsFhnIXwUJVpwpate/sKttVq2HyHOFb60wV1vVj8iApvAJ4Zp2wiZhVyG5
	 HFdtNFhDiwytCXy2YKD+H31gsf/NLqz5DyxkJlBWNM3E69ZXEYx3xW9gFnn83Cd0W4
	 H16iXDPiV9JcVVkTQ+ntsdOQWO+qxCsfRd9dQbVB0dVZPfx+NY0/tRcA4OWG8CSmDl
	 PEnbzvhU5fzAXJJRxpUKQYAQARjXwTASDly/qCTZXhmTPa4qgM3/Inx1ULtvJPV9d5
	 LLtYLa1AuP9Hg==
From: Mark Brown <broonie@kernel.org>
To: neil.armstrong@linaro.org, khilman@baylibre.com, 
 Hongjian Dai <daihongjian@kylinsec.com.cn>
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, 
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 xianwei.zhao@amlogic.com
In-Reply-To: <35143466F2F5166F+20261008124704.87708-1-daihongjian@kylinsec.com.cn>
References: <35143466F2F5166F+20261008124704.87708-1-daihongjian@kylinsec.com.cn>
Subject: Re: [PATCH] spi: meson-spicc: fix invalid DMA unmap on mapping
 failure
Message-Id: <179192404716.1606900.7933098605518290477.b4-ty@b4>
Date: Tue, 13 Oct 2026 21:40:47 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1130; i=broonie@kernel.org;
 h=from:subject:message-id; bh=oU+aflSH8ieUXdoa4wTiNkL+faVHwEFgPlXfrXSVKMU=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIunCwutjhRFrGLs+urCfstZd+pwgXPXj1SX5MqwXfgz
 AR7tfPLO0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRDAGG/6lCmpZbVdU8Suz7
 jdffbvwtsa/UvbCOVa+n55x5jWryMoZ/mrxqcQnrN4pI790z4Xhg+2q3QOPmS3fEXVbM+sd5Wju
 IEwA=
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

On Thu, 08 Oct 2026 20:47:04 +0800, Hongjian Dai wrote:
> spi: meson-spicc: fix invalid DMA unmap on mapping failure

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.4

Thanks!

[1/1] spi: meson-spicc: fix invalid DMA unmap on mapping failure
      https://git.kernel.org/broonie/spi/c/9d71f9fe5b5d

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


