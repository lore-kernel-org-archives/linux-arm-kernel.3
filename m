Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB157CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 17:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qY5y/HdkrOraZtssGmgA3rjNKre8srjDh5rTeec1KZ8=; b=Q/a0BGLUYEDIYeoMj1a1g1OcWb
	PAHySS8gUn5FL9vaxTPUMMB/6dwN7n7RpPxlvA4GFUboCNHzj+9a8rHjhwJvYEoyE6YmnLTPqRjDg
	wy9nhMhjrm0ZgoW+zAVL6DnYQgqcT0wkDccpKRdyv4ndMS8IbS3YGdxO8p1AW09G3epIOHanJm8q5
	89Yhq7EsjsAbXBhJkztWWhOYiRZGoW0nHwkwbRsQL13wb/6ykb3SUQRxwTeJwLFGkbHtacITuTbZU
	5fTx/KosOwllvtGAGfEyTv1OPfteYSinDs/kKJkfwBcJ/kCSho7ZVejIY14/wawhiNnZM9pdIuFdo
	ldefwVzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usPPo-00000008Equ-3w2U;
	Sat, 30 Aug 2025 17:31:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usP4q-00000008CUM-3UwP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 17:09:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C3A1448AD;
	Sat, 30 Aug 2025 17:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE33C4CEF8;
	Sat, 30 Aug 2025 17:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756573759;
	bh=5a6AXZ9/TQJt7kA1cVIkch5wEdFuJBLXnhAS02YEYgA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ow9x2nSICfTEAI30gtt2nKSajoSKBK5H5SZ3GptNsb6EHxzDAUoltjLG08m4OIkUa
	 dt0MBFONHJxNYlJ0WW/KfuljhDlt+TtVGLYrTIRziCAOa8I4PzITRNTh1xQzUW1ozv
	 m72l7hSS7KRHBpeRq6Xx1lR/j4NQMnC0nX+ODD9WSssbDCDwz9LUiKDnTWIu1sTePA
	 wMTlEMAsHKod0zVP2SvruxdzuGGIYfWSKs9Rr+C8G0MhYDMq6ZU0YUb6Xkd7BLvPVf
	 ao0otQvDv6PUUyDIOxLjAU9FDzHOB6wPergBEDDxWL1DX1HBnKXNahS8JIpZk+g5Zl
	 0e3dS9SEkhYdQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 5604D5FE30; Sun, 31 Aug 2025 01:09:17 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] clk: sunxi-ng: mp: Fix dual-divider clock rate readback
Date: Sun, 31 Aug 2025 01:08:56 +0800
Message-Id: <20250830170901.1996227-4-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250830170901.1996227-1-wens@kernel.org>
References: <20250830170901.1996227-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_100920_938169_D277101F 
X-CRM114-Status: GOOD (  12.18  )
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

From: Chen-Yu Tsai <wens@csie.org>

When dual-divider clock support was introduced, the P divider offset was
left out of the .recalc_rate readback function. This causes the clock
rate to become bogus or even zero (possibly due to the P divider being
1, leading to a divide-by-zero).

Fix this by incorporating the P divider offset into the calculation.

Fixes: 45717804b75e ("clk: sunxi-ng: mp: introduce dual-divider clock")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/clk/sunxi-ng/ccu_mp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu_mp.c b/drivers/clk/sunxi-ng/ccu_mp.c
index 354c981943b6..4221b1888b38 100644
--- a/drivers/clk/sunxi-ng/ccu_mp.c
+++ b/drivers/clk/sunxi-ng/ccu_mp.c
@@ -185,7 +185,7 @@ static unsigned long ccu_mp_recalc_rate(struct clk_hw *hw,
 	p &= (1 << cmp->p.width) - 1;
 
 	if (cmp->common.features & CCU_FEATURE_DUAL_DIV)
-		rate = (parent_rate / p) / m;
+		rate = (parent_rate / (p + cmp->p.offset)) / m;
 	else
 		rate = (parent_rate >> p) / m;
 
-- 
2.39.5


