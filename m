Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39933C77B7A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 21:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=87/6cHwCrWlOKd+RCLhOsgnsh7OHY+CuI1v3O1G72fs=; b=UZRUts9poJsLD+5Ty0MLpkCvcA
	aOS5qxdKp6lBm9D+JlXHU1An0k4LVTp+i55ypQv2lSarG/wLacizdHmtB1lsOrTR9Q56BLdVVA1CD
	8Yj0IWhUUj6IxTYdcRMUSqYSw0f1mlHxKD3+MSylIn0FcqLN+BB6eeuiijYxNZUUNDSTDyp0hIWX5
	Xjv2XiKuO5nYX8lq1ZXEvDd1y6MI63tx5L5fj/b0HtG7KYyLoCG1jkV+rqrT+m9+GHD5ic2EWmLeG
	5gqsDDIzFKT+cv49hNvRTW3yEHVLhngJNy9zBmpSzWabRw4MrlM4IrIDqXZnU8qGrHUAZHgOcTnTI
	GRKplipA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSMSW-0000000EGgC-41PY;
	Thu, 19 Jun 2025 21:06:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSImX-0000000DiOi-04XM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 17:10:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5FA5349BF0;
	Thu, 19 Jun 2025 17:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11CBEC4CEEA;
	Thu, 19 Jun 2025 17:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750353031;
	bh=1tM7lfGa2OX6upFSfSRNAvjF/6bzMIakzUVOukjfgp0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KjyYMQ1Be302kdviESang5cJb1yKX07PYqBpvNGpMtyiRA+F0DJVli2y2lUvUL1AJ
	 mg1uRLdqOSv9XpfshipGT4rCfCIKKYzL5EeAy5sB2WqeCHajR7KY+xtU6tmoZ+vW96
	 l6SqVsGDPti766CEhXkzPt9+f53H8EO2xWk0gElBGHTa/K8wY3JUSwWtrdDFhcqpLv
	 3vuwVXSG3MdhQR6VEWPLVTdi0+e2UMRP0rEoGoohU9MNWoZYoOI1U0bcGdP5u2G5Vs
	 YKvPjFQ50jcrAx1nwNOx5O1K5nTZ6HbDrfWpOtJimUAxZz592GYBq/rgRC8hnhCNUJ
	 ZerjfQ2poc2xg==
Received: by wens.tw (Postfix, from userid 1000)
	id 8E4075FF4F; Fri, 20 Jun 2025 01:10:28 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] clk: sunxi-ng: sun55i-a523-r-ccu: Add missing PPU0 reset
Date: Fri, 20 Jun 2025 01:10:25 +0800
Message-Id: <20250619171025.3359384-3-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619171025.3359384-1-wens@kernel.org>
References: <20250619171025.3359384-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_101033_077289_CB135030 
X-CRM114-Status: GOOD (  13.26  )
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

There is a PPU0 reset control bit in the same register as the PPU1
reset control. This missing reset control is for the PCK-600 unit
in the SoC. Manual tests show that the reset control indeed exists,
and if not configured, the system will hang when the PCK-600 registers
are accessed.

Add a reset entry for it at the end of the existing ones.

Fixes: 8cea339cfb81 ("clk: sunxi-ng: add support for the A523/T527 PRCM CCU")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
index b5464d8083c8..70ce0ca0cb7d 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
@@ -204,6 +204,7 @@ static struct ccu_reset_map sun55i_a523_r_ccu_resets[] = {
 	[RST_BUS_R_IR_RX]	= { 0x1cc, BIT(16) },
 	[RST_BUS_R_RTC]		= { 0x20c, BIT(16) },
 	[RST_BUS_R_CPUCFG]	= { 0x22c, BIT(16) },
+	[RST_BUS_R_PPU0]	= { 0x1ac, BIT(16) },
 };
 
 static const struct sunxi_ccu_desc sun55i_a523_r_ccu_desc = {
-- 
2.39.5


