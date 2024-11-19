Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B100D44172
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 15:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PxoTwElUI8LmFBJvIdIcO4Ch6bWOQR0Us7a6+HQCal0=; b=4awMBplGT58a4OFygd/yObmZvB
	us6q1tU5HThenQ2khVwnkMWI989smDqIbmmGBdrstR75U5CMD0Jv2MQqvKweWu+EE3Vsp8MDs9GNZ
	T/OfUpwI42L/l9Y2jsSXKeK2U3InBFwccs29aKWlp7WrfMzzROjpXnIzJ2gplCQ09vQ6FoLf+RvSE
	tBcvEX9EPKHxLui4aUeS7JD8varaO1xfkx8ocuKycs34S8asUJNYrnB6mpNYeyMXDJ8U2L3MN1SNP
	LoRykGuBhhbYiU7yrjnVu0VZVVofmoEEisZrq/lJO+2lCDcsxzCbMfTaqOSa6W8FtUSuTbOvpk1Gq
	SPI/rAYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDQ0Z-0000000CpjT-1lsX;
	Tue, 19 Nov 2024 15:19:15 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDPnJ-0000000CmXJ-3SMd;
	Tue, 19 Nov 2024 15:05:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 07296A42B41;
	Tue, 19 Nov 2024 15:03:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04AB1C4CED2;
	Tue, 19 Nov 2024 15:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732028732;
	bh=omKQ1LXz60S6HxBgblXKZPTRNsNAVHlmyvMzW5gHqZI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=H77Cyo5BofT2Mo7U07KbqxmaNWxSV4hXPpQ0DwTbvqnnQCsF13MsdlDphEyJE8xod
	 MSwHsn4XMe1f5J+5iZN0ln9IAaSuTBtoEzELQPLJQPQAl2tVlfo5RT2+ylHIEt8aZ2
	 zSzWnGqSVOwWRbSs1BeJjN9pRuEbwggP3L8Wc+Qgh29SxKGOA85b4YgghDaKfq75A4
	 QyrpwI1LDYJa1gjr01Q2XgtfBeHy2ByCbfGQ2aUcewiEp9zkuuaPgDKeo/vuj1+HpO
	 KhUCoijwlQDUHrg8uVAk2iGkFEzVeKtz30NJ11GSWPohoiglqhhqPFYrP0xnOaBZfN
	 rZ5w7qR1oB7zw==
From: Mark Brown <broonie@kernel.org>
To: Jon Lin <jon.lin@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 heiko@sntech.de, linux-arm-kernel@lists.infradead.org, 
 linux-spi@vger.kernel.org
In-Reply-To: <20241118145646.2609039-1-jon.lin@rock-chips.com>
References: <20241118145646.2609039-1-jon.lin@rock-chips.com>
Subject: Re: [PATCH] spi: rockchip-sfc: Embedded DMA only support 4B
 aligned address
Message-Id: <173202873074.60406.1798640869476341414.b4-ty@kernel.org>
Date: Tue, 19 Nov 2024 15:05:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_070533_927453_9E84CF80 
X-CRM114-Status: UNSURE (   9.47  )
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

On Mon, 18 Nov 2024 22:56:46 +0800, Jon Lin wrote:
> Controller limitations.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: rockchip-sfc: Embedded DMA only support 4B aligned address
      commit: c752e87b9c3982b78dddcdd70dcb826df3cfd75d

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


