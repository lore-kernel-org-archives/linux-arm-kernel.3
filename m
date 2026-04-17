Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE36F43698
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 12:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wTHSH6uu7em/XyG5vJUzJuQqtbjE+m45vOUXrzdH4tM=; b=X78zyZQfmTGeCfoFdhQH2U6XNp
	KIvhm9/UhduDj1LEzQM+jTTEYWRPxbYLEd+V5MCwjyFnqBk+i2bt3jhj/fDbuWRISEH/lKhA/V1du
	JXAAxvXx0UyS7ER0whGOUzGBauL5iVdePbPeth1ULWpxRmajjqeQjeznr1Vn/ilTWeYzqzbdYfU0P
	QNYOOHKY89P4Tt8FK3WrPF8gn5Qj8GAhXm1SKjwrYYvVT4gF8atj3XfqaU9umDLPN7oSe73gHrtik
	2C/A9b4DeUBdPf63un7FI9ZCAUiFWH3pUqGY1WQ6OYgRzI1ZmBB0En+RdWan0usGiRv24PZB4iU+k
	m7ZjnItw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDhyO-000000041GE-02yT;
	Fri, 17 Apr 2026 12:07:00 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDhyL-000000041F3-3LzO;
	Fri, 17 Apr 2026 12:06:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=wTHSH6uu7em/XyG5vJUzJuQqtbjE+m45vOUXrzdH4tM=; b=6UQYiMQ5q8vCBsc1etsvXiiZo+
	XHP5/l/O13WqgPPglFsZA8n+lLA2OgvtXkz9xqLt2XDPMawwrnCZmdZIwgycvme1QwISQAq4FHJPX
	iF2e04DdPggqG02XWXXUoCyR9so6m5OROZ3czMlDdrgOYnn9YwvuJD6vyDJlyD4qSfPw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wDhxv-00GPFd-4b; Fri, 17 Apr 2026 14:06:31 +0200
Date: Fri, 17 Apr 2026 14:06:31 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: "Chester A. Unal" <chester.a.unal@arinc9.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	Christian Marangi <ansuelsmth@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Frank Wunderlich <frank-w@public-files.de>,
	John Crispin <john@phrozen.org>
Subject: Re: [PATCH net] net: dsa: mt7530: fix .get_stats64 sleeping in
 atomic context
Message-ID: <fb8dfd82-9e11-4cdb-936d-46b7ababcb3f@lunn.ch>
References: <79dc0ec5b6be698b14cb66339d6f63033ca2934a.1776397542.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79dc0ec5b6be698b14cb66339d6f63033ca2934a.1776397542.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_050657_926053_66C75D8F 
X-CRM114-Status: GOOD (  10.66  )
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

On Fri, Apr 17, 2026 at 04:55:57AM +0100, Daniel Golle wrote:
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
> values under a per-port spinlock. A mod_delayed_work() call on each
> read triggers an immediate refresh so counters stay responsive when
> queried more frequently.
> 
> MMIO-connected switches (MT7988, EN7581, AN7583) are not affected
> because their regmap does not sleep, so they continue to read MIB
> counters directly in .get_stats64.
> 
> Fixes: 88c810f35ed5 ("net: dsa: mt7530: implement .get_stats64")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

