Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57483606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 14:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IWLfz3t6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qTszvocLaYOpsjYueDSx5WsodbShfzlk4+GQlonfBSM=; b=IWLfz3t6sYx9y+
	cdbky7L5NYJPx0Qk3SYJZMqc9h3hPK204+Argzsp6ZymGoRnllqQ+FDUbLHJ+vWrUo0/td0F2OGva
	x0+tdTbfZv+oVd8OgUsEuk7jOUBvr8JsX9HQ4vzxef9qPVzHuTdfd9MCuOGZ5tHOfxFE3s/F0952Z
	EO7bVZCN3iS+o3DEFTLxw0Ewux9PtZedYyR4cD1/Ef22K2HbZ1JyPnhUppES6bUe3HAsSS4rSnojq
	uatW/arEofk3lH3cTQkhhnBV7fQjgc0zf2JplMrz1Enz6U6PNv5XM9FkBKCMN1xruwGqjwpH+AZA3
	DF8GiLC4K89hQB8lsG7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLM75-00000002iD6-3cEA;
	Mon, 26 Oct 2026 14:55:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLM71-00000002iBZ-3W4B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 14:55:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 960B940897;
	Mon, 26 Oct 2026 14:55:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F891F031E4;
	Mon, 26 Oct 2026 14:55:43 +0000 (UTC)
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
Subject: [PATCH 03/11] pwm: rcar: Use FIELD_PREP() for PWMCR_CC0 access
Date: Mon, 26 Oct 2026 15:55:19 +0100
Message-ID: <3bc3726cfb6e59c378500a63fd5e52a6f0f8cf5c.1793026273.git.geert+renesas@glider.be>
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

Use the FIELD_PREP() helper instead of open-coding the same operation.
Drop the now unused RCAR_PWMCR_CC0_SHIFT definition, and redefine
RCAR_PWMCR_CC0_SHIFT using GENMASK() while at it.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pwm/pwm-rcar.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-rcar.c b/drivers/pwm/pwm-rcar.c
index 1733cd700693713e..4641f258df531baf 100644
--- a/drivers/pwm/pwm-rcar.c
+++ b/drivers/pwm/pwm-rcar.c
@@ -25,8 +25,7 @@
 #define RCAR_PWM_MAX_CYCLE	1023
 
 #define RCAR_PWMCR		0x00
-#define  RCAR_PWMCR_CC0_MASK	0x000f0000
-#define  RCAR_PWMCR_CC0_SHIFT	16
+#define  RCAR_PWMCR_CC0_MASK	GENMASK(19, 16)
 #define  RCAR_PWMCR_CCMD	BIT(15)
 #define  RCAR_PWMCR_SYNC	BIT(11)
 #define  RCAR_PWMCR_SS0		BIT(4)
@@ -99,7 +98,7 @@ static void rcar_pwm_set_clock_control(struct rcar_pwm_chip *rp,
 
 	div >>= 1;
 
-	value |= div << RCAR_PWMCR_CC0_SHIFT;
+	value |= FIELD_PREP(RCAR_PWMCR_CC0_MASK, div);
 	rcar_pwm_write(rp, value, RCAR_PWMCR);
 }
 
-- 
2.43.0


