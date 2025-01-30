Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BFD6C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 17:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2dbuzniSTALeu5gATpSt+l72PnszdVbrP0zWbVMW3ko=; b=Hy2Gglwy+/ZQJlNATKmUeca6JF
	3x+xfQ6p1iMZU1MIKckzibjdOIX7jfBY3bgxDTsWUV/OuYr/g4hGIRTw1xHPNLifxm1vnXkebU8uC
	wE/L9Aa11cX1kE64zg5AHpZq5yEVIGro9NzCEkpyBOMKeN3reXT9/tUyJEKhWelOmXJXC3c0JGsDQ
	94dZrdOjZlyVavYvRe7tOt0jPdLNk6L7fIRslWWle/oSsJ+FFZ7YqfkdClQDfT6uUZFcldjJFdexJ
	aE6RT3kQxBNPMyzdLoeDBfGeVjME0GKpPxRCeHmGuH6SW2CZckY1bA8kEzLuTvFapTFpWs+DFfjLr
	7kPhKRxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYUo-00000009IuG-0K7N;
	Thu, 30 Jan 2025 17:38:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYSD-00000009IIu-0UgE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 17:35:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1738258548; x=1769794548;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q6EhuaD18bf95yOzyUc9NiJbUcTYlA0vWWENLIJPl9s=;
  b=cHDOUqUkJwmBwgtLuf7fEc7SVjbUDB4sGSzWSyE+XrRhZ29ligR6Ct8a
   6E85baWQWuxzG5EdfaYiFx616akLlW00v1fVJT4VFzSrw9Nxc0KSXpevp
   7s6ZnzKqPXrZHPJJKmuM5189i/wXjhOZYC9+zUbSgHRGl0OcifkkZibj1
   RvK4Vy51FBeD65LpopUgFr6rq8HgoWeKe3dW0Cizz/Sc077Cl09VcnQZ5
   iYCnuTR4tsrct6SxrGyKXv6iWLjgZvHXAK8jtUYNfRhqinFt3rVz81f99
   49cT4gr4NJduJC0Yingox+jRVVGEjPH4ctr/ueEfXcPoG6ynrjZM8jiJR
   w==;
X-CSE-ConnectionGUID: X8noN3xrSZmPEckyVo5bzw==
X-CSE-MsgGUID: sNfM+dQtQcSRiVUIUf6Mlw==
X-IronPort-AV: E=Sophos;i="6.13,246,1732604400"; 
   d="scan'208";a="204622973"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Jan 2025 10:35:45 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 30 Jan 2025 10:35:41 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 30 Jan 2025 10:35:41 -0700
From: <Ryan.Wanner@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <claudiu.beznea@tuxon.dev>, <sre@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<p.zabel@pengutronix.de>, <linux@armlinux.org.uk>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH 14/16] power: reset: at91-sama5d2_shdwc: Add sama7d65 PMC
Date: Thu, 30 Jan 2025 10:33:54 -0700
Message-ID: <bdf9259be651517998481f1518b2129f65841d96.1738257860.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738257860.git.Ryan.Wanner@microchip.com>
References: <cover.1738257860.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_093549_216678_6CA2907A 
X-CRM114-Status: UNSURE (   9.89  )
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


