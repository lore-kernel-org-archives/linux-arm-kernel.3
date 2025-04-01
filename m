Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0C5C36017
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 18:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LB5IRxPNWYdSS+G6MLjXl0IBrONExgZhEiGTec7yczk=; b=UqUF1M7eyO7fJtEQP2KA6zNUMk
	VMHdZBjnYGVg78N9fCPAEbhli6Y/yPCyqM3yvScEGBkpNNoj3b4cLkAC6WnuNvS+nf22m/is6FlqK
	8PeocbWftn4dzyQ4MoIcc6X3rlbUZa1SSJXS1u+OZK5b9j8fWEBkWxG1NXuctjLbUr4PyJZVrdfl+
	mwljIuNv39aqIFynKiEEiTmTQ3svXiC9/zixo74kLclyVFQ7dqQ+HD1cZv8mSCYbTATbMSStwGeyy
	CS+H9Ey4zWg3yiTQaNfRMEAt+xazXAOKgELzOHMcPgaXSK0OXf1X9Ra3fM36hRXoqH1meo3vuh01O
	i+DJme1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzg0b-000000044Wi-1Ulq;
	Tue, 01 Apr 2025 18:06:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzfyn-000000044DY-2JYz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 18:04:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C29268409;
	Tue,  1 Apr 2025 18:04:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48C5DC4CEE4;
	Tue,  1 Apr 2025 18:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743530692;
	bh=X3UWVR5FrAiTLHuUdqDGWuSjTyf0NcWGQa2Gmhjp7SI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=h/i+k9opvXNDV/viKgz+IkFJDV0Q/+srL6x1bADFHk/mNdi36uSTPuGv5g5wlUNOh
	 6nTKRTXq6KItqyV8v9GzG52p1ttKL/MYNkyBNpj8uScFbZrEjS0bNcoGAg9RXnZGAo
	 HDXCYaH9bFx5OIdBohOCn28yQ3WawNYDtNw47zX+kv7v2sdYPNQw+0wYns//VNVt+q
	 L8I+jUstMjum93FaeEfdgxeeP2/kDfqmj3ZRRoJ3zFZnmyhc17xR6h7fJsP3l0ai6t
	 4yZVNp2B0kHRdpLkiAOJsyBz7/9VtTlupu9J9HrsATz6sjr/RzT8V3wmwEDU3iRaiJ
	 2FZWVFt4Om9qA==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, xiubo.lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, 
 Henry Martin <bsdhenrymartin@gmail.com>
Cc: kernel@pengutronix.de, linux-sound@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250401142510.29900-1-bsdhenrymartin@gmail.com>
References: <20250401142510.29900-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH v1] ASoC: imx-card: Add NULL check in imx_card_probe()
Message-Id: <174353068900.126969.2791062137526970115.b4-ty@kernel.org>
Date: Tue, 01 Apr 2025 19:04:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
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

On Tue, 01 Apr 2025 22:25:10 +0800, Henry Martin wrote:
> devm_kasprintf() returns NULL when memory allocation fails. Currently,
> imx_card_probe() does not check for this case, which results in a NULL
> pointer dereference.
> 
> Add NULL check after devm_kasprintf() to prevent this issue.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-card: Add NULL check in imx_card_probe()
      commit: 93d34608fd162f725172e780b1c60cc93a920719

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


