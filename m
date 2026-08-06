Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D80C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 20:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TGcP6xpv69Ctt4EvK4uVwskdXykkT62I6R6TeQFDHR8=; b=d0GEAbfC+MoG2W7Cu+dlvym7hz
	EwPw3GqHKjEqY6S1118bxB76U9uU1cygRdSldsKa56QjSNmy9QUbY6NsJUTJZIjupdwXozjOfMPAn
	XpCSK1hOmNIuGYUo5pFGjX8NCHaBySiOUI3VmivtN1Dz7W3EUwyUXxvsZKkH3gJy1Y/8y+hWsAkUb
	G+JCSWcOBigggWdwInBw8xUdaQqHqsAJlyxZilc4AB8UkWOHQlzAJv5+TWKGgIuJiB8D8Ixzx9fTa
	VDj+jEcwSzd+IppaxEUAOeCdw9PbCM/BT22hdX8tdztUqS3CNFt905gqJwg1TNm2/SB2Qxb6qGqhj
	NKM47Ofw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws4QX-00000006dT2-2EDp;
	Thu, 06 Aug 2026 20:10:53 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws4QV-00000006dSg-14qC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 20:10:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GltCYfH4o+1nU+YWy63PYNUqgx+JTZaiDzhz+7tp6AWcJjsdeataOmq+cyTB/ezKEpALUiRlUvKJ8NKIBitoQqUxudZhYq90auikRSbBJrYmggwHakbqssXgJ83OyPOc8khEK+g5buL8L9JRYRlyZ0U1DRht7sTZYM+vHADYZk/RhC7hfIuTmOZNrpRbJq1/Lllj8Ho3EIIsvCdz27wfLFI7AD2SnOEHQawk6WTjIeyteYardTQhD9WzH2GDFMrZyR1qWhwD7YDa8+LbrIcnF9qNT2YkMMJYlPi0G3UwcELXp7tAxsTw8HVTZtRYVT47dmBXD+ghk2pQVuz5gk1abQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TGcP6xpv69Ctt4EvK4uVwskdXykkT62I6R6TeQFDHR8=;
 b=nfZd9J4U2RExa6giJOgtbCh0vGCliq35dHL6AktC5jpRzFqxJNBCcJj/j7nY6ZF4LwNerqVPyh6tV2S5cBZBW1X/YcEG34SsXxchB2aCK/hrHvhFpWbDutmNqGU2eLs9SulJXnwVkbNMSABZ+8ni2/mBplcZeSpoiGTM5gyW33w50PO2iiEh0/duii4yNn5jC1mu/oiT662KstVesi0vctvtXosd07yD+0O14ALTc/0Pv94T/sf51tvLe2Nz0oQO1kYyVkY5Vb5rxAP4E3XsI4DfL+h7/nukfly+7YGcZt86s99pC2OW0TjvWofj6gIKqkobYmrFh97ui5mgrQG4Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGcP6xpv69Ctt4EvK4uVwskdXykkT62I6R6TeQFDHR8=;
 b=Btfh7fU6E84vHnaL+7Vb71ccoKb61Sw/pA6GThhy23QRIyZ0oiGzTEdxRu2988vGyibBTVUYTwiZS+q11iUUNapV8HBK/UyLZZ061rJOi5QvCeUd7S34F4cDkH9aN3uFnZx2RMKNXa6zkaVp3O5E24N4Qluv+4Y1ijyPbEQUhi775vCWlx1ZtaaBM+jyFo6eV57mf+T9iYj5yeXS7UFlg7kbtUySoTsGlUAw7EVnCVb1ZtXQtiB2JGfN84vwWV0V8j7IaOfnkSy96tJ4aRF4o2a8RN0EUB5EgrVbT5Rhqfq3omvHDuwdy288I7x2R42bqABOQnjGWPBAy2RIKPqhmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM8PR04MB7348.eurprd04.prod.outlook.com (2603:10a6:20b:1db::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 20:10:46 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 20:10:46 +0000
From: Frank.Li@oss.nxp.com
To: linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marex@nabladev.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 1/7] arm64: dts: imx8mp: Add DT label to SPBA5 bus
Date: Thu,  6 Aug 2026 16:10:38 -0400
Message-ID: <178604698053.442068.12716182491630631934.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804162310.24374-1-marex@nabladev.com>
References: <20260804162310.24374-1-marex@nabladev.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH1PEPF0001330D.namprd07.prod.outlook.com
 (2603:10b6:518:1::1c) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM8PR04MB7348:EE_
X-MS-Office365-Filtering-Correlation-Id: 21e03001-c17c-4d95-7b62-08def3f6cd0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|19092799006|23010399003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 6yC/iwRXoUcPohyp1jH24RK3YZ33r1arTioJdrJoAnjx61E61eFttrLOkoADeGBDiXAleT5qdnWZe/6soCfVfJSUjDgbO+2iFRnIq+nr9/R4jOmLOWZ3FT6OVRc8UgW4p8ClTWegsX7rf2BzzOWk9eDMhXKz8SHUAt7Hu94w9I6nkuikWbzpgQdTOaisrZFtUqUx4oxoN+nDSSTA5COHeWRVE91T3gaLUuwkH8r/2N8PtZ4Hq45eiGrgw0MRXROgCxv5yenaE7G5lJ1wK1frjIAxwYzpZi1Q55U1AlJ7VvI0DdGuJGEKhDlJXTA8M53ofnmoDMVdGDD9I9fFLwHTOdPv0QewyxlRqTaXv++uZLZN3slm0zURe6e2gnF4cjJHOaFowgs4wFZ4riuy3brHInZQ6FZkW6FCWgq+DBxFB6hYAQVFP8Ka55EIh+G7+5UQe04fnYHQx9qtpitaXFn7ZY9dcQILDRBJeOJW8F6gVhBKTsgaXw4TaxhVIsm3+BZEqar/jkgo0j6SFDp+WK/FnpbBDLQF10uyCZ5rSXhGr9dIGX/dzbR1bCnb8Bio6h06I6ttNNHSkIlV3tX4ONSCxHAVMSWOzTsGhcjCsK6b3gAo4xQInFh/ztOpKbfoKJjWeSiIxjd4FniwhlQAjwZ+v51EqkRfs9nLw6DAWbRJGK4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(19092799006)(23010399003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b29xZVI3MEJRb2JVZmVrRmt1VlRUM1hvcFMzMjdiVUN4L0lJSTVodnp2ZEJF?=
 =?utf-8?B?cUJxS0Jqb0l2eW5kZ0ZjcFhqeFVmUm1sbXpnZFd5WXFqbXpTL244SkJPeGRn?=
 =?utf-8?B?eExLWS83ZE9YQVVYRzdOM0s0WmdFSWZPQncrdy9mWXhZUkQ4VmpLWDBFRVY4?=
 =?utf-8?B?WVFtWFRuSFNOWWdDQkNXOGVFUXV4ejNPVnJMdWZBTGxWWDlXMXJSa3V0bUN1?=
 =?utf-8?B?TWswelk1WHkwTWVoQUsvaGZ0bjZqeWdjZGtacTluZUI5M2pwdkhBVkdYQlVk?=
 =?utf-8?B?dkNmMGxHcjAwZXNjbkFKbGZKSEJRK09CcjRVSDdIMFY3d2dvazcxMEZwZnEx?=
 =?utf-8?B?bnh5QUpzaGVjYmJ5RG5qTTZ4STU4MitZM2NQVkQ3TjdJamRmeHQvQzVZL3dH?=
 =?utf-8?B?Tjh4a2ppQ1pheWFtODVPSW1SdGxRa2c3akxjWnI2T0VNNWg4MktKWHkyNHFz?=
 =?utf-8?B?ZE1wT1puNGova3pEa3dCenZzV1dEeGg0MWJwWElaRVo5QkNmSm10WDBkejYv?=
 =?utf-8?B?cE9rRG9FMUVNOEhCUk4vS0p0czdBalFVUzJGMVdIZWhydEtLS0pLSEsrQVpP?=
 =?utf-8?B?VnBIWUZZZ2ZBK1VVblc5TzdrTHRFdkx1bkx6azYzRmc3Q1dvaE96UTBpWWNH?=
 =?utf-8?B?emR2cURvcEh1enY5cTBTeCtEbDVlVTdpUFBaQWFBYUdtUkw5TTh4dS9PeUds?=
 =?utf-8?B?aGM0ek9DRTd2N3M3cmlwRTFLNnd3R2NYSDRVbjZxc1lTSzRUSXNqTXczVG1k?=
 =?utf-8?B?cE1vQURJR0RteFhDZUdsZ1JNVVBpUzBxMU5NOVA0M001RUtkcC9wMU01V3kv?=
 =?utf-8?B?LzB0V3daY2hwU3dvRzZPL1RRZno0UlhDR1BHODI0dDhoYUNVNTRyQmJ0ME1Q?=
 =?utf-8?B?akk0cUVrUFhXOUI4RCtuQzRTazFRWldLUCsxVWpqeE9Bc1BPbStKMXlZOTJF?=
 =?utf-8?B?akNYWmJGcFVnSWg3Zk1vZ0VDbVFTcUxMT21aQ1QrYzRNWXl2V1g5MHNJYWRV?=
 =?utf-8?B?ZEIxNHlpRS8yL0pVdnh1aU5LZGVqQUg5Vy9XUmR4Sk9UaWYybFZTRW1WNFB4?=
 =?utf-8?B?ejNGV0ltMXE2ek1JMUF3a25WV085V3hyOWE1MDR5RlRpS3ZQcnIrR2t3T2RE?=
 =?utf-8?B?b1JNdFZGMkQ2K1gvRisrNmNVM1hYNHhzbXZvcnJuTEwydTVVcnBzYVVKMWtN?=
 =?utf-8?B?TDNxVHNnMTMxUEhnT2EwMklobEx0K05vRmdFSmM0NzFZRzZRc0YzSU1yS2hv?=
 =?utf-8?B?aTA1aEdTSlBiOXlkaTg2NDEyKzI4QTJ4WXJZSU1uWFlxTjVvWE0xUHMwMDdp?=
 =?utf-8?B?b1U2MUhmZU90WXB6NEJXUmpBQVQwOGxjY2VYUHRyN3N4dEhJL0ZSOXdVSGtY?=
 =?utf-8?B?SldlS2trV3FheitqT2FlV1RqdlVrVFkxYzhqbDUvSkhuMmZXK3VOS1lmVDVT?=
 =?utf-8?B?RDNSUStwT1pxL3d0Vm1DM2tGZzdrSS8yblg2SU5zTlUrRXdhanNIWHNqdEp0?=
 =?utf-8?B?SHNKczVxbVBoNGNFUytYZ1FuanYxYkNlaFA5MGlxa0lBNVVST0JLeGRYTDNz?=
 =?utf-8?B?VkJOeGErUWszbk15WkFwTHpFQjZwTzc5N3BuNEtYOGk1MitoRzVDVmtGOHZN?=
 =?utf-8?B?dHFyclNQSTU5bWM5alhxdTMrM2pNTFAwTjNzWnFZUUZ5dVc3dXVzQlE3S1BU?=
 =?utf-8?B?TEJleEF5SnlvUWo4YmdIR2Z4RERwYkNaWmIzK0x0aFJpWCtwTXRXRVZXdHY0?=
 =?utf-8?B?R3JBZTRMUllLWWRiYWRvTDFmNDhHc1lteEJNZ3libHhmRlhDTS9ZS1NrNTF4?=
 =?utf-8?B?U0NWRGxrQWJXU3A1V0lYRmRmdG1BUnNKVnpaVENGalNEamR0eXUrcXR3M0hS?=
 =?utf-8?B?MHJSVk9icE1IYm9RZDBYSVN6ZGpEVUQrcEhkTGNlRHd3RHBFdzUwMk10THlM?=
 =?utf-8?B?QWRIS0E2RnovMldPZkJNclVPZzZMSFZnOUtMRVVVR2p5SHg2RldiZkFTRmdj?=
 =?utf-8?B?YXZ6RnZvYkhUUEl5bWp1Q0pTaUZQU2RNVldZSSt1eUQ1WUxGUDFHTHRSTWVR?=
 =?utf-8?B?TEI3ZnN0OTd4dTlVK3V4a084S0F1N0psUHB6dGg4L0JTaENveElmODRudHNa?=
 =?utf-8?B?YjJ2UHFaQzVhOVloN0w2bmMzc1RsTXY5R09OSHp2SmlhQm9wdlZwT2tWVzVz?=
 =?utf-8?B?OXFjcXhvV2JDdzBEaTNWQi90SWFrUlBraXJZV0oxMG9sSGtOTU0wMmx6K3FW?=
 =?utf-8?B?YnkzRSszVC8yem5TYmFpanlvVlNYQ2RpbGZJeEdFdmJ6bWhHY1ZZTHQxSWtN?=
 =?utf-8?B?bmQvSzJoZFcvZmZBQXFKMERVVkZPUDkwMlkvSHRFK2JYaTgvcEdVTmtkeWZk?=
 =?utf-8?Q?YPqP0ih+fVjy0H54ocG92klZICDF8DwhjsoJQ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e03001-c17c-4d95-7b62-08def3f6cd0e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 20:10:46.3992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: URFPYZBeman47WkCcNQaYnVrMw9DWSoCjtVFIwoO44oX1k96AVzsWQVeiQTLxzvrvEDuMT/fJAx0Y1BTOR7rFDtgJuuECxpwKP2QCJyQPHtqORQvq2pgj3oEYrSk72EY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7348
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_131051_322526_51DE746F 
X-CRM114-Status: UNSURE (   7.66  )
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

From: Frank Li <Frank.Li@nxp.com>


On Tue, 04 Aug 2026 18:22:45 +0200, Marek Vasut wrote:
> Add DT label to SPBA5 bus for usage in board DTs.
> No functional change.

Applied to (imx/dt64-indend), thanks!

[1/7] arm64: dts: imx8mp: Add DT label to SPBA5 bus
      commit: e45893b1cad125bfca0a0da27f241c19f7178a7c
[2/7] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
      commit: 01f74e53aab70d8eec78e117e9f18c551eff5c4e
[3/7] arm64: dts: imx8mm: imx8mp: Add legacy board DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
      commit: 011711bc2a1483976fd190257c5109060ebdaef9
[4/7] arm64: dts: imx8mm: imx8mp: Add HDMI DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
      commit: 2d0eec3ad7f4cfbceec6c3445c86c687cbb145d9
[5/7] arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
      commit: 94421a66b32b6fdb1198ed1e8edad3a95f119802
[6/7] arm64: dts: imx8mm: imx8mp: Add FIO1 DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
      commit: 9b8c47340e8d87408c10ec70946266bbf34e3352
[7/7] arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
      commit: e7d9a255eed639f75de1e597f9420a4b7dfd6cd8

Best regards,
--
Frank Li <Frank.Li@nxp.com>

