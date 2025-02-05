Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B470C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 12:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6DAfenEh2oeVyGRusnPXbI/ETiSiF3cf7NXqI7PU9hM=; b=pBUclK/tAnBZRqdVM/AF5kzsti
	JOXsv4MYA2sVG/T3feUHxRaOyRvhVrPnNvsG78xdjrvg2jpEIklH1IDTfE40dXgBimyn4xXoWG9rG
	HbJLPOBXEyEC5bS3Jv3P1xGtAnqfDwFwF6LO6fZzIFHgnt+zoSJvn7obmWQ+21QHKLfGZnyQmJdac
	kF+LYoFJWeoHW+oLQvLa1kWAPAOoexqTCsgQC8AKzidy2aNp167zzJfEcyZlFxC0ceaI7H3xysCyv
	HP1v3wa5v4tQvrBusChFJkAZKtG39kYGDzleS3iT4ZmzgTbzZoQcOuc2NYP7yp1+38lEHZMD2yHty
	cCU2gEdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfeur-00000003IGF-1bAJ;
	Wed, 05 Feb 2025 12:54:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfels-00000003GDr-2urf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 12:44:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D6B60A43299;
	Wed,  5 Feb 2025 12:43:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 217F1C4CEE3;
	Wed,  5 Feb 2025 12:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738759487;
	bh=WjOWuwc31YAtptEAw9A+7e2wI1Rg1m7tf432kIXNr2M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=L/2y+5Pb3U2QLXrnI6glT2NEJ3qTFmWNgyGPbk5I8w8Z6TPjkZQAssidNpDtTlhVA
	 DSxHZbnAyukWeIx+QJbBAEHaPrTjtwP6pnO2WdLKOzJXa2++nmNcAwKqGZjgmY8Rrm
	 jf0hgtDcjgbiC9h9DV/UrIgeH+dR4qXMnUdxSOCgrPC4oVIDR7+OvrIJpYp68YNXeD
	 TyzP/dO0xBERzxvw5bbQ0QYQzBEiRxqDUwYnsTSTtc5PWQsLmh4nsdlbiJNjPQW4/E
	 WFPYtb9XLM4H7jyCaq9Yob6ewPLGmdivdovAU9WnsXm8y10yOVrbJXl/rj5POPLsVJ
	 TFL74Q2GfS6Lw==
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Mark Lord <mlord@pobox.com>
In-Reply-To: <20250204174506.149978-1-andriy.shevchenko@linux.intel.com>
References: <20250204174506.149978-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] spi: pxa2xx: Fix regression when toggling chip
 select on LPSS devices
Message-Id: <173875948587.32625.7550036600044619684.b4-ty@kernel.org>
Date: Wed, 05 Feb 2025 12:44:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_044448_811919_D7F6F012 
X-CRM114-Status: GOOD (  12.25  )
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

On Tue, 04 Feb 2025 19:45:06 +0200, Andy Shevchenko wrote:
> The commit 78b435c9044a ("spi: pxa2xx: Introduce __lpss_ssp_update_priv()
> helper") broke speaker output on my ASUS UX5304MA laptop. The problem is
> in inverted value that got written in the private register.
> 
> Simple bug, simple fix.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: pxa2xx: Fix regression when toggling chip select on LPSS devices
      commit: aff2355d260e47e780cd96af127beaab18a664b1

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


