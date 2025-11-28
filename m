Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37811CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 02:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U+bxEP5SxYMwv2lxs0XBbqkS/Ym82QcHTUll7kMJZDg=; b=TWNJtT7iS4Rc2GkoP8T2OW1NU3
	p9gLQVBQcS/821SSMZeijWh6OFHPoWqiq6qjra4olWo/GsNiiKZVgdgMM2dnVPyv5aZxfsRdLu8Ba
	E9lhW5r7v4kqi9jhBd8DF2JWGgvSDpuuc72lmukb+9eqN5QoTT/ErQXhDdE3Bhc6ek5ax3SgBLcRo
	DV9VO3I48bcALtL3IWpKnhZxyHAiv6waACuDZUUJGqyI1mkx5+plTmxHZfkoOVV/IwqBzFKqUGc4b
	anmHE+zuVrYw8iDxHmVnIu2sqWwqfDFAFDPL5UVFdwhYkng0Il3m6fR9ny/jVWmsMOEX4wcbX4vPy
	b6uBXA2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOo94-0000000HSI8-0THb;
	Fri, 28 Nov 2025 02:23:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOo8w-0000000HSGu-2k3T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 02:23:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E58D443AF;
	Fri, 28 Nov 2025 02:23:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42A0FC16AAE;
	Fri, 28 Nov 2025 02:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764296610;
	bh=cVqdiLZvXfpByFSQClvvNIc/RzgtFe65UKuBikGVKYE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NmH0Tk/qJYlZZdbRavG4rL3idrq8j7Z7uPF/UPm6oyEMxENCxVjjFOnGflmN5QDSs
	 k/cccdTYv4DDPoRZS786oKMpmO05/vnOhqvaepCjlMDmgy/l7pl/YlwvLAivlhORKU
	 j0e3p711Rp/zlU02/Bwqy//qxQf9AS3gs7c1EOtqshBj9PsEPDrk5qZlgHkzJIhjMp
	 MIys+C4RZUrNLD0oAFdmLMMmpd6G5ZnuXSX1j6dbwHSP9xPbwiN19bgXA6FMjGDC8O
	 wAkwyQ5ohPdDx/Xm5HqTIf7aL/rApuuVpK1b7zKkkOQHu7m1v8nZ41H2klR6gFUYsi
	 kKq1n1UfQOeYg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B588D3808204;
	Fri, 28 Nov 2025 02:20:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: thunder: convert to use .get_rx_ring_count
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176429643228.114872.16293714452908215238.git-patchwork-notify@kernel.org>
Date: Fri, 28 Nov 2025 02:20:32 +0000
References: <20251126-gxring_cavium-v1-1-a066c0c9e0c6@debian.org>
In-Reply-To: <20251126-gxring_cavium-v1-1-a066c0c9e0c6@debian.org>
To: Breno Leitao <leitao@debian.org>
Cc: sgoutham@marvell.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_182330_711567_1B4C8100 
X-CRM114-Status: GOOD (  10.88  )
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

On Wed, 26 Nov 2025 02:54:40 -0800 you wrote:
> Convert the Cavium Thunder NIC VF driver to use the new .get_rx_ring_count
> ethtool operation instead of implementing .get_rxnfc solely for handling
> ETHTOOL_GRXRINGS command. This simplifies the code by removing the
> switch statement and replacing it with a direct return of the queue
> count.
> 
> The new callback provides the same functionality in a more direct way,
> following the ongoing ethtool API modernization.
> 
> [...]

Here is the summary with links:
  - [net-next] net: thunder: convert to use .get_rx_ring_count
    https://git.kernel.org/netdev/net-next/c/73880e66b79a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



