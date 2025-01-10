Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA3C0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 19:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BxtNKnXtGG2RerY8yHOdZZuD70UM+T9bfGtOFf/xcMw=; b=AjUNEQ1UlMbN4rWdcVddY2T6Fs
	vevk7Ivp62nZ7+eE4r1dB9t6RGYvpHavP9Bwl2wUD6VJvJ75oQK2DhBaKNeiWVjm+cLuDpO7+rK0L
	WrKx2UwivGIx187NBm0oUhSbYoiRIXV2loUpXyQBH0xJ4KP8jf1C8bS2nNnzZ9GJ6tYinMBdx08sm
	6bScaadIa1/aoCjy/HxRosMNDZ8JZt/kXee0kSJpdUOvqogNwy0cGyOdWxiJvVmXVgNHXuUgkGkP1
	0ydMTwtD27YHsumdQv3JY3xK6sAeXcB7qnT86nBJpxFTAnHz/BYvL7PgkkGuB6Kb3WHMEJ5PQXGBx
	wuSNj/2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWKgj-0000000GlaQ-3Yk0;
	Fri, 10 Jan 2025 19:28:57 +0000
Received: from out-174.mta1.migadu.com ([95.215.58.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWKeI-0000000GksG-3bZD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 19:26:30 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736537184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BxtNKnXtGG2RerY8yHOdZZuD70UM+T9bfGtOFf/xcMw=;
	b=hxQH/BGnm/yae6MCS5tk3JyBGXqbZymGi8NcB29z/IYfHbg8adEhKSHkVkvP8m4/pCe8G/
	tOTl15Wy9KBOywtVA8y/UHnP0H56uJo22U8UiZ/W1OLLRdz2bczLRLCDenMjhtYZC05+zl
	leZOgT2jBQCr6JLN5pNVvxB28iSVucw=
From: Sean Anderson <sean.anderson@linux.dev>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	netdev@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Shannon Nelson <shannon.nelson@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-kernel@vger.kernel.org,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH net-next v3 1/6] net: xilinx: axienet: Add some symbolic constants for IRQ delay timer
Date: Fri, 10 Jan 2025 14:26:11 -0500
Message-Id: <20250110192616.2075055-2-sean.anderson@linux.dev>
In-Reply-To: <20250110192616.2075055-1-sean.anderson@linux.dev>
References: <20250110192616.2075055-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_112627_247991_C769BEB3 
X-CRM114-Status: GOOD (  10.59  )
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

Instead of using literals, add some symbolic constants for the IRQ delay
timer calculation.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
Reviewed by: Shannon Nelson <shannon.nelson@amd.com>
---

(no changes since v2)

Changes in v2:
- New

 drivers/net/ethernet/xilinx/xilinx_axienet.h      | 3 +++
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 7 ++-----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet.h b/drivers/net/ethernet/xilinx/xilinx_axienet.h
index d64b8abcf018..a3f4f3e42587 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet.h
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet.h
@@ -120,6 +120,9 @@
 #define XAXIDMA_IRQ_ERROR_MASK		0x00004000 /* Error interrupt */
 #define XAXIDMA_IRQ_ALL_MASK		0x00007000 /* All interrupts */
 
+/* Constant to convert delay counts to microseconds */
+#define XAXIDMA_DELAY_SCALE		(125ULL * USEC_PER_SEC)
+
 /* Default TX/RX Threshold and delay timer values for SGDMA mode */
 #define XAXIDMA_DFT_TX_THRESHOLD	24
 #define XAXIDMA_DFT_TX_USEC		50
diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index ae743991117c..62638e2a086e 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -238,11 +238,8 @@ static u32 axienet_usec_to_timer(struct axienet_local *lp, u32 coalesce_usec)
 
 	/* 1 Timeout Interval = 125 * (clock period of SG clock) */
 	result = DIV64_U64_ROUND_CLOSEST((u64)coalesce_usec * clk_rate,
-					 (u64)125000000);
-	if (result > 255)
-		result = 255;
-
-	return result;
+					 XAXIDMA_DELAY_SCALE);
+	return min(result, FIELD_MAX(XAXIDMA_DELAY_MASK));
 }
 
 /**
-- 
2.35.1.1320.gc452695387.dirty


