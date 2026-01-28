Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C03CD25B59
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 13:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=97x7WwgT6x+N33UvCKr23GCP4mZ80klZJKZvCsojamY=; b=CxFmCghc+NU4dh5LTShavJVsUB
	2Y2h0h8tKjoKMGoLnA9cqo+mlJzxfXNW3XN0CPlj3Y2IlYwPdPySuPD6HENOkumHoxaidi/IPifwc
	N3M7h0oquSSTuNhNKjFM3wfnqHYHm402FW5xEh3chqmdqmVr+tGrJWQLWJShxBLBucf+6EODyyVSe
	WHrtl9HBYvdrkoQ9cImUXj2c4PRHeMsgIv7njkk9anALNEp4OAJRlIk5PBb02FeQNJgRaBPSM2o3X
	0usM0BS0esKM21Xo86B3/f33b8+EPRQpcfLKIMOo3pb2Bq4wZgleXXSmlXxJYU27W1lc1YrNNgwK5
	/kTnj1pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl5Fh-0000000G2Ir-3V6d;
	Wed, 28 Jan 2026 13:06:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl5Fd-0000000G2IB-3CYh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 13:06:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C1D043703;
	Wed, 28 Jan 2026 13:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14FC1C4CEF1;
	Wed, 28 Jan 2026 13:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769605588;
	bh=r1fZSr0IvTlpuB5HuW79n7uRT9PQV/E04hDgpki1sK4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=MCsYeiveMYPiB7ZQExQ9ogtkxyQWW3eRgEK86jrT+0LHPiEqT1AtRnyk2UbQ/9ip/
	 DAneno7wnREaFR8NlvLUh0VLtAGxu97Pxe8Docd99OuI9vdQfq78xTRLEwbTp18cWo
	 36kbAW6nCjAv49rcJS0/QhnlnhMKf6/GVCLX+hKGMiZOiF+bwlNMHwvhhd6lxP/YMM
	 5D7tVIGEs3B6QI+2q2VN2/q5Y2OBajeP+zdYZV6CU6dY5jlGXfhaCLrsXv+ZiFPnqi
	 hQcVMqc/qZhnv1ZUv6/3q/8arNGjjIyBXHS9RYx/ZB39v2LhA0Abdk/9x5PZlelNTE
	 lRMtuIXj5NEPQ==
From: Mark Brown <broonie@kernel.org>
To: clg@kaod.org, joel@jms.id.au, andrew@codeconstruct.com.au, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com, pmenzel@molgen.mpg.de, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
In-Reply-To: <20260120123005.1392071-1-chin-ting_kuo@aspeedtech.com>
References: <20260120123005.1392071-1-chin-ting_kuo@aspeedtech.com>
Subject: Re: [PATCH v3 0/2] spi: aspeed: Improve handling of shared SPI
 controllers
Message-Id: <176960558580.1648911.5452842376187241181.b4-ty@kernel.org>
Date: Wed, 28 Jan 2026 13:06:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_050629_823922_3314CAAA 
X-CRM114-Status: GOOD (  13.32  )
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

On Tue, 20 Jan 2026 20:30:03 +0800, Chin-Ting Kuo wrote:
> This patch series improves handling of SPI controllers that are
> shared by spi-mem devices and other SPI peripherals.
> 
> The primary goal of this series is to support non-spi-mem devices in
> the ASPEED FMC/SPI controller driver. It also addresses an issue in
> the spi-mem framework observed when different types of SPI devices
> operate concurrently on the same controller, ensuring that spi-mem
> operations are properly serialized.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] spi: spi-mem: Protect dirmap_create() with spi_mem_access_start/end
      commit: 53f826ff5e0e3ecb279862ca7cce1491b94bb017
[2/2] spi: aspeed: Add support for non-spi-mem devices
      commit: 04f7516ab70f7b82aae1d2830af2ee6f17f3fe98

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


