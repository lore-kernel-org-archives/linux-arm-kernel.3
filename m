Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49524C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 09:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jX+BsNnJhq2mryQxr8s7JIl4isTBBIXZ+aJFSDZ21XE=; b=mwS/Bvk9dfGcFF6o8nRa8upIO0
	G68MY6c+P+XNssA0xlQNy6hplLLQXI7SkBHlkiZQlfi/cE06B3J79CU7Dq0AbflRDEbsuoyVMwAXx
	4faFe7ExRGSFptM6yk4GnqBQAKLl9Hih9Mlis237uCwPrnIXzQdFFIv2esuwuAEZY756crmwXFCN1
	yJZexQLLBvC+aUXJ7znWDb1b9hjXUeO42/XU9rZPT8jl/JxFtJwD9l28wQCzbDxU7kM3yL1lSEx8T
	1ACrSp9Xil+SoDcEgCiV0V3xg/TC8MX0wfyKrivqedCkmZ2kB7N+YK7WQzmuVVydeaepFmm0dHkH7
	21zMrRQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfy7E-00000005p8m-0p5S;
	Thu, 06 Feb 2025 09:24:08 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfy4g-00000005olT-2Lf8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 09:21:31 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5169LIih3525916
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Feb 2025 03:21:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738833678;
	bh=jX+BsNnJhq2mryQxr8s7JIl4isTBBIXZ+aJFSDZ21XE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=qNJSzotH5ss/CdG3DNblTNxg3K0eTxfR8+CY5xkuzeDL95Cj/lpaLsIAkzRgSrs/R
	 aFoMJ7SRxFi4QPAEf00KyDjuJUvm+YTDbBaiyB1csaUZCob78UGbN+cN7pOgt/hJtJ
	 JmfjLiPiSURdKCE7gsXMC3EoCmMJeIMNapnZ98nk=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5169LI3b023406
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Feb 2025 03:21:18 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Feb 2025 03:21:17 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Feb 2025 03:21:18 -0600
Received: from pratham-Workstation-PC (pratham-workstation-pc.dhcp.ti.com [172.24.227.40])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5169LGFJ129535;
	Thu, 6 Feb 2025 03:21:17 -0600
From: T Pratham <t-pratham@ti.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller"
	<davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: T Pratham <t-pratham@ti.com>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        Kamlesh Gurudasani
	<kamlesh@ti.com>,
        Manorit Chawdhry <m-chawdhry@ti.com>
Subject: [PATCH RFC 1/3] dt-bindings: crypto: Add binding for TI DTHE V2 driver
Date: Thu, 6 Feb 2025 14:44:30 +0530
Message-ID: <20250206-dthe-v2-aes-v1-1-1e86cf683928@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250206-dthe-v2-aes-v1-0-1e86cf683928@ti.com>
References: <20250206-dthe-v2-aes-v1-0-1e86cf683928@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_012130_694819_258B89D4 
X-CRM114-Status: GOOD (  15.46  )
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

Add new DT binding for Texas Instruments DTHE V2 crypto driver.

DTHE V2 is introduced as a part of TI AM62L SoC and can currently be
only found in it.

Signed-off-by: T Pratham <t-pratham@ti.com>
---
PS: Please note that the dmas option in dt-bindings is subject to change in
future as dma driver is not finalized yet. Any updated changes will be
sent in the next version of the patch.

 .../devicetree/bindings/crypto/ti,dthev2.yaml      | 50 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 +++
 2 files changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/ti,dthev2.yaml b/Documentation/devicetree/bindings/crypto/ti,dthev2.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..9c871fe191ae0a3341d047d4565ec1e1bf1f21ef
--- /dev/null
+++ b/Documentation/devicetree/bindings/crypto/ti,dthev2.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/crypto/ti,dthev2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: K3 SoC DTHE V2 crypto module
+
+maintainers:
+  - T Pratham <t-pratham@ti.com>
+
+properties:
+  compatible:
+    enum:
+      - ti,dthe-v2
+
+  reg:
+    maxItems: 1
+
+  dmas:
+    items:
+      - description: 'AES Engine RX DMA Channel'
+      - description: 'AES Engine TX DMA Channel'
+      - description: 'SHA Engine TX DMA Channel'
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx1
+      - const: tx2
+
+
+required:
+  - compatible
+  - reg
+  - dmas
+  - dma-names
+
+additionalProperties: false
+
+examples:
+  - |
+
+    crypto: crypto@40800000 {
+		compatible = "ti,dthe-v2";
+		reg = <0x00 0x40800000 0x00 0x10000>;
+
+		dmas = <&main_bcdma 0 0xc701 0>, <&main_bcdma 0 0x4700 0>, <&main_bcdma 0 0xc700 0>;
+		dma-names = "tx", "rx", "tx2";
+	};
diff --git a/MAINTAINERS b/MAINTAINERS
index 0d65aa9093f63ed8f09bee3d6f31fe6d8e0d16b6..e3a32533cf3922d799439b14453248d23350bb18 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23433,6 +23433,12 @@ S:	Odd Fixes
 F:	drivers/clk/ti/
 F:	include/linux/clk/ti.h
 
+TI DATA TRANSFORM AND HASHING ENGINE (DTHE) V2 CRYPTO ACCELERATOR DRIVER
+M:	T Pratham <t-pratham@ti.com>
+L:	linux-crypto@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/crypto/ti,dthe-v2.yaml
+
 TI DAVINCI MACHINE SUPPORT
 M:	Bartosz Golaszewski <brgl@bgdev.pl>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.34.1


