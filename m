Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77409CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 09:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H5+ew8P70ZOQctvkpQm81ufemXvvaQMKwrO5OpqOFqE=; b=PFKRAf88XFnp71gmasr79zt0Gw
	HbgNTog/yD9GPFS6RR75RIatTH2fvSoLjqQpszmUv0Txi/yXwx7VoV2eVrdl9RokzXSQmnZDKG8Pj
	ZHLnfwT8OxCrg9VE6LVxn0wFnEd1Pb6c1KyK4zifNcXtjPqEhdnH6c23mjNHEknzBl1+EKRCNcFKd
	W3AqUL/vPnF5RsXfPt/TtUESkKBrewFlf1zoddLhR31jZiKR8QDg2R9MqHCGuykrOOOyRUKHK/Lqg
	cwQupfnikAAvpp52CXbyorao47zaGg1FFJ/3u58yFue/7jtU2rxMUKfpL43SmXG/RAL70++/wii7L
	GbiTlwQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waVIW-00000002D2w-1ZTx;
	Fri, 19 Jun 2026 09:14:00 +0000
Received: from mail-northeuropeazon11021101.outbound.protection.outlook.com ([52.101.65.101] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waVIU-00000002D0p-0ARl;
	Fri, 19 Jun 2026 09:13:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q3jtEguObXdtt15LVNbvX24KjFklFSexXVPJ8UQSe5lL8AExbwh2SYLMRCwfLyqi9PlK61EU4xLRLPvwaPYBvcUhjURNaxttuVLvoTnurrOb44IY0By0Mpv5SL/gDErQGBGiNPhjaT0i+ignKbgFlDgy1jwSqB5zJVQ7YErajbjfP0lqKqlfTVKZoPJ8IqPnOyOqcQj96l3EevKBsw5dMb+/I2mvb/6w2pHoiH8ubAwj6fj8u0qHfLW3bTXUAtP+FQlI0VF/Qkpax1BsqQeGqUkMAP6fd3JxZgyzMrQYxJcSw/xHCOGhMcu4NTiTc2YEFR/MMdk2a03/07xokZaRdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H5+ew8P70ZOQctvkpQm81ufemXvvaQMKwrO5OpqOFqE=;
 b=WsQ5DRyjs456j/buOOfzThk0hRL68gbOpl8jAVYbbhe1X7Str+qRD7kzE3KS9Iejecbtlx2VzwVtMB/qF+c1VZScMWCxGsckErsXBwErK9+3Xf6xK16VRdNxgxoSoL9FJIvojdDUPgQEWNAXqUhB7mlMl8Efjr1wtZ0RmBTndn/YNf63RZvIqp33AMtFEP/mCnA6786Xm/TEhGUMd3WcoS71dTDw5LQn1xZJmVTOK1t8oS95qJMRplh2p9fM+7xS+hQbZRPkAE3rL6ETW7kWY8rxsKjuEzlxYttaUPk7bVRi/mwAlKmYyJfcry2edczUxqy68Y+t/mvVtfyUmeA6sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H5+ew8P70ZOQctvkpQm81ufemXvvaQMKwrO5OpqOFqE=;
 b=w0oN7kUqlH7IFiVvCqk4vkKgK1EtlcPTY/xMYbEp4/Yi/vGEGuUUQZY1CnYlCEgWWqEfm1oblVYcMkFW1/UYdSRiEnTZEQMmkhbyVz0OL/8fKz5N9UAkQza/y3sffk9SP0Koz0vCSVKsS0xmd48yT9HkSZiRUGKBQ8KxcbW6PCU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from GVXPR08MB11763.eurprd08.prod.outlook.com
 (2603:10a6:150:313::16) by DB3PR08MB9010.eurprd08.prod.outlook.com
 (2603:10a6:10:42b::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Fri, 19 Jun
 2026 09:13:48 +0000
Received: from GVXPR08MB11763.eurprd08.prod.outlook.com
 ([fe80::8790:5e3:beb2:5bc6]) by GVXPR08MB11763.eurprd08.prod.outlook.com
 ([fe80::8790:5e3:beb2:5bc6%5]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 09:13:48 +0000
From: Gerald Loacker <gerald.loacker@wolfvision.net>
Subject: [PATCH v2 0/3] phy: rockchip: inno-csidphy: fix 2500 Mbps support
 and add clock lane phase tuning
Date: Fri, 19 Jun 2026 11:13:38 +0200
Message-Id: <20260619-feature-mipi-csi-dphy-4k60-v2-0-323356c2cc2e@wolfvision.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEIINWoC/42OSw6CQBAFr0JmbZseJIO48h6GBQzd0n6AzAwoI
 dxdPhdwWclL1ZuUJyfk1SWalKNBvLTNAvEhUrYumjuBVAurGGODRqfAVITeEbylE7BeoOrqEZK
 nQcjOaWZPlWZKWC2CzhHLd5Pf8p19Xz7IhtW4LmrxoXXjVh/0uvsrNGhASIzWzIglMl8/7Yv38
 8eGgsrnef4BVOLRqtsAAAA=
X-Change-ID: 20260617-feature-mipi-csi-dphy-4k60-9879c3d1fe4f
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Gerald Loacker <gerald.loacker@wolfvision.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781860427; l=1878;
 i=gerald.loacker@wolfvision.net; s=20230502; h=from:subject:message-id;
 bh=fop5w97sQrkS739pN6AKbJx8pN4LmDGaCghN1K+wifI=;
 b=k8VirRkeUSCUjpzOEx9UxsTo4dya5LdafnOodAAgiNfL9pudvZPcZRSauAtWpVe272+FdOyln
 0zGZiH3ZZBnC4sNsMC7wW5W7kPQz8ymfbqdnOiO+qqLEz+FRkMtk9d5
X-Developer-Key: i=gerald.loacker@wolfvision.net; a=ed25519;
 pk=UXhp+obGMUOjknszonesnb29P6a2Kk/K5eBuz62ggVE=
X-ClientProxiedBy: FR2P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::9) To GVXPR08MB11763.eurprd08.prod.outlook.com
 (2603:10a6:150:313::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR08MB11763:EE_|DB3PR08MB9010:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f073633-6580-4e94-4693-08decde31255
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|52116014|366016|1800799024|56012099006|11063799006|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: gsBi15Si6yWOQhe2CMBl+hjAa9qN/KaKdnwj57k/A0qRVaO9PR3+JE10mY/B93g6sXSNeUo3YXL7X3dmT8TKgcSHYe464hBEn9aR9aabttd6lKDFPvotu7eyLdEhObImN5iDBXiWNjXIOHtKWLOmygyBTfe4xFLBMrCG9CCLVo593vJMcqAVRjJbvHGltjGNYVds3Sqpj6O0IVYONQyiE1LHpmH+vcB5LnDAvN0PJeSuz0LegZiGTW3P5zYkJnco2h5WQkWvzLsf+HbMgeUg7UEXwksqGzjirxgHn8IxfiYrXJ73Gv4H68tMC7B5QDeUJUI2jgqLbsXu1UYUwiBxBT8tpaXMvgGu1o9l1xK5nvfsak/D0ULyOtdpz97D8bIyBOLNRJmAQ0HcC9KWrSvJi9gEToJsVtNZcgdYHiUJb3XoqK92dpY4aIKCSv4xHLBytp9VVv+xHgpk3bnFK6G93U5UVkExfEUHFoUnEOv3IPNojb1jocC5nKuOwHlZnak6R4NOZYI9qHDakF5VBaAlX5hlFALjBUYjmgFcP5/21x+MgSiAW2ROFC/hdwlXYsgzaRCButJ6PUvnNEUImsADGyN0GoZIOK9TG58K9lthTA9dx8awv/NxsXGA9RxA2wCKblB0NNADAS6Mb75RyO6H9hS5SzvsF7g5BpYjwi1CoVM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR08MB11763.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(52116014)(366016)(1800799024)(56012099006)(11063799006)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YitGeUJNT0JCR3U0bVRWb1p6N3pDWmtSZnFrMkx6NGFHUWlHMTdBSk50NFlj?=
 =?utf-8?B?OGNubUxFTU5nT2kxSC9uZXZTSFpCVE5yNFVROU9Sc3l0aUZXYU94cEJlRTQ2?=
 =?utf-8?B?RGpRSWtUajVOa1hlV1VCQll5b1I3WVZPUDd6U0YzRExZY3RNNFpaRjhWNmU3?=
 =?utf-8?B?WFlIcU5JUXYycWoyU0M1RnNYM2ZuYTk4T21pRE5BU3RLK2JmbGZJaWdrR0Jo?=
 =?utf-8?B?WkhUdVFSMWxMbHVjRHBpYkxLUlZReDg4NnRnMjV4eDRnU3BaOFZyc3pRNnFy?=
 =?utf-8?B?S01ZbXZ3SFJUZjNOMW5PK0pva3FpK1NYci9tWDZqQVNXdk1mSXZwbDl5MVZF?=
 =?utf-8?B?WkEzRXVQUGlnZ3FSRjdhbzZ1WllnbG8vQmI4dVVkVGVGc0ZyeGZ5dzBsalhy?=
 =?utf-8?B?dmdWUE05ZkNHZjBjSXBwdDZ5ZXhuV25uMFJNdHllRE9RUVA2eUYzQkxkTStt?=
 =?utf-8?B?TTd6M0N1RzJEN0pxcUVKNitZNXZzRjZqczk2ZXBTVVFzWnZLaHRzSXlDRldw?=
 =?utf-8?B?TmxhVnFpbmszQzVuNU5iZ01KaG9KV0JxSVhPRGtNdnBvbFJMaTZ1eU5RLzlV?=
 =?utf-8?B?akFtOFdVQ0lFRFVSalR5WHd4RG4rdnBuK1I3Y1VQYXhzVjZnZUpEZW4xbnhs?=
 =?utf-8?B?QTBrQUVrREZoSzYxcGNmVWdSZm10WTlNMEg1OTUvQ05hOTU1b0pKTENES0Vm?=
 =?utf-8?B?S0JlMGxWc0d2T0Qxd3huOGRzYVFOU01qU0tLWlhNWXRrcXZiVXRGZ256T3Ev?=
 =?utf-8?B?ZHZMNkVMY3JvYmxGUlpRV3ZNWjBMNGJHQWhLbnVaY091b1hJMFFjMEQwRGdp?=
 =?utf-8?B?b3RueVdoelgrWlRBV0dKMXdvbkVpS0hCUXFjaXM5VzdrU0xiT2tEcEZUS1Ir?=
 =?utf-8?B?aWdJL1lVemdmeGtIRS9MRjA3RG8xYUdFOUpnRzNBNDZEU2U4alVBZUhhd01j?=
 =?utf-8?B?Y1VpekJiZlNsczZseUdjYmVjeDJBeUtycjFCazZYU2JqSGZTTk01YWJWaGhW?=
 =?utf-8?B?ZERQRWJZME13Ymw3dFdDajhkeU9VRWNCdHkxNnBHSkg3Q1ZqbDEwd0lObXQ4?=
 =?utf-8?B?U08yaE5uTkxTS0E5RXhNN3dnL3JHaVN2bnFpTzVhbUhOaDlNcnZMaytMYkpB?=
 =?utf-8?B?V1RxY0tEdTlFb3VEVHVWWS9CYnBGQzdsRk83ZmxVd28rbGV5LzNodnRrWDRi?=
 =?utf-8?B?RXVVYzNXUmpZSTVQeEtwTVUwWXowWWFpbCtRUEp5VldMeGxsdWtjN3FYdUcv?=
 =?utf-8?B?eTRPbzBCL2krcjZCdWM0enoyZEZGVWkydXI5YWNHT0UyZlkxL0NXd3BvL0Zi?=
 =?utf-8?B?ZTRSY1lzN2tFYyt5cytTUnR2UXVhaU45K0I5VFFEMldFVGtWaVlLMUxOdXRW?=
 =?utf-8?B?WU5Rays0bkx6aTNscDJlZVJ3ZVVMU3hKZ2t2ZjNKZEJzS1k3Y0hGNTFTL29n?=
 =?utf-8?B?cHhLTndPWnNyUHZHaDBoMFZoVThQdnV6M0RvUFZBd05aZDJDcDZWNmttMlJO?=
 =?utf-8?B?ZXorNW9Oc1hGYVdESTZlV254b1ltbHRPeWlnWjZ0anZQZnhNNExHVmdvWXE5?=
 =?utf-8?B?K25qRW9HczVwMkVjdU5aTDNKbi90NWpYd2wyMjJZL3FHdTNhTWRiWExHSXZB?=
 =?utf-8?B?Nkh3U1U3SDJ4N1hjWGVSaXU0SkxzQXZMWElJU3ByNzVRazk1SGVKRnlxOUtL?=
 =?utf-8?B?dHZzNklWR3lZNG1yTFQvLzdtcW82Qks1ZjNRdnI3OUVLVFA5dXg5aytPeG1C?=
 =?utf-8?B?YjRvM0I1TDVhbGs5NEVWcExzdEI5bnAyRHljNkNEcUhOd3U3MVVmL1BNckpT?=
 =?utf-8?B?UlRWWlFWc3RDR1lMclIzTGxLKzVkZFJ2aXNTbUpFTTBKblVvRzlxbVFYWjNJ?=
 =?utf-8?B?U1UvMHFFZmI5RVFWcUUzdTM4OEN2RlVrN2pEQjB4K3oyN1U0UzRKNmFhVndr?=
 =?utf-8?B?L0tLYW5Ic1hCeEtEUUdDL2lsS2o0Mjl3WDJhaEJ6RG9wMWlCT0NJN25Sd3pn?=
 =?utf-8?B?eTdJWXBxdDE4VzVVRWxSVStOSDlhajZ6RUxMTmtnQ0p4eTY5ZGp4KzcwRXZF?=
 =?utf-8?B?dExKSmFUUERVNXlObWhka0tOdDc2MjRIUWg4T1RaaDMrcWZHMTBWc0tMS1ps?=
 =?utf-8?B?QWhVRTNDa3NYL2lVSjlLa3NxdjRwWks3QzZmQTRxOGVPM1cwSm9ZcUppVU9V?=
 =?utf-8?B?aWdKc2xkQ0lrOVVvdGZIbDI5UEtqbGFSQkFkTEpKVmVKN3pORU1jS0ZoZlRJ?=
 =?utf-8?B?OURxU01FYjFKVWlablZvSDJ0UmNPR2wyelNaanAxaDBpRDZxbUxSOUNkWUJF?=
 =?utf-8?B?VVFkbVJKQ1c3aDZqK3lCWkhRMlJMRmlTMG8zV0UxMVBPMEs5a2h2eXZTVlBm?=
 =?utf-8?Q?mVV2d4pBQE/wcw9g=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f073633-6580-4e94-4693-08decde31255
X-MS-Exchange-CrossTenant-AuthSource: GVXPR08MB11763.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 09:13:48.3102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vabe/VvOL1iwGAQTFYFidgjxiK7PHlznFfAzIYH4XZPT4gL4huRqGvNnzBN8hJCI0oPF0+JDm2E6XxSAzdortmBuBFRR3MwL7jh1z+fuhYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_021358_123496_F79A5BFB 
X-CRM114-Status: UNSURE (   7.60  )
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

This series fixes and extends the Rockchip Innosilicon CSI D-PHY driver
to support data rates up to 2500 Mbps and adds optional board-specific
clock lane phase tuning for signal integrity.

Patch 1 fixes an off-by-one error in the rk1808 hsfreq range table:
the final entry was capped at 2499 Mbps, causing a rejection of the
maximum supported rate of 2500 Mbps.

Patches 2 and 3 add an optional rockchip,clk-lane-phase device tree
property that allows tuning the clock lane sampling phase in ~40 ps
steps to compensate for board-level signal integrity variations.

---
Changes in v2:
- dt-bindings: improve rockchip,clk-lane-phase description wording
  (Conor Dooley)
- Link to v1: https://patch.msgid.link/20260617-feature-mipi-csi-dphy-4k60-v1-0-4611ff00b0ff@wolfvision.net

To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

---
Gerald Loacker (3):
      phy: rockchip: phy-rockchip-inno-csidphy: fix rk1808 hsfreq table
      dt-bindings: phy: rockchip-inno-csi-dphy: add rockchip,clk-lane-phase property
      phy: rockchip: phy-rockchip-inno-csidphy: add clock lane phase tuning

 .../bindings/phy/rockchip-inno-csi-dphy.yaml       |  9 ++++++++
 drivers/phy/rockchip/phy-rockchip-inno-csidphy.c   | 27 +++++++++++++++++++++-
 2 files changed, 35 insertions(+), 1 deletion(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260617-feature-mipi-csi-dphy-4k60-9879c3d1fe4f

Best regards,
--  
Gerald Loacker <gerald.loacker@wolfvision.net>


