Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82064CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 23:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+8pfyvmysi6Ek/RMH150U7ErTdzA/6Mj6DjsVlQHMA=; b=gJt826dXdXUHj8pMdNO3z0WExL
	4jxz2DQORWl2fcsDT0EPyb4ROGvqDspjpr0O55WX58huJJYtBfxT8zhgaFTuRsL3ZAIJrw9a7M6jC
	ay4MbQIUwddlAZArcfp3/hPWONOAl/omj18KOAgdN2kivKaTj7LXidn5RkOy2Y3Uu+AEs05J/zHog
	OLyleBlx2X7oyb17MWTvOD/VTPhNtQa0HV861cTmiqU0G943vta6cS/hEmNEtHKfrgAhQaq4E134n
	puQiuzI+6pEI1tYhCr/zb8BzIvPcP8ceVzuNSBczz01OV7FI+SB5/RZrpA7726o4gSfn6CnBOW/fc
	ypWFWzAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umKmZ-0000000FGJH-3av4;
	Wed, 13 Aug 2025 23:21:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umKk0-0000000FFk2-208E;
	Wed, 13 Aug 2025 23:18:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 481BB45519;
	Wed, 13 Aug 2025 23:18:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A90B1C4CEEB;
	Wed, 13 Aug 2025 23:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755127123;
	bh=lhIQxzr3DuEkga2iHGADkHZ7fFBhMHQcFKPR3xyRtN8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=clM17nEV7nTHsfRaLcq+fHq8MfMT9FYqgVgmEJYTkXn0qMtkRcOgGh94JEJR8y/JX
	 zOAdS9iNrVv9yfc0HNhvitIvdaNKx3bSReyDGYK+/VGYK6GW9gGX+Y059mP35h65Fu
	 B0iWp5WaUcVMbHU/ryyrwCouG10Gdn3W6TGTuFurKWN5ScHsxZnu/q1OtbUAynZYqr
	 +6n8W5P6UU+jDcXZvyjdaRd/0EU+nM6OwjNJL2cwBCAvIW+FPE0xob8fnErZNXwnQy
	 UGOOedsZbHstbNa6qdpq4gFlmz6oqq1BIveEecNi+9K2G34uiFjbpLiMJtBDJxqcUo
	 J9GeGHi4LMBhA==
Date: Wed, 13 Aug 2025 16:18:41 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, "Russell King (Oracle)"
 <rmk+kernel@armlinux.org.uk>, Jonas Karlman <jonas@kwiboo.se>, David Wu
 <david.wu@rock-chips.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Chaoyi Chen
 <chaoyi.chen@rock-chips.com>
Subject: Re: [PATCH net-next v2] net: ethernet: stmmac: dwmac-rk: Make the
 clk_phy could be used for external phy
Message-ID: <20250813161841.04f5ff73@kernel.org>
In-Reply-To: <20250812012127.197-1-kernel@airkyi.com>
References: <20250812012127.197-1-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_161844_539670_5D14501D 
X-CRM114-Status: UNSURE (   8.66  )
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

On Tue, 12 Aug 2025 09:21:27 +0800 Chaoyi Chen wrote:
> For external phy, clk_phy should be optional, and some external phy
> need the clock input from clk_phy. This patch adds support for setting
> clk_phy for external phy.

This patch doesn't seem to apply to net-next/main, please rebase &
repost.
-- 
pw-bot: cr

