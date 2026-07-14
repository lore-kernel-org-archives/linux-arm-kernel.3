Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9CDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 21:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EK5o/511Bfcsxnar1fnZzffAtXzmW6biOYC0uNIDMlk=; b=EZxHmKolT+0x3Oo8d+VcnZuUwA
	a8ms8mTwybbwxirJdLebDqtYBvV4SF9BaYuCLKn0Jb52CGbjuWK5cscr3etGtTL1siliSkITaJAls
	9jbY61Q4/I8r7UBbFzh+xVEZsz/Xqid9+GY9XLR7wLu/LPHp+xdsCqIK41ZwWIv9H7NUP58F/NWb0
	ekxX2bQWwfG+8LMNcDKHwB5cMhxgvrnNZzurHXiwVHIHz3u6r/OIT2W/hGuguXWSnvXlzToMJb5n2
	JCploLTMCXRUikp46amnKuLIAcuL+au/flpPDkq7dNKDQ1ZZkG9ZoWGADgOG1c4QK+TGH50kZmYJw
	wVQ4ntCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjkcY-0000000DLAz-0kwt;
	Tue, 14 Jul 2026 21:24:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjkcU-0000000DLAO-2rMs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 21:24:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 63CEF40E0F;
	Tue, 14 Jul 2026 21:24:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED3711F000E9;
	Tue, 14 Jul 2026 21:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784064290;
	bh=EK5o/511Bfcsxnar1fnZzffAtXzmW6biOYC0uNIDMlk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=abQt8dzN6ZV4uQXLg0CR4SPjxrufm3lQ95gsI4fyCJ2TYljL341LTXHMF01DqVt0V
	 VlIq4z5YoJz/YQJKKFsEFJIJwv4qrAsWUdKFsrfg7QkZ2vkZ0+NDusREANuOwHx8I/
	 H95nrwzALiFmi6GNHaQuyyGyRU6poh+kmXdw1oi+b1KZBgELvdaTSUvZn0EA3PkMdd
	 zfXsYpGKebvBrbNBPD1a7Oy5Np4UwPzqaRP85fahPI86DEG0Ar9gvS1uM5oNbTOQ16
	 wD1B6ybkeciy7ZOMP2cmfYUhzi2grfU8SVxxSM+RVPlnFVZnwqAh+51qMQzroqOEoh
	 nOeFQ/qsyvfPg==
From: Mark Brown <broonie@kernel.org>
To: Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260714113304.270224-1-wens@kernel.org>
References: <20260714113304.270224-1-wens@kernel.org>
Subject: Re: [PATCH] ASoC: sun4i-codec: Set quirks.playback_only for H616
 codec
Message-Id: <178403959229.7661.10222342202160410934.b4-ty@b4>
Date: Tue, 14 Jul 2026 15:33:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1134; i=broonie@kernel.org;
 h=from:subject:message-id; bh=12s8fzNjslyFuFEky8pEZ/IzdrzMoQB35exv4PxhEIY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqVqkfLA3mqg0aAtZ38HIGHw1JSBhsmPDyke+y5
 wqOwmhXH42JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalapHwAKCRAk1otyXVSH
 0HrTB/0ZLDG80c56Uxwv1qhhIYC5/PO+el/BNEiqcg0EFn6lDsmIt3VIHCJx6vlKfHZac2Fqycb
 cR7bY8krEoy0kwop6URIp+Z/K8MHfz2KS693xJoqrtBXi3yzRMMzYHVeFTwRCj7R1WcQYD8rC+7
 uA4bJJe87mv8drb2D3z7+SyxtyI99NeqyKKryHMzewOdgST8hrlWduOGQdLeveUURLEEV0glkK4
 DpOtmfMuX983fJiRyg7Q9HLRljsRBfxwDevMeoGqZQpBQ8I6bmrzJi7bDwXmwiaO/8zm+UweIa2
 E56OppcNNBhFVRzBKCrH4Wpz3GQfC6qnWXnkmqKmSIF0qvC5
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

On Tue, 14 Jul 2026 19:33:03 +0800, Chen-Yu Tsai wrote:
> ASoC: sun4i-codec: Set quirks.playback_only for H616 codec

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: sun4i-codec: Set quirks.playback_only for H616 codec
      https://git.kernel.org/broonie/sound/c/d9e96f859de3

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


