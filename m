Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BBA606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 22:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ua9dlSpD;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fP4sPoiz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Brz96hdrz7JmspNQJhcUGehhAL3Axu9lJW4DP1KRAJU=; b=Ua9dlSpDCGcGBF
	O7ULvW4w57swPbhlYR0dNK7cQMoCbZq/E0JWmpOVa4IH5wd7SXVQ4gusORXjWTMKoP57cOQrcIErv
	yHNzFsZOdtMd6Mcd29xfZsd5B6X5po/MoQ4tOxsUmIaUzZLXYZPz2h11PAstHKeCfF2QL4lvmkkTg
	HYdviYNhOfuztHgvNmHRwJYgJ6BE96lGOA4Clvj5G8vujUmzVsF5WobmMxhMMyYO15Oom1/bNbZoo
	5jW+tTlWzj+9fydFv3fZjPewRs6wqzilkcvtNq/rt4DZmvZlwyov21hvtKiEw+QLt60OG1iIqFEWe
	CgOaSEfEly3bzn+BQmjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO0Lj-00000000XgK-0PoF;
	Mon, 02 Nov 2026 22:17:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO0Le-00000000Xf0-3peP;
	Mon, 02 Nov 2026 22:17:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D1A86601F0;
	Mon,  2 Nov 2026 22:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E1341F00A16;
	Mon,  2 Nov 2026 22:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793657869;
	bh=Brz96hdrz7JmspNQJhcUGehhAL3Axu9lJW4DP1KRAJU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fP4sPoizrBM/sWiBFzkBJYNAQTHXV/XetlGDejSnEpjVVomy3GD6vhS/mWLIC8a4e
	 C2E3Kex7mvSHZrkiLLHFJbjDkKik4t7rFvjOH5hAhE1JL5kCxfX9B1Tg0FsjmjV25j
	 6jCoOoiD7NmbJjP4kkp1XEbmFeg45bl+M6YW7B0JbjYcN4keJNL1u7L7tcmvo0EclX
	 WBvOpazth8Im7O8BYEBGJ34zACJPCspJ0gaoQRmwbra4e5BuHd4pzIphYjmixcvsQX
	 PiPkkB+5G8AXOqj/H+edwPLtMEdejt/WE1YJwUjvDc0ipWKIOCpD/8GFDAQ5GT70US
	 EbR8cKlaqK1IQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 0F59F24130FA;
	Mon, 02 Nov 2026 22:17:47 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?GIBEOM_LEE_=28=EC=9D=B4=EA=B8=B0=EB=B2=94=29?= <rtx4060@gmail.com>
In-Reply-To: <20261102-rgp-67-mt6363-regulator-fixes-v1-0-420789a3113e@baylibre.com>
References: <20261102-rgp-67-mt6363-regulator-fixes-v1-0-420789a3113e@baylibre.com>
Subject: Re: [PATCH 0/2] regulator: mt6363: Fix register access and VEMC
 voltage handling
Message-Id: <179364259247.2092401.12751625536535103016.b4-ty@b4>
Date: Mon, 02 Nov 2026 18:03:12 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1484; i=broonie@kernel.org;
 h=from:subject:message-id; bh=5Lsk5k8uWhWpSMVkEic8ZEeUQMXxLY0HlzaMYJ4qUm4=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJe8rDcubZ4o4eUXPhf5/9GAZYSTNNmXzkqNvFO7QI9P
 /Y/K2TcOkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjARuV0M/6Puaa9YEx8bvjwl
 gTPpytPzv+LSBFY1Bgpv7krxTHbiYWFkeCJ5s8P5ZeMFqXcrTZ489+FMelk6IWhhy4/Qk4ZaH6T
 5OAE=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 02 Nov 2026 15:54:16 +0000, Alexandre Mergnat wrote:
> regulator: mt6363: Fix register access and VEMC voltage handling
> 
> Testing the MT6363 regulator driver showed:
>  - the VEMC (UFS VCC) voltage reported as 1.25 V while the PMIC is
>    programmed to 2.55 V
>  - regmap debugfs showing each register merged with the next one
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.4

Thanks!

[1/2] regulator: mt6363: Use 8-bit register values
      https://git.kernel.org/broonie/regulator/c/7318d3833067
[2/2] regulator: mt6363: Fix VEMC voltage selection
      https://git.kernel.org/broonie/regulator/c/a8d72f246edb

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


