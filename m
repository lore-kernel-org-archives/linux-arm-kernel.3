Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A084C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 16:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rBrCGBHOdEE0m6TcePtZyZoT/zN5bKmKoNH8Un1rSoA=; b=33LtSZp+peaasKce07Vu8Jwukp
	g7hDgmDaPvH2/7Jsd53KNMs98Qs9pX6JxosSpmuYI9P8opsKJiUxaWuWrZNBr4dGDK0IWJmwrZ21z
	JPXEk3F70SMWSMcSB39X0jIEX1HbVOUKxm7hZqgGCX/QG2T2/9rzNhNWyKF61vs6IEz5bS0LSv6dt
	KCacbqEDRSg5f1HY+hmkRDMQy2k3LtRdoli+Akoz2oZXSHiID5oum5USF46UDYlJ0zdxUq7ffZdz/
	pChLEwInGB0R8f3n6j+8SjunmyRlnbEYXiZ4yXvXJYEX2kU1y8MV9xCHr91AH+ayY6F0XBSaTNR9i
	26Ih8wkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4jQQ-00000006SVt-1A5g;
	Tue, 15 Apr 2025 16:46:18 +0000
Received: from mx08-00376f01.pphosted.com ([91.207.212.86])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4j1k-00000006OSd-24lg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 16:20:51 +0000
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F72bDe005506;
	Tue, 15 Apr 2025 17:20:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=r
	BrCGBHOdEE0m6TcePtZyZoT/zN5bKmKoNH8Un1rSoA=; b=Oc+37UzU0+d7TwPVb
	lDq9eQgffmX+HKTG9OOb6VkATUzvA31TrdFKSdbQPuAJokJNUSXvKkDC/JdSo5il
	vVGcVO5mDhHK3SkZWNsDoSpIk+qeVjUKJZjJk1mW8RuvXqQbNDSBr4W1+XV8peZN
	IgVU0IAu3ZKyG19DwQQ0Prsw0SyRjFwLd0zOwO8FG0xNuR5DrYYAJGfypeZgPJTe
	stsTaZhzIjwCO29YN2jVuhaeFpKjHyGya2n/90AEnFZQhHSGrYRwWGF6dzUV7Uza
	gVEEMMkWtSAxJlrBV7dEKnK+xkGox5tRBndCupEEGcvFwNZF+dWagSpvQ0W/1did
	s0ZOQ==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 45yeeua1mx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 15 Apr 2025 17:20:37 +0100 (BST)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.6.134) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 15 Apr 2025 17:20:35 +0100
From: Matt Coster <matt.coster@imgtec.com>
Date: Tue, 15 Apr 2025 17:20:25 +0100
Subject: [PATCH 2/2] arm64: dts: ti: k3-j721s2: Add GPU node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250415-bxs-4-64-dts-v1-2-f7d3fa06625d@imgtec.com>
References: <20250415-bxs-4-64-dts-v1-0-f7d3fa06625d@imgtec.com>
In-Reply-To: <20250415-bxs-4-64-dts-v1-0-f7d3fa06625d@imgtec.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Frank Binns <frank.binns@imgtec.com>,
        "Alessio Belle" <alessio.belle@imgtec.com>,
        Alexandru Dadu
	<alexandru.dadu@imgtec.com>,
        Luigi Santivetti <luigi.santivetti@imgtec.com>,
        Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1663;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=9rvDUkc9AzEzDs7Y0UJm5bGH0Ey49R/ShQQjp1GriZA=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaT/aw88X9e7MCXGwOXJlrOPV+1SSgt2+dA78/zUXefyG
 Mr3Xnn6t6OUhUGMg0FWTJFlxwrLFWp/1LQkbvwqhpnDygQyhIGLUwAmsjSY4X+Q86J1i9iP8PtM
 9dg5KWjX+yeTL0eEb3rCUv+uWHyvryoPwz/VrdU59x6s2/mlPvVPeeW+lu9dEquY5zH/f/317Lb
 7ReycAA==
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.6.134]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=Ga0XnRXL c=1 sm=1 tr=0 ts=67fe8755 cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=UtEzwyU9vMAA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8
 a=Ff_bzIi4o_8fsuxLidAA:9 a=QEXdDO2ut3YA:10 a=S-JV1fTmrHgA:10 a=j2-svP0xy3wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: SC8cNNLZAnouocO4QdwxtxPvt4vZ51hh
X-Proofpoint-ORIG-GUID: SC8cNNLZAnouocO4QdwxtxPvt4vZ51hh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_092049_222885_16AC568C 
X-CRM114-Status: UNSURE (   9.91  )
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

The J721S2 binding is based on the TI downstream binding in commit
54b0f2a00d92 ("arm64: dts: ti: k3-j721s2-main: add gpu node") from [1]
but with updated compatible strings.

The clock[2] and power[3] indices were verified from docs, but the
source of the interrupt index remains elusive.

[1]: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel
[2]: https://downloads.ti.com/tisci/esd/latest/5_soc_doc/j721s2/clocks.html
[3]: https://downloads.ti.com/tisci/esd/latest/5_soc_doc/j721s2/devices.html

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
This patch was previously sent as [DO NOT MERGE]:
https://lore.kernel.org/r/20250410-sets-bxs-4-64-patch-v1-v6-18-eda620c5865f@imgtec.com
---
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 92bf48fdbeba45ecca8c854db5f72fd3666239c5..a79ac41b2c1f51b7193e6133864428bd35a5e835 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -2048,4 +2048,16 @@ watchdog8: watchdog@23f0000 {
 		/* reserved for MAIN_R5F1_1 */
 		status = "reserved";
 	};
+
+	gpu: gpu@4e20000000 {
+		compatible = "ti,j721s2-gpu", "img,img-bxs-4-64", "img,img-rogue";
+		reg = <0x4e 0x20000000 0x00 0x80000>;
+		clocks = <&k3_clks 130 1>;
+		clock-names = "core";
+		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&k3_pds 130 TI_SCI_PD_EXCLUSIVE>,
+				<&k3_pds 373 TI_SCI_PD_EXCLUSIVE>;
+		power-domain-names = "a", "b";
+		dma-coherent;
+	};
 };

-- 
2.49.0


