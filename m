Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B2FCCD187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 11:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nCxTn0G9NCyd0aUyRVsKKokLrkEvlxT+D3F71KUuZUw=; b=G+0WpbWb+r5V5lFT3zjJXmcDxo
	moAlR4/ZvkbGBRUunjAfgvrvlNXtjhqMIoNKzhFU0+vGPeFRUQ0oLMQ75iCXnctbLZ+XgmjMxIksc
	KYYZWJiUbPdaAEkrftckksY04NtW8plmvRn/phwAbrB6A/fl9FY83iCHOORxDH6y4dfZZaXE8JwHG
	3NLQ+SAzpYaX0tTWLlf8YlXCbyBjlpVSs4k8rP+6Qu4UqtQf/4H2w5g6OXw3sbVAzttcbqctRyBnP
	5+CCS1BKe3QeqmhoO+xoqwQPyLo57UEvom6g3xwA4AUdLbEu5GNPK4D/c97GAxpNOOwTYqz5pDvhI
	LOBOt3Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dU0-0000000G8oD-4By6;
	Tue, 14 Oct 2025 11:46:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dTz-0000000G8nF-34tO;
	Tue, 14 Oct 2025 11:46:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1867E6228E;
	Tue, 14 Oct 2025 11:46:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE49BC4CEE7;
	Tue, 14 Oct 2025 11:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760442382;
	bh=WKayDwfPOkpRvbADRbbwCtSvR3EOhJFvSghU0m14F58=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=siYWm+7oXvRfUExM1AUHo4jr1PgfeFJW4/C0fsk9UZkj1ZlgTUAFutq7E39Sn8ywk
	 oN5QIWTAyYj2uP0vsJvf+hGwK4j9QSMx8SSgQNot9jTwlDoFYSdAGB18yFax3ZN/yS
	 b89RNCBNcbspQ4KreCfQ1s3rlO67pUfJFEoD4tlx+oiosf18OOnycbqgyxbQtZoRqh
	 3zxjd8g3thkm1i/TnhzcQnrTC1gHqBYSKKzU/lum4LEVhJnybtOU4cx+3su5tCJmpY
	 7nvsQFNi3F2M2wsUkLJ0kkPgau53LPp3QIO1DkdR4mqY6hhoG1BCdenPnjHne/KT6J
	 BEXgUXkB7oapQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 340EF380AA4F;
	Tue, 14 Oct 2025 11:46:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: airoha: Take into account out-of-order tx
 completions in airoha_dev_xmit()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176044236799.3633772.8727248209077665958.git-patchwork-notify@kernel.org>
Date: Tue, 14 Oct 2025 11:46:07 +0000
References: <20251012-airoha-tx-busy-queue-v2-1-a600b08bab2d@kernel.org>
In-Reply-To: <20251012-airoha-tx-busy-queue-v2-1-a600b08bab2d@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, horms@kernel.org
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
by Paolo Abeni <pabeni@redhat.com>:

On Sun, 12 Oct 2025 11:19:44 +0200 you wrote:
> Completion napi can free out-of-order tx descriptors if hw QoS is
> enabled and packets with different priority are queued to same DMA ring.
> Take into account possible out-of-order reports checking if the tx queue
> is full using circular buffer head/tail pointer instead of the number of
> queued packets.
> 
> Fixes: 23020f0493270 ("net: airoha: Introduce ethernet support for EN7581 SoC")
> Suggested-by: Simon Horman <horms@kernel.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net,v2] net: airoha: Take into account out-of-order tx completions in airoha_dev_xmit()
    https://git.kernel.org/netdev/net/c/bd5afca115f1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



