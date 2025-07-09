Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63E4C83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 19:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RMiENT7nzxfoafiX1IT5aN+t/mOi7FUDDhH/7DvLxK8=; b=IiMQSrW9qYqUkzuaBlZmxLBuJs
	ilola4H0eOROzw3JlXzINl4M/SWKAQdTyT55b30zGBEHVARTzop6PL1S0VN8MILQq0X+xfl9H+R/n
	egxZC72VekNRyPndbcnM+P+jnpPMvlm2bWXPh98s4l6td2lyMAHa8xekrnBwso08i0Hd7e4dv6lyf
	q1r40rf5avQRY9dcmDYtUjM8BWEM1c8LtwDDRRbG38gIYKj2T5wwofQvgQY1qyWvy7cZ6YrPHqWej
	x7knKda7cT8jDu/zx9Wtvj/dVX8rF08IfLxowWfbvKgO6t3dQO3XDE6ndIshC7XP57X4yBPN5Caxs
	XF1DvXCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZaJp-00000009hbN-48OK;
	Wed, 09 Jul 2025 19:19:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZX7D-00000009Di2-31pi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 15:53:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 14B6B45A62;
	Wed,  9 Jul 2025 15:53:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76020C4CEF7;
	Wed,  9 Jul 2025 15:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752076426;
	bh=X99T3zLCk1wsD+6/htrl/rppok06x79Qi4swnOe3K4Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B7bStvu8t/kBb0l6jYfh1H4MhIj4m+VKvH59Cgt5NpcMySeqHuEHNUsjIDTQ/6/eO
	 OBiy4OlUkXuppnsUJIrZ+CR5X4V0xpSRZoHAKbfymEf/QCuW9noULXNbEno6Lh6jFx
	 tWImZVdEFIhSYrIiFfFhlmCfe1lco0zkq6jKnslV8YDumiRFtPTs3sFCaxY7BO4+oW
	 Lzawg78qkX4bdxWPQ78xKptMeD9rFAo6poIpRI+7OmAJ/2gnFJdOIvGYWG7g383vLQ
	 vYXMQJK2Ty2TbSR34g86HxuKp2tP21aepI7CyvgFhRe3fncoSfrkLQqC7AZMzUZ8xk
	 yCfUwf89AnpHA==
Received: by wens.tw (Postfix, from userid 1000)
	id 3E1A35FE8C; Wed,  9 Jul 2025 23:53:44 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v2 2/4] pmdomain: sunxi: sun20i-ppu: add A523 support
Date: Wed,  9 Jul 2025 23:53:41 +0800
Message-Id: <20250709155343.3765227-3-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250709155343.3765227-1-wens@kernel.org>
References: <20250709155343.3765227-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_085347_778005_1B7C72E1 
X-CRM114-Status: GOOD (  11.76  )
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

A523 has a PPU like the one in the Allwinner D1 SoC.

Add a compatible entry and a list of power domain names for it.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/pmdomain/sunxi/sun20i-ppu.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/pmdomain/sunxi/sun20i-ppu.c b/drivers/pmdomain/sunxi/sun20i-ppu.c
index 9f002748d224..b65876a68cc1 100644
--- a/drivers/pmdomain/sunxi/sun20i-ppu.c
+++ b/drivers/pmdomain/sunxi/sun20i-ppu.c
@@ -193,6 +193,19 @@ static const struct sun20i_ppu_desc sun8i_v853_ppu_desc = {
 	.num_domains	= ARRAY_SIZE(sun8i_v853_ppu_pd_names),
 };
 
+static const char *const sun55i_a523_ppu_pd_names[] = {
+	"DSP",
+	"NPU",
+	"AUDIO",
+	"SRAM",
+	"RISCV",
+};
+
+static const struct sun20i_ppu_desc sun55i_a523_ppu_desc = {
+	.names		= sun55i_a523_ppu_pd_names,
+	.num_domains	= ARRAY_SIZE(sun55i_a523_ppu_pd_names),
+};
+
 static const struct of_device_id sun20i_ppu_of_match[] = {
 	{
 		.compatible	= "allwinner,sun20i-d1-ppu",
@@ -202,6 +215,10 @@ static const struct of_device_id sun20i_ppu_of_match[] = {
 		.compatible	= "allwinner,sun8i-v853-ppu",
 		.data		= &sun8i_v853_ppu_desc,
 	},
+	{
+		.compatible	= "allwinner,sun55i-a523-ppu",
+		.data		= &sun55i_a523_ppu_desc,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun20i_ppu_of_match);
-- 
2.39.5


