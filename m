Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9551DC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 09:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cScYlwf09eDfsV/TfJvan7VzWx8u4OnQrIazqOe9x7o=; b=PjQ2q5vWSo2ouDXyC7nYI0XjL3
	d7ETzMQnBC/WFN7XB2M1txSX/b1Xb845QNmJjbev3js8ms6Af8gKjYezZaJqmr3U43u0zHe8Q0rJv
	eRbNt2EdF4TMdZ9hsbp10eftahKrOVQGNARZLhsRserwCIsk17pvV6l3bzBFNRtGbVWwOeqB/nskz
	0NZx7Q6VgLL1dKHoLRlc+KAd54Y/54ocX9ygSze6p1q/9Zk3b8DZCiQKYhfPW5dTqbIL56Bp6+587
	DzmGkw9Bcdt3qcP0dtJ3Og7/bkqpA2w/2C8h0VsKMVb8hcof0+id5PbNuebjwEz45FQcz9QIX82Vl
	Us1LhKFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmGv-0000000Bxku-2Sdv;
	Tue, 13 May 2025 09:50:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmE7-0000000Bwyb-3QF4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 09:47:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C20C05C66E3;
	Tue, 13 May 2025 09:44:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5626C4CEE4;
	Tue, 13 May 2025 09:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747129626;
	bh=b7siKQi24yevBo11SRzBrrvRK89vCTeLTpr1jo1HuBs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kJvUol5df8hj1/dTrJlGoIDLbE7H2VgKjjKv0wKxLp9n9IxF2eIVxGFzC1PyH3Kpq
	 nZ/AjmIi8OSAny/Y4xXMsbjSSogyjmSsxENhmKEgrRNgB99t4ITDkhxmKo+Jdy6yv1
	 cEGr5EsGUM1i2LZLfmeXqGjWlP9GrAp8vIDCJJsCBoi3tinR6kpmvlGwWHOQks5h/T
	 ClfFT1c0ZErz/8tkDffde9EjrjhA37RvfyXKRhMQgy6Xr5HiFAsDFnU5kiWyPcqtWb
	 sfK7qkGMR6tXG5nz9AE/OZoS9xnmYccjJWIxjR+I1NGvqJaSDJ4eT+KzyEIGMR0/Al
	 3K8BHg44+4RyA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nishanth Menon <nm@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250512185727.2907411-1-nm@ti.com>
References: <20250512185727.2907411-1-nm@ti.com>
Subject: Re: [PATCH] regulator: gpio: Use dev_err_probe
Message-Id: <174712962358.91325.1280177002395058293.b4-ty@kernel.org>
Date: Tue, 13 May 2025 11:47:03 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_024707_987653_308A3363 
X-CRM114-Status: GOOD (  12.15  )
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

On Mon, 12 May 2025 13:57:27 -0500, Nishanth Menon wrote:
> During probe the gpio driver may not yet be available. Use
> dev_err_probe to provide just the pertinent log.
> 
> Since dev_err_probe takes care of reporting the error value,
> drop the redundant ret variable while at it.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: gpio: Use dev_err_probe
      commit: cad915e4515790d2e66525a86a166e7ce81e3055

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


