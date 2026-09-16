Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE334C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 04:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B7ZQplUXCXPwONkaQVfHCh08s+vTaBNTqiRwAN4FcQQ=; b=kxEBETS5v015IY8og2YwkuZqS+
	anuzgJQ+T6i84zo79J5GtAXBbW6gvu8YzpC4UNmgcK/DAFznNQR8naCMUly7/7eoEXw9U95T9Rq9+
	VHNX2jMqHK3tkay4QbRUm5BqI2+3oKNk6me6UVznLDU+qWD8DH1DN5gWELEvEXrjlpX7lcagd6Oz8
	gmpYocpFak+w4uXQiwkSg+wFy+yu13d+3vtxZxQgOCN6dW7HheRvYBtO633ATCSAJCxsIBSbKHBS5
	bEI5z33SQe2Rp0MbxxQy1QrfGZqPbf09E24FXwn/JrhuNkjNuEtn6LmIMg9q3lAane+YEy/tipQ2n
	pzvGIMVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hGx-00000008IdD-2Qqz;
	Wed, 16 Sep 2026 04:29:27 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hGo-00000008IcO-3Jgm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 04:29:26 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 9233140B5A;
	Wed, 16 Sep 2026 14:29:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1789532950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B7ZQplUXCXPwONkaQVfHCh08s+vTaBNTqiRwAN4FcQQ=;
	b=y8al5VmpWJe4/uIU+idvj4y1aBoH+2hm38evlDgPZzw+pIH0qwSBonzq0ihCBoGyEwsVOY
	pGQWOhwzy5H5RAwj6P0wi1iyo3+HZvxd1TsHsKQ2Xloaw6zI9v2R4sKm7oAD3UEFzUQWdj
	5/A2Tp+HNPcCMNj+A9TR9a8t4W+eF8kCTY2UpG0uL53TRYP5rHzE4n5bhcd+nU3het+jje
	LzuuM/Wno9w6IF3Xos+BXEx9/9H0IbR61A9DRA3JXG8aTRI55rAaAdAA+mbZO4AyKMxZk5
	eLJCshEyZkSdL0lLvjX3ObkOiURjjzErBTZd/otLzv3QN7wo45TPwr5lpcypBg==
X-GPT-Reason: legitimate; the email is a technical software patch
	submission (Linux kernel style) that perfectly aligns with the
	recipient's identity (alastair@d-silva.org), shows consistent sender
	identity (alastair@d-silva.org), and contains highly specific technical
	code diffs with no phishing indicators, urgency, or external links.
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
Subject: [PATCH v2] clk: sunxi-ng: ccu_common: Use readl_relaxed_poll_timeout_atomic for PLL lock
Date: Wed, 16 Sep 2026 14:29:10 +1000
Message-ID: <20260916042910.382744-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260916041104.239999-1-alastair@d-silva.org>
References: <20260916041104.239999-1-alastair@d-silva.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_212921_077468_54D9117C 
X-CRM114-Status: GOOD (  11.67  )
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

The Allwinner sunxi-ng CCU driver currently uses
readl_relaxed_poll_timeout() in ccu_helper_wait_for_lock() to wait for
PLLs to lock.

This non-atomic poll macro relies on ktime_get() and the kernel
timekeeping infrastructure. During early boot or sensitive clock
transitions (such as CPUfreq DVFS scaling) where timer interrupts or
timekeeping may be suspended or unstable, ktime_get() fails to advance.
This turns the timeout calculation into an infinite busy-wait loop,
causing RCU stalls and system freezes if the PLL lock bit does not
assert immediately.

Switch to readl_relaxed_poll_timeout_atomic(). This atomic variant relies
on udelay() rather than timekeeping, making it safe to execute even when
timekeeping is suspended or uninitialized.

Assisted-by: LLM
Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---

Notes:
    v2:
    - Replace custom udelay loop with readl_relaxed_poll_timeout_atomic()
      as suggested by review.
    
    Tested on Allwinner H618 (Mellow Fly-C5) and H616 boards in Armbian, resolving intermittent boot freezes and CPUfreq DVFS scaling lockups when timekeeping interrupts were suspended.

 drivers/clk/sunxi-ng/ccu_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu_common.c b/drivers/clk/sunxi-ng/ccu_common.c
index 43d8eca6abee..248e58c9562d 100644
--- a/drivers/clk/sunxi-ng/ccu_common.c
+++ b/drivers/clk/sunxi-ng/ccu_common.c
@@ -35,7 +35,7 @@ void ccu_helper_wait_for_lock(struct ccu_common *common, u32 lock)
 	else
 		addr = common->base + common->reg;
 
-	WARN_ON(readl_relaxed_poll_timeout(addr, reg, reg & lock, 100, 70000));
+	WARN_ON(readl_relaxed_poll_timeout_atomic(addr, reg, reg & lock, 100, 70000));
 }
 EXPORT_SYMBOL_NS_GPL(ccu_helper_wait_for_lock, "SUNXI_CCU");
 
-- 
2.53.0


