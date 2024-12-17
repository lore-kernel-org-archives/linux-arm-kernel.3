Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0C2E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 18:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yrt7agascGidyMbYtSN0DrDR/XCKWrkvhCxoSyllXts=; b=4KQRkRHbjE634P
	ETTOeTQQVxmhLVv1GZvfdTZ+m1J+xBmOC5LHl10C3izD5uQoJGLWJpmK8B/Vm+V6U2xpq5I1fE+qR
	p7IUEi4FT+35M0s5G40XN5CPkf+Mb74cIPSMFTodhDb8X27Jl9D6mdOCabyExBzwUTfhnaTQb5lC1
	2XIQK1p5cBpBfw6A6na31pVMuiyyhW5etKrppFZwWOrCpuQhLWTqXE6ZIJvPTJjy2TcGxUmrNHfuU
	lGZ7qIgCGKC3wdXUUeAkBg9ZLJUVYrzu7F0t1FkYJ1BidGDO5SlCm1aXBayyYgV5ixg8PAB9aJfag
	eFn9/U2zBErUvee2mSOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNcKA-0000000EXla-0tZ8;
	Tue, 17 Dec 2024 18:29:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNcIN-0000000EXT6-3w7V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 18:27:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D72E75C38DF;
	Tue, 17 Dec 2024 18:27:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0529AC4CED7;
	Tue, 17 Dec 2024 18:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734460066;
	bh=UYa+EF3kXhd1zp5dnzEwlfquwsdv11U4gxiAcD7Xv5c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=d94QNl2GcfWCNjdQoJ2jKMxFSXRfrHRO2SPU7Cn7uzYt0mlGNSK4UQm80xdljgI8r
	 S35e5Nsj3Ybm6UqeOxblQqd8ADbBoPBuj6lxKArbVDXxHfrdzXN7wtiwp/i0wBzww4
	 2atnF94FQfQ2WQLrgXUA3RSZuAAkx+HdFDKUX4s0OgbCpmGKh3zNv2C5HFBsfzlzSg
	 iHx7lYkpkeg1b9qj2NfbxoT2JXKUoj914dHyd2OttVRCBz7tBfdV0MHbKXR4LSJKRx
	 3aTv9grpkCL2UGc7d7kIbdXFpp8usv090NmIrmnTk/7P7dY4ZL+6idrXOnAC1mhW6Q
	 v2AUzq7xJOY7w==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cs=C3=B3k=C3=A1s=2C_Bence?= <csokas.bence@prolan.hu>
In-Reply-To: <20241128174316.3209354-1-csokas.bence@prolan.hu>
References: <20241128174316.3209354-1-csokas.bence@prolan.hu>
Subject: Re: [PATCH v3 0/2] spi: atmel-quadspi: Refactor to allow
 supporting SAMA7G5 O/QSPI
Message-Id: <173446006475.142278.5557207366372183006.b4-ty@kernel.org>
Date: Tue, 17 Dec 2024 18:27:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_102748_015140_7B97213B 
X-CRM114-Status: GOOD (  12.41  )
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
Cc: Varshini Rajendran <varshini.rajendran@microchip.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, 28 Nov 2024 18:43:13 +0100, Csókás, Bence wrote:
> This is based on Tudor Ambarus' submission from 2021, and my refactor
> of said sumbission from roughly a month ago.
> Link: https://lore.kernel.org/linux-spi/20211214133404.121739-1-tudor.ambarus@microchip.com/
> Link: https://lore.kernel.org/linux-spi/20241030084445.2438750-1-csokas.bence@prolan.hu/
> 
> This time, I submit both my refactor and the diff between it and the
> original submission, rebased on top of Linus' master, namely:
> commit 7d4050728c83 ("Merge tag 'vfs-6.13-rc1.fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs")
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] spi: atmel-quadspi: Create `atmel_qspi_ops` to support newer SoC families
      commit: c0a0203cf57963792d59b3e4317a1d07b73df42a
[2/2] spi: atmel-quadspi: Add support for sama7g5 QSPI
      commit: 5af42209a4d23adc9a09e59e586d1b47fef3cc86

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


