Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25DBC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 22:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B2tx2IQgvWh1TIXdh1vMR8Nn5FUkPRu5erhCKyVXc5g=; b=DbDqYip3WfE2DkaXuXMVYk1SUk
	ivebGwRi/vf5GNJnTdufajfM/8Zhb5lcH/L1JwsaAs2V92mJ3fNNBUEZQGZOFZrqsCzESWdRUvA26
	7NRiGcg6aNznFkg5iuhk7MKBbF5Hi5sq9WebZU5429pZ5pPVZBM8IQ/5DDKsgnIcS7DRAVpfvxoNK
	TeBwRROo9XOAfCD9CJsKryywQp8JAOehvql8jhcYuUZCrr0ksQ7Utmsy6+w+xcA9qNUpXKQXknPjO
	VVTGtp2kc15bcc6WOZhmKviVqhHKTF5Vtr81zRNgMJLOiyDd2vgxQSMBcPNdPHI+PKe7LZW9sudJY
	tPyt6iiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAz0K-00000003AzL-08Py;
	Fri, 02 May 2025 22:37:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAylG-000000039g3-2Bhj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 22:21:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D17496844F;
	Fri,  2 May 2025 22:21:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 341B1C4CEE4;
	Fri,  2 May 2025 22:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746224497;
	bh=Wkl/xCbUI7do4AVTMYybZh5OgAcqp0zypayddyCDUA8=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=uePdJnZqFALHxuAlpLfwRmV4/KsfUtSVZ0inrPLOQKQfWgkhvLnfGXF520tJGwvk+
	 o3RefBoOsJv8okJCeGSONP5zPaGRkN+FbwsmxQPjBw59eBUxDjIjVcUG3rg4Jd8uQ+
	 TtuSLZ6RSLTPWyYMuvrnR8rWxFPwe0jXFf18RNhqkwnuaRtfdDhY4lebjCYBDQm6BX
	 rvdamVo4MqvfWtWHTHvLelMLxu3rv+YgFTt1Yw4ZkrKLTpW535gxZ7tDOR+jr5uSTi
	 OLLGc/dNzjaqQdVLmu6i3I4zUVL5FhUcJRrGl3aOwPaAuL8QNTKZYZ0+Yk22x3Wk49
	 PfGPoqKUD8JtA==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, linux-sound@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20250421105701.2273588-1-chancel.liu@nxp.com>
References: <20250421105701.2273588-1-chancel.liu@nxp.com>
Subject: Re: [PATCH 1/2] ASoC: fsl_rpmsg: Configure CPU DAI for card that
 sits on rpmsg-micfil-channel
Message-Id: <174622449321.4079618.327380910498912102.b4-ty@kernel.org>
Date: Sat, 03 May 2025 07:21:33 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
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

On Mon, 21 Apr 2025 19:57:00 +0900, Chancel Liu wrote:
> Sound card that sits on rpmsg-micfil-channel has different settings on
> CPU DAI.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl_rpmsg: Configure CPU DAI for card that sits on rpmsg-micfil-channel
      commit: 17fa55fe77d8234131ce0728a735da6dea19acd5
[2/2] ASoC: fsl_rpmsg: Allocate a smaller buffer size for capture stream
      commit: 2056d7a7df5d9a08144671afccb6970ccd595b89

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


