Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B7BC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 22:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2PqIr4fmxyKnYA6iGlh4mS7egkuY16Gey8TStUT6D1M=; b=gqB82zzGW+RWis9I3wXHdj0PH6
	gdEyBxfxDCS2tQ5howdR96T61EjoQO/566/SH22BoViAZryfKuAf6T5+b4hHDo/hhkgUJxFjuGU6E
	we+70iw4rd1XcTBRL0PrUhsv+hbUe+DcKpBvafCSdAxEY5EWgARYmi1D24t4264J5X/lfjlaPAQ91
	zJK2Qf+es3yJiBsnRqprlP6/9ZZLeOIRZGhZIzM2Yiniz/PP6Cn9FkgOH3+J9sPEo7a0Eb7SRK/Xw
	CkbNuBL7Bz9h/2QyyjlbeXJ5FDNp+bEGkz/ea26CVU0oS868pO3O3qUhz9bX7Jt1tam4UAdIPCf1w
	eenxUdxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtupg-0000000F20C-2wKf;
	Tue, 11 Aug 2026 22:20:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtupe-0000000F1zy-3TtM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 22:20:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 28A9D43FDC;
	Tue, 11 Aug 2026 22:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CDE41F000E9;
	Tue, 11 Aug 2026 22:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786486826;
	bh=2PqIr4fmxyKnYA6iGlh4mS7egkuY16Gey8TStUT6D1M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=S/6D7XHT9FGfHPutlacLa6+iaAPoW4X8kDi6DMftL9dHMThohK/2K4++IZCBqilkf
	 6BsSvVDCRpgko8MCBdqP4v2neSimnmMtzlkoNexz5VNLwz/msZ9rfd1ZgGWbmennQn
	 aj9fVLQEu1oZobXJJFAMRCUk2BsCVeA7T56WG4RIas3hG1hFY7g6qks057tHC0NxNW
	 n3fVUSZh6xHyZIFOwAd8gFYQsMrCn2t+fCduf7n073LP/S4n6SJl09DHpaijzKLz6d
	 jCzNmgU2M247hnrnbk41EAqfM+1tZBV9vbimjl0uPcIzDezhibcDZFoDQ5ZWvawUPL
	 prapXu5z17gig==
From: Mark Brown <broonie@kernel.org>
To: Daniel Mack <daniel@zonque.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, phucduc.bui@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260811100949.61142-1-phucduc.bui@gmail.com>
References: <20260811100949.61142-1-phucduc.bui@gmail.com>
Subject: Re: [RFC PATCH] ASoC: pxa: Use devm_clk_get_optional() for extclk
 clock
Message-Id: <178648245852.119683.17286838052552347114.b4-ty@b4>
Date: Tue, 11 Aug 2026 22:07:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137; i=broonie@kernel.org;
 h=from:subject:message-id; bh=7Jr8fo4boJSL1ugftBxk4l8ujAkN96ATmdOYTBeOT+s=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqe6An4W7quwZTF0WWBqSdBtzwhPLKjxzXbBt3+
 pkpojzQv2yJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanugJwAKCRAk1otyXVSH
 0JxXB/9NfzVHgUpvmMC0HyLNxNf56+nUpXFElK4awv1etNBi6ectrnvEAf5tQLS5utQYVyYCI2H
 Vl/XZIS0Uqo0qTGP0WYX9MB751jigeXB0w7qyAK6qUAg+V8p/irG2HJlMD5Y5L08w8rqkRuhgIw
 P8tweuUZJkW3TdcARG7CJEjM5VI83phPvBKEubJZVtmUQ4LkfsN2oCQRuxNGCOtLbz5DfaBko9Z
 EtEvJ0vt1j/u9/G0s4n5G4IGcWzTlz+rCISgQ/NCrz2TgxZxfsZly64CbJXuYgx35n7RKcc3qoT
 lIJ+zePPfdLHp/bENbXgrt2eIpfzq021ayy64ouIoNyIg1jo
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

On Tue, 11 Aug 2026 17:09:49 +0700, phucduc.bui@gmail.com wrote:
> ASoC: pxa: Use devm_clk_get_optional() for extclk clock

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: pxa: Use devm_clk_get_optional() for extclk clock
      https://git.kernel.org/broonie/sound/c/6ec64d757af9

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


