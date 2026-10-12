Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FD3CA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 21:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Omx5vjLmVLV/2z971Vu2kIGK/Sz2PenYZbC4VAZwPiU=; b=bARi6aRZWfiSpqz37xGPbAuGf6
	tk1rVDQqjxzjZDI61VDcR6aifLmvWLmGH00f0PN5z45/rFoa6TtU9GfSiLeIieJMAJh8HYf+ucfE3
	kMpyWr/1EQ7fe8eH0HRnTtusWUC1sz3nl2A6q3U5pzfK41JKXdqI8V3zyTynarO6YyvGWNc/t1s6A
	V2keR5h6hLcZs8AwO76ntQxDdzuRSx7OhvqROVerUKYOKmDMpMMsyn7wAEnXRcdlBwQ5z981PMGej
	nkzhPk/H+9m6yo2xChwBWXM0socot8bg6GBsxXxgFYHEaOO/F3KFTZrGEQQk2vQCDhYFiSVevAzB/
	m6dfxMcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGNWe-0000000BXKI-0ArH;
	Mon, 12 Oct 2026 21:25:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGNWc-0000000BXK7-29fa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 21:25:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AC1A460258;
	Mon, 12 Oct 2026 21:25:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDE071F0089B;
	Mon, 12 Oct 2026 21:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791840337;
	bh=Omx5vjLmVLV/2z971Vu2kIGK/Sz2PenYZbC4VAZwPiU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Xp+HptdjRppPQWnhUcEg1Mm5e/aFv1pbPWsr6fQNErFcPE0Dl40ZvLrLSIemi/2Eu
	 LBsRzDsY35aD3JgAcCh2Oq3hV+iNONTmFhDGUhl0dr/BQmGsKHu67Zyeh90BDyqeyc
	 3w07krwfoXR/Y+R/jXaiCThoQjqCBiKx1FTYG03gBe2LhRIANy6+JrMu8cWAaghjQh
	 gjf6jY7O5IlRgDPxgcYHdhBOh08PeFd5n8xuFWppxAsZbKNLlK+DG7hU3hIXKPJsdh
	 +UtJGt7SIh2cGOm0PemkUe43H3EVP4gZ1ztEpGWR9iZ7zFhiAvxn3FZh1UjnOXSACS
	 T/eZKAAGE7paA==
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>, 
 Avi Weiss <thnkslprpt@gmail.com>
Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261011035459.2289403-1-thnkslprpt@gmail.com>
References: <20261011035459.2289403-1-thnkslprpt@gmail.com>
Subject: Re: [PATCH] ASoC: stm32: spdifrx: fix synchronization state check
Message-Id: <179182939460.390394.3163207660378747742.b4-ty@b4>
Date: Mon, 12 Oct 2026 19:23:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120; i=broonie@kernel.org;
 h=from:subject:message-id; bh=HQLFKtO1DEOPAkbPa7+/i9Zyu0EXRzoWl+rb8pafhUM=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLOBvh+FPUpy2m3+frV0Dda8uyRKs/PH/c5HPDPjpsg6
 l3IufVmRykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACbitYiRYW3rjJbm+aW3mHY9
 qi7Sq5d+9Pu59penl5JnHaldv6vtUBLD/2J/2Rs3466XXNuzaMP0lqZIzYWX+ANnh3Uz/9N8dMb
 oCgsA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Sun, 11 Oct 2026 06:54:59 +0300, Avi Weiss wrote:
> ASoC: stm32: spdifrx: fix synchronization state check

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: stm32: spdifrx: fix synchronization state check
      https://git.kernel.org/broonie/misc/c/0936bbd35a24

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


