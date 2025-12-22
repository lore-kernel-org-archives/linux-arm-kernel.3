Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED5DE67806
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 17:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WnRQ1N14lTvLUDG5zNQUTA3/Bs7JBM8b/hcwh989NRY=; b=vXVr4CvhlfHY0Db594Nkfny2xn
	WyrDF+j3HR0+GloLotQVYXVHyu0vfTpxsq/ypcu1fKz3GHSmETnSF/BXt02t2w16ZLh+MYaZx/Chj
	Ei+ON2CAw7xTmuuJ+z8yqjCiT5wSXdUuTFN3xyVlwfaqf5QMHF3AAfYxRE6Ky+nl2X8oXcoPjt1wO
	6Qs75vJRUBYwU8/8/Zf3W7u7wanDXTwsJ8uuhpgoiJnF1Gnf1Aes+H1BxN7Xi7P7sqFvH4LVKvFrR
	Ts2hMoxE1hcGi+IvQiG1iQE0rRYIUizs99yaACy0nvMmmNcfYFOaIccTKm6JXmGiapQYnAoZU9qif
	BtGD0ncA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXjXi-0000000E12J-1C9t;
	Mon, 22 Dec 2025 17:17:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXjXg-0000000E11y-0E0F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 17:17:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C40A642DE7;
	Mon, 22 Dec 2025 17:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 828EBC4CEF1;
	Mon, 22 Dec 2025 17:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766423874;
	bh=QOPog1YfYI90StUev6z08ROZmYBb9PrYSSSaMZnFZ+s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jFINYE8KYwvcfYuyjdl/b6hv5LyI8pyAHMGb7wjXwv/a2jN45PELDtVbvB+cO2/7S
	 bZ3eP+b2YeSUFs0Jt3pHgrnbsxAbPLcIxN0hh+z0lKoDRAKdz2a+ogept/fiSnrRsO
	 FU46Wxei7kFvFOTLekv0h1NP1yg4zb5PfSZLRCqR7xk8dWRWuv586n/ghKB0pTHT/z
	 du8d+kNpLy7MrrwML6FCqqsXp0rpSEg12CzmeED88cUyA9Go2WbQfNWg3MPqB6M9Mn
	 mjSvThDqbi1sXGadFMVVy0RE+nOJQuRI04lkj3+9EAqSG4UAVfa3aKdnvr19fYKw//
	 BYGUtY+EDFOag==
From: Mark Brown <broonie@kernel.org>
To: Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251221110513.1850535-1-wens@kernel.org>
References: <20251221110513.1850535-1-wens@kernel.org>
Subject: Re: (subset) [PATCH 0/4] arm64: allwinner: a523: Support SPI
 controllers
Message-Id: <176642387228.913099.2681822678465821683.b4-ty@kernel.org>
Date: Mon, 22 Dec 2025 17:17:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_091756_118064_68FA9CBB 
X-CRM114-Status: GOOD (  15.33  )
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

On Sun, 21 Dec 2025 19:05:07 +0800, Chen-Yu Tsai wrote:
> This series adds support for the SPI controllers found in the Allwinner
> A523 SoC family. The SPI controller is almost the same as the ones in
> previous generations, except that it moved the "RX buffer count"
> register field to a separate register, and that register now reports
> the total count for RX buffer and FIFO.
> 
> In practice the driver has never cared about the buffer count, but if
> any implementation were to use it, this counts as a non-backward
> compatible change.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/4] spi: dt-bindings: sun6i: Add compatibles for A523's SPI controllers
      commit: e0c8755d44eb85afd40100586076c3dc4b62ee3b
[2/4] spi: sun6i: Support A523's SPI controllers
      commit: c81f30bde5b0449d9d82d31a66f0ffd608e610b5

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


