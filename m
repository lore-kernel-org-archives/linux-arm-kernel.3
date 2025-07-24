Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1520C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 21:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AkKQVebZcfp02bC/BwmgMQh6wZWPlUvYsPa7sRk1EU8=; b=R+kRWoxHolody5Sy43txZ3+9bP
	CvzvN5mFqxRLmTLdk1jWQpVK5VTJF3vB3/Ryg9B+pOu2dYB2Ot7Hwo8ayZ+23LTOkDxGAS+8ofP3B
	jgzd51zDxz5tAPAFyfTgwauvHV4iVtS/bux1D+Acurtbpb4IDfA6mj5cIk1XSw3sv4lZBG3YJGOKy
	T29rksdNXv/ze0KZpKyr06Fg2copD7Qmzh8MKP6Dbdc+dWM9q9L9UWDt50VbKBCGQ/IagSKuKNfVA
	2l0e0B9btMi8PGraAxDXeC9072Hy8Expd6OrXX43BAMh/Z0mD6QGlPonvG12MQcRFDg1Vtv0mjfED
	ZYR9FXiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf3It-00000008SzE-2Q0I;
	Thu, 24 Jul 2025 21:16:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf3Bk-00000008SHJ-3OCS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 21:09:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2AC4545AA6;
	Thu, 24 Jul 2025 21:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89BD2C4CEF5;
	Thu, 24 Jul 2025 21:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753391356;
	bh=nWp31srlWOly544EzYSydGTw01FUN6i0u3AAl2ah1sE=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=gSepwrjYRHTadeORqfLdJJj+3A5uUgVNePHG2U2rxx0RxjUgeRkA8SD5R6E7W0Tqk
	 B0fIKoVSPZZsj9OhUXd4zAFk1438aywHt/cseC0oSCJtKbvB+w5yZMpj6bSZ/7ADMX
	 GhwVrY0Vaod6B4sgsx/UJB1V05XjCWpHcBC8yy3FqpsPdsfNtkIf70TCYrodVxsbLA
	 zsVSZtn0KHqqAneBwN+VztaWKUmybaFZCIZEAQwt3gRECNgvn0DjNg370fAPdc9sAM
	 9NpyUM/m6Bqh+D+IWde95lOIdzaZbOioE92BQicoNFL/C0reV5JHFc8tlsDFM0yHG9
	 P/EQf23ZcC52A==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 shawnguo@kernel.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20250723073725.787844-1-chancel.liu@nxp.com>
References: <20250723073725.787844-1-chancel.liu@nxp.com>
Subject: Re: [PATCH v2] ASoC: imx-card: Add WM8524 support
Message-Id: <175339135330.153218.9643329948012933654.b4-ty@kernel.org>
Date: Thu, 24 Jul 2025 22:09:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_140916_869944_C73DAE9B 
X-CRM114-Status: GOOD (  10.93  )
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

On Wed, 23 Jul 2025 16:37:25 +0900, Chancel Liu wrote:
> WM8524 is a stereo DAC. Add support for this codec in imx-card ASoC
> machine driver.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-card: Add WM8524 support
      commit: 2260bc6ea8bd57aec92cbda770de9cc95232f64d

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


