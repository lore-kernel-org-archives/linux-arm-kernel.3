Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20300C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 14:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tijUZy13OY+lpBLDlS9vMkTfAAXJmYkbRtFLhtiaaxU=; b=Ty8J3EHBsAfv3yz6rVm5As/JBE
	BUEvouVJQwtUcS7wUtyemSioMIAGykh+mlGNh5fOMmW8x+5I3upWi4r8HFnOgxelXH5MnKXcFz9jL
	d5drpXKaauj+20+To1NIrXVHS7YPkPAzuP9XUeXjUdnilLXUEu/RaZDMtx3vt6y76l5LeiUVykEcJ
	ATTR8POjsTQb62faUhHd3wNbpjGUnjQZV/B9elxgozyarIQMHCscxsNdThg+VS7E9FN2T/010aNbW
	INcTkzc7HYhDTRgvR2MQzO07fJME3oWISxbyS2SWjA5F48uAL0Foo3oWcwfm8xlc2dfcldIMEz3eb
	XPQNIolQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0Vx-0000000F6C6-34Nv;
	Wed, 15 Jul 2026 14:23:09 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0Vs-0000000F68a-146l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 14:23:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DEC361A101F;
	Wed, 15 Jul 2026 14:23:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AB5046035C;
	Wed, 15 Jul 2026 14:23:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6EE4811BD3A7E;
	Wed, 15 Jul 2026 16:22:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784125379; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tijUZy13OY+lpBLDlS9vMkTfAAXJmYkbRtFLhtiaaxU=;
	b=CoAUdMDyGMRWK2M4iByKGRWXdIszyR4NfGFP//GvNNqOPryLYX8xxwr5JXu0cnIm1ypGsI
	JbNNhiI0VmSvCd1ERCUNsDEreA1tRenvxbxGNqinMnWOGTOp0ai6u0IirZyqgvYgP6DKL1
	IY4mcO+2t1U2H5yT9as0Zl+K4FKBBot9rK4AxEF0GQ69Vxq0D2aCSMk1yvk7l+mf1BKsPG
	psuqlA4IvXHQ0y0ag/SgBfwLCN5YoA+g5Y+PqJUNVGApddvtHw6VRXKy4EOB6AW1O/yBFl
	gzuheHMXD4A3TQlfxvM+6+LRRC9LpWjrAi1kAS205Pvwi1ymq/1kaz8U6lCs1A==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 15 Jul 2026 16:22:20 +0200
Subject: [PATCH v2 3/7] arm: dts: st: Import optee node from u-boot device
 trees
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-mathieu-uboot-dts-import-v2-3-bc931417bd0e@bootlin.com>
References: <20260715-mathieu-uboot-dts-import-v2-0-bc931417bd0e@bootlin.com>
In-Reply-To: <20260715-mathieu-uboot-dts-import-v2-0-bc931417bd0e@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Wei Xu <xuwei5@hisilicon.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, openbmc@lists.ozlabs.org, 
 Tom Rini <trini@konsulko.com>, Peter Robinson <pbrobinson@gmail.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784125361; l=1640;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=BiSi1t1NUOIhyg6vwnL1alqPw0iJySL8ICnheLp+aN0=;
 b=3lfIuZ00pjUhesMIxFFV0/F2DdxXFfSRCymcwCVDrr+fnITDXdhCnp3HkupTtLG8i6vkRtg2t
 oJ250VpA0loDfzIXNb0d3A0+ATPem2Ogyp0qtebyPhQiXysfjCjLPNO
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_072304_459354_DD1870C7 
X-CRM114-Status: UNSURE (   9.18  )
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

U-Boot is importing kernel device trees for these platforms, but adding
a firmware node to enable communication with OP-TEE. Importing
changes here will allow to remove these additions in U-Boot.

Also import the corresponding reserved-memory region.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 arch/arm/boot/dts/st/stm32mp157a-dk1.dts | 17 +++++++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-ed1.dts | 12 ++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp157a-dk1.dts b/arch/arm/boot/dts/st/stm32mp157a-dk1.dts
index 0da3667ab1e0..236da589eb90 100644
--- a/arch/arm/boot/dts/st/stm32mp157a-dk1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157a-dk1.dts
@@ -22,4 +22,21 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	reserved-memory {
+		bootph-pre-ram;
+
+		optee@de000000 {
+			reg = <0xde000000 0x02000000>;
+			no-map;
+			bootph-pre-ram;
+		};
+	};
+
+	firmware {
+		optee: optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
 };
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
index 49dd555cc228..7da726035086 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
@@ -70,6 +70,18 @@ retram: retram@38000000 {
 			reg = <0x38000000 0x10000>;
 			no-map;
 		};
+
+		optee@fe000000 {
+			reg = <0xfe000000 0x02000000>;
+			no-map;
+		};
+	};
+
+	firmware {
+		optee: optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
 	};
 
 	led {

-- 
2.47.3


