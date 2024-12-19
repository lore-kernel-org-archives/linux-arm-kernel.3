Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFC6E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 13:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WLActdDddzGC52gNXiviX7j2KGTeoX5eNgyQLpsFBgk=; b=B0z47WXLMO9N4ANDesf3Qx+IqH
	P2SSv+8t6SfpXFYymqpCS+Tw3yCJiyB6SYmoEGJZZt90+lzojCVkU7dEVdPLYR0dspku8VqFCK6SY
	XO00Fuz3abuTbmg8j10pIJI7hxUmCrg43tPHKgSeOPFT2FfkyCcNne207fUGZbs/mp6VzlLf/vhF+
	LOi8Is2dP4Z0PHIjZ74uq0mUEMnsAWEl7otKaaN4HFVmey+e/bd8vtvQFqiU3hERPNUEPv55k5Fr+
	915bnU/si7dzflsoTOsFR289G029qj5rc5S7gIIKq/nyrD3BJ2OSpT8oyF2JEflV6L+Rmd7lnwYaP
	W3pt2QGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOGoQ-00000001yxW-1siu;
	Thu, 19 Dec 2024 13:43:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOGnK-00000001yqw-0vPw;
	Thu, 19 Dec 2024 13:42:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 431585C4D3B;
	Thu, 19 Dec 2024 13:41:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99276C4CECE;
	Thu, 19 Dec 2024 13:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734615745;
	bh=BodwEG/s3P6E/2NShk1XvM+uIPEsnANNhnnZxJcTT7M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BMUD0UhBjwvnBoIorrBlY3odQNadBDjOgWdEwxwfK3rMJ+7NluOYcvhy9NLIRZ76z
	 Co+4FlyIOtmX0/CAx9wAvH2dQoEDJik5ZQ9KEExaXg12ZygauOWaxkIOX8IIezaGDu
	 mBK3+rIfXXYPNbVlQ0pqw1OWItnv+RS6Fqt4HxmFLpr0y+PdY3+GLWmxo6f4alaczx
	 sOcpeN6iuzxrMelvou70olDMXNF013w9288dHOfgZ+hzDEdlxpygiG18ap7JeAt1ij
	 6UfgLtJCeNirjSMS7PxLcJpb6eAe1m5CKzc+0Q9gK3LwnMrqA9L2FmRdeLtUBPOvN5
	 i6ow9TW0DrF9g==
From: Mark Brown <broonie@kernel.org>
To: Jon Lin <jon.lin@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 heiko@sntech.de, linux-arm-kernel@lists.infradead.org, 
 linux-spi@vger.kernel.org
In-Reply-To: <20241219010557.333327-1-jon.lin@rock-chips.com>
References: <20241219010557.333327-1-jon.lin@rock-chips.com>
Subject: Re: [PATCH] spi: rockchip-sfc: Using normal memory for dma
Message-Id: <173461574310.119842.4743816830245681721.b4-ty@kernel.org>
Date: Thu, 19 Dec 2024 13:42:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_054226_305728_CDFE0804 
X-CRM114-Status: UNSURE (   9.88  )
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

On Thu, 19 Dec 2024 09:05:57 +0800, Jon Lin wrote:
> Nornal memory CPU copy with cache invalidate is more efficient
> than uncache memory copy.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: rockchip-sfc: Using normal memory for dma
      commit: b69386fcbc6066fb4885667743ab4d4967d561b8

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


