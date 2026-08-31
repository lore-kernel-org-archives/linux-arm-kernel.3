Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7ECC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 13:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KbRkYwnQi8E0M8Q6TBJ0YGyVB5OutSqWDHxS8ant4AU=; b=WWpE0ZNfrtWCQ+KxWm08KWCfpH
	5hQ9wlmOp20cMgboZljP9+UY1F+mEhliTvLrSQRNOXl/hQ2gem3wZDlcE/oGf7+yYbvWaM9xwhBoE
	v12XoKm177e1KYY07+8j8BU7FjVfSX+M2CaFJjKORrdfHtHCnEAv1rzxGCbk0OJCG0y6oLveaPRK7
	WDhBzlrTrOJygjkLocE1TEyiWhzgljfQK3KRTD1bEqVff5+N6rGF6w1Mb7BLUJ+mJOOdioRxwhVvB
	HmPbdsD9lVILHtVxpWPMLLVlvPArkc+zR7Ed/OyKDqcS/5IPwzr3q+T1Sk7ciCzCqlLYyb97z/7w+
	7g3pLPnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1295-00000009QFt-3urO;
	Mon, 31 Aug 2026 13:33:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1295-00000009QFN-1s4D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 13:33:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 36EE74009D;
	Mon, 31 Aug 2026 13:33:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 841E71F00A3D;
	Mon, 31 Aug 2026 13:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788183235;
	bh=KbRkYwnQi8E0M8Q6TBJ0YGyVB5OutSqWDHxS8ant4AU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jgRck4luXYMSp+/6mh5I9lj1BpHNklP5EpFTF3f6GYBCH4ypL0cPqCkqQ1LLjIQTY
	 U3VuytCTZSkdv8khnfFn+IYcOhSaemVJRpx3iuG6eOn2HlH0n+hZsDNizqOyY5c3m6
	 ks/1yU1yvSsDQtv4wk4ovGH1m2Wh5/QkumOsJXPRBWIkeliqfey14+3gCa9URummvf
	 4bkwWaG1clQ/qu5udMQpLng5V3UfSuapNQ7eMFkyF0gkCuznjd1a2XCnPMKVh2nJhc
	 4/Xa+b2xCIaumokWL23JcSymnXwTB9BT6Ei4tzNu0OxWUSelV8hhZfclF5G9SXoD+D
	 c8uQXAXM9H1fQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Michael Walle <mwalle@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Randolph Sapp <rs@ti.com>,
	Nishanth Menon <nm@ti.com>,
	Antonios Christidis <a-christidis@ti.com>,
	Brian Masney <bmasney@redhat.com>,
	Sasha Levin <sashal@kernel.org>,
	kristo@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH AUTOSEL 6.18-5.10] clk: keystone: don't cache clock rate
Date: Mon, 31 Aug 2026 09:20:54 -0400
Message-ID: <20260831133314.4125787-26-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831133314.4125787-1-sashal@kernel.org>
References: <20260831133314.4125787-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18.48
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Michael Walle <mwalle@kernel.org>

[ Upstream commit a80b32a140c8612bbaed27009c383d43304db6d5 ]

The TISCI firmware will return 0 if the clock or consumer is not
enabled although there is a stored value in the firmware. IOW a call to
set rate will work but at get rate will always return 0 if the clock is
disabled.
The clk framework will try to cache the clock rate when it's requested
by a consumer. If the clock or consumer is not enabled at that point,
the cached value is 0, which is wrong. Thus, disable the cache
altogether.

Signed-off-by: Michael Walle <mwalle@kernel.org>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Reviewed-by: Randolph Sapp <rs@ti.com>
Reviewed-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Antonios Christidis <a-christidis@ti.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
Link: https://patch.msgid.link/20260507-clk-sci-v2-1-38f59b48777a@ti.com
Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

The background checks finished:

- **Commit presence:** `a80b32a140c86` is **not** in the local 6.18.44
  tree (as expected from the analysis).
- **Related GPU commits:** No separate `drm/imagination` clock-control
  fix turned up on mainline — the `sci-clk` NOCACHE change is the
  standalone fix from the J722S GPU bring-up work.

The earlier analysis stands: **YES** for backport to this tree.

 drivers/clk/keystone/sci-clk.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
index a4b42811de55d..066823458a75c 100644
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
2.53.0


