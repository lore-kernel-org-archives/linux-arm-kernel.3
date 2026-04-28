Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01CEFF8867
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 00:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WysKdoXwhqJ+VgP0ns4MBI+fdYuf36NbWqzpnDhHT2g=; b=d9Y58w272wCRR1823ec49KE138
	svBQ+got5jjjJaWC9Jxih2MW5MC6YnT3BNFULtO2AG8vjGfSkOKefyJmkuX1HJQas1D7gT08H/yEt
	v3D5NeODdJXl9Abs1Ds6kwLwf2DyEJLGNhFOKoo3XOSQHxSP8p3MZiRYM1qmDITlXQIjXGo8z5FL/
	Tr+Lv1LstT/uydeUEG2ftER19URyybiroX5J21qWU+bBRPSTlk0K6/hzRoRvYSYAcVAtSyzTTBvJl
	XQrSeQBDT2mdJXPL4cGxTQF2d+yB4gZml5LZRdL1odEpNfBwV7G1CexSyC5RyXgteim3LGj2NnWUX
	N9/plV4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHWfM-00000000ME6-2sTO;
	Tue, 28 Apr 2026 00:51:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHWfI-00000000MC2-09Wg;
	Tue, 28 Apr 2026 00:51:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1062C60121;
	Tue, 28 Apr 2026 00:51:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8B84C2BCB7;
	Tue, 28 Apr 2026 00:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777337462;
	bh=VGh2L+COy3hGOTtTFrTSH55dIP8goJvnDbksuLcJVeg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gyXfe+J4lIazgN1Xp5kGiIFw4YwPi+6+vpIqrUT3CvdyTpbkMjw7GHgYzQ0hvrO6T
	 SQ1SCS7oG9FAW+948Mp0uc+f6HBNUat2HoJtaWLFK2ROW1Vh3C99xHmNzZm4uBsXjD
	 OPyr03wmve5YnUf3Ao0igIpCijsvi6ZGKweQNJpMTi+lkBYR/FCoZfIGxzim+Mkowb
	 d22EX2qGMBw+Y29lgS/jeXNFllg1bFW9/B4veG2zKWA16Q5yvB82Smm/PQmYwd7HAH
	 uHNWE4iBWX4aRDeo53P7uecv3Ohr1WrbKdW6MJJIIx262Jm5k9iPzvR0V4fe5pYcFc
	 IOR2OjOXUG63w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FD3738119DB;
	Tue, 28 Apr 2026 00:50:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: airoha: fix BQL imbalance in TX path
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177733741979.177472.4126211834690754531.git-patchwork-notify@kernel.org>
Date: Tue, 28 Apr 2026 00:50:19 +0000
References: <20260421-airoha-fix-bql-v1-1-f135afe4275b@kernel.org>
In-Reply-To: <20260421-airoha-fix-bql-v1-1-f135afe4275b@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, hkelam@marvell.com, horms@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 21 Apr 2026 08:35:11 +0200 you wrote:
> Fix a possible BQL imbalance in airoha_dev_xmit(), where inflight
> packets are accounted only for the AIROHA_NUM_TX_RING netdev TX
> queues. The queue index is computed as:
> 
>     qid = skb_get_queue_mapping(skb) % ARRAY_SIZE(qdma->q_tx)
>     txq = netdev_get_tx_queue(dev, qid);
> 
> [...]

Here is the summary with links:
  - [net] net: airoha: fix BQL imbalance in TX path
    https://git.kernel.org/netdev/net/c/2d9f5a118205

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



