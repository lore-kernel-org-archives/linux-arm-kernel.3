Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC048606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 14:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1GbN2ozQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=44CTiA7A49EJN2VY0UCM0Rmoy6mh9PnJJvTxNQQxTx8=; b=1GbN2ozQf2WBzp
	9X7c8hDqO/d0bXflecfnkpPQ8R7EIJC3TYWUPDBwXLo0qiXSCqHe9fA+TLKiUA4IMvyxY97F6C/o9
	PkPIHQpjSS5hpvBMAtN74wH4qguDSHo2YxJdx9CDKHlfpgU71rwRF9cgWcqvOHRa6BcZg9/PUqJ5S
	LTNSBCnYnBxFT4ChbDSUJwl9t0BU9HhCwmaVoyT8zl0Zf6/PQVOKTrLCvGgvXomKg7LDJAi/PwLdl
	GQjmieghdMPpthLL/nzdb6sWHg/FblCuHFQY7qAtmm8/5kTD/QMnR5ZbJ6zx6ncA+r+a4lnz8STyv
	AmpYnOU5MrD8wPdLy8gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLM7I-00000002iJ6-0y5o;
	Mon, 26 Oct 2026 14:56:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLM7F-00000002iH0-09nN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 14:56:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 14C2C6021E;
	Mon, 26 Oct 2026 14:56:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C6B11F01829;
	Mon, 26 Oct 2026 14:55:55 +0000 (UTC)
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
Subject: [PATCH 06/11] pwm: rcar: Add support for R-Car Gen5
Date: Mon, 26 Oct 2026 15:55:22 +0100
Message-ID: <f09a095ee5128c94c5dd1dadb71e655ec9dac658.1793026273.git.geert+renesas@glider.be>
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

R-Car Gen5 enlarged the PWM output cycle and high-level period fields
from 10 to 24 bits.  The high parts of each field are stored in a new
register.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pwm/pwm-rcar.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/pwm/pwm-rcar.c b/drivers/pwm/pwm-rcar.c
index 3813094c601efc8c..5e91509de7a7c162 100644
--- a/drivers/pwm/pwm-rcar.c
+++ b/drivers/pwm/pwm-rcar.c
@@ -31,7 +31,8 @@
 #define  RCAR_PWMCR_SS0		BIT(4)
 #define  RCAR_PWMCR_EN0		BIT(0)
 
-#define RCAR_PWMCNT		0x04
+#define RCAR_PWMCNTA		0x04		/* Low part */
+#define RCAR_PWMCNTB		0x08		/* High part (R-Car Gen5) */
 #define  RCAR_PWMCNT_CYC0_MASK	GENMASK(31, 16)
 #define  RCAR_PWMCNT_PH0_MASK	GENMASK(15, 0)
 
@@ -124,9 +125,15 @@ static int rcar_pwm_set_counter(struct rcar_pwm_chip *rp, int div, u64 duty_ns,
 		return -EINVAL;
 
 	rcar_pwm_write(rp,
-		       FIELD_PREP(RCAR_PWMCNT_CYC0_MASK, cyc) |
-		       FIELD_PREP(RCAR_PWMCNT_PH0_MASK, ph),
-		       RCAR_PWMCNT);
+		       FIELD_PREP(RCAR_PWMCNT_CYC0_MASK, lower_16_bits(cyc)) |
+		       FIELD_PREP(RCAR_PWMCNT_PH0_MASK, lower_16_bits(ph)),
+		       RCAR_PWMCNTA);
+
+	if (rp->cycle_bits >= 16)
+		rcar_pwm_write(rp,
+		       FIELD_PREP(RCAR_PWMCNT_CYC0_MASK, upper_16_bits(cyc)) |
+		       FIELD_PREP(RCAR_PWMCNT_PH0_MASK, upper_16_bits(ph)),
+		       RCAR_PWMCNTB);
 
 	return 0;
 }
@@ -146,9 +153,14 @@ static int rcar_pwm_enable(struct rcar_pwm_chip *rp)
 	u32 value, cyc, ph;
 
 	/* Don't enable the PWM device if CYC0 or PH0 is 0 */
-	value = rcar_pwm_read(rp, RCAR_PWMCNT);
+	value = rcar_pwm_read(rp, RCAR_PWMCNTA);
 	cyc = FIELD_GET(RCAR_PWMCNT_CYC0_MASK, value);
 	ph = FIELD_GET(RCAR_PWMCNT_PH0_MASK, value);
+	if (rp->cycle_bits >= 16) {
+		value = rcar_pwm_read(rp, RCAR_PWMCNTB);
+		cyc |= FIELD_GET(RCAR_PWMCNT_CYC0_MASK, value) << 16;
+		ph |= FIELD_GET(RCAR_PWMCNT_PH0_MASK, value) << 16;
+	}
 
 	if ((cyc & RCAR_PWM_MAX_CYCLE(rp)) == 0 ||
 	    (ph & RCAR_PWM_MAX_CYCLE(rp)) == 0)
@@ -262,8 +274,13 @@ static const struct rcar_pwm_info rcar_pwm_info = {
 	.cycle_bits = 10,
 };
 
+static const struct rcar_pwm_info rcar_gen5_pwm_info = {
+	.cycle_bits = 24,
+};
+
 static const struct of_device_id rcar_pwm_of_table[] = {
 	{ .compatible = "renesas,pwm-rcar", .data = &rcar_pwm_info },
+	{ .compatible = "renesas,rcar-gen5-pwm", .data = &rcar_gen5_pwm_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rcar_pwm_of_table);
-- 
2.43.0


