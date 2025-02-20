Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4E9C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 12:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yi43V5YG9gUuczc2/rOeuRYqRNtYrSrKuLwFZwDUMl8=; b=J7DOHSVMVVUNKdTRqDPM7SXTDI
	sB/Jp831QlF5/ZUkHEhWeOwAISZR67x3cjbpfbY346L0of6ZxVmLWIDxBAlLWZP8+wE56yFD9gtF8
	jWYWYwoZmZXOfwSVhLzfZReW9RejqZe56qfr6LVvIC4VknZDO6ml4u5MbOl99vpTyOayBENKWsdP8
	ja96jh2Tb6qfHuKVam9s2DRjA89cUD9zmQgCecS+O4bCv3YJftct5WzidUF0SsSKzITqOrQbC2t+k
	Pgs5fy0IS1VEWg5ghYXkEJ1xnCxJiFZRE7AcDSCUEpXCi+iZZCPgDZyNKZPwuwyfTMXw7w5m+/k2r
	aMrFBSBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl689-00000000vAk-133A;
	Thu, 20 Feb 2025 12:58:17 +0000
Received: from mail-sg2apc01on20720.outbound.protection.outlook.com ([2a01:111:f403:200f::720] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5hk-00000000oH3-2NUy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 12:31:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DbQfH5lAc42d2VfO9DFSS8AgfxGbIR17PcUlw3wEsAHiJOOJ01cUQGM2H1rXrpNdQDL6EuoAn6qD7NKqu++X+mCBiJhYLTuew/4PeBlTIuSX8jrdV72SWn16qzbvgTUPZVoMB8QI6UwHO1rekObneL0kfyJ/oPxyIoijNhXBhPKapusztHV+b8QNcnbJACQuiujgLwqFVHZf/bW47At8v/bjaAZQKDkUbfvX8/hihMXinI3aydsetUNOzQiU8j4dPLBpI5Cy5JngspSVFbVZMETixz4mg61wPPHr8lcQatLd1tNM/ZGv+Ukp3s4059MpdvWCxKDo06GClks15d14Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yi43V5YG9gUuczc2/rOeuRYqRNtYrSrKuLwFZwDUMl8=;
 b=IQYzGynTaycPJ1KCXMUZbgp25HbGWiRpp5bjGCrGdTMblOkN3ij62saW/+HQD7SesbqtlnzXNU+kWX1vVNftjYwFOHfnaY5/KulSGqbU4mqFefwrhXRUMc31nkIqomINkTCMzlnxbV6/Aqv/rwaTNWrVaTPc1Oa/H9fEFX8dvXmse2Ig4Lt3U0lwuCZgn78ABBWsl+USnQ5C7iIeAJmCLC6FF8p/EmTU0bo5caBZZ4Zw0+Z/bDP3vkCWcSUFDcm1ydxErzNwU/y3Xe7wFC4UUcTaC5JBCbVuiXgEP1sX8zE+S7SVtpu3fvbg5IPB+fmQktsWOfjJkixX0lEmLAw7/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cixtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yi43V5YG9gUuczc2/rOeuRYqRNtYrSrKuLwFZwDUMl8=;
 b=AntMyIid8N1cB0Kri0v69E6ASCpihdZqdkjY5GFXNnnxLMRLGJeNm84r+3/3DQdCseBx9JF+KIgo5vmwbH6cRw/CLb0mVdtENi+TKx6QQu5OEVK7OUrmaaVj8WNbhMwSslDqlZaDXz19OR5nx94GQo14d9SE71T76IhsxZIsdp9ZbGET02tqaMiau4khhm0nKOPWvZz63suyQ4669FLPIalMz2xZY+7SgVXmDKpRK1JtDsu6x0MzSk/RjiG6hPT2+YwU7Uz6wkPRdXJF0KhFpAGBxbU18WPAQUoB28Uj0D3f2uagLct4GmUHFKOpP1mCyKHNPzfjLCbPf44oFGlDnQ==
Received: from SI2PR04CA0011.apcprd04.prod.outlook.com (2603:1096:4:197::10)
 by KL1PR0601MB5534.apcprd06.prod.outlook.com (2603:1096:820:b6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Thu, 20 Feb
 2025 12:30:44 +0000
Received: from SG2PEPF000B66CF.apcprd03.prod.outlook.com
 (2603:1096:4:197:cafe::cf) by SI2PR04CA0011.outlook.office365.com
 (2603:1096:4:197::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.15 via Frontend Transport; Thu,
 20 Feb 2025 12:30:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CF.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.11 via Frontend Transport; Thu, 20 Feb 2025 12:30:43 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 4CB6E4160CA0;
	Thu, 20 Feb 2025 20:30:42 +0800 (CST)
Date: Thu, 20 Feb 2025 20:30:35 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Rob Herring" <robh@kernel.org>, krzk+dt@kernel.org,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Catalin Marinas" <catalin.marinas@arm.com>,
	"Will Deacon" <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
	"Fugang . duan" <fugang.duan@cixtech.com>
Subject: Re: [PATCH 6/6] arm64: dts: cix: add initial CIX P1(SKY1) dts support
Message-ID: <Z7cga0L6UYmPXoFw@nchen-desktop>
References: <20250220084020.628704-1-peter.chen@cixtech.com>
 <20250220084020.628704-7-peter.chen@cixtech.com>
 <4add2867-8c09-454a-b3e2-b4baaeccfd44@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4add2867-8c09-454a-b3e2-b4baaeccfd44@app.fastmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CF:EE_|KL1PR0601MB5534:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ae8ac58-e45b-409d-981e-08dd51aa6503
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HSJB7t/f05qA7/XpvAPyR+YKGNZlpPaeb2u2B25pQ0akOU/vdsaMMY30Ydfw?=
 =?us-ascii?Q?yd1BJRtDIhGdAR6bJYE6uqiOJkgYQNsL3aTjX8p7gMkrKp85RqOZzSpfrj1E?=
 =?us-ascii?Q?kd3kiC9JL4xiT+rluJkDcX9QR3JZNxRtR+P3stoeV8+RxfbGFfHxfXtDC+S4?=
 =?us-ascii?Q?RW+BH0kSuL4HWPktKQfHMV3ia4DK7OZGv48l8V0gFJzZCdVHqHJZ1NLq0yha?=
 =?us-ascii?Q?TVE5uIkJekPeMrTycSTgJiuSeLXmOCawoJ11BpBevCofSK03BW2iHP31984l?=
 =?us-ascii?Q?htycO8Z96jJv3TGjtZHhzyzW3vX+12tV0xkR2nMNHqVnp9mUzULKXSQdtBOA?=
 =?us-ascii?Q?b1DNApIC9var1SJ/mL4BhfVoT5wt64aro9+E1L3L/nmhDxklhW0CtsLBUkjP?=
 =?us-ascii?Q?tUw38tTuCN5h4nz3tN/VIfygsf1VeszOignZxQ6gm2MmTJIYOaTkkLq49CXG?=
 =?us-ascii?Q?2nAlLZob6pKgGk8Kr16+EpvEirTLoGZWbUS2kYsP/ftEM0FOHcPOafhio2Pm?=
 =?us-ascii?Q?E5cXuTzrX08aCedziOVIaBScHETPDIVDFK68kgPP9AspnyzCK27StItQho1q?=
 =?us-ascii?Q?mLud+VZqDmz8GbIDglRIsyHfE6X270oz2u5zox4isz9cwCq9mbkNgiLCN1NJ?=
 =?us-ascii?Q?7hY4w7buWfjjTMDo/o6SfQflcRPsP4oP43wCobMUQoc7aIMvrvyQrBLbCw6N?=
 =?us-ascii?Q?dirV6gQD4CVpSVODniL15jv0FO7reVlj/r+uPGMyCl68DNozPDiL19QFndrV?=
 =?us-ascii?Q?zkCv90rWPQTz2ReME5GZyZmGGVveB65GK5IfdY+Z0HYtPk/gG4MR5CgHJL1J?=
 =?us-ascii?Q?22pKhJhOeO2my1m41sfhJBwN/gU3vCyQV3zMSZhm6sH5sgjcbAkHshnvRaXx?=
 =?us-ascii?Q?831BfFdGXQGF8gihE944B/XQeQVaLKVGvgZ+tEKlqV2D7KWzWQb6vv4YCm6R?=
 =?us-ascii?Q?Gt1jxnNr+ANf/GQGvg5Vo/ggPTUUfJnc+iEJsFSDXlApQCCJheO+hB0DcwFf?=
 =?us-ascii?Q?VHbxCwtxyYPis0szkequCatGKtaWxX/Um0NyLoWSKMU9q6qsnZ8ZI9jZp2w4?=
 =?us-ascii?Q?31COt3S+fxsvTEcM1MYAeH3qj6TndTYQjfEnPzMhJSWDYOcn6eaA3tD9BbM/?=
 =?us-ascii?Q?w1++XyBbDwPbB5IxMWPrLnCOT56nIPQIBNAOY131Rls9VRaO6cC2cVcou27C?=
 =?us-ascii?Q?aIGthzRPjvqW0DMHXoyxlLEiFJTORltJcxFQaPEVviO3PtxnyHjlRAlLtYXO?=
 =?us-ascii?Q?azAFXbYDdXQALiYW92E2hE0O+gScQ3NBwmHMUeqbqr8iyjv72ZZFdNPUTL7U?=
 =?us-ascii?Q?hHVErw49aoBjCidcG4IpxnYBEvMZRWvx7FS5GHeBS7X2Jt9wueY2cxcea2Fz?=
 =?us-ascii?Q?O4kMENvgV9pk7VT9VpqHbcLmoaWXA5hEKd0MXQqI7UA/EnI0gJAgJ6ephOY8?=
 =?us-ascii?Q?PFv73BAJ3xPL0wQkt7h7kLNjkwCg5VzPfvH9IAhMDQlpKmA7WSj68g=3D=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 12:30:43.5784
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ae8ac58-e45b-409d-981e-08dd51aa6503
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CF.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5534
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_043100_727947_3ED7DD83 
X-CRM114-Status: GOOD (  26.85  )
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

On 25-02-20 11:58:21, Arnd Bergmann wrote:
> 

Arnd, thanks for your review.

> On Thu, Feb 20, 2025, at 09:40, Peter Chen wrote:
> 
> > +#include "sky1.dtsi"
> > +/ {
> > +       model = "Radxa Orion O6";
> > +       compatible = "radxa,orion-o6";
> 
> This should list both the compatible string for the board and
> the one for the SoC.

Will change to compatible = "radxa,orion-o6", "cix,sky1";

> 
> > +
> > +       aliases {
> > +               serial2 = &uart2;
> > +       };
> 
> Please put the aliases in the .dts file, not the chip specific
> .dtsi file, as each board typically wires these up differently.
> 
> Note that the 'serial2' alias names are meant to correspond
> to whatever label you find on the board, not the internal
> numbering inside of the chip they are wired up to. Usually
> these start with 'serial0' for the first one that is enabled.

In fact, we would like to alias the SoC UART controller index here,
and amba-pl011.c will try to get it, see function pl011_probe_dt_alias.
It is initial dtsi file, so I only add console one which needs
to align the bootargs passed by UEFI.

> 
> > +               CPU0: cpu0@0 {
> > +                       compatible = "arm,armv8";
> > +                       enable-method = "psci";
> 
> This should list the actual identifier of the CPU core, not
> just "arm,armv8" which is the generic string used in the
> models for emulators that don't try to model a particular
> core.

Will change big core to 'compatible = "arm,cortex-a720";'
and LITTLE core to 'compatible = "arm,cortex-a520";'

> 
> > +       memory@80000000 {
> > +               #address-cells = <2>;
> > +               #size-cells = <2>;
> > +               device_type = "memory";
> > +               reg = <0x00000000 0x80000000 0x1 0x00000000>;
> > +       };
> 
> The memory size is not part of the SoC either, unless the only
> way to use this SoC is with on-chip eDRAM or similar.
> 
> Normally this gets filled by the bootloader based on how
> much RAM gets detected.

Will move it to dts file.

> 
> > +               linux,cma {
> > +                       compatible = "shared-dma-pool";
> > +                       reusable;
> > +                       size = <0x0 0x28000000>;
> > +                       linux,cma-default;
> > +               };
> 
> Same here, this is a setting from the firmware, not the
> SoC.

Will move it to dts file since our firmware has already released,
and it needs to support different kernels.

> 
> > +       sky1_fixed_clocks: fixed-clocks {
> > +               uartclk: uartclk {
> > +                       compatible = "fixed-clock";
> > +                       #clock-cells = <0>;
> > +                       clock-frequency = <100000000>;
> > +                       clock-output-names = "uartclk";
> 
> > +               uart_apb_pclk: uart_apb_pclk {
> > +                       compatible = "fixed-clock";
> > +                       #clock-cells = <0>;
> > +                       clock-frequency = <200000000>;
> > +                       clock-output-names = "apb_pclk";
> 
> 
> Clock names don't need "clk" in them, and there should
> be no underscore -- use '-' instead of '_' when separating
> strings in DT.

Will change to:
uart_apb: clock-uart-apb {
	...
	clock-output-names = "uart_apb";

};

> 
> > +       soc@0 {
> > +               compatible = "simple-bus";
> > +               #address-cells = <2>;
> > +               #size-cells = <2>;
> > +               ranges;
> > +               dma-ranges;
> > +
> > +               uart2: uart@040d0000 {
> > +                       compatible = "arm,pl011", "arm,primecell";
> > +                       reg = <0x0 0x040d0000 0x0 0x1000>;
> > +                       interrupts = <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clock-names = "uartclk", "apb_pclk";
> > +                       clocks = <&uartclk>, <&uart_apb_pclk>;
> > +                       status = "disabled";
> > +               };
> 
> It seems strange to list only "uart2" -- usually the dtsi file contains
> all of the instances that are present on the chip and leave it
> up to the .dts file to enable the ones that are used.

Since it is the first CIX SoC support patch series, I only added basic
Kconfig build for booting minimum system for easy review. For device
node, it relates to clock/reset/power domain binding which will add later.

Regards,
Peter

