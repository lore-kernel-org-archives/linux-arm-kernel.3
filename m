Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A395F01814
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 09:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/qEkAVkQ/c6YeLmQyOJU4X42ztk2wfqHXPmx8hxBdYs=; b=uhuOvlKeAc7U4d5N/qa4/MXPYH
	hS/ZVpwik4EhYnGX2RfuF/VP9hWCmdST4YdJF06mINVfRNpFaMOKAgK805eAZmR8naX7od8n8eO19
	QdJH31Bv/9AtpfSsQAYKYox2SXgAstXm1Xgs+eEZe7p1dZQPC2xuGS9kxs8z3FoCtnhPSm3Y4rhli
	2QhDW3O6X+YlNo5ofoLo32oo5q5nOZdNexuCI2PV2DjTe4FAIf4rm7xtfJh1EcpCggclAyGHLwjwE
	sPA2vVKcRiKr9AB6KXErKp4n1K8yb6IdJiXCXCVyHQFP3QbXQZrpJ7O5LBMIbkcs27ym0ClIHzSs4
	h0rBl8vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyRPM-00000003LIq-1iwB;
	Fri, 06 Mar 2026 09:23:44 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyRPJ-00000003LIC-33nb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 09:23:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oEV3F1lV17ERJDz3Z4kUgqJvOXtpla3aXRuDLYrvYv+G0hX497z7n9jHw0Aj8tc4lpii9AwG+MuuyhZ/Vg1eCRXcCEZIR3o8Sn33AGBd0nu/P8bDq1VMbgxtaJG+dqDInVqGWnJv/xHoVH8rg+dAmOvTj7Y152JGw5zjiryWYuJjfzmVUBfUiiN7ZUYfrdZBCDxx2bamJaJioFIoNX1I7UdHfLMu2/e1AHBX+tiGAuxmuHAY/dhizpo4L0RPry7fw+FdOeXmrL57mfsnO5zkZ2xsgUmGZrcIsNrT/MhnvIDvE1jjXQLjK/mya9E7MtJFxFXCmE4idck3f5c64lE82w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qEkAVkQ/c6YeLmQyOJU4X42ztk2wfqHXPmx8hxBdYs=;
 b=caiXDXchIqWEYxPGqSuf26TuvWzdkrOLnZosTYgi50UOjnf4b8U23GuK9PD8dacbdU9rXhS60IQ8R+oFjKfoen2pIulrODAL3wWDe55h/T798vRRXJOzWOVKQGM4t68dXBb1FBHKE1/6O7JTmlPAA6harTMnCUfYdK2j1EkvKY6KEEeoMMAHMnqQHiMkl+cBiEw63x45yp0eUjcTXFKk7mUCsxDZdYt1B+43uDyWpzI6unpyJHOJGFjsPV+6ggg0zGOrMAqEaDCDxl+4Oe1P2dvgyW83mt3xpG52WlkDUJ7xWcGk9PgdkHyluGaegsGXx+3+bWt/u/tK9FhaLlG8dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=phytec.fr smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qEkAVkQ/c6YeLmQyOJU4X42ztk2wfqHXPmx8hxBdYs=;
 b=AKLCq2omRy4rMtPXlVWS/FBENQIbMaRhi3h3oQRtTeqEWN++d62lZbsooRaYT0n8GpWVID2dXzJ+3fR85174ktBPDIbJ2RNXq5pFd8R01Ge2o2RaUKXTjxzPemdu8e2jPzwJfAcZ8uge5bNhx97cy27FIjTyLEFRrZKkqkfxtNTZGpNALPRxi86Bq+P3ik6rpKhp2t9nod5I7hSx8FFvhRf2XVJCz5TaNJ5CfKMAmc+Mme+JNhqvrV+xb7/jKS3bh9+prPFKFCvGEPWIB+92aop6jrBqmmWkvNOcttifs5RzNqts0Z0e3AGWqVcjPKPM41U58z0k9L73+JAuHKNjpQ==
Received: from AS8PR05CA0029.eurprd05.prod.outlook.com (2603:10a6:20b:311::34)
 by PAXPR10MB5686.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:245::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 09:23:33 +0000
Received: from AMS0EPF000001AC.eurprd05.prod.outlook.com
 (2603:10a6:20b:311:cafe::cd) by AS8PR05CA0029.outlook.office365.com
 (2603:10a6:20b:311::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Fri,
 6 Mar 2026 09:23:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF000001AC.mail.protection.outlook.com (10.167.16.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 09:23:32 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 6 Mar
 2026 10:25:44 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 6 Mar
 2026 10:23:31 +0100
Message-ID: <e77be906-8f4a-43cb-b63c-f82416cc8356@foss.st.com>
Date: Fri, 6 Mar 2026 10:23:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 00/11] Rework and fix STM32MP15x PHYTEC dts
To: Christophe Parant <c.parant@phytec.fr>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, <upstream@lists.phytec.de>
References: <20251210101611.27008-1-c.parant@phytec.fr>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20251210101611.27008-1-c.parant@phytec.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AC:EE_|PAXPR10MB5686:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c7af214-089e-434a-8522-08de7b620974
X-LD-Processed: 75e027c9-20d5-47d5-b82f-77d7cd041e8f,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|36860700016|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: mieN9yVYhij2tRwYSGZhw/auQuJLDkWoLjys36BDmD3srjJjs8xaHpQ8j8GfrCBp+OquyRX2i3XjQeqoLygXelB4/VodnutafmmpWmaLOa0rniFSVDpNJ3cLo40gXzlcaiUtQ4xP+32CmVTZ5EB6Zmf4Qw0M/BeFl51G8qTcW8k1mzIlpwRVyODRSFU16CWIUogFJYW2exczdvxOUTk0eMfXsp57oJLBbPhKSl/l/D8CBtkJryDlaqVbe0SH1uo3IDE6LJobP/0UinwKMDciUxt14KAm04wMsZLG8RYy+n9dcZs9AHDDQs/sDjnnjf4+90uFEfxnvOojy+RZVH4DAFHXocPskxDDxwVvLaUTPgMedTtEfMqT+rFE6TkwrS41nflOD9velZlJI0hQxVC23V/nyonVNqemucBsIG8ZShJ98yE7CSOzySbWHjb1XMxcnP5ZK59R7DE6b9F+Es6x2xJLcoR4FQ4ft+hkSeFQ1Qb7RzspD409tOlm88VkfGITy3UkTsyMtKn7GGu5KMMLl5NZoS7Fo7yJPMAPRLGWqQw2EE3Oe6zgozp09so3tnvK6fPfT5BNRWCRy5k2qe6ViIdtO2dwDzk6ge8KxsrW/e8CW+xtVRp523f2QFhV6+5uzqEXhB586oBcOL8QmAF+n2qxjC5JGZf3Q9GL1tXt5EpBMIalk6Wjvx/IfCHxJSd52CC0BjElxfFev4y3+Yndjz1VK2FH8Y0QF/VzlD/YBHFAmlavCE+S1qLeJaWXWYjuW3G6GzHg7rMczT6n0n+Mug==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0c4x0cNl1r8FOFFb/0MI9YrRuBsgviadmxZJRuaJiA2dGypQAKTLDKUDlODnsqKMuJFPsdyDyzbzxc7RZhQCy1GcMysdLEzXEnlNaxHFN8yWo63srmLnz2lIHmjYWwQU+MXwixmp0X8pAh2hipYr/znT4bvHr5hhhz+phZO+t0ofT5T6yYTAHpo1yEBEzzACsqxuJgwdZpJ1JJsfQBx0/nA+dKFGsSCf9OxnPxADly+i/qUJmD/CCwRxTs/HqV0infsV0QcIauDOyGZOQ+pF8gdt0Qcsa6QtpsPrPw6LO4EvQIOjRDUtfzAgtju9tQaqRFKgtFYXUNank6K9Ft/UySxIAsi9p6pncZZJ2ZX/aaCNzssmk9fa4BGtcI3fIidxiOpxnwGt498ZRxuQWzZHJX/jrPRWtOkwx3m9ZmiJMw9ec2rh++dVXPl1cSsMJTmE
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 09:23:32.8040
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c7af214-089e-434a-8522-08de7b620974
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5686
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_012341_887850_04E3A905 
X-CRM114-Status: GOOD (  14.00  )
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

Hi Christophe

On 12/10/25 11:16, Christophe Parant wrote:
> This patch series rename and reorganize the STM32MP15x PHYTEC
> baseboard (phyBOARD-Sargas) and SoM (phyCORE-STM32MP15x) device tree
> files.
> Indeed, the current device tree naming and organization is not really
> consistent as it does not align with others STM32MP boards (use common
> dtsi file as much as possible, use one dtsi for SoM and one dtsi for
> baseboard).
> 
> The series also fixes some important pinctrl issues and minor one (coding
> style). Additional pinctrl is also added for the optionnal interfaces
> that are not enabled by default (FMC, LTDC, DCMI, PWM).
> 
> Changes in v2:
> - Rebase on v6.16-rc5
> - Rework Patch 3 (stm32.yaml): for board description, keep "compatible"
> string identifiers as before to not break ABI. But use "enum" type
> instead of "const" for the SoM and phyBOARD indentifiers.
> 
> Christophe Parant (11):
>    ARM: dts: stm32: phycore-stm32mp15: Rename device tree files
>    ARM: dts: stm32: phyboard-sargas: Introduce SoM device tree
>    dt-bindings: arm: stm32: Modify STM32MP15x Phytec board items types
>    ARM: dts: stm32: Add new pinmux groups for phyboard-sargas and phycore
>    ARM: dts: stm32: phyboard-sargas: Fix uart4 and sai2 pinctrl
>    ARM: dts: stm32: phycore-stm32mp15: qspi: Fix memory map and pinctrl
>    ARM: dts: stm32: phycore-stm32mp15: Add dummy memory-node
>    ARM: dts: stm32: phyboard-sargas: Move aliases from dts to dtsi
>    ARM: dts: stm32: phycore-stm32mp15: Disable optional SoM peripherals
>    ARM: dts: stm32: phyboard-sargas and phycore: Fix coding style issues
>    ARM: dts: stm32: phyboard-sargas and phycore: Add optional interfaces
> 
>   .../devicetree/bindings/arm/stm32/stm32.yaml  |   8 +-
>   arch/arm/boot/dts/st/Makefile                 |   2 +-
>   arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi   | 164 +++++++++
>   ...ts => stm32mp157c-phyboard-sargas-rdk.dts} |  24 +-
>   .../dts/st/stm32mp15xx-phyboard-sargas.dtsi   | 285 +++++++++++++++
>   ...-som.dtsi => stm32mp15xx-phycore-som.dtsi} | 344 ++++--------------
>   6 files changed, 525 insertions(+), 302 deletions(-)
>   rename arch/arm/boot/dts/st/{stm32mp157c-phycore-stm32mp1-3.dts => stm32mp157c-phyboard-sargas-rdk.dts} (58%)
>   create mode 100644 arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
>   rename arch/arm/boot/dts/st/{stm32mp157c-phycore-stm32mp15-som.dtsi => stm32mp15xx-phycore-som.dtsi} (53%)
> 

Series applied on stm32-next.

regards
Alex

