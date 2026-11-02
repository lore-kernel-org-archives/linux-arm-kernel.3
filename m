Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124C3606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 12:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jKezrdmL;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b4XCaQPg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=efMW/Sa50y1oXCP3CepOU+Na2ofPx4Z+d7YadQybQXI=; b=jKezrdmLGdXINB
	QFwzJxu73vGeWU7cJJFrbCfNZwtOwHZJxfv7R6a5R9WkR1aAML+xH8nomslemlAhkTQnicl2u9ccr
	sonOp2EwXsSr28YM2P6V5WgAjYkkhUx49yI0ql9ZBydJFHENaRxK5h6Pku5UwCCP2/ihWNzyZZLoA
	AA4ZZTixgI+S7FcVv3JN7Jv40Led8taOmCRz6ylc/RWuUyqGd+61m6Rr9KbY9I0KKUKDdji/hJCAa
	pDC/u0MS3GBjbHFPgjH3O2cCG10p/17gTta7ytDWazYXTkVFT6rw1MO6MysslmuqHwwBczXhAptWT
	Jb9cLwMB6TR+kmtKymyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrM9-0000000GVxB-3LvO;
	Mon, 02 Nov 2026 12:41:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrM8-0000000GVwh-2mi2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 12:41:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2185560F3E;
	Mon,  2 Nov 2026 12:41:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A780B1F00A1D;
	Mon,  2 Nov 2026 12:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793623303;
	bh=efMW/Sa50y1oXCP3CepOU+Na2ofPx4Z+d7YadQybQXI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=b4XCaQPgYDDoQS6FyfvDl1PSgAH8+vZpe6hLbNdKrwWr1gUc8gYeIuHaU5BNQZiWE
	 7kOCj/EJodw5cdA2zOwumBPQRSrNFr3PZFtN8AgltdnECfZyroucDGaQM5UiE72DS4
	 dwG1y17q32r5No/6vhI7X7zBJpqez186goMdQKD6NUq+TA9pI+8tkoEu9ykW1aefOg
	 mriBxwcXaRDUXDYddYqvv5Pca6wywR74RDddbDBppO+fjgCePn0q+l9VROjZDjJfyh
	 3tW4x0wNDJREP/opVJWtdrI0xVCZ9jKYpXBsRFTlQEtIM4bs27KZiTyVh4XDiAcTpx
	 F6wTUMqdtN5sg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id EBEF52310418;
	Mon, 02 Nov 2026 12:41:41 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, laixiangwu <laixiangwu@cmss.chinamobile.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261030083810.1597-1-laixiangwu@cmss.chinamobile.com>
References: <20261030083810.1597-1-laixiangwu@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: mmp-sspa: Fix runtime PM refcount leak in
 mmp_sspa_open()
Message-Id: <179357781735.1716893.17309656576064863789.b4-ty@b4>
Date: Mon, 02 Nov 2026 00:03:37 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/TnCZd+Jyi59kPGq/1IC1o8ACBvZwEwMgZnKwQH0OeU=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJetLKenOp7QGfKIr+zDf3/PtnemBt9J8XGXFb/q+DzM
 yv/rLwzsaOUhUGMi0FWTJElLov7ZX3J6zV8Bxe2wcxhZQIZwsDFKQATkV/LyPBPm0H2+OTd0Sel
 1QWNItcanFz22uju3N/ZPseYbWddTPrH8M/u7M6YZ97/9wcGsMuLFSXOF/7sYJG6WGpS4OmARyJ
 FmzgB
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 30 Oct 2026 16:38:10 +0800, laixiangwu wrote:
> ASoC: mmp-sspa: Fix runtime PM refcount leak in mmp_sspa_open()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: mmp-sspa: Fix runtime PM refcount leak in mmp_sspa_open()
      https://git.kernel.org/broonie/sound/c/6bea7d731dbc

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


