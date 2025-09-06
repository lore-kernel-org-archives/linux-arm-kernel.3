Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40C2CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 04:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FXrk3maW/kVjpHXzMbzrhVPMUli2gn2TlRN4WQMNS40=; b=I3tH5KLhENnQL0U/2Rocu6af4M
	YgcsA+/cYwm2TwGnIbPTjCFJR98sF79jwhquc5gW1PfeyKyuJ+JFweRcLjOgS5heY+gtFCVOmehho
	bNZ6N785xRxYugS/KJUqDPQEbkeZFJsmNUIkwMeSBNS4s6v3SKut9o41UkfN+sRFm9nhFGZqPD6pf
	N3IZADdlEoi9/gxMKaN+P+0ZVxHEXvlh6exk4YDNUhlOpB5j718EjlqRLgnSx75rycrAPm8H4IGWc
	YZvoWREyXF7qdG9vLMiz/1WDvJOc1FXCs5IKMR/Tr6F8chligE2dKlEN8ILZO+xc11qmn9sQz22Ti
	Giz0cSzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uukUF-00000006ZcN-3Lwn;
	Sat, 06 Sep 2025 04:25:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uukJ5-00000006W34-3WgK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 04:13:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3FA3C45073;
	Sat,  6 Sep 2025 04:13:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6F5C4CEFA;
	Sat,  6 Sep 2025 04:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757132022;
	bh=e0tQSO9pJI2jVvlvL9W4OBbAj83puHTjG+o0KV+3bdg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EGOCCKyvtKQUB2Yp7JXOHuMuYZTKhFou+gUmvaZSudPcnsXWZbxp+Ak58iQAVKgKY
	 gEYGre0Qtmg2KCOk6IpzBSiGSHy8zltK8m+VEf/e+22/0BXy4/IWWwu5XY5JQwNXpq
	 F/TaPGQS5uFbXVqzfip1eyjKEZIwE/PsS1Vu+7+0iHOE9/um5naRykJK2bWoscQgNk
	 PBp1RWgqH3QrFCgXX6qaqu4E0EFMh2KxzbWYWN4PUuAFtYzBrifpq7tIj1tl5lQcR3
	 T0i2DRm5W/x9oKLgQReyU2clkAzCdJJ+I8I0GNpjcMZTbg1+/NXf8RfGozg4r4B0KW
	 fK1sFc4mp0xvA==
Received: by wens.tw (Postfix, from userid 1000)
	id B6DFC5FE60; Sat, 06 Sep 2025 12:13:38 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH net-next v3 03/10] soc: sunxi: sram: add entry for a523
Date: Sat,  6 Sep 2025 12:13:26 +0800
Message-Id: <20250906041333.642483-4-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250906041333.642483-1-wens@kernel.org>
References: <20250906041333.642483-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_211343_902203_B2D3F6D5 
X-CRM114-Status: GOOD (  12.03  )
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

The A523 has two Ethernet controllers. So in the system controller
address space, there are two registers for Ethernet clock delays,
one for each controller.

Add a new entry for the A523 system controller that allows access to
the second register.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/soc/sunxi/sunxi_sram.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
index 08e264ea0697..4f8d510b7e1e 100644
--- a/drivers/soc/sunxi/sunxi_sram.c
+++ b/drivers/soc/sunxi/sunxi_sram.c
@@ -320,6 +320,10 @@ static const struct sunxi_sramc_variant sun50i_h616_sramc_variant = {
 	.has_ths_offset = true,
 };
 
+static const struct sunxi_sramc_variant sun55i_a523_sramc_variant = {
+	.num_emac_clocks = 2,
+};
+
 #define SUNXI_SRAM_THS_OFFSET_REG	0x0
 #define SUNXI_SRAM_EMAC_CLOCK_REG	0x30
 #define SUNXI_SYS_LDO_CTRL_REG		0x150
@@ -440,6 +444,10 @@ static const struct of_device_id sunxi_sram_dt_match[] = {
 		.compatible = "allwinner,sun50i-h616-system-control",
 		.data = &sun50i_h616_sramc_variant,
 	},
+	{
+		.compatible = "allwinner,sun55i-a523-system-control",
+		.data = &sun55i_a523_sramc_variant,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, sunxi_sram_dt_match);
-- 
2.39.5


