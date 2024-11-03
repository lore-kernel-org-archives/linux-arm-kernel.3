Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7953ED1118F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 19:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9H+14g7TEjcJegqS6pqhX5cbRm3voSMA/5EEurVmmUg=; b=oeSgJbEhFxvFBP50OLekKPGmo6
	h9nabg6kNBQAnhfCAjfyydcZM+M5T5cNgcFhmhzGcwV80GYZ/4pQd1Xpr31kbg3jXnTFfI5OXzdkS
	i8acED5GqrDNf13Ory37mdHzVAfdKpBNSxE5VogdCDQek/WxP0evvo/EsXr2IXg90r3CCTjzxCtOI
	b+k5TFlnNbshhzm/1+AIpinwfoj8B2/ZvpgcAlm1bVa/LC/ViReCviTuke1M/vcXqHEq+izBPi/jt
	PUAqJlrQ1c/yXyjcnWg/8vexs8WiRG5quF+FvQfCvRmhC3ha72QMU1m+Rbe6FCF2qvZ5RdK/tsfnX
	WkVSwelQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7gdv-0000000Bx7D-2snS;
	Sun, 03 Nov 2024 19:52:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7gcE-0000000BwxQ-43yV;
	Sun, 03 Nov 2024 19:50:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1A8F6A41C30;
	Sun,  3 Nov 2024 19:48:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F35C5C4CECD;
	Sun,  3 Nov 2024 19:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730663424;
	bh=Ypbd15yIw2s1Z8w6mWrmifXgG2SzsMfQdISET86SSmU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lcieTXmQNr0EMVdcmIYWA3kb2ssDDEyXWXGAAj3Q+O7J/6HWuJq4Mc3OOjkPCObIw
	 Wz/Fjr+SnFh7x2CXGuXuL6XWfuMypc7w5/beclN7G7v6VpijUkb6cV1Joy8AjXbljq
	 NT+m3I6u7YL5lHrTgrMQN8s6p2HWqPT4GclJ74+fOOrcLeguY4wNGO9g482odaxCij
	 Yex+PB54+1Dfa8UE9SvZt3s/nG0EXrJPsM29eJBCwKb43J7GBGVyDedf7HXVXwSotC
	 RFMReuydX1AxAUt5mRRMU+JadjEjr4twQ4akOefbUQALTeidT5MFWHh+g2LikuUTzE
	 a6uphw00Ikp6Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADC1E38363C3;
	Sun,  3 Nov 2024 19:50:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/2] Simplify Tx napi logic in airoha_eth driver
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173066343223.3240688.14365751396868795673.git-patchwork-notify@kernel.org>
Date: Sun, 03 Nov 2024 19:50:32 +0000
References: <20241029-airoha-en7581-tx-napi-work-v1-0-96ad1686b946@kernel.org>
In-Reply-To: <20241029-airoha-en7581-tx-napi-work-v1-0-96ad1686b946@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: nbd@nbd.name, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_115027_102485_2C164D4F 
X-CRM114-Status: UNSURE (   7.76  )
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

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 29 Oct 2024 13:17:08 +0100 you wrote:
> Simplify Tx napi logic relying on the packet index provided by
> completion queue indicating the completed packet that can be removed
> from the Tx DMA ring.
> Read completion queue head and pending entry in airoha_qdma_tx_napi_poll().
> 
> ---
> Lorenzo Bianconi (2):
>       net: airoha: Read completion queue data in airoha_qdma_tx_napi_poll()
>       net: airoha: Simplify Tx napi logic
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] net: airoha: Read completion queue data in airoha_qdma_tx_napi_poll()
    https://git.kernel.org/netdev/net-next/c/3affa310de52
  - [net-next,2/2] net: airoha: Simplify Tx napi logic
    https://git.kernel.org/netdev/net-next/c/0c729f53b8c3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



