Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C403108B912
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 12:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Jx3egF2wXE5FD4lzKKCUslBoWESwNMfGSqFY/2wI+YA=; b=KjUcNWodkJlmR1V8T/tgBsRVq8
	Pdp4Jvi/LnfMrmXRoMHm45CTORZ3MFT2KMVjSnHFs1eKWhO0dzA33U0fv5qPXm0Hq75xq0CSpvtxf
	ZqChWXtV6HXIhz3rUymime3nLpJEa7GwdXk2/BRsXgj4gIgomvmeOoYzTcgIQkP7JckOoo2Uxrk0M
	XUwkjKXqZCWLK688gw9jNZCn2ymqQ2pxv/UnFOT5S++2yT+7Q+IyPuc/99NiEsAwGythZgN2WpE1c
	VfSjT3HVXVHSzmsOoSiVBPTNoH/uyJq19zfPvaUGOS1GFMzhvhsf166FKw0oQWzFdJJS1VeZ4wC9p
	dx0L6J/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Yvw-0000000Cm1Z-0Idp;
	Fri, 20 Mar 2026 12:26:32 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Yvs-0000000Cm0w-4Av8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 12:26:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yag9HB/69iVRE+szca/BHpaYGDZz973i8jOtAUxaJfCLz2M7tgG6BjBkHcP2J6u4bw8jwR++BchMOBbH0+2c336oLUH9s6ar1Ab4lGYDlLHB26/cXimbZBEDzpkYiuzbNRhnPmc3lKKv5AdH9ItyOColqtlDBL6wXn2ac09Ul5/tb0EQbk+GuJZtcpY4hwq1dEuafV2GBxo7ZxMVQsaTSR2uQQ19FJj9JnZ7AJUxM34r1GnzVEGcDqxkVy6byyhnOwVTUPGlrRMkPRm3I7xG++vrpMwkpxyuU77+Q1lmMhJRlQoGgqjIAs+BIqf/gm3ep3aVxNQF7ah0oVE4tNsS8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jx3egF2wXE5FD4lzKKCUslBoWESwNMfGSqFY/2wI+YA=;
 b=rChjp1Mb216UamPOlNEJrnFmDG4hItFr2GKMWWy1tXbwUhzGFlrYA0PagSXZzHXwEXWw/4IMNyfivT/PL8exV5sPPjsZOtcO+/QSvvGH0lgeRAe8mIJuPtZMcfRpPua/4gjO4Lvf8GWT3984+AaQ0HCg4+jKxH1SYhnY67ANFnXWRepUc7SE2zPp1j/VL+HBf3mgJz3XKhuZS8PVnq7uoHNhwfqHNCMzQvO/wwwaHxqn7XVy4efzoCJjKoh+/pthwDt44v+YoqWnZA0IkxaVQBml46oY28DKoGmR+09oNKjnU8bpOUeX+ip7SIgVB7/L36Ag7wujahDJ/bCEzGEuOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jx3egF2wXE5FD4lzKKCUslBoWESwNMfGSqFY/2wI+YA=;
 b=j0Eax9rarnkG4ILt7S5MdYy5GkzQgJdx75VGhCZ+sy7O1WAVw4qA+aA2XIa5Puvr9I98OafJV2qLgVs3mJ4xLRKN7VwEB1bjl5TDp9qh5cGVwLUUdUiTSIhR2d4PwKjSdvIUzz5g+luSm4CKQGc1ccfP4X3tjKdG0rt1BfKDpD8sf3WVD+GVCSJfPODbou4PzdUA7BAZtInb/Sya7A1/ri7JJvcRgQci8Evitk1DcSU9Im2adq7FP0zFCtM2uPJCLOrkc/F+gvM9TsXwIGAwo8W6h1vtiS9we8r3r7e28AUuf3/5gpCXZq5zYoqPNjeMh5X4UWbPgx6cFcnzpBoqZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA6PR04MB11869.eurprd04.prod.outlook.com (2603:10a6:102:518::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.27; Fri, 20 Mar
 2026 12:26:22 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.018; Fri, 20 Mar 2026
 12:26:19 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v2 0/7] arm64: dts: imx943: various update
Date: Fri, 20 Mar 2026 20:27:48 +0800
Message-Id: <20260320-imx943-dts-v1-v2-0-e6eba6b3a837@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEQ9vWkC/13MTQrCMBCG4auUWTuSP2PryntIF00a7SyalqSES
 MndjQU3wmzege/ZIbpALsKt2SG4RJEWX0OcGrDT4F8OaawNggnNJJdIc+6UxHGLmDhe3cXoVin
 BrYG6WYN7Uj68R197orgt4X3wiX+/P0n9SfUYSjN0RgndamnuPq9nu8zQl1I+K1mqEagAAAA=
X-Change-ID: 20260313-imx943-dts-v1-7e5b684421cb
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, 
 Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>, 
 Joy Zou <joy.zou@nxp.com>, Florin Leotescu <florin.leotescu@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:4:197::6) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA6PR04MB11869:EE_
X-MS-Office365-Filtering-Correlation-Id: c9a3a8ad-15fc-4e5f-ad40-08de867be370
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|376014|52116014|1800799024|7416014|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: /YbgNnlRB6Kb5MxlzttQ71KpxjImfjmPtPgjyh3uqrgoO3WQ2/sDRyn+Fjvui31jHJWaCgYBKd50P3ZJyxDd4JCN1xcYwAVinZ6k6IbgVS1Mm2I53CpXQHjFP+GX2n8SUkTAJpZiVhVXU252BkPbL5sNyKemONHfnG2yFfa0dlXQcQHZnKIvC/twCEtkAixnzYJhSX10P4mZ/Q6ndeUkdtE8FLuf5wF4XIYChO8X6PsA0nkG9kefS8J4aWOXzrmcC4e5kdE87Tr8NE4WAVnj3JNiDbQMW0s7+l1pUfeTbEkPOKJSgMy/v2/cVHnLDWydU4/LZMpS/jWJKf4Rdi1zAD1g4QzJjQca3mAEyIH16UWodAX2MiehegoE6xMQg40CSeoxeKO18E1PlpKuWOoq4af2uowq7xUIL1KjyPV6Wy/iGy8NH/noPl8Fx4NcFcNhqFnlNKLn2vaXwMvvf/r8A99gaoszgjte2o3+ib8MM2D+tgJXODUTLpQxZkMxJcPHMqHYagybmCcb/CfvC74epNNsPEjv9A2uEYSgn6WQphfYP21GARCjZl+RcHKNL0yw4lJJ6BFEB48mZgGW6f1T+7dk48x0g2PJaXqAVGaNd+Ee4pNI1J6ZTeFUnUylLy/xCPjdTyvh7gSsrxDioiZLigogcjVxXu7oQoS99awYMiiiZmMNhNQbRelC7Z/ZkJzjhXm+8igD+dj1EXB7Sb/3CJ3XSaeXQeE+d9En+NNcjHCRnbBUUr0vBYyiyuw9rwbjGbDIi4rIedY9/LbfyjYr2J2mxiQ1oPNkPhuvWSnbeXc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(52116014)(1800799024)(7416014)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVFSZUd0eGFtd3pvcUtBdXNsQXplQnlqcHZNYWxUWXFBT08wZEk3cVlZaURu?=
 =?utf-8?B?L3I1dmZrZ0w3SHRjTGlYR2tvRFJ6dVlKUmxiV3J4VkpLMG56M2N4K3c3eGpI?=
 =?utf-8?B?UWlIenVTUjhiSlRDQy8wblFsU29TcndoN0xzRXpyeVQ4N1dvYTYyRy9lQy96?=
 =?utf-8?B?Rk1tNjcvcDJRclVMelhKWm5TOGdIL0tYQW9Dc3VmdVZ2cUdvRlhrUlZOTXhk?=
 =?utf-8?B?WElSR1BBdTN0Mm9wZGgzK3B5Y2NTaG1YUGtwMzB2SCsrckthTXQrNHptQ1Vt?=
 =?utf-8?B?N0VSOXN3d3NlbEFPMnpRbUZtOUYvSWpCK2pobWFjMEk4d3d3bEtwakVjMnUr?=
 =?utf-8?B?ci81NlcrbWxiS1prZTVoUkJzdTdhT1RtRmd6QnNHV2FmQjZUbHF0NmU5b2RF?=
 =?utf-8?B?L0daQTBlcGlsNVdSeExrcHNVdFpQQ0xrbk5BT1VIQThDMHRDU2lwUjZjanZt?=
 =?utf-8?B?YVNrcXdnUkRiQmY4dUp4SnRtcE1KN2l1dEJFSWMvMW9haVh3Vi9jSGlXQ0t3?=
 =?utf-8?B?UEpCVUFoWHY0L2pFQ0NDdE1GVXBSRjdqMGFmQ2h2aGRQRXlMbWZ6Z0VsdEFq?=
 =?utf-8?B?dzA5WlBObk5TTTNmTjl1Tk5XOXRubERzaVhwZ0pOOUx6SGNSRnRxb2JTNm9G?=
 =?utf-8?B?aE5MRkRGUDk0UHJTeW1DLzAxekVEU3VuODBNVzVxbUZWQ0lBZkhSb0VDTzU0?=
 =?utf-8?B?S0l4MDBJcFM5c0xKZk9XMEZUZ3pFclRwdkJ3MzdsYUh5NVoyMG1QT3FxREJI?=
 =?utf-8?B?cHhpZWg0K3pOVDhXYVdzOU5iMDJDZ1VPVkcrcGVYYkg1WHI1TEtnYTJZR1E2?=
 =?utf-8?B?YS9RVWUycTNQRFNrNHM1VjhieldhMEtkQi82ZGZ5aG4xK0IzZUs4L3JYRkk4?=
 =?utf-8?B?a1k5ZExlZkRNNXkxeVR1VzN6VDFtTEhlRHBsNHZNQnlzZzZrOTlPTGFLWCtv?=
 =?utf-8?B?c0plTE9uYmY5UnQrdzNIbXBQeUJJSDVTRHJWMFdnN1VqaXJDdzdaV2dVcSt5?=
 =?utf-8?B?bzBUbyt5eUV1eWc4OU96a1lKeXI5MFRZK0IyeDlEWTNVeXptazR4enc3bUJ1?=
 =?utf-8?B?c0ZuWjJyOFpFSUFGZDY4OXlpLzJtb3dXdDlYRi9vaUxERW1IU2hlQVlWTlg2?=
 =?utf-8?B?NGE0R3Bid01uTGVNZUdjeENhQXFxV2ZFV05FNmp6YWlPQ09XSEdxWStMUFZ2?=
 =?utf-8?B?SnhuTENIR21mUjQ0TDVoZ25obGpMRnlIbEpBV3FvVmgvWExBcStpRUpBbkZZ?=
 =?utf-8?B?NHpKSkpuZlk3bFlrNHdSRFRrNC9PbjJkRU1oZkF3QjRobHQ4dmVrdEE1WHIv?=
 =?utf-8?B?eUlrYlY2bUlJYno4VG5GWG9pb1ZtK3dEeEFtOHJORUZOcXRzcmxsT0ZtWCtC?=
 =?utf-8?B?WWFPTGxMaXZWNEZjVytQRXZLZUJlYWllQjByV0prWDdUMGNGeXlEVlhOV2Fi?=
 =?utf-8?B?VS90NTZLRnF1MTRreStCNFFHWEhZU1hFMnpPbHV5akVlTTBSUW16ZldaeTVZ?=
 =?utf-8?B?NDNibTFTZTZVNjUzWUZnTGxEZVdpSmo1aHhYTzZkUVhWTCt6Uy9EaTZkajJU?=
 =?utf-8?B?YkpOSUFibkhVemdwcDhHcHFQSzlCcmYwVjJ2MlJGNEEvcWg2QXllbUI5QnJQ?=
 =?utf-8?B?S3pCWTZtMmJiUHFZMG43QXA3QndocWRzbitaZFRCS0QwUGpicHJURnBCdDlU?=
 =?utf-8?B?R3A1K1ovVXVZaU9PVEkrMDIvcjlGamlrbDJMa3pqMThzN3l2VDRXeG1sRmEx?=
 =?utf-8?B?NFRoU2RqbnZnRTdtRUtJTlFRVFhPK2ZsNGZtTTBHNnhkUGJ6MlFPMXR5ci83?=
 =?utf-8?B?ZERtVjZzaEg4L01VV0J1NzEzeldTOXl2VVBNWDZmMDZ5dHc3bWlXMzBMUzFz?=
 =?utf-8?B?YXZlL21KQVI2Qi80MmY0bGFMNXRSbGJBMC9qSjJ3UXBoTWhCUUN0U1ZjdlRr?=
 =?utf-8?B?TFIxUDU2WWRmTzBQRkVkamFIbzdKTXFWMVlLZnNEN2pCSStGekx3TGU3ZUVx?=
 =?utf-8?B?UjI3WWNqSGhnNHkyT2N2WUxMT051OXczdG1zNkNyclB3Uk1wTFZjYm5HdGFP?=
 =?utf-8?B?L3pxUmFxM2g5Z1dZbitZdWNmMVhZRGtWSkM3SkU0WUREZ1Y0bGJEeG1PbDVr?=
 =?utf-8?B?aFMwanRNajczTUtnOVdDM2IwQU1KWjdiMkFrRVhJSGlMYzN6UXNHWUttYkF6?=
 =?utf-8?B?d3Q2L29WQTFsSWFGMnJoRm5HUlZ4K2xoUzlOYVV0eVFRcUZ6aDZaakxoS0Ja?=
 =?utf-8?B?VktIVUZON0F2MWdDVVEzZ1VKSXRURU1sV0w3UGwvVVl5Y0dzRlVDSmRkVXBE?=
 =?utf-8?B?Ujc4RWhJNG9YdHJqcmlQSjJFNXFNLzVHNC81YWJBSmNtUmJYL0t6QT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9a3a8ad-15fc-4e5f-ad40-08de867be370
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 12:26:19.0339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q+oJhIV6PWQKcqbzRLxQ4vVoj98q0FVGeLJm3VUiXboDquhiZeK2RInkL/1zEG87TGIg8Emsoz9LvSB3sf4QVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11869
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_052629_041680_EB8DC312 
X-CRM114-Status: UNSURE (   6.24  )
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

Update pin header
Add V2X/ELE mailbox nodes, more SCMI nodes, thermal nodes, fan node
Add nxp,ctrl-ids.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v2:
- Rename ana to ana-thermal
- Rebased to next-20260319 to resolve conflicts
- Link to v1: https://lore.kernel.org/r/20260314-imx943-dts-v1-v1-0-3ba9b426863b@nxp.com

---
Florin Leotescu (1):
      arm64: dts: imx943-evk: Add fan node and enable active cooling on A55

Joy Zou (1):
      arm64: dts: imx943: Add thermal support

Peng Fan (4):
      arm64: dts: imx94: Add V2X/ELE mailbox nodes
      arm64: dts: imx94: Add SCMI sensor/lmm/cpu nodes
      arm64: dts: imx943-evk: Add nxp,ctrl-ids for scmi_misc
      arm64: dts: imx943-evk: Add pf09/53 thermal zone

Ranjani Vaidyanathan (1):
      arm64: dts: imx94: Update pin headers

 arch/arm64/boot/dts/freescale/imx94-pinfunc.h |  12 +++
 arch/arm64/boot/dts/freescale/imx94.dtsi      |  56 +++++++++++++
 arch/arm64/boot/dts/freescale/imx943-evk.dts  | 108 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx943.dtsi     |  62 +++++++++++++++
 4 files changed, 238 insertions(+)
---
base-commit: a0aede0ee103240ac725fd0c3ad3d729fea08b7e
change-id: 20260313-imx943-dts-v1-7e5b684421cb

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


