Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D61DF53D81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 18:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fc6sElGMgMukUy5Ml8+MOCMJdY3v3LhpX+J8ktZPnok=; b=XCPmfDn9WkuWrpxjj/lRyNfI/w
	8d8hGo3mGyn97VSUcJsrs7CSvf2zWJxUyzqdZsCkgjFRYbeVuOmKB1UdYQ+iVgB4Fouarlk3HnsQH
	pp/BgbxRUgATrwUWw+9ZO+eamfTwN6NusQrJnScsT2S+rJyRohcEmZcBfoA71ghzV9aBsTYe/8Rlh
	RWmx8Zyl8BSDsb0ADtzrrH2yqBS+5kZhYEcqzi7q8DYJUNX4n0juIdfczaJ0d2OGAUets5klSll9W
	pFNB2Fou/tC6I/hi1T5p2a1xZlv2/kcE8bXhZLEJd4K1FbEkudix/L7FOTEvf1y6cKg8k4FyJ3V8F
	ly3YjZvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2CTN-00000004fKG-0fTk;
	Mon, 16 Mar 2026 18:15:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2CTK-00000004fJy-1TBZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 18:15:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A5C784047B;
	Mon, 16 Mar 2026 18:15:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C11B9C19421;
	Mon, 16 Mar 2026 18:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773684921;
	bh=f0V1XGDt0iDrlPiBc61XqhTfjDwAfM87xKlHzbkj1xE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IzKGWr8Y8bdgCgHypXlfL7L9UV40MqCWXpx5ZSbdhR5Q5tWfPFkU9dSlXVdQYIXQb
	 1wYDtUv+a972HzgsVtl7FAa+e+txxzuYmtlbfCfvVx3YlgXYvcocfs6UIeyEGZ/XiA
	 nhF2mPRTC8FBQ8xjydvB9cZu6uXzm1uAMS2632VGrAbSErdVy4OibypDG+7fPfkS2o
	 mN6e9PQANA2VjNx+QI/G1uoEkMFx22+odi0zRIDPVv6KWwfD3veWnT6aoLdlzmhlel
	 C/o6UHeSN7PJpcmzlBUXFbYK8u3BOh4yWMiu2IL+HhoOgiSYzjwGF335J0h118bLSp
	 o1z9toqrSkDgg==
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <20260314-asoc-arizona-v1-1-ecc9a165307c@kernel.org>
References: <20260314-asoc-arizona-v1-1-ecc9a165307c@kernel.org>
Subject: Re: [PATCH] ASoC: codec: arizona: Convert to use GPIO descriptors
Message-Id: <177366676762.65215.4887426822529961456.b4-ty@kernel.org>
Date: Mon, 16 Mar 2026 13:12:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c239c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1125; i=broonie@kernel.org;
 h=from:subject:message-id; bh=f0V1XGDt0iDrlPiBc61XqhTfjDwAfM87xKlHzbkj1xE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpuEi15VIkFVpfbMENWG7miE5Gedb2iYkZYDVb1
 KFLtDV0u0+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCabhItQAKCRAk1otyXVSH
 0IgrB/92YGzRsgyzung8/Uf95Fkw5+Sp6uPvpKX9cgrxQQRVvUxp2sn8CyRWH4rZAmWcDWzWwm8
 Gh189w3kcUSHzn5m/UsBkhTxjY6q28jCKIoz4pHCCQHVfjcIl5QePpXPieDQqyAIlDQXJrOHD2/
 b7z6c5xXHinWj95Bppag4PO849BbIzLNqCbvPWrx9QWtIYN2fkpJ/FmK4vL+KY6ZiSHwjyDrCuq
 47tKIGArH6xApc5sAjvYQe4t2EHsyCQ28rIilRiEt8CyhoJkWpYz+jNWAsIet107yCp5s44WrwA
 ddPZ5/n2jfWSGnnOAbgEvbtQbYigf0+quY/T4uOU5Kw8W8NA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_111522_433578_023EFED0 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
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

On Sat, 14 Mar 2026 23:56:49 +0100, Linus Walleij wrote:
> ASoC: codec: arizona: Convert to use GPIO descriptors

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: codec: arizona: Convert to use GPIO descriptors
      https://git.kernel.org/broonie/sound/c/cb15d8e6cbe8

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


