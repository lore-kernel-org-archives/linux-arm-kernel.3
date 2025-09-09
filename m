Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E49CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 18:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GOtrPjNRQo7TlyFOJryh3OG2eZVB/qy4jyPK2bjIE0U=; b=Q5B71pJyLK/n3nq43z1QhCo2tZ
	wxXpdVzngsomyI5Qdc2cUpEVYxsYZFdzNdpYCGAAsmHPnaTzrjBNhaZfdmkavPnD/p+kzgVdEWzlw
	lYWBkByejnANl6i+GHkqi7+QLVZ4RmGejOftnDWg3vo9DLCnneOJB+5UAb23OB2bzgPQfonyPENIT
	VWH0bf+n2wPjv0n1zXfupBr7AMu6FcEBGwhi6Y7SdiIWu/DUoyhtDSI+LXDEozX1GLe//adI2dwg0
	Yo/+hG8nVUcU4hvMj3BqTD01HUZ/NdlAOQECtpl+AQ4JLpY9KPsjXriYT0d2UvgcmlR+kHxMqW5qN
	oH4vN6/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw30Z-00000009OcT-0Nb0;
	Tue, 09 Sep 2025 18:23:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw30X-00000009Oah-02Q8
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Sep 2025 18:23:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=GOtrPjNRQo7TlyFOJryh3OG2eZVB/qy4jyPK2bjIE0U=; b=YUp2qIwHauquxFI6o1rcgSWxP0
	AG9CCgPgByvtmEb71g0c31P5kpGuyOQIcbJ5kDrrJDlNN0iJdsiWC90oka2qesnfCUUlMhaKRcCYQ
	h/4A6FRhfZSth9wtGnrP8XfsVyoF6sf6ER9LkebI/zWQv0yatZgTNBqQcQaJgjtoYOTm8IHTDSKG4
	FlUUjv2WtQEg0kWM8fJ/CzUBVZCGYngn9X9vVoVUZkmpBHNEDMSFSGRn+BbmWAsJIhibVu5+TzmAP
	2jeIRw9/MlycXYCMSZrPcCSfOZgvn4IpEkc/KZa4FVZGQZOGwxAH+mI215K1Lt1/qRqph3WZ15ofY
	2qm0aeXA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1qt-00000005S6o-3oFV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 17:09:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DE16D43364;
	Tue,  9 Sep 2025 17:09:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E981C4CEF4;
	Tue,  9 Sep 2025 17:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757437791;
	bh=mTZCk0YysupG4SdzVgITyMExGpzb1FzxUWWrQIt6Ems=;
	h=From:To:Cc:Subject:Date:From;
	b=fLqacjB/h0fG+akp9RST3Ff6Luym6SCgdiy7wjkfyuN98O3vrwCZaW/rLjH6rRvb8
	 ywSA+nWhQxsDkO1BVXDOVGeCncv2id+7aGjJZ3/KY6TL0ODioV8UtraKBpYaF8kmpO
	 0pezqDLCZxc3w4tr/38lhzD7PY5JjaZ2Q529Wa7V5NKUg8p1iz9nkCy+HW87GhHKhu
	 4F1kJCSHuLj+AeUcoq4qdQ9hC4KCvDfxT5UjeTEObe6V0Y6QtJi9I7SK3pjEYt1Pq/
	 ogn08k779XKvwra9EKgWjcnXnJs+3dVZhIa/LOAKm5+p4AEiKS0pGd919l0a0Byqs6
	 pRRlDd+6yNnCg==
Received: by wens.tw (Postfix, from userid 1000)
	id 8146B5FD80; Wed, 10 Sep 2025 01:09:48 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: sunxi-ng: sun6i-rtc: Add A523 specifics
Date: Wed, 10 Sep 2025 01:09:47 +0800
Message-Id: <20250909170947.2221611-1-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_180956_201556_E387FE0A 
X-CRM114-Status: GOOD (  13.03  )
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

The A523's RTC block is backward compatible with the R329's, but it also
has a calibration function for its internal oscillator, which would
allow it to provide a clock rate closer to the desired 32.768 KHz. This
is useful on the Radxa Cubie A5E, which does not have an external 32.768
KHz crystal.

Add new compatible-specific data for it.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
index 0536e880b80f..f6bfeba009e8 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -325,6 +325,13 @@ static const struct sun6i_rtc_match_data sun50i_r329_rtc_ccu_data = {
 	.osc32k_fanout_nparents	= ARRAY_SIZE(sun50i_r329_osc32k_fanout_parents),
 };
 
+static const struct sun6i_rtc_match_data sun55i_a523_rtc_ccu_data = {
+	.have_ext_osc32k	= true,
+	.have_iosc_calibration	= true,
+	.osc32k_fanout_parents	= sun50i_r329_osc32k_fanout_parents,
+	.osc32k_fanout_nparents	= ARRAY_SIZE(sun50i_r329_osc32k_fanout_parents),
+};
+
 static const struct of_device_id sun6i_rtc_ccu_match[] = {
 	{
 		.compatible	= "allwinner,sun50i-h616-rtc",
@@ -334,6 +341,10 @@ static const struct of_device_id sun6i_rtc_ccu_match[] = {
 		.compatible	= "allwinner,sun50i-r329-rtc",
 		.data		= &sun50i_r329_rtc_ccu_data,
 	},
+	{
+		.compatible	= "allwinner,sun55i-a523-rtc",
+		.data		= &sun55i_a523_rtc_ccu_data,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, sun6i_rtc_ccu_match);
-- 
2.39.5


