Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63309CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 14:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YWsW2VfyEJQgFcPaUmJum4rgegkVeuw1RsgpxbW8cFA=; b=Z48/fpT1o3idRYbNdExIZdH0Gw
	jcgrC9axWuLMkREyYK8MuNSF3SGp+W+RzIRb2Qe+8F90Cn0mhZ0T/PPU434x5RzTZcZNb2xy/I22l
	tNy7nCxEostSGkyLHj6DlLYowY3Y/Ky0YVX0SuYTgbxU1y1JH0bw9NWKd1cIYeqNNcdyvufbQPH77
	Nw1uNOCLquLQn2zDUulYbn7pHKWcxDCFY6ifYl7x5Ef9W13WTLm5ipyGy21kDJFz7XGQ4NGyl6E43
	J3eoGPu1b5Za++A7mydzfAsAJvNS50OH/SIlZSiaCKhgFhX2CEayJKOBsl6dTNqdxe5q8IX6ke5VX
	bgT1mehQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAKC-00000004jRv-2kns;
	Mon, 15 Sep 2025 14:37:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAK7-00000004jO8-1b8u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 14:36:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 04F43443F2;
	Mon, 15 Sep 2025 14:36:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9839CC4CEFB;
	Mon, 15 Sep 2025 14:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757947014;
	bh=DC9uy+dVdl3WE0T3/WYt5Rj+8+1fLNzMGLUJt/1fWFE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZN2e6kb83a8RLhtHiGG11XNIk+RikQBnovHZSe/LBKI7GxxMjokxx21qsamISZjbz
	 y8KiZoJmLPujUBrfyvZENQgd9Wj7anvwB7KTU79GAZt59bhzhSD3nS8Ql6CplWFvdK
	 DO4uWDOtkLejOkBARy+WPRrgdmENTnwAjjZegilKjzUVqtLD7sdgYVldzADSUNkP0R
	 V+LRQl6+jlRXCPInsMkUGfM07/0DPEYSbfbcgUcnwsEYT3lOz7QEX/yV3gaSE2OQfw
	 1EnFieg0pvTk8tmphZh6B4qiAjEAF3RgCKcfNuEX5iv6M0Vas8KYYewZcS1mrCqE02
	 3cig+ofLrp55w==
From: Michael Walle <mwalle@kernel.org>
To: Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Andrew Davis <afd@ti.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH 2/3] clk: keystone: don't cache clock rate
Date: Mon, 15 Sep 2025 16:34:39 +0200
Message-Id: <20250915143440.2362812-3-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250915143440.2362812-1-mwalle@kernel.org>
References: <20250915143440.2362812-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_073655_443865_B20DA11C 
X-CRM114-Status: GOOD (  19.61  )
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

The TISCI firmware will return 0 if the clock or consumer is not
enabled although there is a stored value in the firmware. IOW a call to
set rate will work but at get rate will always return 0 if the clock is
disabled.
The clk framework will try to cache the clock rate when it's requested
by a consumer. If the clock or consumer is not enabled at that point,
the cached value is 0, which is wrong. Thus, disable the cache
altogether.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
I guess to make it work correctly with the caching of the linux
subsystem a new flag to query the real clock rate is needed. That
way, one could also query the default value without having to turn
the clock and consumer on first. That can be retrofitted later and
the driver could query the firmware capabilities.

Regarding a Fixes: tag. I didn't include one because it might have a
slight performance impact because the firmware has to be queried
every time now and it doesn't have been a problem for now. OTOH I've
enabled tracing during boot and there were just a handful
clock_{get/set}_rate() calls.
---
 drivers/clk/keystone/sci-clk.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
index c5894fc9395e..d73858b5ca7a 100644
--- a/drivers/clk/keystone/sci-clk.c
+++ b/drivers/clk/keystone/sci-clk.c
@@ -333,6 +333,14 @@ static int _sci_clk_build(struct sci_clk_provider *provider,
 
 	init.ops = &sci_clk_ops;
 	init.num_parents = sci_clk->num_parents;
+
+	/*
+	 * A clock rate query to the SCI firmware will return 0 if either the
+	 * clock itself is disabled or the attached device/consumer is disabled.
+	 * This makes it inherently unsuitable for the caching of the clk
+	 * framework.
+	 */
+	init.flags = CLK_GET_RATE_NOCACHE;
 	sci_clk->hw.init = &init;
 
 	ret = devm_clk_hw_register(provider->dev, &sci_clk->hw);
-- 
2.39.5


