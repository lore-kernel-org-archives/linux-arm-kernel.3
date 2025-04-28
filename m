Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADB9C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 11:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9d81k80bj5ZawJ6WripMhbFIgGjG7bvJfsEGXp7LwEk=; b=oD0O6qkGv9UwK4
	1aIHNPokBWSrk9UWxXN6IAsDOz9W2l16kUD99t6kN77mK5/O100u30djV1JHoITTDg+Y5WGM4MYlB
	NC9S/g/REzAfo+cKQ2u4TQ/ChlD+yQDWzyfgXQdwhYyoN9/FuQHBYJLMqSKOpXus8eMG7NO8LtYwm
	NMp1OOs2Qy6KY2OHqvfF4e82wny+MSnXuhiXPrbNGHGCgSm7/2Kldp5fV0XuDANksIEIwOn7310xL
	QWcmpoZc4plTeX38zCNl5q2B2qzPignfqRKMf6tpJ/b/LpTke47zFoE0V/B7rvZZQvePfG7p8nK3C
	XtkOa4l8KCaf8iajTWnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9MOj-00000005tsE-2p5s;
	Mon, 28 Apr 2025 11:11:41 +0000
Received: from mx08-00376f01.pphosted.com ([91.207.212.86])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9MMk-00000005tNy-24mA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 11:09:40 +0000
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S6jub6031219;
	Mon, 28 Apr 2025 12:09:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=dk201812; bh=9d81k80bj5ZawJ6WripMhbF
	IgGjG7bvJfsEGXp7LwEk=; b=SbaZUfTnaOYzi40hW/EPWUaLWQoIRJBJJ57r2Bc
	mmnadcHmI0+w7r9wQ7/Sc1HU4BVFPflsywDVFzKXQ3vicNG9cbKt11IxH+hc9hia
	O72c5Dz3Qnu+TYFLLS+Gb8D1f+pfpo/eLqEqHgG5Q50iNhlU6+WRJd0XPfkLF9Yi
	1rcz+Ywxl754l4l07VSnbh1JE50RXJdFYGvb/xysFKY1RU41nH/8NIemgaEwf8NS
	uuJn2SQO0+lDXIeE1KFV0jIzawtkyGJvtaPE+RJZhJ23EsnV3HsJE2YYkP4Y2+Dq
	AobIhpl637o/mNnrDN5N6ifQD+SIcXLCTkPtzMRCzdbuy/g==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4694618xrx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 28 Apr 2025 12:09:25 +0100 (BST)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.2.134) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 28 Apr 2025 12:09:22 +0100
From: Matt Coster <matt.coster@imgtec.com>
Subject: [PATCH v4 0/2] Imagination BXS-4-64 MC1 GPU support (DTS changes)
Date: Mon, 28 Apr 2025 12:07:13 +0100
Message-ID: <20250428-bxs-4-64-dts-v4-0-eddafb4ae19f@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGJhD2gC/3XMvQ6DIBiF4VsxzKXhH+3U+2g6KHwog9qAITbGe
 y86WZuO5yTPu6AIwUNEt2JBAZKPfhzyEJcCma4eWsDe5o0YYZIIKnEzRyywEthOEZuqFJaUWkm
 pUCavAM7Pe+7xzLvzcRrDe68nur1/Qoligp223NVEKSbt3fftBOZqxh5tpcSOWp80y7pypSEV4
 5xS8aP5QTN20jxrMEpJ3VigXH7pdV0/34e8WyUBAAA=
X-Change-ID: 20250415-bxs-4-64-dts-c984d0876556
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1485;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=orbQAPlvpu4cO2V110q6r97tgb2WdYc8nKDUsMaEFek=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMWTwJz5i/ymlrT5bfdHOpdfZWn5JeHxnz2izrORr/eC8L
 6pg1d6vHaUsDGIcDLJiiiw7VliuUPujpiVx41cxzBxWJpAhDFycAjCR7G0M/70Xy/9ne24TudK2
 N+aT+26JmQ7GGffXcxhxe3oJmra1bmb4n7hvn/OcOVITEo9+ZngoUri3yTHtd3eB/fJpkkJNh8P
 XMgMA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.2.134]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=WoMrMcfv c=1 sm=1 tr=0 ts=680f61e5 cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=OXfeAiaCWNgA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=sozttTNsAAAA:8
 a=_yRp58ONHCnQFu2M2WYA:9 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: vJAn27_55nW5NvkDdL71U6BqSCcCok9C
X-Proofpoint-ORIG-GUID: vJAn27_55nW5NvkDdL71U6BqSCcCok9C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA5MiBTYWx0ZWRfXy/HmxkTQZ7tW RrMCPkndTWel2oaMIAEM0cgqmKp4b6ZnPsIfh4BaR5cc/m6EFjUfh/bx0fnpfJliLushV9WKd3+ 6+FjCJzW/hNCdPyujHAjPUYUnlRNkCuovMoIq522JEo6M7T53b/4iWvc9r8r/n14CH7Y6QUQNYn
 RlkqjHmAjtFfxdVT/Y/yOql2P7IHfXhx/TMNm2+LVihFVbVmdzUDU6jL04rCvTx0gFZTl8L8dVd XtN6gQ2fdx2wmyHDA7dBF0T4mRyoKVMQxdY0bfvADHbe6kZum0OR6kdNCD97Adprjw4423MUnWC ark393WcBN+ezvWxFNj9i+sEVSRFNMwsP1a2qSwVV3yMzL12xLfmVeZzMJbg4l7gVE0AhE8iCCg
 5CiWtNiYfznYZLQzZvFM09Z/9s02PK2+XecRtCufgMdScsy29kJ+2UCODBFHe36b2lhZiea8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_040938_819146_F7B5F5C1 
X-CRM114-Status: GOOD (  10.28  )
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

Now that the binding and driver changes to support the Imagination
BXS-4-64 [1] have landed in a DRM tree, here are the corresponding DTS
changes without the [DO NOT MERGE] tag.

This GPU is found in the TI AM68 family of SoCs, with initial support
added to the k3-j721s2 devicetree and tested on a TI SK-AM68 board.

[1]: https://lore.kernel.org/r/20250410-sets-bxs-4-64-patch-v1-v6-0-eda620c5865f@imgtec.com

Reviewed-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Matt Coster <matt.coster@imgtec.com>

---
Changes in v4:
- Remove lore link to previous commit (P1)
- Fix typo in commit message (P2)
- Link to v3: https://lore.kernel.org/r/20250422-bxs-4-64-dts-v3-0-ec6657bde135@imgtec.com

Changes in v3:
- Use assigned-clocks to pre-load the frequency of the core clock (P2)
- Link to v2: https://lore.kernel.org/r/20250417-bxs-4-64-dts-v2-0-9f8c09233114@imgtec.com

Changes in v2:
- Add details of the source of the interrupt index (P2)
- Add Randolph's Rb
- Link to v1: https://lore.kernel.org/r/20250415-bxs-4-64-dts-v1-0-f7d3fa06625d@imgtec.com

---
Matt Coster (2):
      arm64: dts: ti: k3-am62: New GPU binding details
      arm64: dts: ti: k3-j721s2: Add GPU node

 arch/arm64/boot/dts/ti/k3-am62-main.dtsi   |  4 +++-
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 14 ++++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)
---
base-commit: dcbd5dcc956e2331414fd7020b4655df08deeb87
change-id: 20250415-bxs-4-64-dts-c984d0876556


