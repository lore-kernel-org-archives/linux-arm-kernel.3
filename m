Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE3FC53219
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 16:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ID2Xd54wzV2+7KgvTJP1XPfUiNGyuBOf6ayXzxFxT4E=; b=m4fIx7iVRYpjFyslb8MLCzNMYn
	tOO0MvTVTu6+KIWDCWOBF0F5PS7I4RCPL8O85doDBfArG6V337gKRH5btPGiQ3HUoMKuzOuLnbNsq
	98KVYKRXIn4EEvxPw2qKrRSfYoSpUS08eFZHGsKQsIUMHkG1b3CBa2xJ0/xCLKEMkCWePkGtJ36DJ
	DiH9OU5E9FfO7ZL4SdqgEjTQgoPnI2fVAnvshUojB2LDjoAxK1ztjl14HN7d529vvtALw5Lh9VqP0
	LrFsNa5WbgRCLdyjEk8ATPaB9PKnUk7avQfGglyIYfJpCJo0MtMLtHDGe4lNfN32v9g1hyrN8VNw8
	Jt6QZfWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnffw-00000000YdG-3Lpb;
	Sat, 25 Jul 2026 16:56:36 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnffr-00000000YUc-0zNA;
	Sat, 25 Jul 2026 16:56:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZiGBtKrfjwJuomG0DUeaBkfj3VWRZOX3zwtio138m6BeSuNsVRSo1avLGEMrJGYqObkbIXTwnAJDGc6aAVj+/nTKe6GwRmp88VFxeJpTFyZ47yjM3ar4JaJbE+xiAOViZLn4gdzhSbgvEKNBWIkyciqVSJusk+vSpcLPhU1E9uOipSAQBx0L4gM+IjasPrriY03jGSc0BNeNJUD+sdti4f6fJMMZ4TiTpbiZQAxyJXsjvVXuDSa01DWkEvVR4JhCsqNl59vbSQCThZbA/J0ozv8lJdrYASpk1NKr9g8vK2KKMjdeliv5DKkEx/hQeHHK4/29vVf8N05PdoY+YVbUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ID2Xd54wzV2+7KgvTJP1XPfUiNGyuBOf6ayXzxFxT4E=;
 b=nxMVix/kl6kW+0sQCy1ExDGNgsL7cY6EcjLlwmQpq2gFW1BC/LEjGWaJDB8odMB0tQCcKZxrgY1XsdIqsfpHGXVURbYwru8fj6H3GcN6R+mqpy3z5+ytdUatDX+inZqQpJ5R4JSLqfeBVPimFllEsDqftYZzML+JAElSwCin0EZS9EogTHjIuXmF46KKZdiRsLARiMh7ZR8MkJGfPeYU6+n4pBwat1S7KuTjTyOLNWFqIF74sCnMFXC5LirfeF/gIKZiMzNsZLjhN1KtnSnSSXWY6cHJAaHVnTejRpBQBRPc0PebL9q1aAr0SZBzQJEyN+RAdZq6wSPFRWTNcgKN/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ID2Xd54wzV2+7KgvTJP1XPfUiNGyuBOf6ayXzxFxT4E=;
 b=D6iwbZ56Hj8DLugxCaSlab5+u4eq48Vv1xMe1ADKmZDIn3C62Jb5lnzr9vLl4DSZxTChOxJ8KhvDDlc5T0/nqhQu5pC8bDGjcF1B4hddWtYqyJCIgdns8mYVq7eyx0ha9jOJ3fj0E9k3FVksgUa26Kua9Et8l7ALYNkz9FQGeco=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from GVXPR08MB11763.eurprd08.prod.outlook.com
 (2603:10a6:150:313::16) by GV1PR08MB10789.eurprd08.prod.outlook.com
 (2603:10a6:150:163::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Sat, 25 Jul
 2026 16:56:18 +0000
Received: from GVXPR08MB11763.eurprd08.prod.outlook.com
 ([fe80::8790:5e3:beb2:5bc6]) by GVXPR08MB11763.eurprd08.prod.outlook.com
 ([fe80::8790:5e3:beb2:5bc6%4]) with mapi id 15.21.0245.012; Sat, 25 Jul 2026
 16:56:18 +0000
From: Gerald Loacker <gerald.loacker@wolfvision.net>
Date: Sat, 25 Jul 2026 18:56:05 +0200
Subject: [PATCH v4 3/3] phy: rockchip: phy-rockchip-inno-csidphy: add clock
 lane phase tuning
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260725-feature-mipi-csi-dphy-4k60-v4-3-5b2c4626d31e@wolfvision.net>
References: <20260725-feature-mipi-csi-dphy-4k60-v4-0-5b2c4626d31e@wolfvision.net>
In-Reply-To: <20260725-feature-mipi-csi-dphy-4k60-v4-0-5b2c4626d31e@wolfvision.net>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Gerald Loacker <gerald.loacker@wolfvision.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784998575; l=3092;
 i=gerald.loacker@wolfvision.net; s=20230502; h=from:subject:message-id;
 bh=+s6AHh07LMn/WyMHVK6UmJcRvvKc1ILZngZSq5zMuxw=;
 b=ipE0EfL0dDYxrsAhd6i/Oe4PMZeoYgwaI6sPwfcwZ9spRNeUFFTyMLqnzJ4qoMoMYVrCqgEma
 DCHdths6S1jBHaUhdKTALEDQhGq4NZsYJb6dJUpOVzOIF1P50e3JIt0
X-Developer-Key: i=gerald.loacker@wolfvision.net; a=ed25519;
 pk=UXhp+obGMUOjknszonesnb29P6a2Kk/K5eBuz62ggVE=
X-ClientProxiedBy: VE1PR03CA0041.eurprd03.prod.outlook.com
 (2603:10a6:803:118::30) To GVXPR08MB11763.eurprd08.prod.outlook.com
 (2603:10a6:150:313::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR08MB11763:EE_|GV1PR08MB10789:EE_
X-MS-Office365-Filtering-Correlation-Id: 34f4c847-5cc2-4221-7366-08deea6da5de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|23010399003|38350700014|56012099006|11063799006|10067099003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: C1oIfIY2+e9cVnjTAXFA7SIvc9gQsV8cfcN9W3DJjHzT+irHkhdFdoGD7kUG+t/nS8PnERP7glsgGNHahGJJ2Z75Kh6aOgvwp87hN7Kc3DEFN3eC4bv/UDbdKRUD1ugDLfMvfBJwLyUtgth55MH25wJpo7kQlC0Z6ujKaOWN4screowUvJVA+coXpsKSP3s8sfNLu4gdeVlURmpBwwMGoeFEZg9H0qhaxaIFxVx4zuqxz84XlY+0k+405Uv5otn1q8bUNidyOT1zdpugv3/B4+nTHW7vH5CpfdJTwqXgl2cHpPVYM1jQIEilRraoyvSeXkowx0lKOJw/4khVTdpgV4A4EezHLWPQNvadPA36pSucAMtZ47fTr6oxvJNX7HWiEIv+E09lxcYHmstduVdkbaxW7+FU+1hP5GRvmGStUC2fdL6RL2bGjY3wS1zDRBVLJgItvMIp3LiLMOYwne9cp+RMBbc5cOuBdBL1ja8ThZsuKtNSgDW6+A/+9E0yDTawOdEnRngh6Dwh4n6f7+I8qdwgPgCEBbKXn70l/dX6uSOhqBX2hl/8M9ge58qIQnlTcM50Ly7qX05S5TKJIpuwjZ+juZsp/rrP7XHRFVKwn8rG0F8Lh3OXG6qpSUS+QlGrXzDquIdNWM/XRZnPIMVD2cPxxVTMjPWNf7nG66G6fZPyffaPko6sSLtneRRNyR+rpHAKlYA1emri0sKrJLH/h/GZqctR2R01rzVstUkNWG4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR08MB11763.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(23010399003)(38350700014)(56012099006)(11063799006)(10067099003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eG1xaHpoTlBlTkhTb09UUXZuUHdJRFpFSHhVVnBYTCs3NTdMS1RabzBYVkRK?=
 =?utf-8?B?elFpRVUwMmhqcUdGTXhOb010dkNJeGZhbmZLaTB4ank3L04yNnBic01pekt1?=
 =?utf-8?B?cE9WNW9wTjludXl1dWZpVDFKY0JDVDMxQ09BT3hNNCtJWit6dUlSU0JFdkdq?=
 =?utf-8?B?V2hkMVpieThFbUxUVDROTDVIaTNpQTFNZGgvVEpPSHBtUHJFWTJNMmRrTnlW?=
 =?utf-8?B?MnhERERTOGpYbHN6QWxFSG82Y2YrWkhwMFp4RlRZTFZkOERzcERXeGlBSjE5?=
 =?utf-8?B?bWduNk54Z1NEdFVZN0ZaUmxrTlEybUtmcFVpTjNnUkRBbXQrRWpCUFVHWERL?=
 =?utf-8?B?QkJJdFE2TlNCN3FnekRoekdFZVQ0Y0gya3I4OGlWR1hXd2NuanZpYi9JUDFv?=
 =?utf-8?B?dHRwTmhuRHJYRFFGTnhsVTFQam81N3JIcys5TDM1WHNLaG5heGxtNGErU0Vk?=
 =?utf-8?B?Z1BvTTJkQjl0cnN6ZGx1TVlqMS8wSC9oamRvdElHRDFoa2UrZlIrbk8rTXdT?=
 =?utf-8?B?dG9LR1FBTWUwYUM0RzNONUppMER0aGtId1Boem5tMkxKYjFzTlJJOFhPc3Aw?=
 =?utf-8?B?dmVQZkhRY3grUXZUMGFHOHI4UkNuNXB5d3NRUStiNm1tcEQxV2NnMElSbU1k?=
 =?utf-8?B?MHIvb0VJRlhUeTI4RThMc3lncDlzeklNSlhmNmE1em9lMEhkRGFaS294VXNG?=
 =?utf-8?B?R05BL2JnaklqTlpiaUR1OHdTL1Rhb1BNeFlIT213bmVCYW1yeEVmalNYaTBo?=
 =?utf-8?B?ZTdoU2dVZEkyVXFBbnVtc1lETjZVaUdSUEdUWWtTNlBQemFkWnNQR0NtNUxK?=
 =?utf-8?B?MjFNZUZxSmo0MVBqd3F3ZUFjM0pJQldkbVRqZDlONVA0OE8yQUordnlydUkx?=
 =?utf-8?B?djdqOU1qRUtYbTBMQ09sOWlrTkl1TFk4RlJSWHVsNmJuMlE3aTRZSzQ5R1ZD?=
 =?utf-8?B?NlNWeTRHMmZSeUZiOHBxcXY1V2JoTE9XaXVPSDhVNlBPWWU1Z2xCb0JyMjdo?=
 =?utf-8?B?RkZPMGtjZklQSzNUWmhUU0tGZUNyQ2VMQWVqS0Y4K2ZFSWxER0tiZUhRd2pY?=
 =?utf-8?B?VEg1MDRlOHduakpld2xXL0hwR2QzVk12U2dnSEhJVmlDeVFRN29xNXhkY0Fz?=
 =?utf-8?B?d29JbFJ1b0xWNmN3UmlLY3FxTTVTNldTWDRrTXRzamdEaGVIYndqVENxNVdY?=
 =?utf-8?B?cUpSb3NDeWlKOUZqdllsRTNMdHRLSEkyM1lRd3ZvTkpzakJGcmE0UkV3OTJh?=
 =?utf-8?B?ZzJ2OG9aV3hlSm0xZGVKa2FsV01yUHRkUGpuN1BhZC9JWnI0bjFzYnN5VEVk?=
 =?utf-8?B?MW1GU0JCT2JGc1VJbzNDSm9Wd3R6YjJZV1FTakJHbElVSnFsRkJLckExcFd4?=
 =?utf-8?B?b3gyaERTRHZxT2libE1oc2Y5SUlDUzFNVEk4ZjhUZmMxb20yY2I3ejRlUE9H?=
 =?utf-8?B?Q3ZTMmpCaEtFb0FMWmVuRG5ua3lXcXNVNjF0ODVCUW1LSk4wamRaeWRzaFht?=
 =?utf-8?B?TDJBMHk4T1owaFhJZ2JKQVppQ0RrUW9hcFV5MzBRbEJIN0JidG4yZWxFK2Rp?=
 =?utf-8?B?RTNxWUhDUjY0U2xyQUs0dGFMQ2c3b3dUQVFCU2ZwdDdrZytrc1Uxd1VpNHh0?=
 =?utf-8?B?MlRyZ0h0Y25VeWVpT2lueDZzbkRKR2QxaFFWQjc2STI3Q0ROM0RSMzJZaEdS?=
 =?utf-8?B?ekVnU2ZxR1daTDhXc0tyMkowSHJZK0Q2S291Q2JldTNPZXMwWHM5eHljN25F?=
 =?utf-8?B?b0RyczVuUkkrREpYZm1nek9GNVZ5ejRGb0FvY3lmbHdwN3pBQlpyQ2UwTllD?=
 =?utf-8?B?OHRYMWNWWERmQXNHeGlpK1A1dENqeDExbU1JakRnZ3JyTmd2ckZWKzNtUE1K?=
 =?utf-8?B?bGdiUHd3VjBXOXBReDVqWEw4b25ESTF5cDFrM2tSeHhJYXVFUGlidFB5Mmdo?=
 =?utf-8?B?M1ZFdTUwTk1sTEdCaDZub293a1RFbk9OczdQMVBhQ2lydFp2Mkx3VWJDMzJn?=
 =?utf-8?B?ZU5IbEhXTk1QazBPN0NwSDlkTjdSVnRGcWMzWDVuNkJQU0pTWUZGV25FRld0?=
 =?utf-8?B?cUZXYURDYW9zMVRENFZVZVJPS3phRkV3QzZLYXdMKy9xbjV2Y0NtaEVPYzdp?=
 =?utf-8?B?WjNLNkpVTHZwc0ViWGdNVm5kNzc2VUtQL1Y2bTE0UHB3Y0wrcGlhTWdlQTU5?=
 =?utf-8?B?b0hLQUh4V25iRHRSeE5TSjh2ZzRTN1NKempZZEtyKzN3TEhmYzA0RlBuMDRT?=
 =?utf-8?B?dmFMODJjUVZmVmtRMGhBajhYY29TeFNHQ1BuajJhRTZWVnNNNWczTnYrdkJB?=
 =?utf-8?B?U3liWWo5UmVUMkdTWGNDVDN6UndnQUpxb05FSVErWVJhd0JEaGlYRnNMNmdQ?=
 =?utf-8?Q?eIjAGLe1KW3z3n4U=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 34f4c847-5cc2-4221-7366-08deea6da5de
X-MS-Exchange-CrossTenant-AuthSource: GVXPR08MB11763.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2026 16:56:18.8994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qPDbpE7dnY1p1FxUTBY/KfMwxL5zH6qTRumNpCvGkwVq84zDTDQgb/UrdSayEUQUisl0+B8PvGQw2u01giAFij+zMskMP3M93nmKul8Qplc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10789
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_095631_285570_393572B3 
X-CRM114-Status: GOOD (  13.38  )
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
index 5281f8dea0ad3..d989f1649b0e4 100644
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
+		if (phase > 7) {
+			dev_warn(dev,
+				 "invalid rockchip,clk-lane-phase %u, using default %u\n",
+				 phase, CSIDPHY_CLK_PHASE_DEFAULT);
+			phase = CSIDPHY_CLK_PHASE_DEFAULT;
+		}
+		priv->clk_phase = phase;
+	}
+
 	priv->grf = syscon_regmap_lookup_by_phandle(dev->of_node,
 						    "rockchip,grf");
 	if (IS_ERR(priv->grf)) {

-- 
2.34.1


