Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC46C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 02:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mphni7JuGZqNx9UeyLJ3yHdLdZmD9rfMP8nxjkS2mZM=; b=Q0OaEeSXB3yUSxRAGb1v3h3fVL
	UHw+EDawd/lIREVkqw7QNco9XVL1OVYRrrSO8dTMuBnwr32O8D0sOlCcmNhuJgOVadQJYgwnQL1SO
	4wRSBxXSmhLm2ZpPmaHWhBNfiKhxUEdBGvKQJJwPd0vM/hStn07URdiulCz0dgxsx7RuqukZBjwVl
	QmmKCDB0YU/Y7Gm5KSoh/mp46HBnXSelN31SLDLj/kgXFNIO3FuSky/Mw1yv4SnKmVK3YNbqc63R2
	vlYtZ5x26TqSWA66WAl03y4a5ApUM3Rpo+GeCBv7BV/z7jo8QW8/P4KIkC1AEF/6o6IoV0fqWAOwk
	m9zjNIQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8VAs-00000001JJR-2PS3;
	Sat, 26 Apr 2025 02:21:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8V91-00000001J6w-0zDu;
	Sat, 26 Apr 2025 02:19:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8AB2168442;
	Sat, 26 Apr 2025 02:19:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8ABAC4CEEA;
	Sat, 26 Apr 2025 02:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745633993;
	bh=QI3VQECJ4VOdlU50ySozc+hha6S8Kroa22KH3HCcmkY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GL7UsMEX78Zh+N77JaSubzMfpgbC7dG50JkgdpHT9X6GDrhJsm2OXUCUv+leRCp1I
	 Lst+qsLvXScNVjc0RYGvzz2sfM0dJQ/QAyapQsORbGwf/ENLKkAbegU09OXGCZXGNE
	 wDGa4qotkivXOx6mkmOZmv6wdQRyTbYoc31YfqrLlhplALHByyDnQciVo0hFp5i5gW
	 n8lganKfeVf85MBZpJCQUG9fGiZQpwzhrocn2pETrR2wquHCJMufS4Ma8t60X2lsWw
	 uKTPvyFpl9sDTlY/mB/dJsnHV4wVdfpvGJhiUYnkMSjXgWSij51/ttJV8SJIMfkiyJ
	 BboJhJeRHNoCg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADF6E380CFDC;
	Sat, 26 Apr 2025 02:20:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2 0/2] net: ethernet: mtk-star-emac: fix several
 issues on rx/tx poll
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174563403253.3902866.2022861799721968649.git-patchwork-notify@kernel.org>
Date: Sat, 26 Apr 2025 02:20:32 +0000
References: <20250424-mtk_star_emac-fix-spinlock-recursion-issue-v2-0-f3fde2e529d8@collabora.com>
In-Reply-To: <20250424-mtk_star_emac-fix-spinlock-recursion-issue-v2-0-f3fde2e529d8@collabora.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: nbd@nbd.name, sean.wang@mediatek.com, lorenzo@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, biao.huang@mediatek.com,
 ot_yinghua.pan@mediatek.com, brgl@bgdev.pl, kernel@collabora.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
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

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 24 Apr 2025 10:38:47 +0200 you wrote:
> This patchset fixes two issues with the mtk-star-emac driver.
> 
> The first patch fixes spin lock recursion issues I've observed on the
> Mediatek Genio 350-EVK board using this driver when the Ethernet
> functionality is enabled on the board (requires a correct jumper and
> DIP switch configuration, as well as enabling the device in the
> devicetree).
> The issues can be easily reproduced with apt install or ssh commands
> especially and with the CONFIG_DEBUG_SPINLOCK parameter, when
> one occurs, there is backtrace similar to this:
> ```
> BUG: spinlock recursion on CPU#0, swapper/0/0
>  lock: 0xffff00000db9cf20, .magic: dead4ead, .owner: swapper/0/0,
> 	.owner_cpu: 0
> CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted
> 	6.15.0-rc2-next-20250417-00001-gf6a27738686c-dirty #28 PREEMPT
> Hardware name: MediaTek MT8365 Open Platform EVK (DT)
> Call trace:
>  show_stack+0x18/0x24 (C)
>  dump_stack_lvl+0x60/0x80
>  dump_stack+0x18/0x24
>  spin_dump+0x78/0x88
>  do_raw_spin_lock+0x11c/0x120
>  _raw_spin_lock+0x20/0x2c
>  mtk_star_handle_irq+0xc0/0x22c [mtk_star_emac]
>  __handle_irq_event_percpu+0x48/0x140
>  handle_irq_event+0x4c/0xb0
>  handle_fasteoi_irq+0xa0/0x1bc
>  handle_irq_desc+0x34/0x58
>  generic_handle_domain_irq+0x1c/0x28
>  gic_handle_irq+0x4c/0x120
>  do_interrupt_handler+0x50/0x84
>  el1_interrupt+0x34/0x68
>  el1h_64_irq_handler+0x18/0x24
>  el1h_64_irq+0x6c/0x70
>  regmap_mmio_read32le+0xc/0x20 (P)
>  _regmap_bus_reg_read+0x6c/0xac
>  _regmap_read+0x60/0xdc
>  regmap_read+0x4c/0x80
>  mtk_star_rx_poll+0x2f4/0x39c [mtk_star_emac]
>  __napi_poll+0x38/0x188
>  net_rx_action+0x164/0x2c0
>  handle_softirqs+0x100/0x244
>  __do_softirq+0x14/0x20
>  ____do_softirq+0x10/0x20
>  call_on_irq_stack+0x24/0x64
>  do_softirq_own_stack+0x1c/0x40
>  __irq_exit_rcu+0xd4/0x10c
>  irq_exit_rcu+0x10/0x1c
>  el1_interrupt+0x38/0x68
>  el1h_64_irq_handler+0x18/0x24
>  el1h_64_irq+0x6c/0x70
>  cpuidle_enter_state+0xac/0x320 (P)
>  cpuidle_enter+0x38/0x50
>  do_idle+0x1e4/0x260
>  cpu_startup_entry+0x34/0x3c
>  rest_init+0xdc/0xe0
>  console_on_rootfs+0x0/0x6c
>  __primary_switched+0x88/0x90
> ```
> 
> [...]

Here is the summary with links:
  - [net,v2,1/2] net: ethernet: mtk-star-emac: fix spinlock recursion issues on rx/tx poll
    https://git.kernel.org/netdev/net/c/6fe086601448
  - [net,v2,2/2] net: ethernet: mtk-star-emac: rearm interrupts in rx_poll only when advised
    https://git.kernel.org/netdev/net/c/e54b4db35e20

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



