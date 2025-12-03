Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED65AD15DB3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 16:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SCL9jQ+9mInDWxc0m+bvuqpLUoH2l1iKsgEK61ZiYH0=; b=TCZUsW2KKtXkr45klrtcfMSFDG
	eyLDQpVF0cYkA2R/f//8MElTlZNDb+QmYxsSJxq6LDKDdycG23wUUlprZuCW2aFh34X+yZyEA3hT1
	UV1tWHH/lI5t5PXGxgQcWlkJJSFLmooTHcxuf1M5khD3jr10cmDn8SadBQjDgscGhMgtUvQo/ZfyC
	suXOQx4ncJ/si1ddIb9GzcdZ6enXVoFI5E0m6gMT8J1GX5IpUU7iuMzfpBpHz/Z0o9Je6aW6OD7PR
	ZKO8FZNDDOHn9gUVmN6PsIWLkZp4ZLPN+xBy5Uq2QTUQQQw4WO1jDH2b+oaDXu8hj+gHsc7ei1aE9
	io5RR5Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQq3L-00000006pGe-2BF7;
	Wed, 03 Dec 2025 16:50:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQq3J-00000006pGI-33DB;
	Wed, 03 Dec 2025 16:50:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 94C76601D5;
	Wed,  3 Dec 2025 16:50:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C21D4C4CEF5;
	Wed,  3 Dec 2025 16:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764780604;
	bh=WE/MGjDXYkfLp/ASxbUyC53LMNdsfobdCP7BxApY2r0=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=kOSDsoBa4+of4dbFUeN3S+S0nuqVts/bOkUwD16XwQbjzVTj+NhYD0LIkxhGFWfm0
	 LHzLg4Lifd5kiuroMAtL4WmHEdGD+YAL3dHVIa7frayQuQO71IkhZzMpkHsQYrudGo
	 ZlVONlj3lmqwTjyJqgLLB35t9c7ZMyWsyknuCS2O1NBjhbCVPNc7XGO/rDPZz4YlPb
	 HjRpjmwl1C+zTO2EuQw4+DSnaDLHt1+DmRmzvS8nCUZfN+X+tUal9mwxUFTnzp19x8
	 C1DhWNMXK9YLwFFuFv46gAZaGCczke3v0ca5vq8FgRWm7Nu9Fwf++Fnfn5BSsNGTDM
	 QevwICvNEOOFw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251203141644.106459-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251203141644.106459-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] ASoC: rockchip: Fix Wvoid-pointer-to-enum-cast warning
 (again)
Message-Id: <176478060152.99790.2704238708778622367.b4-ty@kernel.org>
Date: Wed, 03 Dec 2025 16:50:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78
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

On Wed, 03 Dec 2025 15:16:45 +0100, Krzysztof Kozlowski wrote:
> 'version' is an enum, thus cast of pointer on 64-bit compile test with
> clang W=1 causes:
> 
>   rockchip_pdm.c:583:17: error: cast to smaller integer type 'enum rk_pdm_version' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
> 
> This was already fixed in commit 49a4a8d12612 ("ASoC: rockchip: Fix
> Wvoid-pointer-to-enum-cast warning") but then got bad in
> commit 9958d85968ed ("ASoC: Use device_get_match_data()").
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rockchip: Fix Wvoid-pointer-to-enum-cast warning (again)
      commit: 57d508b5f718730f74b11e0dc9609ac7976802d1

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


