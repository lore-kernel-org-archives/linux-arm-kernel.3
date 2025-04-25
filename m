Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CCDC369D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 00:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eqBpraoTOXGCxb8ozEAVpLizx6kqjiDpQ/OrLy3vvKE=; b=gRt0syEEhipTBr18S/QdWrfiXy
	FYYexajSan+a1Yb+JzV3U+3rT/eLi/1vQwS659Wdu6ZdrCcj1/SbVwhbCu/HixVaM4ABtaSFQMl15
	a9cB9sIH5L7TGtqdd2EI1WdVV5IdyIZKPU5tBm7w8VwpPb3XRgAEUcvq5T+gwr/VTywnllVgEoLth
	I3sXOv4z16SnPMJhl0t3T0YsSjd++ALLXTkRsABBNZo5D5bI2JpnsTNHZDvbqCnSxvGgxqBlQofEZ
	HAv/TphkpUV+LPCahTAh56l2tu0vQ2ytZGEZTlBxhZNCimbkiLzHlz54fpPeG7tY9PS5khg4b+bX2
	4+c/t2sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u86pE-0000000FbxJ-2pe4;
	Fri, 25 Apr 2025 00:21:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u86nO-0000000Fbeq-2KxL;
	Fri, 25 Apr 2025 00:19:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CE1384A737;
	Fri, 25 Apr 2025 00:19:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57518C4CEE3;
	Fri, 25 Apr 2025 00:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745540397;
	bh=mmlr8E+H2BDZ4gjGcxUcUsDxQyLSFFeNX6bcoSlckCk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bpmvdOz3hpFfd9dFJJ+Cm04wvVLxiAHWnQTe6CBbj62VG4MWXjgDdslVkHee6hqzJ
	 8qOm2AqSkP2hrsHAxOEDGwjnO7Hg6bM3/d0qV/ujpi6HST1RpLlwa7wyZA8CnxN+wc
	 ns0Fhmma9AVyKsmovC89lWFoO8pUSpN43UkZGIXt1tM8Fi+lwAekX2VA9wKxjRTP0I
	 JINyV2k8lLHKrv7d26Djn8j1s8qZjKRFrMO44Hve/sLCLLC8PFVkoSpQJFqQUeQwk1
	 2zbodRONWWR19noqWVfzb1b/rV5Epf+5VIwuUx0VUY2h4T9c8AvF9y/BKmyS2uFN0s
	 VbekrryogvMLA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33DA2380CFD9;
	Fri, 25 Apr 2025 00:20:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3] net: ethernet: mtk_eth_soc: convert cap_bit in
 mtk_eth_muxc struct to u64
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174554043598.3528880.12217864359987980717.git-patchwork-notify@kernel.org>
Date: Fri, 25 Apr 2025 00:20:35 +0000
References: <ded98b0d716c3203017a7a92151516ec2bf1abee.1745369249.git.daniel@makrotopia.org>
In-Reply-To: <ded98b0d716c3203017a7a92151516ec2bf1abee.1745369249.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: nbd@nbd.name, sean.wang@mediatek.com, lorenzo@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_171958_613583_D013AA22 
X-CRM114-Status: GOOD (  10.23  )
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

On Wed, 23 Apr 2025 01:48:02 +0100 you wrote:
> From: Bo-Cun Chen <bc-bocun.chen@mediatek.com>
> 
> With commit 51a4df60db5c2 ("net: ethernet: mtk_eth_soc: convert caps in
> mtk_soc_data struct to u64") the capabilities bitfield was converted to
> a 64-bit value, but a cap_bit in struct mtk_eth_muxc which is used to
> store a full bitfield (rather than the bit number, as the name would
> suggest) still holds only a 32-bit value.
> 
> [...]

Here is the summary with links:
  - [net-next,v3] net: ethernet: mtk_eth_soc: convert cap_bit in mtk_eth_muxc struct to u64
    https://git.kernel.org/netdev/net-next/c/ffb0c5c4cf66

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



