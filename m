Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8E7C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 16:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LtgGtk7CvPVGI/2ASFUIpbLvP3ncVXonBHpF+pLZRwg=; b=v+wKJy8JS7mg6IEOP+OzFDEDkI
	tl6eVoNa1/LGEpkoWNgc3uDpINRGHHJWMEgp25iIZLMlNFz8DkuzJA/g8Dch5TyX2uXUjIoCxVjJl
	P8EhW9YkVGWreDnJya/0gy3qhR/lYbEsMOLWQPcPhVVSabXdeDdiy2yPtG7ZWU4EZ4a+AuWmvLjn3
	I2IZ8wI9Fq7BmFQ6EMmm9bhsQhpyLLUJeIQiEdpx6rbwrwdjT5JMxwe5706JlrhnYY2lQ3yicvDB8
	cJnvTs0x0gBvEa4qsM+TdEvhCG6sJz+a9jSOeikmQD1+v0l5u6MaiqQxBvmUW6O7KJrY+3seYnciB
	uVmV/E4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww0Jn-00000006Wke-3Dnc;
	Mon, 17 Aug 2026 16:36:11 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww0Jk-00000006Wjy-22Am;
	Mon, 17 Aug 2026 16:36:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=orjL2SaTWShhDHS+OiQyEV+A7SkIIuUIw4uSrk7W6yZBJxQD1hsI9erB22rV+5kCwjDT6K8o1henG8zgBQTUGHuWwAIcdlq+HblNVetESoEYhRd5m0iKml9txAMVfzx4cUxYpuURw9badR6UgjQqPiudreheZHatheMemImskisz6j5qEjc4RIBX6ml8W9C0/X9sfEWEJFWInUNVhuJf0yYXYtWxzNXESy4YcOOWybs51pv7lZYCUNCl3gJUdSgf2f3Al+S9mAIY30ik3+iw4DQftSFfgjq5NzTEmwwb7bVmnJvvElc18CUHlx3KIWnaDZTecCdzU0UXz7oiL0eb2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LtgGtk7CvPVGI/2ASFUIpbLvP3ncVXonBHpF+pLZRwg=;
 b=A7uV6+KQjHCUH5MVBFc7fDQ9sTYGhHqMLwQoP53FuSClJWHPmHGftDKiImPyywRobWUFbGsppgMFigVba3o0ek2AvFhBbs82MsTw9pI2P3LpTitnFrj5X8DfMtRWVqv5u/nw1wd5Xu218QXqtFLak0pYg58WuJRVDAVPQlcPRgWq0zexqckVysASuMUrbtkAbOG10aYpbYALboWuLL8/lYXiVS+ZspKPFGUnuM9KPVgTkn/bSHn7R43/mzej80KoIkZc1h1YIzUidrCQVqlXMRHI+JIL6v3oZlB1mx89EMfaqkd4rKDRFfXlD/860XkAShCkcjqP2LNY4OF1nu5eiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LtgGtk7CvPVGI/2ASFUIpbLvP3ncVXonBHpF+pLZRwg=;
 b=XQnj2/11ilNwxaPLIexL76tBPDiQjyRiW1OCTRoCPIhSG8sEfOxWqOkbW4YOR42FFueK/2mgsL0eJCVOS4/P7V3TQCAejjShgpDF5GqhRlJ/6JSgdCxnrTk1vetV9rkMZORz5BL4iVkP8NShYSwqu3ecCYCyj0cEi2OFA8hQ8i83Ki3a6+3FlQulmqCusVYMFfw2G3HN7ZBf2mkqpVZvbuAogQL5+nEoQgf4tNaQry79+1bNrFRQEci4wcztarQtiRgTcEunLlORsZFy5gSf/ltQ0EfDwocG/Bz0pjj3Nvt1ofZZuxckmmku3bMxNShCbDcG6xbPCPM8qqRcu7tzPA==
Received: from AS4P190CA0023.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::9)
 by DUZPR10MB8128.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4e1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 16:35:57 +0000
Received: from DB5PEPF00014B8F.eurprd02.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::30) by AS4P190CA0023.outlook.office365.com
 (2603:10a6:20b:5d0::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Mon,
 17 Aug 2026 16:35:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B8F.mail.protection.outlook.com (10.167.8.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Mon, 17 Aug 2026 16:35:57 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 17 Aug
 2026 18:41:29 +0200
Received: from [10.48.86.251] (10.48.86.251) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 17 Aug
 2026 18:35:55 +0200
Message-ID: <61dc785c-bea1-4674-918d-0f38ea253a29@foss.st.com>
Date: Mon, 17 Aug 2026 18:35:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Subject: Re: [PATCH v2 0/9] arm64: dts: phy: st: usb: Add STM32MP2 USB support
To: Marek Vasut <marex@nabladev.com>, <linux-usb@vger.kernel.org>
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>, Christian Bruel
	<christian.bruel@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, Pankaj Dev <pankaj.dev@st.com>, Rahul
 Kumar <rahul.kumar05@st.com>, Rob Herring <robh@kernel.org>, "Rosen Penev"
	<rosenp@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, "Vinod Koul"
	<vkoul@kernel.org>, <devicetree@vger.kernel.org>,
	<kernel@dh-electronics.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
References: <20260816213849.1044073-1-marex@nabladev.com>
Content-Language: en-US
In-Reply-To: <20260816213849.1044073-1-marex@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.251]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8F:EE_|DUZPR10MB8128:EE_
X-MS-Office365-Filtering-Correlation-Id: db2f5d1d-e3d6-47bd-c260-08defc7d9d64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|23010399003|7416014|376014|82310400026|30052699003|13003099007|10067099003|11063799006|5023799004|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: K7ZE1UkkXfhi044gNQDhYTEW90nkqXoqo9MnyenxUh6A0j3bCFJwrAgFbmSVfCntqDIfP+jWC9+y2Kg5DQd5EsN7XDHpxY1YJ18eCTUpqD3AnardeczKwY8MoG5ew7zGsIplUPycXIeZz6HqyWnGJu94rNygwgWk6i2zYeZdDX2IbEEJV7D9GyhukCgMCJzxHILlBx+IacN41HVMN4x6ae09ymSYA0ANUPYc47A8PC2ik954x8zgShMoPruxx80BJjEkVj0jWwJRI36X+08h1i3pRSVbnGBbB7qP65rWXIZxd1txNHRJ0HDV0DOuiXqFY0SlDaRR8H6vcBM+NaTa/lzzCjxBHnvGBUW8Q8XV1wRh7JJu39US5jpW0wWO+t9Bmp3cb0BL4YLLG7L2gb20ne4FH4XZyGuDwwTGa/I9DAssxcMiOMvD3YF+IoSJXUXAZ/Z6tzN+3LsS/kZBQ8PUjxSeJFKCuVATRU0VpG4phTDUwWB1ADOnbqplBXS6hphLejd94LMeNN+axTkESXGnenaO/E8jBHfzILvgmxqIA4EKo1+zmdadzOh0UpnCvNjpIIdPEAIkSLwJOo0wO6iYsEnRsYGF2bRfqJBBMsFQn0YDVctPzjkB+R1xN2TKd7dis8m3IqWZHC3nq3uxiFSe0v1v0Oo5YbnZb9huD4+i7eJ6cXy1T2V78KTx6iyVyGz3Ki5PFYiB5L1KIWhP/Kt/Tg==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(7416014)(376014)(82310400026)(30052699003)(13003099007)(10067099003)(11063799006)(5023799004)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +PYaZidKlprj2efIJxzIN01HlqVYGKPrtSgMPNYIqF+Oa9NaWYJSzIcqvxqKiIEdHEq295PfH/L8fHEO13jlOIu6aYo/Nxv3cESPQyyKlUg29HipKdMRRnqAS7cDc295rLO8tbEb+T8pwoDCDsFkXGrgwgaOat8Rgdm0IrenkpCl9REhc8vT0qGa6rMhTeQH+aCnrYiJXxpau7OE+FJd2MveZ3VgAol4FaATJgadF4c7cVxYu1z+7JcpioBfm6GExbcAF1SmT5/SOEl5gFtxQ0IN1BHA35hymWld49HRPbr9orr2y3YG4QQ4/0HV9DBExT1doemkS9HKSYtSvsFH2in6srXi0yhxk/PN6L4XPRiYuj6fikq4eOhTfW5C1rmiQ8DYztMfFNHeMWq14RW4YlysCk0RSaArQ/ueBgORlnhftyntzr6a1wannC+O3GK6
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 16:35:57.3688
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db2f5d1d-e3d6-47bd-c260-08defc7d9d64
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR10MB8128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_093608_540656_A04891EE 
X-CRM114-Status: GOOD (  16.80  )
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


On 8/16/26 23:37, Marek Vasut wrote:
> Add USB support for STM32MP23xx/STM32MP25xx SoCs. This includes USB 2.0
> FEMTO-PHY driver, DWC3 glue code and DT adjustments. Parts of this are
> taken from ST downstream kernel fork, reduced, or rewritten, since not
> all of the content there was useful and bits which might be missing and
> are useful can be added later.
> 
> Unlike the downstream implementation, the DWC3 glue code is using plain
> dwc3-generic-plat, the EHCI and OHCI controllers are instantiated as
> plain generic controllers without any wrapper glue driver, and the USB2
> PHY driver is simplified.
> 
> Both USB 2.0 Host controller and DWC3 super-speed controller are tested.

Hi Marek,

Regarding dwc3, I've started to test and needed another patch from our
downstream. I've posted it here:
https://lore.kernel.org/linux-usb/20260817163101.6203-1-fabrice.gasnier@foss.st.com/


Regarding USBH, there's a dedicated glue on STM32MP2x SoCs for the
EHCI/OHCI controllers, similar to the dwc3. On dwc3, I see it can be
managed.

There are:
- AFMUX signals out of EHCI/OHCI controllers, to manage a Vbus power
switch (with polarity) control.
- AFMUX need pinctrl to be added, and managed during system PM
- On coming MP21 (not supported here), there's address translation control
- Common dedicated interrupt to manage wakeup

Using generic controller drivers, I don't see how to manage it, without
describing it in the DT.

For sure, generic ehci/ochi drivers and bindings can/must be used. What
would be the proper place for this glue to leave ? Why not adding the
glue driver from the downstream ? That's supposed to address this.

Do you wish I send it upstream, so it can be properly reviewed, amended ?

I'd like to sort this glue management out before the DT for the USBH can
land.

Best Regards,
Thanks,
Fabrice

> 
> Marek Vasut (6):
>   dt-bindings: usb: generic-ehci: Document access-controllers property
>   dt-bindings: usb: generic-ohci: Document access-controllers property
>   dt-bindings: usb: dwc3: Document ST STM32MP2 DWC3 xHCI USB controller
>   usb: dwc3: dwc3-generic-plat: Add ST STM32MP2 DWC3 xHCI USB controller
>     glue
>   dt-bindings: arm: stm32: Switch st,stm32mp23/25-syscfg into simple-mfd
>   arm64: dts: st: Add USB nodes on stm32mp231
> 
> Pankaj Dev (3):
>   dt-bindings: phy: Document ST STM32MP25 USB2-FEMTO PHY
>   phy: stm32: Add support for ST STM32MP25 USB2-FEMTO PHY
>   arm64: dts: st: Add USB nodes on stm32mp251
> 
>  .../bindings/arm/stm32/st,stm32-syscon.yaml   |   7 +-
>  .../bindings/phy/st,stm32-usb2phy.yaml        |  73 ++++
>  .../devicetree/bindings/usb/generic-ehci.yaml |   3 +
>  .../devicetree/bindings/usb/generic-ohci.yaml |   3 +
>  .../bindings/usb/st,stm32mp25-dwc3.yaml       | 108 ++++++
>  arch/arm64/boot/dts/st/stm32mp231.dtsi        |  81 +++-
>  arch/arm64/boot/dts/st/stm32mp251.dtsi        |  65 +++-
>  drivers/phy/st/Kconfig                        |  10 +
>  drivers/phy/st/Makefile                       |   1 +
>  drivers/phy/st/phy-stm32-usb2phy.c            | 361 ++++++++++++++++++
>  drivers/usb/dwc3/dwc3-generic-plat.c          |  44 +++
>  11 files changed, 751 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml
>  create mode 100644 Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml
>  create mode 100644 drivers/phy/st/phy-stm32-usb2phy.c
> 
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christian Bruel <christian.bruel@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Pankaj Dev <pankaj.dev@st.com>
> Cc: Rahul Kumar <rahul.kumar05@st.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Rosen Penev <rosenp@gmail.com>
> Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-usb@vger.kernel.org
> 


