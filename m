Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924EBF532C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 00:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8YakcAdwU0yPK3Lv25d+UExTvV5PN99MFkItEin5gg=; b=OBYaoFCv81hMNA27H0ZfSDFs33
	ebs4QgJGgnIgMTPj8w81fEUSxYUK27bKOwPRFGB34Wv09+P06GuQLr52o5fDF/rUaMOyRjgs2SFZl
	DZclkUQBtPSNVQ5It/ziKFD5m2a85T9S8f+NMxiQzRfS+6VUDOHLZkDdi6glX3k1qQRHzfA8mL2wG
	VHJ8F8rQF4oRUPvM/qOmnsLvKyNIOXFNCopRUhQiI7DOkIFP+/aAfB2UPulPpueyTc0H0tV0E7abS
	1cFAki0B/h+FQgrlwxuRblwz6qq54TDfnFB6QJYMvDi0rM/0osO52BTCy73YhAoiPtPzzqPsGsTLK
	I0Qi/9Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4q0N-00000000Gg7-2V4t;
	Tue, 24 Mar 2026 00:52:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4q0K-00000000GfY-2xe3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 00:52:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 697D641884;
	Tue, 24 Mar 2026 00:52:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD8EC4CEF7;
	Tue, 24 Mar 2026 00:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774313540;
	bh=Kqmy4ocV2M8B5x1XI7enz01J/VpFK+natm8DU5YZOlI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PmMIM0A4qRK4cY1IJyrhbdXl3FSsQlbXlcnBc8HmDANbnFZIerfm32VeeChZ2uWzg
	 CVICPqxYUtc/p6uASO0kjeJptOM2eTMa+PQ7fY4q3O+ZA4fHAFjQ/+eK7ZiUt7p1a+
	 03Lgy53SRCRXIsLOxf7Dssq45/rWr9wnMGFDuaQq9OTy01oFc9g8M39t8m8IFVmS+t
	 6/9RjXPtckhONLewjMM2IRtG5PWrc0nX92PFiyIsVU/RXbVdG42Omxblgx6s/xukHX
	 0HpEwrYhVVyEPeLR0gVx7yuecTYWQRqQch0v+5kNRSvApdpKzKPleaFeiJckBFv2vI
	 0XhX8UFnwOsQw==
From: Mark Brown <broonie@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Chen-Yu Tsai <wens@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chen-Yu Tsai <wens@kernel.org>
In-Reply-To: <20260323172450.1259111-1-wens@kernel.org>
References: <20260323172450.1259111-1-wens@kernel.org>
Subject: Re: [PATCH] ASoC: sun4i-spdif: Make reset control non-optional and
 check for all errors
Message-Id: <177431115354.811880.16400372395326630860.b4-ty@b4>
Date: Tue, 24 Mar 2026 00:12:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=openpgp-sha256; l=1168; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Kqmy4ocV2M8B5x1XI7enz01J/VpFK+natm8DU5YZOlI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpweBBH64WLacTjdO9ia+cqGaz97h1TIMLdZRvY
 KUpltXD9WWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacHgQQAKCRAk1otyXVSH
 0HCbB/9SwEMe57/ws+kT/TSrY5Ar0bpNt/qWmRo7Nrip21CVEbhEXL9zv2CfEdKgeI9EpMFaQw9
 7hjeXTeEo0bAXFaQu2a+jeVFIeCQZlADacEmuxbM6yxZ3tVM8/zXV+8XXFiZfFIW7QeOQyywFET
 1sjHvUSClBb63ClQQUkxjM1dOsABERU/na9MsatZEi7azN7PcOvNWmbZxPsmr1bJBo3BP9763H0
 L2IOJR7PjTQ0LwComIhIQiPOWPWhwT35IHBzOMIvudXIdRdnmwyV1WfezDGacvLGreyNMEwvCEu
 YMyUYIVD0inA+MmCODLj+Hd1CHXpm3TS1jMZ720ANiha0jdo
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_175220_767798_5B6BBBD8 
X-CRM114-Status: UNSURE (   9.26  )
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

On Tue, 24 Mar 2026 01:24:48 +0800, Chen-Yu Tsai wrote:
> ASoC: sun4i-spdif: Make reset control non-optional and check for all errors

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: sun4i-spdif: Make reset control non-optional and check for all errors
      https://git.kernel.org/broonie/sound/c/51b0909d0bc4

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


