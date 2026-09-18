Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DFD0C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 01:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NsZLZK+eVphx8rEayXeBZuLu95LXFmvSyDQEO8+5YzI=; b=yfofpENnCp7yRCJQVgg4tBfkq4
	DkOePFj1qiRZkz2oDJgy79LYgRLVP0OQb4vIa3PMMOvNAryJaRJg5MIAZqKXvSIM9Qd6hlScnwjLD
	efahvHtNfqe9/XG9Uq8Oa/peQVR8PKsqmMTJRPSeonPjAHgrnlJbomE++zuyYNzghstz1bYosHDRd
	QaM4JOI/umUp0oFPBw1imm8+BoK3k8tfkAnyythTgWan2cJykT4LjVH/77WtdzsRXAkFMIcUvxcjv
	XabRXJGwl7/h/OpaNIXkk38W3DHdmmw/hjPF5ssw850MqUBJj7aKMQR0x0lP29M/zX/QgPuh7MTlH
	o1lpHGHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7NHt-0000000D8FW-17xL;
	Fri, 18 Sep 2026 01:21:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7NHr-0000000D8FI-3t5Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 01:21:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5611E42A95;
	Fri, 18 Sep 2026 01:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37E7F1F000FF;
	Fri, 18 Sep 2026 01:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789694471;
	bh=NsZLZK+eVphx8rEayXeBZuLu95LXFmvSyDQEO8+5YzI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=XvvTHTW7oHJrEbqdzocxi8Ah5sy5Va7YcB4n6TcVGWCsJNhRIkoyITSmsyYCAyrwR
	 UMWsiphEIz95WLEcYOQBXynATMyyEoPTDt73/yHJYV50BgaSmCV4NLGOl32S2A8K6e
	 jO2Nc4+j/4TTYxUGa8xX/aBigNHd8aUxvcwPQ3uQgsKntIlzpg9Wx4+c4uFnr9zceR
	 kEikRfhcAVqMJM6jPKRd+NFJQXYYYbAOua9n7JFx67XUa5Mj4P7k3rzWmVXuenvO2E
	 dD0ZQkfabx4ftDYbRM3/fJy0rLS0/4KiMkkMWVOXgxhflq+OaHfw1DWicOze2EPX89
	 /nFrwyY9gKygQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0D8B380820D;
	Fri, 18 Sep 2026 01:20:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v5] net: stmmac: propagate PTP init failures in
 __stmmac_open() and stmmac_resume()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178969440464.212131.9134370127375175160.git-patchwork-notify@kernel.org>
Date: Fri, 18 Sep 2026 01:20:04 +0000
References: <20260914-stmmac-ptp-error-propagate-v5-1-81149897e65d@oss.qualcomm.com>
In-Reply-To: <20260914-stmmac-ptp-error-propagate-v5-1-81149897e65d@oss.qualcomm.com>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 richardcochran@gmail.com, rayagond@vayavyalabs.com, treding@nvidia.com,
 linux@armlinux.org.uk, qiangqing.zhang@nxp.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
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

On Mon, 14 Sep 2026 17:26:44 +0200 you wrote:
> stmmac_setup_ptp() returns void and swallows both PTP setup errors:
> the PTP reference clock enable and stmmac_init_timestamping()
> failures are logged but never propagated. When they fail, the MAC
> system time counter is left in its post-reset, non-running state,
> while the driver keeps operating as if timestamping were up.
> This matters for TAPRIO/EST qdisc offloading, which derives the EST
> base time from the hardware timestamp counter: arming the gate list
> against a non-advancing time base would leave the schedule permanently
> stuck.
> 
> [...]

Here is the summary with links:
  - [net,v5] net: stmmac: propagate PTP init failures in __stmmac_open() and stmmac_resume()
    https://git.kernel.org/netdev/net-next/c/8181678a92f0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



