Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9417C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 13:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3ZdAYLi+zIrBjJb1+1raCeB2n0nRobcH9FY//yBTp6s=; b=TaHROogAsjaYdz
	aqBow2ByhUk0INQ4aNN1rrBsWwPGcV8hzoMka6WJVQo8zx/TMbVqUc8WmBzHxdIek4kykFFnF4jY4
	4Xrq3Os1pzLrPX3cF7ffIPSHtwID3N3xar8UTwV3NfGu4UUvp4biA/RV9nzjAaA/BkK+InfsVlNpH
	/iI4sk6yJK4PbF8ax+AG+uCxo0bPJR8j8ILN2IfC9DjePFQRHXWynhv7zaytg5VZ/flGYjWyAIftB
	AvpWQ5ArT27LDN2DuPpe9uIfLMSduZ9yaW3WnsI7CCETqRUozS8xEIBqsL5GpaTMiMMQff9T8TxmG
	bCIG6f7szX1UqwdPCh8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKH6x-0000000DHRU-1JZ1;
	Wed, 28 May 2025 13:46:27 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKGuC-0000000DFiz-1LNZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 13:33:17 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SDCReO030453;
	Wed, 28 May 2025 15:33:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=3ZdAYLi+zIrBjJb1+1raCe
	B2n0nRobcH9FY//yBTp6s=; b=rQMBYRe993nQCtuSSzJVisWB/h5StgWmgGoxkP
	uUNNq3m5acVbtH0YnJtQcSTmtGqhsYjtK91/N7upA/Gx1A7HWX5EmgR4tWKIfIzu
	luqu0HID2e7hn35j7jL4XCtwuRNOTGs8txL27/TeqjNv+1B4yf6VF4vTpNhvBqcB
	vDTAHahsBvfDkA79lyWzp4U+5ckfmh1Nb/HCwwr4/t946eHsfAVlJjtD2c+fOTb1
	HG45HR4JAVnjQBm5bwdo7DUQJwbPEKeK0J9rbytdTV/6y7VGiAr7xR3xvvpTxfCf
	I2nFq8+F4pmJvuTOuuxUxkUZcyNfFekV2dY7Z9r6gEavHbVQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46u3hka5qf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 15:33:05 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0F76B4006F;
	Wed, 28 May 2025 15:31:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 455D56CBDEC;
	Wed, 28 May 2025 15:31:00 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 May
 2025 15:30:59 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Subject: [PATCH v4 0/9] Introduce HDP support for STM32MP platforms
Date: Wed, 28 May 2025 15:30:53 +0200
Message-ID: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAA4QN2gC/2XNSw6CMBSF4a2Yji0pt49QR+7DOCh9SAdQ0mKjI
 ezdQmJUHJ6bfP+dUbLR24ROhxlFm33yYSiDHQ9Id2q4WexN2QgIcALAcGdGfB/TFK3qsQCw3Ki
 aKelQIWO0zj+23OVadufTFOJzq+d6vb5D/DeUa0ywNIRJLTilRJ1dSKlKU6VDj9ZUhg/nQHYcC
 ufUibZpuXO6+ef0m9Mdp4W3RmhVS8mE2H1fluUFdChY5CgBAAA=
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
	<clement.legoffic@foss.st.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-6f78e
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_06,2025-05-27_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_063316_673047_67DD92C9 
X-CRM114-Status: GOOD (  16.37  )
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
Clément Le Goffic (9):
      gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip
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
 drivers/gpio/gpio-mmio.c                           |  11 +-
 drivers/pinctrl/stm32/Kconfig                      |  14 +
 drivers/pinctrl/stm32/Makefile                     |   1 +
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c          | 720 +++++++++++++++++++++
 include/linux/gpio/driver.h                        |   1 +
 12 files changed, 991 insertions(+), 1 deletion(-)
---
base-commit: a08b2b34239e63bd839078de98911d3653cdab83
change-id: 20250224-hdp-upstream-622e5da14a9f

Best regards,
-- 
Clément Le Goffic <clement.legoffic@foss.st.com>


