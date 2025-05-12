Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8643C3ABCD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 12:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DKwUVvc+iOKDYk1QWb3QJdUETVrnhqOOYR4QXnF7Ha8=; b=r2dmLq5yr7h1HHp9WKkRwOrsJL
	M5MfUQ7QOnTnY+KWep3Cr2PbNvCG9F2Rn3wr9bu+vsIrQnIetw5Okm0gA6MWfj+U1ch0PxwCLdKhn
	/3kQwqpnMY+H4htT5YYUGFeR4cfxF/DYHkCD955iXqXZJbvoqt5YiVGhqRN3Dr9FuysCg58uCTYA4
	U7sy5DblK7gFZvqGjyZ9TMbxUdHeUSzgaMhQEuZ2DL+xFFWbildNgj++60L9N3fme/L9Iwf5SLMrR
	5jdLokV4y5f1Bzt/TxSafYrs+DZ6dTl+OHni4d/4NZVRvyCUMWho3GySBrPiG0nWojfa+VdsaLytT
	BR/WfECA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uESXb-00000009QE4-2Aez;
	Mon, 12 May 2025 12:45:55 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERyO-00000009Laq-0Ndh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 12:09:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E92FBA4172B;
	Mon, 12 May 2025 12:09:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E736C4CEE7;
	Mon, 12 May 2025 12:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747051770;
	bh=xE99g38G05kWVWQVsEMeTHQ9yIJhHcnUagPODqbgZOg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RGOHXBEyhlL/RenWdnEwRHp4GPMF3l/O7Myx9N6q/RAyYvnDMHr8sQI2RJI442eAD
	 zElNcSxvAYgxHpdDUiZqLoE1Ym+qXiAlCvIugJeCGqXhzXGfn/bcIXAuHdW5dJL8+s
	 npsLsnrHI29OzhIwCAh0EEuRd+doMgd33N80EHT52lX5QBApwHrr77yInbLITnt8VC
	 304GObjTuHaR62aYAc08rfb9dmlWwBVeIuohv2A2DInmB7v6is4GxdSXnBsBm/U3my
	 yuZnC69785WoPNilRc8RMyv25iVqQGbd8IjrbtFl3iKq49YHw+BOXeQAYqaCtK5Yr/
	 MxWp8lP1iAhgw==
From: Mark Brown <broonie@kernel.org>
To: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Varshini Rajendran <varshini.rajendran@microchip.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, linux-spi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Danilo Krummrich <dakr@kernel.org>, Alexander Dahl <ada@thorsis.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20250327195928.680771-2-csokas.bence@prolan.hu>
References: <20250327195928.680771-2-csokas.bence@prolan.hu>
Subject: Re: [PATCH v6 0/2] Add more devm_ functions to fix PM imbalance in
 spi/atmel-quadspi.c
Message-Id: <174705176600.71095.8384606721205945217.b4-ty@kernel.org>
Date: Mon, 12 May 2025 21:09:26 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c25d1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_050932_192944_141F87BD 
X-CRM114-Status: GOOD (  14.94  )
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

On Thu, 27 Mar 2025 20:59:25 +0100, Bence Csókás wrote:
> The probe() function of the atmel-quadspi driver got quite convoluted,
> especially since the addition of SAMA7G5 support, that was forward-ported
> from an older vendor kernel. During the port, a bug was introduced, where
> the PM get() and put() calls were imbalanced. To alleivate this - and
> similar problems in the future - an effort was made to migrate as many
> functions as possible, to their devm_ managed counterparts. The few
> functions, which did not yet have a devm_ variant, are added in patch 1 of
> this series. Patch 2 then uses these APIs to fix the probe() function.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] pm: runtime: Add new devm functions
      (no commit info)
[2/2] spi: atmel-quadspi: Fix unbalanced pm_runtime by using devm_ API
      commit: 8856eafcc05ecf54d6dd2b6c67804fefd276472c

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


