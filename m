Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492F6F44850
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 12:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=AhOSzTxD+cV4MqoaDbRxHefm2I22dte0YETJ6P0JjKI=; b=LAm3h6cFSVKFT9
	0RX4Yu+/qjHlORg7FxngwFpz8VOXFsoMgK8vgtkrwT1DF7Hq+zkNErvotV45P7VM3AZAoNO4L712H
	Z/Y1o4kC/Zu8CEL/4tfoWh99gx9z0V4bcNLqk9pS3Z5tUSxOMZb7ZeEsRIgDu6jL0/m1ADUo4nAru
	k0cvt9xJUriaDb5iZQVBRjVE+zy548KDH44N3hElkecq/58dbXC/pBOIquFCYUhbshHIZv0MdCKXV
	cAipNJHj/osLYhJzktopNY4V6AfNX2b8lxrHdyzuytOMNLFPpTk9owWf2h8Njz9yUU3koIbqVugQK
	88JBc1igDX5OY1BaR+pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAph-0000000CA2W-1IYP;
	Fri, 10 Apr 2026 12:19:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBApe-0000000C9z7-44CK;
	Fri, 10 Apr 2026 12:19:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 51A166091C;
	Fri, 10 Apr 2026 12:19:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B4F4C2BCB0;
	Fri, 10 Apr 2026 12:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775823570;
	bh=gx3RztExl/RgjhE+RVjeBSM72TbSvLK5CUYrt3EY96I=;
	h=Date:From:To:Cc:Subject:References:From;
	b=Bpuk5rSRR/rs1jSmitZH/KfJL+3TNuP+dz9xwjVC8e1YVix0oW3s2Pp/y+L8X9oHD
	 FfGXk8B3TY0jbEAZNS2FVq5qwscSTPNozRdmP6S1az7QsSRwh37CnHDegYmWg/dUhl
	 oXkQ09dlNxtpDlZfCfFVBtb5yeQYcj5dZxd8vIShSLkbr1gWWPlcdAHe/FZpu8mplV
	 u5Y93dLHQf7k/6QZkYgksDu7FYlgnX/m++LNPEYIEnDd7dRmUlTkWsJQwVidroG1Bi
	 MdGUi4KzTqg9X+Zn0ce3HiuHIaE9YE1XVzPbK1ak8XvacDL5nVhYnRULjmYf5QSMQ0
	 DvaPTMl303Xmg==
Date: Fri, 10 Apr 2026 14:19:27 +0200
Message-ID: <20260410120318.386500288@kernel.org>
User-Agent: quilt/0.68
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: linux-wireless@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 x86@kernel.org,
 Lu Baolu <baolu.lu@linux.intel.com>,
 iommu@lists.linux.dev,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 netdev@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 linux-crypto@vger.kernel.org,
 Vlastimil Babka <vbabka@kernel.org>,
 linux-mm@kvack.org,
 David Woodhouse <dwmw2@infradead.org>,
 Bernie Thompson <bernie@plugable.com>,
 linux-fbdev@vger.kernel.org,
 "Theodore Tso" <tytso@mit.edu>,
 linux-ext4@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>,
 Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 kasan-dev@googlegroups.com,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Thomas Sailer <t.sailer@alumni.ethz.ch>,
 linux-hams@vger.kernel.org,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 linux-alpha@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org,
 Dinh Nguyen <dinguyen@kernel.org>,
 Jonas Bonn <jonas@southpole.se>,
 linux-openrisc@vger.kernel.org,
 Helge Deller <deller@gmx.de>,
 linux-parisc@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org,
 Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 sparclinux@vger.kernel.org
Subject: [patch 12/38] wifi: wil6210: Replace get_cyles() usage
References: <20260410120044.031381086@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

There is no reason why this debug code requires to use get_cycles() for
timing purposes.

Use ktime_get() instead.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Cc: linux-wireless@vger.kernel.org
---
 drivers/net/wireless/ath/wil6210/debugfs.c   |    2 +-
 drivers/net/wireless/ath/wil6210/txrx.c      |    6 +++---
 drivers/net/wireless/ath/wil6210/txrx_edma.c |    4 ++--
 drivers/net/wireless/ath/wil6210/wil6210.h   |    3 ++-
 4 files changed, 8 insertions(+), 7 deletions(-)

--- a/drivers/net/wireless/ath/wil6210/debugfs.c
+++ b/drivers/net/wireless/ath/wil6210/debugfs.c
@@ -151,7 +151,7 @@ static int ring_show(struct seq_file *s,
 			char name[10];
 			char sidle[10];
 			/* performance monitoring */
-			cycles_t now = get_cycles();
+			ktime_t now = ktime_get();
 			uint64_t idle = txdata->idle * 100;
 			uint64_t total = now - txdata->begin;
 
--- a/drivers/net/wireless/ath/wil6210/txrx.c
+++ b/drivers/net/wireless/ath/wil6210/txrx.c
@@ -1976,7 +1976,7 @@ static int __wil_tx_vring_tso(struct wil
 	used = wil_ring_used_tx(vring);
 	if (wil_val_in_range(wil->ring_idle_trsh,
 			     used, used + descs_used)) {
-		txdata->idle += get_cycles() - txdata->last_idle;
+		txdata->idle += ktime_get() - txdata->last_idle;
 		wil_dbg_txrx(wil,  "Ring[%2d] not idle %d -> %d\n",
 			     vring_index, used, used + descs_used);
 	}
@@ -2129,7 +2129,7 @@ static int __wil_tx_ring(struct wil6210_
 	used = wil_ring_used_tx(ring);
 	if (wil_val_in_range(wil->ring_idle_trsh,
 			     used, used + nr_frags + 1)) {
-		txdata->idle += get_cycles() - txdata->last_idle;
+		txdata->idle += ktime_get() - txdata->last_idle;
 		wil_dbg_txrx(wil,  "Ring[%2d] not idle %d -> %d\n",
 			     ring_index, used, used + nr_frags + 1);
 	}
@@ -2531,7 +2531,7 @@ int wil_tx_complete(struct wil6210_vif *
 			     used_new, used_before_complete)) {
 		wil_dbg_txrx(wil, "Ring[%2d] idle %d -> %d\n",
 			     ringid, used_before_complete, used_new);
-		txdata->last_idle = get_cycles();
+		txdata->last_idle = ktime_get();
 	}
 
 	/* shall we wake net queues? */
--- a/drivers/net/wireless/ath/wil6210/txrx_edma.c
+++ b/drivers/net/wireless/ath/wil6210/txrx_edma.c
@@ -1286,7 +1286,7 @@ int wil_tx_sring_handler(struct wil6210_
 				     used_new, used_before_complete)) {
 			wil_dbg_txrx(wil, "Ring[%2d] idle %d -> %d\n",
 				     ring_id, used_before_complete, used_new);
-			txdata->last_idle = get_cycles();
+			txdata->last_idle = ktime_get();
 		}
 
 again:
@@ -1499,7 +1499,7 @@ static int __wil_tx_ring_tso_edma(struct
 	used = wil_ring_used_tx(ring);
 	if (wil_val_in_range(wil->ring_idle_trsh,
 			     used, used + descs_used)) {
-		txdata->idle += get_cycles() - txdata->last_idle;
+		txdata->idle += ktime_get() - txdata->last_idle;
 		wil_dbg_txrx(wil,  "Ring[%2d] not idle %d -> %d\n",
 			     ring_index, used, used + descs_used);
 	}
--- a/drivers/net/wireless/ath/wil6210/wil6210.h
+++ b/drivers/net/wireless/ath/wil6210/wil6210.h
@@ -14,6 +14,7 @@
 #include <linux/timex.h>
 #include <linux/types.h>
 #include <linux/irqreturn.h>
+#include <linux/timekeeping.h>
 #include "wmi.h"
 #include "wil_platform.h"
 #include "fw.h"
@@ -632,7 +633,7 @@ struct wil_txrx_ops {
 struct wil_ring_tx_data {
 	bool dot1x_open;
 	int enabled;
-	cycles_t idle, last_idle, begin;
+	ktime_t idle, last_idle, begin;
 	u8 agg_wsize; /* agreed aggregation window, 0 - no agg */
 	u16 agg_timeout;
 	u8 agg_amsdu;


