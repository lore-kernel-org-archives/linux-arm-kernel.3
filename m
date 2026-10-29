Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE6A606A322
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 13:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P5CfteaK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Edmcko11Xp6DEFFN8DrNllqPF61F7sdGOgmwg2xTmCQ=; b=P5CfteaKEx/+6J
	i8OKfEWgh0d7eNjqNNd9ANHvUFOlZgYpKdY5cnGAlA4XuIytT+fC5sEa4IBOvUdldXGtHOXVX2ycn
	4xNqGjymwqeqX1UUYrF059wMRPoRFJ9H8MQCAGcdUzTYY30jy5iPWZr99zJpGQeOG0vvQDNN1M4Ix
	pmhicoED65/VJxOAeggPBYMyA4CFPP/rM9KSv4C0wmwTJH7LxN8x/O/DH3ZVqOmRcwGsqlBEcPmYD
	I2lwBqlwghj+l4qohVO/yt/IKaksvZQQ10jX4+7r2yH1AO98SkXqPmbhbOkfgYfhopNtgv3yimz+i
	WZCV2ygdd/3154qKCBgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPvK-00000009Ijt-2KXN;
	Thu, 29 Oct 2026 13:12:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPv2-00000009IRW-3naW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:11:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7EA374152C;
	Thu, 29 Oct 2026 13:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C14331F031E9;
	Thu, 29 Oct 2026 13:11:44 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Biju Das <biju.das.au@gmail.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-can@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/DNI 7/9] clk: renesas: r8a78000: Add CAN-FD clocks
Date: Thu, 29 Oct 2026 14:11:08 +0100
Message-ID: <5e76e7bc1d45939387746d84e4d8628f4fbd4f9b.1793278754.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793278754.git.geert+renesas@glider.be>
References: <cover.1793278754.git.geert+renesas@glider.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add support for the clocks used by the Controller Area Network Flexible
Data Rate (CAN-FD) modules on R-Car X5H.
This includes SCMI remapping table entries and a fixed-clock fallback.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This depends on "[PATCH/DNI 09/11] clk: renesas: r8a78000: Add PWM
clocks"
https://lore.kernel.org/4fc4232a28fe500b270d2cc26412a1909c12f5aa.1793026273.git.geert+renesas@glider.be
---
 drivers/clk/renesas/r8a78000-cpg.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/r8a78000-cpg.c b/drivers/clk/renesas/r8a78000-cpg.c
index 9b1ff5a8ff1bdc31..4e986b6cb79e4631 100644
--- a/drivers/clk/renesas/r8a78000-cpg.c
+++ b/drivers/clk/renesas/r8a78000-cpg.c
@@ -40,6 +40,7 @@ enum fixed_clk {
 	FIXED_CLK_66M,
 	FIXED_CLK_100M,
 	FIXED_CLK_133M,
+	FIXED_CLK_150M,
 	FIXED_CLK_266M,
 };
 
@@ -49,6 +50,7 @@ static const unsigned long fixed_clk_rates[] = {
 	[FIXED_CLK_66M] = 66666000,
 	[FIXED_CLK_100M] = 100000000,
 	[FIXED_CLK_133M] = 133330000,
+	[FIXED_CLK_150M] = 150000000,
 	[FIXED_CLK_266M] = 266660000,
 };
 
@@ -297,6 +299,7 @@ static const struct clk_map_in r8a78000_cpg_default[] = {
 	{ R8A78000_CPG_SGASYNCD4_PERW_BUS,	FIXED_CLK(266M) },
 	{ R8A78000_CPG_SGASYNCD8_PERW_BUS,	FIXED_CLK(133M) },
 	{ R8A78000_CPG_SGASYNCD16_PERW_BUS,	FIXED_CLK(66M) },
+	{ R8A78000_CPG_SCPBUSD4_SCP_MAIN,	FIXED_CLK(150M) },
 	{ R8A78000_CPG_SCPBUSD16_SCP_MAIN,	FIXED_CLK(37M5) },
 	{ R8A78000_CPG_S0D24_PERE_MAIN,		FIXED_CLK(33M) },
 	{ R8A78000_CPG_SGD32_PERW_BUS,		FIXED_CLK(33M) },
@@ -312,12 +315,14 @@ static const struct clk_map_in r8a78000_cpg_fw[] = {
 	{ R8A78000_CPG_SGASYNCD16_PERW_BUS,	1663 },
 	{ R8A78000_CPG_MSO_SCP_MAIN,		1459 },
 	{ R8A78000_CPG_MSOCK_PERW_BUS,		1667 },
+	{ R8A78000_CPG_SCPBUSD4_SCP_MAIN,	1451 },
 	{ R8A78000_CPG_SCPBUSD16_SCP_MAIN,	1454 },
 	{ R8A78000_CPG_S0D24_PERE_MAIN,		1690 },
 	{ R8A78000_CPG_SGD32_PERW_BUS,		1660 },
 	{ R8A78000_CPG_S0D24_HSCN_OTHER,	1499 },
 	{ R8A78000_CPG_SGASYNCD16_PERW_MAIN,	1651 },
 	{ R8A78000_CPG_S0ASYNCD8_PERW_MAIN,	1653 },
+	{ R8A78000_CPG_CANFD_SCP_MAIN,		1456 },
 	{ -1 }
 };
 
-- 
2.43.0


