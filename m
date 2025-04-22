Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 544CDC3ABA0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 18:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+8Dbi8Dp/XcgVzvDsUkk0RdPIiusdPwHu4nNqKQNjw=; b=WcuNnvGR7eGEidEGtukH2TGhg/
	WPDJEGbNeNoJqmTYfUXfwun/IoTaN7fl8I7ftU1u9kgXEZf4mtQsbranc5LaJy+x36Saf+KiKbP/N
	TyelSTBJQ/4L+X+NzE5wFVsKBrFJ5pFJhDqZwelggvxIyaOXn4bwEaTlbUJNKDhFxEVeLmaoqwZ3P
	NyZxS61iSMGQRR6gUi8ezs5pmmakBPjl8FCEc5eGQ7hNlwfBenU1UreGS+uBfXdPo1JoLlli7yitW
	nf4DqhDZpOCNkPx/Apc43SvEj1lqiz6O8IL7PnhHTIDOZPR/paJQVf4kI/yyhguR6DFMsLag4FOru
	K7lFF4Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7I8d-000000085f5-2Wcp;
	Tue, 22 Apr 2025 18:14:31 +0000
Received: from mx07-00376f01.pphosted.com ([185.132.180.163])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FWc-00000007i1r-03gK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 15:27:07 +0000
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M6JMlD025210;
	Tue, 22 Apr 2025 16:26:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=T
	+8Dbi8Dp/XcgVzvDsUkk0RdPIiusdPwHu4nNqKQNjw=; b=uwGsrZXY02oLjlZTm
	H6PKnOy1+UiGPSL0/bT9CgYqUGVNlk295bP2p+eZ4d7BNTxpgZry08uxHsMmbdOr
	IOJeels+2qpjhPuIhx0qwIvF1+vd17KYlfDmMxwVrq8yLSAJk/u0Zhkdtebli85O
	cJrWC/TSX/jN0VZxLzaVUSVw53qUW0dira6Bmq9Jc8FrCWrhtU7PnZ/Yp3Xbi0t8
	iQaKnK+UIFBkSnlFGPgQ0L1CUZ46FS1KmPItogB7g16b0daijbmuh2ACdZghQoeX
	WppNPMrZFNldrkY3tyUMzE7B7Xz3n1y889wMZcNo/Hs9QWlywH7UoWc8Tug8Mlor
	6j6iw==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4643ww22a3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 22 Apr 2025 16:26:52 +0100 (BST)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.7.98) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 22 Apr 2025 16:26:51 +0100
From: Matt Coster <matt.coster@imgtec.com>
Date: Tue, 22 Apr 2025 16:26:42 +0100
Subject: [PATCH v3 2/2] arm64: dts: ti: k3-j721s2: Add GPU node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250422-bxs-4-64-dts-v3-2-ec6657bde135@imgtec.com>
References: <20250422-bxs-4-64-dts-v3-0-ec6657bde135@imgtec.com>
In-Reply-To: <20250422-bxs-4-64-dts-v3-0-ec6657bde135@imgtec.com>
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
        Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>,
        Matt Coster
	<matt.coster@imgtec.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2296;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=mXB1POJe6HuTvqTx1N0QPtvkf3Ravu1KC3w1Y+Ekgk4=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMWSwb7VUnH9dPdf864vKwpbYd5tkP59m/HFq0uqg7W9OT
 ZxRv3F2QUcpC4MYB4OsmCLLjhWWK9T+qGlJ3PhVDDOHlQlkCAMXpwBM5O8Whv9F015djdG9W31i
 T+PXq9MqbvPO+KT216b7cbrsxRlOqs27GRn+fryUdvT027bdlvnzvj561iba+1Dj4ctbmh7NL2T
 a/99jAQA=
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.7.98]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIyMDExNyBTYWx0ZWRfX3rWUZOaXWHkx 0wTfY4be60nNiUfCWFNoe6YMCFgSdhcJna+2z/t++Hs03KjZlvU7rUR6TxgKnkFOieKhubKK6g4 NEow7qXFvLK4d5EwOMXwy9yLM6AdZEpoicklvwqEAKOMD7MzWF8SO/FOpdktXBLlOAkRsEpjyT7
 vkUQbMOTTpJ/p3y4NEdgviK8ZQHQ3QXJNETOh46Fho8U+vs4uk92dwNPRmc70JQqO4sSbpE4iU9 G5VDWpoc8npbF4Cu79asxT8K+C2zC8AvwgWxQcQORF5ENiBPLQpoC+E1dF8/doKaTraiYICoj6v e1i4HZieotYiERZO0isGdG1c98VuxhSHCWJq/YI0new8MVwXxYYcSlFMT9Tza3ovkInvP+uIy/U
 pQoL/yeyCSjrd1mshsg5vGGjdXjJ/zZAmS+bRLRLqddQ051YvqoCdAiWHkCDsvSp4rruJDqh
X-Authority-Analysis: v=2.4 cv=ApTu3P9P c=1 sm=1 tr=0 ts=6807b53c cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=6pm0VhuFVbIA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8
 a=KjGJ_YhaLPe-tYgPVq4A:9 a=QEXdDO2ut3YA:10 a=S-JV1fTmrHgA:10 a=j2-svP0xy3wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: Qf6AAKGH_HyWb1uWf-E221Ro5JHQIyNQ
X-Proofpoint-ORIG-GUID: Qf6AAKGH_HyWb1uWf-E221Ro5JHQIyNQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_082706_359696_D905BE39 
X-CRM114-Status: GOOD (  11.02  )
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

The clock[2] and power[3] indices were verified from HTML docs, while
the intterupt index comes from the TRM[4] (appendix
"J721S2_Appendix_20241106_Public.xlsx", "Interrupts (inputs)",
"GPU_BXS464_WRAP0_GPU_SS_0_OS_IRQ_OUT_0").

[1]: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel
[2]: https://downloads.ti.com/tisci/esd/latest/5_soc_doc/j721s2/clocks.html
[3]: https://downloads.ti.com/tisci/esd/latest/5_soc_doc/j721s2/devices.html
[4]: https://www.ti.com/lit/zip/spruj28 (revision E)

Reviewed-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Changes in v3:
- Use assigned-clocks to pre-load the frequency of the core clock
- Link to v2: https://lore.kernel.org/r/20250417-bxs-4-64-dts-v2-2-9f8c09233114@imgtec.com
Changes in v2:
- Add interrupt reference details
- Add Randolph's Rb
- Link to v1: https://lore.kernel.org/r/20250415-bxs-4-64-dts-v1-2-f7d3fa06625d@imgtec.com

This patch was previously sent as [DO NOT MERGE]:
https://lore.kernel.org/r/20250410-sets-bxs-4-64-patch-v1-v6-18-eda620c5865f@imgtec.com
---
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 92bf48fdbeba45ecca8c854db5f72fd3666239c5..9e36cbbe0ea2fefceedcc95b78068ded7ef395f0 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -2048,4 +2048,18 @@ watchdog8: watchdog@23f0000 {
 		/* reserved for MAIN_R5F1_1 */
 		status = "reserved";
 	};
+
+	gpu: gpu@4e20000000 {
+		compatible = "ti,j721s2-gpu", "img,img-bxs-4-64", "img,img-rogue";
+		reg = <0x4e 0x20000000 0x00 0x80000>;
+		clocks = <&k3_clks 130 1>;
+		clock-names = "core";
+		assigned-clocks = <&k3_clks 130 1>;
+		assigned-clock-rates = <800000000>;
+		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&k3_pds 130 TI_SCI_PD_EXCLUSIVE>,
+				<&k3_pds 373 TI_SCI_PD_EXCLUSIVE>;
+		power-domain-names = "a", "b";
+		dma-coherent;
+	};
 };

-- 
2.49.0


