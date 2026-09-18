Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0BE4C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 21:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLR/L/o7Vo7FODu7d9J5m8U0h+FySOCRHByc1a3Z2Ow=; b=oSQ7j4s5Zwo9JC2iL074JkebcV
	q4tRjZWNOqfpUauhOzZs1VaxN79FELE6mTMlLJIUZAEXZp42M+OAYe2a99h5bt2nNH9zVj3gRXouM
	uuRwOpdJEbcjIBlVqjCETx1fctxteOQ7yAfJjHnjK0XNnKP62t7zHZeF7LDSKllytVMFt4yYHfwCF
	s/eEaaWXE/CUQZqgMgZAncKY5BvvRU5xyYG+GJAt4bPCt506QhKhYLwIE7j9WEBZx9LSTyDAKSdls
	ipHsh/9uVJEIqzlYBo3obpKytD42pS1NnTN8sLWB94pKcQqHHpDKwfpsdtPsvEJaUPVUbluF8h+uw
	qMRecb5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7flN-0000000FXwA-1EEw;
	Fri, 18 Sep 2026 21:04:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7flL-0000000FXvq-3zSL;
	Fri, 18 Sep 2026 21:04:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6876E4008D;
	Fri, 18 Sep 2026 21:04:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF11A1F000FF;
	Fri, 18 Sep 2026 21:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789765491;
	bh=hLR/L/o7Vo7FODu7d9J5m8U0h+FySOCRHByc1a3Z2Ow=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Vye6PCKUxSZmy+6D3kv+/kPdICUI6RU/5EDdEGvtUNzc4BiiaDm/0qXOFTDYCN/Ql
	 p+aX5Dg8asYqe1CSAJO8Qa72oVMZfvMO8Ab8orvk7SGb4OlVqGtQfaxy2frOY8qOzR
	 aUGAS5J9jWNm+CUEo2rYyTM5doJF4rWRGlmOCBTaIZnQa533dZXRkskEjMF8/z+ONl
	 6rKgW+a35+2Ye+OHCLlmrNL3ob2aNgBq5yLPb16oP+z5pczGA7BoGU4pyCrLoJocvJ
	 sIz/CNW8nPGJ1a4XChOq9uxSLxTri3PdT6mykvn9D3idr4OOKOl0zNldIYpexp6d7S
	 /2GNZrMkhnAZA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Kees Cook <kees@kernel.org>
Cc: Kees Cook <kees+treewide@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org
In-Reply-To: <20260917211403.i.984-kees@kernel.org>
References: <20260917211403.i.984-kees@kernel.org>
Subject: Re: [PATCH] ASoC: rockchip: rk3399_gru_sound: Allocate dai_link
 with ARRAY_SIZE()
Message-Id: <178974993217.1717936.16569984082804245369.b4-ty@b4>
Date: Fri, 18 Sep 2026 17:45:32 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1153; i=broonie@kernel.org;
 h=from:subject:message-id; bh=10fwTwDJxY7TMGtl2vnmV0+ibDegGDd/hiGF/jeQKpM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqradtZogYYpkjLywUPXU00x+FPsBNffmfu0f2c
 BfHp/JoT1iJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaq2nbQAKCRAk1otyXVSH
 0HaaB/9TzZ1Z8LJB1aCGtbehX+m844nv2n0A/Ys33byT6xpFx4rNMUQNG6yKvHaIQJrQuz6bsXI
 ezIucAozYBZ99c893Rx79GeEmhc4vP+NmnHCQ3vzJftWnBvobOdS3UB3t/r/dQGI0dMSeY3TJGK
 sy4U0LkuoxuTnMuAAHkEbw0yO3G3hP7GTlT8RD3b6GosOEbcqbIkhk41xpWgZYK+ae6RQNQ0SHr
 FG4w0OV7hgs4tIMwXjXel8YFxXjeDHkvs1ByoFyKjCZEB60aEiCqiWxrleQGgkXm8qkVKfJLc1Z
 KC9vER2LbDmvkaHLp9cpnRUM6iE4e+mOdc/JRqH6w6lCCE3L
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

On Thu, 17 Sep 2026 14:14:04 -0700, Kees Cook wrote:
> ASoC: rockchip: rk3399_gru_sound: Allocate dai_link with ARRAY_SIZE()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: rockchip: rk3399_gru_sound: Allocate dai_link with ARRAY_SIZE()
      https://git.kernel.org/broonie/sound/c/8633243a494b

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


