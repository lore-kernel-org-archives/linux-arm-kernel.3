Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025ACCE7AAB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 10:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YZv8FVn813ocMF2VlBAmSIScmppLB+BVDIW42HgaCKw=; b=NHAr44+DjZyjvSo5qvpR7T0XsK
	QMKFUCAQb4oDMQPuvd6vOckBca+i8O4l4KA0t0Dz/fnGOf9MdzpuiQ98rKLJsQOFanI8WDI0N6pdI
	AkPTsIpL5D8Np8uuy74vb7/+gzYUjl5ZWvXaqX6lMIa26niWzh57AwBmameZPASIVzIEYaJFuXV1I
	F9YLD0QnKtvWG/P1P4xS7A7phsgHOPmeOWtdBRf0sBXrVqJslMPHBfL5X1Xv1Mry74wl/m285nJ0X
	h/Sl04Nz/ubBNWuRhshpEISvNPUc1+GweggTcSg3tph6PV/QA6RYizJY1JVPLsknu4nJE8xab7F8t
	HSd7j9uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJr8A-0000000C1mA-23g6;
	Fri, 14 Nov 2025 10:34:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJr84-0000000C1ix-3MCf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 10:34:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1763116448; x=1794652448;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KPMD6p9uhlCxkQRs7hFiFLlZgxILwM9Wd1Kk2DwCaLw=;
  b=rTEh/U0WDjo8lyYzgjIyCJOgOrsSpoxNTKp2xDx7QVbu0xzQVZzNS6fA
   45gxZz2VI+1VRkcNOp4eIjMg/y/psaTN8WdiuVx8TpES0DjOyQOYctB0T
   e+/dP6XSvcHUS9MhHzq/ZIrDlKl0i4zDBsUNfahDqwCKQVL6o1Imu2PoA
   +ZJ9KfvJJtnQ3TDGxr0x8Oqu4PzDx5W8GVniiiHBybzgRKKUzl0KgzBVf
   bGVXJ8X7d8Inq6Mend0T1ybqu03Lo4NfnrPsLxFlLXJc73+73LVB0vd5m
   VrFVXVnEbRYfgGsVEFPliu+y1qxVV04jikH56JXGGvLgE9onn8DN7Frfv
   g==;
X-CSE-ConnectionGUID: BJd5VjbhRg+8Cp44sya7Mw==
X-CSE-MsgGUID: V7oXaPY0R4WzV6ZtHHKvIw==
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="49627364"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Nov 2025 03:34:01 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 14 Nov 2025 03:33:38 -0700
Received: from ROU-LL-M43238.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 14 Nov 2025 03:33:36 -0700
From: <nicolas.ferre@microchip.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Ryan Wanner <ryan.wanner@microchip.com>, Cristian Birsan
	<cristian.birsan@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
	<stable@vger.kernel.org>
Subject: [PATCH 2/2] ARM: dts: microchip: sama7g5: fix uart fifo size to 32
Date: Fri, 14 Nov 2025 11:33:13 +0100
Message-ID: <20251114103313.20220-2-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114103313.20220-1-nicolas.ferre@microchip.com>
References: <20251114103313.20220-1-nicolas.ferre@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_023408_901609_29021202 
X-CRM114-Status: GOOD (  11.19  )
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

From: Nicolas Ferre <nicolas.ferre@microchip.com>

On some flexcom nodes related to uart, the fifo sizes were wrong: fix
them to 32 data.

Fixes: 7540629e2fc7 ("ARM: dts: at91: add sama7g5 SoC DT and sama7g5-ek")
Cc: <stable@vger.kernel.org> # 5.15+
Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7g5.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/sama7g5.dtsi b/arch/arm/boot/dts/microchip/sama7g5.dtsi
index 381cbcfcb34a..03ef3d9aaeec 100644
--- a/arch/arm/boot/dts/microchip/sama7g5.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7g5.dtsi
@@ -824,7 +824,7 @@ uart4: serial@200 {
 				dma-names = "tx", "rx";
 				atmel,use-dma-rx;
 				atmel,use-dma-tx;
-				atmel,fifo-size = <16>;
+				atmel,fifo-size = <32>;
 				status = "disabled";
 			};
 		};
@@ -850,7 +850,7 @@ uart7: serial@200 {
 				dma-names = "tx", "rx";
 				atmel,use-dma-rx;
 				atmel,use-dma-tx;
-				atmel,fifo-size = <16>;
+				atmel,fifo-size = <32>;
 				status = "disabled";
 			};
 		};
-- 
2.43.0


