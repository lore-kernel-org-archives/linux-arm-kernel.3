Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED25C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 11:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kxBgsRHLe2JLhXvC8qfuzqvvFxyHAUTzqjhu1n3cZA8=; b=Ew+Y7J3pAYejPBvt6sH0owzP7Q
	yJBWwoGFUAH+tt77nSi/2umSloJ/wXu7YSgn9ZfQXf5y9UjzJXwWyJ5Vp9Cn1T2ei9Lmygb4gYDFc
	KJyA0t1FEvvLhRbHof8Ap4P+0wsKxrZZ3EkixWs+HuDx170D719oyOv48Oi5GFqCwiyLS0n9j3R4E
	czlY0551kR00+cAomKYfJfWoEsB3mqqHkWiiXesjauNC87eGFXmU4DFUqtjPfs7HgLerNPmY/QjwV
	Iq1VRQI2WKskvL0MqrOB9uLHZLc0kfct6ycjJUuVvbEAsKZbtx0qVH488gMaVCIdAOFB63Zzji1QP
	z3UpqpTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc0Ww-00000007aP8-2PZV;
	Wed, 16 Jul 2025 11:42:34 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc0BU-00000007XcD-3bFo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 11:20:26 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56GBJwDo2491029;
	Wed, 16 Jul 2025 06:19:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752664798;
	bh=kxBgsRHLe2JLhXvC8qfuzqvvFxyHAUTzqjhu1n3cZA8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=oWVUYlvOwyoTTQGGYrTBib5lM0Wcye5iQfq3n0NI6wB6X54Ton9ggrR7A+l8F5xRX
	 +rzFBOen79ZcGYl8vsS8eefZZzyDepIdNFRfvGjVu2X+B9dhBG8qMdnkCWXm7S5x/r
	 HYIvWLwZju7zeEX51uAXZ5aHS9xoFyJdSFQstPf8=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56GBJwjP1343275
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 16 Jul 2025 06:19:58 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 16
 Jul 2025 06:19:57 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 16 Jul 2025 06:19:57 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56GBJep1344714;
	Wed, 16 Jul 2025 06:19:50 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <linux@armlinux.org.uk>, <ardb@kernel.org>, <ebiggers@kernel.org>,
        <geert+renesas@glider.be>, <claudiu.beznea@tuxon.dev>,
        <bparrot@ti.com>, <andre.draszik@linaro.org>,
        <kuninori.morimoto.gx@renesas.com>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <heikki.krogerus@linux.intel.com>, <kory.maincent@bootlin.com>,
        <florian.fainelli@broadcom.com>, <lumag@kernel.org>,
        <dale@farnsworth.org>, <sbellary@baylibre.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <dagriego@biglakesoftware.com>, <u-kumar1@ti.com>,
        <y-abhilashchandra@ti.com>
Subject: [PATCH V2 1/4] MAINTAINERS: Update maintainers of TI VPE and CAL
Date: Wed, 16 Jul 2025 16:49:09 +0530
Message-ID: <20250716111912.235157-2-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250716111912.235157-1-y-abhilashchandra@ti.com>
References: <20250716111912.235157-1-y-abhilashchandra@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_042024_944841_39585AAD 
X-CRM114-Status: GOOD (  11.77  )
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

Benoit has moved to work in other technical areas, and Yemike Abhilash will
maintain these modules instead of him.

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7b6b13c01ba7..ea4b29c8b6b5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25205,7 +25205,7 @@ S:	Maintained
 F:	sound/soc/codecs/twl4030*
 
 TI VPE/CAL DRIVERS
-M:	Benoit Parrot <bparrot@ti.com>
+M:	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	http://linuxtv.org/
-- 
2.34.1


