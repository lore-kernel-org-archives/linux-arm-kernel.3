Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B340AE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 14:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GSziykOcETJXtRshvlzLyAefoSJQU3xBdNaSEbesj9E=; b=fGd709YqwGWYe7iYEAvQbuA/qp
	qGHzOs/AxYKoQx0lnrW5NX4TO9kOY8b0V0q62dhjcrE+8L9UJE4kBgkNCijARen2D6dza3dDVFX1K
	7JMFRTJ6cFHOp9SNWtgEu4W4tXGkN2GtfibbuHUy5L3DV0RYtJGbOgMn24VXolbnmM9e/2r8K1Wtd
	2aX2/I4MESCbXBV2nmDlEjTxTaOl5Q/eXj3A4aj3h62voHv8d/UdWh2oUqSrYlkH6DFsd9CowzEnd
	/O1mdeA+Gg8nJ2pn48rrLVtNZOuyPOwCOXsO8RkxM6OVTlIR6tzopOOveVN7scGFFRZqTLH4cM41G
	VPxuI05A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVASu-00000005AtK-3WFj;
	Tue, 07 Jan 2025 14:21:52 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAJ7-0000000585u-12a6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 14:11:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736259105; x=1767795105;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GSziykOcETJXtRshvlzLyAefoSJQU3xBdNaSEbesj9E=;
  b=ASJcIhbBPoa4a34RZbaWPEa1DyDjiVzZskzG0KnCGM9QuX8yr29aiifV
   OpO/ipR4r7w0JK/AvHLMda4wWn253QSmtF7FVr9dULRvoh2hkdlMNr1Sy
   wgyaQjyRtVadyYnJIVbvIFrN48OHyGEW3n4M6EXaG9jAXSBa7cbIFEDI0
   14Pf9+K7E7y5trht7CyvL8rw9XUxZR1mO+whioDlzUH/nE5E2BuG48z56
   whaze6gZz4/mHspUxcrYtnNJvgwS/vtg8f72Red5A3bf80fT9c+5lPVOO
   fe4ISHLZGsQ9gS3D2SjF9dRegOa2T9zbyVIciRvj4D4hcEXNXjbSUrp8n
   w==;
X-CSE-ConnectionGUID: kxMB60KdT+G4CuezQ7yFOw==
X-CSE-MsgGUID: LuXc4tIoSFawpuNEB/hR9g==
X-IronPort-AV: E=Sophos;i="6.12,295,1728943200"; 
   d="scan'208";a="40896504"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jan 2025 15:11:43 +0100
X-CheckPoint: {677D361F-12-1CE016C0-E589DA3E}
X-MAIL-CPID: 8AFFBE8325C1AD0394BD2359E8593456_1
X-Control-Analysis: str=0001.0A682F1C.677D361F.0098,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9F9E6164748;
	Tue,  7 Jan 2025 15:11:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736259099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GSziykOcETJXtRshvlzLyAefoSJQU3xBdNaSEbesj9E=;
	b=jyBMhS0s735JCtIJr7ZDTkDUkB+26QdwHBy7EZGM6S8O1/GphbirVWkkwORkGsbVrhW8gZ
	ZOGNICOnoYzuGUd9lj24BmhwLlth5UpxtlPaY236jNfI/NsEIuriA3Xgdfnx5eqV8IDE0c
	rJTC1U48IpDkFSJlslZ54VMncwNvOiTANbtTmlutpK9k0Bs7ScqoxaKzpC3XeLSdJ9qafk
	KnlSTw8UETN9sCuf9cplIV8Ix7BuVk2gUHeWzXzdY1Acz+Fnr9CwwZuWQbWw7J4pncn3Sr
	H3VNn2NIHx7eiAjHHMDsFNny+554m9RaLSfGuIf5WXcg8DugQ6+Joy36CAT4SQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: tqma9352-mba93xx[cl]a: swap ethernet aliases
Date: Tue,  7 Jan 2025 15:11:17 +0100
Message-Id: <20250107141117.984652-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107141117.984652-1-alexander.stein@ew.tq-group.com>
References: <20250107141117.984652-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_061145_588575_E5CCA9A1 
X-CRM114-Status: GOOD (  12.15  )
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

In mainboard schematics ENET1 is eqos and ENET2 is fec.
This is reversed to standard aliases using base addresses for ordering.
Adjust aliases for all mainboards accordingly.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts | 6 +++---
 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
index b8ccc946c62d7..ebbac5f8d2b2d 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
- * Copyright (c) 2022-2023 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * Copyright (c) 2022-2024 TQ-Systems GmbH <linux@ew.tq-group.com>,
  * D-82229 Seefeld, Germany.
  * Author: Markus Niebel
  * Author: Alexander Stein
@@ -26,8 +26,8 @@ chosen {
 
 	aliases {
 		eeprom0 = &eeprom0;
-		ethernet0 = &fec;
-		ethernet1 = &eqos;
+		ethernet0 = &eqos;
+		ethernet1 = &fec;
 		rtc0 = &pcf85063;
 		rtc1 = &bbnsm_rtc;
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
index 2e953a05c590e..9e88c42c3d170 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
- * Copyright (c) 2022-2023 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * Copyright (c) 2022-2024 TQ-Systems GmbH <linux@ew.tq-group.com>,
  * D-82229 Seefeld, Germany.
  * Author: Markus Niebel
  * Author: Alexander Stein
@@ -26,8 +26,8 @@ chosen {
 
 	aliases {
 		eeprom0 = &eeprom0;
-		ethernet0 = &fec;
-		ethernet1 = &eqos;
+		ethernet0 = &eqos;
+		ethernet1 = &fec;
 		rtc0 = &pcf85063;
 		rtc1 = &bbnsm_rtc;
 	};
-- 
2.34.1


