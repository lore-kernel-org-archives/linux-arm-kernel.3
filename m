Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB10C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 15:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1oxvjGElHM3a+H6uBmKYvZXu1ajfuZrjKxAqE8nqy2A=; b=Lvufhlik4hCIFR
	31PONJ4tRiLcexwYFgFw5Yj4d/9Q+4krf67L5IGlHNw5gxiXGJrj8xa1/i2BbG1jUbQT8tJp444LK
	nsLNtAZ9QEJK6qWH3SADKkLetQ2FKgLAXAlOG9Vl1wYXekqTT21sebFYjnaKYyEGD60fYeuiKJNRS
	5vDllK9oGue3iWP2Tws/+Xe5PSsBIvNphCCnRm9+NIQ6VxIBcQlgxJ1x1mbIvlzw4+pCuUtk5CDX8
	tk9On+7K4u021POiolbQC1WysjrMB07JmPX7Z4FwKkhoGZtEl/tkrr8gP+LiKBH/bEFD/105V8m3G
	Lkzc3EIJr2U6KS67S+bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thVoL-00000000Kup-1qUO;
	Mon, 10 Feb 2025 15:35:01 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thVeT-00000000IOB-2Yg3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 15:24:51 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AF0m0F027851;
	Mon, 10 Feb 2025 16:24:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=1oxvjGElHM3a+H6uBmKYvZ
	Xu1ajfuZrjKxAqE8nqy2A=; b=KMSobn1WYylQ2+obOs2BQypQ0aFiE3d8CdZU2/
	t0ms3ktaj3bZ9mRHUwAt+skvfIPGIKx9OstUHOv+SLoBqiyXtM/XVkBJT9lSTLgm
	vOpy0IgbH+vSL7BEYZsB4UbdUh21s6cdU1pTs7BPOAv3vc6I4RbBtQEvTvuItbcM
	OKIhUdn9tlSMf4JVFY77XjQsEQPceNYWudSEWzBb4C3LKCkE1vmqRImlGfIV7EZU
	7kLTSTzDzQLGDygfX1lOokxuCUuZ/NL7DreAs/WPNfRuzEzD+Wu3EreTJWRAfuf8
	ewGCvdzDbSqX9yW4STY5hrS7AtXJQoIGvG+L0rkPqPJA6+TA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44phq3n6b3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 16:24:41 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 17B4D4004B;
	Mon, 10 Feb 2025 16:23:14 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E34DA294C1B;
	Mon, 10 Feb 2025 16:21:36 +0100 (CET)
Received: from localhost (10.48.87.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Feb
 2025 16:21:36 +0100
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Subject: [PATCH 00/10] Expand STM32MP2 family with new SoC and boards
Date: Mon, 10 Feb 2025 16:20:54 +0100
Message-ID: <20250210-b4-stm32mp2_new_dts-v1-0-e8ef1e666c5e@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFYZqmcC/x3MwQpAQBCA4VfRnG2tQS2vIgkzmIOlHaHk3W2O3
 +H/H1AOwgp18kDgU1Q2H5GlCYxL72c2QtGAFkuLmTVDYfRYc1x37DxfHR1q3EREuatcaXuI5R5
 4kvu/Nu37fo1U79JlAAAA
X-Change-ID: 20250210-b4-stm32mp2_new_dts-8fddd389850a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>,
        Amelie Delaunay <amelie.delaunay@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_08,2025-02-10_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_072449_963282_27A7FF8B 
X-CRM114-Status: UNSURE (   9.68  )
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

Add STM32MP25 Discovery Kit board [1] STM32MP257F-DK. It is based on a
different package of STM32MP257 SoC than STM32MP257F-EV1, and has 4GB of
LPDDR4 instead of DDR4.
Introduce two new SoC families [2] with Arm Cortex-A35 and Cortex-M33,
in development:
- STM32MP23x SoCs family, with STM32MP231 (single Arm Cortex-A35),
STM32MP233 and STM32MP235 (dual Arm Cortex-A35) [3]. Add STM32MP235F-DK
board to demonstrate the differences with STM32MP257F-DK board;
- STM32MP21x SoCs family, based on Cortex-A35 single-core, with
STM32MP211, STM32MP213 and STM32MP215. Add STM32MP215F-DK board based on
STM32MP215 SoC, with 2GB of LPDDR4.

[1] https://www.st.com/en/evaluation-tools/stm32mp257f-dk.html
[2] https://www.st.com/en/microcontrollers-microprocessors/stm32-arm-cortex-mpus.html
[3] https://www.st.com/en/microcontrollers-microprocessors/stm32mp235.html

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
Alexandre Torgue (3):
      arm64: dts: st: add stm32mp257f-dk board support
      arm64: dts: st: introduce stm32mp23 SoCs family
      arm64: dts: st: introduce stm32mp21 SoCs family

Amelie Delaunay (7):
      dt-bindings: stm32: document stm32mp257f-dk board
      arm64: Kconfig: expand STM32 Armv8 SoC with STM32MP23 SoCs family
      dt-bindings: stm32: document stm32mp235f-dk board
      arm64: dts: st: add stm32mp235f-dk board support
      arm64: Kconfig: expand STM32 Armv8 SoC with STM32MP21 SoCs family
      dt-bindings: stm32: document stm32mp215f-dk board
      arm64: dts: st: add stm32mp215f-dk board support

 .../devicetree/bindings/arm/stm32/stm32.yaml       |   13 +
 arch/arm64/Kconfig.platforms                       |    4 +
 arch/arm64/boot/dts/st/Makefile                    |    6 +-
 arch/arm64/boot/dts/st/stm32mp211.dtsi             |  130 +++
 arch/arm64/boot/dts/st/stm32mp213.dtsi             |    9 +
 arch/arm64/boot/dts/st/stm32mp215.dtsi             |    9 +
 arch/arm64/boot/dts/st/stm32mp215f-dk.dts          |   49 +
 arch/arm64/boot/dts/st/stm32mp21xc.dtsi            |    8 +
 arch/arm64/boot/dts/st/stm32mp21xf.dtsi            |    8 +
 arch/arm64/boot/dts/st/stm32mp231.dtsi             | 1216 ++++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp233.dtsi             |   94 ++
 arch/arm64/boot/dts/st/stm32mp235.dtsi             |   16 +
 arch/arm64/boot/dts/st/stm32mp235f-dk.dts          |  115 ++
 arch/arm64/boot/dts/st/stm32mp23xc.dtsi            |    8 +
 arch/arm64/boot/dts/st/stm32mp23xf.dtsi            |    8 +
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts          |  115 ++
 16 files changed, 1807 insertions(+), 1 deletion(-)
---
base-commit: 8c6d469f524960a0f97ec74f1d9ac737a39c3f1e
change-id: 20250210-b4-stm32mp2_new_dts-8fddd389850a

Best regards,
-- 
Amelie Delaunay <amelie.delaunay@foss.st.com>


