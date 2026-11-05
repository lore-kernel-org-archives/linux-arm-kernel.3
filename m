Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C37606EA22
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1wq2bH3R;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VlzrjAG6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uaayokCbVv4A1cXEEvxZH+uDqBX0dAowaGyg2mb9XGE=; b=1wq2bH3RZ/CbrW
	98zpGEyK1VwGgXFg2jYTA6CNgCFjZo0pk5miBFV1qOH5f9o2FkV/xRbK8d23HVpg2cTUcuxRmxYYI
	xa/bD+e6exA7ROibLQAr4BanpyGRYU16QozAn5L13ETHiWTm3MIUZUYGUdzGsIP4K1UiIx/sTCyfH
	bVd5s9/mXUujcz+9uMWSliR83AhOYoizAsAnSx7IltDBogJaiob75y0mxBeq5kzwO5b/6sxfkRdDr
	4IXLcUe8CwE6fhsCv7e1vxn3vhAYesSYhxq3LBeE2fwzNHTPLZdKs4DFTpSzkPGnRy0TpP2nY9oQO
	epxtycACk1DqFzUha9jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvxo-00000008lU6-1eOG;
	Thu, 05 Nov 2026 11:49:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvxn-00000008lTK-1UrG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:49:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DCFCF41B1C;
	Thu,  5 Nov 2026 11:49:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3DD61F00919;
	Thu,  5 Nov 2026 11:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793879342;
	bh=uaayokCbVv4A1cXEEvxZH+uDqBX0dAowaGyg2mb9XGE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=VlzrjAG6sSMU6/B47taid7cNtATcwGb/YZBNLb0kTEkIovnLvfxXJZ5AaFkpyQAWR
	 ERalTfZ7mReUasMFW32jlz8YwIh4pLflfSXW9g2QmhqoLtn9cUnvSX3Vx+NYy0/qsN
	 jwXijCNswfFXXAy7UA3K3HlC2dMXrHTXiJUii+IIqR7rn/QEVcE+EnxyQKUtYnUxCd
	 ADYMeWP4s+/BxFUEmy3y2cJog62v4I2dVnEhLXHIcpToQihMLSXs1A752aZ681njzv
	 OY/B9S7IFjn5xOGebzsDV9Phw+jw4fdS59ZL3ueglFJtyVDRgqFownDiEeKJ5750Zc
	 IHzEnFgOIgVGg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id E4842272EB49;
	Thu, 05 Nov 2026 11:49:00 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261104113228.1634005-1-peng.fan@oss.nxp.com>
References: <20261104113228.1634005-1-peng.fan@oss.nxp.com>
Subject: Re: [PATCH] ASoC: imx-audmux: Convert to subsys_platform_driver()
Message-Id: <179384086702.2186205.11117953235004783694.b4-ty@b4>
Date: Thu, 05 Nov 2026 01:07:47 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1126; i=broonie@kernel.org;
 h=from:subject:message-id; bh=dsgrxpy2KP6cvgFm7+hbIpNnopwMFJSlB/+wS/jcktA=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLe5OqEc28Rqo8MWMv8aadtytRZQvO/HDeev/z8jnn3z
 hW9byid0FHKwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJcDQx/FMMedHTplIk+11d
 Sycw7LCUhuT0Wu/v4u5ZD17plMzfyc7wT7/S+ehC2XM6DD4T1jpU+zt3fnJ82/T7rM0zkR/htzp
 k+QE=
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 04 Nov 2026 19:32:28 +0800, Peng Fan (OSS) wrote:
> ASoC: imx-audmux: Convert to subsys_platform_driver()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: imx-audmux: Convert to subsys_platform_driver()
      https://git.kernel.org/broonie/sound/c/aa56acd47629

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


