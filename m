Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC132606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 17:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZnoGhLgf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ft7W8Aot7m3+1YC13GQrmthgZInPfqoU0+jIRIlM4ck=; b=ZnoGhLgf6gNeSL
	TXYOMpCDnECicWJRbjvweOcHGeIj01zx+7JapoXsHyy3fIsSvkbkG+gleC0NEIQhQhuw8Sj8eQUEp
	cUJwwbw/XV9rYCXeqI9IFopEHpjKRKKWfAWDa+UM4f6QlFbLMvp+0GAkH3Om0DpNRm5JmYrT2Nn5T
	uBPRZP76i/cAIJbLMDepzfGguwzlsiSbioV+lraWeuBnFgR40GvC6sMbXvrN/9uikCdphOCt3kTYf
	G18keHEQGtQqevrtZQ8AEf2PG17t/hzy5le4Bj3BZ6ATtKOXWkxBjF1mH+96XiuwN2VrebUi9/QYM
	zgrw5z6thNM/9D2hofNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKJT9-0000000GlKX-0Jo6;
	Fri, 23 Oct 2026 17:54:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKJT8-0000000GlKJ-03pM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 17:54:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C21E7402DC;
	Fri, 23 Oct 2026 17:54:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C03E81F01825;
	Fri, 23 Oct 2026 17:53:48 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/DNI 4/7] clk: renesas: r8a78000: Add GPIO clocks
Date: Fri, 23 Oct 2026 19:50:42 +0200
Message-ID: <34f97dab00c6d98b7afe8d8df38eeb83abf5c19f.1792776697.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792776697.git.geert+renesas@glider.be>
References: <cover.1792776697.git.geert+renesas@glider.be>
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

Add support for the clocks used by the GPIO modules on R-Car X5H.
This includes SCMI remapping tables and fixed-clock fallbacks.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This depends on "[PATCH v4 2/8] clk: renesas: r8a78000: Add SCMI
remapping support"
https://lore.kernel.org/c38d744c09dffff550a9b882051c211b572b8daf.1792163045.git.geert+renesas@glider.be/
---
 drivers/clk/renesas/r8a78000-cpg.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clk/renesas/r8a78000-cpg.c b/drivers/clk/renesas/r8a78000-cpg.c
index 758cfe78ae58e0fb..1d66082f6f44b5ba 100644
--- a/drivers/clk/renesas/r8a78000-cpg.c
+++ b/drivers/clk/renesas/r8a78000-cpg.c
@@ -35,12 +35,16 @@ struct cpg_data {
 };
 
 enum fixed_clk {
+	FIXED_CLK_33M,
+	FIXED_CLK_37M5,
 	FIXED_CLK_66M,
 	FIXED_CLK_133M,
 	FIXED_CLK_266M,
 };
 
 static const unsigned long fixed_clk_rates[] = {
+	[FIXED_CLK_33M] = 33333000,
+	[FIXED_CLK_37M5] = 37500000,
 	[FIXED_CLK_66M] = 66666000,
 	[FIXED_CLK_133M] = 133330000,
 	[FIXED_CLK_266M] = 266660000,
@@ -291,6 +295,10 @@ static const struct clk_map_in r8a78000_cpg_default[] = {
 	{ R8A78000_CPG_SGASYNCD4_PERW_BUS,	FIXED_CLK(266M) },
 	{ R8A78000_CPG_SGASYNCD8_PERW_BUS,	FIXED_CLK(133M) },
 	{ R8A78000_CPG_SGASYNCD16_PERW_BUS,	FIXED_CLK(66M) },
+	{ R8A78000_CPG_SCPBUSD16_SCP_MAIN,	FIXED_CLK(37M5) },
+	{ R8A78000_CPG_S0D24_PERE_MAIN,		FIXED_CLK(33M) },
+	{ R8A78000_CPG_SGD32_PERW_BUS,		FIXED_CLK(33M) },
+	{ R8A78000_CPG_S0D24_HSCN_OTHER,	FIXED_CLK(33M) },
 	{ -1 }
 };
 
@@ -300,6 +308,10 @@ static const struct clk_map_in r8a78000_cpg_fw[] = {
 	{ R8A78000_CPG_SGASYNCD16_PERW_BUS,	1663 },
 	{ R8A78000_CPG_MSO_SCP_MAIN,		1459 },
 	{ R8A78000_CPG_MSOCK_PERW_BUS,		1667 },
+	{ R8A78000_CPG_SCPBUSD16_SCP_MAIN,	1454 },
+	{ R8A78000_CPG_S0D24_PERE_MAIN,		1690 },
+	{ R8A78000_CPG_SGD32_PERW_BUS,		1660 },
+	{ R8A78000_CPG_S0D24_HSCN_OTHER,	1499 },
 	{ -1 }
 };
 
-- 
2.43.0


