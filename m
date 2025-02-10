Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A4CC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 21:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2dbuzniSTALeu5gATpSt+l72PnszdVbrP0zWbVMW3ko=; b=SKssfLFQXmbHGHRz5JCnx1dRfh
	YpvxbngXljK9Xot99T3cosNmMQejrLMTCeigv/+6L7da+IlL0kwixdO/jDAlcY6jP7gVgBhva7tJS
	CO3cVRt4hQMvFnp559WEH7rrPVdFHiCdS1kkG87ftr49TVANFNqMhDK1o6xvyWcO108O1pfwSQPy0
	wQasbVGxFBNyS4geYGbn3YtRmnu7D4QyT/IpdZhBw4AHa3xMHtEU8KL5IgbtGc66zQP/RwmW1nE5A
	rPGC4PV6iOSsI8CeeDVzkQRcs1TYPGXss+XRhrmmPAfc78wF8Duc+8BfuGBf92Qil2jgRKT/35c7t
	opldkVEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thbVP-00000001WRs-3MoO;
	Mon, 10 Feb 2025 21:39:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thb6a-00000001SUf-1TOJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 21:14:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1739222052; x=1770758052;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q6EhuaD18bf95yOzyUc9NiJbUcTYlA0vWWENLIJPl9s=;
  b=p7kKmRWNj2B9hxl/pUkJ3FmaMFKaPQkPOYM2V4T9Xrf75lpRPlgoXgFW
   LlOsAz4eUv7hKhGLrdvyT/St+9gMAIeP0R2Ihd83gMWpCofqA9mZcHVjT
   PyCU/zy+TAGPMNJw60JvzWyBSxqsCDhI61Mbq5Udj5mA79hoSQSaYdaDd
   KlvANYxStT6Xvn40IYY3wlK7XkwVuOk6YaW/ekOJzpj/WjupsvCRJuMzA
   Bt283W+z48ioucamtOr7BZBVu953NEbLG9XnWZdCSSAYP7V5307HL5xB3
   goHqseJIEajbFn1FfqWqQMBp0TkbOr10wdzorZ+hXoSxWzLB4z7OXA5Fc
   w==;
X-CSE-ConnectionGUID: AYqW9AG9RbOJ2Xf8Pt97Yw==
X-CSE-MsgGUID: TtqIL6VfTqq+6rCYBPi7Ew==
X-IronPort-AV: E=Sophos;i="6.13,275,1732604400"; 
   d="scan'208";a="205027991"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Feb 2025 14:14:07 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 10 Feb 2025 14:13:47 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 10 Feb 2025 14:13:47 -0700
From: <Ryan.Wanner@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <claudiu.beznea@tuxon.dev>, <sre@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<p.zabel@pengutronix.de>
CC: <linux@armlinux.org.uk>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-rtc@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH v2 13/15] power: reset: at91-sama5d2_shdwc: Add sama7d65 PMC
Date: Mon, 10 Feb 2025 14:13:13 -0700
Message-ID: <e3bde200e4b8efe69656f1ecc9e8e7c5c6f631a5.1739221064.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739221064.git.Ryan.Wanner@microchip.com>
References: <cover.1739221064.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_131412_448331_85FC3448 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Add sama7d65-pmc compatible string to the list of valid PMC IDs.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/power/reset/at91-sama5d2_shdwc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/power/reset/at91-sama5d2_shdwc.c b/drivers/power/reset/at91-sama5d2_shdwc.c
index edb0df86aff45..0cb7fe9f25a07 100644
--- a/drivers/power/reset/at91-sama5d2_shdwc.c
+++ b/drivers/power/reset/at91-sama5d2_shdwc.c
@@ -326,6 +326,7 @@ static const struct of_device_id at91_pmc_ids[] = {
 	{ .compatible = "atmel,sama5d2-pmc" },
 	{ .compatible = "microchip,sam9x60-pmc" },
 	{ .compatible = "microchip,sama7g5-pmc" },
+	{ .compatible = "microchip,sama7d65-pmc" },
 	{ /* Sentinel. */ }
 };
 
-- 
2.43.0


