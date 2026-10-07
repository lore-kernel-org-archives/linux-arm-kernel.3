Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB28CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 00:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QhUOil8dnWtvo6lhVC5HkqrPpvAWi5RA/1fXEAaUm5c=; b=SC9kx5KZJjIcAxwWv9TlbvYUfy
	KBcsUpzONzrRynekTEvZ8V8pOtuy4dVTSnZzS4NrMDPpDtXRHfKUlqag2dLqzDoW5Y82DmVgLfhwi
	AVbSWZNWnXFOk0dMEujlVYnIdfbXGRZ5TIzgOZvGkqh3pfGv+yCa/oCvOcORPmqxoDy2igDKVfeVq
	+mhTe3V5Vk3s0a3etZp0+LlJIQHO1JOZS4D6LsEyjjB4uCsK7VdYgjYzz5neiZxltjNcp8NcLN89g
	P1mAKx7EDT2ISRxkdpyWD4yM8yOakHPA57/vaiHGYuVlErg7v3ckxtZSxU6ny+SuK/GOmo3tczR2e
	FsY4R9Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEFOD-00000001Wqj-2iw8;
	Wed, 07 Oct 2026 00:20:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEFOC-00000001Wqc-08sB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 00:20:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1584D600C8;
	Wed,  7 Oct 2026 00:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD0C51F0089B;
	Wed,  7 Oct 2026 00:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791332406;
	bh=QhUOil8dnWtvo6lhVC5HkqrPpvAWi5RA/1fXEAaUm5c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ebjVResmZaVfDON+5ItgOvwUFFGhZxCqcMczsvHr4q7NKVNqWMXOsuv7eJf2ZRNS9
	 TUUmTenDvo++tiRf/xQ9BzD2KHJlPRVxcdoPxLnoU00x88v7/opRQsC7KabeIk3tSx
	 MORF+RTlmKewYRqzvLTDr9Ogcz5GIqPYc4pGZVdPHlgRfXRx3/AqKIQD2oIbQDXoa+
	 WgGM2JHHy+wuRwIPsCZb9bnBa4BNloQmphmK7KcADqz1ghk5m4ES0nqQu+SbtnBUJG
	 ObN6f3gbKSsXwPwq827o64jHDj+3F69Q2jaYJrQUA7dmsQ2aCi9LddZ983ilpRehk7
	 R6UlPNNBhn4Mg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B45123806541;
	Wed,  7 Oct 2026 00:20:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: sparx5: start the TOD counters on non-PTP
 lan969x
 variants
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179133240553.2839723.16210131859682317407.git-patchwork-notify@kernel.org>
Date: Wed, 07 Oct 2026 00:20:05 +0000
References: <20261005052826.14251-1-quentin@q-lab.dev>
In-Reply-To: <20261005052826.14251-1-quentin@q-lab.dev>
To: Quentin Freimanis <quentin@q-lab.dev>
Cc: netdev@vger.kernel.org, daniel.machon@microchip.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, Steen.Hegelund@microchip.com,
 UNGLinuxDriver@microchip.com, richardcochran@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Sun,  4 Oct 2026 22:28:26 -0700 you wrote:
> Currently the base non-PTP-capable lan969x variants don't forward any
> Ethernet frames:
> 
>   $ ip link set eth10 up
> 
>   $ ip addr add 10.0.0.54/24 dev eth10
> 
> [...]

Here is the summary with links:
  - [net,v2] net: sparx5: start the TOD counters on non-PTP lan969x variants
    https://git.kernel.org/netdev/net/c/ca5012757bf0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



