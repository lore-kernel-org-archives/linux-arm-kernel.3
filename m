Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7ED5FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 01:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJomjSTXFlzYbW0NN7BydSGUohO/AhuicCUemZa+dc4=; b=WY1zLla1uTbEFJPywvgxy1iOPE
	pJSFXKCb+WvHmpDZ0YhekL5tdyM1dBdiaBoURJ3BHmJj+s5r1bIjF1XRG6PJF3ERv6r857AdlkM0o
	NuYMZgd3mIYjXfOt4i6VjpgPjpn8AxuQFxeNKT5EKpoLD0u3N6UkTkYd+8i1yIRYjkYLyuUxAsixC
	YIVJgY3TqDN3u0GdadhKoRn1gv15QiyUOllzh4P1Mu1cAo16PBDbK2SYtKMhq3BLpQkBNcpsaSDj0
	eYoVonZvMZikYl+5v/SCB6Pp1/B4EsrYci/knC0eaIXlNXUg1QC461NM7eYkvNSX8GtjDejAd67Go
	7KhsMrzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK4IU-0000000EmvC-0B25;
	Tue, 05 May 2026 01:10:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK4IR-0000000Emtq-1JwJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 01:10:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EE7F6418EF;
	Tue,  5 May 2026 01:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B716DC2BCF6;
	Tue,  5 May 2026 01:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777943398;
	bh=331x4UD/hucbKl1nlqNUXkmQvG2PL1J3nt7IJ4rDd44=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WDQnDTLYdKp7iUJBAjxYDIOQT2CE+Tz/buaJkZiJie688Zg+TAS0Da+N0ImIxzdCC
	 JTEu5ZoE+GwuPGtH6z7lRQlg55E7j4XGuGrHGcrEBTHqQHFN9i4XZwBSWGAWTW6AsT
	 ykCblgjXfVBNwtKvtbE+q83cqxNVnlhJgKRYmB+paQ5LeUH0/3AAf9Z7dhA+/b2tHM
	 x7BqyeB8t/PBuJvvtM/veymYaiCv/4cXNii8g0JMfUs/zuh6c0VDRNuIfVPyc5F4Dl
	 R1yNdCiGGYZ3yOWs2BDaUiAZGeEdtJ73kHFlL6an70fiJZcqpOfAnKBrEbyBmUdF8V
	 GU61S3/CAzdFw==
From: Mark Brown <broonie@kernel.org>
To: Frank.Li@nxp.com, s.hauer@pengutronix.de, 
 John Madieu <john.madieu@gmail.com>
Cc: kernel@pengutronix.de, festevam@gmail.com, carlos.song@nxp.com, 
 linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260501135951.2416527-1-john.madieu@gmail.com>
References: <20260501135951.2416527-1-john.madieu@gmail.com>
Subject: Re: [PATCH 0/3] spi: imx: Three fixes for the i.MX SPI driver
Message-Id: <177790094182.458539.6679525030679687136.b4-ty@b4>
Date: Mon, 04 May 2026 22:22:21 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1504; i=broonie@kernel.org;
 h=from:subject:message-id; bh=331x4UD/hucbKl1nlqNUXkmQvG2PL1J3nt7IJ4rDd44=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp+UNjQEdr3fbB4i6Gr5VRNP/UOajM+6Ey1rvVq
 FD5DTR0PumJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaflDYwAKCRAk1otyXVSH
 0MNRB/kB90jLxBer/YNvrpbas4Pq5Rgcekh2UyIoLynQSQbqU7k2ES2RgOe5BQ7QiyyfyNExK/q
 On5xhPiG1P/qxbOMSdki2e4SSJAXIYtjpW04HKaaHk9w3F66Iyj8djYcuMlcUmSI8yoLghnIgVu
 qLQeIIPTxNBPZnnMjesvha5DfWSOPHuL76cPJ63nceed7fVq1iF18UdX6j1wQPcH/LAnKH9lAiZ
 eIe6lcIxMOYYjHMct4lj/E4FIhavhMq/JCE0NGM0A3IqFHfwSARAnvPRn8GHcNsrLQG7fGfc2tP
 uHAF7Wb7lT4DeDcBSEBLUB1fqYST9+p4RoFk9W1X2ooATFB5
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_180959_375348_122A46D5 
X-CRM114-Status: GOOD (  11.84  )
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

On Fri, 01 May 2026 13:59:48 +0000, John Madieu wrote:
> spi: imx: Three fixes for the i.MX SPI driver
> 
> Hi All,
> 
> This series independent fixes found in the i.MX SPI driver.
> 
> These are:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.1

Thanks!

[1/3] spi: imx: Fix precedence bug in spi_imx_dma_max_wml_find()
      https://git.kernel.org/broonie/spi/c/24e0fd8b8520
[2/3] spi: imx: Fix UAF on package-1 prepare failure in spi_imx_dma_data_prepare()
      https://git.kernel.org/broonie/spi/c/f5b554825504
[3/3] spi: imx: Propagate prepare_transfer() error from spi_imx_setupxfer()
      https://git.kernel.org/broonie/spi/c/894e04b71162

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


