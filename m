Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B507D1D480
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 17:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dZugsS+tHnNywp5S6uKc3HI/D/+udKkAhPp8i6ASyKU=; b=sSRSnkQK9g5Xrk6S5piLAxQ/aQ
	PcoxKEVNDaZs8mSC+9Y7qX3lHxb3ESTsYuhblHS6Q8GbPVGpjQ8ISpSZPcTjaFRgzcJzRAD2XsEAy
	UZjPyOLpUZiAeHZUosqNZuPZEzfQx/x7L+xR9zXkKqplRjSlqzhbLVZiyx8q0mKYDj6JtTWT/ZYYJ
	xz4kWA4CGcJlRZhTy47ELk8rceiKDVOu60NrSWWkbMWIvXkhQwHGytaP0msuhXUzZtDTjXeHE4MbJ
	pRPxYwRg7f7xyt3IBQqRrOcLsHvd8bCmebHWn6yLGaki7w+tc3o9208bDzWtu212or/PrQuTY2uEd
	mQzR6Vlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtcU-00000000LMg-1JRa;
	Thu, 08 Jan 2026 17:16:22 +0000
Received: from mail-norwayeastazon11013051.outbound.protection.outlook.com ([40.107.159.51] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtcM-00000000LDE-37n4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 17:16:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=diZO9Gqq6ATKahQoo0jDQB8N7YDUVOlOebVuepWcZLGFxAQBubbFf+28Cvs3fTRdS7moz1JNZ/fHQEwYBpZyxO7qxXRr81QTUPeCxndY+lOJO1c7vjpHQdo5bZjwg/pDLS2wHFdjAN0eWIjL9Y6CsCobXWsWmzwzs71zudUhlJet/uQ0pn93pQFepQSB2QcJTK6QKinFY1Q6/VtB/LVIgHFhSDhD/ny6fd75teOFJ7CFe5pt5QO6yey7VlxQTwrUG0UF3WUt6oVLzHl14sdBq0uruPH9J7+z+Yl3Xd+ENankIX32yX+f2xXNWfy5mf9ABzLnIZu7UiULi7xWOxkVNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZugsS+tHnNywp5S6uKc3HI/D/+udKkAhPp8i6ASyKU=;
 b=qpdeOQ7xgTBMpoYw6IJTsWYeNCc0RFYOGyVl9nwjYxGEOmAKsQV+cCSoEJpZo2RxCEHxPLO8HHKUbaXCUtdIaPVkaLDv67WT5lD9sUF92T+T660qpJfP9x5bzurzMU89TFy5l5fE8Xf7i2qzG7xyp10f7XaqA0CApw2R2qXDCv47E1pTAkGydWU6zuCEH6DIS1z2avEJ9d989GOTb18Uh3DRUVhFtLB6n0p7WIYxnwMfdf7PHq6cu/Qg6irzPe3OwJZHPCoYDjN8UMRBzzdBLRA4ZoQ6K8qQzbp9Z80ID4ok8I4p2AJeAMrZNz5s0Feli/Ifzh6cOHWzyPDqZyMTqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZugsS+tHnNywp5S6uKc3HI/D/+udKkAhPp8i6ASyKU=;
 b=fRl+i3Ka1hQY+zFyiGEPeAZH/pUjQYYJL/kbYsipEp0l1vWBXmYZTTzCPKPOooOa2D76Z6l4YvFiFuL5FYKUUyMHbjBO0YUn9cSQX5T4DgCmFvGvJ4ELzum2Dv7CckarTe9pJc8Y89bNIKMmvKCaZv/xuloBbr9UpmeITpxVzPMMfCLAID64ZkpwoprS6l5WPr3ALcMw9Drk67wi8RmxNl8MPlG4C8ERCKkc3lecSuGyYkd0599zhNN/5zv3NY9vQNvFRzvvtIeD1l0GvJFM04oL3Yjk+SjVHGSI2FoxnTInGZ47gWpKvADbCc4Q/gSaE3HA8IVthGr1Q2/T6NC6Yw==
Received: from CWLP123CA0106.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:5f::22)
 by DB9PR10MB5977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:39c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 17:16:07 +0000
Received: from AMS1EPF0000004B.eurprd04.prod.outlook.com
 (2603:10a6:401:5f:cafe::7c) by CWLP123CA0106.outlook.office365.com
 (2603:10a6:401:5f::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.5 via Frontend Transport; Thu, 8
 Jan 2026 17:16:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF0000004B.mail.protection.outlook.com (10.167.16.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 17:16:07 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 18:17:23 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 18:16:06 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 8 Jan 2026 18:16:05 +0100
Subject: [PATCH v3 6/6] arm64: dts: st: Add boot phase tags for
 STMicroelectronics mp2 boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260108-upstream_uboot_properties-v3-6-c1b9d4f2ce8d@foss.st.com>
References: <20260108-upstream_uboot_properties-v3-0-c1b9d4f2ce8d@foss.st.com>
In-Reply-To: <20260108-upstream_uboot_properties-v3-0-c1b9d4f2ce8d@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Patrick Delaunay <patrick.delaunay@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004B:EE_|DB9PR10MB5977:EE_
X-MS-Office365-Filtering-Correlation-Id: ce1018a2-db40-48c8-b47e-08de4ed99c99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RDJsbDBPalY1TjhDRlZLN3ZhRm5vTTZvaHlyeWJzYjdBTzlkd1ZFaDl5R29h?=
 =?utf-8?B?U1pkVlE4dzQ1M2NHWTljak1GSlFOaXEwVjJKZzA0QlBLZjkrT1crdS9zTzhD?=
 =?utf-8?B?WWJCL2wzcFlFRFR3M1BxY3VDandCVUE0VTdwLzhPZkI2M3ZXZGN2OUNaeCtU?=
 =?utf-8?B?M3hKajR5bUZQZDdxZjBxSmpsMFhWM3kyM3p0MVNMa3RSR1ZaUkRuOE9oMlZZ?=
 =?utf-8?B?cElOb2FXWW9hQlNBeGVvL3pxNVZhUnRxODZOVTRHUXUxSjJqUWxOb2tsYjBp?=
 =?utf-8?B?b2xuQlRkaVJSZDBsOVcreHJXUXZ3MTVJbkM2VTdZWGt4UVBOZk0zZzRtRzhM?=
 =?utf-8?B?TmNwRG0yRUhIQndJTVVUTHlEblNibVdhQnBlY00zWkpQT0JMUDVEYTZENVNv?=
 =?utf-8?B?cEx6MnJNZDJlVlExaDZBWEo1YU5YZER2bm9aZE9ldzFaMTduYXdEd2RVRmtZ?=
 =?utf-8?B?bTJXYngxRUo4MERXR2haYjlUS3VuZnJYMFMxa1BuT0lRR2xxeWV1bExSZnBz?=
 =?utf-8?B?eVBMd2VOQ0Q5NWsxLzlYeEFWVjh2Ni9vRG5lc21qRzhsVUhQZHh2ME53dVlW?=
 =?utf-8?B?UW5kdFZ2UFFiZXE1Yk9SaEMrcG5zU3NsMlVVaUJkcE1CQlpIbHpqb2k3MEJo?=
 =?utf-8?B?eVR6amlFT2NnUWRtbm10M01qRFJ3QklQSCtaVnlMbDUzNmFFTGlFTjRFZmda?=
 =?utf-8?B?Um8vaUwxdXF1Q3FOVlB0aURCSWlFWmxKcUlGR3BCNWFGM2VCRkNlYUk4WlJp?=
 =?utf-8?B?VDNMTTJBRnM0RTFmanRkZU9zZGI1bXVVSnU3eGFONWkydHBhZjlLMU1NTWdU?=
 =?utf-8?B?K1NOY3VnSEpEY1ZJNXRJbktLbktCbjJtODFWbERXYVJtSnhrZ0h3U21UcFFm?=
 =?utf-8?B?SytzTTIvMDJXNUY2TUNqWXE2UURWb1FRMnJLK1Vpemw0Rm5iOW9HTTVWeFAw?=
 =?utf-8?B?NldnS1dXSEEyNEFxY0RQTnY4dDNzV0g1VHVwRy9uMnJOaE54Q255VE9xY252?=
 =?utf-8?B?ZkRHTzh6bnIzOXdCMzFmWU5rTW9pRkVpZUpxNkdxc3pLWWoxYVpWVENBNmFM?=
 =?utf-8?B?RkZPaWtKZVZNbmNlRVlvMUJDSnBiWGtrNUg0N1piWS81SFlCZXJsd1VEQlBN?=
 =?utf-8?B?TjRTdHJVR01yRFJXSEx0eGpOekpDcjlGUjlFdjYwVm5hc0tWRS9uS2lGWHly?=
 =?utf-8?B?UDFIVzN5TFVCNUJWL1pUSjZ5ZHg4TmdCL1htbjhLRi9hbkZxS3Z2SitDTWx2?=
 =?utf-8?B?cFVYUkhGV2IzQ3VrWG5wVTkrNmk2VWRYSEZWQzcwYzFickZEZ2tVTVZ4MVBJ?=
 =?utf-8?B?R3lpYThaeitodk1Hd3Y0djFUSFZqbFhZMGhDazRwODB1QytQTktmd0pNNVU5?=
 =?utf-8?B?YmxPTHdpYkJ2VXdzNkd0ZHptcHljSUIvVlk3bkpLWEFQT2M3Z2pJaElveklX?=
 =?utf-8?B?MVZjRFVuWWlPSHNGZDFTR01CaGpyYU5sZHVDR1AvWFMyM2xPVXAwdU5OMjNa?=
 =?utf-8?B?N2c4QXcwd0pWTTRzaWFibDJYMVplSUptaTY5QnVORERzdWViQkhLYUcwRkZa?=
 =?utf-8?B?bk5Md3hodnczSWg4d2VaeHZEdEhya0NmM0VCd0tvb1kyNTFncTNkWHcxN1pw?=
 =?utf-8?B?L0JrS3NpQWZiUlhYMnVSMUQvUXgzT1FNQSt3TXd1dmc1cVo1Q29JM3FMY0Y0?=
 =?utf-8?B?b2VuMU5VdHVMd2F0SnpWSHNYNU1nVkJPd2h3bWR2R2ViTXFSM3hiaW5WSDJZ?=
 =?utf-8?B?UndWSis2ZjVqa1kwNWhxQzlib1BCZWkyU1ZzYldDU2dZM1AzV2FKR3BzbmJG?=
 =?utf-8?B?SHZ2OWsra1FFS2N0VW5rVGM2dm9DTlc4OE9OM3FFZlUzdUlqa1JKMER6UXU3?=
 =?utf-8?B?MHY5TGh0VkI2alZNZ2I3RUcxam9QemFra3BFeHAxT3B1Tk5GY3BOSHg0Mjlr?=
 =?utf-8?B?YmxKMWlzbzBZOGFiZWkxWjlWTHZWdlE3aDRqVXNsRWx1UEgrZjBZb1FVTit0?=
 =?utf-8?B?ZmVNa1JFQkQ1RmxzNnJCRE16emltSFB5TlRyYzhZWS9kcU1wMklpNjV6TERt?=
 =?utf-8?B?eFVJdEE0dEozZmNRYjZMSnFUYmtRa2YwbWFCd2V6YVkxNlIwekNhODNxVHBT?=
 =?utf-8?Q?fh2A=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: I5Z+m6WIfMAT1mU71EuXcl3suTrNWSwfYFMCHq1YiN8HCS8gIhVowZn+j7MOWHH222CUg5nTbI5E28O9V8YoYTmnWppWXcYZcfSVwVdylEoDIF0cgWdfSrJZcPXASmWD3AoVeqdUvJJMSKrcopC7JCfWdhEc9oxY/ZUIpQUdbMfeSaZ92qs69m58ucazNeDNwF3Qyxl1pVyXQxh5AxBGBCaE5/rnqHQ+ZrFKJFkcu14gL0XME8Ly2ZFCeAaU/JvgOjQ65y0VgyacYc4JKGqmoJQbIuQ3Iox184ouSonLlykheaQNYOBDVekFKww1NmFh+b3zmBEIyWFCBgXuEvurU42+UzJ3JUh36eDgfcFzUCREWSLKacc2UIJZl41fx5xhsySlc3fyMPWFX/0Oy7X/5skY66W1JDc6/NsO/LQuk23MdVXSTrf1xDSPrM5LyNYCA8quGqfATJbRMiapfGJM6GcXr7qDwvUvrV/FW9pL5gj7qEhmPGgES9skpWJUdv+U4SNlwz+f6vxtUZ9Si7nfq0TVbDQ2QXfggDVk3tV5bxOzcBOchlX9VdNN7WQlz8EpWkX4OHzeHzd88n9jitvXBkc2brK9UDdOt69pSzeJ4DGOY7AFoJsoEmkI/UtpTMngOVdpXhcbrHgibCOZmJCviRvkuDfq6MZLI8hApH6LzQ581/E98f6H3DCAPQoCjnCg
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 17:16:07.4464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce1018a2-db40-48c8-b47e-08de4ed99c99
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5977
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_091614_964429_F2230C48 
X-CRM114-Status: GOOD (  10.30  )
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

The bootph-all flag was introduced in dt-schema
(dtschema/schemas/bootph.yaml) to define node usage across
different boot phases.

To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
present in all boot stages, so add missing bootph-all phase flag
to these nodes to support SD boot.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp211.dtsi     |  7 +++++++
 arch/arm64/boot/dts/st/stm32mp215f-dk.dts  |  1 +
 arch/arm64/boot/dts/st/stm32mp231.dtsi     | 22 ++++++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp235f-dk.dts  | 11 +++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi     | 25 +++++++++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp255.dtsi     |  3 ++-
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts  | 11 +++++++++++
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 11 +++++++++++
 8 files changed, 90 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp211.dtsi b/arch/arm64/boot/dts/st/stm32mp211.dtsi
index bf888d60cd4f..81b6a71fc032 100644
--- a/arch/arm64/boot/dts/st/stm32mp211.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp211.dtsi
@@ -50,6 +50,7 @@ firmware {
 		optee {
 			compatible = "linaro,optee-tz";
 			method = "smc";
+			bootph-all;
 		};
 
 		scmi: scmi {
@@ -57,15 +58,18 @@ scmi: scmi {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			linaro,optee-channel-id = <0>;
+			bootph-all;
 
 			scmi_clk: protocol@14 {
 				reg = <0x14>;
 				#clock-cells = <1>;
+				bootph-all;
 			};
 
 			scmi_reset: protocol@16 {
 				reg = <0x16>;
 				#reset-cells = <1>;
+				bootph-all;
 			};
 		};
 	};
@@ -73,6 +77,7 @@ scmi_reset: protocol@16 {
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+		bootph-all;
 	};
 
 	timer {
@@ -92,6 +97,7 @@ soc@0 {
 		interrupt-parent = <&intc>;
 		#address-cells = <1>;
 		#size-cells = <2>;
+		bootph-all;
 
 		rifsc: bus@42080000 {
 			compatible = "simple-bus";
@@ -100,6 +106,7 @@ rifsc: bus@42080000 {
 			dma-ranges;
 			#address-cells = <1>;
 			#size-cells = <2>;
+			bootph-all;
 
 			usart2: serial@400e0000 {
 				compatible = "st,stm32h7-uart";
diff --git a/arch/arm64/boot/dts/st/stm32mp215f-dk.dts b/arch/arm64/boot/dts/st/stm32mp215f-dk.dts
index 7bdaeaa5ab0f..bc366639744a 100644
--- a/arch/arm64/boot/dts/st/stm32mp215f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp215f-dk.dts
@@ -45,5 +45,6 @@ &arm_wdt {
 };
 
 &usart2 {
+	bootph-all;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 88e214d395ab..075b4419d3ae 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -57,6 +57,7 @@ optee: optee {
 			method = "smc";
 			interrupt-parent = <&intc>;
 			interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
+			bootph-all;
 		};
 
 		scmi {
@@ -64,15 +65,18 @@ scmi {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			linaro,optee-channel-id = <0>;
+			bootph-all;
 
 			scmi_clk: protocol@14 {
 				reg = <0x14>;
 				#clock-cells = <1>;
+				bootph-all;
 			};
 
 			scmi_reset: protocol@16 {
 				reg = <0x16>;
 				#reset-cells = <1>;
+				bootph-all;
 			};
 
 			scmi_voltd: protocol@17 {
@@ -114,6 +118,7 @@ scmi_vdda18adc: regulator@7 {
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+		bootph-all;
 
 		cpu0_pd: power-domain-cpu0 {
 			#power-domain-cells = <0>;
@@ -146,6 +151,7 @@ soc@0 {
 		interrupt-parent = <&intc>;
 		#address-cells = <1>;
 		#size-cells = <1>;
+		bootph-all;
 
 		hpdma: dma-controller@40400000 {
 			compatible = "st,stm32mp25-dma3";
@@ -223,6 +229,7 @@ rifsc: bus@42080000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			#access-controller-cells = <1>;
+			bootph-all;
 
 			i2s2: audio-controller@400b0000 {
 				compatible = "st,stm32mp25-i2s";
@@ -760,6 +767,7 @@ bsec: efuse@44000000 {
 			reg = <0x44000000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+			bootph-all;
 
 			part_number_otp@24 {
 				reg = <0x24 0x4>;
@@ -857,6 +865,7 @@ rcc: clock-controller@44200000 {
 				<&scmi_clk CK_SCMI_PLL3>,
 				<&clk_dsi_txbyte>;
 				access-controllers = <&rifsc 156>;
+			bootph-all;
 		};
 
 		exti1: interrupt-controller@44220000 {
@@ -955,6 +964,7 @@ exti1: interrupt-controller@44220000 {
 		syscfg: syscon@44230000 {
 			compatible = "st,stm32mp23-syscfg", "syscon";
 			reg = <0x44230000 0x10000>;
+			bootph-all;
 		};
 
 		pinctrl: pinctrl@44240000 {
@@ -965,6 +975,7 @@ pinctrl: pinctrl@44240000 {
 			interrupt-parent = <&exti1>;
 			st,syscfg = <&exti1 0x60 0xff>;
 			pins-are-numbered;
+			bootph-all;
 
 			gpioa: gpio@44240000 {
 				reg = <0x0 0x400>;
@@ -974,6 +985,7 @@ gpioa: gpio@44240000 {
 				#interrupt-cells = <2>;
 				clocks = <&scmi_clk CK_SCMI_GPIOA>;
 				st,bank-name = "GPIOA";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -985,6 +997,7 @@ gpiob: gpio@44250000 {
 				#interrupt-cells = <2>;
 				clocks = <&scmi_clk CK_SCMI_GPIOB>;
 				st,bank-name = "GPIOB";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -996,6 +1009,7 @@ gpioc: gpio@44260000 {
 				#interrupt-cells = <2>;
 				clocks = <&scmi_clk CK_SCMI_GPIOC>;
 				st,bank-name = "GPIOC";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1007,6 +1021,7 @@ gpiod: gpio@44270000 {
 				#interrupt-cells = <2>;
 				clocks = <&scmi_clk CK_SCMI_GPIOD>;
 				st,bank-name = "GPIOD";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1018,6 +1033,7 @@ gpioe: gpio@44280000 {
 				#interrupt-cells = <2>;
 				clocks = <&scmi_clk CK_SCMI_GPIOE>;
 				st,bank-name = "GPIOE";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1029,6 +1045,7 @@ gpiof: gpio@44290000 {
 				#interrupt-cells = <2>;
 				clocks = <&scmi_clk CK_SCMI_GPIOF>;
 				st,bank-name = "GPIOF";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1040,6 +1057,7 @@ gpiog: gpio@442a0000 {
 				#interrupt-cells = <2>;
 				clocks = <&scmi_clk CK_SCMI_GPIOG>;
 				st,bank-name = "GPIOG";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1051,6 +1069,7 @@ gpioh: gpio@442b0000 {
 				#interrupt-cells = <2>;
 				clocks = <&scmi_clk CK_SCMI_GPIOH>;
 				st,bank-name = "GPIOH";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1062,6 +1081,7 @@ gpioi: gpio@442c0000 {
 				#interrupt-cells = <2>;
 				clocks = <&scmi_clk CK_SCMI_GPIOI>;
 				st,bank-name = "GPIOI";
+				bootph-all;
 				status = "disabled";
 			};
 		};
@@ -1084,6 +1104,7 @@ pinctrl_z: pinctrl@46200000 {
 			interrupt-parent = <&exti1>;
 			st,syscfg = <&exti1 0x60 0xff>;
 			pins-are-numbered;
+			bootph-all;
 
 			gpioz: gpio@46200000 {
 				reg = <0 0x400>;
@@ -1094,6 +1115,7 @@ gpioz: gpio@46200000 {
 				clocks = <&scmi_clk CK_SCMI_GPIOZ>;
 				st,bank-name = "GPIOZ";
 				st,bank-ioport = <11>;
+				bootph-all;
 				status = "disabled";
 			};
 
diff --git a/arch/arm64/boot/dts/st/stm32mp235f-dk.dts b/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
index c3e688068223..391494eda5e6 100644
--- a/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
@@ -130,7 +130,18 @@ &usart2 {
 	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-1 = <&usart2_idle_pins_a>;
 	pinctrl-2 = <&usart2_sleep_pins_a>;
+	bootph-all;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
 };
+
+&usart2_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index a8e6e0f77b83..0cc3ac8bb584 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -66,6 +66,7 @@ optee: optee {
 			method = "smc";
 			interrupt-parent = <&intc>;
 			interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
+			bootph-all;
 		};
 
 		scmi {
@@ -73,15 +74,18 @@ scmi {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			linaro,optee-channel-id = <0>;
+			bootph-all;
 
 			scmi_clk: protocol@14 {
 				reg = <0x14>;
 				#clock-cells = <1>;
+				bootph-all;
 			};
 
 			scmi_reset: protocol@16 {
 				reg = <0x16>;
 				#reset-cells = <1>;
+				bootph-all;
 			};
 
 			scmi_voltd: protocol@17 {
@@ -142,6 +146,7 @@ v2m0: v2m@48090000 {
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+		bootph-all;
 
 		CPU_PD0: power-domain-cpu0 {
 			#power-domain-cells = <0>;
@@ -174,6 +179,7 @@ soc@0 {
 		#size-cells = <1>;
 		interrupt-parent = <&intc>;
 		ranges = <0x0 0x0 0x0 0x80000000>;
+		bootph-all;
 
 		hpdma: dma-controller@40400000 {
 			compatible = "st,stm32mp25-dma3";
@@ -305,6 +311,7 @@ rifsc: bus@42080000 {
 			#size-cells = <1>;
 			#access-controller-cells = <1>;
 			ranges;
+			bootph-all;
 
 			timers2: timer@40000000 {
 				compatible = "st,stm32mp25-timers";
@@ -1577,6 +1584,7 @@ ltdc: display-controller@48010000 {
 				clock-names = "lcd", "bus";
 				resets = <&rcc LTDC_R>;
 				access-controllers = <&rifsc 80>;
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1738,6 +1746,7 @@ bsec: efuse@44000000 {
 			reg = <0x44000000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+			bootph-all;
 
 			part_number_otp@24 {
 				reg = <0x24 0x4>;
@@ -1842,6 +1851,7 @@ rcc: clock-controller@44200000 {
 				<&scmi_clk CK_SCMI_PLL3>,
 				<&clk_dsi_txbyte>;
 				access-controllers = <&rifsc 156>;
+			bootph-all;
 		};
 
 		exti1: interrupt-controller@44220000 {
@@ -1941,6 +1951,7 @@ syscfg: syscon@44230000 {
 			compatible = "st,stm32mp25-syscfg", "syscon";
 			reg = <0x44230000 0x10000>;
 			#clock-cells = <0>;
+			bootph-all;
 		};
 
 		pinctrl: pinctrl@44240000 {
@@ -1951,6 +1962,7 @@ pinctrl: pinctrl@44240000 {
 			interrupt-parent = <&exti1>;
 			st,syscfg = <&exti1 0x60 0xff>;
 			pins-are-numbered;
+			bootph-all;
 
 			gpioa: gpio@44240000 {
 				gpio-controller;
@@ -1960,6 +1972,7 @@ gpioa: gpio@44240000 {
 				reg = <0x0 0x400>;
 				clocks = <&scmi_clk CK_SCMI_GPIOA>;
 				st,bank-name = "GPIOA";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1971,6 +1984,7 @@ gpiob: gpio@44250000 {
 				reg = <0x10000 0x400>;
 				clocks = <&scmi_clk CK_SCMI_GPIOB>;
 				st,bank-name = "GPIOB";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1982,6 +1996,7 @@ gpioc: gpio@44260000 {
 				reg = <0x20000 0x400>;
 				clocks = <&scmi_clk CK_SCMI_GPIOC>;
 				st,bank-name = "GPIOC";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1993,6 +2008,7 @@ gpiod: gpio@44270000 {
 				reg = <0x30000 0x400>;
 				clocks = <&scmi_clk CK_SCMI_GPIOD>;
 				st,bank-name = "GPIOD";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -2004,6 +2020,7 @@ gpioe: gpio@44280000 {
 				reg = <0x40000 0x400>;
 				clocks = <&scmi_clk CK_SCMI_GPIOE>;
 				st,bank-name = "GPIOE";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -2015,6 +2032,7 @@ gpiof: gpio@44290000 {
 				reg = <0x50000 0x400>;
 				clocks = <&scmi_clk CK_SCMI_GPIOF>;
 				st,bank-name = "GPIOF";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -2026,6 +2044,7 @@ gpiog: gpio@442a0000 {
 				reg = <0x60000 0x400>;
 				clocks = <&scmi_clk CK_SCMI_GPIOG>;
 				st,bank-name = "GPIOG";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -2037,6 +2056,7 @@ gpioh: gpio@442b0000 {
 				reg = <0x70000 0x400>;
 				clocks = <&scmi_clk CK_SCMI_GPIOH>;
 				st,bank-name = "GPIOH";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -2048,6 +2068,7 @@ gpioi: gpio@442c0000 {
 				reg = <0x80000 0x400>;
 				clocks = <&scmi_clk CK_SCMI_GPIOI>;
 				st,bank-name = "GPIOI";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -2059,6 +2080,7 @@ gpioj: gpio@442d0000 {
 				reg = <0x90000 0x400>;
 				clocks = <&scmi_clk CK_SCMI_GPIOJ>;
 				st,bank-name = "GPIOJ";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -2070,6 +2092,7 @@ gpiok: gpio@442e0000 {
 				reg = <0xa0000 0x400>;
 				clocks = <&scmi_clk CK_SCMI_GPIOK>;
 				st,bank-name = "GPIOK";
+				bootph-all;
 				status = "disabled";
 			};
 		};
@@ -2092,6 +2115,7 @@ pinctrl_z: pinctrl@46200000 {
 			interrupt-parent = <&exti1>;
 			st,syscfg = <&exti1 0x60 0xff>;
 			pins-are-numbered;
+			bootph-all;
 
 			gpioz: gpio@46200000 {
 				gpio-controller;
@@ -2102,6 +2126,7 @@ gpioz: gpio@46200000 {
 				clocks = <&scmi_clk CK_SCMI_GPIOZ>;
 				st,bank-name = "GPIOZ";
 				st,bank-ioport = <11>;
+				bootph-all;
 				status = "disabled";
 			};
 		};
diff --git a/arch/arm64/boot/dts/st/stm32mp255.dtsi b/arch/arm64/boot/dts/st/stm32mp255.dtsi
index 7a598f53a2a0..7b2e07613030 100644
--- a/arch/arm64/boot/dts/st/stm32mp255.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp255.dtsi
@@ -21,6 +21,7 @@ lvds: lvds@48060000 {
 		resets = <&rcc LVDS_R>;
 		access-controllers = <&rifsc 84>;
 		power-domains = <&CLUSTER_PD>;
+		bootph-all;
 		status = "disabled";
 	};
 
@@ -40,4 +41,4 @@ venc: venc@480e0000 {
 		clocks = <&rcc CK_BUS_VENC>;
 		access-controllers = <&rifsc 90>;
 	};
-};
\ No newline at end of file
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
index e718d888ce21..69bac9e719d7 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
@@ -130,7 +130,18 @@ &usart2 {
 	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-1 = <&usart2_idle_pins_a>;
 	pinctrl-2 = <&usart2_sleep_pins_a>;
+	bootph-all;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
 };
+
+&usart2_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 6e165073f732..307b9692b00a 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -477,11 +477,22 @@ &usart2 {
 	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-1 = <&usart2_idle_pins_a>;
 	pinctrl-2 = <&usart2_sleep_pins_a>;
+	bootph-all;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
 };
 
+&usart2_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usart6 {
 	pinctrl-names = "default", "idle", "sleep";
 	pinctrl-0 = <&usart6_pins_a>;

-- 
2.43.0


