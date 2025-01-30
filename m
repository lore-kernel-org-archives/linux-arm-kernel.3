Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B1AC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 17:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C9yzuy/hCu3rHENMmx7FK/Z31G+DGhL7umJKq+lpB3Y=; b=FYA+qVBhpukiP9C+WMOaqTsekN
	a7mQHCbW/K0sJINDtEaLLJznLHRmfTZA+K/XapTGSyR2tQPlM4fXuOKs9/9RsP1Mr6xGxMYlPsuBp
	SdNrvPGyMktoJTNfPQ1VF16yVmdVCDrq2Zw95qEnEGwZXA/J6P3LQ3F6zwpag4lUwEsLVjwnE6oRO
	cPTC0pfEURzw1yvASWgRJpvulXgu5aXAuclAsq+APgWmugJXmZmhhY/NlPE2OFxeDd6sUvXv/+ixS
	lN/51Y2Tta2VTCNncPXm4ZIUASXmkD7ig/GJGRdFkUuawPuhU6lKZaesDS2pumDsAK4z5cDWdgh5B
	rZg6pZEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYcV-00000009K3z-0Hbm;
	Thu, 30 Jan 2025 17:46:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYSj-00000009IQp-3Whq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 17:36:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1738258581; x=1769794581;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wa8ECnu6CyfdlnXkwmsrBtJZO5peBMV8tGUtH+OXnzI=;
  b=DNOFYuRNBTfhG6a4YEC9rxi5eMyxd3gXXhbJna69hyORpAYOfuTFLVV+
   25MkBwa6CeCHVXmkUMZyfeG0mpckD4Bt2qBCfEPsPGpnGPw8vG143oWMT
   gRRQISG8x7cicDrzDgxB0KVsiGRlpOgHmdBw3g6CyaEPeH2sNwrkvDXCJ
   weoBN2Mbl+jwHyCLha/+S5lyEWbglE+BCYKyEiNZ7SZVeaqjaoFrXadBw
   gXiraz+lZHYFqKG/MLMmzV8q6WO6VucDcZULfx5zZtUFrz3PAHAVZ/1vt
   psxpEFPDA/xlfQD2DLMlMct7xsLh0QYm8g7GJK6QyvT+6ixwwGXoG7I7K
   A==;
X-CSE-ConnectionGUID: Qux6TnwtQkq+U6Cg6JCAlA==
X-CSE-MsgGUID: lQ+ziQvMTPGAC6ahOBG+6g==
X-IronPort-AV: E=Sophos;i="6.13,246,1732604400"; 
   d="scan'208";a="204623005"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Jan 2025 10:36:20 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 30 Jan 2025 10:35:39 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 30 Jan 2025 10:35:39 -0700
From: <Ryan.Wanner@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <claudiu.beznea@tuxon.dev>, <sre@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<p.zabel@pengutronix.de>, <linux@armlinux.org.uk>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH 01/16] dt-bindings: mfd: syscon: add microchip,sama7d65-ddr3phy
Date: Thu, 30 Jan 2025 10:33:41 -0700
Message-ID: <01181325b16c78ac50b8bab3f178b14e8f417892.1738257860.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738257860.git.Ryan.Wanner@microchip.com>
References: <cover.1738257860.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_093621_940568_E6CBB554 
X-CRM114-Status: UNSURE (   8.22  )
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

Add SAMA7D65 DDR3phy compatible to DT bindings documentation

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index b414de4fa779b..54a6d5957e13a 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -188,6 +188,7 @@ properties:
           - microchip,lan966x-cpu-syscon
           - microchip,mpfs-sysreg-scb
           - microchip,sam9x60-sfr
+          - microchip,sama7d65-ddr3phy
           - microchip,sama7g5-ddr3phy
           - mscc,ocelot-cpu-syscon
           - mstar,msc313-pmsleep
-- 
2.43.0


