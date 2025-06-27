Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07B5C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 16:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PfcmGYiLWWoDpHQnjhp3H8U3n4V3FFE8KVAaszA9K/8=; b=czJyQjBOg7wmlq7iUs3mFmiFZa
	XU//kQKDVOO7i52RGAF/hZLAMgNN1R1ShXE4R25vNIeFxkYlQGAeNZCvFuBlIGIoT635LrLmSwycV
	LFFplVCfEcBmpk59dRv1Fc5f/2URS98iZq1cG+3b1sjAwHrUW8gKHmmrngiChJt0ScV6qBrDawNYg
	1DUT7P/YU8ANBSfK0ufrnV+5TnR+l88vY5OvVWLhLEbCQfp0mhdlnIo95Dtf/2TOXLdVgFRDDQf5p
	tG8glp9TP7QhNNlMuO5sBRxuDUIWKs5Eg8kbQkkUSKJ70vU7QNyn6nc842khYM1WhpLOOmAzlhEav
	vtd49/lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBeu-0000000FDhC-2TAI;
	Fri, 27 Jun 2025 16:10:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVB18-0000000F6de-3iy9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 15:29:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2850B5C6CBF;
	Fri, 27 Jun 2025 15:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A848BC4CEF1;
	Fri, 27 Jun 2025 15:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751038169;
	bh=HqUKn0G06bLQgn9/7br5JqwZjyala+dj86Idxb210+E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q4JdDqPNgf+N/qPpe13/rDdggJ7X82WQoNvBLavdF/iOvGPAzdTEXe0IhAKQMCmVA
	 Ln3U/mI1h5dDSxMLGDaoMxOR6qv0X8JSUXPmXWY/0bVYSj8hL96ZBFf/ySh9hu8mSu
	 XwOC6BPRQj2ZTVFU8TQ4lqTyc0QyOsUUZ7AL7Lv8pwqlLHseQX69T53OrFSSSitvlx
	 HTHN+6ud0sjimLb+vYovqDfvn1dqHYC52gCGsyDkfTHfTaqUe1uRnuBjjXaoogoF9J
	 yfstODLz/pwRxXt4iOBMpRYRmQIGadAYgZ/jS/G4I5DBJc8/g24KrZBqZq/xcWLMfI
	 Ja1KkTT7T5l4A==
Received: by wens.tw (Postfix, from userid 1000)
	id 32F395FF77; Fri, 27 Jun 2025 23:29:27 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 2/4] pmdomain: sunxi: sun20i-ppu: add A523 support
Date: Fri, 27 Jun 2025 23:29:16 +0800
Message-Id: <20250627152918.2606728-3-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250627152918.2606728-1-wens@kernel.org>
References: <20250627152918.2606728-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_082930_972991_C1EA4F33 
X-CRM114-Status: GOOD (  12.11  )
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


