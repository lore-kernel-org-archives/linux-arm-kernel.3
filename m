Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B83E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 18:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GKJwopB3ZlIK1miBEB516Pm8gFviaZQThjhGlVkxkB4=; b=DE9rN8xWAX6D3R
	fxxiz9UsMPWN7v63YwEGoneQVZ04LDgyqhWAdBcqVitaBpo+t1nyL+cMCP/pGygpVamwsiBtHqhN1
	CzXbEqykjiVCqqaGZQ0jEMg3+ayauR/TQZMRew+EZKeKfreUsccUV8lxml2xf6X26nDJ8jiEIVknl
	H67799WCyT9cxO6AqHImK24A0MtxUzjmS95B8ewSOJiytQMNpNYOluywOjprXJUJiTx/naHtF84/q
	uVH5kyulsEubtvUPWdDICv/t+FwMDtsrXTZ/Q7kwjBZ3d8O0wqMXxSHvu5YLmocV9z1ctg0tlfuAF
	mc2/RZdbZfPFdlCoDT8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNyle-0000000HR8Q-2jPP;
	Wed, 18 Dec 2024 18:27:30 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNyjt-0000000HQtJ-0Se5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 18:25:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C38A3A417C2;
	Wed, 18 Dec 2024 18:23:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30FD4C4CECD;
	Wed, 18 Dec 2024 18:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734546340;
	bh=EYJF+tm2lF/oaIwevVc+IiA2NmlN2h9331fQsltMHzU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qX0NZeSK9iKXrS1cNnMemJ0f1PEFGMHpu4hHSQnYGq9ZGtjTo0KGbvOtUO7B8tNF5
	 FdRaBCaXDCKgO0aPW2cYig+9gE0A3uwGMMrvInWHKlTxPY3WM8rj1HMlli0XStyCT4
	 WtC8yWmTvPNM3a8nH8tWdT4Eoa4pDSvJbOfzlOBB50IQMGDQTf0GjPQff6J/H8ZI4Q
	 l7Xbr3scuNr7R9E3eZ5c8VTPtXeoUj6n9d2rNBOzquvM5llhYqqVJbXJVMs0Am2WKG
	 LLZi0Tt2R7IPdEPsYza2D1SRJHRl1vYa1MBlSTmcxU4EjFIvAaPSDtLzDP0vA+/fQ6
	 DjO+XOaFAG1JA==
From: Mark Brown <broonie@kernel.org>
To: Varshini Rajendran <varshini.rajendran@microchip.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, linux-spi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
In-Reply-To: <20241218151754.365519-1-csokas.bence@prolan.hu>
References: <20241218151754.365519-1-csokas.bence@prolan.hu>
Subject: Re: [PATCH] spi: atmel-quadspi: Factor out switching to Serial
 Memory Mode to function
Message-Id: <173454633792.186813.10395351752792939671.b4-ty@kernel.org>
Date: Wed, 18 Dec 2024 18:25:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_102541_267564_5E3FA276 
X-CRM114-Status: GOOD (  14.07  )
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
Cc: Alexander Dahl <ada@thorsis.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, 18 Dec 2024 16:17:54 +0100, Bence Csókás wrote:
> SAMA7G5 support (that was forward-ported from v6.1) re-introduced
> a bug that was fixed in v6.12, thankfully only in the codepath of
> the new SoC. But to prevent similar mistakes in the future, we
> split out the offending code to a function, and use this, fixed
> version everywhere.
> 
> To facilitate this, support function `atmel_qspi_update_config()`
> also had to be moved upwards. For best viewing experience, use
> `--color-moved-ws="allow-indentation-change" --color-moved`.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: atmel-quadspi: Factor out switching to Serial Memory Mode to function
      commit: f663898d047a7a0a04d30732b1405ee007fdd243

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


