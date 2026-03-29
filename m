Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DFAF3D604
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 12:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UT6JmkPlihwtcjJoVVze2D6EEFjoILQXXkmJVn5wnIM=; b=l49OOJZ29Y+rUgbS+c4WcdQH0n
	+bwDXLxIRHesIqOFewXXay/GmsADQOsNw3zaPHBQvItvQ9unXCLyAu7/tT9It4cVjs26XSgkd53po
	Se7QGXNxlwQiuKYfVOJn6ADoP0RVALpOo23MuwNCqJfLGiWRIrmTiLITDblbB7tLqwtI3Kq6N8nMK
	qMvfnMdSqB1wbPEsHajvqugja4mIHIQ9WiQdQznF4ViK29GjdUFVMcJRktqOlnJbjZ+r2VnPxW0H2
	ksU22TJPg3J8dOm5o+Ej4CEmFwowQ2QVX/STRM/adwCWyQmoRHMsr8W5hw6173TOUYt9VN9FdyqJQ
	E0w2NWRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6pj9-00000009w02-42yW;
	Sun, 29 Mar 2026 12:58:51 +0000
Received: from mail-northeuropeazon11011044.outbound.protection.outlook.com ([52.101.65.44] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6pj7-00000009vzR-0TEs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 12:58:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=giGSYpXUZDRUTi/XMro90j8E7F+eapaGVVwlLjHPa6+LPhceKyx95oI4h/iCgpUgqrIy3vZ1O1R0PRTAouhbLSiDdtcvEKDjP9XIXDSgf6kY22GmOycexyhZxKFZJ0ci6frJMz8vsNfugVRFwW5WqsKMYRu0dgl01/XW1EY5XPfiV3A4qSdli24szebm95gx2x67gfbJKLU4KaOMnQErrv7GnTIbmt5GBK3qyZKwf6IYSFABA8SWCWb5OkcyGPQqV5ipupk+bbOn05y4ZbFfl3753jAelFhC7M1br3tr0GxTEyqMVBBaJKOwjtt7XDYJXDDScFjmaYBmsmAP7BZpxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UT6JmkPlihwtcjJoVVze2D6EEFjoILQXXkmJVn5wnIM=;
 b=IvNw37O6u6AYgRNBW9CH5LKkSIEOnlFhmAwn6YY/c9X3jMFWZZ/qykuZz8CBrrN9aBTj8TuKlDGKHo6DYj5RpsDkzjKUNUj5L8OIEfugaksKYCVsFL0pXKDOD/4+rmfoPCPzjPKfDc5eRhDCGncGXDepXN55IaIUeVbyCtz3XmgXYMfY/fJnBWRw9Q7PBF4E2Sds2w8dV7W25MmAAhxuhZ0JrclnLLyEnaIIZJbwTYA/RlwP8qWovuWw430cv20yp1ZrAbBYHagX4T0PF/PTBLHjo5AiPFzjN35vAQp54AAu4yx7OQM/YFUXNdlT4YOoJANyity3Z1yTssUsH8uW8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UT6JmkPlihwtcjJoVVze2D6EEFjoILQXXkmJVn5wnIM=;
 b=lkvcPBZLdcHTEhBgvky8RQ0535MZMDPk9sHQvVuUg+OWS2fZmdg9DcrNS4z9WTkRlULjKHGsv12GHmcwpEa5xzDwuv7VfnlQhemXr054Y1QUn/X/GdbKegauY41gfZVjUstkdAEVdLZ2QNs50/uiniRDo5/yfm/ROzdyXN594vdQLKgHBRnHpleVBfBuUyLeE3SYVlgm+c9S+y9FxBWh9c9HokyZqNhvgSTXwcTR/TWRBB3Le3UGJRT7uOaHP/I9EmI4LGgrrpS7pgG3FVtgr6YlohVyFFy3EuQISdwnxhyn4eYV8ucEDbkBekXLc3CeZvrJqGalaV9UICVg4geE6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV2PR04MB11190.eurprd04.prod.outlook.com (2603:10a6:150:278::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Sun, 29 Mar
 2026 12:58:40 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Sun, 29 Mar 2026
 12:58:13 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/3] arm64: dts: imx8m: Correct PAD settings for PMIC_nINT
 (2nd part)
Date: Sun, 29 Mar 2026 21:00:10 +0800
Message-Id: <20260329-imx8m-regulator-v1-0-802c0ec507cc@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFoiyWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyNL3czcCotc3aLU9NKcxJL8Il2TVKNU4zTDJLPUFFMloK6CotS0zAq
 widGxtbUAp42aN2EAAAA=
X-Change-ID: 20260329-imx8m-regulator-4e2e3f1b6ed5
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:194::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV2PR04MB11190:EE_
X-MS-Office365-Filtering-Correlation-Id: b3c5528a-7a67-4463-918b-08de8d92d649
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|38350700014|921020|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: vr9bmoS9MWthCmqRQpz+hfd67vt+rijHD0NMi2pJxaOIRZgWJqeOg+Tyd2OJ+AlWL75pyGETjgTmbAQOp5iih6rOq0TAFeTa2ssydB/pFph3oQUq5LZJvSSrgyw7gcXceGWp8vxMj5J8RUpeAwjZJ2EQGQTh3fgkFab8jZgKtbyNsBMuQt6x8nL+0V/+KGW1TwrWJMyPGGB6PXoCYehFViUbQK6eyriOIOrsCR2fhImkRvwlHOJmIvYgRL2/501QY1I6d/zgLBpWUDlzIZdOQXbBrPMKtb9W69cxppw5lGIoPPLYNjVznZLVP21So+HiLybNIbBWSm60K1ZG+e7VF9nZMPUwvo4jSEAjZAaCveRPrdBgM7EbW6XLE+E72lx5N0q/3ATd1ur/+/k4nBq68yIbFcEE241HmeJJgUqVUVUL33WfQb5cFftMYM8k30CEH/RaDbzgz/UtcWz86j4cpDB3ruEpAA98G3hfmpZhzPlwy0d2eeBgrIyThjC9lN0Vj0j+A6HDJGAI7ZF5XUB1Qs/Twiqtl8xC+vOktiH1rnxrwIIULW8hdR6s6+yibIm1S4BQoiNdseKaX5u15ospguoYyDrZRkJnQpSlmgXyA40/VjRJgzpVOqMRS56KkfM2F5LZbYonch2wgjq4CvYhYZi8BAkjlBmG9PiFVX576/0fFhkiZC3698E377ZqgWBxEn74JV+KqeE2BfACEqG5tl1EFey2RYHXyUDsGYTdhrbFVjgerP2lkeR5thU/otT9aautNFvbVHEUbPw2XsHZyU+Dy7eneAC1es9slLTPwgIPdhiMX5UnpH0w8WFqm++W
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(38350700014)(921020)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cW11enlvaFVibFlUeHFFQWdxeEllKzEzUzhaRHhUZlp4SExMVkdxUnVveWhs?=
 =?utf-8?B?SXVybTNiYXhtUkg1VXhDcU5KMDBrVEQ1dGFaSHJ1eXd0Rmt6bjdveWl0aGRY?=
 =?utf-8?B?aTVrRms4bGtRM2tOdmFESkxXa1hMM3JMZ29Fc2puZzg5ZG5MK0M3ZGc4NWUr?=
 =?utf-8?B?dWptdXV3VXFXQkdtWEZveVBITy9aNmplcXUvZFVvOTlFQVE1c2o5cWJLNi9R?=
 =?utf-8?B?aVNNRzFWak5saE53YlVpNTV3MTFYaVRyL3pWSW9acGp3QkZ0RnF4V09KOHJ1?=
 =?utf-8?B?U2N0MEVEVWU5bjhsejBiYzNGR0FXZTRxU3BoTmJHU0tkTnUrZ0thMFF2ams4?=
 =?utf-8?B?Y2k3aFhtSHQvaTVLUmdrMklNbzZWRnhjMGxQL0JHK1lnREs0VWd1bk15endy?=
 =?utf-8?B?ZHZPeE1wbjVtK1Z4OE5iSjdVeDBkejdzRjVsb2EyTEx5ajJYZkIwb3M2Mmt0?=
 =?utf-8?B?a2tuMVFieFNCcnpSTlNCZ1Fzb3oyTUJhZmVnK09kTWtHTXhEMHpGbkRPWGpO?=
 =?utf-8?B?TXBueDk2b3ZneHAxaW9iTldvVVppYWFVVzlhbUY0Z2t4cUQvQ21vYzZQbHU1?=
 =?utf-8?B?U0dEQU9jaTZtQ3pUMHFFeWV0VSswV0hidTNWZE51WE9kREhWazU4QWVxTXp2?=
 =?utf-8?B?UytqN2hEV2M3M012U21oOFAwMmttYWJzWHJ5SEZvbUV0NzdadDFzZWtHWEti?=
 =?utf-8?B?djd0bjAyb1dsdWJUeTRCWFRiQ0lmemdLTkhXRjBIc29VVlVuOTBJOGFWMUZ3?=
 =?utf-8?B?WHNTK0tMMjVHdUovSzBCQkljOFlVMXJmV0ZTcno1Y0VHaHd3MXdpM0tZUThS?=
 =?utf-8?B?SzNwT2Y4bUt6SlU3aW8vc0ZacStYTmt6eFh4TGtpQ0MzZ1FROWo4SS83Nk5P?=
 =?utf-8?B?VVh2T0dkVHM3NVJiTkdvVGtHWVJ1S2tqdlZPRW40dGNYNEhzcHRjR2ZzYWY5?=
 =?utf-8?B?QXRrR2o3YVdlUU9uUkFKRzZxZEI0M0NqOHpvSFNqMmhqZHBHbEpqRUVXUXBs?=
 =?utf-8?B?NjU3TThndWx4UnB2WUNmQ2pKTFhObEdORnVFdDVsVUlsOWFSZ2NnRUljSHcy?=
 =?utf-8?B?NFplaFFQdkxka0N0ZkxnVU5ZMEFqbzluRXJodDI4RVpLRmgzRjR2eW42b0Jq?=
 =?utf-8?B?T0RMc3YyZWxja2tGbmcxTW81T3g0anRhVHFVcTlzbEtNZFQ5ZkdBaUU4bnZz?=
 =?utf-8?B?cjZ2cEFEM0duaGxNWlN5ZWVvL2lyZFVhZTJYOVBXdDhUbWE5dmZRdkl6VldK?=
 =?utf-8?B?d3NDYllYUlV3OG5SMUdEU3ZsbEFFaGE3b3dLZDdJd3NWWHQwVHhxUWNxL1hZ?=
 =?utf-8?B?M0lRZ0RpMXcvRkpURWNMTWhSVm5oaC83TjBDWTVCL21mdDJjZjhLQmwrWXVv?=
 =?utf-8?B?RHZvTzkzc2ZNL2VHbXRvWG1nRW8wWmVxejZmTmtkMmVRSEIzYlBUeERlRkRZ?=
 =?utf-8?B?NDJUSjVZc0NwNFdpdlB0anl5ODJ5VlREeU9rdnMzSXl6SUtxem9VYUlSOGlS?=
 =?utf-8?B?QW56ZExCM21INXRDcnRSN1ZJd0FZbzZnYVdyR3J3dy9UVmRGTnVna1JiVzRh?=
 =?utf-8?B?MkN2dHpaZjlrTjNUc3JBVnFUNi91OERaTTY2MzN4VXV5YVNmTWtBanlNclNZ?=
 =?utf-8?B?S0txYzhoZWFQampoTjVPczc3c3hzMGxxbFBReW5YWmRuSEhiVWJvT1VRdS9T?=
 =?utf-8?B?dUpwYXdRL2QwcmhyZjZsOVVYUDZHM2VGQ0RVMDhQS2FJUXBNYWdiSXErVDA0?=
 =?utf-8?B?MG1JUWFpSUhoOEkrYkIrYndzQ25pc1lqSXVtZjl6OVNsZUdOSjJnWExweWU1?=
 =?utf-8?B?NHZjblNQYkx1Wmh2ZHhtRXhsbmdWS2pGZU9aQ08zRFdTTGVZY3YzZWE1eFc3?=
 =?utf-8?B?TlF3bXo3cGREbEUxOTMwRE1EdnhFRVZyZCtYSFZHbm9DTy8vOXVBUTRhempj?=
 =?utf-8?B?V3dsZnk2MVlUQXUwMTk2K2dpRmExU1k2dUZLVlVxaENLZkdtZlZ6OHFwTGhv?=
 =?utf-8?B?RWFmWTBJRTRLdHBFTjhSbDQ2Y0lzVDVxRE4zd3ArMStjV0F6NmJBclZBaHB6?=
 =?utf-8?B?d3RwZ2ptbWF0YkhQd0pLTkNCeTRSN1ZvR0tUcDlRbHdsMUsvRGJIVjFxeDd4?=
 =?utf-8?B?cDg1MlpXZzVFNFpaQzVzakRIbnZEekZveGg0NzJOQlBYYzRYTDI3UXo0UWdQ?=
 =?utf-8?B?b3hTR3lZSDYvQWg3T1o0VmxiakV4bFRKaGRzUFBUajdwTHRVbi9FYnJBNEc2?=
 =?utf-8?B?M3hyTGhtK0pWcmZ2QzhpT2xYR0xWYmJ0U3FRRTFTaHZNYmxMN1hXMDZLMzh0?=
 =?utf-8?B?ZW83MzNiWStMT05OVDZiRnRpUmJXV3JZM3lZVElYQ1R3aGR4ei9uQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3c5528a-7a67-4463-918b-08de8d92d649
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2026 12:58:13.5360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FFb8AGNi+KKPd1ap4nFcvDZoZWsshWLGIvd2UqFLStLiZc5Rv9zJNRkybvtjCNK0i2Ilk2BdzPr0jnRY26YIUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11190
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_055849_167031_6F1458D4 
X-CRM114-Status: GOOD (  10.73  )
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

There was a patchset for i.MX8MP [1], but after further check,
i.MX8MM/N were missed, there are three boards that might also has
interrupt storm issue. I not have the boards, per NXP board design
, PMIC_nINT requires CPU internal pull up, I think most vendors will
follow NXP design. So updates the i.MX8MM/N boards, but I not have
the boards for testing. If board owners would give a test, that would
be great.

[1] https://lore.kernel.org/all/20260326-imx8mp-dts-fix-v2-v2-0-62c4ce727448@nxp.com/

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (3):
      arm64: dts: imx8mm-emtop-som: Correct PAD settings for PMIC_nINT
      arm64: dts: imx8mn-tqma8mqnl: Correct PAD settings for PMIC_nINT
      arm64: dts: imx8mm-tqma8mqml: Correct PAD settings for PMIC_nINT

 arch/arm64/boot/dts/freescale/imx8mm-emtop-som.dtsi | 4 ++--
 arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi | 2 +-
 arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260329-imx8m-regulator-4e2e3f1b6ed5

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


