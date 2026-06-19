Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D88CDB466
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 09:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a/4r70jIYKEfklbvmlRzzK+2YQZ4WCvj6gCAe2mrN1c=; b=bjsRLVTUIpfzp8WrVxJlLTqkg1
	brMqY7Ahmie1IbGYnMmDJMnTegb0+LzQpuowY0O6ygirVjenaWVGaxMs4LJbVRtlO3qkWDBBQzi8J
	hhadCWyb4/y1EqPxDWtYbATy8UodofHUbjFWg7y6j5zj2lYrCWuboelGDBPtNlEfUe1o5mmBz5QcT
	xhUr9ecpc9hWC2rVGA3Cdafo1l1+elOV08AE0Gu1np9su1FCUgEmQvdDkaVJnj8Fdm+4IpOB63G6R
	BBQPIZKvJv50RPTgWfTUcAWjYSohHmzYTKO4r3OIAT8vmla203cZjbwDLL84W0FMhFNwMJp3VfnC9
	S9jUAT3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waVIl-00000002DFI-0aWE;
	Fri, 19 Jun 2026 09:14:15 +0000
Received: from mail-northeuropeazon11021101.outbound.protection.outlook.com ([52.101.65.101] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waVIZ-00000002D0p-3nTS;
	Fri, 19 Jun 2026 09:14:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n0BDoIsJ+AwLGANwhLKdG0wKpBdpi0nEHUt9DiM+aahk2gZnY5n2RzigFFlvqA9Ev27nKJIfo5iVc/vShyD6lujNPifrNkhdM8dj4DmaxEluBBtzcLRzuOjIgClLFDFDHKMsuP3PBk27rXIxjosATrPZ8m1GXJiTKEE/LO/QzCPk+t18bU3OvFxeNSDCQjEZSbXGaa0bsw+lUpTRU5yWegX27+I7vl/CCjTGKd0HYzLOzwcpqJWcv4vh1J4hrav0wTCGXT5Ta4Xo0/8Qv+xmQGFTzUOFw4KjW9VyEgoqVtoojFlOUHMqqzhtRqd/esCjJNY+ikZYQMr3/Y2/RKfzdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/4r70jIYKEfklbvmlRzzK+2YQZ4WCvj6gCAe2mrN1c=;
 b=GsBlhC9Ae6U3nYlSB+Fbb5hfQPPCGJGKjh8oMSQJBOgnHi9qGUEPYjIel7c1+eWE/YT8Gfaurz5nDSVZ2w/SEv5QNWLDpvSaG/uS7v8pB63G42z+d6OKaezEHKTImmvzR1YFwXqhQDyY7rdE90ajfwQoLCIjzsilR02e8oi1/qcZ3j1a284Yh9z35TUPX+DbnV22aPJxLbamMWUmTTLKgJJJkON8OSuQ93h+rlfSLzF2i5yOf3Rlc3Y/Apf+LfyvANkbDZhQDuZhsj5U8ZI2mhOYlOEAQCb+bdkH553k9IDcAi4Mvi5lnJZXr4sF9OZ2uYCFw18vFJ9haMYDuqu8JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/4r70jIYKEfklbvmlRzzK+2YQZ4WCvj6gCAe2mrN1c=;
 b=2dLP+dys0sNMmOxJJMVLPX4hVWD/u/ohErdUZl1NCU+zZ0xPmay5xO0DAyutexqb1zWHy9U3W5WDSJC4StgStJidRZ6F6CkYtLGUZSEZNCtTAnUOrQpcHzGeVQ1h4UPRsaNradM/6h+n5ye0goylb/u3heOWL87c/HzMgdSd8l0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from GVXPR08MB11763.eurprd08.prod.outlook.com
 (2603:10a6:150:313::16) by DB3PR08MB9010.eurprd08.prod.outlook.com
 (2603:10a6:10:42b::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Fri, 19 Jun
 2026 09:13:52 +0000
Received: from GVXPR08MB11763.eurprd08.prod.outlook.com
 ([fe80::8790:5e3:beb2:5bc6]) by GVXPR08MB11763.eurprd08.prod.outlook.com
 ([fe80::8790:5e3:beb2:5bc6%5]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 09:13:52 +0000
From: Gerald Loacker <gerald.loacker@wolfvision.net>
Date: Fri, 19 Jun 2026 11:13:41 +0200
Subject: [PATCH v2 3/3] phy: rockchip: phy-rockchip-inno-csidphy: add clock
 lane phase tuning
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-feature-mipi-csi-dphy-4k60-v2-3-323356c2cc2e@wolfvision.net>
References: <20260619-feature-mipi-csi-dphy-4k60-v2-0-323356c2cc2e@wolfvision.net>
In-Reply-To: <20260619-feature-mipi-csi-dphy-4k60-v2-0-323356c2cc2e@wolfvision.net>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Gerald Loacker <gerald.loacker@wolfvision.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781860427; l=3042;
 i=gerald.loacker@wolfvision.net; s=20230502; h=from:subject:message-id;
 bh=Tqd4m+h+mXUR7yNiqt+EmEzjdd0dUJ2ulLBb5QSWcpQ=;
 b=zBUFF2ctd/9yAy43dPWLi/IK5YB/8TBc4+yGxgBPf1OFa/hUBcWVEDqyLo20lohGtjOo4j81R
 fUl41Ac3qbsBH4JYnMwcNjgO4tyh1AX8A5XaLwHKxkXZeNToCZXTPyN
X-Developer-Key: i=gerald.loacker@wolfvision.net; a=ed25519;
 pk=UXhp+obGMUOjknszonesnb29P6a2Kk/K5eBuz62ggVE=
X-ClientProxiedBy: FR2P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::9) To GVXPR08MB11763.eurprd08.prod.outlook.com
 (2603:10a6:150:313::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR08MB11763:EE_|DB3PR08MB9010:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b58932c-48dd-45a1-f15f-08decde3140d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|52116014|366016|1800799024|56012099006|11063799006|22082099003|18002099003|3023799007|38350700014;
X-Microsoft-Antispam-Message-Info: KbY+bOhh9evHXnssJu5werjW/krBeyDSvvLupqRLt1G9z2tQhzJQGeYhGk32etPvaUbXYRHy/zWA4kvk5/ivad4fRetZ212gCfxCjyrHlZ5Nj9MUEcfinMqQzWvr92PJG0wjRKivA5DI52UWCkWErsDlVIueOSM+ebFr/7sJ6OhbrVmX9wrz9h0bxjoGFXbgruQHP7OOg9SdoPGLgPiel5k3I77kopyb5GzB3cETYvfg2dhVmxBOVD17PjtAj0ThLapm60nR/BMCs5BGM2xMLxzEckO5hel7xoacV9Hv/6a8Q/xOZdaKh0ZsMN2sGjqXyzdUSb9yd5SwR43hEzLvRo2KZmqmdZWqOfG04EWgR70BTHw4a7c/DWJqRghTFpfpBVerGxlSTkxKlr5PyjHzmW5pvw3IhXybYuC7Aug4LIG97/stGTS0RkQIPeqyKpKXtBTLAXwQPj+OkiAGNFGmETnwz+pLX5wN6lC0kQLQ2/OoQaBXg5K1EqHM9b/5VQWpK01Lwq3P2OxD4fU2Hy72bBU5j0jRV7cc5cK0Vd/hMyxH8pWIyZzXHNvgXB/Ud1ieIuxiTVyWha+SO/rObzL9AEh3dif6HdvQsqA2oQIHyzKaGAC5qtoCsbOhWbpdBvp4GavoNMoi2/m35Jkq/J6zDonyjwDQAYWPtND0O6I/jEHGZuM7XF7muJnyLeBGqaCBxJsfYWzZ0IMkeBoHqiH7zmWOa0Kg8Bbw5w02RsJOf3o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR08MB11763.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(52116014)(366016)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003)(3023799007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWZVZGF2WjI2c2pXejBjSXU0dXZNWmgrdGtVc0NrN0pnYk1POGNFdTlYTnN5?=
 =?utf-8?B?Z2ZiOXg0ZXJxeWNyUE1LY3JrMlMrV1N1cHVEd0lNc2w2ZHZSTDUzN1FoZ0N1?=
 =?utf-8?B?NCtTRGQrdmZvQmZnKzNRU0RyR1ZUc2pRN2JqL1F5ZE9CQlRqaVhlcGd2SVNj?=
 =?utf-8?B?TjBITDdxQ2hrZkp5Q0tGeXo1c0FLL0tPSXR2dDR5QWF1aVBUWG1RRVBVMWhW?=
 =?utf-8?B?VVhkcEZIZnJ3QWZ1QmxOcVZHTmpSNzNUa3RuS2s0cHdDM21YdWMvUDFjZGtD?=
 =?utf-8?B?WTlMNE91RUx1WEVCTjNvSExueXVRd3M3bUxKMllPNmZLNHg4cEhuTVJwZGFD?=
 =?utf-8?B?bTg3cFU2dTlFWkJvY3lpVDZDVGFBSFJRdUJ5OGw2SUcyalVibUVkVmVuU282?=
 =?utf-8?B?aFhrQWcwbkh6RjFCR2s1RHk4MmFwSjhvWUJySUI0WVRPaUwzbkUrUzFtWWhM?=
 =?utf-8?B?US8zdXF4UmRLTjRZUUcrL3B0dVZHTTUrbkNCbnpBUkpOUXA0MWs3TUx1b1Vx?=
 =?utf-8?B?VlZ1ejRGZk1jTC9LTlNXeG1DTGZJdW0wV25TMVJ0cWxmSDNma0UrYzlpTWVY?=
 =?utf-8?B?THZTdHliR3ovcVRXcXg1eW0wNUJkaytoY1dQN3M2TFd5enB5S2JuSFFiTVpm?=
 =?utf-8?B?aCtDdFNIWE5aTjQyU3podFprSzYvbmx3Sk45ZnVVTU1hMVhZWm1QNnNpMGFG?=
 =?utf-8?B?OStyYy9EMEJ0WXRnZWFSNzZ6U2FCbjFId3R4ci9nR29xUjI4bGI3RWFaOEFm?=
 =?utf-8?B?eHZxMVY0Vk54dTJVZlBxNWJtSzFPL1VEbU95bjZmQzhJWTBHTEhSbURrZ2tu?=
 =?utf-8?B?Q2pHVCtXQ0pWWm5CY245bFJJdEViRTV5S01zMXIzUzJiS21sVStsaGVyWkNK?=
 =?utf-8?B?RFR0M3d0TE13ZVVBcDR6Y2ZKRGNSbVpMWW42Z3NmcXVSSnREajZqUk03OERh?=
 =?utf-8?B?Wm5JYVpJb2ZXam1QL2c0TGpCMmRrU3lCelVWTXdlbWxwTzQ0endqZUVPSWsz?=
 =?utf-8?B?dUhWaGdCTUswK1FNbjJsRkZhOFJtek13cEFCMTRTLzJkQ3h2YVdKT0FsOHJ6?=
 =?utf-8?B?WExQUnZpZHRjejRsVTJPUURlbCtsUzBSYzJVQUhuYi93SEJhMnVyQnRFZG96?=
 =?utf-8?B?RDdUOTdJTmRJb1pSd2s4QjN1dzVrSVUxcGNybkFsbDNSUXI1MVFhS2puaHpy?=
 =?utf-8?B?YTBsM0did3lSWXEyaDk1VVdpa2krZkpxdWlKTVVtSHhlNUQ0cXoyOHNuYk1s?=
 =?utf-8?B?ZmxTb1hMU0IyY3RFcWhqanZFTGU5TEpzSHFqSEtiYm94YkwreXNTNVJNckEz?=
 =?utf-8?B?aUpsMmdVUERVN1cwa2JuaU1yV0N2ZHkxMFF5c0dpdmNxdmd2VEo0M2Vldkgx?=
 =?utf-8?B?YmVRd2ZIYXlSbWVUanptVjZBTkpkekpFZHBOanI5TWRXZndSN2dSYWtHY3ps?=
 =?utf-8?B?ZzBCbWpuSTdmdVlHelFGblQyYlFkMG5vNWRNcy9IelpzR0tjUWF1NjNQcmVX?=
 =?utf-8?B?ajBXZmQwU2I0MVA1WFBUNlc3Z0FybWdlcUlyTzdnQTl1KzkyWjEzQzUyK0tN?=
 =?utf-8?B?M3ZlRndOam1WNTY0bFFXOE9tRHVRRkR4NjBTM1NHclNnQzZLb1ZCZ1RhKzVV?=
 =?utf-8?B?S2RhWEI2Q2daRFJpdkVsRTVoS1plQVNmNm1idFRJR1RJQTc5UkVYeVNFUEEx?=
 =?utf-8?B?cmp4Z1Btc3gyOWZZSUhuZ3BkeEtGbEd4Z0k4QlE0ektGRHBrZm5MYnF2SWlB?=
 =?utf-8?B?NXRacTg2SDdOaEx0SEF0ZWhRYnIrRmFsKzAwQnVudUNPbFp5VFFqNGoyUlJo?=
 =?utf-8?B?VkJucVZTc29CQUY1RncyR2E3Ymt0RklHOExSY05CczlpVkVGYk5KQjVwQ3FN?=
 =?utf-8?B?ZmliNy9lczdXM2J1cWlvM0dIZ3FuR0M4eTgxeG1tVlZmazAyT2x6K2hINVlm?=
 =?utf-8?B?aDJZQlBpNithKzgwOUVwK0hDbDFrR0RrTTNPeWs0QmVJbUFFZTUzZS84VUds?=
 =?utf-8?B?bEJwc3V4MEFST0tqbEd2ZFM4cmZIdWZWM2gwbXNrY3JxYmIvY0FXTk1VV0Vw?=
 =?utf-8?B?NjFZTGFOUm1ZOW5sVEJsa09WbmQ5N2VJcklGSTBoMFc4ZzRKQ21vbUNiTkV0?=
 =?utf-8?B?NTZoelE2bG1vb3VBTzJhb2dYSUh6U0RXVWxuZ0ZzVUtoSnpYRkM1ZXpuTFJ6?=
 =?utf-8?B?Ylpmam9wN2NjRy9mbDZRNGovQ2pVWHR1dHFOK25tb1V1dDRtM2FaeXFNYWtO?=
 =?utf-8?B?U1NnYjNTZ3duODVldURzMnVtNGoxREhCWDlFbGxRa1p1NTN5M281TXFDSHZz?=
 =?utf-8?B?dnJRaW1oaHNLdEZPWXIrYVM4Qkpvd0F0cjFmNkN6ZG10MHFMc1R4SjVNUzls?=
 =?utf-8?Q?tz9UZ6bXClVWJqf4=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b58932c-48dd-45a1-f15f-08decde3140d
X-MS-Exchange-CrossTenant-AuthSource: GVXPR08MB11763.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 09:13:51.2096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ODGiIDhu2uWtNv/+NoSRpRXJosCGAQ+tqOp2yH3h47fRNMRoHitjt2e9+/rBrka1ERX8Ism77KuG2nrW67jKnMB+Eeb5B7Jf5ICP+XfQo4k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_021403_948616_19204618 
X-CRM114-Status: GOOD (  13.41  )
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

At high data rates like 4K60 (2500 Mbps), such as when using an
LT6911GXD bridge chip on an RK3588 board, fixed default timing parameters
can cause signal integrity issues and clock-data recovery failures.
The driver currently lacks a mechanism to adjust the clock lane sampling
phase to compensate for board-specific trace variations.

Resolve this by parsing and applying the optional 'rockchip,clk-lane-phase'
device tree property. This enables board-specific tuning of the clock
lane sampling phase in ~40 ps steps (range 0-7) to optimize link
stability. If the property is absent, the driver falls back to the
hardware default.

Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
---
 drivers/phy/rockchip/phy-rockchip-inno-csidphy.c | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
index 5281f8dea0ad3..3a15840e86cad 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
@@ -69,6 +69,10 @@
 #define RK1808_CSIDPHY_CLK_CALIB_EN		0x168
 #define RK3568_CSIDPHY_CLK_CALIB_EN		0x168
 
+#define CSIDPHY_LANE_CLK_3_PHASE		0x38
+#define CSIDPHY_CLK_PHASE_MASK			GENMASK(6, 4)
+#define CSIDPHY_CLK_PHASE_DEFAULT		3
+
 #define RESETS_MAX				2
 
 /*
@@ -151,6 +155,7 @@ struct rockchip_inno_csidphy {
 	const struct dphy_drv_data *drv_data;
 	struct phy_configure_opts_mipi_dphy config;
 	u8 hsfreq;
+	int clk_phase;
 };
 
 static inline void write_grf_reg(struct rockchip_inno_csidphy *priv,
@@ -304,6 +309,13 @@ static int rockchip_inno_csidphy_power_on(struct phy *phy)
 		rockchip_inno_csidphy_ths_settle(priv, priv->hsfreq,
 						 CSIDPHY_LANE_THS_SETTLE(i));
 
+	if (priv->clk_phase >= 0) {
+		val = readl(priv->phy_base + CSIDPHY_LANE_CLK_3_PHASE);
+		val &= ~CSIDPHY_CLK_PHASE_MASK;
+		val |= FIELD_PREP(CSIDPHY_CLK_PHASE_MASK, priv->clk_phase);
+		writel(val, priv->phy_base + CSIDPHY_LANE_CLK_3_PHASE);
+	}
+
 	write_grf_reg(priv, GRF_DPHY_CSIPHY_CLKLANE_EN, 0x1);
 	write_grf_reg(priv, GRF_DPHY_CSIPHY_DATALANE_EN,
 		      GENMASK(priv->config.lanes - 1, 0));
@@ -449,6 +461,7 @@ static int rockchip_inno_csidphy_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct phy_provider *phy_provider;
 	struct phy *phy;
+	u32 phase;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -464,6 +477,18 @@ static int rockchip_inno_csidphy_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	priv->clk_phase = -1;
+	if (device_property_read_u32(dev, "rockchip,clk-lane-phase",
+				     &phase) == 0) {
+		if (phase >= BIT(3)) {
+			dev_err(dev,
+				"rockchip,clk-lane-phase %u out of range [0,7]\n",
+				phase);
+			return -EINVAL;
+		}
+		priv->clk_phase = phase;
+	}
+
 	priv->grf = syscon_regmap_lookup_by_phandle(dev->of_node,
 						    "rockchip,grf");
 	if (IS_ERR(priv->grf)) {

-- 
2.34.1


