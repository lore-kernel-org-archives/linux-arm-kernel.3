Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA1DCD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 17:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OdLaVCwOyuDeurYpZqPZMIvDONKwz5Fq6cM3k7eHo0g=; b=O2g1SU5zWCTYp9Zn3HDEeAGelG
	opph2x8WhQbjaFSNAb+owmgWx0+5t2OAdi6XpqoJ/3cSK51h2j8zNDWrPidcD2FEHIVJBW2ZLIVUT
	g5KHmUC4/CYeuQhEBoSxSFhRRxHlGvDGIR1T9tcvj17IeZw3GEps3/Xt3Jej75UC6SolGwUCoDbAY
	JI5LFe0eWXCF/wAUHFeoj3sxGciRMuSV6CNPAkR4fKcp/E+8/NH2f5laDC7iOHEWKPUv8iWCJVgRr
	aXQg6d6jVzYCEe2CRqyPx4iGe1FevxRuKiPNi2fTnWS+i1Eu08oF8X3+FEjEaci2D1cNBUR7s5zjz
	J5LgwYWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXjfW-00000009raL-0IEo;
	Thu, 11 Jun 2026 17:58:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXjfV-00000009raB-26xk;
	Thu, 11 Jun 2026 17:58:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 608E56014B;
	Thu, 11 Jun 2026 17:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 152371F00893;
	Thu, 11 Jun 2026 17:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781200696;
	bh=OdLaVCwOyuDeurYpZqPZMIvDONKwz5Fq6cM3k7eHo0g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=CcCJR+XJbXwmLbSgCj/9hq5qcM3YNulSkEAB7KTAmHZh4eob+8FKSSQjslgYaVidZ
	 +v3oWOQgqY8wQBW4MHTNYNHihiyQ5JOT5guRVXc1tToOjwDQKL2MOIvD7wuUxHcbGH
	 43tZ65rTsZurQWz2Qtq+Wuvmn46SwEQt3VgLC3gZ6Q/7LJOjmVeY1z4hxQFskuWOBC
	 r1PoR6o70WrRVjQokFrts9MfVU3FR8mXHPywqam5CUs10fAa9NLOE9LzSGnHDyRsiW
	 GewR9mt1ETVDeGPDPGd/a8ri0GsBQOdszE1DBKN7ByaqCBAw4wCywf0vt9Im91e+PA
	 wulZ+2o6HJjrA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939413930F87;
	Thu, 11 Jun 2026 17:58:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: btmtksdio: fix infinite loop in
 btmtksdio_txrx_work()
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <178120069313.286318.5639664453006485239.git-patchwork-notify@kernel.org>
Date: Thu, 11 Jun 2026 17:58:13 +0000
References: <20260609121329.1262170-1-senozhatsky@chromium.org>
In-Reply-To: <20260609121329.1262170-1-senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, mark-yw.chen@mediatek.com,
 sean.wang@mediatek.com, tfiga@chromium.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, stable@vger.kernel.org
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

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue,  9 Jun 2026 21:10:06 +0900 you wrote:
> Every once in a while we see a hung btmtksdio_flush() task:
> 
>  INFO: task kworker/u17:0:189 blocked for more than 122 seconds.
>  __cancel_work_timer+0x3f4/0x460
>  cancel_work_sync+0x1c/0x2c
>  btmtksdio_flush+0x2c/0x40
>  hci_dev_open_sync+0x10c4/0x2190
>  [..]
> 
> [...]

Here is the summary with links:
  - Bluetooth: btmtksdio: fix infinite loop in btmtksdio_txrx_work()
    https://git.kernel.org/bluetooth/bluetooth-next/c/a4263306d01d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



