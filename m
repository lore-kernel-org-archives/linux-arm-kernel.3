Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1EDFA1FE2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 18:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SzXFP0bojzC1/Eh+Jkcs6xRDndoybMSktlWV2UCrp2M=; b=X3Dk15UQ/8uJdCR3y7bJIKcP13
	Hv8W7HTz2f659NdajSJ01653xdjAV+aEjMmFXCBru5iMZZBD4nDKJl8LTpid7rErpZlynP1oZN1Te
	5SKsk9cEsPPn0bPnMC3e12Ti7Kdrgl2ULZIPvBNnH41tzcglUnWbwBN3yutjICpoXn7ucCnbd0LXY
	O6q9/dB1xK7MtzjtKXY3CazAan6nNkTh9kdeD5N8cV7a5/LR1kwuQ/+1+3+6zXTUii2MNwTJEC5da
	T0mBTNyCda2IMkKjgAS9RPGpU7AnBntZ9bSFIAOZjr5iRi11v/68ZdJ5c2aj2lt2wPhy3LMElvVGI
	MXgC8aJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFcEB-0000000Ad0M-0Zbv;
	Wed, 22 Apr 2026 18:23:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFcE9-0000000Aczw-0WWy;
	Wed, 22 Apr 2026 18:23:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 579E44071A;
	Wed, 22 Apr 2026 18:23:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9463C19425;
	Wed, 22 Apr 2026 18:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776882188;
	bh=ObVVfZ7MFRaxaEq78UjYsEvYcdtg2AtIl4XwzsM5VaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p7q0e6QSbMf6LZdq+iHFpNWQUhWS/t9eaSBbO1iIChuv1F2ivt5WfcEUr82CNscQJ
	 +pSsUCNyQ6BZIUr0+cfBImsWepP1fVPPitudPcm0N6k+9O7BfOPpY/gfj2JNmHzkxw
	 30SDQxHlItKU6V/CTRaAPTPdYGFoaTwoGqw2JNJdT7k9GUoFcP9pI9rrV3TRWNNzEV
	 c+eEEYNeoUGbJTTW+zhzD2NYy5EPodyHPAvMJAMQMNjcTUYFtXH0OPnMjTcFi+ykT+
	 H7jJWe7C+3GnAQ4hplSbrMftJKPjcrp7PTHyMQZphhjjZadttiMjnGDyByIVVorliU
	 LUBQH3xB6Vpcg==
Date: Wed, 22 Apr 2026 19:23:02 +0100
From: Simon Horman <horms@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: "Chester A. Unal" <chester.a.unal@arinc9.com>,
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	Christian Marangi <ansuelsmth@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Frank Wunderlich <frank.wunderlich@linux.dev>,
	John Crispin <john@phrozen.org>
Subject: Re: [PATCH net v2] net: dsa: mt7530: fix .get_stats64 sleeping in
 atomic context
Message-ID: <20260422182302.GR651125@horms.kernel.org>
References: <58aff8b5b1d691872342a6ffd3315f27854788a6.1776595131.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58aff8b5b1d691872342a6ffd3315f27854788a6.1776595131.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_112309_244345_D9058F87 
X-CRM114-Status: GOOD (  14.86  )
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

On Sun, Apr 19, 2026 at 11:43:05AM +0100, Daniel Golle wrote:
> The .get_stats64 callback runs in atomic context, but on
> MDIO-connected switches every register read acquires the MDIO bus
> mutex, which can sleep:
> [   12.645973] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:609
> [   12.654442] in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 759, name: grep
> [   12.663377] preempt_count: 0, expected: 0
> [   12.667410] RCU nest depth: 1, expected: 0
> [   12.671511] INFO: lockdep is turned off.
> [   12.675441] CPU: 0 UID: 0 PID: 759 Comm: grep Tainted: G S      W           7.0.0+ #0 PREEMPT
> [   12.675453] Tainted: [S]=CPU_OUT_OF_SPEC, [W]=WARN
> [   12.675456] Hardware name: Bananapi BPI-R64 (DT)
> [   12.675459] Call trace:
> [   12.675462]  show_stack+0x14/0x1c (C)
> [   12.675477]  dump_stack_lvl+0x68/0x8c
> [   12.675487]  dump_stack+0x14/0x1c
> [   12.675495]  __might_resched+0x14c/0x220
> [   12.675504]  __might_sleep+0x44/0x80
> [   12.675511]  __mutex_lock+0x50/0xb10
> [   12.675523]  mutex_lock_nested+0x20/0x30
> [   12.675532]  mt7530_get_stats64+0x40/0x2ac
> [   12.675542]  dsa_user_get_stats64+0x2c/0x40
> [   12.675553]  dev_get_stats+0x44/0x1e0
> [   12.675564]  dev_seq_printf_stats+0x24/0xe0
> [   12.675575]  dev_seq_show+0x14/0x3c
> [   12.675583]  seq_read_iter+0x37c/0x480
> [   12.675595]  seq_read+0xd0/0xec
> [   12.675605]  proc_reg_read+0x94/0xe4
> [   12.675615]  vfs_read+0x98/0x29c
> [   12.675625]  ksys_read+0x54/0xdc
> [   12.675633]  __arm64_sys_read+0x18/0x20
> [   12.675642]  invoke_syscall.constprop.0+0x54/0xec
> [   12.675653]  do_el0_svc+0x3c/0xb4
> [   12.675662]  el0_svc+0x38/0x200
> [   12.675670]  el0t_64_sync_handler+0x98/0xdc
> [   12.675679]  el0t_64_sync+0x158/0x15c
> 
> For MDIO-connected switches, poll MIB counters asynchronously using a
> delayed workqueue every second and let .get_stats64 return the cached
> values under a spinlock. A mod_delayed_work() call on each read
> triggers an immediate refresh so counters stay responsive when queried
> more frequently.
> 
> MMIO-connected switches (MT7988, EN7581, AN7583) are not affected
> because their regmap does not sleep, so they continue to read MIB
> counters directly in .get_stats64.
> 
> Fixes: 88c810f35ed5 ("net: dsa: mt7530: implement .get_stats64")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Acked-by: Chester A. Unal <chester.a.unal@arinc9.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> ---
> v2:
>  * use spin_lock_bh()/spin_unlock_bh() to prevent potential deadlock
>  * rate-limit mod_delayed_work() refresh to at most once per 100ms
>  * move cancel_delayed_work_sync() after dsa_unregister_switch()
>  * add mt753x_teardown() callback to cancel the stats work
>  * fix commit message

FWIIW, I looked over the feedback generated by Sashiko for this patch,
and I believe the issues it flags are false positives.

