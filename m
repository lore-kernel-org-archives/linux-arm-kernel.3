Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D47C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 01:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aDT1JXp0Z29zsYBXpLuzk6BZ+GcfWCmsfKfH5vH48xk=; b=cLWpx18NNpScaLn3MJOHZ8hdzs
	3N3X2thIfSaKCIegXiVahZr8LwId/kwQr4Vrry+fgxe+s6TH6CXaANrWrXnPApDlxSsuRsjMp1vwF
	i0RqGarH8Ky0f2GofnvDGXcVRB0cYYaM/eSMUxRVshN5sxs0tiNe2b2/z91uFX6gz7k4hYwJ5izuS
	8BNcYy4Yu9UVEXar10k81PItFfxgUr0OHXeSQHojsea1XI9zLtuYLqOCHc+v9PLqtMvLdKtTVbOkO
	wqHDKMDN4hx4jaKHtjFv7f5CnOzo3aX+oBoizcsauf+6Pcw3izGQjoYx4Fi1O1ubzietcx5BYeUq/
	ERyHmBKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmjiP-0000000Fhal-1YhY;
	Tue, 25 Feb 2025 01:26:29 +0000
Received: from mail-tyzapc01on20709.outbound.protection.outlook.com ([2a01:111:f403:2011::709] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmjgt-0000000FhQs-3fwc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 01:24:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A4CNy4HlGionv/tAhrEQevKfkg4uSj4MrlnIp6GqSuCZqNMlIKO+mUdISU7EA3MEx3ZXoWTo/MoDJa0K8ElyC755xPCc4k831I4hFNSEd/q90z9tjYVU2bHdOO03PCI/tGZGDB34vwybtfvM3sYG620bMIneH1pROnKznfcf/GDNe4Xian/lQhHy1hDmOroOySXgfalLtYMfcbTq1L9kOvldOgAFAX0/0+YV4L9xVYjQWw8o8BRB0ukVwOBygReUMhK2Oc0LPdqqDUXCEtDvM/pwaFnaNNloieL80Q8FuJo/c/FIyHNEPrBxvuwb8FA6JKo/ax8q2HtW9xtifqm2Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDT1JXp0Z29zsYBXpLuzk6BZ+GcfWCmsfKfH5vH48xk=;
 b=hVcFZe2k+c+qtwrsNzhR5Ow1n/QV2UdKE+sQ/UcPV3UI2dnP8gI6tYxJ5hZESmQSrpUCXVDkF/E2PIfUUayT+ac5Kt51FEak0m1gwu+FvhZwAM0jPwPh9Hj6fIwG4C4P59exzVSalxHJdCS90FdvxiIgwPdBmHMHJE17W0U8+jyFVNw/pgxC6SUgcB9uG9jNKh+00XuCJEzPlH/0j5yV1GtyI2lKNsFXy0EvVb5mv25R31Utk9zS//VYYSyGZfYAkF6I5s+2+jyKWsHGsTeuDRnOFa0723FssUQd6bRnNxKMzgrhVGTrVTvr/ePwcpRySDY8acocsYMgCKeVD1LBCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cixtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDT1JXp0Z29zsYBXpLuzk6BZ+GcfWCmsfKfH5vH48xk=;
 b=ptbvklr7DKi2ZYFju5rxflXeMOhfn+E+1LfSnIu8H0ewNio25HVXiQ0IBy8DbORVF1RGY4gMQ37yNTVv/jSmUSBIIFzVJXjfK8Lf/P4o8vmczOfeyUtYu0gwIJAYat9AveZg6GT+9fVSKf8JO3G07Qcy0QsG+dPq0sxjx1hEd/tOzc5zmfVxogNZuWyfk6YAjl/xrGjcDiGlRdrop+trG9thpwFvylCQ/7Ysi8kq7wl0bCtJR5so3yWZqlLcXFKdhK3JYL1VuyKfw5Y0rC8AbVmqGtPeE9xJimjgiuQI8OoAN+H2KjLljQMpO02nRmg0LeJyykwj1ti6n+j2PBHYNw==
Received: from PS2PR02CA0062.apcprd02.prod.outlook.com (2603:1096:300:5a::26)
 by TY0PR06MB5187.apcprd06.prod.outlook.com (2603:1096:400:21d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Tue, 25 Feb
 2025 01:24:47 +0000
Received: from HK3PEPF00000220.apcprd03.prod.outlook.com
 (2603:1096:300:5a:cafe::6a) by PS2PR02CA0062.outlook.office365.com
 (2603:1096:300:5a::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.20 via Frontend Transport; Tue,
 25 Feb 2025 01:24:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 HK3PEPF00000220.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.16 via Frontend Transport; Tue, 25 Feb 2025 01:24:46 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 97FF940A5BFC;
	Tue, 25 Feb 2025 09:24:45 +0800 (CST)
Date: Tue, 25 Feb 2025 09:24:39 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
	krzk+dt@kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	"Fugang . duan" <fugang.duan@cixtech.com>
Subject: Re: [PATCH 6/6] arm64: dts: cix: add initial CIX P1(SKY1) dts support
Message-ID: <Z70b1x6ephA1FyEy@nchen-desktop>
References: <20250220084020.628704-1-peter.chen@cixtech.com>
 <20250220084020.628704-7-peter.chen@cixtech.com>
 <4add2867-8c09-454a-b3e2-b4baaeccfd44@app.fastmail.com>
 <Z7cga0L6UYmPXoFw@nchen-desktop>
 <5f88cdbe-f396-49c6-bb48-f50cbbb21caf@kernel.org>
 <Z7vY5kHfEGzCCuWW@nchen-desktop>
 <0bd5af6c-979b-4403-b1e7-5847979a8780@kernel.org>
 <Z7xMeub9i74a_19g@nchen-desktop>
 <24003082-d1ca-43c6-ae96-3705e0f964f0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24003082-d1ca-43c6-ae96-3705e0f964f0@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000220:EE_|TY0PR06MB5187:EE_
X-MS-Office365-Filtering-Correlation-Id: 887f0baa-042a-41dc-8b05-08dd553b30e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6+x9tybOXHiQHnAsKQR8x0LvS+7wour/DN4ZiL0j1JcvoG/WlLRBp5p9eoPc?=
 =?us-ascii?Q?wxbWIQimLlyo+ra46MC3i9GYWceNY+8coHhmKyFpLLCbdusSCZXzjxej3fTa?=
 =?us-ascii?Q?bffDF9jVa9123IhztIxB9TM1COU948vIxywCUvSF50LTFLIQWi+oxWFSd4gQ?=
 =?us-ascii?Q?w7T/uKNTZ9ONXTTYd7LpBs2VngOE/3OQksludR0N6mdp6kzlhqE9QAFptkZq?=
 =?us-ascii?Q?fxyWLEGetCjujgyTHag2Sv2aF/Rix6EOSKD2PW2ob0zBKzDpAcaRR5HWTB5V?=
 =?us-ascii?Q?/xmS0Af7bGpurze3+TjKVERVjR6Sr+vEEX2v1vts78QjmThCjFmVaY8f+QhK?=
 =?us-ascii?Q?SAvUWjU6XqftSmd2yIJpS4yx9yqSBB9BRpwTQ2EfvHIClrnNYXwHBuYdBJqr?=
 =?us-ascii?Q?kaK+nMZRykvpfPnjp5nNTYoQMTzdcvXAjpOUPJU6XMFkMMHVqAKzMLyPpKLP?=
 =?us-ascii?Q?7tQ1Ghdyou1Ty8DD3U6WslaRqHj+OlQ5NDZlW6bgDHewIxlMOPwe9DAbr3vP?=
 =?us-ascii?Q?AaXZlKIeYj9YzDI0bwn8uTWGD7dU5gZXDurpPvc9qd1E1h3X+0ko4jJxYZ61?=
 =?us-ascii?Q?LaE/ba9zW9rDyMoswMdlFCdt3/+2OwSYnJvw855iHKNOyBw5Gf2sdToMxemM?=
 =?us-ascii?Q?WwfiQMSRdX3kuBeeTPu4Cqrfj8/vbrJIUZ4sSYY8fCIMFovuLhFWaAIWbWgt?=
 =?us-ascii?Q?KB7grVcBUAA4qqKO2nUbqNnJ61GjQ9TuTiFSgZpCOYEGaRquChmPsx/wo0vA?=
 =?us-ascii?Q?StTjVy55el2Oq4QQ1dWKho8zY00vfPtk0cPDNjSb4WJ2higelnfH1CNV79OD?=
 =?us-ascii?Q?vJgJWzEEHfOOI+cK24w3AYAKur/HbrQi2kJKSGG0NupZhb+026Wrz8GbSj+N?=
 =?us-ascii?Q?Tf3M4xSYCBWPrKSwQoVW/EeVC/Cw++k1yte83ufKy2BDPlx6xHMV7ZOF2ZR5?=
 =?us-ascii?Q?ZVXxhMuuOY9/sP6SL7QpjPk1YfAJmYYOo5OwxxO0JZNnlsloPsRSdvBxuI+y?=
 =?us-ascii?Q?P8TbZ8spg5pfdlpqS0iTH+AN4KRL0qxMZhywPqblCrW2vL2uo4L2z4n49C5b?=
 =?us-ascii?Q?ki/qoOekJkLcvEMYSs2AMLbNt9IgmztGzKiG1lQQ+UKAK7SP+uG51oU2FjZ1?=
 =?us-ascii?Q?tYI/CNcqDwJ3ZlKQt01vq28KuMTss7Yqy2BEpZulMw82Hn0f/WHcZEVknRE0?=
 =?us-ascii?Q?ttUxlxmfriu4B2lYNn+itxbd9rCh8f5RHdHeXL9wl6+7Fvk95rLYkBak+vg+?=
 =?us-ascii?Q?zwDzzXRoSLeBOQz7SciUFbNlw4oqUCAsCAK+ycREqLsWly03B1c4gro+v7f4?=
 =?us-ascii?Q?nEtHKm6ySSv/iqDD05qt0vC24a1BEtY007hrj94elfdC5x2/90pu6gi9lc+R?=
 =?us-ascii?Q?mgnQctQHFem2vBp5NG+AuX3jyJ/S8rIvcihJObxGM7wQcbTLJolthJfwXVcD?=
 =?us-ascii?Q?kogtO9eZRdVL9QeUK7pHT1d28toU9IFGIs7JYyZVo79MA/THuiIujg=3D=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 01:24:46.5588
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 887f0baa-042a-41dc-8b05-08dd553b30e0
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: HK3PEPF00000220.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_172455_929901_DECD34A4 
X-CRM114-Status: GOOD (  20.74  )
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

On 25-02-24 13:07:45, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL
> 
> On 24/02/2025 11:39, Peter Chen wrote:
> >>>>>>
> >>>>>>> +       sky1_fixed_clocks: fixed-clocks {
> >>>>>>> +               uartclk: uartclk {
> >>>>>>> +                       compatible = "fixed-clock";
> >>>>>>> +                       #clock-cells = <0>;
> >>>>>>> +                       clock-frequency = <100000000>;
> >>>>>>> +                       clock-output-names = "uartclk";
> >>>>>>
> >>>>>>> +               uart_apb_pclk: uart_apb_pclk {
> >>>>>>> +                       compatible = "fixed-clock";
> >>>>>>> +                       #clock-cells = <0>;
> >>>>>>> +                       clock-frequency = <200000000>;
> >>>>>>> +                       clock-output-names = "apb_pclk";
> >>>>>>
> >>>>>>
> >>>>>> Clock names don't need "clk" in them, and there should
> >>>>>> be no underscore -- use '-' instead of '_' when separating
> >>>>>> strings in DT.
> >>>>>
> >>>>> Will change to:
> >>>>> uart_apb: clock-uart-apb {
> >>>>
> >>>> No, instead explain why this is part of SoC - or what are you missing
> >>>> here - and use preferred naming.
> >>>
> >>> It is in SoC part, APB clock uses to visit register, and the function
> >>> amba_get_enable_pclk at file drivers/amba/bus.c needs it during uart
> >>> device probes. It uses common Arm uart pl011 IP, the binding doc
> >>> described at: Documentation/devicetree/bindings/serial/pl011.yaml
> >>
> >> So you added fake clock? Everything you wrote is not the reason to add
> >> such clock.
> >
> > Not a fake clock, it is the real clocks, but depends on firmware open
> > their parents and configure their rate. It could let others do their
> 
> In one place you speak about UART, which is the consumer and not
> relevant. Here you mention it is real clock. That's all confusing, so to
> clarify:
> 
> We talk about clock which is generated/output by something. Something
> which controls way it is generated is clock controller. Either you have
> here crystal or have here clock controller. If first, fixed clock is for
> that. If second, you need proper clock controller binding. You can add
> stubs for missing pieces, but this requires explanation and TODO/FIXME
> comment.
> 

Thanks for clarify, it is the second case, we have clock controller for
that, but now it is not ready to upstream due to some dependency, like
mailbox device driver, I will drop UART node at v2 patch set.

-- 

Best regards,
Peter

