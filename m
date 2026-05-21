Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBB9CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 04:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K1wloX5OKUxKAl6yBlLsV3ZmU03U1bisGVDpG5AhgyQ=; b=YOLagRi6DzE5d2QDVhZlkP1FTY
	qUzKjZ89U8DQjYkbTqeB2rIVIusllSbmQ0mic8yLe1dl+Jpe9augIwxO+yJJgelsWWTu3jZ31RzyD
	NZQOU/Y42z9vgOxNa8grqmVaLJNZjd400LobCV90F5XtQyeyt2w8GTlhJ28qaZzw1JQDGPu8NAtOq
	4QKHV+N7E/g/N7wL2CTVnt18xELBIG1jBrYbnSof+VoNhSV1x8jUKUT7jhx0k9Rkq0GBfyXEokgxY
	zqyu++lFHs5DRvdoTShhk19Vq2wSyu05wAQDA7xgOv5s5b9u5evu6vMLJiWochtXapDndgLhlAEFf
	a5E3k72g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPusm-00000006dq9-1xgo;
	Thu, 21 May 2026 04:19:40 +0000
Received: from mta.al2klimov.de ([2a01:4f8:c0c:a5b1::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPusi-00000006doK-0sHs;
	Thu, 21 May 2026 04:19:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=default; bh=OIwCPzK29tUA
	4euHyqRP6T5+NAvbiccSYDspwNWB3sE=; h=date:subject:cc:to:from;
	d=al2klimov.de; b=YFwrX6ntkevQ2+g/wbHFSjBhn997rinUE24vOWpk1GOAGfvIQE+Y
	BFCcgm7lCAe3PZX50PcL7c9ZyaYlIG8mbNNvNU+ANIkz237KVEcDL3ncZ0RnfpFQwvABuQ
	qrZBCMH+yuE4Z2576GEc0AK5N1tkBjBJT9CFP5LgjneEOvOtGfiaiASYu6/3Je6zaJ35km
	4GN7D9h4tqqAJxJ0lD8nX3tas+gbuNaV2dwGT8oS3Tm/Coxl2lCWLOV+V0q8TM/Ep8j/NL
	SGxBFz7E462JneZQM6BfFCDo5hgKMx5X+2tWHi4pLU7xYEBR+Cx2oNM0d3/JIyJeeYvLj6
	SKhfwgg3dQ==
Received: from cachy-ak (2a02-2455-18e9-e011-4d8a-aad2-c25c-50e5.dyn6.pyur.net [2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5])
	by mta.al2klimov.de (OpenSMTPD) with ESMTPSA id ba31b6ee (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO);
	Thu, 21 May 2026 04:19:34 +0000 (UTC)
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
To: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-kernel@vger.kernel.org (open list:CLOCKSOURCE, CLOCKEVENT DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ACTIONS SEMI ARCHITECTURE),
	linux-actions@lists.infradead.org (moderated list:ARM/ACTIONS SEMI ARCHITECTURE)
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH] clocksource/drivers/owl: fix refcount leak
Date: Thu, 21 May 2026 06:19:00 +0200
Message-ID: <20260521041901.542964-1-grandmaster@al2klimov.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_211936_548487_3EA851F7 
X-CRM114-Status: UNSURE (   7.18  )
X-CRM114-Notice: Please train this message.
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

Every value returned from of_clk_get() is supposed to be cleaned up
via clk_put() once not needed anymore.

Fixes: 4be78a86c506 ("clocksource: Add Owl timer")
Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 drivers/clocksource/timer-owl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/timer-owl.c b/drivers/clocksource/timer-owl.c
index ac97420bfa7c..fa347f430563 100644
--- a/drivers/clocksource/timer-owl.c
+++ b/drivers/clocksource/timer-owl.c
@@ -142,6 +142,7 @@ static int __init owl_timer_init(struct device_node *node)
 	}
 
 	rate = clk_get_rate(clk);
+	clk_put(clk);
 
 	owl_timer_reset(owl_clksrc_base);
 	owl_timer_set_enabled(owl_clksrc_base, true);
-- 
2.54.0


