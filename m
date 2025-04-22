Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD38C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 14:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SC8AUF51NT12xt/IGFgTeWrKWN9K3AW7dBXIuKIB8Dk=; b=ScsU49UcEmHcqn
	5+FOoAPojr9XxgMP7S6vhAMjrF5GdPt2WDFu+Tds2d3GNAR2kmMbuJNqTSVkTbw4cgCl0K5jScakv
	gEQdpuEFxgUp5o3UMAXrcQHwg8IGmtubI/e/FDzENlei1F4p2QBYfeMh0FQ/5d050UdrqBkdIMjyW
	Kbx4TU3GCisBFV0hOXfCrwPVXGLCbWjvUD/4bCdCQUWCypHU9En5Q4KMz66wwXriHFfspVoRVIXyO
	id0YF23/i5xXKe3PWaGjdgapzNLod9QhZMT/zaX+KGmx/nilP0Z/AYmLzUGk1a6xsJDxpXy73bNjn
	nEZag5SSiYM06UURNaGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ESW-00000007SgM-2gfI;
	Tue, 22 Apr 2025 14:18:48 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DIn-00000007EAv-3STj;
	Tue, 22 Apr 2025 13:04:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745327079;
	bh=ZTClGc4I9fjL6g/yRm/9jJCzJEVD/nYIpw0rGu8omgs=;
	h=From:Subject:Date:To:Cc:From;
	b=TQRRpdUMt6dUNfCuf05Ywzg8M+UGhLQ0KZsHGrp4m/GPtEAILdJgu4KrB8rLYu3An
	 HE2CIHkEdzUksukUiGaY5ZOiDQQFdwwBaJgpm4hh5KL0iPTUXOMJeoIEJZ4LF8O50e
	 XCPlYBqpBp2MGB6ZtYCtyffTg4/roQVydbUj4OP9LmF0T7eXXzLq1p8phbhZ3kLCb8
	 xZF9sRXWu1nm4cVb7ceJaIeyXX1ayj2NIF6k65DN7bEoNQcsBsCuj586aSR/Gcs3av
	 /gVAsUCxa23CT/cfAqAndfljPZ2Ymp5bV8T2WWlHelBNJ+ij27BI5HjmQ8UeS825VH
	 jc9H+dc6wcRQQ==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 65DA617E0F93;
	Tue, 22 Apr 2025 15:04:38 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [PATCH 0/2] net: ethernet: mtk-star-emac: fix several issues on
 rx/tx poll
Date: Tue, 22 Apr 2025 15:03:37 +0200
Message-Id: <20250422-mtk_star_emac-fix-spinlock-recursion-issue-v1-0-1e94ea430360@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKmTB2gC/yWNUQqDMBAFryL73QUTLG29ShGJ67ZdbKJmYxHEu
 zetn/N4zGygHIUV6mKDyB9RGUMGcyqAXi48GaXPDLa057IyV/RpaDW52LJ3hA9ZUScJ75EGjEx
 L/AlQVBfGqjd0s+WFOmsgC6fI+f+P3ZuDI89LbqZjhM4pI43eS6qLwGvCo2stNPv+BdI7r2itA
 AAA
X-Change-ID: 20250418-mtk_star_emac-fix-spinlock-recursion-issue-4d1c9207cb21
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Biao Huang <biao.huang@mediatek.com>, 
 Yinghua Pan <ot_yinghua.pan@mediatek.com>
Cc: kernel@collabora.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745327078; l=2962;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=ZTClGc4I9fjL6g/yRm/9jJCzJEVD/nYIpw0rGu8omgs=;
 b=tPOlYDnqdrIazPN/l4tIxqekFoTysM2vZlArOEmvnDVUAYlZbEQrXLt6cvaY/gaY8wSEpv+UD
 N33cSMaaO2+C+CUHmcP8Ffvq9Uvja1WheR1tbqb+yrqJrP822YFuXtW
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_060442_021723_1AC3542F 
X-CRM114-Status: GOOD (  12.42  )
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


