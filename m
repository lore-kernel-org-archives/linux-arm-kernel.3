Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA203C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 11:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uEnf8eeIm+WChWJl5MHAtmjlkU1sdVlbIqPrOppFbIw=; b=ecfVPZ6v5qF50cb0AddRLh6EoI
	OIeV836OgYGyl0n6e4sxJJ/5XCtKuvbtgzEJe9Qb3rg63QVttE/udaq6VRtFT9Y0GdPI7aJYWDCud
	rYLTFaLhylQ0kWxWffX5tq+pwRn8FyBJLVpExDD9t7CQDIkJKxpGqROwav1WgYfqF9mLAfV6+EDDT
	e2oWDLRtQFuPvIBlXpMn+6x8qr3t2AfIxW8Jnoo494puDYnYSqhNiDG3FG4XNVETDHvgoFxiwtTjh
	ziYhV8fhARbvQSKrVkgeerketYdfjF7l4YFdmSu7ZO4zDZeFG0DCYWSKdvt1WQMdkbWpLY/tbHRsP
	gpuRsPfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeMr-0000000EATR-0xrk;
	Fri, 04 Jul 2025 11:14:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXdNC-0000000E0VP-1iPM
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 04 Jul 2025 10:10:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=uEnf8eeIm+WChWJl5MHAtmjlkU1sdVlbIqPrOppFbIw=; b=lEQFbISmj32kd9Rrun7Q5QmLD0
	zo3k6LdgNHvzZmH6pIUcubxdKqNW/rinZYn8hZooML49YPPU2F1IgYPC9d4ca7Cr+3yjHmexoXrJy
	sdFndxElcyU0jcwSyyZal/xMHu9DDA6c9G0vmh3SpqiQX01JaIgapJzM/e9kNRGFDYm8h1yPRkEnT
	G/PzExt+6FAPd9H2VZu5Ka7e6W0TK5y7UST6T8gDC15uG86TU8/DH6uZaL6fwnX3iemAXzbPw8K8Y
	qdF329CAZiQQjaYRYxjMoj0LPo83r2p4e04QtxkCdA78rR1dyCw0ORJ9mDkf6IuBwdnRxtLI13MEN
	Es1ABXqg==;
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXdN9-00000007vG9-0Hh8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 10:10:25 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 564AAF8E273754;
	Fri, 4 Jul 2025 05:10:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751623816;
	bh=uEnf8eeIm+WChWJl5MHAtmjlkU1sdVlbIqPrOppFbIw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=S/W+RI60Gxk/xW4lp84wLoXoLJMHtjyGqTM6d4H3rivK+gBZwaSE7CdKV0hzRCS3o
	 nTsW0Ks2qVvmfK88F88jhIsvELNRptU8HZ12mwgOYCwir4pe8wPiPYC2JNdzuDa2zK
	 ZslUAvqgDKb7/hbQNmb0F6qWR6O9lAxfWbszrzoc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 564AAFX12719275
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 4 Jul 2025 05:10:15 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 4
 Jul 2025 05:10:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 4 Jul 2025 05:10:15 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 564AAER42531939;
	Fri, 4 Jul 2025 05:10:15 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <devarsht@ti.com>, <s-vadapalli@ti.com>, <andrew@lunn.ch>
Subject: [PATCH v6 2/4] dt-bindings: arm: ti: Add AM62D2 SoC and Boards
Date: Fri, 4 Jul 2025 15:39:52 +0530
Message-ID: <20250704100954.2231853-3-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704100954.2231853-1-p-bhagat@ti.com>
References: <20250704100954.2231853-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_111023_482115_CB91B1A8 
X-CRM114-Status: UNSURE (   9.99  )
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

The AM62D2 SoC, part of the K3 architecture, is built for high-performance
DSP tasks in automotive audio, pro audio, radar, sonar, and medical
imaging. It features up to four Cortex-A53 cores (1.4GHz), two Cortex-R5F
cores, and a C7x DSP with 2 TOPS MMA. Key interfaces include multi-channel
McASP audio, TSN-capable Gigabit Ethernet, and a range of peripherals
(UART, SPI, I2C, CAN, USB, eMMC/SD, OSPI, CSI). It supports LPDDR4/DDR4,
secure boot with hardware security, and low-power modes with
CAN/GPIO/UART wakeup.

This SoC is of part K3 AM62x family, which includes the AM62A and AM62P
variants. A key distinction is that the AM62D does not include multimedia
components such as the video encoder/decoder, MJPEG encoder, Vision
Processing Accelerator (VPAC) for image signal processing, or the display
subsystem. Additionally, the AM62D has a different pin configuration
compared to the AM62A, which impacts embedded software development.

This adds dt bindings for TI's AM62D2 family of devices.

More details about the SoCs can be found in the Technical Reference Manual:
https://www.ti.com/lit/pdf/sprujd4

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index bf6003d8fb76..e80c653fa438 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -25,6 +25,12 @@ properties:
               - ti,am62a7-sk
           - const: ti,am62a7
 
+      - description: K3 AM62D2 SoC and Boards
+        items:
+          - enum:
+              - ti,am62d2-evm
+          - const: ti,am62d2
+
       - description: K3 AM62A7 SoC PHYTEC phyBOARD-Lyra
         items:
           - const: phytec,am62a7-phyboard-lyra-rdk
-- 
2.34.1


