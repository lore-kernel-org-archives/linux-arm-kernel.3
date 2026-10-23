Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2FC606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 17:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gnD+LKsT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=veEtzTzjL8zq0FEnYMOZSeR9nQqTNj9N4Odb5GHoV9A=; b=gnD+LKsTyPb2m9
	YAt8g9mRRKxweMoGwHmiOuL4V7RkYeipppFacRYJ0MYKGYEMNmpYlTIT0Rd9XlvZ4Gr3RtX9JlSFX
	9K32A/dmmVT2863X+iOLQeu4eXJuXQKp8QVruH34qrI2cfrfZNlwcOCVHJmPpZhww8umJshcO0VPJ
	TzDKtH12y5hIV5noMQh2ygpuu+KW0SDTqJao/rRCc9mh/0KxRW7U+wOb/qcH7X+3Y5+5BpDtt90Oz
	lXrI7a+isoyALm2vzCQBhpmppBfkic08K+6WPsrIIEgcb7EwsVxqbd5uYegxyW6hdYtK2t3hEYT2g
	PHxwiV2ImltrfxsyKPOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKJTe-0000000GlSZ-1Eq7;
	Fri, 23 Oct 2026 17:54:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKJTU-0000000GlRD-3G4u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 17:54:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2277B601FA;
	Fri, 23 Oct 2026 17:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C691F01828;
	Fri, 23 Oct 2026 17:54:18 +0000 (UTC)
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
Subject: [PATCH/RFC 5/7] pmdomain: renesas: r8a78000: Add default GPIO support
Date: Fri, 23 Oct 2026 19:50:43 +0200
Message-ID: <c7ceec0d203fb01b3bf7c7923bfee50b7a5e3ac1.1792776697.git.geert+renesas@glider.be>
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

All GPIO modules seem to be accessible without SCMI, and at least
GP05_15..GP05_20 are known to work.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Do we want this? So far there are no users of GPIO, and future users
might need SCMI for other reasons anyway.
---
 drivers/pmdomain/renesas/r8a78000-mdlc.c | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/pmdomain/renesas/r8a78000-mdlc.c b/drivers/pmdomain/renesas/r8a78000-mdlc.c
index af36d8229030f6c0..10089d938f71b27e 100644
--- a/drivers/pmdomain/renesas/r8a78000-mdlc.c
+++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c
@@ -606,13 +606,38 @@ static int r8a78000_mdlc_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct mod_map_in r8a78000_mdlc_aon_mod_default[] = {
+	{ 0x20, 0, -1 },	/* GPIODM0 */
+	{ -1 }
+};
+
+static const struct mod_map_in r8a78000_mdlc_hscn_mod_default[] = {
+	{ 0x50, 0, -1 },	/* PFC_HSCN_GPIODM0 */
+	{ -1 }
+};
+
+static const struct mod_map_in r8a78000_mdlc_pere_mod_default[] = {
+	{ 0x30, 0, -1 },	/* PFC_PERE_GPIODM0 */
+	{ -1 }
+};
+
 static const struct mod_map_in r8a78000_mdlc_perw_mod_default[] = {
+	{ 0x30, 0, -1 },	/* PFC_PERW_GPIODM0 */
 	{ 0x54, 0, -1 },	/* HSCIF0 */
 	{ -1 }
 };
 
 static const struct mdlc_info r8a78000_mdlc_default[] = {
 	{
+		.base = 0xc1338000 /* mdlc_aon */,
+		.mod_map = r8a78000_mdlc_aon_mod_default,
+	}, {
+		.base = 0xc9c90000 /* mdlc_hscn */,
+		.mod_map = r8a78000_mdlc_hscn_mod_default,
+	}, {
+		.base = 0xc08f0000 /* mdlc_pere */,
+		.mod_map = r8a78000_mdlc_pere_mod_default,
+	}, {
 		.base = 0xc05d0000 /* mdlc_perw */,
 		.mod_map = r8a78000_mdlc_perw_mod_default,
 	},
-- 
2.43.0


