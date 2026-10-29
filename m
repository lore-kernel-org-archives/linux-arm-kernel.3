Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6B3606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 13:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qpQyMt+L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HyvBjqF9YQuWo179ksR30H3PsEw5+ooJnwlk82YJV4I=; b=qpQyMt+LM3fXRa
	g4FLrCgxxndyEAMCjjTvHmTT9SsH1Kyf2re/1Yr9JgPhDe7DZ6OliFq3Em/5YQL/Q53mLOI7Qoqk+
	t/1GG8s1rxKkm8KRXMh63JSoMbnPValB7ppkKo0XW2r38z4ZSG1Qb6WZSE+VgGjtLYqoKwEwo0NUy
	9IGlPBZoVdPWS7KgzIg3q83aj87y35rjC6r6NugwJP5ZIKizYjljiKbMwgrE2qObD+k1ch36NyKVp
	qBmFaXJo87mcIS5wCBeq+z1tB2xKAMe4Kfe9VKAyqFhvh8fXcrOEMGpi0yLdkDhw4Z9TUx1sBLF1M
	6zRFc5AGsILxJXJY3f7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPvK-00000009IkB-2reb;
	Thu, 29 Oct 2026 13:12:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPv7-00000009IWi-1I51
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:11:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BC1CF60234;
	Thu, 29 Oct 2026 13:11:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD62D1F031E6;
	Thu, 29 Oct 2026 13:11:48 +0000 (UTC)
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
Subject: [PATCH/DNI 8/9] pmdomain: renesas: r8a78000: Add CAN-FD support
Date: Thu, 29 Oct 2026 14:11:09 +0100
Message-ID: <ed6aec084413da6a2c634a6f98f7dbf4ec3377f3.1793278754.git.geert+renesas@glider.be>
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

Add support for the Controller Area Network Flexible Data Rate (CAN-FD)
modules on R-Car X5H.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This depends on "[PATCH v4 7/8] pmdomain: renesas: r8a78000: Add SCMI
remapping support"
https://lore.kernel.org/2895c8f3cbe718dc597ad25e16c2461f0d681ab6.1792163045.git.geert+renesas@glider.be/
---
 drivers/pmdomain/renesas/r8a78000-mdlc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pmdomain/renesas/r8a78000-mdlc.c b/drivers/pmdomain/renesas/r8a78000-mdlc.c
index 62156bfb8080e6e4..02699952f5c2d83f 100644
--- a/drivers/pmdomain/renesas/r8a78000-mdlc.c
+++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c
@@ -691,6 +691,8 @@ static const struct mod_map_in r8a78000_mdlc_scp_mod_fw[] = {
 	{ 0x51, 777, 1459 },	/* MSI1 / MSO_SCP_MAIN */
 	{ 0x52, 778, 1459 },	/* MSI2 / MSO_SCP_MAIN */
 	{ 0x53, 779, 1459 },	/* MSI3 / MSO_SCP_MAIN */
+	{ 0x72, 799, -1 },	/* CANFD0 */
+	{ 0x73, 800, -1 },	/* CANFD1 */
 	{ -1 }
 };
 
-- 
2.43.0


