Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF865C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 19:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=36WmwT4B0j2EfYZiQrbF78vzzIBlSY7w63nqiE0IvVo=; b=ZYGCn+slDBQ1zfKUCOuxTDW9X+
	DdtMdxB4i6Pdxu9newrLcNy74lyxElliObYNGAptjgJ9xT3OZBAzxTlJ/xq6t1RM3JUP7sEbta/ou
	3bQUZ/khr3edgg0npcdyx6M3YfhPPDebi3KTu1HlGXLR0AAx39Cw9S64Tv1y3ssFRtM8i/JDhsb+9
	K+aKYzL8tDi7dLIqJvO5+vdAK8Wd++s6TqCxw3B6BF3w4fDEQmtGFb2zVNHRzkpkcKw5yTnyvTaE9
	S2zc7Hx4swRt6edH3wJlBe38PGQZ1UXpql47ec394ueuwLM9+7Y5PZUJRXiF1L9YRavxB9BBCqY82
	3T6QB6lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYV9s-0000000FqTt-0mjY;
	Thu, 16 Jan 2025 19:04:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYV8c-0000000FqLX-3CDb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 19:02:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 66F195C4834;
	Thu, 16 Jan 2025 19:02:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B0FFC4CED6;
	Thu, 16 Jan 2025 19:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737054161;
	bh=J8ckeavHnnb0wC61NIEFo5/ycFAulZz4dh/ZOHgvypU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ricFobGwgxAa2jxKvfTbnaueKbSdrSbtvo/Lenf4SyN4/isL8HfXBDyzU+Vt2DI89
	 ze27rydlcRgs0IZ3N+tlJUZ+vWuXoV4kat2b1cIUzAJvrkg+blIqqZQN90hIa7dv1c
	 TNp6WGiSm7aeLJH3v1LFEOSDoQZzhMUpCjazx006ALiBGzTGD0epp0htujgYkj3HX1
	 4tkAPHyYZPV0NIfczEVJQrr7OoRRN5jKfFylV81RXWfCGjr3QHHNvUj1sfGDYbfnSD
	 UOun3CfX1RmBGMvZzomqP4v9Ql0uM6DpNC7PdE5nCEgXryBI40kqgm7lrwo9/9N8CA
	 ccCTkCcmSylZQ==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@xilinx.com, 
 Michal Simek <michal.simek@amd.com>, Michal Simek <michal.simek@amd.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, 
 "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>
In-Reply-To: <90075f57ceff7cdf958d0d146f46f50661335236.1737039345.git.michal.simek@amd.com>
References: <90075f57ceff7cdf958d0d146f46f50661335236.1737039345.git.michal.simek@amd.com>
Subject: Re: [PATCH] ASoC: xilinx: xlnx_spdif: Simpify using
 devm_clk_get_enabled()
Message-Id: <173705415989.65379.6502252093560086955.b4-ty@kernel.org>
Date: Thu, 16 Jan 2025 19:02:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_110242_851644_AC1352D6 
X-CRM114-Status: UNSURE (   9.83  )
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

On Thu, 16 Jan 2025 15:55:46 +0100, Michal Simek wrote:
> Clock handling can be very simlified with using devm_clk_get_enabled() as
> was done by commit 8d2aaf4382b7 ("gpio: zynq: Simplify using
> devm_clk_get_enabled()").
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: xilinx: xlnx_spdif: Simpify using devm_clk_get_enabled()
      commit: fee89ddd76e45841a2b01d87b481bc02483f4572

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


