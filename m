Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A8CC71159
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 22:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k02eg2nEnGNOVqzzGntSYPh+yjp3owIb+q67azvL4JA=; b=HmlaoaciPwAo3Xb6IFANpttR/A
	D21WVH6joTwfaCb4p5U79wlzyEVBNOlAqtUunzbs13Za3InTi0Apl0gIKGwaansLtiGPP7hNZv/PE
	H/5J+n/bOmqeF4Kx9mfKeEUgEXcu87yOp9Omg+Ge/lwR0xg5DeaxF+4B7dFGfDA3PFy3Txch+SQR0
	quNGz4dUcTR6EJ6yk3rEnoYaSTDnm+aGlUHJCsjUSqmye2AxDuMbEWYTM2WorLK9gTEj/HxC0jaB2
	EQB3pA33qsstjm/9kI3aMqE5TWq2bzoqbP+41lch2ii3LFF/2vY0ymnJdX147hSCboV6jDVbROcoq
	7ZpCJKFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRIBY-00000005gRf-1aKb;
	Mon, 16 Jun 2025 22:20:12 +0000
Received: from out-170.mta1.migadu.com ([95.215.58.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRHtN-00000005e6K-2wHj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 22:01:26 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750111272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k02eg2nEnGNOVqzzGntSYPh+yjp3owIb+q67azvL4JA=;
	b=UadQiczHIeD6B2nrEfEl0KTczlznS2BpAm4IByPdlh/tvG58UEa+mIg6NA1S7Lc701VBxv
	9aJRLszvcLyWiPz79MIql9Ggn/GzVrMhLou+zA/KGa5dIWESVTQRgAf7/1nO73SGVYPyHv
	AnUXRehC7n8USBTzD/K95i0cHdiLV48=
From: Sean Anderson <sean.anderson@linux.dev>
To: Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-spi@vger.kernel.org
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Lechner <dlechner@baylibre.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v2 1/9] dt-bindings: spi: Add spi-buses property
Date: Mon, 16 Jun 2025 18:00:46 -0400
Message-Id: <20250616220054.3968946-2-sean.anderson@linux.dev>
In-Reply-To: <20250616220054.3968946-1-sean.anderson@linux.dev>
References: <20250616220054.3968946-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_150125_875033_2C32D52A 
X-CRM114-Status: UNSURE (   9.63  )
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

From: David Lechner <dlechner@baylibre.com>

Add a spi-buses property to the spi-peripheral-props binding to allow
specifying the SPI bus or buses that a peripheral is connected to in
cases where the SPI controller has more than one physical SPI bus.

Signed-off-by: David Lechner <dlechner@baylibre.com>
Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

Changes in v2:
- New

 .../devicetree/bindings/spi/spi-peripheral-props.yaml  | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
index 8fc17e16efb2..cfdb55071a08 100644
--- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
@@ -89,6 +89,16 @@ properties:
     description:
       Delay, in microseconds, after a write transfer.
 
+  spi-buses:
+    description:
+      Array of bus numbers that describes which SPI buses of the controller are
+      connected to the peripheral. This only applies to peripherals connected
+      to specialized SPI controllers that have multiple SPI buses on a single
+      controller.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    default: [0]
+
   stacked-memories:
     description: Several SPI memories can be wired in stacked mode.
       This basically means that either a device features several chip
-- 
2.35.1.1320.gc452695387.dirty


