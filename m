Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DC3F43695
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 12:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjpGNp21pxfsQzkG2LPNFYZA2ZEfPjizwMSu6qyomN8=; b=3/DhpGtag2P3ODrTHr506tL5RD
	u0CGfmJRbP0ZXJ1GfcdpanVjf3p9OvwiMdDhE/LldlpYsSrIf3C4VncrqpmfR+zcODyP/pu1GbZVK
	q+uPse+5PcjsVZ+3Xllufw4TgUpaBT50n8oL0PMA9AKryUqPCOSrrnbOsIs7wZ9ADKOT47WSQXOQO
	DKayG/FPMIAHq9kjXwelA98PawP4LaCd/yW/psD2WR7PxPJ5e2ZRDtlzOChaSmqzt4yHKF9KKPYaq
	Yvsivioijy0GIIpkXtLtk+JtHt9JYldeoDxzPk2t5CM/kaMI6LVldbESvIo0NwStobm5Pdd2rT3jf
	H+JZxwNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDi0A-000000041UO-2np3;
	Fri, 17 Apr 2026 12:08:50 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDi08-000000041Tn-4AZb;
	Fri, 17 Apr 2026 12:08:50 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wDhzt-000000004Gm-0SZ7;
	Fri, 17 Apr 2026 12:08:33 +0000
Date: Fri, 17 Apr 2026 13:08:29 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "Chester A. Unal" <chester.a.unal@arinc9.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
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
Message-ID: <aeIivb0AwRoCOezc@makrotopia.org>
References: <79dc0ec5b6be698b14cb66339d6f63033ca2934a.1776397542.git.daniel@makrotopia.org>
 <C88911FE-2012-4D29-B7F2-6BEA28122854@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C88911FE-2012-4D29-B7F2-6BEA28122854@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_050849_053660_2BD2EC84 
X-CRM114-Status: GOOD (  13.18  )
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

On Fri, Apr 17, 2026 at 07:35:46AM +0000, Chester A. Unal wrote:
> On 17 April 2026 04:55:57 WEST, Daniel Golle <daniel@makrotopia.org> wrote:
> >The .get_stats64 callback runs in atomic context, but on
> >MDIO-connected switches every register read acquires the MDIO bus
> >mutex, which can sleep:
> >[   12.645973] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:609
> >[   12.654442] in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 759, name: grep
> >[   12.663377] preempt_count: 0, expected: 0
> >[   12.667410] RCU nest depth: 1, expected: 0
> >[   12.671511] INFO: lockdep is turned off.
> >[   12.675441] CPU: 0 UID: 0 PID: 759 Comm: grep Tainted: G S      W           7.0.0+ #0 PREEMPT
> >[   12.675453] Tainted: [S]=CPU_OUT_OF_SPEC, [W]=WARN
> >[   12.675456] Hardware name: Bananapi BPI-R64 (DT)
> >[   12.675459] Call trace:
> >[   12.675462]  show_stack+0x14/0x1c (C)
> >[   12.675477]  dump_stack_lvl+0x68/0x8c
> >[   12.675487]  dump_stack+0x14/0x1c
> >[   12.675495]  __might_resched+0x14c/0x220
> >[   12.675504]  __might_sleep+0x44/0x80
> >[   12.675511]  __mutex_lock+0x50/0xb10
> >[   12.675523]  mutex_lock_nested+0x20/0x30
> >[   12.675532]  mt7530_get_stats64+0x40/0x2ac
> >[   12.675542]  dsa_user_get_stats64+0x2c/0x40
> >[   12.675553]  dev_get_stats+0x44/0x1e0
> >[   12.675564]  dev_seq_printf_stats+0x24/0xe0
> >[   12.675575]  dev_seq_show+0x14/0x3c
> >[   12.675583]  seq_read_iter+0x37c/0x480
> >[   12.675595]  seq_read+0xd0/0xec
> >[   12.675605]  proc_reg_read+0x94/0xe4
> >[   12.675615]  vfs_read+0x98/0x29c
> >[   12.675625]  ksys_read+0x54/0xdc
> >[   12.675633]  __arm64_sys_read+0x18/0x20
> >[   12.675642]  invoke_syscall.constprop.0+0x54/0xec
> >[   12.675653]  do_el0_svc+0x3c/0xb4
> >[   12.675662]  el0_svc+0x38/0x200
> >[   12.675670]  el0t_64_sync_handler+0x98/0xdc
> >[   12.675679]  el0t_64_sync+0x158/0x15c
> >
> >For MDIO-connected switches, poll MIB counters asynchronously using a
> >delayed workqueue every second and let .get_stats64 return the cached
> >values under a per-port spinlock. A mod_delayed_work() call on each
                 ^^^^^^^^^^^^^^^^^^^
Just noticed I forgot to update the commit message when changing the
implementation to use a single shared spinlock for all ports...

I'll send v2 tomorrow fixing that, and what ever else comes up, if
anything.

> >read triggers an immediate refresh so counters stay responsive when
> >queried more frequently.
> >
> >MMIO-connected switches (MT7988, EN7581, AN7583) are not affected
> >because their regmap does not sleep, so they continue to read MIB
> >counters directly in .get_stats64.
> >
> >Fixes: 88c810f35ed5 ("net: dsa: mt7530: implement .get_stats64")
> >Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> >---
> >This bug highlights a bigger problem and the actual cause:
> >Locking in the mt7530 driver deserves a cleanup, and refactoring
> >towards cleanly and directly using the regmap API.
> >I've prepared this already and am going to submit a series doing
> >most of that using Coccinelle semantic patches once net-next opens
> >again.
> 
> Acked-by: Chester A. Unal <chester.a.unal@arinc9.com>
> 
> Chester A.

