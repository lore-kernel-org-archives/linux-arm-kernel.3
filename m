Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C6FC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 09:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wAhv0XiRtdUUQ20wZA0jdltTE2ZjXS2Zk11kSw/Om+A=; b=vAjWf3Vjf4tP+TRRMEW9lXbQBS
	ZwkcxhhRao8+FUl69M8mkY88wtx1bBOO8xRkcp0azxD8nRnlLh1B4f2g6YpcfZMJWKClsG+BB/nfm
	jbMuf0D3oidN3FlHoLJ/7V6FW5wsFD/aJoKepFJFtKgHk0KfhQSCjOOQiNtWBoT7WZ2MRvdsdsizc
	yd3hqmEx5KqOtvykwVil+LdBijpBEORqUd9Gkp6DpR2c/4MdZSuGQEfO0/mT0bKFMdiRzaS+oT0B2
	OKyN7eS3/4oUbsWMzgEe98lBNfys/jeX/wLpNA4+s+y5DwXiN3iEqKjBIDhVRX5DODD9C8RkkgseC
	6kpVF/gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMNnO-0000000AThC-0x6n;
	Tue, 03 Jun 2025 09:18:58 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMNZX-0000000AR0J-0IIW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 09:04:40 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5538FhQG008818;
	Tue, 3 Jun 2025 11:04:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	wAhv0XiRtdUUQ20wZA0jdltTE2ZjXS2Zk11kSw/Om+A=; b=gx+kAeC7q/qhy6lr
	Ehw6Ri4QppYe0aVe4ig+vq7OEL7FZ3uOcLQHmcopEjtk+LzG76ldBJRw+bwlq/A0
	5W2Geo5aXfZ/gN8U4yhT+GebpNxGu7W/MhMb/mLZVvYFOtSjkNscsdW40OVVMoSz
	2pPvZLUlN8ODx2zqxHNBStXPqw72vzE8dgLyG2uwioBIBynMnW2otzBib0IIEfpN
	lQToQFS2UlS0EMrRh97AMPr5zXvP9uYTnw+ZiAt/N8fsFbZKlrt28Xi3yLypa1jj
	NbTA9fgnwEbD/VsWDP/apHLYcHc+i3cS52ik44/gF+HiMwSRd/ZFosD7W99TWRIX
	bLS60w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 471g93ayhs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 11:04:26 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 096D14007F;
	Tue,  3 Jun 2025 11:03:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5B8916CEED4;
	Tue,  3 Jun 2025 11:02:34 +0200 (CEST)
Received: from localhost (10.48.87.237) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 11:02:34 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Tue, 3 Jun 2025 11:02:10 +0200
Subject: [PATCH v2 4/7] ARM: dts: stm32: use internal regulators bindings
 for MP15 scmi variants
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250603-stm32mp157f-dk2-v2-4-5be0854a9299@foss.st.com>
References: <20250603-stm32mp157f-dk2-v2-0-5be0854a9299@foss.st.com>
In-Reply-To: <20250603-stm32mp157f-dk2-v2-0-5be0854a9299@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Amelie Delaunay <amelie.delaunay@foss.st.com>,
        Himanshu Bhavani
	<himanshu.bhavani@siliconsignals.io>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.237]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_020439_402512_F7A74FE3 
X-CRM114-Status: GOOD (  10.84  )
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

Use the SCMI voltage domain bindings for internal regulators on stm32mp15.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp15-scmi.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi b/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
index dc3b09f2f2af21e991cac60dc8b5a09e7fc0d8be..2f3c42a11379655a97393d91cbf28c22c5bdf539 100644
--- a/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
@@ -4,6 +4,8 @@
  * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
  */
 
+#include <dt-bindings/regulator/st,stm32mp15-regulator.h>
+
 / {
 	firmware {
 		optee: optee {
@@ -35,21 +37,21 @@ scmi_reguls: regulators {
 					#size-cells = <0>;
 
 					scmi_reg11: regulator@0 {
-						reg = <0>;
+						reg = <VOLTD_SCMI_REG11>;
 						regulator-name = "reg11";
 						regulator-min-microvolt = <1100000>;
 						regulator-max-microvolt = <1100000>;
 					};
 
 					scmi_reg18: regulator@1 {
-						reg = <1>;
+						reg = <VOLTD_SCMI_REG18>;
 						regulator-name = "reg18";
 						regulator-min-microvolt = <1800000>;
 						regulator-max-microvolt = <1800000>;
 					};
 
 					scmi_usb33: regulator@2 {
-						reg = <2>;
+						reg = <VOLTD_SCMI_USB33>;
 						regulator-name = "usb33";
 						regulator-min-microvolt = <3300000>;
 						regulator-max-microvolt = <3300000>;

-- 
2.25.1


