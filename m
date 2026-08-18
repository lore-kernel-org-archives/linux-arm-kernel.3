Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DECC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 16:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kMK+Ku+hA5dZbnfHvQk2PddKmww15URToYfyCeNLC0o=; b=b9kR4zI+oThV+4D0HKktu3Nhjs
	Ee2mjnuzIXV0XNIveYYB92w5WdxJWs6JTKVagIHdQ0vPjkKqG6h4BXJD7DCmWs/tvDO6VYDbuExUS
	8zY20yl6w8b7yMRzrsEzRtBZ6yKC7/VZGcZCQwXEFhqR6VnevTSG1UE+DwPfU1SpHKnQJJ+g7d54m
	yeNyxUxvURa7mvTSyOj0bBUOeNXX8kvd5mU99NvwJd70EjFm8bjrJmApev5r3tiTcTPT+dKB112TW
	bmWl92fqGkynC/0A4ZGmw57otTTf8mMcjTGG31BoVG1F5ymR3ajNeMx3zBATMKj45G66ssGLWww77
	1C3x5ekA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwMLW-00000008JpE-1OKX;
	Tue, 18 Aug 2026 16:07:26 +0000
Received: from mail-northeuropeazon11010057.outbound.protection.outlook.com ([52.101.84.57] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwMLT-00000008JoX-0k6s;
	Tue, 18 Aug 2026 16:07:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SlUdeDbLNT0V+EthhK9lnFXmiJBWE5dFc7ZhkGko6kVRED9YxhmvYeVepEceFJ5IZVvTIFTmo6CsaufRxtxWrjUbb1wMn9zOOp2LTXz7AagSyepkgsxVuHao08tv/S0a8K8cvOt8blUsHV8sG6civmjxtF/ZqdPOKWIvawUsLaIc3zxQwDOcz7XKKoEKQxlrUuRObYU+MVfZtnw+KB622y+ayCxeUDkX/UrfXKkTOfxrPM1mHaBgntf4TmXWlrR/7pHQGm6hf86Z+rA2YASzbpnO1Q8+h37nnPwwEGhoRK767wVJ8NQAsQTqfLhu73l8SX+lcJMLJhuprZa+Oct2cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMK+Ku+hA5dZbnfHvQk2PddKmww15URToYfyCeNLC0o=;
 b=NoAPgQNn2VPctX+0SYOURAtIcJgbyGjtNgu/bHu22gRP7Aqb/LaytX9RtLUYna9enCuuQqZzInWk1JWaJElfOrfafUKfz7Awo+M4YVK4r/9W6eam1kTkT2qNQXNzAs81Fz8v1vUSSvusWxTypRV0syg2Po0sKivh9tLZgdXeZWRedNE/RUU8ucmm50IquCsLyxkqRfGMFoTtovTOobxs9Yu4xbnQt37NuMSqjPRdMX1I/nzvA8l7kwje5x5AxOyygqYoPyA0jOBIltC0CEtEXDNOAsqPZjW8Nn9d7/fXHpJFXuao9TdcX6Ly8J2PSg5v5ug4e7x2BXunF/zSR8mflA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMK+Ku+hA5dZbnfHvQk2PddKmww15URToYfyCeNLC0o=;
 b=gSvkZ8ZYjhIUGFWyOg0sL0d6x0UkCm8A3xqHpWZCwoznHsN/KVvl0hw+rQdwpqPqC2WWr0ekBe6wA7jwn0GzlusxbU5dIsuqo2iewxsDf7r+W6rQ70AQWdEg6KvuwZsh/spjGr27Qpu1SPfxQhOzgggJvrLp0HwSjNfkZXhUZs3uWOLqVjNa0oozcghd+DHRuqmViYPVsW/HKvB3qyGejjPF8aNekt4jZ72wyxWepfj1zVeez0d3Ird4+aMmO6aTfB8tfPhoboTvOAMGvN1d5FKvNzG9f9PPUq0sedHIoRnDIBYRi756YAq3ZD89v9SaWpcpkMCXysmp5Q8YHeXDeQ==
Received: from DUZPR01CA0335.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::19) by PAWPR10MB8185.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:37f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 16:07:13 +0000
Received: from DB1PEPF000509E2.eurprd03.prod.outlook.com
 (2603:10a6:10:4b8:cafe::37) by DUZPR01CA0335.outlook.office365.com
 (2603:10a6:10:4b8::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Tue, 18
 Aug 2026 16:07:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509E2.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Tue, 18 Aug 2026 16:07:12 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 18 Aug
 2026 18:12:46 +0200
Received: from [10.48.86.251] (10.48.86.251) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 18 Aug
 2026 18:07:11 +0200
Message-ID: <6c900e6b-2f50-4ec2-aca4-3093479bba53@foss.st.com>
Date: Tue, 18 Aug 2026 18:07:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
 <61dc785c-bea1-4674-918d-0f38ea253a29@foss.st.com>
 <41e7978b-933d-4813-9158-00474f531476@nabladev.com>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <41e7978b-933d-4813-9158-00474f531476@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.251]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E2:EE_|PAWPR10MB8185:EE_
X-MS-Office365-Filtering-Correlation-Id: e7953a30-0510-4086-6eab-08defd42c3d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|1800799024|30052699003|82310400026|7416014|376014|10067099003|56012099006|6133799003|11063799006|4143699003|5023799004|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: NQ6OB4axsvDaqiQjBDeFiYzeH3KDeptZwH1vzDlLtsiWTikaD4IX5t7j03tbJkVEXO7gPFJob2tY3F1B1Yvpp3cUZPCGVVDpH4/mO5RdFveNuVAJwv2M3+pIG5OROezUUERTM5jIqUGsUIXoEg2GksqvsAN4/LkTGmaI4X7zTDKmks9tS2r2+XvwJKxlOZ5S17YE47HVdGExn+ksIAZeCvV26zup98mMWP5Ko2kHJrfsE1gnqEatDXUOE+YQwMZO4jw9LakzLRjJYr8YaFCzW8jBErH8GmEzDlBX3D5IZiFUb7uJrjF32jovflCEuHaavRP3nMTzbV+uanzagFahxw1C3ao5ydVHTxnjton+agfHNIeKt1RJYORGJgTe1afcjOA4e7UnV8GCE/1qMLbu/DJeLJFBRmF6hzSzfkLC71jQzlNig7HlyAIEX5AfH0MyuaAOZIhkJArsFHez7olowG1hu0ladNEW7QZ9plnzF+hA/jQBDFkJOiqFbcQTSabJd2aeSofUxjE03gYnUaMxp2699eC2/D8U95zpqeKKXeRMPOgbhDjgbumlHHOpiLRfejakdSTMID/ancF7uqbFRKz2yd7LlZX2BruPPO4cHEVT3cD4bIRqMp82CwPDt7dfy2C44gBvm6ciQS4j0AnYzAqM6L1z4bc2KiNZGsr0YNuORa/Yifphu92qPfn+ifKaP3EkWcNj8Ondgig/GAW2lw==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(30052699003)(82310400026)(7416014)(376014)(10067099003)(56012099006)(6133799003)(11063799006)(4143699003)(5023799004)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: awHW5W/QuD2Y3N0JBDEyghnDDSSoXSW0dUtHw2y2a7UlxmWomuJBt7vWS7yBbwiAvE0Yl/MNOEoPueaE8KgHbvgkyiF1LmsJKI1Wn68ssXIdHx1OhKDQv0aWLsT8+g/+x42HfMMIYW1dQv66cTQ5Gw33qSeBT26dFvfH5ih+mzDeUZGygOggmtrJxm658hb1InlNzhZhktBaZ2IEnArjpK+FEoz9yjAiaQOpe2VrbpLJ+CgkKtGKTwF0hBHnLc0hZvaMCjCtvxoVhzzyCiM9QjYlEGt1fIKAwD/8XFQiCvGupzXELLKPGF1JQtfo/YLPvGDaF8nI0p4oVSuZzipUHGtUAomI81OEdIzV8iu54rd7bmg03Of0R4T5glLMs9kPtgehDHP7XOwmuFzz2nUYfoMAFEhyQG+QQzKvEmNv26WppJExtSOGf79Dn35fc9V0
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 16:07:12.7189
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7953a30-0510-4086-6eab-08defd42c3d6
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB8185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_090723_539775_884C3573 
X-CRM114-Status: GOOD (  25.46  )
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

On 8/17/26 21:48, Marek Vasut wrote:
> On 8/17/26 6:35 PM, Fabrice Gasnier wrote:
>>
>> On 8/16/26 23:37, Marek Vasut wrote:
>>> Add USB support for STM32MP23xx/STM32MP25xx SoCs. This includes USB 2.0
>>> FEMTO-PHY driver, DWC3 glue code and DT adjustments. Parts of this are
>>> taken from ST downstream kernel fork, reduced, or rewritten, since not
>>> all of the content there was useful and bits which might be missing and
>>> are useful can be added later.
>>>
>>> Unlike the downstream implementation, the DWC3 glue code is using plain
>>> dwc3-generic-plat, the EHCI and OHCI controllers are instantiated as
>>> plain generic controllers without any wrapper glue driver, and the USB2
>>> PHY driver is simplified.
>>>
>>> Both USB 2.0 Host controller and DWC3 super-speed controller are tested.
>>
>> Hi Marek,
> 
> Hello Fabrice,
> 
>> Regarding dwc3, I've started to test and needed another patch from our
>> downstream. I've posted it here:
>> https://lore.kernel.org/linux-usb/20260817163101.6203-1-
>> fabrice.gasnier@foss.st.com/
> 
> Understood.
> 
>> Regarding USBH, there's a dedicated glue on STM32MP2x SoCs for the
>> EHCI/OHCI controllers, similar to the dwc3. On dwc3, I see it can be
>> managed.
>>
>> There are:
>> - AFMUX signals out of EHCI/OHCI controllers, to manage a Vbus power
>> switch (with polarity) control.
>> - AFMUX need pinctrl to be added, and managed during system PM
> 
> This can be managed by the PHY instead, can it not ?

Hello Marek,

Please see later comment.

> 
>> - On coming MP21 (not supported here), there's address translation
>> control
> 
> What kind of address translation ? IOMMU ?

This is much more "basic". The controller can address 4G of memory, e.g.
it's 32bits. That feature is only for STM32MP21 that can address 4G of
DDR which starts at 2G offset. So basically there's a SYSCFG bit
(SYSCFG_USBHARCR AREN), that adds a 2G offset so the controller 'DMA'
addresses directly the 4G of the DDR (instead of 2G lower memory map,
that's not necessarily useful, and 2G of the 4G DDR, requiring swiotlb
with perf penalty).

Current downstream glue driver checks the 'dma_range_map', (e.g. DT prop
dma-ranges = <0x0 0x0 0x80000000 0x1 0x0>;) that represent this, to
enable the syscon bit that adds offset in hardware (so 4G of DDR can be
accessed by the controller, without swiotlb).
For USBH, there's nothing mode: set it at probe time, based on
dma_range_map, restore it after resume from low power.

> 
>> - Common dedicated interrupt to manage wakeup
> 
> This is EXTI configuration, is it not ?
> 
>> Using generic controller drivers, I don't see how to manage it, without
>> describing it in the DT.
>>
>> For sure, generic ehci/ochi drivers and bindings can/must be used. What
>> would be the proper place for this glue to leave ? Why not adding the
>> glue driver from the downstream ? That's supposed to address this.
>>
>> Do you wish I send it upstream, so it can be properly reviewed, amended ?
> 
> I would very much prefer to avoid the glue if that is at all possible.
> Thus far, it seems this could be done (interrupts are generic interrupts
> managed by EXTI, Vbus detection polarity is likely a PHY thing since
> this is managed by SYSCFG anyway) ?

I better see your point, thanks for your explanation.
This makes sense! For this part, the approach can be the same on all
STM32MP2 SoCs (21/23/25).

Still for STM32MP21 address remapping feature (out of scope here) I
think there will be not much choice to keep a minimal glue DT & driver
(and parent to generic ehci/ohci). It seems totally out of the PHY
driver purpose.
Maybe you have some thoughts about this ?

Please advise,
Best Regards,
Fabrice

> 
>> I'd like to sort this glue management out before the DT for the USBH can
>> land.
> ACK
> 
> [...]


