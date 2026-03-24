Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26D3F54AD9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 16:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/CfW0FWDhAXagmceSDgxo1Wgv6keDcQtw2SgJ61xoSE=; b=bEQ7CDoGIO2FveVjoFSSGey6Rg
	IqxmFp1uviR+tjQ5EplJNd6asKK+/+zlZa2rM5c4Hgga9qAxGXhbCaWlLbGHiPU/eOKjD/1WUGC8p
	4D/xb9k9GU0BQ0g2bb2/GwrHhPjBYR70zX19qbMh0oZ8WhqKOCqANEAYwoFWTdjrU17EQp4R8d0XZ
	drsbIBV3gmxZ2q+nbc95kzbcPHUoXxBTO0qVaatfl2HD+GO/dZpEL9/gwOg/plyIDJsjK3/4SG/Du
	CSkn5VEWIWCs1HywRYmBWzO6D5l+5cyymQepGKBAt1K0L14YMWduI/BR4Pn9xyDGM2546SX62BP6l
	PQj5VX/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54rb-00000001uWs-2qDH;
	Tue, 24 Mar 2026 16:44:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54rN-00000001uNp-1kju
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 16:44:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 251664454C;
	Tue, 24 Mar 2026 16:44:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D55AAC2BC9E;
	Tue, 24 Mar 2026 16:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774370645;
	bh=QYFXFUR/8WwRSwrV3QqrRDABUI+S+t3w7aA/W4XCZ70=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=trMKu6dhD9+hUG8hyWqzyKsWtEjf8n4BKqDA5IXDjOt3J3V4NLJOdBbOavv9Ta7J2
	 5vtjU80y72ml+oAes8iOCC/QmiN5hvLumBE6ixJROD+Lapsurrrf48s83cRgZ/kReb
	 SuaWQDtpVT//zX/TNFffVfZNkKrujd3jsQo34CsMUvA6aZpFaIsKTS+DEFa+tCBj2D
	 4RoRIZgT3Zekvxuvv96wX1Gjvgk9Oj5paQvB8Btm/yYmKxwX15VdybgaoMVpDC6A9L
	 7npZKoOJPuDa67EAevfO1TbQgGWGResDtaqq1U+l/5ZD7+Atb0RnPFolase33cFNT/
	 NREQu9xJFR6CQ==
Received: by wens.tw (Postfix, from userid 1000)
	id E6C8A60003; Wed, 25 Mar 2026 00:44:00 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] soc: sunxi: sram: Add H616 SRAM regions
Date: Wed, 25 Mar 2026 00:43:54 +0800
Message-ID: <20260324164357.1607247-7-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260324164357.1607247-1-wens@kernel.org>
References: <20260324164357.1607247-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_094405_479964_12CB428D 
X-CRM114-Status: GOOD (  14.40  )
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

The Allwinner H616 has two switchable peripheral SRAM regions:

- The VE SRAM is a 2 MB dedicated SRAM for the Video Engine. CPU access
  to this region is enabled by default. CPU access can be disabled,
  after which reads will show the same stale value for all addresses,
  while writes are ignored.

  The mux value for this region is different from previous generations.

- The SRAM C region is an alias of the first 128 KB of VE SRAM, plus 64
  KB of DE SRAM. The latter is otherwise unaccessible from the CPU. When
  CPU access is disabled, the whole region reads as zero, while writes
  are ignored.

  The mux value for this region is the same as on the A64 and H6.

Add data for the VE SRAM. The register values were taken from the BSP
vendor kernel.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 drivers/soc/sunxi/sunxi_sram.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
index 4d81897179e7..2ccaeacf8c70 100644
--- a/drivers/soc/sunxi/sunxi_sram.c
+++ b/drivers/soc/sunxi/sunxi_sram.c
@@ -83,6 +83,12 @@ static struct sunxi_sram_desc sun50i_a64_sram_c = {
 				  SUNXI_SRAM_MAP(0, 1, "de2")),
 };
 
+static struct sunxi_sram_desc sun50i_h616_ve_sram = {
+	.data	= SUNXI_SRAM_DATA("VE", 0x0, 0, 1,
+				  SUNXI_SRAM_MAP(1, 0, "cpu"),
+				  SUNXI_SRAM_MAP(0, 1, "ve")),
+};
+
 static const struct of_device_id sunxi_sram_dt_ids[] = {
 	{
 		.compatible	= "allwinner,sun4i-a10-sram-a3-a4",
@@ -100,6 +106,10 @@ static const struct of_device_id sunxi_sram_dt_ids[] = {
 		.compatible	= "allwinner,sun50i-a64-sram-c",
 		.data		= &sun50i_a64_sram_c.data,
 	},
+	{
+		.compatible	= "allwinner,sun50i-h616-ve-sram",
+		.data		= &sun50i_h616_ve_sram.data,
+	},
 	{}
 };
 
-- 
2.47.3


