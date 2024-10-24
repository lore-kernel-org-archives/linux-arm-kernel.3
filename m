Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76636D0BB6A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 07:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NV4BJB1hebCHxZfRKBVABAwnVrIkc01gp5Jshymh+3M=; b=TYTMvqsmMsjkwXG5sVW2tkqIov
	vITtGmpVyu7fqwheqPZCJ5NF5vaJ2MDk5Ugaooxfk7uIJ6s+022TAnxxoTc12qjuUjyai7GY4aChV
	IFvWxWmiKnc3gWaN++8c1fnBmfh54Q6tF3p3f5Nxa6pkOYS4K3j6eXCUOuQRkpcso1wJMWn86tNtZ
	6aQv5VK9yPedK6dOfFGDK59dlVi3vTDl8djnhfIu5ZpjHDfQV7x+g0poeLd8nJ5LdpmcR5CPVcbMP
	Df2Hg014m2L+XORKHxupUSRzVNxdKaX5R4Qshgb33I0qq2nnjDlVjk9Jm0XzfYMvBaJ7YNcn92gJG
	2knyz2qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3sGl-0000000H5pp-3Dek;
	Thu, 24 Oct 2024 07:28:31 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3s4Z-0000000H3j5-2cHX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 07:15:57 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 24 Oct
 2024 15:15:48 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 24 Oct 2024 15:15:48 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <jdelvare@suse.com>, <linux@roeck-us.net>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <ukleinek@kernel.org>,
	<billy_tsai@aspeedtech.com>, <linux-hwmon@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <BMC-SW@aspeedtech.com>
Subject: [PATCH v1 1/2] hwmon: (aspeed-g6-pwm-tacho): Extend the #pwm-cells to 4
Date: Thu, 24 Oct 2024 15:15:47 +0800
Message-ID: <20241024071548.3370363-2-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241024071548.3370363-1-billy_tsai@aspeedtech.com>
References: <20241024071548.3370363-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_001555_684045_A766CF03 
X-CRM114-Status: GOOD (  10.13  )
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

Add an option to support #pwm-cells up to 4. The additional cell is used
to enable the WDT reset feature, which is specific to the ASPEED PWM
controller.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
Change-Id: Iefcc9622ac3dc684441d3e77aeb53c00f2ce4097
---
 .../bindings/hwmon/aspeed,g6-pwm-tach.yaml    | 25 ++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml b/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
index 9e5ed901ae54..0cc92ce29ece 100644
--- a/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
+++ b/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
@@ -31,7 +31,11 @@ properties:
     maxItems: 1
 
   "#pwm-cells":
-    const: 3
+    enum: [3, 4]
+    description: |
+      The value should be 4 to enable the WDT reload feature, which will change the duty cycle to
+      a preprogrammed value after WDT/EXTRST#.
+      The range for the fourth cell value supported by this binding is 0 to 255.
 
 patternProperties:
   "^fan-[0-9]+$":
@@ -69,3 +73,22 @@ examples:
         pwms = <&pwm_tach 1 40000 0>;
       };
     };
+  - |
+    #include <dt-bindings/clock/aspeed-clock.h>
+    pwm_tach: pwm-tach-controller@1e610000 {
+      compatible = "aspeed,ast2600-pwm-tach";
+      reg = <0x1e610000 0x100>;
+      clocks = <&syscon ASPEED_CLK_AHB>;
+      resets = <&syscon ASPEED_RESET_PWM>;
+      #pwm-cells = <4>;
+
+      fan-0 {
+        tach-ch = /bits/ 8 <0x0>;
+        pwms = <&pwm_tach 0 40000 0 128>;
+      };
+
+      fan-1 {
+        tach-ch = /bits/ 8 <0x1 0x2>;
+        pwms = <&pwm_tach 1 40000 0 160>;
+      };
+    };
-- 
2.25.1


