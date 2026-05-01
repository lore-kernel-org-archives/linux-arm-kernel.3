Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD061FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 01:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eymi/yOMkUKJQZkJaKH0gLCUwZmiZZ6GGA5U3OWc7VU=; b=BV8+fhv2BoSCXsoRmAPpRalPVs
	2rkRy6cd+6AGva4EqPi7ahjcWYmvhPqsaVRpkW4l3r+fzouFRIDwyfh7CdiasOxDrFKmConHdstB3
	qstKsVngcXuhYuPpvbdYU0I+O8j64LaakN1K8QnW7rPiXOP8Hm08wkPw0BYyilQXtEgFdtCZ4flKU
	UlVLz8YCHmT79Av2VlFRE7eZLVWIxMqK0IWOAf4AqMbUNve/r8l4g+5hTignUtquCkw6o2Vcmtwek
	3FTafrQ5YzohX/pJYZFBVRzBt+rnWorSzppSo9tQhwx/yG85bQkiQLv5zKakAzeR7Rm7Fw0Y1DZgc
	rogZAhCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIcYt-00000006DSd-0MHT;
	Fri, 01 May 2026 01:20:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIcYq-00000006DSF-3GPI;
	Fri, 01 May 2026 01:20:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 18B2B444D4;
	Fri,  1 May 2026 01:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA7BCC2BCB3;
	Fri,  1 May 2026 01:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777598456;
	bh=7rKuBfm/sZqWZkIHfGrPtqBLbz7QhI+DrjxOxPQGULw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IsBNqDWiGsHNeM/iuiQqKxH4swR8cjkUwEK/tmacRzj+lrUdMaXDTaGVNofROB5sF
	 bBRODprviHwVF9VQuBIYcZfE5TFhZpUthESgCf5ZlmBwO2d9jAbWnyo60NtK+kvPiB
	 ukozERPSd6GQgUthnkjU2WUEQ7hoLZF1IL8iPi1XhU844bync1gOyFnYjr/xvF8fA4
	 6vOpDxwr6dkSi/MiGP2eb3tWmb+nCsu+Ts1i2ezYiJUJiYRS93IBhoXefPfCOJ6BEu
	 kzIY2gOsalMit/H10XPtTRPMiWg/LTiI6Qew0wLk4YKCDUwxJsX40ZDqYtv7UauFVY
	 oKxsyQDxwdAuw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FC46380A957;
	Fri,  1 May 2026 01:20:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: airoha: Move entries to queue head in case of
 DMA mapping failure in airoha_dev_xmit()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177759841005.3278779.2333326558858237558.git-patchwork-notify@kernel.org>
Date: Fri, 01 May 2026 01:20:10 +0000
References: <20260429-airoha-xmit-unmap-error-path-v2-1-32e43b7c6d25@kernel.org>
In-Reply-To: <20260429-airoha-xmit-unmap-error-path-v2-1-32e43b7c6d25@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, jacob.e.keller@intel.com,
 horms@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_182056_837430_03501A94 
X-CRM114-Status: UNSURE (   8.89  )
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 29 Apr 2026 14:02:31 +0200 you wrote:
> In order to respect the original descriptor order and avoid any
> potential IOMMU fault or memory corruption, move pending queue entries
> to the head of hw queue tx_list if the DMA mapping of current inflight
> packet fails in airoha_dev_xmit routine.
> 
> Fixes: 3f47e67dff1f7 ("net: airoha: Add the capability to consume out-of-order DMA tx descriptors")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net,v2] net: airoha: Move entries to queue head in case of DMA mapping failure in airoha_dev_xmit()
    https://git.kernel.org/netdev/net/c/75df490c9e84

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



