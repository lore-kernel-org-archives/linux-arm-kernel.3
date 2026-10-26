Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A41606A320
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 14:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fxjnAQnu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+BXLUS8lDAmpc0E9HAwHG4tK1aoD2k15ADbFhH36gJs=; b=fxjnAQnuuxGtY8
	51Uh9AyQlp1rjLgDvIaXJ3uU7S4LHaUO33FW3FMn/bJCQPXN/HWnZPvYMl+ty+86xKZxN9kAYcQqN
	0hCVMz3nz9Na/vdbPC88Fr5IIY+NTi1d5FN90jAIZNQrC2qlQg0JoQE/Zk+9SX3RFCC2LW+SMGx5R
	NkynempQyGGCYeNUwXuvhVfYZa1B+6z4tLBzsiNRV3fYfkjtL/2GlxBMdIAbMgyjPu7byercHRtq0
	oM73Q3UiWLYOu4oErV7vFRR+n2Hagwn53ootYgUMWB9XCyqosJODNW0A8GZwgIO7/m7XC4nKYO1/5
	mhFzzoQ6oKbOUJJTP7eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLM7Z-00000002iZ2-1Ajn;
	Mon, 26 Oct 2026 14:56:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLM7U-00000002iTm-3vVE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 14:56:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ADD0343BC5;
	Mon, 26 Oct 2026 14:56:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6A3F1F01829;
	Mon, 26 Oct 2026 14:56:12 +0000 (UTC)
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
Subject: [PATCH/DNI 10/11] pmdomain: renesas: r8a78000: Add PWM support
Date: Mon, 26 Oct 2026 15:55:26 +0100
Message-ID: <a04faf03f3854d3eef291dd6e5dd886a54bfb0f9.1793026273.git.geert+renesas@glider.be>
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

Add support for the Pulse Width Modulation (PWM) modules and the 16-Bit
Timer Pulse Unit (TPU) on R-Car X5H.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This depends on "[PATCH v4 7/8] pmdomain: renesas: r8a78000: Add SCMI
remapping support"
https://lore.kernel.org/2895c8f3cbe718dc597ad25e16c2461f0d681ab6.1792163045.git.geert+renesas@glider.be/
---
 drivers/pmdomain/renesas/r8a78000-mdlc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pmdomain/renesas/r8a78000-mdlc.c b/drivers/pmdomain/renesas/r8a78000-mdlc.c
index 838566ed821e29e0..62156bfb8080e6e4 100644
--- a/drivers/pmdomain/renesas/r8a78000-mdlc.c
+++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c
@@ -681,6 +681,8 @@ static const struct mod_map_in r8a78000_mdlc_perw_mod_fw[] = {
 	{ 0x55, 225, -1 },	/* HSCIF1 */
 	{ 0x56, 226, -1 },	/* HSCIF2 */
 	{ 0x57, 227, -1 },	/* HSCIF3 */
+	{ 0x70, 244, -1 },	/* PWM0 */
+	{ 0x76, 249, -1 },	/* TPU0 */
 	{ -1 }
 };
 
-- 
2.43.0


