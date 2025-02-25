Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B97C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 08:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hJp37HjRsS682VOG5jU/XHJBc6aQu3148SnFqqYYIJs=; b=BFDuoMcE6vLfWa
	jBM1yC0nXM8O45C+WbWTy5sttr/5qR4d2T8z9B+ei7P7iWkmfHb7jPfB7m5flrNzcQa4r0a6+HNTt
	bJzw/vQ7axG7xM7p5A9RpS22h2PEe9nhEbwfbhIP/3mX5nFqRi8JBuIGByk1roamNuwpGMfyU+PY3
	w+x5L2f/Hkt2XLpqKBliXRCGO6QB/yqeL4guhjhuZ/4Hy90i9HjBORJg6VWrxI6/oyRrx3HKeS3QP
	ONj4OAgJwjxywU/IFGz0+ktehvOY4vk7gRJoxMwYKhzz/R9KcyhmNp8kCXG58vuKS3VF4hsuU1R24
	AtRNCYi6vNNw2FlX1kOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqlh-0000000GUDi-3fI4;
	Tue, 25 Feb 2025 08:58:21 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqfi-0000000GSw2-3hgi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 08:52:13 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P7nJ8V022886;
	Tue, 25 Feb 2025 09:51:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=hJp37HjRsS682VOG5jU/XH
	JBc6aQu3148SnFqqYYIJs=; b=wokAmkmNpW2iVOAoTyplt01g7lc3I6lK1JoBYv
	5ukC+rWeH/OUKA6tcVveTCTqohwD+FQFBxAkroO50xd2+xp0tgbVg6tQ6myJn/N0
	lyeL7PeVQ5dIents9G6bl8VMQNSS3W2sEtSMWsGEzEDgl7x5f6nt9ah/SsJlpXns
	63rWLs+63cui536rbOoI88B+z8kP4s04Dbve5AZyBVMk5XyysyfsDqnPvlXYI6Ht
	e+3tErD9obpGTVFpMaSTFKHn8A6FwIcBSjRvMW2/FrWmtbB4hT0TYhE5FwM5nXiH
	+DXxQKzkHArsgWBkg7zKoteVc4BkmtduikXKly5OvKPtR8TA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4512sp1td1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 09:51:59 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1BA7B40056;
	Tue, 25 Feb 2025 09:50:50 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 06FFC479F61;
	Tue, 25 Feb 2025 09:48:06 +0100 (CET)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 09:48:05 +0100
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Subject: [PATCH 0/9] Introduce HDP support for STM32MP platforms
Date: Tue, 25 Feb 2025 09:47:59 +0100
Message-ID: <20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAL+DvWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyMT3YyUAt3SguKSotTEXF0zI6NU05REQ5NEyzQloJaCotS0zAqwcdG
 xtbUAc+Fd+l4AAAA=
X-Change-ID: 20250224-hdp-upstream-622e5da14a9f
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-42535
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_03,2025-02-24_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_005211_222871_5962C68E 
X-CRM114-Status: UNSURE (   9.90  )
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

This patch series introduces the Hardware Debug Port (HDP) support for
STM32MP platforms.

It includes the addition of device tree bindings, the HDP driver,
and updates to the device tree files for STM32MP13, STM32MP15,
and STM32MP25 SoCs.
The series also updates the MAINTAINERS file to include myself as the
maintainer for the STM32 HDP driver and adds the necessary
pinmux configurations for HDP pins on STM32MP157C-DK2 as example.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
Clément Le Goffic (9):
      dt-bindings: pinctrl: stm32: Add HDP includes for stm32mp platforms
      dt-bindings: pinctrl: stm32: Introduce HDP
      pinctrl: stm32: Introduce HDP driver
      MAINTAINERS: Add Clément Le Goffic as STM32 HDP maintainer
      ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp13
      ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp15
      ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp25
      ARM: dts: stm32: add alternate pinmux for HDP pin and add HDP pinctrl node
      ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp157c-dk2 board

 .../bindings/pinctrl/st,stm32-pinctrl-hdp.yaml     |  72 +++++
 MAINTAINERS                                        |   7 +
 arch/arm/boot/dts/st/stm32mp131.dtsi               |   7 +
 arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi        |  26 ++
 arch/arm/boot/dts/st/stm32mp151.dtsi               |   7 +
 arch/arm/boot/dts/st/stm32mp157c-dk2.dts           |   6 +
 arch/arm64/boot/dts/st/stm32mp251.dtsi             |   7 +
 drivers/pinctrl/stm32/Kconfig                      |  14 +
 drivers/pinctrl/stm32/Makefile                     |   1 +
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c          | 301 +++++++++++++++++++++
 include/dt-bindings/pinctrl/stm32mp13-hdp.h        | 130 +++++++++
 include/dt-bindings/pinctrl/stm32mp15-hdp.h        | 116 ++++++++
 include/dt-bindings/pinctrl/stm32mp25-hdp.h        | 144 ++++++++++
 13 files changed, 838 insertions(+)
---
base-commit: d01895c5b11849113e70f012d9d142f1d88852f0
change-id: 20250224-hdp-upstream-622e5da14a9f

Best regards,
-- 
Clément Le Goffic <clement.legoffic@foss.st.com>


