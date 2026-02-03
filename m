Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4204E6E807
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 11:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vvOo6OJNMSDwl2QZm1rHNpTCVd+89xm5u8AwLe/59M8=; b=lhJlA+tc2sV3apJBpdpidRoSdl
	KUHv2rauVwWmEdDyTcPOvfvU2/A+fKF2QZ8K4Ke+wbNQNpjNp9UIVF23ajLnIqKVdomYKfMOg4o3U
	QTFwzyuzDXDP4h5/HZMBV3V0FaxSGdTODWyyZ4uBSPc/enQZCamJh4n1A3x3ND2qqgjq19yF6MtM4
	CGk60QdQm/hGV/SyCNOu5a6jaRMvadc8/hxF20JhJe4CcB0LYB7uesNchjotCqrvLWP4OucIqpAUi
	EFeyWAvB9wPmCUvJ5xsVFcN6HHk97Lt82UL6fvWxI5hl3ZfSZgtnGMgINe3gxE41CNiBVNhaRHu0Y
	SrNe0n4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnET2-00000006XHY-3JNz;
	Tue, 03 Feb 2026 11:21:12 +0000
Received: from mail-francecentralazon11013013.outbound.protection.outlook.com ([40.107.162.13] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnESz-00000006XGp-3E6Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 11:21:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ibq4bjNOGn/oqmuywlbA3D+ATAiURZD7mMV7ie6Hea5ghPNwiSj23DdrxgsOKe3mo4NKw/M2YHh7FQzCrNjYv2PMqhAJ3SQU2857UfTYcuQJbv6XtD/PJpiOcAll9Px9+oa7w8xtBlFMVaGWPMvQEPi61b2rU4rAlL5B+1IHD99ZotVOnU+/Xnpab151X6QHJxePmVzbWIGow/hqRfgX8doiowASJ+NSc/ivozg5tghzTkD2sIM+TfYbSkn32dEDCpGAmmjXaIIHC2i6LoLjDOBksC+hRazYANrmiyjAZ1UDBq5bH9PmRUIK07zx78X3xWxr1I7/f3u5rORIHBqgrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vvOo6OJNMSDwl2QZm1rHNpTCVd+89xm5u8AwLe/59M8=;
 b=rwRLoE28JvT0h75o4+cndmEhhACR6b9Zj5un3y6GZEh4xXg+BMfmF+EAhWBe6bXE14HLVjWYfKDk9FNtwOk42Qon1JNiDX652iJ404hl6+Ug61buV+xRV8yAHtTCfAETuPqdUFPuMPRT+R+1FCPUOaTJ1nHwaLkGjiY9mm6dybmnqLeU9IXYipLAA1vUQpCLjTNjZKrSWDHEy5ZZQ3z2DqsHkpDPueXJhoTj58TuWy0iZAS7HbQimgssM9BXACwj5EBNtv4Rxq4J6AjlhsYg6iBHfHiKTNJ9Zg7+dMSK1fZqjupKT3Ug+rf/tcNWWHr2kAGAcR9vdwG8Brzh9K5N6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vvOo6OJNMSDwl2QZm1rHNpTCVd+89xm5u8AwLe/59M8=;
 b=ZmI9WvRzMh8K0UccEqGU9TS8bUlOEMLe6DReOKkQNg8H9gazQIi1d3R16RKY+VzFUzHEiP4CzFqQTBSLvsjEVgs4zbwhNEK+I5a9nOv5tkdnIk+CW7zFmQkCGdasNY0Y8KWwNBTtimaEgub+WW+DEHjs+npRW7N/5ZvCkHob20SjitKVSOboM2zyStAxaiYFebYbyYB7Ao3yCku8kPm7cIIvAvEKHusQ6QglMXJA90E9A8k35/j6ttDyMzeVC95eZV9MN4XLgx8QytaadNJiyWjL9LyDHrQWoTsP/hUuBkU0ze838wyq5U3/Fcm+WbOJ6fb9vbiwFA1jop5pWRr+Rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8567.eurprd04.prod.outlook.com (2603:10a6:10:2d6::21)
 by VI1PR04MB10025.eurprd04.prod.outlook.com (2603:10a6:800:1e0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 11:21:03 +0000
Received: from DU2PR04MB8567.eurprd04.prod.outlook.com
 ([fe80::32c4:a8a7:1724:b754]) by DU2PR04MB8567.eurprd04.prod.outlook.com
 ([fe80::32c4:a8a7:1724:b754%2]) with mapi id 15.20.9542.008; Tue, 3 Feb 2026
 11:21:03 +0000
From: ziniu.wang_1@nxp.com
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	frank.li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] arm64: dts: imx93-9x9-qsb: change usdhc tuning step for  eMMC and SD
Date: Tue,  3 Feb 2026 19:23:08 +0800
Message-Id: <20260203112310.2956389-1-ziniu.wang_1@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0046.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:656::29) To DU2PR04MB8567.eurprd04.prod.outlook.com
 (2603:10a6:10:2d6::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8567:EE_|VI1PR04MB10025:EE_
X-MS-Office365-Filtering-Correlation-Id: 92ba1cdb-1daa-40a2-b88e-08de631650c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XNQ7LU2eeI+z3aR3GR//BtMN75KmEqOyx0UTNEHSiWFTVmfUH5z1hFRbPsw9?=
 =?us-ascii?Q?UpzgPr13OTGKz14tn6BLLt6CqXxcjnBWL9xrQtKNe0tWn48RbCyFvJTYngI8?=
 =?us-ascii?Q?ZbQNkBTpQ2x7g4g1W/DpbWtylr3D2GcD0xuKr9g0MkJ7R5qrJ6NUxrUMci84?=
 =?us-ascii?Q?uQp1lYHk2ql5qGqATTRqwn84bVkjzh3OYxnhOJ4WHLjm2Kf9zrsQkfRV96xO?=
 =?us-ascii?Q?U1I54xxbMRDG6zoubreg/dqzPX8Sopnt2qSLnMSsqJ9xlZ/KoqE1uAEhU60m?=
 =?us-ascii?Q?VOitxaaV8OiNtJZYX7v1MwSSE4puyXP2j+/kSl0dev3o+YUwAIS+AF+0cmbf?=
 =?us-ascii?Q?464x7fnfE0horDMqSGVmvQwR2wkv7jWxYYIpASCnYe/mNHvf1uSGnsIvYsu1?=
 =?us-ascii?Q?FFzGQGVl05VzL0wK+6fKYmpZE0TV/bQlZVhE6nisZq6kz8Nj0iDcZas4K11y?=
 =?us-ascii?Q?CftvT6nuMYMTw3DTt6Yl/PaJ9GHrrgK979Mk3a9C3atyxpjpQrhmz/7xdpII?=
 =?us-ascii?Q?AdjxOktz2GTV5keY8+5+U3DJuOVbFrwlt9viZbaLkXar549X9mrIif53chf9?=
 =?us-ascii?Q?VW0P3GcsCNmAwIY8qnn3CtIR2ictzG2fGYEMUBqzVXbRpxG8rT6n0QCeptZK?=
 =?us-ascii?Q?MaERVcpIk1oxE8KzT6aspyLauEucSuZny4eukxsuvplYTQ7WBMh6BePIpHw0?=
 =?us-ascii?Q?GzMCxuBKFjnkzqChOp5+8VsM05yNFZf4ZrlJzeQlPu2kbsKi/4vL93/JNFrd?=
 =?us-ascii?Q?AJ5Wt7NDn1EvG0DxfXAvCkh0SSL5hdybs5lscUVKZy3btJCgUZJ6hkfeYnil?=
 =?us-ascii?Q?jGh6PKiAQmZjmz8esQAvvbJd1UDIhuA2qfpm513w+6AsH20MFiahk5iuI8OL?=
 =?us-ascii?Q?A7vvXAyAdKdpmSCfYfL1OAxdUdVGR4mA6QpvM0QhamYfTGQSv/CN9oLCskvV?=
 =?us-ascii?Q?VM7T0LpGJGkRxGWOFxbG8eSOYYbZm6qyT2umjv3aQ+aOoPui/HkBsvu9L37u?=
 =?us-ascii?Q?rV3yFtQXAMNw3JHt/imC7Sh6sFctxZiXEnmpB0Lj1UmSNJ16091ij0ZJ9lTZ?=
 =?us-ascii?Q?hRNh36NCLZBLJad1F2z6PPfzAf5lYCcWQLULYj6rkP/wBTx8gb6K6OH4ZPK8?=
 =?us-ascii?Q?tu83gi+gmLnUcJqbiUO7aQ9jj/ihVQJDyGGN4VNbaJipFxWgKANnc7M1KYfR?=
 =?us-ascii?Q?wRNeVOB8HmOHiRY4eg0avwOmLfWpBvx4EUL1OAYIrd9u8LntnY+V1LpjRFS9?=
 =?us-ascii?Q?RlXn1SYIrFSUwauhG1Em65ycvigBVSKprZSVYlOJGiY/FbQaB8Ae8c2n85Eo?=
 =?us-ascii?Q?q/21Bmt/PFzB0r5YEKPduxUiRKdaI/8h0WzPD37e3L3MoTpYGB7VSM59uZVG?=
 =?us-ascii?Q?SwskZpu+q0UdZi5hNBd6gXqGhduUMjkidCOIMc8IQpC0HVEfoWttLMg66c7j?=
 =?us-ascii?Q?Fc4ClVtoaoQWWg9DIjpDTqxWUtiIYe6OOIG76eby7OYctPwehnlAi4Ij2iBd?=
 =?us-ascii?Q?JRqQwO8o1m2HfL3ddFjmQboZwy91TGRSzKDUMGJz5WV0LuywOZCeq6hPMFJ3?=
 =?us-ascii?Q?2D7bX7veEw9gJsA8laUXr3jwKtJV73qOtc+SaZUVocWxqxT3U9+mgil10jgp?=
 =?us-ascii?Q?vWRDMf5Ybr95nLP7TUqowp8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8567.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lzeJnXkcRWAq3n/Mf9gl/FTnCzyboyvWMGyB/xi/nwhcgyUzX3SLZQ5sxoB8?=
 =?us-ascii?Q?nVICJO8PznGZtiF9I5i2GZMfgzWYv8qX4KROqek4zey3kwgVr/Pm+iNH/tTo?=
 =?us-ascii?Q?w+hdH9AJY0QHZwOqQMyp2Yd+HaBH2hWPHM1nhiyJrfiyiB+c5haWVYB0fey0?=
 =?us-ascii?Q?a/M4lUg0xfEGMji+I4JBu2lOp8MKXHyFmbhYlFdOqBmcyjud5hSr0jdgYL2Q?=
 =?us-ascii?Q?C62pzigzTxr9YKw6dCU9yCbV+7fbt4EsBfTEpbU3AeWJazAlpXtfGOAVtnzW?=
 =?us-ascii?Q?bPk+uEGXY8wtMQRDfJE++PoAJqPc6ZHQaX1cKxtTW0ublOqjoHeg5p0Vj5U4?=
 =?us-ascii?Q?2A4wwMd6Itii5EBpBkXb85J1U0/57MklV32hdx4j9Rj/8Ekh6HDH44LO7Wey?=
 =?us-ascii?Q?CSFT9j4RwZ2hjXag6NaBPtewJzXEG8IvOwt4SiPTH4QEZMZb2yx+tkC+mqI5?=
 =?us-ascii?Q?baVQuO/Of3X8zymFt3BJptd53OSGjmsqvDcrgfyZuzJP5dU2KP7Wvi1iYgJQ?=
 =?us-ascii?Q?eMBsb2JydSx0awHsqXqDV64Mi/ZSq2wUZ4jBDUhVHLSpoMvs5BoWHVD/ittC?=
 =?us-ascii?Q?CXD+QsWZfGoAaqIhXLW4AP1KJ6mjAU+TtTmgKBd8ax8VcgZL5tue7Pq9NQWU?=
 =?us-ascii?Q?J8al44i8u3D5C4RjezP/WqDJ5vbW/Jn6QMg1+Y1v/Io0QTqwVA3WqaG1LlMR?=
 =?us-ascii?Q?q2hhfhCVHSh2kgD39Ekzm3kAX6VGHIpi5Dfck7uJ99FedL6t2D+ZXAQIIv+h?=
 =?us-ascii?Q?fNgN0rxvDZMTrY8s/QI7rTt64Uv+oxdEoLF5RLzoCq2ggHStch2oiZByQ7hz?=
 =?us-ascii?Q?zlxLS5lATqIejtEd9wVuhuc+O1veANos+IpP681mD215WZgddyUaHqTzwUbC?=
 =?us-ascii?Q?VIsGwrmCvNcNvn2tmc+G6/+9zg6sHJHccyWcQBp8iD2p3UhRHPN0jm+Ge41X?=
 =?us-ascii?Q?BQZTqaBCCPF5B7mw44ZLioG6VE0q0z5zPFCr+hQgiv6R7Ua7fWLBxUU4NOL7?=
 =?us-ascii?Q?VSxn35a5b5nUOIuTqvVHdGbALfZjjNtTMgxKncKkZL3WPAOuj3yRu3EGNl4R?=
 =?us-ascii?Q?01BFhTvZENcRF1q3766Kdmdz3MNoA/0d5o7p0/5FO0VguRfCCRzP9Fc151O1?=
 =?us-ascii?Q?ehb2FRzMJ6fvgoq2uhO8UUNVjkx3I83CyDE2w5ADqtgkXKiaaQzDoPeeSG8A?=
 =?us-ascii?Q?QgDyL87ZZwyWG9Lz2c/bb9dz/3FiSRR+p/6JzECsWqz79ePOwG+b1Z0jbtFw?=
 =?us-ascii?Q?MEWYwkQ1wxTVcmuh2Qb65tSWqI975Q/CO9f2/Yr+eGNlAOeiCf97vYJvhwu7?=
 =?us-ascii?Q?2H7OyKNFblLBvvSohAPQhrJjj6AfxB/MBUPaOKGoQOlSHXEXxqZAz5MtW4bd?=
 =?us-ascii?Q?EYnX4BttZ74iIntuUmNuJ//7ELzq4qLLG4MHId6qZDC0x6mg8/NF7gDjVy79?=
 =?us-ascii?Q?/G7PNIQ7zjgPm+rgrDrwV3HIwDnT+MMRbx9eZZQfYQsfr6bpFfxGDxJMOFRF?=
 =?us-ascii?Q?UeRo6WzVQN0MTuGz5kxrTjsoHtkjJUgJPxTLRZisKdeLrFH0++nRf0RXasNs?=
 =?us-ascii?Q?AxiRu83B6GQWypVjjRvVtcPNbl1cL68vtgVLnLieCmVZcr6BM/n4mkoLPuAE?=
 =?us-ascii?Q?ToHzBsu4vK0Jy2JC2hXV/06/BWuubkZ4tEfu+1IA7+FqlasCjSSC5hj0OvG6?=
 =?us-ascii?Q?zJGrBIiSx/5cvba8nU+oUdxWSdKAQSq8Ax2cNIQN0I2l1JS7aofuVU6S/ce/?=
 =?us-ascii?Q?g3bltxq6iQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ba1cdb-1daa-40a2-b88e-08de631650c0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8567.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 11:21:03.2290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lzBwagO5+BncZb8rhEdj+LNMK2J5bTI/b9PcFc01EVBobYKCqYpv+wNwayKwu5O1TpKI1MSyEAYdoH4VgEMPMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_032109_833117_8615E123 
X-CRM114-Status: GOOD (  12.83  )
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

From: Luke Wang <ziniu.wang_1@nxp.com>

During system resume, the following errors occurred:

  [  430.638625] mmc1: error -84 writing Cache Enable bit
  [  430.643618] mmc1: error -84 doing runtime resume

For eMMC and SD, there are two tuning pass windows and the gap between
those two windows may only have one cell. If tuning step > 1, the gap may
just be skipped and host assumes those two windows as a continuous
windows. This will cause a wrong delay cell near the gap to be selected.

Set the tuning step to 1 to avoid selecting the wrong delay cell.

For SDIO, the gap is sufficiently large, so the default tuning step does
not cause this issue.

Fixes: 0565d20cd8c2 ("arm64: dts: freescale: Support i.MX93 9x9 Quick Start Board")
Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
index 0852067eab2c..197c8f8b7f66 100644
--- a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
@@ -507,6 +507,7 @@ &usdhc1 {
 	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
 	bus-width = <8>;
 	non-removable;
+	fsl,tuning-step = <1>;
 	status = "okay";
 };
 
@@ -519,6 +520,7 @@ &usdhc2 {
 	vmmc-supply = <&reg_usdhc2_vmmc>;
 	bus-width = <4>;
 	no-mmc;
+	fsl,tuning-step = <1>;
 	status = "okay";
 };
 
-- 
2.34.1


