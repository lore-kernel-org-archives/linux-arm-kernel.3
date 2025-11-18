Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 758F6CED240
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 04:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bc13A2hLdbJi0LVcwXbx05TZbGdSe+0nGaTC4LFBky0=; b=umzO8xyqF7x1jpYCBOTS7pLZ34
	mKF3xgq/yzRXxBdfPCuGpc8IXOJawp4uVJZ6ud+ZGidcH7po7CA/dLcw+N/ysYVGu+M011E7E8bAO
	vZkUo/tdY4ZXH1/c4//KtwYKOTU8xBXd3eATKZfWU/VCz81mDv0vbZoIiCGp9r74M8SRy/fG7nQ9H
	rl0MGkWh/doHnXd36Sbu+n/a6sepNfL+UCLWmRQmsCnJ/ryw82E/7KHf/pLOPmnXtj1ILZz0aW2Ia
	D8o2MNeALuSSjbivun2CMKR/+fFvXzsino1jj24o5jKsXFjvbgsZGG7gk+Mx97zRAnEWx0v1l/vsv
	TzH/Fucg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLDCt-0000000HMGC-0ZuC;
	Tue, 18 Nov 2025 04:20:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLDCr-0000000HMFu-1uph;
	Tue, 18 Nov 2025 04:20:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9AD3E605FE;
	Tue, 18 Nov 2025 04:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D5A9C19423;
	Tue, 18 Nov 2025 04:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763439640;
	bh=ESYCJhFz6qvRXOfOOiFBo9T3qoVii5Lf9a/4mxUB+n0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=E36Wz/qnraHqzKHy5Ady5z9Nirm3xJKWR/ATFTzgAHLdwQ9FKcGxIWGOSXiNvSaaT
	 NljXVLBpLDcBThuq9ZAIB8bZ2eVtHMiT4QNyVlXBBlLn2B1QZuWL8Avu+LDrI3t3/e
	 DttRUTUCq8dp/zktvRCAHqTSH5wAqCNsQgRi5jSFrU3vMMFXyvGb/O1QgyJQRE8ny4
	 hLXYnc/k3QgdPWFf32OWflWHLAyge/GoRCR0ziH6uQqb9s1lcSgGEwiKFjyX/gELI+
	 taMU+y88P2n1NXz41iR/UuIH9b+MgzfRBk67F95j/vdIPL0XA0IPlxj8I4xJnGR0yi
	 QLySqpUg8mD8A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DE43809A1D;
	Tue, 18 Nov 2025 04:20:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: airoha: Do not loopback traffic to GDM2 if it is
 available on the device
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176343960603.3966336.2301891207348602792.git-patchwork-notify@kernel.org>
Date: Tue, 18 Nov 2025 04:20:06 +0000
References: <20251113-airoha-hw-offload-gdm2-fix-v1-1-7e4ca300872f@kernel.org>
In-Reply-To: <20251113-airoha-hw-offload-gdm2-fix-v1-1-7e4ca300872f@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
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

On Thu, 13 Nov 2025 18:19:38 +0100 you wrote:
> Airoha_eth driver forwards offloaded uplink traffic (packets received on
> GDM1 and forwarded to GDM{3,4}) to GDM2 in order to apply hw QoS.
> This is correct if the device does not support a dedicated GDM2 port. In
> this case, in order to enable hw offloading for uplink traffic, the
> packets should be sent to GDM{3,4} directly.
> 
> Fixes: 9cd451d414f6 ("net: airoha: Add loopback support for GDM2")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net] net: airoha: Do not loopback traffic to GDM2 if it is available on the device
    https://git.kernel.org/netdev/net/c/8e0a754b0836

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



