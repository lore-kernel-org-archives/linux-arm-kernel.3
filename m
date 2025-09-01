Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEBECA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YPDpdrlAt+g/liJ07vsdJcZrV0S5aUK3gYKnW7keQBI=; b=E7hq8PNRNmMDVCQwS5zbb+NQEC
	TdZVDgae0p6trclNXpSfm21eR/X9AtwWw3wiWhUTZLQ7Loj0gRKvKug+b9JgVFY2lOAAdqLnIHath
	xh9xmU6vA34Bg9W+pn4HyYNSnGg9wzHWXcNzThIxATIz9frWhDw4MVTIvBiiniPphmzPZ4uH7UK9W
	wpvaP6yZVwxqyV+/7stvIOPJrQ7ii+8rN2lLxJJeDKiXmI6HDLhMr0PifVrHswWlfw6oOCNsuRbWG
	wquiHM0tvG+ugsGcwnvbzxVisYYJt+vZJOPxNoWpCktIGax7DsVpVPd4zG9+yaBkawu25hL9XEaSD
	mvtUW5KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFHJ-0000000EaE7-3DC2;
	Tue, 02 Sep 2025 00:53:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utCo3-0000000E5L2-3Guw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 22:15:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CC605601DA;
	Mon,  1 Sep 2025 22:15:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 710C6C4CEF0;
	Mon,  1 Sep 2025 22:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756764917;
	bh=8uAKWbLvP1JhsUUPjrpM3S120Et8nLPU32AZnH1mpuw=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=TzSkoxwZfGvW1SDB4X8VCWoZN5VQVEks9sWvRhg3kaR83tYDuOrwBuoHLkjGeo5kF
	 /aTaGkLYjkRtxFKzdijJ3UHxkBXMclitlaOpini/sjpH44cW/qVD8gic5ncADQlFIm
	 Spe7agkHqvjipAU33fA7wVFBZQZ2KyVDPFC/T5RogjKylCNc2sdeQSNQ1BRZwzFJ9W
	 +8RWGGeF+bL/eGD7rdnFneFE9H8bW2Bt1pmS1RF2HNxJSMoV81EtkoVvfSsF0cUz3N
	 joZSd4cX2iiad/TNVYkdRJakTuojDnEUpvo9FAtx55o3FN2zmhx/6oY3oI2g17p2ks
	 nyxo6OvdrsLEA==
From: Mark Brown <broonie@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Qianfeng Rong <rongqianfeng@vivo.com>
In-Reply-To: <20250829101411.625214-1-rongqianfeng@vivo.com>
References: <20250829101411.625214-1-rongqianfeng@vivo.com>
Subject: Re: [PATCH] regulator: scmi: Use int type to store negative error
 codes
Message-Id: <175676491502.901001.14592841978206903121.b4-ty@kernel.org>
Date: Mon, 01 Sep 2025 23:15:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
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

On Fri, 29 Aug 2025 18:14:11 +0800, Qianfeng Rong wrote:
> Change the 'ret' variable from u32 to int to store negative error codes or
> zero returned by of_property_read_u32().
> 
> Storing the negative error codes in unsigned type, doesn't cause an issue
> at runtime but it's ugly as pants. Additionally, assigning negative error
> codes to unsigned type may trigger a GCC warning when the -Wsign-conversion
> flag is enabled.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: scmi: Use int type to store negative error codes
      commit: 9d35d068fb138160709e04e3ee97fe29a6f8615b

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


