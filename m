Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F149CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 19:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ugPpYsPW2E5XR6gu/P3xEogXG+3/EAzD0dhSlunODs0=; b=r58POQq1cZQDT6ruQ/FXM6vscz
	ZANyI4rPoRlpxegkoryaCbO2hz8ulZRsWlUfQwLhrBtjaOBKsy/PsPyIIMXPTTsveSAmlCWXQ85TA
	Qknm042wTasPWouotFzS701Scot+cwbJqKfm+QBf624TsUbMWcDMxpgvJgW2/HCuxFYHsWkhbUBO8
	EoHtroCBz44DrREYyyI6ivGuIW+tyA47XED6tKToZ4j4jp0Yd72l9mBsHun0IqdWboFnv1Lc969p2
	Yz4HImnB29JDCKPWqM1Lb3cKlvNBPwvTqgkZ6gkjRb0aRAyJk28qgIx6SyfS52AR9d+xVdKn91Y+G
	oqDoqm+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9phc-00000008mv7-3Dde;
	Fri, 17 Oct 2025 19:01:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pha-00000008mtq-0dEm;
	Fri, 17 Oct 2025 19:01:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1EE794ADC4;
	Fri, 17 Oct 2025 19:01:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ABCFC4CEE7;
	Fri, 17 Oct 2025 19:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760727681;
	bh=SEWFRPzFoC6acOac+2ZzlmwHvJCzxG02XBgDG3AfzVA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=er6SEQvLeGvPtYRk7VunhCRuihoxWVQnqRL523qIqSNuyVQtYrvKpGeihy4EU6TfK
	 kFcTNUB2wKoYlPLnCWtib5Dbe12rPMnSkhnjyX0sPUrszyyVIy+5lqZgm9tcGYYtan
	 9yN4Sv55eO4cK/iNM1StGPeNeZopmMbjYoNWmqjmxjylFJinVU8/AJvz3RTEpBJRSg
	 bN+QR6j3zxZeTjuiuYW/OpqX+UkjOtcNNi70DQRAfMhEt71eTrF1c40ejZjCZXtPNE
	 9lSvfMsEcKQhvzU7nG/G4GhMXjWGFlxvhbmsP/pHhS9SXhUMPN7tSgVNgGiL91ijD3
	 gPmvo0NKrTVzQ==
From: Mark Brown <broonie@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Andy Shevchenko <andy@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Andreas Gnau <andreas.gnau@iopsys.eu>
In-Reply-To: <20251012121707.2296160-1-mikhail.kshevetskiy@iopsys.eu>
References: <20251012121707.2296160-1-mikhail.kshevetskiy@iopsys.eu>
Subject: Re: (subset) [PATCH v10 00/16] spi: airoha: driver fixes &
 improvements
Message-Id: <176072767774.228540.4249472913716298629.b4-ty@kernel.org>
Date: Fri, 17 Oct 2025 20:01:17 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-2a268
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_120122_238030_2D9FE56C 
X-CRM114-Status: GOOD (  12.31  )
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

On Sun, 12 Oct 2025 15:16:51 +0300, Mikhail Kshevetskiy wrote:
> This patch series greatly improve airoha snfi driver and fix a
> number of serious bugs.
> 
> Fixed bugs:
>  * Fix reading/writing of flashes with more than one plane per lun
>  * Fill the buffer with 0xff before writing
>  * Fix reading of flashes supporting continuous reading mode
>  * Fix error paths
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[02/16] spi: airoha: remove unnecessary restriction length
        commit: 661856ca131c8bf6724905966e02149805660abe
[04/16] spi: airoha: remove unnecessary switch to non-dma mode
        commit: 7350f8dc15bfbb7abf1ce4babea6fcace1c574c5
[07/16] spi: airoha: unify dirmap read/write code
        commit: 233a22687411ea053a4b169c07324ee6aa33bf38
[08/16] spi: airoha: support of dualio/quadio flash reading commands
        commit: 80b09137aeab27e59004383058f8cc696a9ee048
[09/16] spi: airoha: avoid setting of page/oob sizes in REG_SPI_NFI_PAGEFMT
        commit: 70eec454f2d6cdfab547c262781acd38328e11a1
[10/16] spi: airoha: reduce the number of modification of REG_SPI_NFI_CNFG and REG_SPI_NFI_SECCUS_SIZE registers
        commit: d1ff30df1d9a4eb4c067795abb5e2a66910fd108
[11/16] spi: airoha: set custom sector size equal to flash page size
        commit: fb81b5cecb8553e3ca2b45288cf340d43c9c2991
[12/16] spi: airoha: avoid reading flash page settings from SNFI registers during driver startup
        commit: 902c0ea18a97b1a6eeee5799cb1fd9a79ef9208e
[13/16] spi: airoha: buffer must be 0xff-ed before writing
        commit: 0743acf746a81e0460a56fd5ff847d97fa7eb370

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


