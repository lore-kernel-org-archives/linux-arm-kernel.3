Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE86E10F6FDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 17:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ragPkrrOg+mHLs4WKUh1hkaNx7TsPhv/WcjyvHcNnBo=; b=uq0yo3wox/9wQZnguOUx2uchAY
	+OWIZuBs8B4ev8Gcysi2pHcXsGHWHyZwVN9kCWXNO2g43znl61JUkKtuhcB7DLqeCwAxveTBMuTC2
	NlK6fq+pNdJsoqPv6I5LkwSji4X5H5YJ+tR/5xs2kOEQcRJWoVMaL8Dk6siwCjU2DB9V+qyfQ/T0z
	aPi43nwaTvGzdoRVHrsPaup/IgxqV24o67S6s6OUQ32buLBZXkEzvP0YX4dpRY8BqVgDTtjRt+T6v
	DMSH+tNCL+zOHxoptcrrj+it9Ew9/VN0WNvswV0k1ypKZRijugLTLUrVa2HXaqfDAdB7nALk/vKq1
	pKeyYu/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zEA-0000000FptD-0FST;
	Wed, 01 Apr 2026 17:19:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zE8-0000000Fpt1-39GY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 17:19:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B98D56013E;
	Wed,  1 Apr 2026 17:19:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4386DC4CEF7;
	Wed,  1 Apr 2026 17:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775063975;
	bh=gZZ3am2l2BZrbiJy//1SPjpK35+k5Zv9qYgrBQJqKfk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rxc8VVB8Y2b8ArlnVIh0Ip6lECvk0z+d3G6zra5HxDQF70vpRvd7yvmotx6O9rHpq
	 pcNoaW18ncjKuq6k+npNR9LOv/EywxO5Zlyvw+zc6PzBLQgMDCyMGmOiEZ2lHG6m9E
	 0FhbmxNJkEzqtGXP/Ivxk/GIDzsgognu/+0ESERuCrYyGby0M1K8u+RwS4dclGDXeg
	 ErhBoF307y0jZyTxMKG990fP38ZTsWW/GKVUAQiY3mTcTulXXHtWa2wy0xvcLCUaUa
	 yDqsSEPVm1zn3z4pKJAygaZKelv0jVgy156NPjuE+Az248kAhCybA8kz+rmPEX2WhD
	 4ZyvvcFrGBVsg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260401053051.586290-1-lihaoxiang@isrc.iscas.ac.cn>
References: <20260401053051.586290-1-lihaoxiang@isrc.iscas.ac.cn>
Subject: Re: [PATCH] ASoC: mxs-sgtl5000: disable MCLK on error paths of
 mxs_sgtl5000_probe()
Message-Id: <177504863830.145704.3305961263269290101.b4-ty@b4>
Date: Wed, 01 Apr 2026 14:03:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-7777e
X-Developer-Signature: v=1; a=openpgp-sha256; l=1159; i=broonie@kernel.org;
 h=from:subject:message-id; bh=gZZ3am2l2BZrbiJy//1SPjpK35+k5Zv9qYgrBQJqKfk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpzVOkBGbGoFLNrIZfgTyoGw/FNHf79QE2+b+ia
 PY0vB4V+yuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCac1TpAAKCRAk1otyXVSH
 0PiMB/9gG2mtCNah85dcETfLIead592r338DaI7w8bdBS1zRFuo7pfDm5jNzx/33fSrOR9JCLHO
 1DAVogc2cRmWiOTK76gvHSj/iuWK18b4dT5Dx0wSgh136R+OPQKzWmdmK9qTbIjwwa1LnJbBuzM
 xjLow55F0ile4twIeWrw3MgCes0ECjfa8y3VHo1wYijIDjSToE+ThtyF8JNOVhttFOzqsVYL+R3
 CQvorE04EgvEdBZL4BlzaYHFfap2byflbmBFTvQe1/p3kfx72S0bKAUq/fzAA+hUyKCS2J4ByzD
 uj1iQFOobXaCd9R9/tgtTRyU+6JjdKIjVcfz58vxjdpgkFor
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

On Wed, 01 Apr 2026 13:30:51 +0800, Haoxiang Li wrote:
> ASoC: mxs-sgtl5000: disable MCLK on error paths of mxs_sgtl5000_probe()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: mxs-sgtl5000: disable MCLK on error paths of mxs_sgtl5000_probe()
      https://git.kernel.org/broonie/sound/c/c8ef13d692f1

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


