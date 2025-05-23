Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B6BC54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 20:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SrQ/Uw0jQ4Y/nrdNr6KffbbNgedZURcnE2Oa81Q+gLI=; b=PmwkY1Q0/nYy+HoQt520MZUPfv
	8mZw4G/GlC5N3UC31NfSDroMNueW1PO7EzYtg9IJ6iXqc+o2vXvPrC+/smH9WuhbMlr74dnERW1i8
	Pis0YZa+VGvnqoSLT60Nr7SP09ZjN/XDcgppkOR0paMsieriaKQJBdE4QFDhrrNWQlYnDnus+AGlQ
	HIgtrDAqMpIvV1Zf/jgW50et+8Som3z9i43UuDkUCHE7/erIqnT8wRvGK2q6lgilIcoCbopbGbjgE
	GtW3+LGL2DDyh6JakpsJcubnVZ4eMFVgOf5YgHqjlqj9zsmVkz0QsHpmQE8hAgL5JWJSUByDaosH0
	NMc1W67w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIZ2P-00000004sRj-3Xvp;
	Fri, 23 May 2025 20:30:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIYwI-00000004rsK-2KYA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 20:24:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1748031862; x=1779567862;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=slgQ4tGw0dIzbPUtpd9MpwQXa0+Hq2+4GkuyaOoSWEw=;
  b=SR3lVaZy+cVPOIn3ykg4RiMTmtRDTPT3KUE3wKYb4cMX94SWgB2F+xZm
   Kc2XFgbBO1j94oSXgnMDA8iKlpNVMa7xD/HDh38Pz8EQXd1yPOF3y6z2T
   3vq+aAV33F+eg0a3TR34iPFHT59/r3epx11xXlzSuSuED0f1skwhRhHt7
   FuuFACdjDunb0UC/N7uVc2UuuAGH30sgruvCEjaCU8BpMt9TbkTfoqEu1
   ftjZGAKsC8JnDthFAMX/it65ylC2E17K+K8E6vimUnobWYpPK9jhMCc0T
   5ckCJ4IYMLsxPPyjaLQwKNpXeXwYP4CEbtVZN6zqJFITKVK7JvP6zJkiy
   w==;
X-CSE-ConnectionGUID: KBUIaMEtQL+E9GaMz9Liiw==
X-CSE-MsgGUID: MjZoIeOOQDCXgZgMCuSc1Q==
X-IronPort-AV: E=Sophos;i="6.15,309,1739862000"; 
   d="scan'208";a="46850862"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 May 2025 13:24:18 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 23 May 2025 13:23:58 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Fri, 23 May 2025 13:23:58 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH v4 2/2] ARM: dts: microchip: sama7d65: Add clock name property
Date: Fri, 23 May 2025 13:24:31 -0700
Message-ID: <f6ae8a38a005e1a4e025b25ddb29113c5e65dead.1748030737.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748030737.git.Ryan.Wanner@microchip.com>
References: <cover.1748030737.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_132422_597653_5943379C 
X-CRM114-Status: GOOD (  11.01  )
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

Add clock-output-names to the xtal nodes, so the driver can correctly
register the main and slow xtal.

This fixes the issue of the SoC clock driver not being able to find
the main xtal and slow xtal correctly causing a bad clock tree.

Fixes: 261dcfad1b59 ("ARM: dts: microchip: add sama7d65 SoC DT")
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index b6710ccd4c36..7b1dd28a2cfa 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -38,11 +38,13 @@ cpu0: cpu@0 {
 	clocks {
 		main_xtal: clock-mainxtal {
 			compatible = "fixed-clock";
+			clock-output-names = "main_xtal";
 			#clock-cells = <0>;
 		};
 
 		slow_xtal: clock-slowxtal {
 			compatible = "fixed-clock";
+			clock-output-names = "slow_xtal";
 			#clock-cells = <0>;
 		};
 	};
-- 
2.43.0


