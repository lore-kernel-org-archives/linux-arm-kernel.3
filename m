Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF59DC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 11:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjZ5K9I9vxkV4z0lzFLfUGBEaz+OoE8Mfm2dOhW6PXA=; b=3pSsRVU0i5b+f4stAPmyP3pMwT
	Rr6IRRamQA88NcTXwfA4ZiEPijlyZSkp5E/Xw8Bt2yj5EN6dZNLh6DHgsWmpW0SbYqROw+ilPXznJ
	x4E3Il0NWp6eGVmafspalfWklM/odrDLLq3jvniTdFD52wX694t7FvSGfJnI5dGqQ90LvlCUZ5muU
	VdV3bSUWYtPJzP32nlBKmQ7hiQDEZT9kOt+N/qPapDgSIByGQfnm8Y70K6QkvBSES5wBWFUf0xCYp
	wF9yT1pIY0SsygqMv0ZmM4EmDLya1sicvo5ZCufdY3HF2J49IP98yAl0jTXKQeqCCRlMgU+nLNZkM
	10vSPN5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuTjt-00000000ZSD-2IVn;
	Thu, 13 Aug 2026 11:36:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuTjr-00000000ZRw-2b46
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 11:36:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 06E18600AD;
	Thu, 13 Aug 2026 11:36:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEFAA1F000E9;
	Thu, 13 Aug 2026 11:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786621006;
	bh=tjZ5K9I9vxkV4z0lzFLfUGBEaz+OoE8Mfm2dOhW6PXA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=aEhjFG299PGC3w/xcQk2AxrMxB67zDNALb2llcpnTaK42LcfbCk9uP4QFSfsA6hhu
	 ATLXznlz28ceA1ljJ6explTG9f4e1KEqx0gP40o6Em5XSD6JUHvN+gkzyUTyKkcOPg
	 2Rn+vwiE1dqtN+icNINzMHl9LT44RaXz9po3h+3Ee97FV+SXHD0DWX6m7llMC7G6xw
	 sjmE1LTpYpd8C7nntE2RVzLVSXIbSbarq+SyQK/oL4TrPNcbys8LIFGQr+7kuOuN/h
	 yxvHq65OHpJ2v5TIk6qZ5jPisJepzgTlJ5rVP/sUo6JvLh10wEMj2PI/leBL0rA6I1
	 iWFWNiR7+4ViA==
From: Mark Brown <broonie@kernel.org>
To: Daniel Mack <daniel@zonque.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, phucduc.bui@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260812084311.29188-1-phucduc.bui@gmail.com>
References: <20260812084311.29188-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH] ASoC: pxa: Drop redundant probe error messages
Message-Id: <178655526662.342177.4013313611398631040.b4-ty@b4>
Date: Wed, 12 Aug 2026 18:21:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1119; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Uz3lNAd4B2wNCRRTWD4clAwXjG3Q0JgX4dRcKNsXM4o=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqfaxKDzkLiCKvZB8B+mdlqVU2815XQr8UFxuXr
 f9UoehwkOaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCan2sSgAKCRAk1otyXVSH
 0OhTB/9UbDHyIfVRRK+sG1hFlazEXuZAqD4deW69cqgOVCBJiCSRb0TR9ALvCJabw1JLvx+MgpK
 Q+kV2GHS5jbZcfBw2C+rRUJcM/Pe5V6RiGEEZe3pZpz8kyaaY4CXWEDy46WiurR10q/BY2XVS64
 lOe972HjlytJh55BKTKTeN64gyA+FJbgDtvZRh4g64I9yqKDbNnotmAtFdjVhDEN2vbSJPupIS2
 m9OMqtXkRuyCxGUjNMuMx8+ZGGtZdTV/PZmZ0EoWCi9rLNgmo0a/Uq0MwxQWP3VWeCYCzy9YOe7
 brtwS/9tnDNsqZShysCFeWY7DlR04tFToILUwD/kKQ2UZ39X
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

On Wed, 12 Aug 2026 15:43:11 +0700, phucduc.bui@gmail.com wrote:
> ASoC: pxa: Drop redundant probe error messages

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: pxa: Drop redundant probe error messages
      https://git.kernel.org/broonie/sound/c/79a883d53960

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


