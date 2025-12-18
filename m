Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB6ABD66BB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 04:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+KwMPFcc1f0xCCW9aI7cnHcjQSe7lFiEYUK7v3yMeWU=; b=Wf+OLD002CIw6KjahZzdFOjH+m
	xUby/OwmPuvTYvx04w3z8diA3tdBFeqwEXji81z5TpXLne9PaJS3TAwOFUkpgoqR5Gj/a9CAYm5rb
	M3/+sp6uFrgC9FPv8tYte5SQ0I0gWIXH/qoO9zGMsc/6N3ZHu5vj70US3xKQfH13RxaZYd8vv/KIV
	aTa8oRnK3xV4gS4IyLLpDn54wV+YJvRz6M40i1WVKqIdRbzf5NaV4/45PlMqgGaPGb4xwJbNVPxYL
	1E3HfheyUz+pLP89sa8DJXKYyO7TP7V2DZQDoBQyuLsQhVD2j6+FaOFY+ZgWv48yTPx/EONT6uUpL
	LE43nVHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW5HR-00000007lzL-0dBD;
	Thu, 18 Dec 2025 04:06:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW5HN-00000007lyu-1Sn1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 04:06:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1766030777; x=1797566777;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OF2PUxH2qRVusojO/w+86bR0YYO5hGWehmU/Y3eJPmE=;
  b=G9PlxjLt0SM8oRERLls6sxiLdu3ibous5JxbXXlwLSv1j99vJHjDol3Z
   BDZ/hZWIuIvwcNiMmlyTaJnXLCLuvMNQh8HWDimqBmFr7/yH2+zmc76OK
   YynBBqBrhPO9qL3COdbhHU3aaYJZWyCZB7t0hvLmIg4kb5nZN7aW0Dxfj
   mAwgHEd6HvkhwJFeOsi1fnTwhXumJRGijD9kJkGv0eJP2v3WFzGqOyya6
   s1m5/BmDOoUnuA/IE9xumY54UomDqILsn9WpZYvruCiK6Iw5dZUkzXwAP
   gY4egqBkBSL7jJbA9n6wjzQPlQrhNZMKCL5HswW4Kn8qN6o4VKu9wEtOS
   A==;
X-CSE-ConnectionGUID: ERyhO/A+SXOvLHDrUOSkIQ==
X-CSE-MsgGUID: H5O1PS6JT4aSd/uQWyIgLA==
X-IronPort-AV: E=Sophos;i="6.21,156,1763449200"; 
   d="scan'208";a="218033974"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 21:06:12 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Wed, 17 Dec 2025 21:05:32 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 17 Dec 2025 21:05:26 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<manikandan.m@microchip.com>, <dharma.b@microchip.com>,
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/3] dt-bindings: mfd: atmel,hlcdc: Add sama7d65 compatible string
Date: Thu, 18 Dec 2025 09:35:19 +0530
Message-ID: <20251218040521.463937-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_200617_620343_029EC7E9 
X-CRM114-Status: UNSURE (   7.60  )
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

Add LCD compatible string for sama7d65.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml b/Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml
index 4aa36903e755..dfee8707bac2 100644
--- a/Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml
+++ b/Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml
@@ -25,6 +25,7 @@ properties:
       - atmel,sama5d4-hlcdc
       - microchip,sam9x60-hlcdc
       - microchip,sam9x75-xlcdc
+      - microchip,sama7d65-xlcdc
 
   reg:
     maxItems: 1

base-commit: e8c28e16c3ebd142938aee296032c6b802a5a1d4
-- 
2.25.1


