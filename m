Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D56D66BB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 04:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NIfsaqGGLD4bIowQXWIjJjs/aAa6vRtzahRUDG0bp60=; b=25KwjXBjlw5N2i/0uFFZ44tCqF
	dP5qj43Bju2NORDwwEzd7D+JKofxuxG2dzZtOWs68TwXS0BESA705j9JJIELHR/1yEa1ff1iwGU9z
	hCW22+ugXcGVuXhRakXLrIz9dU2awqxKATCr2rTGQTfUqh0gVdxa+mZ0aUL8sKD55el5m4cTmTW58
	luM3vMU/lRJoO83A8U8MGQKJaYZAa5niJGCsmrNb4DO72Oes2D/jYFg1foqHJrnORr3UofTtt0Z0u
	96FvKew5BBIF/asQmor1ajY1o6fk6Y5tkvKQ0NmKjz6idyQ2vYbYEc8iigaz6VIvzFXhGiIOZAH53
	h8ZP0qWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW5Hc-00000007m0u-1xKi;
	Thu, 18 Dec 2025 04:06:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW5Ha-00000007m0I-2C9W
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 04:06:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1766030791; x=1797566791;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nRePnQVf3FH7P7GpbLTar6MURmKFpPUdjJe2cr+xuSQ=;
  b=yE4TbpTFHVSVg9gr7Lg5/X58VWmE5XsfUpLIzhrqpaWtIxuwqNJTR5rS
   +xmlm2LEPnSXTWJM/cyhGbpW0cxkXMvszxcfhDIYvvEAMqHDGdnrs6t81
   2N6Oj1KjfO9PqcR1NEJGz6OK2+E521E87tr58R5OW/dLy/DOkbSY/OJyr
   g977STYjLkcsBgNGYqr3cKCVo+JS4RZUe5kEwwFoFUHL0YU3ZaBnChnAH
   wj9+Lk6ifKXMQLKYWMEPadBpB+MByF3DeNurbZZWU31aImxVRMjSEWpp2
   hLHJHrUVQQyJLeKKIVCdbHAR3eRLg14iO6LxZf0+Jv2Zju0iXb5KSj0o+
   w==;
X-CSE-ConnectionGUID: 8d83aKyqR/m/457MXLOS1w==
X-CSE-MsgGUID: jnoObdg+SLKDcH+b/+aY7g==
X-IronPort-AV: E=Sophos;i="6.21,156,1763449200"; 
   d="scan'208";a="282081579"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Dec 2025 21:06:28 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 17 Dec 2025 21:05:43 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 17 Dec 2025 21:05:36 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<manikandan.m@microchip.com>, <dharma.b@microchip.com>,
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC: Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH v2 2/3] mfd: atmel-hlcdc: Add compatible for sama7d65 XLCD controller
Date: Thu, 18 Dec 2025 09:35:20 +0530
Message-ID: <20251218040521.463937-2-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251218040521.463937-1-manikandan.m@microchip.com>
References: <20251218040521.463937-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_200630_570987_8B38611D 
X-CRM114-Status: GOOD (  10.20  )
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

Add compatible for sama7d65 XLCD controller.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
changes in v2:
- isolate this change into a dedicated patch
---
 drivers/mfd/atmel-hlcdc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/atmel-hlcdc.c b/drivers/mfd/atmel-hlcdc.c
index 4c4e35d404f3..c3f3d39bf584 100644
--- a/drivers/mfd/atmel-hlcdc.c
+++ b/drivers/mfd/atmel-hlcdc.c
@@ -140,6 +140,7 @@ static const struct of_device_id atmel_hlcdc_match[] = {
 	{ .compatible = "atmel,sama5d4-hlcdc" },
 	{ .compatible = "microchip,sam9x60-hlcdc" },
 	{ .compatible = "microchip,sam9x75-xlcdc" },
+	{ .compatible = "microchip,sama7d65-xlcdc" },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, atmel_hlcdc_match);
-- 
2.25.1


