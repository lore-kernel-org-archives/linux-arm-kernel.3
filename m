Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FE2CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 18:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vSJU4peJj+Pvauv54hPV1/HslESIG4pVWkh58D4A9/c=; b=wPZy47bJs6fGgb9sSlkonzEpGp
	ebWX/hhlv3+peCbAFfhpgF3SRINSUIlUVpSJjUxtpR4gXDwjGL9y/rwU3HHTXlPmSx7HKiElYlF9Z
	jBjyV/W5cKqJns7sXWGsG0PiNYvj1Hq++FxmrehxlqSgeG+Zc7A9jqK+tYIwEspIkkzBONnOhb8mj
	0CvR5deogjQY6ZUBRJuHivdKpwRx8A1hDBfVkP0Q31fDB72okQVUAg6bXeYrfxv/prjnEIwmbAiFr
	vP/c/ix3lgzT3jRiATt2UEaIv3yjgYBlxwDtFWtvCTGSBRewlv7+bkQRVA/rVgtSEBQCeSXaZBgyi
	rI3ydI2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEXKk-00000004bNt-1mP5;
	Thu, 30 Oct 2025 18:25:17 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEXKg-00000004bN7-18O3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 18:25:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7F94F1A1789;
	Thu, 30 Oct 2025 18:25:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4CC2860331;
	Thu, 30 Oct 2025 18:25:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3921E1180980D;
	Thu, 30 Oct 2025 19:24:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761848706; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=vSJU4peJj+Pvauv54hPV1/HslESIG4pVWkh58D4A9/c=;
	b=LcageyWgxYbyW3qRtqSBLny73lhZbVIesEoOXkAHs9iHO4lt9kUO+hc8vkIVeSDm2+HfJR
	MTQVRE4RK4fZ21SKCaahaDk6klLPcHTvysUYvkt5e+TRD037gCtRJeX66i8jEyKeoTjb/P
	DXr0jNMudu8Wp3sONhj/2AssyTKgoSyIDhCOIewXG3CFjxIWnkNHtCSc1uvfpJuHLmSmcB
	+9fQ2ZD1z+dqc+C6UjelZIb8UpEYFppAshc6Oy9nc6MlW942USNH/leAu8scetsDiPr32A
	fxfOGrjcqwCnS7yDylZpacXVgzkHa/ddaRi0gyVEr8QKVm/fCphs9RnrLdsHyA==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	=?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] net: stmmac: rename devlink parameter ts_coarse into phc_coarse_adj
Date: Thu, 30 Oct 2025 19:24:53 +0100
Message-ID: <20251030182454.182406-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_112510_797667_EA30B931 
X-CRM114-Status: GOOD (  15.67  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The devlink param "ts_coarse" doesn't indicate that we get coarse
timestamps, but rather that the PHC clock adjusments are coarse as the
frequency won't be continuously adjusted. Adjust the devlink parameter
name to reflect that.

The Coarse terminlogy comes from the dwmac register naming, update the
documentation to better explain what the parameter is about.

With this change, the parameter can now be adjusted using:
  devlink dev param set <dev> name phc_coarse_adj value true cmode runtime

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 Documentation/networking/devlink/stmmac.rst   | 21 +++++++++++++------
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  2 +-
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/Documentation/networking/devlink/stmmac.rst b/Documentation/networking/devlink/stmmac.rst
index e8e33d1c7baf..47e3ff10bc08 100644
--- a/Documentation/networking/devlink/stmmac.rst
+++ b/Documentation/networking/devlink/stmmac.rst
@@ -19,13 +19,22 @@ The ``stmmac`` driver implements the following driver-specific parameters.
      - Type
      - Mode
      - Description
-   * - ``ts_coarse``
+   * - ``phc_coarse_adj``
      - Boolean
      - runtime
-     - Enable the Coarse timestamping mode. In Coarse mode, the ptp clock is
-       expected to be updated through an external PPS input, but the subsecond
-       increment used for timestamping is set to 1/ptp_clock_rate. In Fine mode
-       (i.e. Coarse mode == false), the ptp clock frequency is adjusted more
-       frequently, but the subsecond increment is set to 2/ptp_clock_rate.
+     - Enable the Coarse timestamping mode, as defined in the DWMAC TRM.
+       A detailed explanation of this timestamping mode can be found in the
+       Socfpga Functionnal Description [1].
+
+       In Coarse mode, the ptp clock is expected to be fed by a high-precision
+       clock that is externally adjusted, and the subsecond increment used for
+       timestamping is set to 1/ptp_clock_rate.
+
+       In Fine mode (i.e. Coarse mode == false), the ptp clock frequency is
+       continuously adjusted, but the subsecond increment is set to
+       2/ptp_clock_rate.
+
        Coarse mode is suitable for PTP Grand Master operation. If unsure, leave
        the parameter to False.
+
+       [1] https://www.intel.com/content/www/us/en/docs/programmable/683126/21-2/functional-description-of-the-emac.html
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ba4eeba14baa..618d1b8dc2f0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7446,7 +7446,7 @@ static int stmmac_dl_ts_coarse_get(struct devlink *dl, u32 id,
 }
 
 static const struct devlink_param stmmac_devlink_params[] = {
-	DEVLINK_PARAM_DRIVER(STMMAC_DEVLINK_PARAM_ID_TS_COARSE, "ts_coarse",
+	DEVLINK_PARAM_DRIVER(STMMAC_DEVLINK_PARAM_ID_TS_COARSE, "phc_coarse_adj",
 			     DEVLINK_PARAM_TYPE_BOOL,
 			     BIT(DEVLINK_PARAM_CMODE_RUNTIME),
 			     stmmac_dl_ts_coarse_get,
-- 
2.49.0


