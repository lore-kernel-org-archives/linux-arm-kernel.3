Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BA6606A332
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 00:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1kVME8Zz;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HgI+KYN9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3P0Hp+F33aoisJ9L2IvNEQy8ShY87tikSrvoj3cvgQI=; b=1kVME8ZzMXBhAm
	pANbdy1TQfeKQ4MLwkBOX7GZoXDumVKNhb16OgIjTlx20vHp5zPRuQoVSVD3kJtCRnkDbllHsVX5G
	Cg0Z/6qkx/nlZLGEnlIBgGDIbcudykF06J2eJWMMzJ5YzgMRN5JSNX4jj4YJtNYUfJXOdThe6xrz8
	f5E7pDB6VUg6QB1QJxPqmYEkhOYYtbZ9RY5ACRwPczz5LUR/IWBWcyqy2xBMmOb+EHgIdu6HqwGxg
	SR7OwCjPRw1iameu2Ulx+wCt8ijfI3K96QUmWtk+XLqtlhkybefz+T26NSZqO80LASQu7+vyreCYI
	QvCJW33FWwr/dj+0k5qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMDk5-000000085GL-0zBD;
	Thu, 29 Oct 2026 00:11:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMDk4-000000085G2-0U6H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 00:11:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D990243A18;
	Thu, 29 Oct 2026 00:11:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A51E1F01825;
	Thu, 29 Oct 2026 00:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793232699;
	bh=3P0Hp+F33aoisJ9L2IvNEQy8ShY87tikSrvoj3cvgQI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=HgI+KYN9iy6ql6cjO0JaTmBBW+Thv5+iKbbY0zHUoPcqV6I3SuII1pdW0RtYKloWK
	 4oc4sU7VsBlzi8jB9IOuqvHTL2/9rkzk7m0PEcYMPQ6XSlg5OpDPleO+Jq/29cxGbO
	 bIK1EYtRU1UuVGraVFnjRvEpyP+EHmQRsPEpLOjhR24zryHHC0tkbQbMaV0R/whhO4
	 ZbnsFGULcyuzOYX3NHJTZd2aTfA2Izt3YlIACx1OqFY9uvczKlxz1C7SOtROzYr8Tg
	 uuMpMKF/OHnn5anRSup36kkbnkWJWT3wySJkwlc8Oo1Fj5vs1txmShEBB+/ed0wlIP
	 sqvk2khLg4m8A==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id AB5372062ABC;
	Thu, 29 Oct 2026 00:11:36 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Chancel Liu <chancel.liu@oss.nxp.com>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20261019-b4-imx-pcm-rpmsg-concurrent-v1-1-c1fb8c33f4db@nxp.com>
References: <20261019-b4-imx-pcm-rpmsg-concurrent-v1-1-c1fb8c33f4db@nxp.com>
Subject: Re: [PATCH] ASoC: imx-pcm-rpmsg: Flush pending work in hw_free
Message-Id: <179320705881.1308637.1526280484324452440.b4-ty@b4>
Date: Wed, 28 Oct 2026 17:04:18 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1117; i=broonie@kernel.org;
 h=from:subject:message-id; bh=CEWA5BCsM2m+RdihV34Cj2j9qYJA3lhTL7Qhy7yDHcY=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIe9VsYLVC7F5gwL1zUeM1SO6+iiIBTpgxL2U2+ZzSxq
 pvn/dzdUcrCIMbFICumyBKXxf2yvuT1Gr6DC9tg5rAygQxh4OIUgImY5zAyHHzWJGxVY3Jjq/C9
 1X9vJa1b9je5/F30yTuTPlXPnu50goGRoUXzkv2buKs13sHxd+w+f2V1s42NYxQ0Tm248PHbc/f
 TXAA=
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
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 19 Oct 2026 15:58:20 +0900, Chancel Liu wrote:
> ASoC: imx-pcm-rpmsg: Flush pending work in hw_free

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: imx-pcm-rpmsg: Flush pending work in hw_free
      https://git.kernel.org/broonie/sound/c/bbe41586cdfa

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


