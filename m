Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3B460A6F47
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 12:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x4i8P9sL;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oh1sbX6U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Fvicyg8Fd06ea9xOp3734mK6H6xlGiXlw0uR3rAzBzs=; b=x4i8P9sL+61fKF
	G9YQBGOKl+SeUL5py72Nw9clPK+X+9FY/Fgu8D29me9x8MKipe5fcW1JcbiGoLOPzCtoXfbmdzGZO
	nH0zw24+7mvifBfy2SYcc+Xtp6VCNerqR1Q99XMnf5YbeERfiwM/T6ebP/Ep8x9Polu5f3Z2LJxyt
	j9LLWhynSFTzDLQoinnSZy/zvzdM+3iDyny9IQH+kDKqs+LssbZ/SlSC5ROQfxWNoK/f4WjJqqvxI
	rLWpc95LPKlBXi33PnmxtRGrotUIMBCHs9eHFI86gbKkLhIHT3TNwrbTmSmZwRjnf7PV686UdqqVS
	hDMF10qdSqZkCJiitD4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrNX-0000000GWEC-2Y8J;
	Mon, 02 Nov 2026 12:43:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrNT-0000000GWDe-31Ji;
	Mon, 02 Nov 2026 12:43:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3083560F1F;
	Mon,  2 Nov 2026 12:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C15C91F00A17;
	Mon,  2 Nov 2026 12:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793623386;
	bh=Fvicyg8Fd06ea9xOp3734mK6H6xlGiXlw0uR3rAzBzs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=oh1sbX6UxViCVjK652yjM3GQIfeNiU+flMgKM1OPDapbm0ytnUs0+VOt5++gcUkLy
	 znS3tBmZN1fzIl5llI5sqP5X25MhjNnlpufpHqIE2POVXnc0IzOQvFezmenf/03XJy
	 +hSZN5BY43sRw42IEZiW2NhIoKfVj3iKh3wA10OhH1iIuCugRvuLf4Dz7yzM+m4Gya
	 Vt5ZLtz3RNOFOJRhsoV0NeZt+GYG3e+PIwX4A7Ps5k+vPXBW0UkI7D2Iz3zW1QgyCg
	 3dodCtGVKSbm8GrtTs4X/9SdjAqNIaaKS5i70wKet/Sn5Z3MBxQUCpL5fQL8OBLTtR
	 8hvRqSWwTDzXw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 1947D2310542;
	Mon, 02 Nov 2026 12:43:05 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ninad Naik <ninadnaik07@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261026112033.36310-1-ninadnaik07@gmail.com>
References: <20261026112033.36310-1-ninadnaik07@gmail.com>
Subject: Re: [PATCH v2] spi: mtk-snfi: use min() in
 mtk_snand_read_page_cache()
Message-Id: <179357935036.1716893.15135482750759884888.b4-ty@b4>
Date: Mon, 02 Nov 2026 00:29:10 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1122; i=broonie@kernel.org;
 h=from:subject:message-id; bh=czJJa5KVgAzY89jIsO/TrpW8iHAFY+XUjsaRbcZfipc=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJetEbY7pjec3rKvBq/5lN2QdeE53fNk+bdvrLB4Htfg
 3H88RKHjlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAEykeS7D/3Jm7phmE69wWY9o
 fe2vGe8D5a6fm57vXpQXsXZhxUXrJYwMD2NL3vjdvu3w9YS4oqNneusy1krv5jd1as/1VerKK24
 yAwA=
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
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 26 Oct 2026 16:50:33 +0530, Ninad Naik wrote:
> spi: mtk-snfi: use min() in mtk_snand_read_page_cache()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.5

Thanks!

[1/1] spi: mtk-snfi: use min() in mtk_snand_read_page_cache()
      https://git.kernel.org/broonie/spi/c/44e7659f4618

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


