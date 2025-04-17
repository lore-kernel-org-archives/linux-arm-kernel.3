Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B1CC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 12:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kOJJ2yFsOE7ZiB04CjWUhqyskQzHFg2rmt8TzH7FxHI=; b=YiLV/FjruhR/+7nH9/tJBobXlZ
	A9jqojIpm0tlUz2iVqpKH9xCB2qfDtnCL10fI9RU4Xn2bCnsc5WUNH4YHegdKlpOfIrhllY6ZeUfw
	zOOTgrEgdZHrapByk4WZVKx6Oc/oXkvOUhKMdC+j8sB7Y/IboWznr3HKq+izpDbZVr8TlJcnaMEsQ
	lcfopUk3dubmZ78djmWddZtmBqayq4BfJ9lAQKiFkavl2x8pYir+HHzrTdAz6eNrb8oBUtP/xv9br
	NcqdrY76wM97lU6FHucLHpoG94FQS9siozsFyI4CSRVR3G3PIZ9b6a5QOi9TXHHuwmc8mTP2yGPtU
	sC4NQaGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OKB-0000000CwIa-2YRb;
	Thu, 17 Apr 2025 12:26:35 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Nyj-0000000Crjp-0DPq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 12:04:26 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HC4Mw0683328
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 07:04:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744891462;
	bh=kOJJ2yFsOE7ZiB04CjWUhqyskQzHFg2rmt8TzH7FxHI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=KnQETKix7UvmAeCok/jBORsShMIBg9qiVWibPkuuFq6msyVL1djKArv5gJyLw1scB
	 vNBfVVVZdgBeeaK43ta6KsI75zHrUkZN1Wxa6niSKDgfQsDIfkilsLfmM5YReyYJGq
	 1HTpofyF/kyFQWDoEUBX+3xSxxt28fpMOPfR9zL4=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HC4MmP077828
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 07:04:22 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 07:04:21 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 07:04:21 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HC47VL004789;
	Thu, 17 Apr 2025 07:04:18 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 3/7] arm64: dts: ti: k3-j721e: add ranges for PCIe0 DAT1 and PCIe1 DAT1
Date: Thu, 17 Apr 2025 17:34:03 +0530
Message-ID: <20250417120407.2646929-4-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417120407.2646929-1-s-vadapalli@ti.com>
References: <20250417120407.2646929-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_050425_131818_4F37FE43 
X-CRM114-Status: UNSURE (   9.69  )
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

The PCIe0 DAT1 and PCIe1 DAT1 are 4 GB address regions in the 64-bit
address space of the respective PCIe Controllers. Hence, update the
ranges to include them.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721e.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e.dtsi b/arch/arm64/boot/dts/ti/k3-j721e.dtsi
index a7f2f52f42f7..4f5d277c97a4 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e.dtsi
@@ -126,6 +126,8 @@ cbass_main: bus@100000 {
 			 <0x00 0x10000000 0x00 0x10000000 0x00 0x10000000>, /* PCIe DAT */
 			 <0x00 0x64800000 0x00 0x64800000 0x00 0x00800000>, /* C71 */
 			 <0x00 0x6f000000 0x00 0x6f000000 0x00 0x00310000>, /* A72 PERIPHBASE */
+			 <0x40 0x00000000 0x40 0x00000000 0x00 0x08000000>, /* PCIe0 DAT1 */
+			 <0x41 0x00000000 0x41 0x00000000 0x00 0x08000000>, /* PCIe1 DAT1 */
 			 <0x44 0x00000000 0x44 0x00000000 0x00 0x08000000>, /* PCIe2 DAT */
 			 <0x44 0x10000000 0x44 0x10000000 0x00 0x08000000>, /* PCIe3 DAT */
 			 <0x4d 0x80800000 0x4d 0x80800000 0x00 0x00800000>, /* C66_0 */
-- 
2.34.1


