Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DF3C02195
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 15:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TmvWhycgBtCg2GU4fJSykeO08BVVcSJjqpSUgbDGaLU=; b=f+EKlfjaJZufIzOgHUJR5+ZhWT
	El1kzhBqtng1WoNwot05T/vCGSEh62JOX4o0PidQru/rcZK2KnkYt4srvhb8nGRwAu7zS7TZC30LO
	cDaUbl8xzvTbw5+MgYEWU8iPq6NzGuRDbZamWEltOML8C3MG5462snzsiZGgz/KJYj/Mh77V0WU5+
	nyGvoyHMtw2+lPpVX8ENF9ucUW8XB2Ei/O5cXzMzbhN0l/ZqBJHnb9YJXHl4wagR+0JUu6JbwNgQ4
	rzffTfHXQXuWVaaSNg8F07SkzGle/evaG3s4Wr4mS3U+VWp3gcLymdP/r55PgdscZOxp7lac76gpY
	bbK9lr0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teyqp-0000000FvxQ-0sef;
	Mon, 03 Feb 2025 15:59:07 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teypU-0000000Fvqc-0GG1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 15:57:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0FBDEA415DB;
	Mon,  3 Feb 2025 15:55:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FB52C4CED2;
	Mon,  3 Feb 2025 15:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738598263;
	bh=5fDGmhub7kgFaJWNzLMa64HxzMW4rz3YnPY6BA2o8bQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=J4nNDT13iycal9wwQ8iR0xlMm3uIg4mgGyb93cOd/oz3CjidGfKUiHyJBrAFMYVXA
	 7zihPZisRRVdWoi+dSgWbi/NlIN4fKvp0mE+XFn1qIzAr1AmbO1BAZK0hj5sD19TE3
	 T8CaDMiunBCrqeEMgG+sI05lO2KNWZjT1CntiiINZB8tR2LrODMgSUv59PGsqZdHp3
	 duRbkLRHwl0BQ5GMpVEAwmFK4ci2kTlSYo3ZvY1EXIRCTR02/TZl0i39ICX4w3E4gy
	 AXquFzG6Oh0Gl/ekMHYNJKawXYBYQd2OfOO/qRRLC7Q4iFL3BGYvNxLso1YK1f0EXU
	 TblOtIlmA398g==
From: Mark Brown <broonie@kernel.org>
To: Michal Simek <michal.simek@amd.com>, linux-spi@vger.kernel.org, 
 Sean Anderson <sean.anderson@linux.dev>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20250116224130.2684544-1-sean.anderson@linux.dev>
References: <20250116224130.2684544-1-sean.anderson@linux.dev>
Subject: Re: [PATCH 0/5] spi: zynqmp-gqspi: Clean up the driver a bit
Message-Id: <173859826117.375082.6233589403904038828.b4-ty@kernel.org>
Date: Mon, 03 Feb 2025 15:57:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_075744_175576_8079F21E 
X-CRM114-Status: GOOD (  11.57  )
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

On Thu, 16 Jan 2025 17:41:25 -0500, Sean Anderson wrote:
> Here are a few mostly independent cleanups I came up with while writing
> some other patches. Feel free to apply them in piecemeal if you like.
> 
> 
> Sean Anderson (5):
>   spi: zynqmp-gqspi: Reformat long line
>   spi: zynqmp-gqspi: Add some more debug prints
>   spi: zynqmp-gqspi: Add helpers for enabling/disabling DMA
>   spi: zynqmp-gqspi: Clean up fillgenfifo
>   spi: zynqmp-gqspi: Always acknowledge interrupts
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/5] spi: zynqmp-gqspi: Reformat long line
      commit: d61009bd578ee7381a3cce5c506190ecb8f9d6e8
[2/5] spi: zynqmp-gqspi: Add some more debug prints
      commit: ba54629287f58b22c1d37f80f1875373e4b51ea6
[3/5] spi: zynqmp-gqspi: Add helpers for enabling/disabling DMA
      commit: d2ead60d853189f8e5ec6b301fac1e60e0b4b47d
[4/5] spi: zynqmp-gqspi: Clean up fillgenfifo
      commit: 9b32c86e40da792544c53076f5ec43f115e56687
[5/5] spi: zynqmp-gqspi: Always acknowledge interrupts
      commit: 89785306453ce6d949e783f6936821a0b7649ee2

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


