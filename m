Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80505606A335
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 22:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UTBhylqT;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BXwTaWeg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=H7clgMueEvSON7kclP3SNzqVfpNypygmTsnUrvEaevY=; b=UTBhylqTdA94R4
	PVlSwM+acSh9g7xVf0suXLC8AFEoJ2fwLxGT6nSPupx96NNH/0dzHCSKKd4xt+HxHXp1Mjh28Lrai
	mfFZPrZF8g9eYNSU2MJps9DOJNlWqiEq1A74Ugs93IICTEPlpTEkSoZbu0ikJg3t4aA7u4xc4G7mk
	zrjYtIJ3FQioqLgz/eLoJiX36tyMDhYXXimYCBV/XdiSH7ECGJUfZyKo/NfHwxVUBWpdk36t51jzp
	03pjxEdEGET1g523NkrqocEPwnA34xpSXL3cQIc57DqnCye1o37i77fzaHNHyUJnBxlQc6DNxWRV+
	oORR8fA8+QTG55AG2tQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO0Ln-00000000Xhi-29KQ;
	Mon, 02 Nov 2026 22:17:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO0Lf-00000000XfG-2oso;
	Mon, 02 Nov 2026 22:17:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6ED5B406A3;
	Mon,  2 Nov 2026 22:17:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 370FD1F00A16;
	Mon,  2 Nov 2026 22:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793657871;
	bh=H7clgMueEvSON7kclP3SNzqVfpNypygmTsnUrvEaevY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BXwTaWegeUmc6D9rkHYF0GPvgmnk1UrbsKGzLd9lNblbGkLtlbT0ouP3Gxj/49Xsm
	 FMjsC+xe7FXIQS5QqJhIw/c37vOQm8RWxiR1F+MLwUdA2gB/Xex/QOVWoP9j+uO4UI
	 CthQ0JTG/2j6D5XMa3uLyx40BrSdecnwsDYDJAjZZl4CRVT2XXZVpTzPdBb4XJ77JJ
	 Av3kaKJXwvssJCirFrsD+l7Hm7IvIJhtZNry+xd0gkQC/yH2rWxyks38dOik50w6WZ
	 dlueEA+0nkXBgMaqKUWRF1ThNVgL165/OIDSis5OR8nPMW8LH5qxQi4E/GCLquUaQI
	 UnLi9QnPZiv/A==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id DEF10241313D;
	Mon, 02 Nov 2026 22:17:48 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 =?utf-8?q?GIBEOM_LEE_=28=EC=9D=B4=EA=B8=B0=EB=B2=94=29?= <rtx4060@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20261101164405.1743177-1-rtx4060@gmail.com>
References: <20261101164405.1743177-1-rtx4060@gmail.com>
Subject: Re: [PATCH 0/2] regulator: mt6363: Fix the regmap value width and
 the VSRAM LDO registers
Message-Id: <179364206047.2092401.8748434363467628177.b4-ty@b4>
Date: Mon, 02 Nov 2026 17:54:20 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1723; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/7y45hq/hNgDZqvVd6ZLv1SrHpttQmcu6uNDHAt1cFU=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJe8vBIP7r9R25FtrOdfNfvKvEf4msOz77R57Rz+dEnG
 36/nxC9rKOUhUGMi0FWTJElLov7ZX3J6zV8Bxe2wcxhZQIZwsDFKQAT2dbI8Icr8gpPlOHdqAXT
 pn64/3lPMqvQr1DHk1vSVOT2sizZy/iIkWH7wVmFam8cGidGsGY08H7K3r6oT1P9aMnu91+LNxu
 dL+cGAA==
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

On Mon, 02 Nov 2026 01:44:02 +0900, GIBEOM LEE (이기범) wrote:
> regulator: mt6363: Fix the regmap value width and the VSRAM LDO registers
> 
> These patches fix two problems in the MT6363 regulator driver that can be
> seen from the code. They are on top of regulator for-next, where the driver
> is the same as in master and v7.2.12.
> 
> Patch 1: the registers have 8 bits but the regmap has 16-bit values, so
> every write also writes the next register. For example, disabling one of
> VS2 and VBUCK1-7 also disables VS1, VS3 and VSRAM_{DIGRF,MDFE,MODEM}. The
> MT6373 driver on the list has 16-bit values too, so its next version will
> want the same change.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.4

Thanks!

[2/2] regulator: mt6363: Fix the registers of the VSRAM CPU and APU LDOs
      https://git.kernel.org/broonie/regulator/c/8aed8b66751e

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


