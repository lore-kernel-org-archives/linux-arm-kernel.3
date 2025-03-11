Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5490DC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 17:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KVoxeLQkfzwKnTHV3TyhWKqb/0b4HCsW0fAznoR2qHE=; b=HcSjGm7YRrDHh4kIaCP+42dvJs
	f5HNSjVZun4OhvXyiQn8oUn4Hch1fQjMzzGyX+gQvjphPQIhe8JEq//1cd94O4yc9nJEGh3neRuWI
	UdLZ3dmZ7hmxAGti4RD8AIWVU/2JItBzDuaKtfEc+dXVtqxwsLQl4fptaYJuhXT01S1BobiFxYRbW
	N/t9hokhdjD1I7QEZ4IYrnBR9kBpAkhmxaq29DBTW5yX18ngV1izOh/QpWx4bgHSgya/1hTrecg0n
	m4K2HTYHt8tW7hn9ahbNDz7Aq54Hu5gjsWPpud7qiM2wFWhCRvWSnXgf6K8ErXyY9G6gC3O57/OWX
	Id7bfKzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3Nt-00000006SLe-0rfZ;
	Tue, 11 Mar 2025 17:27:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3EP-00000006QwO-45XK;
	Tue, 11 Mar 2025 17:17:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 778BCA46076;
	Tue, 11 Mar 2025 17:11:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91835C4CEEA;
	Tue, 11 Mar 2025 17:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741713448;
	bh=qymAbbIdLchqAtQBBL+pqPrr3X7OBh13PkUPlVUStBs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Y+KELLa+knvBq8Y6mOU+ZaIu7WLEGPkUTLOIifEoLx07A7YpymGP0EZ6RUaaNcqCo
	 3k856Xxx9mvWBtD/kW1hpH8z5UicEuGryGX30wmmSHiELQpagjfqaS1agU6u+Ormzd
	 H13ylecD0RyKi1f6lDHHyTw5SNprB9ReQRFALFQOf50T5hCqx8I/BLFZvKoOPgiFWb
	 P9ZsWCFH5nLDGwZAdVzP6/CgAlYeJxf09jwL55/v2cRksfU8G5OAxxeW+m/CsF2CxO
	 rtF6kcxMyfgI0v5VfXCYgJEublnndzXB34xpUffIw0lnOZfkJyTfhcCp14pIApgvAE
	 Pp7+Yg2hJJ1MA==
From: Mark Brown <broonie@kernel.org>
To: Leilk Liu <leilk.liu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 fparent@baylibre.com
In-Reply-To: <20250304024045.7788-1-leilk.liu@mediatek.com>
References: <20250304024045.7788-1-leilk.liu@mediatek.com>
Subject: Re: [PATCH v2] spi: mt65xx: add PM QoS support
Message-Id: <174171344631.214660.9058567324727633834.b4-ty@kernel.org>
Date: Tue, 11 Mar 2025 17:17:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_101730_088556_C43D01DB 
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

On Tue, 04 Mar 2025 10:37:15 +0800, Leilk Liu wrote:
> Enable Quality of Service(QoS) support to speed up interrupt service
> routine handle. Sometimes, a gic interrupt will be generated after
> SPI transmission, but at this time the CPU is in an idle state and the
> processing handler will be very slow. It takes time to exit the idle state
> and then become active. This will cause the SPI handler to execute slowly
> and cause SPI transfer timeouts.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: mt65xx: add PM QoS support
      commit: 632556d5799a2b3e87dd5594a59245523b39cf31

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


