Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F03CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 02:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fWbMK5ifvM7rCdTHVsvV4lPFyUlagWO4BcdNz0r54Y=; b=weK5DFsdm0z0zDzaCdtNE+nrMb
	K8A6A6OysvllPfnevM9/lsE5VdJaaL44vRoSofJhYVvMw+g/O1MLSCoZLhdlYbFGhZlbE7BEUnai9
	mwLsBpRDfTJPYFRmNWjXOiMnHyda+7uIkbUXPUkLHGoCRAZKu2Wrg9mNorPQjPJsl5BZ2kdvPKyq3
	JN8KjX6pG3hEOwqHQ1kzy6eJrPgvDtauXWXUPIpkMfmpq3ZGKIUs0Hau4vaJre3gCgW4QXqe1ZSGN
	0qtefNj70Xv4XpPuSBh3YEW6e2V6iWrgew316jJiDc30jTsWo3ZNhps+eKBozT+k77UHHAi1/WiaF
	rvzyDloQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKpKZ-0000000FKN8-0POq;
	Mon, 17 Nov 2025 02:51:03 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKpKV-0000000FKKa-0V4k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 02:51:00 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 17 Nov
 2025 10:50:41 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 17 Nov 2025 10:50:41 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: <ryan_chen@aspeedtech.com>, <bmc-sw@aspeedtech.com>,
	<andriy.shevchenko@linux.intel.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <benh@kernel.crashing.org>, <joel@jms.id.au>,
	<andi.shyti@kernel.org>, <jk@codeconstruct.com.au>,
	<andrew@codeconstruct.com.au>, <p.zabel@pengutronix.de>,
	<naresh.solanki@9elements.com>, <linux-i2c@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v23 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add global-regs and transfer-mode properties
Date: Mon, 17 Nov 2025 10:50:38 +0800
Message-ID: <20251117025040.3622984-3-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251117025040.3622984-1-ryan_chen@aspeedtech.com>
References: <20251117025040.3622984-1-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_185059_203441_DC4999C0 
X-CRM114-Status: UNSURE (   9.97  )
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

The AST2600 I2C controller supports three transfer modes: byte,
buffer, and DMA. To allow board designers and firmware to
explicitly select the preferred transfer mode for each controller
instance. "aspeed,transfer-mode" to allow device tree to specify
the desired transfer method used by each I2C controller instance.

And AST2600 i2c controller have two register mode, one is legacy
register layout which is mix controller/target register control
together, another is new mode which is separate controller/target
register control.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 .../bindings/i2c/aspeed,ast2600-i2c.yaml      | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
index c98deab6a977..f024256af726 100644
--- a/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
@@ -41,6 +41,33 @@ properties:
   resets:
     maxItems: 1
 
+  aspeed,transfer-mode:
+    description: |
+      ASPEED ast2600 platform equipped with 16 I2C controllers each i2c controller
+      have 1 byte transfer buffer(byte mode), 32 bytes buffer(buffer mode), and
+      share a DMA engine.
+      Select I2C transfer mode for this controller. Supported values are:
+        - "byte": Use 1 byte for i2c transmit (1-byte buffer).
+        - "buffer": Use buffer (32-byte buffer) for i2c transmit. (default)
+                    Better performance then byte mode.
+        - "dma": Each controller DMA mode is shared DMA engine. The AST2600 SoC
+                 provides a single DMA engine shared for 16 I2C controllers,
+                 so only a limited number of controllers can use DMA simultaneously.
+                 Therefore, the DTS must explicitly assign which controllers are
+                 configured to use DMA.
+      On AST2600, each controller supports all three modes.
+      If not specified, buffer mode is used by default.
+    enum:
+      - byte
+      - buffer
+      - dma
+
+  aspeed,global-regs:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle reference to the i2c global syscon node, containing the
+      SoC-common i2c register set.
+
 required:
   - reg
   - compatible
@@ -63,4 +90,6 @@ examples:
       resets = <&syscon ASPEED_RESET_I2C>;
       clock-frequency = <100000>;
       interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+      aspeed,global-regs = <&i2c_global>;
+      aspeed,transfer-mode = "buffer";
     };
-- 
2.34.1


