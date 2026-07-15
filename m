Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1456C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lc9S/gQN9yG4jR6E3MT30mHdRLsYnwddjKeJ3BVaSGY=; b=DTQ4sD5dvEONgG8dRVubNoWuCR
	ui7j/jf6ty4pWyEXMnfFA26KF1Ka1lro07JqgY9sMUUZT9AMl0BZQGr1SR9KBNSe+Lk1THx8pw/UA
	ZFEALcinfElmLFiiev2VFOOCIrPEh7TrjZbfo9fbSImILfYjMX27hWe+eoT7eoANkLb6fy4OQDgG2
	25gFe2dTEZa21Zft65yIL+hOW/XKsJ1gpYjxMW7bPmd+Rigb3eVwT83ngEyRbkdiEV1XnMnZzkkT4
	GjiKdY+Jl0gaMxybpZ/Cxxc5gSODeGkqGYwwvW4hV3cv5JPP5elq+9/9O52R2wtk6V6ZP2lWWCpJE
	731u03mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjykp-0000000EnOR-2BIc;
	Wed, 15 Jul 2026 12:30:23 +0000
Received: from mail-northeuropeazon11012042.outbound.protection.outlook.com ([52.101.66.42] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyke-0000000EnJi-3ucK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 12:30:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EhLIoW/kfv5mhODpmRNroYtF2OOQj10++MLltbGidGKv2yOa1sR4/B4ftBdccs+f4p2Y/LS3yz5ZEs9Z8QLil/I8KYUUc8IeZaCL/PCeY9beQngI1jg/85DWCZ0FqfEyQ+yhD8SkQKS4xASl8iRCdwc//moeNqRaHqal1DaTb0VtRpAXJATeqV1KAfkqeXlC48JSXDZDq++ZxH/51TJCNpDuTIQMvtgrCVk357ypfmuM6JdrtDyp8gEZA52rzfRI1z+NHDQptlNkvl/mRD7pvwzkPWxjOqgJoVI2FdjeqWI8BqX0OUsJcfozpdwPohH9AaRKri5ih/nIFuvu13gOuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lc9S/gQN9yG4jR6E3MT30mHdRLsYnwddjKeJ3BVaSGY=;
 b=LwdxPC8Vho78Hw401uwK77HzSqMCHRGUiT0U6FjbJ1UXRP1wBzRMK32zyToCh2f9rJQwiUz517SF7G2yAc1rgBAsDecDz0twUVI+RFk6ELw0C2arc5XpKAp6CRWu+cBDyjDZqLaGIol/dEk04fWS5lPjhWHk1GOZ9mKyR40tem3BG9W2MlXHwpMnuvBxdYaDyZOaz72ZZoq3nqxScws5SArY8uaX2dtpjS3PcYL86bVaRYZFh/8eXSwiBPo4zjxs4JZI3mcN4h2CISgF41KIGDd8SARZJ1mDp0rI9R7lgt1GIsaLInTlmOQvSifm+92SnPS38KIrdbAjUnPgSQSe1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lc9S/gQN9yG4jR6E3MT30mHdRLsYnwddjKeJ3BVaSGY=;
 b=XpqXJ+3grNEyRnKtSAqPcikGF6OFO7vYA4pAjQ5V2GGOBXanTaYOT39hvck/z6wec9qKzggVfczu/d7l0FQWq1qqGLfNzW9qrLuxYGcO/HMqKRvhZiGX7YyFC0nSILCTuAbVzn20O6d6JrXW7pLIZhGewhob1kFj8AKF9NDtErWTbKnd+ywcTLWWSpNqMR4nyWNtxzs4Q6HGx39FkrejzzfPoRnSWCr08aTv0lZ1R0GCgsUqW+vPlJRwgmPgcsUEpubMrwddiCkce5fjEquJDG9eI2DktGopK3LiO1+SI8kOWoixWmv8zSi0T0V+YB/wqQMSvM3y6WD5+B4JcFEjHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS1PR04MB9684.eurprd04.prod.outlook.com (2603:10a6:20b:474::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 12:30:09 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%3]) with mapi id 15.21.0202.018; Wed, 15 Jul 2026
 12:30:09 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 15 Jul 2026 20:33:04 +0800
Subject: [PATCH 3/9] arm64: dts: imx8ulp: Correct SRAM node address and
 size to cover full SSRAM P2
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-imx8ulp-dts-v1-3-19651358b599@nxp.com>
References: <20260715-imx8ulp-dts-v1-0-19651358b599@nxp.com>
In-Reply-To: <20260715-imx8ulp-dts-v1-0-19651358b599@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI2PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:4:194::23) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS1PR04MB9684:EE_
X-MS-Office365-Filtering-Correlation-Id: 82870323-dc75-483b-d659-08dee26ccf36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|19092799006|366016|11063799006|56012099006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: gjtqmP5arfBMWcAFMHzdMXC1mTQiVgW7Xw5DYeBkXNVZEGmDF/dXVoewro5lE29df7CbsrBjgLrPAGJ/kNfWaI8Xh4puaH0XsTZN7dDr7lNJzHTuA8uoa+YeAsXFbb7U8b/Hi3evUL0GW525jLJrcdJfXmCKPQHm5pysBDCn9l7FVNPkgz/t+c0j1dH5K8RbFsMlm0epplQycXRpef8mbs3jPI/N0hnxq2S0oDjCp2OFzcsGNW4wZfEytznkpRRY9gWEnIRLHgNnHbbZB3yKy9Ya/on6TdU1qlFnKL/mR/JQRyQg80GeAuEpitEcfyAm3VvBLmQo0T3W3JAGnQq3Gsxj78I3dEqs88ckWrKjye1rvJ5H1fwTzCr3vXa98cU2ifMB6CA7a3rf+4w4xkIfesMEXQB3L55A52DAEs1+mHZBhE1+7+UUVAyu00euU8+NF/KojyoPOYKi1pZBNatcNM5NkNNFR0d8GYhcCBP4ccmRRSNLA6rLgD5f8UduS+aD5QDpXKbk+0yLiGWNcylhodQAMsa4F1IXx+/vhZwxwsPpTzHBnLU1F0E0lrAKNO1vaWXkdix3CQ1qycT3LV/J6aAdo6BZrNBaixVmWbYl6dvA39cLz1kWhAfmJxsVrazSsAj/yDZRbAWzj2eAVovqah4ioxLgd20eQ3MT5ZegqN4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(19092799006)(366016)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzZveWlGdFlPU3h6Wjh4cWJRRjZ5UnlnLzZ6RzB6NUNkcTcrQURNK29EQUlI?=
 =?utf-8?B?emVBU0JRdmNxV2pmWGkyYi9SQmJ4TWRXU1ZhVUwxOFZFRzM2VG1YMEY5YWRn?=
 =?utf-8?B?eVE1ckE2cmNFL0QzR3p0QUphMzZHNEMrVFBxZ3EzQ1Y2alUySE5BanZqYmY2?=
 =?utf-8?B?MXVjcHVKZWZmekpTOCsxZklydUloUUVtTE9Ub3RXampzQjR0NGNVa3NHMHd6?=
 =?utf-8?B?MHp1MHYrU2VER3d5RXVqMCtKUUtUV1ViOXpnbVpIdFI1UnJDKzhtTVBtbmhC?=
 =?utf-8?B?aUF0LzVUd3JMemt3TkxrZWVKQmlFV0ovUWZKNXptWDFZTnk5OERhcHNtZEpI?=
 =?utf-8?B?UG1mY1puZnpFVUw2SVZzOStOYWQxdytLQ0ZWWThzTWFKUFlxa0FZcTVzcjg0?=
 =?utf-8?B?V3lNV0ZQaWdwaWtTUmNkeU12Y1cxK2Q3Mm9ubStOMWhZTzdpYmhZMy9rV3gr?=
 =?utf-8?B?NTRnaThOSVhZazB5UkViN0hxenlpM3pJdW9QbTNxSm00dE14REorVTFFOEU1?=
 =?utf-8?B?RmZFRmNIK2pjb0NtMjBVOGRsNTNpR3NtWmExd2paNW5wbzhLakNtZGlKZ3Zi?=
 =?utf-8?B?ZHE0V29MdmtYckhFcUNvZVRQdFBHcllzeUtJTG41SXB4ZG5UdXNnWk0yZEhl?=
 =?utf-8?B?eko4V1A5NXFwbFBaS0ErL3dFdDlIMVVZRUhRcnBMc043eEFmQXBveGc3MGhP?=
 =?utf-8?B?RWtHY2xKVE1WaVJHdm9OTnBqeEtIVFowVmJLcnVQN29zWnpjSjZmVVVoRVND?=
 =?utf-8?B?WnFXSU5hNUJPVGQybGtvYTdxZzhJcXA4emlkT0UrcVl6Z2N4NnJmZEFDS3Er?=
 =?utf-8?B?SFJDcnNRdGxqOTc0M2srWHdFbk9GR3kxeGYvb3BSbTY4QU9yK2ZlUUpkNVNK?=
 =?utf-8?B?dUpoYWd4M0JrV2ZRSDhsNjJCWlVtb0xiVmFRRDZlcjJxYktpNTNYQmM3ZFQy?=
 =?utf-8?B?TjgreU4zdERNRy9RZjNGL3RCQ2lrWDhhOG9OckRyVEw5WTdqanRsMWVzVmEz?=
 =?utf-8?B?Mm81ZFNHdEY2bDdDL1NWOEJ1MFZFQll5TU9GOXJib3dCRGMyM01GRDBnenVC?=
 =?utf-8?B?b2RrNDJxcUJ5TUxWM0pTUUFMSnN6ZVcyVVBaTEVJcVdTK1BCWVEvZ2RZYmJo?=
 =?utf-8?B?T2krYzEwdEtNT2RWNm5DeWRvOHdqZjF4dzBkL3E2ZVg4MnBIV1JYTndWNm5O?=
 =?utf-8?B?Z3o2bEhlZ3pvRWRUWHFXeWlEUkhXY25rRTVUd25FbXJkWVFTYUNTTm1rMndM?=
 =?utf-8?B?OTJUU0RTR0cyaTlLVVdEcTFUVWN5THhSc1l2K0dKZzZoWlFEQTJoN0JFR2RB?=
 =?utf-8?B?Szg2OU00RVBFYmRhR3JvOEtKcTRUTDh5eDg2YXBuTnNpNytzVUZONm5KMlRo?=
 =?utf-8?B?ZmFqZlJsSGxSLzRoU2JHVDRNNWJnd2hUQ2dvRktlUEcyYTVRalFHUXJ0S0JL?=
 =?utf-8?B?UEFMWGZEdnpjeU5SL1JOTm53Tmw4SUhnWGpwKzQ4R3J3QnFZSmxybWprTkpn?=
 =?utf-8?B?YnVwbTRLcElwbFZDeEtnMzFndkhvL21xQk9zZWpYTXczOEVHaGdEMjFrald5?=
 =?utf-8?B?N1Z3bzlBczZqRkJBamVCR2RCamZRbEUzNmErNlNEMUNob05lenZtcXJYcmV2?=
 =?utf-8?B?aldjV1BGMkJWeHFvbGZQMjhCbnhRWi9kY05uaFJLME53TE45UTB3V2R2KzVD?=
 =?utf-8?B?R0tTeVkrWkdQclVDU05CWk5MNi9pWlNQSDNvUmp4RE1kTDJ1Y04xWjd6TkN1?=
 =?utf-8?B?SXF3aVk2VFBvcmJVallZQytUeUFpYUFKeVZkYWl6TXkrU0tuamZ4Q0FUL25E?=
 =?utf-8?B?clpEL051YVpOeFlla2ZCQWdUV2F1Z1VUM3VKNkhWY25kbTBCaWUxSFltSDJu?=
 =?utf-8?B?bHRka09lUCs4RWMzTjI3dm1KMDk4ZkZUQjhnb3BRNWh4OXhHOU9IZEZ5Uk95?=
 =?utf-8?B?N2FOR2t5NjNjOXpReTFyVkkzZDB0cXR6UFBsL2tyTGFjcUhnVkpvam1TUGRi?=
 =?utf-8?B?Y09xL0lvdGs0bW94UnNKeXFTZkR2T2xHRExtMnFDc05PaG4vanVhS3JHZzZx?=
 =?utf-8?B?VVJKR3NwS1FKbDNRU1ZONUtUbDJzdFd2bDFlS1B3cC9ackZIVm40M08xRnBD?=
 =?utf-8?B?bWxJSmhuTDNyQXRVQ3BhUUlIcFZwTkU5NE5Hbmo1M2NDMU9hVXlHZjZoU2Fu?=
 =?utf-8?B?Yy9HVnA2ZG5nMStSOXdMQmY1aWZXZUM2M25YcmFzWlZubVJYZE1UOHRMTklq?=
 =?utf-8?B?V3ptcmg2R2hDSndxRC92TkdiSmJCS3FUOHJWdXpKRk5pdjZvbGtkek9PRmRH?=
 =?utf-8?B?cXVJVWlQVHREbXVWaHo5dlBLVkwwOXJGTmNiZXpsYlNRMlZzdHlwRXFYbjJ0?=
 =?utf-8?Q?u2p8oCyWIiT8pTwPzYFV/MfhL0dRlzQCpH440?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82870323-dc75-483b-d659-08dee26ccf36
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:30:09.6810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +xIv7PHNl0tecOhbd43/Z0VOoOK8Op3p6ht9GXQsD8FDbM8iibH9lNlbWTyQhBHwAHP2yLAltTcBqP1dbld0xSU/RoifgBmbfXUZ/7TKXidInXpdVGvQQibniS5fXddp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9684
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_053015_763803_36FF38F3 
X-CRM114-Status: GOOD (  12.27  )
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

From: Peng Fan <peng.fan@nxp.com>

The SSRAM P2 partition starts at 0x22010000 with a size of 64 KB.
The previous node only mapped the last 4 KB (0x2201f000, 0x1000) which
was used for the SCMI shared memory buffer. Update the base address and
size to cover the full P2 region so it can also serve as a general
purpose SRAM pool.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index c82c3388cbe79..173d11dea5d4f 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -154,9 +154,9 @@ sosc: clock-sosc {
 		#clock-cells = <0>;
 	};
 
-	sram@2201f000 {
+	sram@22010000 {
 		compatible = "mmio-sram";
-		reg = <0x0 0x2201f000 0x0 0x1000>;
+		reg = <0x0 0x22010000 0x0 0x10000>;
 
 		#address-cells = <1>;
 		#size-cells = <1>;

-- 
2.34.1


