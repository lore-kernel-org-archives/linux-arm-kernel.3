Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB69C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 17:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OYn6F3avixjtER6E0ohkY1hi7mX0fUkF12CsoRFU9/k=; b=kiNNBe3dnWNX9sYLEtpi1ta1PC
	wyLkUzhyIaOC6HfggeS+BlLMSCIJPbO/YUC12s+QByru5nfND3TUU/jAYJUdlFWDZL5NCwHbc3Qnv
	3RdsZ5T1w9Ygeo8diboVQr3s0p7siz9wpi+uWrh7FQ4w+P4717SH9VEjL/kEx1bakPG2v8MDB5jnZ
	fEacdtR1UkuV06O9W0wXQG9ZJzGszzjhVJIV+2RdXYzy29+hzE7MnRmZf6YzlWK6tjcwTwqylPR4X
	Y9jwaa3F5Euo4ty2XhhkezrPZLMNbfPm5Qa6h6QcXh5CyxZkDhvw5mNN4y6UbbJyFGQSBCX4aHdtb
	vpwQaZuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umEr3-0000000EVOi-1qK6;
	Wed, 13 Aug 2025 17:01:37 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umE9U-0000000ELkL-3tMP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 16:16:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=OYn6F3avixjtER6E0ohkY1hi7mX0fUkF12CsoRFU9/k=; b=PmD+yI
	vxRAKaGAXHba17GAjQPiz7VPVfkfzMuO6zPxsF1nZa9rVY9CeAaEqnG7TAD41SMS
	R5xL6MkdHdi+wybfV4oir8xCoY906vOOCo4nvVWtAGKXDTG7k0SFV0/lx269u0Ah
	zqrAAh0BIugpdiD/qAMcRQIIep/oYijYEChahm2FVrjxfgTd0nGNW12fr0T03NTz
	dd4LHlmwDBip4OJC+GrvXSJkA51U/V9Bxr6hH27NQWC75e4Nu6I1I0h8lTiU2zlK
	fugrvsMltZjD55+XQromft7/jqKW5muWgDoWzF7TJYYl2p4egtdSldez7VIOOwjJ
	+kBv/8blVSmjwt+g==
Received: (qmail 695593 invoked from network); 13 Aug 2025 18:16:27 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Aug 2025 18:16:27 +0200
X-UD-Smtp-Session: l3s3148p1@cDWKekE8xJFtKLKq
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 17/21] rtc: remove unneeded 'fast_io' parameter in regmap_config
Date: Wed, 13 Aug 2025 18:15:03 +0200
Message-ID: <20250813161517.4746-18-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_091637_240329_C86CCBB9 
X-CRM114-Status: GOOD (  10.49  )
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

When using MMIO with regmap, fast_io is implied. No need to set it
again.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
No dependencies, can be applied directly to the subsystem tree. Buildbot is
happy, too.

 drivers/rtc/rtc-meson.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-meson.c b/drivers/rtc/rtc-meson.c
index 47e9ebf58ffc..21eceb9e2e13 100644
--- a/drivers/rtc/rtc-meson.c
+++ b/drivers/rtc/rtc-meson.c
@@ -72,7 +72,6 @@ static const struct regmap_config meson_rtc_peripheral_regmap_config = {
 	.val_bits	= 32,
 	.reg_stride	= 4,
 	.max_register	= RTC_REG4,
-	.fast_io	= true,
 };
 
 /* RTC front-end serialiser controls */
-- 
2.47.2


