Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 090C0C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 19:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u9mD7tzax7JJJB8DD1V1DNsY619ce0yudgI2zhXruSA=; b=GR0wqDmdaQjH3VqpSgH0K+G34+
	Fm5sC/jeOgcToS82XaiTjwJ9mq4/9R8Fl4vAcrGqiw6ChSSX4kJ0XP6BX6Rs4ZzNP6KD5wwYAyCcW
	H7uYEzatlnBjUNfCaiLc7wvGK/NTOzBGUAtEUlTaGdTW3hoP0PbQNTD5oHEqA6Eu1vT57DeM3KqM1
	68crIZLF+bHDuAsv/2/XcNwJ7Iihimkd+6AqyxlSg1XIzowTOSkKC/qy1yot1olREvfEeRS+K+WpB
	pi8FTx+9JniSlV4s/lUR326Gi5h1iCWsEYyUC+9TkJqD9id0CDhOa2rcKFwRhc3HL+g3casG6t93p
	ThtCvwLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8OUj-00000000ci3-40Ou;
	Fri, 25 Apr 2025 19:13:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8OQw-00000000c5u-1FXs;
	Fri, 25 Apr 2025 19:09:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9DB295C6B39;
	Fri, 25 Apr 2025 19:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BF34C4CEE4;
	Fri, 25 Apr 2025 19:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745608197;
	bh=xu+LZYG5C0xRUvosVpSNUcm82WBPS5ZJ4DDCffR5PaY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eGM1veaTtQkife/GA793HF5sP63gRe/3WRKjGNSVmLxlRkgka5lNJ3z3lXQ31AXQI
	 eqWrfL83zPiP/sTymPn/BL/UQTkFqShov6A3/7yErCdTNCdFAsSzKQnD2GdqqT+8kp
	 UHBQWKkGGJEyzhUqGbZSqtkbooWX47Ia77faCamrT64/s4yKSdwGHUNbAy6KYaaP1I
	 2yySSUDVsRXRfpTceSBlRBjO5WmQis1y7lxGgtKs63f64G0riQozTt8MP+AsB5jJVc
	 NsTl2Gp1RSvOIfdwLgs0OCD2NjfVoX14LkRTr6xlHJBrTsnYyr1EG5bMjPTZvG4p9q
	 VfBb8CyUmveEg==
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sunny Luo <sunny.luo@amlogic.com>
In-Reply-To: <20250414-spi-dma-v2-1-84bbd92fa469@amlogic.com>
References: <20250414-spi-dma-v2-1-84bbd92fa469@amlogic.com>
Subject: Re: [PATCH v2] spi: meson-spicc: add DMA support
Message-Id: <174560819538.249436.6003671320235963859.b4-ty@kernel.org>
Date: Fri, 25 Apr 2025 20:09:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_120958_393537_F533EF8E 
X-CRM114-Status: GOOD (  12.20  )
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

On Mon, 14 Apr 2025 14:30:16 +0800, Xianwei Zhao wrote:
> Add DMA support for spicc driver.
> 
> DMA works if the transfer meets the following conditions:
> 1. 64 bits per word;
> 2. The transfer length must be multiples of the dma_burst_len,
>    and the dma_burst_len should be one of 8,7...2,
>    otherwise, it will be split into several SPI bursts.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: meson-spicc: add DMA support
      commit: 18197e98353d931fc7bb2bb9ec671d3aa407831d

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


