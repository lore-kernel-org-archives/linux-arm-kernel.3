Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A39606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 17:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=enBWQakj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pao9WubCAod8keYe+2yXT+0/fwRHZA3RvWmCb5PUwHo=; b=enBWQakjMlwI0B
	AMux5+e/LYrGg6hYzF9RSAXU1QVVDx2zfdk8GyqjwMdF1LHH4de3GXAIdc8mKaRMOseSIJ4NwJmAW
	FrFrrEFVq+XrIHYkiWkIQsZfWsyqjY3nRijgGKtO5M+9dfdKfozdoWcE7BFNFvZ2vTe4mh6oSJDXf
	aerZ53vVsav3R8p9HxJaeXfEIeoye20Ofd5Qvu3EsendyGDKNmla2fAvRPDQO4OyzvWNa7hLYpCU5
	P+g9YqJGojtHDX5Urh4NLF4KW1fjGTPsig8de7nCZ4cCeCXl9aYQ44iw8cO1gtjpvbJOm3HFFMkEn
	YGjnf7uuUEHeknJCCkUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKJTr-0000000GlXj-1lsj;
	Fri, 23 Oct 2026 17:55:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKJTp-0000000GlWk-2E2u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 17:55:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C78BA41AE6;
	Fri, 23 Oct 2026 17:55:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC851F01825;
	Fri, 23 Oct 2026 17:54:41 +0000 (UTC)
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
Subject: [PATCH/DNI 6/7] pmdomain: renesas: r8a78000: Add SCMI GPIO support
Date: Fri, 23 Oct 2026 19:50:44 +0200
Message-ID: <54e186a3436605f5755dd16eb90b3b7a06e97254.1792776697.git.geert+renesas@glider.be>
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

Add support for the GPIO modules on R-Car X5H when using SCMI.
These are handled by the AON, HSCN, PERE, and PERW Module Controller
blocks.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This depends on "[PATCH v4 7/8] pmdomain: renesas: r8a78000: Add SCMI
remapping support"
https://lore.kernel.org/2895c8f3cbe718dc597ad25e16c2461f0d681ab6.1792163045.git.geert+renesas@glider.be/
---
 drivers/pmdomain/renesas/r8a78000-mdlc.c | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/pmdomain/renesas/r8a78000-mdlc.c b/drivers/pmdomain/renesas/r8a78000-mdlc.c
index 10089d938f71b27e..838566ed821e29e0 100644
--- a/drivers/pmdomain/renesas/r8a78000-mdlc.c
+++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c
@@ -644,7 +644,23 @@ static const struct mdlc_info r8a78000_mdlc_default[] = {
 	{ /* sentinel */ }
 };
 
+static const struct mod_map_in r8a78000_mdlc_aon_mod_fw[] = {
+	{ 0x20, 811, -1 },	/* GPIODM0 */
+	{ -1 }
+};
+
+static const struct mod_map_in r8a78000_mdlc_hscn_mod_fw[] = {
+	{ 0x50, 332, -1 },	/* PFC_HSCN_GPIODM0 */
+	{ -1 }
+};
+
+static const struct mod_map_in r8a78000_mdlc_pere_mod_fw[] = {
+	{ 0x30, 193, -1 },	/* PFC_PERE_GPIODM0 */
+	{ -1 }
+};
+
 static const struct mod_map_in r8a78000_mdlc_perw_mod_fw[] = {
+	{ 0x30, 201, -1 },	/* PFC_PERW_GPIODM0 */
 	{ 0x40, 205, -1 },	/* SCIF0 */
 	{ 0x41, 206, -1 },	/* SCIF1 */
 	{ 0x42, 207, -1 },	/* SCIF3 */
@@ -678,6 +694,15 @@ static const struct mod_map_in r8a78000_mdlc_scp_mod_fw[] = {
 
 static const struct mdlc_info r8a78000_mdlc_fw[] = {
 	{
+		.base = 0xc1338000 /* mdlc_aon */,
+		.mod_map = r8a78000_mdlc_aon_mod_fw,
+	}, {
+		.base = 0xc9c90000 /* mdlc_hscn */,
+		.mod_map = r8a78000_mdlc_hscn_mod_fw,
+	}, {
+		.base = 0xc08f0000 /* mdlc_pere */,
+		.mod_map = r8a78000_mdlc_pere_mod_fw,
+	}, {
 		.base = 0xc05d0000 /* mdlc_perw */,
 		.mod_map = r8a78000_mdlc_perw_mod_fw,
 	}, {
-- 
2.43.0


