Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9539FC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 13:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=28Ih43RaC9Ih17t0Q38chcLAhb8MknIC8XfmB5DNDDU=; b=E97VjR/IXWsUUj3xVu2SlTg/ze
	Z/Sj4WVaMfFca7yTpYTaCkVnpzZjKXYKly0eE16L0taEOpqtK1j+rw8B9tibuZmuy8Ba5Pl94YMuJ
	KJNzhdX6KjJOySIIGmW7XeaRvenAf+1RzJp+EQWAQI3Ay0Pv/pi4HdHz0uYy2lIzGirdr0U2m/7Re
	WoVA5gp3k7pxY8NxbMbsxz8+d2e0u/7tvQ7iHiqT8plM6jPLmGqQtlp/LAVi2DQ3FTBeFMn9NASyb
	v9MBegKh/obupEbDYy3xSpqyZm9KAPtywooRk6je7pw3/CGvbsA9xXXtA/T69JIsoYilx/+6SHdAu
	k9XfhitA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyquZ-00000000pWd-3PwL;
	Tue, 25 Aug 2026 13:09:55 +0000
Received: from mail-francecentralazon11013065.outbound.protection.outlook.com ([40.107.162.65] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyquW-00000000pW2-2ImS;
	Tue, 25 Aug 2026 13:09:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i8YwGEiDK/+sKB6ymOtYnp8BPXHi3m8JP11Pl9NQMLfT7nbokBKk6U4rHlpdep+MULoNXDxh7leT58XVEdYAfp+Tk2IiHXKgjgrBncBXjxxCHbyVlRcTb93qlAwLY53BERten1/A/n8vdAgpeNAdKSe0seYMtj9TnpFAp9SYfGngnRNwv+oC+FMKcZd3Yj7YAk6IF/i+Lb9VgRFFo8uv9NPQGpo8anElkKG60pnr4863BGC7mJPAQkOp2GX/lHsbqHWGunBAZujPcaHzGOM351O1GYD4QYk7ePMoaT2ZsDvxkygfPgLvymznk18P5m6RgqUS4cxsY/d1UT78fWZQ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28Ih43RaC9Ih17t0Q38chcLAhb8MknIC8XfmB5DNDDU=;
 b=p30Dg67W9KfPlG5/C6pt+2WnpBeBg22AuL7dLpyfwzntM6UzlutUo4KQGVwRFMeELh2hS4PLuS7iq6EHc0fJayRERP4ynrPV6pW5cIPKpyqxMPVkJkKRQpRyASXl51v4eZAljTCW5PGIE5MGtcjiKhtxciuMmciR/j3IJVH/n+9PV+h8kTCZ+rgDZAwnK+NR/ejSFRkhcQTM4OAaR13oAcySP9YSo1El0iXHJw9HqKzT+Yqlu+puAj97jiRXbYz98/X6e7Ynt6dU+t1Y8ZeLDi6CH/jSqCteaOHJgCeRg/5Lq5Rqk6jVRNLzRl1mXG1A6bBMHVbIQzyHARDCJBGfjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28Ih43RaC9Ih17t0Q38chcLAhb8MknIC8XfmB5DNDDU=;
 b=KWs8nuk5OTakN8wn0+lhgv1rqYhRXUmMUgkU7ejw16+7etmBofKY1BG7rf3uCHoT4HGOLe+v6wofnd5fpDRz8r8Rgggau8Ce/d7EkDziC5xi/J4nX/RvN0IixwctwibgsxfqV9Q41M6H917lyo7c5ED4/ggrY6Budl+t6WKiO3EhORI23ZM1GsznEonitZmJWV35nC0iG9GH+XFw88hyiLOwpjayjZLjMWu8iwB0yH2Bf+6+8jKP0qQk0TqAff6EwcJwofUqHhpHJbvYLgb/uprACsE6QXGXEXucqUDntvtOHuHgpJUsZKCx8gky0r24ySQnibIcpxEjH7QPIZN5vA==
Received: from AM0P190CA0009.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::19)
 by VI0PR10MB9499.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:308::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 13:09:47 +0000
Received: from AM2PEPF0001C711.eurprd05.prod.outlook.com
 (2603:10a6:208:190:cafe::53) by AM0P190CA0009.outlook.office365.com
 (2603:10a6:208:190::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.6 via Frontend Transport; Tue, 25
 Aug 2026 13:09:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM2PEPF0001C711.mail.protection.outlook.com (10.167.16.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Tue, 25 Aug 2026 13:09:46 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 25 Aug
 2026 15:15:05 +0200
Received: from [10.252.23.181] (10.252.23.181) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 25 Aug
 2026 15:09:44 +0200
Message-ID: <7d767580-08f7-42ee-b168-00e4ca3b7876@foss.st.com>
Date: Tue, 25 Aug 2026 15:09:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/16] dt-bindings: usb: add FUSB340 switch binding
To: Marek Vasut <marex@nabladev.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Christian Bruel <christian.bruel@foss.st.com>, Heikki Krogerus
	<heikki.krogerus@linux.intel.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Srinivas
 Kandagatla" <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Pankaj Dev <pankaj.dev@st.com>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>
References: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-0-c5e27cbc0795@foss.st.com>
 <20260821-ucpd-host-fusb340-v7-2-rfc-v1-5-c5e27cbc0795@foss.st.com>
 <ca72ed6d-1565-4312-bd9b-891874a80afb@nabladev.com>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <ca72ed6d-1565-4312-bd9b-891874a80afb@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.252.23.181]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C711:EE_|VI0PR10MB9499:EE_
X-MS-Office365-Filtering-Correlation-Id: a2590550-877f-428e-554e-08df02aa234f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|7416014|1800799024|376014|23010399003|10067099003|56012099006|22082099003|18002099003|4143699003|11063799006|921020;
X-Microsoft-Antispam-Message-Info: MIxIif0fBA7HEPjQpy4qohFautUx/omMvD2AV5F/GN73own87zIXiHDyOmU15a4J6BG9ySJBXgSPk3+FBx0q3yGUMYcCOVTREVCdzXeDombbbDqJLt/NDXm+0WP5ySA0a8C5sDjekzP3g1Pn+cxgGCoRs3LxPVr/ph6f8Ple3gaQeDPx494+HkWjw8xteLaOEFCGcgKYpYAuCcFMQDfFTbwrsAYOqelY82lPvsRb09SPouMimxY1Vznzrl+Gu++ttmSwTMXxxx/RECMohgbZG9C5Px+UUXaAUSr2OjJHx/jd5VnW+3pl9KughyzfyjFUd2B7rzlWJ3eKQWEJV0f2LkrEDRZX7IKYSwakBuGNiTVsccNdEvqBv616OeKIKxBNxCAjgqCWZ/SblvfMzN6kCSuPIix2uBFBWPs2GB7HXKFi5TqK/5Vlp3vuCCRqyCnNUnmQ0ESv2ABuENAN0idGTzdCQkPv5r+4MBv9f04ShKHyWshC8Fvo0u2Omz/wpNXhYUPBPO+u0qd056nnLAWYnz83Tsgl1uy1JoqEOxcYLMcPcpNAF/ODxFPefCIWRsDNLBP219EJA9Nhmhzp5a5vxLNuGf9men9sKl8AS1CmxDKDVu8XUXWWRybFGP2B73kz6/039cq43uhjwEDmevnSCFpp6ObPeUH2/4plE9ZQFzzx6EDPZvn6fXsldnqz723Vpnr3UfBizNHmeobWY49UeA==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(1800799024)(376014)(23010399003)(10067099003)(56012099006)(22082099003)(18002099003)(4143699003)(11063799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: lPk88IVAYTmWtwCabRCCQNj+AD8bIUONLnJgERTZH8RkROclcJnGz5ciMx+GGLQFtdU2BqgIK5ceoarf8QETm74/5Vys6Z1SHzkKAPweVGstB6eo+EwUoBu8vvPF+LqSl1FYMZhGcIgt5iorvh3p++8jR+kvut9Ou5laDouIEMW8n1gx9New1Di8m8c0SLTiboKsuvYo5V4TPM/x0hqU8WQTdSCsYPJuj1DSnQ8lX7IT+dvsC1cjgjm73ILEPuokxFyusBvOaqhd9rDG/7Vsg/5I8svUhVPK/ipK5izxXs5F4Q7w9tNVSWppoImk+74Fk+DW8Z6QQ6KJcvdoerH5Png7xA/ypvBIOi7QXbvwXRbHFLCn/lpTdiu/tMz4UpDwUqRRb6FlMMBBmdgBMLi/JuzXvSiPVsOOCpeWxvSLlRlet2qHuCWEHWPzbYOFF99x
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 13:09:46.9077
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2590550-877f-428e-554e-08df02aa234f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C711.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9499
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_060952_599129_BF01CF4D 
X-CRM114-Status: UNSURE (   5.95  )
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

On 8/22/26 06:49, Marek Vasut wrote:
> On 8/21/26 6:23 PM, Fabrice Gasnier wrote:
>> Document the ON Semiconductor FUSB340 SuperSpeed switch as a USB switch
>> binding with enable-gpios and select-gpios controls. The switch can be
>> used
>> in Type-C applications where a reversible cable requires a switch.
>>
>> Assisted-by: GitHub-Copilot:GPT-5.4-mini
> 
> Use gpio-sbu-mux , there is no need to add more AI generated duplicate
> drivers.

Hello Marek,

Ack. I just need an additional enable part for orientation-switch only
in gpio-sbu-mux.

I've split into a separate series:
https://lore.kernel.org/linux-usb/20260825-usb-fusb340-v1-v1-0-2191179b0661@foss.st.com/T/#t

Thanks for reviewing,
Fabrice

