Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7D4CA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 20:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ggxBvHPp/Lej+KwZ4e6C7IZ6zx7TGdeeH5L6jFbsQiI=; b=TDD2Ug42/nsq4H0rn/0SspCGES
	u9KL1uGUztk2/wULeDG5naJRYSfncmdqBrNlQObjfPJshaaWMx7AUe0MAepwM8JPIndyBnJNC8uzR
	y+YTL2TBgqibfzb1AP78sKNw7AwARgNHPXRAL16ymEfiot14Z9SZv0T44Gz2uMYppqz08a8/D/5/U
	0Jb1SFvsFrJFF/566hvVWSrxkf5q98KEUhD9pf8bGCAVxg37BztjJPcGgA2u9SjCc7TvpZ97nydv5
	XwFp3i6sYhcT9mSuSNaci/3cF1HQhmAVkjdJTaIAlW0xJlf0A6ZVS/qi6urGqXJTgWPGyHlvJUuXh
	FO4x39Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqdTX-00000009VBn-3hGL;
	Mon, 25 Aug 2025 20:07:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqdQm-00000009UMB-3sNs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 20:04:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B40740346;
	Mon, 25 Aug 2025 20:04:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66D1BC113D0;
	Mon, 25 Aug 2025 20:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756152280;
	bh=zfoEC0qVaIxne+Ih7GOFCCmslaPPL3pdBZesCwuWO18=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=UYIb/7F6z/p/GP+mdnt7Qx6lRuw0WvsBXI59wavEe3ebR/bxsPORopOj2TBtdkrO3
	 1x5T+pNYfTV7UoELqXsNXLibUw79tmZp1JXZaU6KsedmkosfIeKceywPs0oVL6voR/
	 viiCgSO5Bzv8k4xGWc4y5Z6Pl2t3vpRH+saJmQvB208Dy3ZHzng0Zx7296ldDhbYfI
	 X/eplYSnaj7E41O8x3oj8XRJ8JmcmpI6L3rzNeOTYzGzd09XmXeIOQY1ZQWpz0mi21
	 TM2nRNgx56k1T3a79aMuEpP0RhsM5WXibX5PQJkdd4XSSKqs3FK1waqkPLVLRWeWcN
	 cXkWhCa1T2paw==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20250820031641.2158261-1-shengjiu.wang@nxp.com>
References: <20250820031641.2158261-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: imx-hdmi: remove cpu_pdev related code
Message-Id: <175615227355.226187.1520162312481432148.b4-ty@kernel.org>
Date: Mon, 25 Aug 2025 21:04:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a9b2a
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_130440_986105_F4AE54B3 
X-CRM114-Status: GOOD (  12.63  )
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

On Wed, 20 Aug 2025 11:16:41 +0800, Shengjiu Wang wrote:
> If a defer probe happens for the cpu device, the return value for
> cpu_pdev "ret = -EINVAL" breaks defer probe. As the cpus->dai_name
> can be replaced by cpus->of_node, to simplify the code, remove related
> code for cpu_pdev.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-hdmi: remove cpu_pdev related code
      commit: bc017f28b1c6c3d44c3631f8f6d152b7e703e990

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


