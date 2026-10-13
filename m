Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23EACC6B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 10:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7XwBUdyZyS/LaA1ldj5S/uuuK5nn6LjCdzqMfMihmeA=; b=VSmQdUsylnNciASFxNFqErn9zL
	rVFaAqZmTzCFbYobO5zJpapoqwZTAYMHzkW+oKbfAcn7EEGYV83KIWTw8VdKi6epjinTMbo/5IQiF
	IYzvMKRbRmKjFSzhqVbHI8KaezmUmmmPWm6QDd0aTxac45uJG0+xaedgikWCHtUfKWk89avVackHp
	1RU7iRR0+ra0IXTQOIQdLLbrQdh2Yy422JEOGZjMequtOZp4qBD30CSpa6UHSPuBzE5odiERIqvdX
	BqQlWFAh3HumwldcfMZ5p7HDTjxBLLFy6vBD3w715Pz2RY8CQD4h7+dU7B5fp41vzLEEr/W0fFUgC
	8XssMLtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIkh-0000000HRrK-45v4;
	Thu, 15 Oct 2026 10:31:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIkg-0000000HRqz-39mZ;
	Thu, 15 Oct 2026 10:31:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 23BC760120;
	Thu, 15 Oct 2026 10:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B8281F000C4;
	Thu, 15 Oct 2026 10:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792060317;
	bh=7XwBUdyZyS/LaA1ldj5S/uuuK5nn6LjCdzqMfMihmeA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=F6lEwoxWCz0ZszkOflKRo1RoDREnQggCsAlTJyNQNqEltUCP6HQ5B2TZEYwB2EDSi
	 +OsMkIymm/iWdUxIctXt67rAvalr4XZ9+rt/CoDnoUxiBz/JTGZvL/L3lZE3+G7rs6
	 r8rFDkkTTmL6EKHAhT46u4U1A0HJoim4GLqh1YpJglbuSssqD2fWFJ78vDEhoWfJvp
	 TJY4G0MoayL5RZdj9bx8bgi0W2/RoYRgJj8RLZiTQLu9jEiMzcSupGdThJR/++fDL2
	 QDA+IDX1SV5B8qStUZW1Fg1h5jNVFIFCSxqOal9RzS0y7TEhX08LJosiK4t40lMcbQ
	 MdkK/IK1VvVng==
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Darren Ye <darren.ye@mediatek.com>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, cassiogabrielcontato@gmail.com, 
 Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260929061121.124001-1-phucduc.bui@gmail.com>
References: <20260929061121.124001-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 00/10] ASoC: mediatek: mt8196: Fix clock error handling
Message-Id: <179191028803.42298.330051148959418459.b4-ty@b4>
Date: Tue, 13 Oct 2026 17:51:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2467; i=broonie@kernel.org;
 h=from:subject:message-id; bh=F/60hd7S3sz9o4AFila58eYWswIu/XEq+oYcTTgU2hg=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIurJ6x9Lvxz7jj7B/kNBj23Zxw8cm/bc8/GtpHqp56b
 7BH32f94o5SFgYxLgZZMUWWuCzul/Ulr9fwHVzYBjOHlQlkCAMXpwBMZNslRoaTcjedXz2LLhBg
 b4yx+8pYEvTw85TA/guucdHGuSnXAoQYGXZkdpzoCOWfetBA6ueWT/cuh4lNuzLJOW5xtemNyyv
 kyrgB
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

On Tue, 29 Sep 2026 13:11:11 +0700, phucduc.bui@gmail.com wrote:
> ASoC: mediatek: mt8196: Fix clock error handling
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series improves error handling in the MT8196 ASoC driver,
> mainly by checking and propagating errors from clock operations.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[01/10] ASoC: mediatek: mt8196: fix APLL mux error handling
        https://git.kernel.org/broonie/misc/c/5a0caca149f2
[02/10] ASoC: mediatek: mt8196: fix APLL enable error handling
        https://git.kernel.org/broonie/misc/c/23239cabb6d1
[03/10] ASoC: mediatek: mt8196: fix MCK error handling
        https://git.kernel.org/broonie/misc/c/bc0cd0eb0303
[04/10] ASoC: mediatek: mt8196: fix register access clock error handling
        https://git.kernel.org/broonie/misc/c/2844ba593741
[05/10] ASoC: mediatek: mt8196: propagate main clock errors
        https://git.kernel.org/broonie/misc/c/c33bc2dd217d
[06/10] ASoC: mediatek: mt8196: use dev_err_probe() in mt8196_init_clock()
        https://git.kernel.org/broonie/misc/c/b6f0d0e800b5
[07/10] ASoC: mediatek: mt8196: fix runtime resume error handling
        https://git.kernel.org/broonie/misc/c/3a9a93cafb37
[08/10] ASoC: mediatek: mt8196: remove redundant error message
        https://git.kernel.org/broonie/misc/c/35a7f9f4cd4d
[09/10] ASoC: mediatek: mt8196: propagate I2S clock errors
        https://git.kernel.org/broonie/misc/c/6c14a59bc503
[10/10] ASoC: mediatek: mt8196: propagate TDM clock errors
        https://git.kernel.org/broonie/misc/c/d09412f79d70

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


