Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E768CC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 09:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rFI0zxYHT1lbO/xLY2Kzp5ITNL1y31B0yQHW5mGtSOw=; b=R47ftx1/T/Ydll
	lNp/1QA0qCkddKqeZ6vxKtUTksuPPtQvykk9VnTGb9Sj5hrilnHwHxGnt20kF/tU6uQ6gdRVWkAEj
	NyboYx9PfL55pu+GzNf0aTE0hwyOnH5K6GxTAwQYr3gaB6TP3of1WLTGUNgA4uEdoaMbcdwQxsWWr
	0dxGRqmFWXG1+iINX92b4LT5j5IpxGiaSBd0EvlwK+w1MYZwO6/ejdYSAeG4xRhUuRo3dwX2schey
	Zs98ycOPfC29fpC+QGlghJs0+xfRdguo8NaFIxQY1ZZW6WtHJcF6f0mWdQZQWcpPd4QWVkrl3GIeF
	QNd1fDG4HMXpDX1W+29g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7sYl-0000000DSDE-1slO;
	Thu, 24 Apr 2025 09:07:55 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7s8K-0000000DNME-1SoN;
	Thu, 24 Apr 2025 08:40:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745484034;
	bh=7Vx7ItJ/6faelSa7z2An9OsZOu9dQ1KbcJtEn0JBz7o=;
	h=From:Subject:Date:To:Cc:From;
	b=DwJjyCHB4qM6EABFTed8/oZxLcdx8V3sNngWjyiL5j948xR5XPidwz4eAUOeX/mYx
	 RJKbeghO3KU2SaheIYSosRhZ+mZp3CXgTA/OZxM3+BUtXbRIJSV7LIz7V6SzgiBXXi
	 T+0k0aPVeVDsk47spM1H9FAYEAZP9aBFJ5E4CeOf00vLm6tvg5ZITdHL16oh8PIXjM
	 Qehdzz2e610nWoTcFlo/uPArOVj8XjhWeU9mswW2XcAoB7W6QHODeMijJkz2SUHcRF
	 vfmj14jnWVoJ6sfqeIIpO0oBbeZcpU/qomUoOhscJIOlpA9rypRHtGMGsbuRKK1KR1
	 JzTJHU7Eneh8A==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3F1E917E0F66;
	Thu, 24 Apr 2025 10:40:33 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [PATCH net v2 0/2] net: ethernet: mtk-star-emac: fix several
 issues on rx/tx poll
Date: Thu, 24 Apr 2025 10:38:47 +0200
Message-Id: <20250424-mtk_star_emac-fix-spinlock-recursion-issue-v2-0-f3fde2e529d8@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJf4CWgC/5WOUW7CMBBErxLtdxfZJhTIF/eoEHLMtqxIbLrrR
 CCUu2MCPUA/Z2dn3txBSZgUmuoOQiMrp1iE+6ggnHz8IeRj0eCMW5nabrDP54NmLwfqfcBvvqJ
 eOHYpnFEoDPIsQFYdCOujDVtn1qF1FkrhRaj8z7AviJRh/zoK/Q4FnN9O65UwpL7n3FSRrhlfc
 OfmwIk1J7nNi0c7J/78/4wbLRq0tK3J10uz/DS7kLrOt0n8osBhP03TA48de2geAQAA
X-Change-ID: 20250418-mtk_star_emac-fix-spinlock-recursion-issue-4d1c9207cb21
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Biao Huang <biao.huang@mediatek.com>, 
 Yinghua Pan <ot_yinghua.pan@mediatek.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: kernel@collabora.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745484033; l=3317;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=7Vx7ItJ/6faelSa7z2An9OsZOu9dQ1KbcJtEn0JBz7o=;
 b=3rrhAI6FTXXn2kA6OC9IUtYowxwH4UUAeS18HEAmXgydiFFkjDb1Hqk+4sXkEBGTWS4CMD/PG
 1pk9oLrHJPGA9g5PyaD6b7svutfEQC/OemREgrRdoobK48OvS1GuF7x
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_014036_539312_150AEABA 
X-CRM114-Status: GOOD (  13.68  )
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

This patchset fixes two issues with the mtk-star-emac driver.

The first patch fixes spin lock recursion issues I've observed on the
Mediatek Genio 350-EVK board using this driver when the Ethernet
functionality is enabled on the board (requires a correct jumper and
DIP switch configuration, as well as enabling the device in the
devicetree).
The issues can be easily reproduced with apt install or ssh commands
especially and with the CONFIG_DEBUG_SPINLOCK parameter, when
one occurs, there is backtrace similar to this:
```
BUG: spinlock recursion on CPU#0, swapper/0/0
 lock: 0xffff00000db9cf20, .magic: dead4ead, .owner: swapper/0/0,
	.owner_cpu: 0
CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted
	6.15.0-rc2-next-20250417-00001-gf6a27738686c-dirty #28 PREEMPT
Hardware name: MediaTek MT8365 Open Platform EVK (DT)
Call trace:
 show_stack+0x18/0x24 (C)
 dump_stack_lvl+0x60/0x80
 dump_stack+0x18/0x24
 spin_dump+0x78/0x88
 do_raw_spin_lock+0x11c/0x120
 _raw_spin_lock+0x20/0x2c
 mtk_star_handle_irq+0xc0/0x22c [mtk_star_emac]
 __handle_irq_event_percpu+0x48/0x140
 handle_irq_event+0x4c/0xb0
 handle_fasteoi_irq+0xa0/0x1bc
 handle_irq_desc+0x34/0x58
 generic_handle_domain_irq+0x1c/0x28
 gic_handle_irq+0x4c/0x120
 do_interrupt_handler+0x50/0x84
 el1_interrupt+0x34/0x68
 el1h_64_irq_handler+0x18/0x24
 el1h_64_irq+0x6c/0x70
 regmap_mmio_read32le+0xc/0x20 (P)
 _regmap_bus_reg_read+0x6c/0xac
 _regmap_read+0x60/0xdc
 regmap_read+0x4c/0x80
 mtk_star_rx_poll+0x2f4/0x39c [mtk_star_emac]
 __napi_poll+0x38/0x188
 net_rx_action+0x164/0x2c0
 handle_softirqs+0x100/0x244
 __do_softirq+0x14/0x20
 ____do_softirq+0x10/0x20
 call_on_irq_stack+0x24/0x64
 do_softirq_own_stack+0x1c/0x40
 __irq_exit_rcu+0xd4/0x10c
 irq_exit_rcu+0x10/0x1c
 el1_interrupt+0x38/0x68
 el1h_64_irq_handler+0x18/0x24
 el1h_64_irq+0x6c/0x70
 cpuidle_enter_state+0xac/0x320 (P)
 cpuidle_enter+0x38/0x50
 do_idle+0x1e4/0x260
 cpu_startup_entry+0x34/0x3c
 rest_init+0xdc/0xe0
 console_on_rootfs+0x0/0x6c
 __primary_switched+0x88/0x90
```

The second patch is a cleanup patch to fix a inconsistency in the
mtk_star_rx_poll function between the napi_complete_done api usage and
its description in documentation.

I've tested this patchset on Mediatek Genio 350-EVK board with a kernel
based on linux-next (tag: next-20250422).

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
Changes in v2:
- Add missing net subject-prefix for patchs and patchset
- Remove unneeded init for new local variables and order them in reverse
  christmas tree
- Add missing Fixes: tag in second patch commit message
- Link to v1: https://lore.kernel.org/r/20250422-mtk_star_emac-fix-spinlock-recursion-issue-v1-0-1e94ea430360@collabora.com

---
Louis-Alexis Eyraud (2):
      net: ethernet: mtk-star-emac: fix spinlock recursion issues on rx/tx poll
      net: ethernet: mtk-star-emac: rearm interrupts in rx_poll only when advised

 drivers/net/ethernet/mediatek/mtk_star_emac.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)
---
base-commit: 1d2c58af2b22324cc536113e010d1a38d443f888
change-id: 20250418-mtk_star_emac-fix-spinlock-recursion-issue-4d1c9207cb21

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


