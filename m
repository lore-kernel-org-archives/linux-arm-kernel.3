Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72F5C021A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 23:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yIGNuTpvpVrL4ELKdGSaVxLGBhMzqwWp/t71jqGm0X8=; b=Oz8Q4XLF4VifkNPE0FzlbyJy2G
	gVUA2h/4tRM6gUuJxEbZWxJiWs+43057BgiO5awJgTbzMLNAbAk6UKv8akuws65ev11ZJf8FDmQNf
	4M6nq0JNomde8G0J9WtI0EP7lgDHnb4TII79098z2GQ13YG9gg4Qi55wjMBR+bhKnIu6G9COykutD
	UFJ2moj5ZdT7AQO/5c9SeLdI2fH2qRn6WO/nE2+T0a+ncyuv6kX+kI3D8/6goHH0S9yOye+/nkRue
	bPzUtiRKBQA++/+t97rJv9y5TINDeH0tqhXK9UzEofyVYcVOcd/AixGFQe0f/z67hUnqgdK0N4Vqn
	PjDt+A4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thdOT-00000001saw-4ArK;
	Mon, 10 Feb 2025 23:40:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thb6V-00000001SVB-3SBz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 21:14:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1739222047; x=1770758047;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aiQoWYNRJ/dv2h1OgqJMCbQ0EI2M94Iym3ylq7+qTuU=;
  b=wmO2pMioHZ6Rt7o2L6V6WbuCpDP3tccv5mgVjs666apiU5kY7YFL0duX
   YC9enOqWPwF72T8Z+tptCDFCF+CaI1O4dkcZ8Zq5a7zI+EsdJ4FFSXisW
   GnPQLZeyG5nN0VZUFOYDpt7UcA2T+QU8aRqnh8lLf1hWU+hBTNpPvIn3A
   2qMPfOq19qsQPbwCA1fojhcBCu4Ei+IOUpIsLrQYWOykQhYpw/WQ4sda1
   QmsRnnJX6Wk7Wjo+ATtkizEYvZv+0PpEMF6HlOYbOndFASykIkBQQ91FH
   cW21OVtvSk9mG03oYXV+fOYdF8qAZJzBKkdWvCDrLlAPJ8ixqoOH8epCN
   A==;
X-CSE-ConnectionGUID: AYqW9AG9RbOJ2Xf8Pt97Yw==
X-CSE-MsgGUID: jEPCBY4XTh2OhSwp14lhMQ==
X-IronPort-AV: E=Sophos;i="6.13,275,1732604400"; 
   d="scan'208";a="205027966"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Feb 2025 14:14:03 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 10 Feb 2025 14:13:45 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 10 Feb 2025 14:13:45 -0700
From: <Ryan.Wanner@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <claudiu.beznea@tuxon.dev>, <sre@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<p.zabel@pengutronix.de>
CC: <linux@armlinux.org.uk>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-rtc@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH v2 02/15] dt-bindings: mfd: syscon: add microchip,sama7d65-sfrbu
Date: Mon, 10 Feb 2025 14:13:02 -0700
Message-ID: <4cac19e32295c708d72b9fc6ba342b5c961fb6c3.1739221064.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739221064.git.Ryan.Wanner@microchip.com>
References: <cover.1739221064.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_131407_926191_0839F148 
X-CRM114-Status: UNSURE (   7.50  )
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

Add SAMA7D65 SFRBU compatible string to DT bindings documentation

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 51d896c88dafa..727292ffe092e 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -91,6 +91,7 @@ select:
           - microchip,mpfs-sysreg-scb
           - microchip,sam9x60-sfr
           - microchip,sama7d65-ddr3phy
+          - microchip,sama7d65-sfrbu
           - microchip,sama7g5-ddr3phy
           - mscc,ocelot-cpu-syscon
           - mstar,msc313-pmsleep
-- 
2.43.0


