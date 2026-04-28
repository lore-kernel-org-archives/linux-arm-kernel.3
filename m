Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9DEFF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 00:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t7GaXehFBiQt93y2k7obbBhf1UA3eDA9G8SqRdljSX0=; b=eqmLX//HWYmp3KLYnUBdp7OEzw
	USHygfTrOBn7sNGF0OoMkj5tYRsdF53xjtgsfu+njB3lW7fJ6pfbFf8K+/vTpKunmShPI+oFyaR6h
	+bTHL/+6H5GeLeuTKC5pj62TIbk10JMXTDWxlkerQ4ifUt74/Ky7D82cdD1YDvje5RZELoDdjGcj6
	n/1OeZZxH5NA+Ma6JDVG6qLmSXTML5cdceNN/p2OgjWXQ3PI5dl4aLyE3dQ3wqR/JwToD/OyoGXGx
	g+0OKjfMfhfTa3V8w6eFnGZPXxnGh09yHGIN5gjhjEqeFPgMF/obRslcZvlnbqQ/VGrF2kISkRKrs
	wbso3Cbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHWfE-00000000MAh-3wNQ;
	Tue, 28 Apr 2026 00:51:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHWfD-00000000MAO-1s9Q;
	Tue, 28 Apr 2026 00:50:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C2DC60121;
	Tue, 28 Apr 2026 00:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36B81C19425;
	Tue, 28 Apr 2026 00:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777337458;
	bh=4u3fOBLkg7bwwRHn/jMjMp3yIXtsrAn3Pp1vO36pLtg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YN5CLtgK8FNnYdReLhkkdpjhySnXvwSBYBGBI/n45z8BnDJwe18rd6OEsCQAsT5Ce
	 ZnoqHNzwuYkZzNEs/208yFmj138ZMFA3194VEmfhqkuwBG4sL6xCnjFzg0Of2iWrWP
	 DPZQ+/s8lobpFMJ/onVu7p1AvdiSTegiAFdPrraDZFOrK+Q6jlxwReuPIFcFwpVQgr
	 8rILaZuRs0bCrW+Op1NNqM8bx879M/EM5So53N1obvTnrlMmoCJqKsAHTfNx+bdLy/
	 JcKWHIO4NQ0SW/sJm9Lv8kQwdjStdvrJl1gQLtiWXgsh4bkPZBl4ZKPeigrNxqnfr+
	 6I61tvo9dFS0Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9E5338119DB;
	Tue, 28 Apr 2026 00:50:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: airoha: Do not read uninitialized fragment
 address in airoha_dev_xmit()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177733741530.177472.9248284506411567966.git-patchwork-notify@kernel.org>
Date: Tue, 28 Apr 2026 00:50:15 +0000
References: <20260424-airoha-xmit-fix-read-frag-v1-1-fdc0a83c79e8@kernel.org>
In-Reply-To: <20260424-airoha-xmit-fix-read-frag-v1-1-fdc0a83c79e8@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
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

On Fri, 24 Apr 2026 11:00:28 +0200 you wrote:
> The transmit loop in airoha_dev_xmit() reads fragment address and length
> during its final iteration, when the loop index equals
> skb_shinfo(skb)->nr_frags, at which point the fragment data is
> uninitialized. While these values are never consumed, the read itself is
> unsafe and may trigger a page fault. Fix this by avoiding the fragment
> read on the last iteration.
> Additionally, move the skb pointer from the first to the last used packet
> descriptor, so that airoha_qdma_tx_napi_poll() defers freeing the skb
> until the final descriptor is processed.
> 
> [...]

Here is the summary with links:
  - [net] net: airoha: Do not read uninitialized fragment address in airoha_dev_xmit()
    https://git.kernel.org/netdev/net/c/bde34e84edc8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



