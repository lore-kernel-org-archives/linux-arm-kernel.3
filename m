Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E8ECA5FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 02:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k37ydz3gmrzOGd3xCFKZBYx6bSsaaaFykfYFvycKz5I=; b=h+7gw8PP1EuNegj0xgfY0qQYLH
	fOyJYayQnf3P18DzSLqqyNu0YE2UNuLCMWFO8NdG5O/ICjRawXXrOfqyL3Ra9abIDvib30IlviUHn
	I2sBZB2GbR9MCheMlIQJPPGRk77XHzAOEtDmYft1nWPzYfEsrGdd0A9COSqhc1SmiT8gAPPvwpiKK
	FNx8KA5YxfIRysALgzqZyJdG0QxffiFn8y6bPJpTMlc7XGQ1ux2zaDWMcl3WQlja7RhAHuVH0O+Fi
	CszSVFmpJiwpD+31dYVMCPeiQrkfqpb0Ho+lFDLKEFhrXcY02H44XN3kY6a/ocURmBNF1GhX2JiEV
	Jip1L8eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBjlp-00000004u1E-03Hz;
	Wed, 30 Sep 2026 02:10:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBjln-00000004u18-3imv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 02:10:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CCB42601DE;
	Wed, 30 Sep 2026 02:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8236A1F000FF;
	Wed, 30 Sep 2026 02:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790734206;
	bh=k37ydz3gmrzOGd3xCFKZBYx6bSsaaaFykfYFvycKz5I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=UHZJ/4Es0FgGH5CjBeSjh7lcOfz0A+Kwzhy6ChbbeKSTdcoyQMDJWpIPhlTItEvPO
	 VnZO8XvUwlSQV3BflLNH2kpyhCbB/9Qeuy1qB1+JYOqU/4hpaB1gnmyBXeVxlpfzLb
	 jT/QiF1A4mh0g2E7QZxKriW8rBJRKdhCYpqfVggP1LXh/10gL7vnftR9KhB1XQUawx
	 mAq8sroiXgAZEYPYdrTAjrvaeVZ+BCWio9141smURObJ5tv4rXMw/VDz+UXIr/OR5N
	 uay8baqvr/8qVzqgf8oNFmQVNA24QzOKaT/+tPe8XeWU9y3SibAXR+515/RgmgrMTV
	 6VnIsNF2cd5yQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 775243924FEA;
	Wed, 30 Sep 2026 02:10:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: sparx5: skip ptp deinit if init was skipped
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179073420528.1211220.17018666609894661061.git-patchwork-notify@kernel.org>
Date: Wed, 30 Sep 2026 02:10:05 +0000
References: <20260928044542.29287-1-quentin@q-lab.dev>
In-Reply-To: <20260928044542.29287-1-quentin@q-lab.dev>
To: Quentin Freimanis <quentin@q-lab.dev>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 Steen.Hegelund@microchip.com, daniel.machon@microchip.com,
 UNGLinuxDriver@microchip.com, richardcochran@gmail.com,
 horatiu.vultur@microchip.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
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

On Sun, 27 Sep 2026 21:45:42 -0700 you wrote:
> sparx5_ptp_init() returns early on the base lan969x variants
> because they do not have the SPX5_FEATURE_PTP flag. It also returns early
> when no "ptp" interrupt is described. Unbinding the driver then causes a
> NULL pointer dereference when cleaning up uninitialized tx_skbs queues:
> 
>     Unable to handle kernel NULL pointer dereference at virtual address
>     0000000000000008
>     Call trace:
>     skb_queue_purge_reason+0x68/0x120 (P)
>     sparx5_ptp_deinit+0x64/0xc0
>     mchp_sparx5_remove+0x38/0x70
>     platform_remove+0x20/0x30
>     device_remove+0x4c/0x80
> 
> [...]

Here is the summary with links:
  - [net] net: sparx5: skip ptp deinit if init was skipped
    https://git.kernel.org/netdev/net/c/0d2c49915bc3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



