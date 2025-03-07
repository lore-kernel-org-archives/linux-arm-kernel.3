Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A8DC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 01:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCm07eiAy40sXVeUGzvtqRiyDKCwKfW9Hl3rcCooMp0=; b=2hBKNm5el8xDZ4GkCJ6ey9IF/H
	XzmRi6o07fvb+2/gOBHfYvtnvJMvxrDGttttcOkF/97P/72RMYsv24IbRlPKdBXsg2ii0KelB7Tfl
	9dJ8V5qfJRUED2fuHJI+xH5sd81MSe+qQyIk7XtK4mgJVATdfWWlYV3VDs3myB1SWQZvLLhuLh2m4
	rm6lny7L//0ZB5Of1ZMSgKHlaT+LTkmWOVT48WlkgIt8dhYCCFYR7I9JyXmXyRs5NJWBh4p+V1kbt
	mgT6iH0VgL5YLUAZsDwS2GgWj3VpuCy9dvfg+j4BEZZ9sVTqjvX0lv6CBdkPuaZkPYBhzA9kwWzWi
	HNVaMVgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqMDO-0000000Ckfd-1qqr;
	Fri, 07 Mar 2025 01:09:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqM1r-0000000Cht7-1RqI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 00:57:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 667782103;
	Thu,  6 Mar 2025 16:57:43 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D91003F5A1;
	Thu,  6 Mar 2025 16:57:28 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: [PATCH v3 04/15] watchdog: sunxi_wdt: Add support for Allwinner A523
Date: Fri,  7 Mar 2025 00:57:01 +0000
Message-ID: <20250307005712.16828-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250307005712.16828-1-andre.przywara@arm.com>
References: <20250307005712.16828-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_165731_420766_2AA42F53 
X-CRM114-Status: GOOD (  14.05  )
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

The Allwinner A523 SoC comes with a watchdog very similar to the ones in
the previous Allwinner SoCs, but oddly enough moves the first half of its
registers up by one word. Since we have different offsets for these
registers across the other SoCs as well, this can simply be modelled by
just stating the new offsets in our per-SoC struct.
The rest of the IP is the same as in the D1, although the A523 moves its
watchdog to a separate MMIO frame, so it's not embedded in the timer
anymore. The driver can be ignorant of this, because the DT will take
care of this.

Add a new struct for the A523, specifying the SoC-specific details, and
tie the new DT compatible string to it.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/watchdog/sunxi_wdt.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
index b85354a995826..b6c761acc3de6 100644
--- a/drivers/watchdog/sunxi_wdt.c
+++ b/drivers/watchdog/sunxi_wdt.c
@@ -236,10 +236,21 @@ static const struct sunxi_wdt_reg sun20i_wdt_reg = {
 	.wdt_key_val = 0x16aa0000,
 };
 
+static const struct sunxi_wdt_reg sun55i_wdt_reg = {
+	.wdt_ctrl = 0x0c,
+	.wdt_cfg = 0x10,
+	.wdt_mode = 0x14,
+	.wdt_timeout_shift = 4,
+	.wdt_reset_mask = 0x03,
+	.wdt_reset_val = 0x01,
+	.wdt_key_val = 0x16aa0000,
+};
+
 static const struct of_device_id sunxi_wdt_dt_ids[] = {
 	{ .compatible = "allwinner,sun4i-a10-wdt", .data = &sun4i_wdt_reg },
 	{ .compatible = "allwinner,sun6i-a31-wdt", .data = &sun6i_wdt_reg },
 	{ .compatible = "allwinner,sun20i-d1-wdt", .data = &sun20i_wdt_reg },
+	{ .compatible = "allwinner,sun55i-a523-wdt", .data = &sun55i_wdt_reg },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sunxi_wdt_dt_ids);
-- 
2.46.3


