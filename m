Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AAEACD8CAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 08:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g9i0x40H0Bbrg9uecEkCuWCtLH9BINZc9mE+DeLnqEE=; b=ykaG6L1lcxsk6hfOtnqMj61ICT
	fwlh80t+as04MK0cCtbTssYTm3LnY+yWxBFsr9ur+wzIaCNlXmbRRZLuawzCg9JrUDNtCZZJxKH6m
	lKfc/ovb8eUYX60NIQYdHoZ6lFtzNpLY9hbhBSYi0dueta4UuD6o3sxddNVosof8Q7kAzHFLsE1Mf
	1Dpv1XqyHq/aw5AcX7ZMj/VnrPErjTDg0kWoWX+uEMKxOb4pDwey191bVz9ZFqeTE5zlloPtZ52aV
	Q9BOycA5kK2PCM0VD0TWLbRSULb10uEupWUE9coz8P1j6lRzvvxgtaXUzdUK2d0z0mnbptUz3CQfT
	67TkZqXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWs16-000000055cF-1SiD;
	Tue, 09 Jun 2026 08:41:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWs14-000000055bd-3V9R;
	Tue, 09 Jun 2026 08:40:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 49233601E1;
	Tue,  9 Jun 2026 08:40:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D64AF1F00893;
	Tue,  9 Jun 2026 08:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780994458;
	bh=g9i0x40H0Bbrg9uecEkCuWCtLH9BINZc9mE+DeLnqEE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ij1vg7vxEvcR9WYtXKnQf/yeFdbd0zGHUgK2MdXiigTL1LiYZ1xOJlGcEPC59XFzI
	 X5RBVF/qt4XQNRvYZXFOv1us2rFM0MplYp55aZQOum9ZyErtYGDjru/cxQ5eNmKwKI
	 LRVsQLi3CKgeHqNdwy8Bk7xD13LmcIGzPfWz+QojmnxwusdIZLlgj5/gCQiDdGjyWY
	 pNay+ls+JThjcx5M8QLKJlwsactzCwVol8C1Ac9zExlz1Om3ttrYcup8lIJmhymSMZ
	 ILuwVHXIR8BczmZ5uPP7mFvYu3MKLJpa/HwO9so9eUCS+nxKVdFFYGs6s5KrPe5OCS
	 AxfKidMWSUiAg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 kuninori.morimoto.gx@renesas.com, ckeepax@opensource.cirrus.com, 
 vulab@iscas.ac.cn, Tuo Li <islituo@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20260528064107.470824-1-islituo@gmail.com>
References: <20260528064107.470824-1-islituo@gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8365-afe-pcm: fix possible
 NULL-pointer dereferences in mt8365_afe_suspend()
Message-Id: <178094172524.20828.3703159455539806775.b4-ty@b4>
Date: Mon, 08 Jun 2026 19:02:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1200; i=broonie@kernel.org;
 h=from:subject:message-id; bh=hdVrRALsMIREIn7ihjdRcpf63ae8p5If5LNwop1xDLY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqJ9GVeS8SPkknehPnNp/lMxjPcs2Rkx1z3iMMJ
 8ws6nDdpz6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaifRlQAKCRAk1otyXVSH
 0H4KB/9FcdWXR1D5b0263Y9QjXLLjoaw69Hw1ounRpAGnrMqZ7t3Wu/tZ1xZdjqDpyw6OeUny27
 xc69A8TOvRKM0SkvYxQNbB6UejDP1X6JuzlxigNyM36C6twkGR5q0fwuKwQ302YBAFfiW2nWq72
 r5jhRMFZZdx+Dz76W+hXtIJ3/qFqAERwLsNw2Um6FeqaoPWEf0ed8oZTAmfvEF4EmZRbwx0+/oy
 mQPxx8pev7ZJOMrMbUe1cL829ei7+vv74ZBvHTsmhPmTO7CZifEwjsFiq39WYU0uwHjA3ix650s
 SJncaHJKjMll2pD1LYEYZd3+ac0wSwYvdLzdbvWUAL3Koylj
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

On Thu, 28 May 2026 14:41:06 +0800, Tuo Li wrote:
> ASoC: mediatek: mt8365-afe-pcm: fix possible NULL-pointer dereferences in mt8365_afe_suspend()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: mediatek: mt8365-afe-pcm: fix possible NULL-pointer dereferences in mt8365_afe_suspend()
      https://git.kernel.org/broonie/sound/c/b8948ac26efc

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


