Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450FDC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 05:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5/r3Cd3a5F8RDl+gpGHajtVIDh7k0BuAfKXauxlaFPE=; b=TMT23XMa+y9Eao3bsQYChRXZEL
	BijftOqb0cuIPqimQPuWFmLGyRhpw8a6iG3hJ4NmHFNl5I/6dmtEcmkFn7SvXNUc3gBWge16xow7W
	A8yPzECc6CUUUX1bil2j03O20rBqqgNRFBqgxtovSnkkr0mL2yFt/NiCec4aD7hXjVRLaDolIThWn
	cCF97y2pqAbifH6KgWjPDjnxxgDt2j/PGi9z7ezt9LT1G8m+U/xwsyrrkC8mC7IEvPJ9BbWz+V5MO
	bBePiD9wC7FI0CnYroGhB6/yUp3jtNPQVCjJMPc9QR08cdAtskFd22HZaffCZX5CAWs6oG6VgyIw9
	cZURTVzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkGD6-00000006rbt-0fqk;
	Tue, 18 Feb 2025 05:31:56 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkG4h-00000006qEj-0oC1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 05:23:16 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51I5N5Q1647929
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 17 Feb 2025 23:23:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739856185;
	bh=5/r3Cd3a5F8RDl+gpGHajtVIDh7k0BuAfKXauxlaFPE=;
	h=From:To:CC:Subject:Date;
	b=Cc5/0krozeeWVCsdf1M4B+5WhdBjTJbBb5QQErFBuYQ7t9e0NLAKdPLAnAxUqFtsn
	 ftrUba56WmO2YUpjDnT1M/DNaiGbgCEi3vsWVZvtK6KbivB/fFQ+p7k1oIp0wW5zNq
	 w9ajz8QEF44/DO+UH4Woe/vWolZQwUkGC14LVf0g=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51I5N5Cg079664;
	Mon, 17 Feb 2025 23:23:05 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Feb 2025 23:23:04 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Feb 2025 23:23:04 -0600
Received: from ubuntu.myguest.virtualbox.org (ltpw09g681.dhcp.ti.com [172.24.29.106])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51I5N0Zb109957;
	Mon, 17 Feb 2025 23:23:01 -0600
From: Keerthy <j-keerthy@ti.com>
To: <robh+dt@kernel.org>, <nm@ti.com>, <vigneshr@ti.com>,
        <conor+dt@kernel.org>, <kristo@kernel.org>, <krzk+dt@kernel.org>
CC: <j-keerthy@ti.com>, <u-kumar1@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Subject: [PATCH v2] arm64: dts: ti: k3-j784s4-j742s2-main-common: Correct the GICD size
Date: Tue, 18 Feb 2025 10:52:48 +0530
Message-ID: <20250218052248.4734-1-j-keerthy@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_212315_348155_B90426B5 
X-CRM114-Status: UNSURE (   9.76  )
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

Currently we get the warning:

"GICv3: [Firmware Bug]: GICR region 0x0000000001900000 has
overlapping address"

As per TRM GICD is 64 KB. Fix it by correcting the size of GICD.

Fixes: 9cc161a4509c ("arm64: dts: ti: Refactor J784s4 SoC files to a common file")
Signed-off-by: Keerthy <j-keerthy@ti.com>
Cc: stable@vger.kernel.org
---

Changes in V2:

	* Added the fixes tag
	* Cc: stable

 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
index 83bbf94b58d1..3b72fca158ad 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
@@ -193,7 +193,7 @@
 		ranges;
 		#interrupt-cells = <3>;
 		interrupt-controller;
-		reg = <0x00 0x01800000 0x00 0x200000>, /* GICD */
+		reg = <0x00 0x01800000 0x00 0x10000>, /* GICD */
 		      <0x00 0x01900000 0x00 0x100000>, /* GICR */
 		      <0x00 0x6f000000 0x00 0x2000>,   /* GICC */
 		      <0x00 0x6f010000 0x00 0x1000>,   /* GICH */
-- 
2.17.1


