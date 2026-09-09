Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE68CC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 15:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N1xYCSvxoAh0TwMDMkjpVQHuszzy3lQk1Ry6iw5bptc=; b=Y7uvu/+exU6vf42ne8y80YsVyD
	D9hb7Tm+92pvZd4z9D0HFmdaE7NVMm91nY2jlblR3vdV0nMa5t7Vi5WNvwNSNaRNKNTN3J8H41NIn
	+3JhJfctxAU2ev+BpLATyrBcfTNtcEQJb3qevmw0Vj9Tay3ggOjppSI/AybAC9jIvcKZuui+sZ+3t
	QqPCL9yIDgniCkO4CcV6aJa+0GisyQ0f+Ip+pnKFyVj0omRBI0gVSsQe45ZLtYAfkDHWSENaovH7k
	+7Vb9V8TOdjQoBRYcr60vEGa6oXOd3WA+v7c4M/8oCSYnC3g0IC+a3fItneqAh9Hmsrw9j/CRnE8G
	TREVEJQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KcE-0000000CEWC-0kVd;
	Wed, 09 Sep 2026 15:53:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KcC-0000000CEVa-1NOP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 15:53:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E44B600CB;
	Wed,  9 Sep 2026 15:53:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A56631F00A3D;
	Wed,  9 Sep 2026 15:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788969215;
	bh=N1xYCSvxoAh0TwMDMkjpVQHuszzy3lQk1Ry6iw5bptc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NHgFnKBx6CvfF2oBxHalmk3JXI5oYzmjPeChM9yw6kow6gi1N89jCycvhbfhAWDMl
	 j6s0o3LvFsgYkk9DfVBv2Tx1ljTPxUMxKxBdZ+Tu6I4az88smO3Juy3agcTwQEFIBP
	 Ab4z5KFYp3XKIQPKSjKbn0LhCYbd+OTrda6eaTrqwryM6KMxIY2WTx6COGgkohj59o
	 C2xaz+uTAPPF5YYhhE0eg54me9By5sjClA0yMmX9pnb90wZGORP8UxhefIfOEr8JQs
	 4hhGV/9s8QDr9dhE2fkuLw6SBMOPSsJgGAdveNnXBgJTfDghIeRpUmJw1jmgt9mUc2
	 Q5EWxYn/lN/kA==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Michal Simek <michal.simek@amd.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260824203024.15574-1-rosenp@gmail.com>
References: <20260824203024.15574-1-rosenp@gmail.com>
Subject: Re: [PATCHv5] ASoC: xilinx: formatter_pcm: use more devm in probe
Message-Id: <178895440427.87467.10964819103544860147.b4-ty@b4>
Date: Wed, 09 Sep 2026 12:46:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1119; i=broonie@kernel.org;
 h=from:subject:message-id; bh=iGJPAj/V67BbVXmV2Ju4rX/PFud28VjwzEtTnJwivqU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqoYD710hcE9cvZ0xKQ3/7pDaOXY5+7VhGkSPEI
 l/J+I3Y9vSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqGA+wAKCRAk1otyXVSH
 0LCECACGkPl6cqugEYTlF3XuP27hk1tNSGISjB2KkwvReRi3HFoWkP3fOmYVey9FihSXLM3Kjwe
 qNhTp1IJPwhsQSrzsszuSjJYRO4yR6KMskBeDNQ9vi6e8x+HFqMU64z14r6jwTVAY0ST3ElOy9e
 +wpGRF0h2KA0YOXKj1Aj8WMtAXvlHB5jrsSZk0HbquQ44tihObGjijM5wDttV7sDIzia67T0pJV
 mW4DX8EU9JdEWUYNhraRXeDvk11z7PyJHdcnhkrW5Q+nZUODw69js7tLRxlKNLBkgygfbl6BP4h
 6PN3b4imEQicQmJjW4v5nhzNR+nJiIphZO7O5w4RYfo3+olZ
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

On Mon, 24 Aug 2026 13:30:24 -0700, Rosen Penev wrote:
> ASoC: xilinx: formatter_pcm: use more devm in probe

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: xilinx: formatter_pcm: use more devm in probe
      https://git.kernel.org/broonie/sound/c/3df676110416

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


