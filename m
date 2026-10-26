Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E48C606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 14:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Pdnaw2Yb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ngZ+YChJ683ub5nqZmPTKf2cgTQixpdwXS2UrmArJoI=; b=Pdnaw2Ybj9ctkJ
	R1uYMDQBl+eHSOk0hoJzGoApRn08G3kjD0/I6Fv9YEETzrEQD7PVfon3OV7IpE6HvJIMimGktQix2
	cBEfJ/QEav5ZTrK18V6NGsyZFLX9P2JPuO3bpTzg58zVNMDfi77+18XDwlA4s/x+tywV2h/EbVfbS
	xtK95+tBXTYex9nHi08QNIpY2b7PEzZPOrdhmpYCkFkQmzdRrNCh3rUmjUM28U0EP/c+LHOV14bi+
	R6H8oN4NwJlBK1Tq0k7MWDDXjgI+i0sEEAMCRhGfy7z7eVviwbPS5JJ3HHFtbMsxgQgkXKeQN5oDT
	29QfMksCS8pJuPV2CYrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLM7Y-00000002iY0-3ay3;
	Mon, 26 Oct 2026 14:56:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLM7Q-00000002iRX-3Syy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 14:56:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9304F417FA;
	Mon, 26 Oct 2026 14:56:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C25931F01825;
	Mon, 26 Oct 2026 14:56:08 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/DNI 09/11] clk: renesas: r8a78000: Add PWM clocks
Date: Mon, 26 Oct 2026 15:55:25 +0100
Message-ID: <4fc4232a28fe500b270d2cc26412a1909c12f5aa.1793026273.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793026273.git.geert+renesas@glider.be>
References: <cover.1793026273.git.geert+renesas@glider.be>
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add support for the clocks used by the PWM modules on R-Car X5H.
This includes SCMI remapping tables and fixed-clock fallbacks.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This depends on "[PATCH/DNI 4/7] clk: renesas: r8a78000: Add GPIO
clocks"
https://lore.kernel.org/34f97dab00c6d98b7afe8d8df38eeb83abf5c19f.1792776697.git.geert+renesas@glider.be
---
 drivers/clk/renesas/r8a78000-cpg.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/renesas/r8a78000-cpg.c b/drivers/clk/renesas/r8a78000-cpg.c
index 1d66082f6f44b5ba..9b1ff5a8ff1bdc31 100644
--- a/drivers/clk/renesas/r8a78000-cpg.c
+++ b/drivers/clk/renesas/r8a78000-cpg.c
@@ -38,6 +38,7 @@ enum fixed_clk {
 	FIXED_CLK_33M,
 	FIXED_CLK_37M5,
 	FIXED_CLK_66M,
+	FIXED_CLK_100M,
 	FIXED_CLK_133M,
 	FIXED_CLK_266M,
 };
@@ -46,6 +47,7 @@ static const unsigned long fixed_clk_rates[] = {
 	[FIXED_CLK_33M] = 33333000,
 	[FIXED_CLK_37M5] = 37500000,
 	[FIXED_CLK_66M] = 66666000,
+	[FIXED_CLK_100M] = 100000000,
 	[FIXED_CLK_133M] = 133330000,
 	[FIXED_CLK_266M] = 266660000,
 };
@@ -299,6 +301,8 @@ static const struct clk_map_in r8a78000_cpg_default[] = {
 	{ R8A78000_CPG_S0D24_PERE_MAIN,		FIXED_CLK(33M) },
 	{ R8A78000_CPG_SGD32_PERW_BUS,		FIXED_CLK(33M) },
 	{ R8A78000_CPG_S0D24_HSCN_OTHER,	FIXED_CLK(33M) },
+	{ R8A78000_CPG_SGASYNCD16_PERW_MAIN,	FIXED_CLK(66M) },
+	{ R8A78000_CPG_S0ASYNCD8_PERW_MAIN,	FIXED_CLK(100M) },
 	{ -1 }
 };
 
@@ -312,6 +316,8 @@ static const struct clk_map_in r8a78000_cpg_fw[] = {
 	{ R8A78000_CPG_S0D24_PERE_MAIN,		1690 },
 	{ R8A78000_CPG_SGD32_PERW_BUS,		1660 },
 	{ R8A78000_CPG_S0D24_HSCN_OTHER,	1499 },
+	{ R8A78000_CPG_SGASYNCD16_PERW_MAIN,	1651 },
+	{ R8A78000_CPG_S0ASYNCD8_PERW_MAIN,	1653 },
 	{ -1 }
 };
 
-- 
2.43.0


