Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82029C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 04:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q2FVziLi99mj2DM6fRhVdm0hGSzlFmznN0LCu/Ng4sM=; b=QDoLX42YWLXuFUFC/RRT9URrIr
	JTnSL2nN8xb+WF9/2utvNfJ+DW8daGw74SnoDqcxjSmmf0PqbhFVS0ogV6I4ogtcCPGyiKmfiOSk0
	bnOayXNGhuyEyxQ/g21Nv/ChK7Mkyhe5qnSrmIMYq+JXn/3JkK/UkApsybdlDVvY9kdLw9nWCMxMj
	MVes+fNOk/p4qsdABtAMBJt+QagykvmTbbHmsyFV0w1NoDanRtIE6fJ7nWZheiXY3J5yexKTaluYf
	I86vhKLU1im4wYCPH5iW1X0mJ0k1cCDoMWVD707SrjRit9BNKuBOMncph6Ix4QSf6qCRqO61n43oA
	qgwagJnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6gzY-00000008Hrg-2IIn;
	Wed, 16 Sep 2026 04:11:28 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6gzV-00000008Hr4-2FDG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 04:11:27 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 0666440B5A;
	Wed, 16 Sep 2026 14:11:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1789531865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=q2FVziLi99mj2DM6fRhVdm0hGSzlFmznN0LCu/Ng4sM=;
	b=EqCa6fzR/Io1SUSDQ/ZMiY8mmWM2ii6JKsM1YymRaueqOqqIfzzS/Qf/WjPuNe5YQOzPAO
	p+oV7khZqQeB0xh7MqJecOUKEdJT8x0bVW19uDeKeoiYzQY3WMhSWy5856lyzV603ANlz9
	C7XooV4ufKhBiRkhFamTF4/LkIfdKCkIrvyCX0acg1qDelFhKiZo+sxac/ZiGb+0KdtWnS
	Mv3qPsGrdwV8/td+2jc52rnHJWy78tN9PzTHVaO3grQfcyc6q+EaolLa2RtwBKoMne7P93
	CeVf6IGDLAskMq4zKF8r/AtQAkzGpTC/0/54eHfA9jsEDw/9h4NpV+QWQdu3GQ==
X-GPT-Reason: This is a legitimate technical communication. The
	content is a Linux kernel patch (indicated by the [PATCH] prefix
	and "git" diff format) regarding a driver fix for Allwinner hardware,
	which aligns with the professional/technical nature of the personal
	mailbox "alastair@d-silva.org". The From domain (d-silva.org)
	matches the sender's identity, there are no phishing red flags
	(no URLs, no urgency, no requests for credentials), and the message
	content is highly specific to systems programming.
From: Alastair D'Silva <alastair@d-silva.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Samuel Holland <samuel@sholland.org>,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH] clk: sunxi-ng: ccu_common: Replace ktime-dependent lock wait loop with udelay
Date: Wed, 16 Sep 2026 14:11:04 +1000
Message-ID: <20260916041104.239999-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_211125_726986_81F010A8 
X-CRM114-Status: GOOD (  14.16  )
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

The Allwinner sunxi-ng CCU driver uses readl_relaxed_poll_timeout() in
ccu_helper_wait_for_lock() to wait for PLLs to lock.

This poll macro relies on ktime_get() and the kernel timekeeping
infrastructure. During early boot or sensitive clock transitions
(such as CPUfreq DVFS scaling) where timer interrupts or timekeeping may
be suspended or unstable, ktime_get() fails to increment. This turns the
timeout calculation into an infinite busy-wait loop, causing RCU stalls
and system freezes if the PLL lock bit does not assert immediately.

Decouple the PLL lock wait loop from the timekeeping framework by replacing
readl_relaxed_poll_timeout() with an iteration loop using udelay(1) up to
100ms.

Assisted-by: LLM
Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---

Notes:
    Tested on Allwinner H618 (Mellow Fly-C5) and H616 boards in Armbian, resolving intermittent boot freezes and CPUfreq DVFS scaling lockups when timekeeping interrupts were suspended.

 drivers/clk/sunxi-ng/ccu_common.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_common.c b/drivers/clk/sunxi-ng/ccu_common.c
index 43d8eca6abee..00daedadb5c8 100644
--- a/drivers/clk/sunxi-ng/ccu_common.c
+++ b/drivers/clk/sunxi-ng/ccu_common.c
@@ -7,6 +7,7 @@
 
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
@@ -25,7 +26,7 @@ struct sunxi_ccu {
 void ccu_helper_wait_for_lock(struct ccu_common *common, u32 lock)
 {
 	void __iomem *addr;
-	u32 reg;
+	int i;
 
 	if (!lock)
 		return;
@@ -35,7 +36,14 @@ void ccu_helper_wait_for_lock(struct ccu_common *common, u32 lock)
 	else
 		addr = common->base + common->reg;
 
-	WARN_ON(readl_relaxed_poll_timeout(addr, reg, reg & lock, 100, 70000));
+	for (i = 0; i < 100000; i++) {
+		if (readl_relaxed(addr) & lock)
+			return;
+		udelay(1);
+	}
+
+	if (!(readl_relaxed(addr) & lock))
+		pr_warn("%s: clock lock timeout\n", clk_hw_get_name(&common->hw));
 }
 EXPORT_SYMBOL_NS_GPL(ccu_helper_wait_for_lock, "SUNXI_CCU");
 
-- 
2.53.0


