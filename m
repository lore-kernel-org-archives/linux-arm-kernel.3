Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5D3C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 16:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MdbgZzGrpf3fbja1j7+Yz6FptArFQVzlNAO/yRnhqUY=; b=EgxB0zRvw8LlzT
	bbn+wCyqfBRgopNxMjxvCbzG1V7X1y5vvJx6B+OVL1C80oO49oIaUN2u00Wjv/qOXmgcqCi6kKYig
	nHbX7AYfu/dvqtSN894M44ctMt+rR8Ii9XYhK0/eVoyBc9UfPgx+so+pu2tVMi0pABNsoTokYs2OJ
	8P+L4LFfeojGaGc7GQcoHI1IZHTNqIzM/WoeoOEJNh0F/ayC19m1YysXs758wXeDHbXMTJBKsMVJ7
	QpkGD3QzQF69WAh6DMMqYUbQdnXR+S5K8hIzIVl1K2wjwiDvsm7ECtNK2hNY7XMwD2V9Y6qTguWNR
	4uPMyxQIiGYVHaZ1D56g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4jMo-00000006RqY-3SAa;
	Tue, 15 Apr 2025 16:42:34 +0000
Received: from mx08-00376f01.pphosted.com ([91.207.212.86])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4j1i-00000006OS9-3u6K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 16:20:49 +0000
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F7w6Y5029858;
	Tue, 15 Apr 2025 17:20:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=dk201812; bh=MdbgZzGrpf3fbja1j7+Yz6F
	ptArFQVzlNAO/yRnhqUY=; b=wY4dHVhd2akXI4tZJ7bJZgQ2+D+3PgGbWhgfEGZ
	CToE39my81fTVmOj3uIQIxFRBfwOVQDjh0q37xL4tvoQYGlSr4W2zT9nl4YyVDy7
	sI3j1pUhvj4ehqHNrQfHXcCIljegyuzMycmX1r2w9eIlvEFKQpv6TE0MX/1/V1Un
	+x60AfY8IZr5eoM6ZFIUpneVcPHk32ahqgpI11hVSLbwTGNHVrjppIfeUamJ/LLp
	T5cqFtPMpSbrP1Ye4CnmvPGLH99x2m1vFFqxcRbJxYVJsMM1hOyW01i8tbqHmX3b
	lIQpExuhyB/xa9+hWVFhki1iZQYvzf7P4/Ks9zrXrRe2X3g==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 45yeeua1mv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 15 Apr 2025 17:20:35 +0100 (BST)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.6.134) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 15 Apr 2025 17:20:34 +0100
From: Matt Coster <matt.coster@imgtec.com>
Subject: [PATCH 0/2] Imagination BXS-4-64 MC1 GPU support (DTS changes)
Date: Tue, 15 Apr 2025 17:20:23 +0100
Message-ID: <20250415-bxs-4-64-dts-v1-0-f7d3fa06625d@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEiH/mcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE0NT3aSKYl0TXTMT3ZSSYt1kSwuTFAMLczNTUzMloJaCotS0zAqwcdG
 xtbUAQUia+F4AAAA=
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
        Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=824; i=matt.coster@imgtec.com;
 h=from:subject:message-id; bh=R6oJbOSdI93M6ihDGiGprnVl9fh+A4F0YVOXmGTzuEU=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaT/aw+80r1sosreTPHNq9bwXFbk+5AlFPjz/IQl/qd8u
 vdU39/6vKOUhUGMg0FWTJFlxwrLFWp/1LQkbvwqhpnDygQyhIGLUwAmMuEuwy9mZ47tLD/nqMSE
 Bf9kmHjw4Kt9Ir5VaU1vHht9km2Y7sjDyHD7pkccc77gwY25nCxsak+z1GP0GpVquVuWed1NP2y
 hzgkA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.6.134]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=Ga0XnRXL c=1 sm=1 tr=0 ts=67fe8753 cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=UtEzwyU9vMAA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=zVSXwL2RMzKZDUOSOyAA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: 2SfXehZXwoaluiDtpteBdrc6yWZFut3X
X-Proofpoint-ORIG-GUID: 2SfXehZXwoaluiDtpteBdrc6yWZFut3X
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_092047_262014_3712D084 
X-CRM114-Status: UNSURE (   7.98  )
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

Now that the binding and driver changes to support the Imagination
BXS-4-64 [1] have landed in a DRM tree, here are the corresponding DTS
changes without the [DO NOT MERGE] tag.

This GPU is found in the TI AM68 family of SoCs, with initial support
added to the k3-j721s2 devicetree and tested on a TI SK-AM68 board.

[1]: https://lore.kernel.org/r/20250410-sets-bxs-4-64-patch-v1-v6-0-eda620c5865f@imgtec.com

---
Matt Coster (2):
      arm64: dts: ti: k3-am62: New GPU binding details
      arm64: dts: ti: k3-j721s2: Add GPU node

 arch/arm64/boot/dts/ti/k3-am62-main.dtsi   |  4 +++-
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 12 ++++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)
---
base-commit: 81f6e0e0f3505809dd78eab129106f1c0cf2baf1
change-id: 20250415-bxs-4-64-dts-c984d0876556


