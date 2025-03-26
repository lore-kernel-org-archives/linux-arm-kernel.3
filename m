Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7934C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 16:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NzP0eeFp1LfZ1L1A2MNFxCxtBideIG75/1jj8HWEMz8=; b=SMXQW4aePoweZFlpwnw+JnU2bH
	2YZKPmWmA47DVpAxwQQ3nHnlgN5AwCOSWxb9H9oBBfyIQlafUTfkz4c77r9xn6McjkYBOjKrco4TA
	exXPMbsDmLguWEfDwcySy708XpTMDEdJhP/e/FyXTDLBUwQEF7uSSBvc87s7WXH5wVGu4Es2aFy1X
	rLVq7hXdMcaIhMd6LNLXPLbzzv8B9tpOLKIxKleF1zAUuWp0MrGv801Go2tJ92yFZr8Wss+X533gd
	bWbouOyqAp4MDCgYoYbNm6zYW0YYebjXVGx16Fp+2ZPeetyJOwym77oGIPROP55ov3Hu4zaoHP1bO
	4qLYwNsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txTX8-000000090EI-3s9l;
	Wed, 26 Mar 2025 16:23:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txTVO-00000009031-2bcW;
	Wed, 26 Mar 2025 16:21:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 61499439F1;
	Wed, 26 Mar 2025 16:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84220C4CEE2;
	Wed, 26 Mar 2025 16:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743006085;
	bh=sPx3Y91Z7tpwBuskM40VRn2kEtPE/y6Xzm7p+NjzGa8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=htEos10urfSV+X8uX5tWSc4HUqZgPAK8FzVoZ3PmYCKoDW1YLttGbPWRlBl+a6eRT
	 L+AXESZ5QjgUFAwqR408S8811iedaRK1q5NKu8bSPhcGEXk5su6gDmVsMwWFCjP1Su
	 pvZFnUnVp+zadg9NLIrMneAoq6Agxxgu6hOV5RP7EFuxP82H6rnVGs0lhnudLgEHSQ
	 8FLs/U6/VltSWsVuQ5PJiPew7e6F2AXDd8Sos+t9LFbdlLcFXUeVTLiq3R1SDCVU7J
	 o7bYqXG2+wq+pXfEdkbSXqv1jZrdw5cc5ArL/lVPHZrSXjliqX1JvZTTEGAJEWqB8c
	 +sLtAVbORcNSA==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Luis de Arquer <ldearquer@gmail.com>
Cc: heiko@sntech.de, linux-arm-kernel@lists.infradead.org, 
 Robin Murphy <robin.murphy@arm.com>, luis.dearquer@inertim.com
In-Reply-To: <365ccddfba110549202b3520f4401a6a936e82a8.camel@gmail.com>
References: <365ccddfba110549202b3520f4401a6a936e82a8.camel@gmail.com>
Subject: Re: [PATCH] spi-rockchip: Fix register out of bounds access
Message-Id: <174300608311.118781.4443874956794238056.b4-ty@kernel.org>
Date: Wed, 26 Mar 2025 16:21:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_092126_689414_BCFB8574 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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

On Fri, 21 Mar 2025 13:57:53 +0100, Luis de Arquer wrote:
> Do not write native chip select stuff for GPIO chip selects.
> GPIOs can be numbered much higher than native CS.
> Also, it makes no sense.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi-rockchip: Fix register out of bounds access
      commit: 7a874e8b54ea21094f7fd2d428b164394c6cb316

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


