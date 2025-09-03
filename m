Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D269CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 00:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=spxf+m6hmj6GkcSXGRYgQHXTMFVpFi6llfHeiJs5G30=; b=m8mnssfyRjUPDNHxVRkb60hk7w
	TF97cr1IuczNkMghT8PG35emFQ7qvx+d08365JKTP7eyejErWqdKVLawbX5EIwZwSCabTUL82Thfi
	FN1b5okcmxvr3WGK/cAf8/evFoPEQIIjnxjwiogjRr0NZLEZ5iiN8g4lN2/o6HhD/P0oKeZl2BkL7
	qJWA2/KyDFyMILE+es6lW9IFYjf/W08M6xyp5rBgoZYGlRrRAKDdZsaqgQQyr+j89tSKRW+1h2rit
	jM/2aA3q5Bo3FO0SvkDjI4Y+XMAOSfw1Ao5IF0qnaq3vG+CQxb8CT8FPZfct0Ay5j1t9uJhi5pDhT
	/DctlYbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbes-00000002trt-0lwW;
	Wed, 03 Sep 2025 00:47:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utb4L-00000002iwP-2NLb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 00:09:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85081176A;
	Tue,  2 Sep 2025 17:09:36 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E3DB3F63F;
	Tue,  2 Sep 2025 17:09:43 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Mikhail Kalashnikov <iuncuim@gmail.com>
Subject: [PATCH 3/5] clk: sunxi-ng: mp: support clocks with just a shift register
Date: Wed,  3 Sep 2025 01:09:08 +0100
Message-ID: <20250903000910.4860-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250903000910.4860-1-andre.przywara@arm.com>
References: <20250903000910.4860-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_170945_641296_91931A32 
X-CRM114-Status: GOOD (  12.08  )
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

The "mp" clock models a mod clock with divider and a shift field. At
least one clock in the Allwinner A523 features just a power-of-2 divider
field, so support an initialisation of the clock without providing an
actual divider field.

Add a check whether the "width" field is 0, and skip the divider
handling in this case, as the GENMASK macro will not work with a zero
length.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/clk/sunxi-ng/ccu_mp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_mp.c b/drivers/clk/sunxi-ng/ccu_mp.c
index 354c981943b6f..a03dac294d048 100644
--- a/drivers/clk/sunxi-ng/ccu_mp.c
+++ b/drivers/clk/sunxi-ng/ccu_mp.c
@@ -236,9 +236,11 @@ static int ccu_mp_set_rate(struct clk_hw *hw, unsigned long rate,
 	spin_lock_irqsave(cmp->common.lock, flags);
 
 	reg = readl(cmp->common.base + cmp->common.reg);
-	reg &= ~GENMASK(cmp->m.width + cmp->m.shift - 1, cmp->m.shift);
+	if (cmp->m.width)
+		reg &= ~GENMASK(cmp->m.width + cmp->m.shift - 1, cmp->m.shift);
 	reg &= ~GENMASK(cmp->p.width + cmp->p.shift - 1, cmp->p.shift);
-	reg |= (m - cmp->m.offset) << cmp->m.shift;
+	if (cmp->m.width)
+		reg |= (m - cmp->m.offset) << cmp->m.shift;
 	if (shift)
 		reg |= ilog2(p) << cmp->p.shift;
 	else
-- 
2.46.3


