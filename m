Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1184C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 21:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IMLWheCelX971hf/SFgv6hTrjgSuDX5H/Y1V6KcRpwc=; b=hXAj1HJ3MJHHp+fYSpHJmh8y+o
	eAPx5ggAUaV4ByMv1uGVCWTDRqxlEahKKXiFIurL/VUeFeEEEEJifqqwtn8yEv+XIxRH7gCXfMMEn
	lg4uFN7NL3QS2WkeZRcUSfSZVv5gPgTZWWrNDh20RvhpGhndGzvWDYmSIoCJTekc4hjUg7ObMuFJC
	deVqyjCVr6YgcaSsladcYtY0q97uZr3JD2AW1Ghb78F4DVSdv64mQb/AjigDw1N4xG5t4xPnrL0Ov
	Jx8POAzmszYt/HbKfQQB2CyRkClYGFFL00yxMyNH2DDJVf6mT1naY9GQIbncTYp9wamHJuGNlxnsp
	iuXAdmdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3hBx-00000007mmo-2X7r;
	Mon, 07 Sep 2026 21:47:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3hBx-00000007mme-0tF3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 21:47:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F20B601DB;
	Mon,  7 Sep 2026 21:47:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA0F81F00A3A;
	Mon,  7 Sep 2026 21:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788817672;
	bh=IMLWheCelX971hf/SFgv6hTrjgSuDX5H/Y1V6KcRpwc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Pk4Lzq+nMw55twOTYEeihcgaiKJ86Fk9QMjpZ+gzKvMJRkxG7KDKRu46vAjsnXnRW
	 HrRBFp853B3sjBFITrMgXdPwg1F10SK/tvfl1F80S0X9EmIs8ZWos9WGaqn2dv+w5k
	 CzXpPAbbkGVW4xQGBf5r6F5UgTE/1+bqrQRTpjPvZyQ0wLiMgivSe57txIwPfPUlXt
	 96bJQQcnOtGiRnQLJ2AMs28zN4GhdMfKJHlp9T/dWMr1G1DyYNhWDG1FrgwHR/MV6X
	 PGuccVk41SqQs9qpn9yEgHDC1osxgV3W1FZ6ZaksAfBaiSjYBi6Rk/VH4H5s2JuPXn
	 jgeodIYfOlB1w==
From: Mark Brown <broonie@kernel.org>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260904-perso-ma35d1-master-v1-0-b6936e8c6fa1@bootlin.com>
References: <20260904-perso-ma35d1-master-v1-0-b6936e8c6fa1@bootlin.com>
Subject: Re: [PATCH 0/2] spi: ma35d1-qspi: Flag the DTR capability
 correctly
Message-Id: <178879386785.118202.2783412659972248231.b4-ty@b4>
Date: Mon, 07 Sep 2026 16:11:07 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1601; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ZVyqdTwyNH/8PkOQcGSbJcEKsRG8w7dGOUBzIlcRFoA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqnzEEzaooHtGMR6zzXr4exMV0CtpQsDa6HtXyd
 E1KcfxhXIWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCap8xBAAKCRAk1otyXVSH
 0OTUB/0U12Ak0zJd7DHKfwpa4sv4hLP3Si7QEtcDdWG0ivqFy+KQKNYXaV47fU4dTdWwpPyUcJc
 pPgE/OW+lS1BnuicHsxmwznunh7ktS/uUt1LghJBersSbBziakpc9VOAz3EZzH+bnt8m1wABHji
 0RrELLQb7zDiTATJWfcBbWxY4Ys4v1rs1jAwOPCXcdn56rlXe+fhfSEmDATRd1++hVnozC9IwJj
 0UkJmcsh8/Q31IpW6f0TgiItDDdok74u11M8rY1gB0v86KZrpCTSZdNsWW4AWxvHeSEGDyV3wXG
 M4LRAN4io77020O+kaIBr5avFc5cTIelmAiHr0JdLTZ4yGJh
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

On Fri, 04 Sep 2026 18:15:09 +0200, Miquel Raynal wrote:
> spi: ma35d1-qspi: Flag the DTR capability correctly
> 
> Mark pointed out that the DTR capability was not correctly enabled since
> I had to set the extra ctlr->dtr_caps flag. For testing, I commented out
> the spi-mem ops/caps and figured out DTR variants were still not picked
> up. This was due to the spi-mem fallback implementation of ->exec_op()
> not forwarding the DTR flag.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.4

Thanks!

[1/2] spi: spi-mem: Enable DTR transfers using the standard API
      https://git.kernel.org/broonie/spi/c/86f4ab98e716
[2/2] spi: ma35d1-qspi: Allow DTR operations with the regular SPI API
      https://git.kernel.org/broonie/spi/c/2448f25cc839

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


