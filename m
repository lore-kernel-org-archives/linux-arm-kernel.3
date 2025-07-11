Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BCBC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 08:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uuDTz2OBo60kJWuliEHNDZybBbmEHsHQuc3BlwbYSOw=; b=d3WzhuV8cJE+Gy
	uRb6hMJBm861pArb4U9o3AayROltmycO5y3hPAz/pxsVu8Fa7sNEOeeyTt7LFu8e4HmcI51jrjpTC
	pgND+/pKN8v2AV21PC7CaD+G0xiAS+joFOBJdklPGHRJrfSdK2K7VEPl2jsijYqyZ6Fv/14vkr/9g
	4SscNkU9N/xX0exWbt0l7q3mLvD8H7XSbgfaWIBG7VKpMu9Ycw+ckT9p9JuJxRAEavJ48y5HlCSMc
	mfNQWU9mXFpqJufU6UHjX3nDGXE3GuXigLtGxIgBEvoXC8FHjgz/9hbneMSOXxyrQkU5QwZnmreox
	Dmkl0lz5jaRBqKUdzTIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua90s-0000000E6s4-07Ly;
	Fri, 11 Jul 2025 08:21:46 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8QK-0000000E0on-2JPn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 07:44:02 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B6UUJ6017493;
	Fri, 11 Jul 2025 09:43:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=uuDTz2OBo60kJWuliEHNDZ
	ybBbmEHsHQuc3BlwbYSOw=; b=gB9CGcZe4fDDd61vM8aB8ttFHRSrOh007m2CrJ
	T+qnmotBinFSUCavbNg+7wQwZbr/BAvBNl6cEnQkSHaEyyIN9tLBsR+KFrFylifS
	K5VlL10ZyZ4C0Lb/FQMCF4o1VN5LUiJZFpXz5joJM1xADElvQUW54wNJ18lw1DWd
	39FssGb/NStr32szR4CLBkjpv1/lryKeGjAX4grcsMdU9zLrV5h2sdvtXj3iU31o
	w2yl1rq3sIjtHgk/1XJEneVm38Xz7pegEm1P+BiOmizo/xxCsqVc7JvfGJQEcux1
	NRFHxNyRM574yUFkFlnzsmR+27jtSPuAoOYThkA/uzeFtafQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47qdm6arjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 09:43:51 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7CE2E40051;
	Fri, 11 Jul 2025 09:42:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E3983AE9B67;
	Fri, 11 Jul 2025 09:41:36 +0200 (CEST)
Received: from localhost (10.252.16.187) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Jul
 2025 09:41:37 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Subject: [PATCH v7 0/8] Introduce HDP support for STM32MP platforms
Date: Fri, 11 Jul 2025 09:41:18 +0200
Message-ID: <20250711-hdp-upstream-v7-0-faeecf7aaee1@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAB/AcGgC/23PzW6DMAzA8Vepcl6qYMeG9LT3qHYI+Rg5tCDCU
 KeKd19aaSqDHW3p93dyFzmMKWRxOtzFGOaUU38tQ/12EK6z188gky+zAAWkALTs/CC/hjyNwV4
 kAwTyttLWRFHIMIaYbs/c+aPMXcpTP34/63P12P6G6G9orqSSxittHBOisu+xz/mYp6PrL+KRm
 uHFCdSGQ+GEkdumpRhds+e45rjhWHjr2dnKGM38z3W95s2G68LrYFq0HhSy33N6ca6216lwjp6
 j8o6gdnvOK757PBeOTU1YAg2azd+XZfkBhJHY++UBAAA=
X-Change-ID: 20250224-hdp-upstream-622e5da14a9f
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Antonio
 Borneo <antonio.borneo@foss.st.com>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<legoffic.clement@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-7616d
X-Originating-IP: [10.252.16.187]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_02,2025-07-09_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_004400_876044_EF569EDC 
X-CRM114-Status: GOOD (  16.27  )
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

It includes updates to the mmio gpio driver, the addition of device tree
bindings, the HDP driver, and updates to the device tree files for
STM32MP13, STM32MP15,
and STM32MP25 SoCs.
The series also updates the MAINTAINERS file to include myself as the
maintainer for the STM32 HDP driver and adds the necessary
pinmux configurations for HDP pins on STM32MP157C-DK2 as example.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
Changes in v7:
- Due to reorganisation, my contract with ST ends at the end of this month
  and I will no longer have access to this mailbox.
  Therefore, I will be available for any mission related to embedded and
  kernel linux.
  Change email address in MAINTAINERS file for STM32 HDP driver
- Link to v6: https://lore.kernel.org/r/20250623-hdp-upstream-v6-0-387536f08398@foss.st.com

Changes in v6:
- Add Krzysztof Kozlowski's 'Reviewd-by' trailer on bindings.
- Remove gpio mmio patch as taken by Bartosz Golaszewski:
  https://lore.kernel.org/all/175031700235.8154.11042956002137082224.b4-ty@linaro.org/
- Link to v5: https://lore.kernel.org/r/20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com

Changes in v5:
- (Better) Change the bindings file name:
  's/st,stm32-pinctrl-hdp.yaml/st,stm32-hdp.yaml/g'
- Remove Krzysztof Kozlowski's 'Reviewed-by' trailer on bindings.
- Add Linus Walleij's 'Reviewed-by' trailers.
- Refine SoC dtsi patch's commit message to explain the need of keeping
  the HDP node disabled.
- Link to v4: https://lore.kernel.org/r/20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com

Changes in v4:
- 's/Add/add/g' in MAINTAINERS commit message.
- Fix the (wrong) status update for the thermal node in stm32mp131.dtsi
  file.
- Do not enable HDP by default during compile testing.
- Change the bindings file name:
  's/st,stm32-pinctrl-hdp.yaml/st,stm32-hdp.yaml/g'
- Add Krzysztof Kozlowski's 'Reviewd-by' trailer on bindings.
- Link to v3: https://lore.kernel.org/r/20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com

Changes in v3:
- Use `bgpio_init()` function:
    - Add add patch to create the `BGPIOF_NO_INPUT` flag needed for the
     `bgpio_setup_direction()` used in `bgpio_init()`
    - Remove `stm32_hdp_gpio_get` and `stm32_hdp_gpio_set`
- Use `static` pm ops
- Update bindings:
    - add pattern instruction for pin values
    - remove function's maxItems to use `function: true`
    - fix the compatible in the exemples
- Link to v2: https://lore.kernel.org/r/20250520-hdp-upstream-v2-0-53f6b8b5ffc8@foss.st.com

Changes in v2:
- Remove bindings header files with function name as #define
- Add match_data with function name for three compatible:
  "st,stm32mp131-hdp", "st,stm32mp151-hdp" and "st,stm32mp251-hdp".
- Rework a bit the driver to use match_data.
- Remove the use of `dev_err_probe(` in the resume ops.
- Remove `MODULE_ALIAS(`.
- Remove the vertical bar in bindings description paragraph.
- Fix an error in the `pinctrl-0` parameter of the binding example, it
  was refering a node that wasn't existing.
- Use uppercase pin names.
- Link to v1: https://lore.kernel.org/r/20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com

---
Clément Le Goffic (8):
      dt-bindings: pinctrl: stm32: Introduce HDP
      pinctrl: stm32: Introduce HDP driver
      MAINTAINERS: add Clément Le Goffic as STM32 HDP maintainer
      ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp13
      ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp15
      ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp25
      ARM: dts: stm32: add alternate pinmux for HDP pin and add HDP pinctrl node
      ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp157c-dk2 board

 .../devicetree/bindings/pinctrl/st,stm32-hdp.yaml  | 187 ++++++
 MAINTAINERS                                        |   6 +
 arch/arm/boot/dts/st/stm32mp131.dtsi               |   7 +
 arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi        |  25 +
 arch/arm/boot/dts/st/stm32mp151.dtsi               |   7 +
 arch/arm/boot/dts/st/stm32mp157c-dk2.dts           |   6 +
 arch/arm64/boot/dts/st/stm32mp251.dtsi             |   7 +
 drivers/pinctrl/stm32/Kconfig                      |  14 +
 drivers/pinctrl/stm32/Makefile                     |   1 +
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c          | 720 +++++++++++++++++++++
 10 files changed, 980 insertions(+)
---
base-commit: 31b6d25a25ac3fe4ee6092f2bf04a816e4b5b64a
change-id: 20250224-hdp-upstream-622e5da14a9f

Best regards,
--  
Clément Le Goffic <clement.legoffic@foss.st.com>


