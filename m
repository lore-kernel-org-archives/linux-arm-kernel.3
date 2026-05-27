Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B33CD5BDE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 02:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MOU/BOrYyullkDI/xmYTF01nrxsq/IqQxkaeGPZJFWY=; b=lKwCVofus37QTq7RRyzq0r5DWo
	BC9YfDOc4Tg7WP/xrFeK4B81F19o22DzkWfbhtDc32F/LcZx6+Ce9HYWm6eHfBu0ouWXy8udzqSTY
	gTtnjNFUl12K6AXspOEhwxhU96bSSVoFhb710PBF3XeanQXxeGle3Z7ZhlVM7tptMpT4Fzc1A/LE6
	bgLg8ISVSr05dqaYOjnjczYocDNlXi7h7l+3zslAVUHiaV0xJVRWBBkPLZku9l+a56rmQqaHTZWJZ
	t4K2tDjrB7NMMqx8N1MJlldj2U95C9LDYYqZYoFpSNfbkCzWT8ryfSxgf/RmMW3UUHyPO+5pbcXtt
	76bN7s2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS3sI-000000039cn-1PEl;
	Wed, 27 May 2026 02:20:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS3sH-000000039cN-0R8E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 02:20:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 41A52600AB;
	Wed, 27 May 2026 02:20:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E775E1F000E9;
	Wed, 27 May 2026 02:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779848400;
	bh=MOU/BOrYyullkDI/xmYTF01nrxsq/IqQxkaeGPZJFWY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=abVSygFU97oqVS6AqAr+4R3/QMORWn1hlRSnc80ZXUcX14efHN++FaGZ8HQ2PySfK
	 jjx6uuDhSAUxel3nS7eXHz3+8gVZVz7nVymxj8wXuW1+RG2m+nvw52b7Dh6sON62DR
	 +EGYQQKcE4f9Cj+h9JUm93JW2eF4LsNRBKRTJyS5LMnrT9aDOAa9aDtOrR7KYV9ZHH
	 RYPYx/fKmmYNVR3wyfTtTsS+eY5+A4ouQY1m1uR2mishH5xKsqd6af5dRjTyxjs2E2
	 0qS8VH++XlTteKgHu34WsMD/z8m0OAX7fp29UOnq4j4C/ui4kXsdWhIT+0+JbEML79
	 p3jUluNDOleNw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0DA8380CEED;
	Wed, 27 May 2026 02:20:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: thunderx: fix PTP device ref leak in nicvf_probe()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177984840564.4052990.7679584037769578328.git-patchwork-notify@kernel.org>
Date: Wed, 27 May 2026 02:20:05 +0000
References: <20260525082611.61817-1-lihaoxiang@isrc.iscas.ac.cn>
In-Reply-To: <20260525082611.61817-1-lihaoxiang@isrc.iscas.ac.cn>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Cc: sgoutham@marvell.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 richardcochran@gmail.com, pombredanne@nexb.com, aleksey.makarov@cavium.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, stable@vger.kernel.org
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 25 May 2026 16:26:11 +0800 you wrote:
> cavium_ptp_get() acquires a reference to the PTP PCI device
> through pci_get_device(). If any initialization step fails
> after cavium_ptp_get(), the PTP PCI device reference is leaked.
> Add a common error path to release the PTP reference before
> returning from probe failures.
> 
> Fixes: 4a8755096466 ("net: thunderx: add timestamping support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
> 
> [...]

Here is the summary with links:
  - net: thunderx: fix PTP device ref leak in nicvf_probe()
    https://git.kernel.org/netdev/net-next/c/2bcf59eefb9f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



