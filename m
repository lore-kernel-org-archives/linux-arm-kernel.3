Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D1FCA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 14:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e/3dSgI4BC74K6QSoDxbgCq7tDlDQi7cqPEUZmuWySg=; b=eVuK8ABqZvwQrKjEhse5mD+yHv
	iIlUE2fSj2iEBgG1VXMZ8UpFf+K6thg3/Y+j7vJ7QvSk3kaH38L3cd1B2kFeOkoS39s9DT8w4yYIB
	qhlR3AtP4vhT1DbL46GHsTUM6Fg/OjU0qhwuYUZZCUXbYlSi+MsQRpOpbN/zLmvdKgEgxEu2UaxR1
	wLDv9nIo0xJJmcvA6uzSt4SYD5a/PwZOhSUsbwABpVXGRM6OGcWfCvNPGzyWgEaDphrrF3DdxowcE
	yp19bsOwhOrBIXcN9PL7lWoI5srbWqTTqmB84ocoHJV62TpZvqZum4mnBjaXzFKANJfFp9mm7EJHE
	YG0tImgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHzT-00000009QPI-1LKS;
	Thu, 01 Oct 2026 14:42:31 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHzQ-00000009QOe-48TR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 14:42:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OxnbR9a5c13lI+gc0mjD1vyiDiEM+8JlUqidtktAZQTSitbKpcShc5z0fI5GadXLByvk9cNfW1MccNyWkBkmnDERtzVZ6Gjg1pnrijWaPMwGC9bKnBLxJOL/jxLKBL8bjXacqdf89Zp3xoQhvbms4A80nN64avKXYnlWJwTvCqkYa2YU2YQgLN9epIvZvcXnx8fXJOu913RNyAjZJ7ymhQDqmzmZsZOUawMWmhd9h8qlKasMLdf9HsclDHkR9fwRSYNMwDQReODDjno1bDOKj8pSmXnuLjQhEnl0r+KT9PdhJtHx9lmDuC0rnUaih/7oko4j5n8mqQFqByiDPSM9QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/3dSgI4BC74K6QSoDxbgCq7tDlDQi7cqPEUZmuWySg=;
 b=XgAYs0fvuPum7i/XisH05tDbKwpTaMHXE1XH24/S9mQpVOHhx3+MFMlbuXUotwFEEYmcaiE0FM30c0+rAAU6CKPhFBM5zA/kYx0xA0mnCD4L3gPIETborqQCgcbAeecLB2lSw1ylYTGPqGqMaXsQaTVfnAjS+IcN4ZJPm4megrx7cdUV6k/Lvm6WngHI4CdiQV086bCG1FkakI5ssXwUeWakltwvV7BBRtNlVSYtCg1HUxKT9Qu2xDldoPKPjw2wpRauxysT5veHJ97lEstWUzQOgNVRFg4FC4JdVQxM+AXHdmcslNf6k5mMJj0GIPFa9k347TI5VW/4DBh2bNzPyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/3dSgI4BC74K6QSoDxbgCq7tDlDQi7cqPEUZmuWySg=;
 b=BgdA0zihsFwNGVZkR9Q3TVFO3+I205Rh0kx3+fvkkIwUJH3dnI/B4Upp3eeu587VmWTAtlzkKxmjP8C04Hl16xz/8VsDvEP9UUvnevBd/ekIeS8xV1S5PiaguO3sf5NbxWJ4BkDHonJdUmZ6W1yyu4LjB4RBtLatigxQws9vtcanUZMMVwubvCCW/D7nClyBNoN++Ej7W5SLlzswMSXs08BVHaLCJtmR4saF0f+EuwWhf5gyPuFBEwDI7LRX5YCYNo4ReM6SIALGmamC5VLBtuYlAB99tdIJ2pDHXPv7PjzrqZuxTSoaGAuxKKNSUfPwIcfY2P7IxsvEjDxsAcheTQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBBPR04MB7657.eurprd04.prod.outlook.com (2603:10a6:10:1f5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 14:42:22 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Thu, 1 Oct 2026
 14:42:22 +0000
From: Frank.Li@oss.nxp.com
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: freescale: Drop undocumented "hardware" root node properties
Date: Thu,  1 Oct 2026 10:42:14 -0400
Message-ID: <179086572692.2197464.12213743205772196489.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001011233.1306251-1-robh@kernel.org>
References: <20261001011233.1306251-1-robh@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P221CA0050.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBBPR04MB7657:EE_
X-MS-Office365-Filtering-Correlation-Id: f3a35d0a-2bc6-41bf-bad1-08df1fca33cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|376014|1800799024|366016|23010399003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: J7Qappeg9Ar9I3SC0o2Y4gfRuB3L+3HQkZoIudY2vnjvRU1hGMW2i8FVcNFLDQnpqZsjtznYuHLBzwvaQ5lJ6hoXum6L6gvtp+ZtJeXwQKeuTy0bPk17XDuCe4bxo03+6GJJH0ZAXZQ5SnKKTKDHAVXT3bPNWwEXCEl6viqNzPxDuyUxerX1TyFRVt4FTHhKdXqqOmQvwwius0qlKsQJuLw7vL335pTLGPv4uf7S+3wY/cjefs25EpQlUO4eHeKY7GIC4G6TKRcvO6KkO2sgG72ISRGBn0fZLyxAwM1nd9fJQ/CVt0WjkSt6cOsFfww8z7nIC71pnoZbrZnQLdjugyRxLLacZpCaPnole8VgjhuIn9/oJzWDwCZNhXxFMpI5ibcYuHSvgRvhAf79Y16dFuzD2CfhUTgNYkSM0XmB3eEIRXJd7GB4d4jgNi3IhgvZoz7rFtRTVgyqWWm2legnpvwgJyqxgsdPk1kJGhohBb0Jz7U0hllYqjMWlHR39YwbO/fUf+3GzscT8Y71SzgcGPu/JBepeAqC+1cI3FC3sVQkyf2/b1nS53KlgqdoK2AWiLGrc0LsgQdfExF/GvMbV2wmuyPwHv2EcsNXw1f3edP5eH1dtWzWQ0RmxN+8eoSFGRA2z4wi5BmcyMR4mBdZ7EE+gNcbBt7oRs94bYjUthk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bk9VSUlwTmwxZlpqWTR3cDhPNmQwY0RqaUtCK0g4MGxJQlROb0NYMmtVTnZ5?=
 =?utf-8?B?OS9ZS29zWDUybjV1M0w2ZGp0RkFYcERlU3lCb0gzYWN2LzdXL0dZcUR4U3hH?=
 =?utf-8?B?emVJV3NDOUpqRktScDNLVGExKyt6YU9Way9UQVgyRWdMd1g5MVozaWI3cy9N?=
 =?utf-8?B?eGdvUC85QUYyOFF0VHZQOG9rakh5MkhtKzBHdFFEdTM5R2orY2pPVnh2ZWhw?=
 =?utf-8?B?QkxZakpFd1liZW1pN1hZWlhNK3NnWFBmcEZ0Yk5raE9TYnBlQWFvVWlFUXBC?=
 =?utf-8?B?WkNvdGxoTlZvWHZVcnBEQlBUaWxhUHpuelFpdkovQzN3WTZLUWZ3dndnQkZo?=
 =?utf-8?B?em1aVHZXeUdwaWQwVEo0U09QMCsyQmkzRUpCcVJCMEczTThYdGs5ZURKdmpw?=
 =?utf-8?B?SHhrdGNuWkM1WU92by9vK0VGVlk4cUlqM3UzeXdSVlBQSmh6NFAway9ocDQ4?=
 =?utf-8?B?b1lWcHFSVEEvbDNRT3VPN1J1U0JHRkFuQWRnc3RlR2FKWGVsMkZCaWZ3UXRy?=
 =?utf-8?B?Z280a2VDUkJKVlU2MFlmZXd3bVhwWC8zTkF0WjBCS29hK3EwNzVnOXJlNzR2?=
 =?utf-8?B?SWhFV2VDV1YzOXJkZldKZERUUTJQWklrUytTejRBZG9IMVk4U05CSjRTcTln?=
 =?utf-8?B?Z3F5K2pIN3laL2lGQXFObHQ0VW1SRGhmZFpTTDZieVJ1VGwyRTFZSExpd0h1?=
 =?utf-8?B?Z2xjb2tnM2p6Y2NIcE56aW13V1JnQzdPN216RnZzdkF5SnVLOEdJbGc1TWRo?=
 =?utf-8?B?Z29oZUJydzc1UlJkWHl3c1RxTDYwVVhkeTdYa01wMnNaMG9KZkRpd0RnbkRN?=
 =?utf-8?B?QU12K2NVZEhpeHJSMHNnV3FCMjcybXZCL3dhenZEM0tLUjNiR1VmNXV6Q3l0?=
 =?utf-8?B?N3R5U21oaWpwSkxMZWhYNEhRdnpmOHdoSTZFTkJZaFhjRXQwME5jcHdHY2pj?=
 =?utf-8?B?RUlwam1UZ2hqMTdkVDZjL2tuWmsrRXVoT3puMU56OTVDT2tLZVY4RGxlSWh4?=
 =?utf-8?B?QjJIdStxdlR6TVlNSTVRT2tMV3gybGNOTldFMVZhOGY4SjV0TXQ3V3B4VWx0?=
 =?utf-8?B?anMvSGJ0SnZNbFlWclRDOHpQRElKRXprbmZXUFVQMXRrUi9LdTlVcERBV1Uz?=
 =?utf-8?B?S05mL3Jad3pLL2ltOGpYa09kc1h1K0V6b0lKME4rWHFRNmVPdW9nWGZqNTFv?=
 =?utf-8?B?SEZydzVvRHFGTjZuR2NPZUsvdFk4eG1EOFdVUllHYlR0L2w0UjRJL3JCbDBO?=
 =?utf-8?B?cWJPNXNCOFZFMnBrWkVheW4zYUtoRG5PWU1udjhRZFBYL2xkSVNiOS9nWjlF?=
 =?utf-8?B?dXBkYzJybW1VZEJ4eXJuQTJ6KzlrZFBRQURIWnRMU3BmT1FVdTRYL25iVzFD?=
 =?utf-8?B?MzdKeVY0QXFvV1gzaFVFTkk2VjNDVy9MYy93aWpBcjhYUHcwUWpDbHR4Mk1Y?=
 =?utf-8?B?RVF1TlJ6cnFEbW9TUCs2bjBoeTlqcjZOM3ZPdkdFdXJBMnREZXFaNVBjR1lI?=
 =?utf-8?B?ZDZEMml2dkxRZnZ6S2R1YVZDUzBFYlh0ZnRQcjg4UmtoQ2tYamdUZnQraGtG?=
 =?utf-8?B?NjFzb0JOWlc0MzdZVXVuUW9VblQ0U1RBako1N2wwRUVZUSt5U1dZSHBLYnNZ?=
 =?utf-8?B?RHFxR2RMaFQyQjM4S29KWkFFMzFEQnpoUXRWOFRTSlprSVF2U1hXd3JlQU93?=
 =?utf-8?B?TmFoV1pLOUF4VnZrSDgvU3VQRFpCZzlHT3QraTU1a291SWFiMURNSjdJQjRz?=
 =?utf-8?B?dlU0MlVQMjNUTkNGazdiL2RidDB3ekxIc0N2dUdaUW40WTVUdUZKZTBTcUw2?=
 =?utf-8?B?OHh2eGlZY1pKQUJRUmx3OWwyRXRsMHNFSkRUZGtXL0lBSFlISkFCYi9Jd2pC?=
 =?utf-8?B?QnFxZnF2Yk51SVFzaG1seHRKSWo0Ty8zVk43WHdvR0FZY2pVaUdDdGwzbnY2?=
 =?utf-8?B?cTljS1dGRjBZUHpuUTNaRU9ld2FoWml3U2hxcFhSa0daT2hTdFgxN0p1NHhL?=
 =?utf-8?B?Q2VlZ3RhQ0JvcWFEMm9QVmJIZUpQWVNFRUNBbkF1Unc1Q0k5WlN3R0RYRENI?=
 =?utf-8?B?TGNqb0RLZTJNT2Y2OVRaRWEybk1xQStGQkNvMHNNS0xYemJVb0UwYiszTUww?=
 =?utf-8?B?Vk94WDVXbGlJcEpTRDFxSzM2YW1rbFF5VytRWTk0elBRSktXN2JvRTE0bDhk?=
 =?utf-8?B?Rzk4MjFRNlJWL0FuRHdWaW5rTUxDb2dPSjJERUNMdTFRRS9YREdwdSt5UW5Q?=
 =?utf-8?B?WkNyVVAzcE1NUjdQcEpETk50YXhUTks1TE9CeXQyRXJtb2lRRlpHWHM4Z3NB?=
 =?utf-8?B?MkU2dVBrbWxMWGNWZkNpaW41RGozZUhaRTFobW1NUkRyT25BRC9YcGlWNEFu?=
 =?utf-8?Q?uCtmg6NEZVhcYU070+DO6jUM5hspQlmmOFrtY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3a35d0a-2bc6-41bf-bad1-08df1fca33cd
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 14:42:22.4519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uAJ3OcyoFqrPF/crEUkrve6Ay+KnUpKhvTHJDnqT4wJZYXElwBljqPhmcCxnzIy0WO9u/HgSBdATN0rr291eq4jp0fBzmcZBagoX6Y3Dp4cP7Gz36k6zONlLGxz76UhM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7657
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_074229_027387_9F527F89 
X-CRM114-Status: UNSURE (   8.16  )
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


On Wed, 30 Sep 2026 20:12:31 -0500, Rob Herring (Arm) wrote:
> The "hardware" property in the root node on some NXP i.MX8 boards is not
> documented. We already have both compatible and model property to
> describe the platform.

Applied, thanks!

[1/1] arm64: dts: freescale: Drop undocumented "hardware" root node properties
      commit: 20bf6ef705df9d57169f110fd49f37d2fcecc311

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

