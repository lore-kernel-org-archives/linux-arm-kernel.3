Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D6DFD4921C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 13:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BP+WVB1Z0HTsMX73iLAJTT2emNRGx9kbzxDmY8qux+g=; b=2iRnbn2HONIo6drHmsRUuq/Dnv
	cY5DC4l9QVp4eclQfTJiz8QryOwws6FM5YgSsHs/eZ2rNZCzGl1sJ2GubHqmXaw4MszZFI6bzB6Ys
	kD046XpJMctjerQOmKMFgPjayRbFQjcwPDNsgktS21DZhMXD74UStAmh0YvocZqus+v7+md0Z05jc
	qpeqXGsLndJBzjaMi+/c6OxMdNyszXAkBiEAc+AIQU4RMPY0Teg7M2kfbm+buUdakZLqAzDd2TgRv
	q8QWIS/wU9YYZYrSmLslk+kwY8QJr411j6wKe3KxTtmpkp/deAv9p0U0xBEuPnXNz+/pPSUlmbaQ6
	aHK86FBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1m8-00000009ZRV-1UEB;
	Mon, 18 Nov 2024 13:26:44 +0000
Received: from mx07-00376f01.pphosted.com ([185.132.180.163])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1P5-00000009TjO-0hAr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 13:03:06 +0000
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AICK2L6027979;
	Mon, 18 Nov 2024 13:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=B
	P+WVB1Z0HTsMX73iLAJTT2emNRGx9kbzxDmY8qux+g=; b=dGIQHzBz7Et6i+wqV
	DcBnvUK+rOQ67AQ8P0wg7EuhYrxOgTvMQqeToITllweeUsBeJV9NdgAVgvICHXRN
	1uWrXG5hq+zsoCVnhzEcbncM3t47gMkMU+9d07733qfzZRE2QWT9egC60bi4CBVl
	oUlN10XuQ16jrq6vMcMHW0Gq7R66WWD7Ap+lm1Zzy/HuDPIpX9csaww/8o1g/2JG
	86zlA07T3ACBQf2835pBEjJT/6x7XPs7iFGS9Pqeej18RgSvIKshGASX45PquHCP
	PnYnjeQ4Z8CaEUYeDuZeAoheTJ7HShj8kIE0Ch/KTnwmVJ8g23MXqypftp98Jv6G
	whyeg==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 42xmc1hmj1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 18 Nov 2024 13:02:37 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.16.114) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Mon, 18 Nov 2024 13:02:36 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Mon, 18 Nov 2024 13:01:59 +0000
Subject: [PATCH v2 07/21] arm64: dts: ti: k3-am62: New GPU binding details
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241118-sets-bxs-4-64-patch-v1-v2-7-3fd45d9fb0cf@imgtec.com>
References: <20241118-sets-bxs-4-64-patch-v1-v2-0-3fd45d9fb0cf@imgtec.com>
In-Reply-To: <20241118-sets-bxs-4-64-patch-v1-v2-0-3fd45d9fb0cf@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>,
        Matt Coster
	<matt.coster@imgtec.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Vignesh
 Raghavendra" <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1299;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=JynAPQCpoSPGJAEKxgTWnnzJahrwymyyHaR1SDFf7+4=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaRbWz3h8YkVvncp/tqTDvGFZ+/Nlmth6UjkvpXfr7s2V
 1z4l8/RjlIWBjEOBlkxRZYdKyxXqP1R05K48asYZg4rE8gQBi5OAZjI/Q+MDHstBRj2Xj5x0Sm5
 bOdS239L/y35khCz09PO+tCfiNUs8uWMDFeWmsnMUZaQUj9z4X17mt9mNyH7TfsNt+YxC4ULf9Y
 /wwIA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.16.114]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: QyH0-FuXm1v6qF4WeMm00GT6QSKEhbNY
X-Authority-Analysis: v=2.4 cv=E4efprdl c=1 sm=1 tr=0 ts=673b3aed cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=hzDjp0mCheYA:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=OLj8r6_nq0VfqmG8xPEA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: QyH0-FuXm1v6qF4WeMm00GT6QSKEhbNY
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_050255_607162_5A39047E 
X-CRM114-Status: GOOD (  10.86  )
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

Use the new compatible string introduced earlier (in "dt-bindings: gpu:
img: More explicit compatible strings") and add a name to the single power
domain for this GPU (introduced in "dt-bindings: gpu: img: Power domain
details").

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Changes in v2:
- None
- Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-7-4ed30e865892@imgtec.com
---
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
index 5b92aef5b284b78749a01d44184b66e7776a124d..93dcc67c3138ad5b4a7ad6c9bcabb71a2b7e408d 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
@@ -693,12 +693,13 @@ ospi0: spi@fc40000 {
 	};
 
 	gpu: gpu@fd00000 {
-		compatible = "ti,am62-gpu", "img,img-axe";
+		compatible = "ti,am62-gpu", "img,img-axe-1-16m", "img,img-rogue";
 		reg = <0x00 0x0fd00000 0x00 0x20000>;
 		clocks = <&k3_clks 187 0>;
 		clock-names = "core";
 		interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 		power-domains = <&k3_pds 187 TI_SCI_PD_EXCLUSIVE>;
+		power-domain-names = "a";
 	};
 
 	cpsw3g: ethernet@8000000 {

-- 
2.47.0


