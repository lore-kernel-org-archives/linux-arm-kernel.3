Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC95AC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 01:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VbjMS8Ne6mpuUeH6m6IA3igIpuxTJmLYypQ89AF2BsU=; b=k64KIBrfKcKDXYYU+y/+4h30fm
	B4Halq1+Tf4Gw5R2xdkjfFJBx7uFqPybJawR4WlUyMe4HMOaKnKzEAoM/vBd+BGOXGH3Spzwt20El
	MY2VxE6/mZinU+/5oT6K2h10LZL8rhBpuZe2HhWw08LnNTPPoBQGnu8qQ9Yu7o1siWinyJLDFk8jz
	P2Pc+dmOqAAZ3IP3DihcgURecq+qWXmpjUJmudQVHGHTh3cMXvkfyHQTFUqcUFtxxWd6qTNnKn+L/
	ZvJoj9kh3bpf1cvtOx6f8NO7hdApHabg9TGM1pPboJyK0wgizkkpOPAt1/aqJVNx78FcU7M3hrFyS
	1ypYcCVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ee9-00000008AHG-0KEw;
	Wed, 16 Sep 2026 01:41:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ee8-00000008AHA-00vf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 01:41:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C7A22600E2;
	Wed, 16 Sep 2026 01:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E1F81F000FF;
	Wed, 16 Sep 2026 01:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789522870;
	bh=VbjMS8Ne6mpuUeH6m6IA3igIpuxTJmLYypQ89AF2BsU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=mdqBBr+JRXi9IJ3Ib4XtXu5S4WACPR7xwsjfIG03a8F5EBo8J+VTmhnkjtlVt9Zaa
	 vMsRIE5xfBOjfFM/85EPV2+ih6SRCus/geT5BX58InbwVU5rrOlTt9RLo+SBki2Ns+
	 Mg/I4dv1VcZcEIH+j5hk10L4cSEFlVd48DAJXLZm+7UamB0dhGdGMXdQLJ6uANg8rq
	 6GY1DTMEDHDcXjbrbEIUDOzHekpvTJ0CdF/POwpxTFGT9sI5kBnoWulPidFgXbp7+7
	 9hhWojIfP3V2xppP241W+IIYiDhzLPGnNQEe6l3vb4xGY+dypS9ay9SX2YXtmh4sN+
	 jI3LZClC+ie/A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 197E53927075;
	Wed, 16 Sep 2026 01:40:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: stmmac: do not overwrite phc_index when no
 PTP
 clock is registered
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178952280488.2353777.12003404021238471731.git-patchwork-notify@kernel.org>
Date: Wed, 16 Sep 2026 01:40:04 +0000
References: <20260914-stmmac-fix-phc_index-v2-1-bf3d90373fe4@oss.qualcomm.com>
In-Reply-To: <20260914-stmmac-fix-phc_index-v2-1-bf3d90373fe4@oss.qualcomm.com>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, gal@nvidia.com,
 rrameshbabu@nvidia.com, cjubran@nvidia.com, netdev@vger.kernel.org,
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 14 Sep 2026 09:41:07 +0200 you wrote:
> stmmac_get_ts_info() reports phc_index as 0 when hardware timestamping
> is supported but no PTP clock has been registered yet (e.g. while the
> interface is down). Zero is a valid PHC index and would make userspace
> resolve the wrong clock; the absence of a clock should be reported as
> -1.
> 
> The ethtool core already initializes phc_index to -1 before invoking
> the get_ts_info callback (ethtool_init_tsinfo()), so just drop the
> erroneous assignment.
> 
> [...]

Here is the summary with links:
  - [net,v2] net: stmmac: do not overwrite phc_index when no PTP clock is registered
    https://git.kernel.org/netdev/net/c/f0ef4b1eaed0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



