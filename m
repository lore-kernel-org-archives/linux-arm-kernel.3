Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32988C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 02:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qd826TeH5oraPzd048/P6Hl5vKETugRYsj8ZRs+5Byo=; b=oxA17P48Qx8QuiDt5zjJb32Amq
	pQqqp9+YSuNNH4O7XUiG9YynY0v11YK1ptsFx0K43ikKOrUNTgZ9O3X6lv+pk7AWiah8VDkNsc3go
	Khobrvp/V9eo9cYZ4G43Sus/b10SlnRlXLJFWRa307Kj5pMTOomVS3201lrFtCNiBKytmFqQot50X
	Z6qkCxyzLieSGF8KlrAuEpILXeCkWQAsPythI/GcwavJIZNpNeeanc9QO23Bn1uX5NTmoxsaxisVh
	5RAmUKZX+1hs9iGX4B5Si1ALWbAqwdT8IoeozwtijuIMgUOH/0OC6GJQtl/Enw+/nFeY4ZJ+relMD
	Rg1N3Ryg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5bGZ-0000000Eqng-0mKg;
	Fri, 18 Apr 2025 02:15:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5bB8-0000000EqDk-3NiQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 02:10:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D2CA68480;
	Fri, 18 Apr 2025 02:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D71CC4CEEA;
	Fri, 18 Apr 2025 02:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744942205;
	bh=zJMWKlINLQxoHVInSJ+InJg9/4RqU8iLfjlB3jKpNuc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ECLslSKRbGv0zfdqrE34jhBmJW2hvJsVMMrFLPipIG+IylXOp/BlYig4TKQJNCyPn
	 KgIj4+ewoTMSGeQ3Sl50LL8S20V1IvJEWrpC2CjmiFlrSg4PIHpqHev6grPYcJopvk
	 2xM/g+w1Z2DTGNW79xxAs1EgpWlQVTzkbpUtcSD1sKQ6phKvaP36iES9UBHvzCfMv4
	 DtiR7bPrK/c8HkjwEqb4RGtAdvLzu/nDtjJrGw5V+CpcV4PdbGrZoIeLX3LCayzed8
	 OIGAvDETN5Z3+4xhC1fsGD+fsPfAI9gUbg59eDlFDQxKpoRoZLuDg/deTVLUBBwDNt
	 zM3IovL4KRx0Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAC8C380AAEB;
	Fri, 18 Apr 2025 02:10:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: ethtool: Adjust exactly ETH_GSTRING_LEN-long stats to
 use memcpy
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174494224374.79616.15601499519996041916.git-patchwork-notify@kernel.org>
Date: Fri, 18 Apr 2025 02:10:43 +0000
References: <20250416010210.work.904-kees@kernel.org>
In-Reply-To: <20250416010210.work.904-kees@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: kuba@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, claudiu.manoil@nxp.com,
 vladimir.oltean@nxp.com, wei.fang@nxp.com, xiaoning.wang@nxp.com,
 jeroendb@google.com, hramamurthy@google.com, idosch@nvidia.com,
 petrm@nvidia.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 horms@kernel.org, geoff@infradead.org, wsa+renesas@sang-engineering.com,
 aleksander.lobakin@intel.com, pkaligineedi@google.com, willemb@google.com,
 joshwash@google.com, 0x1207@gmail.com, rmk+kernel@armlinux.org.uk,
 jszhang@kernel.org, petr@tesarici.cz, netdev@vger.kernel.org,
 imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, richardcochran@gmail.com,
 jacob.e.keller@intel.com, shannon.nelson@amd.com, ziweixiao@google.com,
 shailend@google.com, yong.liang.choong@linux.intel.com, ahalaney@redhat.com,
 kory.maincent@bootlin.com, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
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

On Tue, 15 Apr 2025 18:02:15 -0700 you wrote:
> Many drivers populate the stats buffer using C-String based APIs (e.g.
> ethtool_sprintf() and ethtool_puts()), usually when building up the
> list of stats individually (i.e. with a for() loop). This, however,
> requires that the source strings be populated in such a way as to have
> a terminating NUL byte in the source.
> 
> Other drivers populate the stats buffer directly using one big memcpy()
> of an entire array of strings. No NUL termination is needed here, as the
> bytes are being directly passed through. Yet others will build up the
> stats buffer individually, but also use memcpy(). This, too, does not
> need NUL termination of the source strings.
> 
> [...]

Here is the summary with links:
  - net: ethtool: Adjust exactly ETH_GSTRING_LEN-long stats to use memcpy
    https://git.kernel.org/netdev/net-next/c/151e13ece86d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



