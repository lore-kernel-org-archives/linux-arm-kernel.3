Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B977606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 16:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eYh4kbDk;
	dkim=pass (2048-bit key, unprotected) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=oyVTA7cy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7MjKdc7i9F9fJcY1kYTnN/FTIKL2c56vf1h9vXuC9lY=; b=eYh4kbDk3kXa+Tw5hJTP2ilSjq
	LsOiL92TbiRD6hGdCSYVFwg/VRVc4IqBIms6v4ysKFQJ2mCqj7eZ1TTwmEF5rV8motMsefxsQCEM1
	f9Inq+4D5UCIBdPeh9wTjgXSfG4NiSHHknezwhkEeOzWhSGCVnCGWVtOiK9saAtJ29cAUfBMu48Hu
	DxUr3Kpu0nEm/ai9l1yo27Hdtlr6LxoLzmaz5slLyy4kUB/CJHW9DbJj+D9tfhCkV4qAgs4vDP7/j
	EQL/eSym14jnjt0VV02QxPO6SnCRu7sat3CZ+eoJXiust+fkDT20gpcdUH6uSjQH7HqQA8Y3zSPiA
	yf9KBJCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBIP-0000000A0eq-0Gja;
	Tue, 20 Oct 2026 14:58:33 +0000
Received: from mail.tipi-net.de ([2a03:4000:43:185::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBIL-0000000A0bE-28jZ;
	Tue, 20 Oct 2026 14:58:31 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 95E08A1625;
	Tue, 20 Oct 2026 16:58:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1792508302; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7MjKdc7i9F9fJcY1kYTnN/FTIKL2c56vf1h9vXuC9lY=;
	b=oyVTA7cy9CHMLVVA9gkpW/4/enFIkJAtc7cohzo0PBdZDxatBae79TL22w1Mb//Gf3hbKo
	AwFgFTURY2JbxipA8eu+v+iLlz92bnKcbm4f+EPf6YqZpgRjGCIVBxd7BsFncudDF/DMzS
	hoyHBLo4OoiCtvUloMx7uqqzb9e7F2JLRR4EetWYCTCYIik9hNQtq0srpi33vo8Be4t7Z0
	j38k3jWowk3JeqIaaQGMCyCEEqIblE+b0T540S16XrbGejVMcFXp177+Nu7PwMrsCa1Pmx
	YAJxXXC7jg5ruamm0yy6BQEmvQXfeTT7gf5PF+Sw1GzHqQvdcWdErQ+zq9SmwA==
From: Nicolai Buchwitz <nb@tipi-net.de>
Date: Tue, 20 Oct 2026 16:58:10 +0200
Subject: [PATCH 2/3] clk: bcm2835: register the BCM2711 GISB clock
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-devel-bcm2711-gisb-clk-v1-2-a1728724d0f8@tipi-net.de>
References: <20261020-devel-bcm2711-gisb-clk-v1-0-a1728724d0f8@tipi-net.de>
In-Reply-To: <20261020-devel-bcm2711-gisb-clk-v1-0-a1728724d0f8@tipi-net.de>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
 Stefan Wahren <wahrenst@gmx.net>, Phil Elwell <phil@raspberrypi.com>, 
 netdev@vger.kernel.org, James Clark <jjc@jclark.com>, 
 Nicolai Buchwitz <nb@tipi-net.de>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_075830_130007_881B2B61 
X-CRM114-Status: GOOD (  11.51  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The generator at CM offset 0x1d8 is not in any documentation I could
find, but the firmware calls it gisb and runs it at 200 MHz off
PLLD_PER with a 3.75 divider. GISB is the register bus of the STB
peripherals, and on BCM2711 the GENET MDIO controller clocks its MDC
from it. mdio-bcm-unimac wants that rate to work out the MDC period.

Mark it critical. The firmware enables it at boot and nothing in Linux
owns it, so it must never be gated.

Checked on a Raspberry Pi CM4 by moving the divider at runtime, the
MDIO busy time follows it.

Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
---
 drivers/clk/bcm/clk-bcm2835.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index 118df86d717c6..bc1de20c7e00e 100644
--- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -117,6 +117,8 @@
 #define CM_EMMCDIV		0x1c4
 #define CM_EMMC2CTL		0x1d0
 #define CM_EMMC2DIV		0x1d4
+#define CM_GISBCTL		0x1d8
+#define CM_GISBDIV		0x1dc
 
 /* General bits for the CM_*CTL regs */
 # define CM_ENABLE			BIT(4)
@@ -2097,6 +2099,20 @@ static const struct bcm2835_clk_desc clk_desc_array[] = {
 		.frac_bits = 8,
 		.tcnt_mux = 42),
 
+	/*
+	 * GISB clock (only available for BCM2711): the STB peripheral
+	 * register bus, set up by the firmware. The GENET MDIO controller
+	 * derives its MDC from it.
+	 */
+	[BCM2711_CLOCK_GISB]	= REGISTER_PER_CLK(
+		SOC_BCM2711,
+		.name = "gisb",
+		.ctl_reg = CM_GISBCTL,
+		.div_reg = CM_GISBDIV,
+		.int_bits = 4,
+		.frac_bits = 8,
+		.flags = CLK_IS_CRITICAL),
+
 	/* General purpose (GPIO) clocks */
 	[BCM2835_CLOCK_GP0]	= REGISTER_PER_CLK(
 		SOC_ALL,

-- 
2.53.0


