Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E86606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 13:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x3R43Vk9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TacSadf5vVdafv1GWEGVsOyle84bCFtG5lLBQAWeJf0=; b=x3R43Vk9BxJT2F
	19wsa8Gb6H1rPgFD/LI0+gUPwCf9X2+ApSyrpuOwWPBH5iheiQj1QiwpFItotR6Ev6pkxCSY95VhC
	Btsp7NVANJ8HkQdu57jC/tJ8FoITmiOwr6D3cf6trIamDFTRHLIqWuP4asi2QSv4ofXKmuP2Gj2A6
	hvf4H5Twh+tMG6KLUY1mkA44MiFJowLAwMof8Xj2eL9VXli74IELBkQJD0k5l8wuome9a97xkNkRT
	e/43Mi4ctLwptrxR2yw6AfE/P4aJjknCZ4FU7U8TdWF3kjCWfrUeNBMyHlUbPtBYv71J5iVM7a0pH
	NBGDKFC+ul3Cyxu6+Qyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPup-00000009IHM-2t5L;
	Thu, 29 Oct 2026 13:11:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPum-00000009IFP-3yk2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:11:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 65D926021A;
	Thu, 29 Oct 2026 13:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EAD51F031E2;
	Thu, 29 Oct 2026 13:11:28 +0000 (UTC)
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
Subject: [PATCH 3/9] can: rcar_canfd: Make clkp local
Date: Thu, 29 Oct 2026 14:11:04 +0100
Message-ID: <415c8b26718e2e5d53f74e65daedf9986c76dcfe.1793278754.git.geert+renesas@glider.be>
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

The peripheral clock is only used in rcar_canfd_probe(), so convert clkp
to a local variable.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/net/can/rcar/rcar_canfd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rcar_canfd.c
index 74d9ffd2790587b9..9dbe44710dcced80 100644
--- a/drivers/net/can/rcar/rcar_canfd.c
+++ b/drivers/net/can/rcar/rcar_canfd.c
@@ -467,7 +467,6 @@ struct rcar_canfd_global {
 	void __iomem *base;		/* Register base address */
 	struct rcar_canfd_f_c __iomem *fcbase;
 	struct platform_device *pdev;	/* Respective platform device */
-	struct clk *clkp;		/* Peripheral clock */
 	struct clk *can_clk;		/* fCAN clock */
 	struct clk *clk_ram;		/* Clock RAM */
 	unsigned long channels_mask;	/* Enabled channels mask */
@@ -2111,6 +2110,7 @@ static int rcar_canfd_probe(struct platform_device *pdev)
 	bool fdmode = true;			/* CAN FD only mode - default */
 	char name[9] = "channelX";
 	u32 ch, fcan_freq;
+	struct clk *clkp;
 	int i;
 
 	info = of_device_get_match_data(dev);
@@ -2181,9 +2181,9 @@ static int rcar_canfd_probe(struct platform_device *pdev)
 				     "failed to get rstc_n\n");
 
 	/* Peripheral clock */
-	gpriv->clkp = devm_clk_get(dev, "fck");
-	if (IS_ERR(gpriv->clkp))
-		return dev_err_probe(dev, PTR_ERR(gpriv->clkp),
+	clkp = devm_clk_get(dev, "fck");
+	if (IS_ERR(clkp))
+		return dev_err_probe(dev, PTR_ERR(clkp),
 				     "cannot get peripheral clock\n");
 
 	/* fCAN clock: Pick External clock. If not available fallback to
-- 
2.43.0


