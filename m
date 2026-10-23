Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFC0606A325
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 08:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FDA8Dzt8;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n8cVX4lv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BxGg8AbZofUdpgG8WVyjDlIOqWA4Osv9johjSGR+F78=; b=FDA8Dzt8fvmQZy
	vsM3wVh/P9eMw5RnyYKSOr28uOZEu/hjB+wRE7fh/PWipoSOawjaHVJT3OSGK0E+QbVUD0zpvl5w+
	z+GnFUz+GFvXTUwJE7hA6Gu4Y6O0YSL0QYZuD7486jdLoaNBpzOB27Y9ED1ZdlZIkRLGredxiUrX6
	eIXM7V96xOnoKkQMFp0Q4kUAe7niuxKw2vWLK4fP45x9OrGhqzb1BhXMTNbwtndVdAGhTHpZbWQhm
	lquA5kAI3RC2trB68XC5SSzH1odruy/Jrn/7dF11ZujVU/rR/9ms6xKVVhoObCHvTdp6g/Uvkd1eO
	hceapzTg3yXj7q/tfGbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKX25-0000000007H-1k4b;
	Sat, 24 Oct 2026 08:23:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKX24-0000000006x-0aPX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 08:23:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 072FE60A86;
	Sat, 24 Oct 2026 08:23:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C7FF1F01825;
	Sat, 24 Oct 2026 08:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792830194;
	bh=BxGg8AbZofUdpgG8WVyjDlIOqWA4Osv9johjSGR+F78=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=n8cVX4lvx1NSBssH/4YXge7EsXSSU2aw+HnY+U19XYBXCgcKjgzOgyyd1ksdvcBnh
	 pYFLxMCVKO1ZG4N5VWsQnVBrKrNg/oxXBkxcXLuVab9J8cea5e4Q0IU3wCg6ecmG4z
	 vfh8lB33lvEFTlL33jIQATs8exqoPrIHrOPLHBBSM1QgtYZPQG4hI/Wq1UEfBssk3m
	 AOYt1cwZiPLnMNmMAlHUK/Fp/5CIBLo4p8txuRO0tAI99VPDDYocWkt1NL0aOr/fa1
	 3kAWVce5GdAin18SbOS/fL0VSNnpXCntk1E9chguutsimMFJNBz1xs+SQLCYdMAMK6
	 QiHIcjpgMnrNQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 9223F1E1FCBA;
	Sat, 24 Oct 2026 09:23:11 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Michal Simek <michal.simek@amd.com>, 
 Pufan Jin <cyan2254650260@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-spi@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20261016130812.282624-1-cyan2254650260@gmail.com>
References: <20261016130812.282624-1-cyan2254650260@gmail.com>
Subject: Re: [PATCH] spi: zynq-qspi: fix address buffer corruption and
 support 4-byte address
Message-Id: <179277759175.3909521.4282064912069805866.b4-ty@b4>
Date: Fri, 23 Oct 2026 18:46:31 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1155; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LLAxb/9SE4njQjhCWgVEyFpwj+1TgmsHyia3ikY0bgU=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLuZL3nP1RR9CDy55zFt4+dXmcTmmBY1P9X0GU550KNO
 2olGY/aOkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAnCTLzP8z/3480/jpuQl+8tS
 p5ecfzgjIObOi675Ktdvz7PY9e7ZuSRGhtWZqzfIs6rNcX1WzezYHZ19z37x3NcKIaHbLKtmCVX
 YcwAA
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
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 16 Oct 2026 21:08:12 +0800, Pufan Jin wrote:
> spi: zynq-qspi: fix address buffer corruption and support 4-byte address

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.4

Thanks!

[1/1] spi: zynq-qspi: fix address buffer corruption and support 4-byte address
      https://git.kernel.org/broonie/spi/c/dc5ca34f5e8d

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


