Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA1BD12D66
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 13:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nGxqwQ/3bgrZvDZ+ReCthykQjLNjqO1arYYlEZr2BxU=; b=2CF+E7iPBwyY37Wk3UaIYf+Uvn
	N0XblrbdmKmjQ141/JOegsY+RPCIdr+fT50N53olmsspInPEqTmmccKxs8Lual71TADYS8n9C2713
	Laax+Gh212czuB3ntmM8SwpSOyHUXgOhUdMVfGvezdVscHO5f76ArCLPxu2lIr7cyBA1HOtyGJlaO
	k8ZIFCpzQbFwtyrxutf7DHscHeKtzjzcLi5EXMzTOn24Jw4ry/JeacyrXOU4CEEvMH6l4lGHCkq8k
	lHUg+4NWSNirCVbNeB0RDEg4UbAbKBDkPPjAmq1VlDnALavAS6RRai5smJrJGJIa23X9ABjvsryel
	hUGW6Cgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBD3i-00000006re0-2GNd;
	Wed, 13 Nov 2024 13:05:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBD1u-00000006rQ7-2AsN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 13:03:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B0CD95C57B0;
	Wed, 13 Nov 2024 13:02:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CEDBC4CECF;
	Wed, 13 Nov 2024 13:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731503009;
	bh=3hSrEerVz63flbUMSNM5kNo4q1EzHTQJwl/k9YXWWXY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Oyn6Qk3cbXGXHOTIyYwF0JjkjWmA2gO5vSv5pD6Zb6sCBbFTXdht9wS6vqmEJy0kc
	 jovqjilanwp3ERL6LQn94WKNRoEGHOKcOTnI4cvj74SMlN7DYgYX7NfjTmsm36WCEA
	 Z0IWayIQ9JoIqhp1vuA+7YCM4JisPjeZfIF0B0iWLo+S1kxz2cW6m5gdz7ewSMVOVm
	 Dblbsl0nOklNcmy9hM9q81niWsP8RM6ghv9qAsIZDhE0sbwBJqhQFUv3c78XVmegtq
	 eOHvcnscCdq8gDnsjiF2gAhUQM7gqChgzemaBJEIErs742H0KCAXiS+xD5R+anCy/J
	 6vSileRfaUrmA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <ab85510f83fa901e44d5d563fe6e768054229bfe.1731398433.git.u.kleine-koenig@baylibre.com>
References: <ab85510f83fa901e44d5d563fe6e768054229bfe.1731398433.git.u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH] regulator: Switch back to struct
 platform_driver::remove()
Message-Id: <173150300581.429927.11116814842133511799.b4-ty@kernel.org>
Date: Wed, 13 Nov 2024 13:03:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-355e8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_050330_620715_E4462BCD 
X-CRM114-Status: GOOD (  13.58  )
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

On Tue, 12 Nov 2024 09:35:21 +0100, Uwe Kleine-König wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all platform drivers below drivers/regulator to use .remove(),
> with the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: Switch back to struct platform_driver::remove()
      commit: 1b55354745e276db38268f23865eb2c4eba5f59b

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


