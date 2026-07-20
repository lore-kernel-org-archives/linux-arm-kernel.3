Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905E1C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 21:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FTdXOWy3ed/D4Bj7Fisqs9W87MUsn70k8yzLHR59L10=; b=i5/6G5llJTkOz+KOYjOpVSGXSh
	FLwcA2MAeqcExCMoWwnYG+k91e7ciZ9oe76WI8rsuG3eclE/E8Kw8ceeMAPpuAdZxMgslqIPRTLxv
	T+lAQmnZSX7TkdQXANA4TKMBsUmRE+viweXFM2lLMfkxlsDJkEcF50xkUj4xbFmhiLySWEp87DQGk
	2gI+Xc3nJFJUjAeWOKbmBfCBgnQuzEm5+qw8Zb8lbim5ldjRyzbb4ilzo+ogw1ShZiJmF6t32Rfbh
	VavSMuEfZClTWtWD984mrX39qa6AfF5VlzWTtEV/6v1k/R62z/mX9zJ2S0oh99gWF7Jo1w8b8Jh8/
	B3yDbVUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlvGO-00000007vS0-0hPE;
	Mon, 20 Jul 2026 21:11:00 +0000
Received: from mail-westeuropeazon11013020.outbound.protection.outlook.com ([52.101.72.20] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlvGL-00000007vRP-0fBb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 21:10:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j20EVLVb+OBXeh+u1a7bDez5KlkI1CFNzAhKtMqN5VJkCgwttEOrVXj3KfISoYOVIvFlq/2ncX9kkbA2YE0RbXO9UJsmSP8QMCnpvw8kn8LLDVXUT9Ebdf2HWnAPKpOFCKR9Q0OIfTMNYK2Zgw9Rq6KbsUj/qXH9uyTdyF/MBI8/0CwSqh+eo19fXegrH6cTBzJ1d55fI5YhebE3kn/Vx1lJ6NXc15vbNL3W0dodopk/S5VlRZcvYC8v7cqCX5JN9iw+VE5Q1klpg+ZQ3X+xOjhSuzJxsKhYTIGHYKLwRq1uMBA1s+j7g4v5Ch04LmV9aaXjBBmViKtPs16YTSzl+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTdXOWy3ed/D4Bj7Fisqs9W87MUsn70k8yzLHR59L10=;
 b=kzMImNQLn2+04t9JwDijPMYCqqngLhcavEjPvSG3TPnyiMhXDPee0W9IDko3MAF2Nw2y2rerUUs7FZu6R5F1RYf4C44yFz24nEzh0FwElvO/CV0Id7o1b122Kc/1dx9LY93rSSuZtyOT1507B4408q3PXPFsCn85doglfElBK9aXCo3rltyaHMGWi39kZe7yU1OZhy8UNpS9h3hgOgZRJc5PsQsqW48rVTQpN8NRZL8Ze0kO2ERoYJGh4ILWb7FEBBhMR0S4+BBOLdeUT/ZFkQXWDEfcQVfNoJ9gpph2WOJUr34rFYTggSjoFcwYyAUEpZRIaTeq+HncYRkVe2WJ5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTdXOWy3ed/D4Bj7Fisqs9W87MUsn70k8yzLHR59L10=;
 b=JTD48T4k2sSPtkVUuiyOPyCQcYssJvP9vCFcrChlyWPXQoe0IIlaqDLHwSo0xGkXITipx1kaZoMx+lSCpSJotQW0abVjX6Qv2oAYZG8sg6LH/jGR5UIhqMCkGvsRnLbOCxOshBBbTlEcZ+VkzWCFALXYdz6IR2fGAijPIoysFvl4JJ3KGACNfjce1bVWOw8y7Xc5ZYJIiqKEsz5PggXdfZgFK4pn7g0uC2mvmnG9jDnmgsN2wdmC6LI4zGqx0MVmMg8gXDILk9J3RqR43P3p8Y3tykGC/iLzbfcRjKKnevcW0UYc2jK7iLgHMJ7uS9mtebSAZo/9OjNW94DsmxVeDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10565.eurprd04.prod.outlook.com (2603:10a6:800:25b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 21:10:50 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 21:10:50 +0000
From: Frank.Li@oss.nxp.com
Subject: [PATCH 0/2] arm64: dts: imx8qm: add smmu information for usb and
 add hsic usb port
Date: Mon, 20 Jul 2026 17:10:32 -0400
Message-Id: <20260720-qm_smmu-v1-0-3689fbd8b516@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMiOXmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyMD3cLc+OLc3FJdE0PzVEtD0+Qkc0NjJaDqgqLUtMwKsEnRsRB+cWl
 SVmpyCUi7Um0tAJwkzX5rAAAA
X-Change-ID: 20260720-qm_smmu-417e915cb713
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784581845; l=518;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=X8qqqK43Xjxgua9WqZGJ1+fW2BsTY5GcVRk9Sw+x+Vg=;
 b=IUz8/qNszlZafa2YjYN4IeqBV/yEk8SV9mCFqgtSnkvb2tigQqXJqTVw9Eg9TS+bn360YWBbd
 Bjb4f5MykXPCOH4kL/xvCtfp1u5GWoQ1ywHabtNyGOV9m7rzYDT7Zdg
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8P221CA0028.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10565:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ea2cd37-9f20-488e-8bb7-08dee6a36032
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|376014|7416014|366016|23010399003|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: OFH+0XpzRGNTLbs2TTFB43vKvh8dREeaHDat8lva38k0D7i8adztkY9Wc2fSEiA0heryWOAtJH7MCUlpBr0AIPJ9b9XpmERKkSRv+7x60jIdiTEpMuedOcmIiRtlBcMMf8Ro3ClU3NbfXgz5XWcs/n6jKRG0+oXG9JITxtr4iOgaVvynmXDclTpn3k+AIQdQygK/HXRWqWq6S2F7LRdZtPLJESxe28203yRWVVlQJdviWBI5ujvMeKnQA0MVa+rnrJ7Atxv/dHVqH5LdMEr2eMNX1pKkMpp5aX1Osnsn9YLhNLSNO++h4+ZdRcGYkdrhUfQYklEe1yNUqfVZdNbB2xaeChLbfVWf1bKG3oMCUIAjmptdFvMlRCSP4lctxTMKvIersGK5ompfjpsL3gAdnnyYlV09k866kmqvQRK/j9h2iMfUgkjdQqLXy8GrQwx4KPBKixIeOv4i4/96fx4If9g2tUDs+J1F2cYjt7xLRCo6v7QPHBgrdFpgXlnplxvXGH18v1mPEQHtQgKBoqb/TdH+G+piB/lvCQcvuwbsr/1IiFF/S+UEFkuKTunUIVv8k3zNH1+R9je0zkl2efaG1vosXN+/JIGCjfUtGu3QhznL0Jb5DzkTQb0x2+kSlSAUCNHidt6mHmt/8I1ufHSXaPsy3woPGvOtPGt6bG3td8w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(7416014)(366016)(23010399003)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WThPOEFEVUNiYmlVK0lPWUNXNlE4U2F6MXBvTEhNV2dxc01HOXM3anFpdkxF?=
 =?utf-8?B?UkMzZUJSMndaWmh6NGc1R3ZRbWxOSzZyT1RNZXVTZUdwZHUyQVNCa3A2dkFq?=
 =?utf-8?B?UlNqWElmWDhYbUFJK0J2bkJrK2hIYmlFSXBOdk1qdy9QcHBQaEtWMzVxbi9t?=
 =?utf-8?B?dXlnK3pzNkc0RjU4QzFNM0RHTWltMUVUM0x3a0Q0ZGtqbmJGQjhVL3NnUEdU?=
 =?utf-8?B?ZVNmWTBNRTNaUGtXdVZUQzBxQ0M3Y0xyYitzekErVWdiM3o1UDhqZUt5c2Jt?=
 =?utf-8?B?MXhyRFQrVjd3UkJDeXZwZEFSWmJwWitsbWNxMFdqWUxTeGhhN1B6NTB4ZUoy?=
 =?utf-8?B?YTlQc0hCY0Z6LzJrWGNobXZOVWJzSUx4bU9VNEpjak9DTXVaOVI3S2xqaS9j?=
 =?utf-8?B?NUg4emFEcGFwRTdtYkVNbEFBdkl2eUFqTEUvYmoyaEdRdTl5eXY0WGtIamFS?=
 =?utf-8?B?dnJHazRnUW1kcmsxVDYxRUpFZU11UHJWcnpoaFU2OEJLa2YvRGY2SDBmRVdQ?=
 =?utf-8?B?WVpSVXg4Y001R0ZuSXB2YWYySGpEcmZaREV5bG1aVUloRGlobVQ0THBGY3ZO?=
 =?utf-8?B?aE9KLzhSaU1aR2ozV2xpQyt1bi8xTmFTRk9SK1J1UEU4T1ZVNDlOSlRJMXZF?=
 =?utf-8?B?NFd0RDQ4aHRQQlhmN1lobnBFL05hYUxBYUZVZTFiVTNKcGo1ZU5EeWhBbFky?=
 =?utf-8?B?VFZBeWM5WFUwaW12NkNjNmpvTHc0bUtDT05yRkMwbnN0R25BNG10b0FCSGti?=
 =?utf-8?B?TU0xUFlnc3ZJVml2ZkhCVFhkdlNrbVJOT0RhMzhQbWF3MGQwbTd5VlBpcjdU?=
 =?utf-8?B?V1ZSaDFPZG4zemxNMlB5RHkzQWVPVkZkeEFSUVR0Y0l4eVlQQ01MMDJQc3Fl?=
 =?utf-8?B?WEIxWGt3QXUwOHlFZjFwT1ZmNnBzaFBRTS9STTZKQy9zd0RYWWJRVEp6eWc2?=
 =?utf-8?B?SnR0elpVZzlYckx3eWI3ZE9lTStjcDV5Ym9KM1RTMWVUcjRnNG5NZ2N0Zkh5?=
 =?utf-8?B?emZoTkRlODdTRVZoRlVQaS9ST2xObXV3NHhsSUsyamJjUkJaRThTT1c4QmFu?=
 =?utf-8?B?ZjNNM09PbVA0dHRFY2JMQTFzeTUyMTJQODZnUm00a0xucy9GYUQvazB3U3BM?=
 =?utf-8?B?NHJ6SlZJdjJUaGtBR21qczRUcC9tM2M4MUg5c1RNTDZ5UXJ3dHJrcytPRnYr?=
 =?utf-8?B?VTJqTGU3dHV0MS8vRXhPdXdVTEtFMmVVOXJFUzNZZTZpS1Z6NkVQa2xqZktS?=
 =?utf-8?B?N2pGNlk5a3NiV21TTUtsbEVaWWtmVmoreVVSaHFlcWhGZ3hYQ0Jtb2F3eHB4?=
 =?utf-8?B?Umlvc2UweEd0bUFCTjBOeFVsL1ZGUEZ3Z1BjNnM2Vk1STkVhWVZjNWNZMTFy?=
 =?utf-8?B?SzA3UUZoRlVxemxUbDY4VW1mVzZ0YTZEcE5aRXVCTUV0V1lmRGJ4alFHRFVh?=
 =?utf-8?B?ZEZkZWFYVkZlSklTVHM5R1RaYlFwVkg4YkNYYW1mRjJkM3owdDRZamlCbUh3?=
 =?utf-8?B?cklCV0VHbXZESlBqSUNhaEl2d3hUVHgvUVJleENUaFBGZ0F3YmZYZUxvaity?=
 =?utf-8?B?dlM2am93UE1qWXBybWt0MWdpcVpMWlBPLzZpUjU1M2FnQ0RZNDNta1pjOE5a?=
 =?utf-8?B?SWNqTjlXdkdBYXhxTTFiNlBlZE8yV1pYaXNTcjBoZURLcWhLbllPZHp2c1hY?=
 =?utf-8?B?OTlwSXVYYlRDZTRLTEphQWp2Sko4ZWxTSklJb1VWOGFwdWpKekVOQUoxZ2pR?=
 =?utf-8?B?bHQvM1B3SWZwaC9jTDZRYVVORFZsYVNNT0cxeDNpNDdIWnVKKzVMY0diQTZK?=
 =?utf-8?B?ZmM3RXdWYnQvaFVQUFp4ZnU1MlJqdWI3amRCT0EwbTBHYXFIN000bzZBYklQ?=
 =?utf-8?B?eTE3RkFCL3FaQkVEQThCSEQvc281cENpU0JGSXozdmVQSlNTZ3RtUi8xMGoz?=
 =?utf-8?B?UDJMeVVGbGZ2RzI2WDJLUlFqQTZweTNDKzlVT0ZsMitpWGx6b1l5Nks0czdM?=
 =?utf-8?B?RHRUblFFZHdTeHdNMko3SHVFa0JVdHAwWWJMemJtWHk2eDBiQnlEZGo3dkU0?=
 =?utf-8?B?c0wxemsrRFVxRjE1TEcvQlQvVmk0bmJaVmhyVk1sM0xLc25WTzk2SWdpdzNE?=
 =?utf-8?B?OUl6N0UyYVFSalJJdXpjRlJTMXVNWEVQYVh5aGFNcUpjdlBXZmxhMERnRnZq?=
 =?utf-8?B?UzBnYnZqOWdWV0RvTmg5eG9IU25Kc1hKUDQ4Y050SXpybVA5QzVlWkxnVm8r?=
 =?utf-8?B?MVduTyt5clgvbW81SlpNVHVpM0V0MDJadEdZU29WWWg3WHJ3QW9ZMnhSdjJu?=
 =?utf-8?B?YXQycHpDdXpuRDBnbHQ5eHNNeFo4aWdtQTkwQ05jSGtuUndpSm9qTU9kZTh0?=
 =?utf-8?Q?Rr/+zGoEjlXwS8aBxshu02uv5j4x0gI97h00b?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ea2cd37-9f20-488e-8bb7-08dee6a36032
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 21:10:50.2994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8EbiHkBcYf6CuiAJIqfUX3oniW+MH9B8P9aa+Z++jLlk2DAL0torQX3NBSkc9WN6AvruZb+TdjZXoTwFT7LF/yo3+Te2NDB4r07sUlXrIfaK9Zu2r4cTOIPGGPiEWVeP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10565
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_141057_211821_84A654A1 
X-CRM114-Status: UNSURE (   5.50  )
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

Add smmu information for usb and add hsic usb port.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (2):
      arm64: dts: imx8qm-ss-conn: add usbotg3 iommu information
      arm64: dts: imx8qm-ss-conn: Add HSIC usb@5b0e0000 node

 arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi | 38 +++++++++++++++++++++++
 1 file changed, 38 insertions(+)
---
base-commit: 3fe08b9796f36ef437ab9328e7dd1e5ff2d66603
change-id: 20260720-qm_smmu-417e915cb713

Best regards,
--  
Frank Li <Frank.Li@nxp.com>


