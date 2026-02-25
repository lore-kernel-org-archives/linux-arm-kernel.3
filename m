Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CDAFD45F7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 21:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gxNHN+S+k3xWClxOogfKn7JInRorLRhslyjVYvtEh74=; b=qn3wy2F8/mS+gxUHceY06KzlOM
	GGiwPP9FcirInL/AlRktJqlz1AyfLja4UbAffo+huQxdTveeGkE8NXoxsU1yJ0/7W6IgjndXl0CLe
	goqYp07M/EMrTVXo99h1ZdiQVknBwZG/59qefs8Y+mq+F+lTvjeGIy6Tq4eexnNQELozwPslEuln/
	M8Gr2HvW3KeziP7bWX2DyrKHg3fqTM/9OGmoBwfYQE9THlMpdUGtGXGTMe9qgKf2jqCkmiBDSCK7z
	s+rfESlmoKNBWjbp8svzC3bYUuPzgLdvMiG+Qvq4dI06DG+uPZzWrGDigunnjg+3cQThXEvkvWH/8
	XW2GJL7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvMdr-00000004vtv-19cL;
	Wed, 25 Feb 2026 21:41:59 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvMdo-00000004vsx-3hte
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 21:41:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Enj6MY9IsT2AKdSrkozikt5LTdprEKY9dgIyHnHOBtKJ5SVoeF4G6lBGAk/7tMCYV2B/PcqyW46kID49nk05+Olf22nW+2bW1JkKoLMpn3voMlGb9uxcN344ypTAyX73YPf2ud39DwYfN49enlWb5kWJlWUavi8Zz9E5LNJbo7l6iYy1Z4dRQ5/Yd9DEJgVCYlQuRDlHNlD23u1ul9Kdx4PAZs4iz5XxgdGQV4OV3oVIE4vlZNcabn6Vo4hxRd5UUs+3mrXIsf3ObJ565C956tPWp51U3VJJNFoX7vShwyx8WFVP4dJEFv+e2JWxEotjM9DDh+shhRqY2KD0ItT7zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gxNHN+S+k3xWClxOogfKn7JInRorLRhslyjVYvtEh74=;
 b=KUnHFirKQnoR5tjqgvRHjHdY7hsLRLDuQV2e2+oTy7DzeX16zcsOcGRqOM4+fUmjDBQ/KXekpHEvtnSBZUEthPwwtAX0Kuh96M+rCAEW/Co6Tb1jFkeIU3k6378x4Eh0h3jQbKOv5+XQ2eTeLo4lLizfNBPciSkJdH9JHCbeZ2/T10xyqt4tGB1wzoGVuizlYC6w+RYpiaqHP/M/1hGoy3A+0k7SaCoMLm//nWpvQJEQXh7FIBffUbaQo+Js6Myhk9oMQRSOydxEU2QzSF8X1KSfAsXoYkcAcMsgs4LNTcb/VlkfefobZpb+6x0QiUbr9qeLn3StilAIxllqTdVAGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxNHN+S+k3xWClxOogfKn7JInRorLRhslyjVYvtEh74=;
 b=Xa2vdzCbY33eYZLRbQUtfCXyl92cg4OpWYvdTqH0SAsxlNeRIj4myYWZbuKAHwbQ95pEvqFCQG11FnfTLqnZNP2DPgkm6MxwjbK3/1CmonUZs0wFdlC5klEsV8QcmxMj/QAghf2ambN7pGcpbPhICT0SKfJQidtAHmiITwXDRCyiB/sSO/1qTZ2N3XNjKCxYlHWnnq8XnLsstQGMq61xHbHNU0e6BdQhkx4rSWAUNKuqALk0FKhvF+Cdot1J3ruX07bVYFXOvCKjH4F1kfyyHSomqo6gJIeMpmSJhQW+B8WIYSIK3eUV9TvWQDPL3c1RkRhSzLqzaVRpHCE6wuLJQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM8PR04MB7346.eurprd04.prod.outlook.com (2603:10a6:20b:1d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 25 Feb
 2026 21:41:52 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 21:41:52 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 00/13] dmaegnine: freescale-dmas: small improvement
Date: Wed, 25 Feb 2026 16:41:36 -0500
Message-Id: <20260225-mxsdma-module-v3-0-8f798b13baa6@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJBsn2kC/3XM0QrCIBiG4VsZHmfo75LZUfcRHTj9a0LOoSXG2
 L3ndlIEHX4fPO9MEkaHiRybmUTMLrkw1iF2DTGDHm9Ina2bAAPJOG+pL8l6TX2wzztS7IEZo02
 rOkmqmSJeXdl650vdg0uPEF9bPvP1/VfKnDKqetAKtW4B5Gks094ET9ZOhm97+LVQLUMuRaeEs
 kx87LIsbzqIuLPkAAAA
X-Change-ID: 20260114-mxsdma-module-eb20ccac4986
To: Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Saravana Kannan <saravanak@kernel.org>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Shawn Guo <shawn.guo@freescale.com>, 
 Frank Li <Frank.Li@nxp.com>, Jindong Yue <jindong.yue@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772055708; l=2057;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=4obAHHvUGw4ZshMxjq0t6NlkbdbhSVvJkuEXcXsMeNw=;
 b=ZlUlbmxkxO90WxsclpCmIdE8h2jC02uJ3jzG2EodpzURM/0wpDV6Q6kABhscZ8flNcjhVSErl
 BUJyAyiWIoBA6mfURBlN6Q839v8NlXtrn0YCuCuw3yNj2ct8EgbLs5S
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH0PR07CA0052.namprd07.prod.outlook.com
 (2603:10b6:510:e::27) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM8PR04MB7346:EE_
X-MS-Office365-Filtering-Correlation-Id: 93ea4fde-2dd4-48be-b162-08de74b6afed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: eVA4/YZTzYoTWqPwuA8DoMHkLqdmR1ahV/SuVTtyKb63oSS4pJ4PaoVx0+LRnmUYqeGOr8tUyEdIAk8sc6zQ5PyKWR6qZSbE81tfjADopGnoiaGPOU+rkaRzj4IaGlnkkdv72805eBNR4z9hp+ORcBU6mU6QaDb/JxQTdfWf3bir1tDEok5LSC1BdTqRBDGYs/H2wi28DtETiMBY9wKOQa68oUkOlMKlfbyVP3D0QLeNBGDkcnM7lOrU+DYNjzmO1hDz699CEoT98UmEEXE5myLgA8GPNthMhu/WiF5awIq7QHRc9MTYDtUr12116yRNnzsgweshAs6zWUGLucsQBMpAZOHbby0/gVBlEvsj+PQIHqBXXhI4y2hnpQwrK8d4I6Eewn+7fg6l8LfsMXrliZ1PwXD4SMWtALJ3WL06LuOihn9GHQ8VPNdEao21Hvxrx2zte0Lny2CbgwC67zpRx4eCBRhpw4j0Z4EqTLSxM37pWMarAqnKwx8LeJrrxo2HjtDUAMPN6xcTAT1Z6NGX2h77QpY+3f/mciQyh4LPNJB6XfXclzXWOROMOie5CPwcfCE9UYBMIH+6Scv+wHilpeRHRk9/OasrwuAKRYm1pS7YMVJrTCbqdhMwIEBnAMF/72hjTVBPlpwpGgDJekf37y1zTsh5e7+sOxfH2fP2mtCpPfe6N9SIuJfE+eqtzd29OVfjzHhGN/msePYz3CC8hs4uX5/ojUbOHQwRR+btLtVQR6Sdk/+9/wwdnNSkCE/AST1mw4Xn6jW47gLAM684s7cE6Zy0Qsj+ohJNPz3SmHE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEh6dnRKSjRWQlBKeWdMdURvb1NIRU1NSzdHM2Z1dGVUWlMvNTZoQWNYT2xk?=
 =?utf-8?B?aVR4b3BHcERTTVB2WFFTeE9nK3grUHIvdWZlUFlKVWh1UEJWK1ZDUzU1a0Zy?=
 =?utf-8?B?RXhOVFhBMWNiWVJsc0lOR1RnMUsvaE5OY3JBY2NtdzUzd2RSbGZ3NTRPem9I?=
 =?utf-8?B?TEtuYnpRUThnYVd2S2gvZk9GTzVPd2FuQzBiWGRxdFlRWUI1MlJxTHF1Nm9X?=
 =?utf-8?B?RDZTdE9RL2p0VGhmd2tqUHU3Ujg4Z3NJNk5GU0ZpQmFDSUVXMjlhc0pTdXJY?=
 =?utf-8?B?Wjk1QzlxZGN3R2ovdU9WdG9iS2s5SWVGM0REZXgzdk1JeWpqTFJzREQ4S0VC?=
 =?utf-8?B?VStNMzlaK1VWTmd2RGg2UnExejZNbFEzUHJkaG93LzJXcEJqMnhnYXdQWWJU?=
 =?utf-8?B?bkExRmdVS0Q2M2IrbmtNVE8remF4YnRSUmdxNUlIZUtFVW0wNzRndlBmNEw1?=
 =?utf-8?B?VEhoWnFHS1lkSkhsaTd5UXlrYm9RcmtrTXBVcVBwQmlBSzhYbUNJL2k3Rlov?=
 =?utf-8?B?MTBhTzhEMGNFczd5QXlXK3EwT0F1TmhpMFdtMnNOZkI5SnlJcEZXdWFkTHZY?=
 =?utf-8?B?Q0owMzBGcHE0Z0N5cnZYaEZ4VGJOcVZiWUd2QU95TDMrSmJsZkF5VFBlWTRk?=
 =?utf-8?B?U0xtL3IwT05NNFh0QkZtT3oyVnJQOVhZeUxEYzNmcjZza3pReEY3U1A0UFF6?=
 =?utf-8?B?cTB1QVU4ZkVPK3kzeGU3My85T25WK2lKVkV1TkpPSnFPR2FmbXVEWmlIVHNF?=
 =?utf-8?B?Uis2SjJ5N0FkQlY4UTVuWDdHb1JGSHFyN1I5RDFNQ251SExaL29BUFI1TUFY?=
 =?utf-8?B?RG5Nak1tc3JKVUpFNVd3d0htQy9MNlBjYVBZWFNZK1Nhc1Z1Q1RPYjQxbDQ2?=
 =?utf-8?B?aENmTGZFN1ptR0YydUJVaXJaNGI2OEVDODNSQkpzNGp3dm9PWVZVek5PMERu?=
 =?utf-8?B?VzF5V2RlWDYwdEpYclBwMWk5aFBFM29Cc29hYmc5MzFHVGlhUVJCRUNuSUVC?=
 =?utf-8?B?OHVLUy9XNGh6WmxXY3U1L0VOdytoMFJzMWUwaEtNeFJySndBdndtakFsS2xC?=
 =?utf-8?B?M25OT1FobUtJaHJnUGR0OHlsd01VRUJKWVhwVG1KbEdia3dRU1RMem5wa04r?=
 =?utf-8?B?aTlJYkc0Qi9IY2w2VWRiSVlXZjFqVzEyWU1sR2NuTVpJekRFektJdzNBa1ZV?=
 =?utf-8?B?RGE1L1p3aEJDZFk4N2pMdEZvaGs4V05nREpBTTk2MHZZb2hvdjJxYWxZdkVD?=
 =?utf-8?B?Rlk3UFE3SFFkaDFMZVBEdFhEd2lXUlZEUTdnNCtDNkJ0a2FaRGhtQjJLdEQ5?=
 =?utf-8?B?ZHROTlQ4UVVCbnpRT0tXUHowZmNlMmF5bC9HN21PODBWTVdxMy9iT1JEckJo?=
 =?utf-8?B?ZTFCY3Z0a0NjMTJqSDRtV2dkWS9XSEtrSmIyMlRDNnRYMmM4V1NQU2ZQZG91?=
 =?utf-8?B?RGI0SkxpbHYyL2NDWldrVUtpNFlwZlJXM0tGYUxOSjdTS1lvbTVIbGZQUFhS?=
 =?utf-8?B?Y0Jxa2tXVXA1YmYxUDNWaDkraFVGQ1NFQ3pJWk1IR3kyaFcwME9rQ3NVaGtT?=
 =?utf-8?B?ZFd2aXJLN09uSHFJeXVNZHcyMEpPZnFSZHhaTXBydE1MZnFsU1o1dUthK2l5?=
 =?utf-8?B?Q25ReTVLWHdyTHNVQjExcGJUZEFXQ3ltZnBENll3RXVGelp4S3hWTjl4NDZT?=
 =?utf-8?B?RnBMVGEwL0xYRnZEdG96MDdHbmlhZmhsc3c0c0N3ZDV4bnpoSG1GVFRPWm5o?=
 =?utf-8?B?UVJaOUR0N2FWc2M4RzRyMXZrZGwvdXFsZ2lrQlRYbkRjdkhsSjI0NkV5SUFj?=
 =?utf-8?B?RmNsNzZlaU9oVGFBampiVFlDWTlKTWZwSU5GZk9zcGR5MXhyczNleDl2NXNj?=
 =?utf-8?B?K0ZZQmZtV2trTUk5Mkkvam41MlVjaDMvOXVqQWtoRkFROEpnMFNhL0c0Wncx?=
 =?utf-8?B?UkRDNWoyMUlQNEFNcU1aSnBoYkZ6ckZ4TmM2Vll0NlRFV0JpY2R5NjdaVUhX?=
 =?utf-8?B?Q3NjdXdKcDR6VmhjbFpSZjBVTE82L1pUci95eE05VUdzZnMvNDgwMmYwdU43?=
 =?utf-8?B?ZXhoU3FLU0dkQnQvbVNwalU2VXdiTXBNYjJONHRDYnhGeDNrWDlKN0txQ0Qy?=
 =?utf-8?B?ME02dHZwZC8vZWRmbTVSRUtkS2tkRDNISXdCNFllZ1RYUTBPQ1hjZHJ6b2Ru?=
 =?utf-8?B?MDNXbWkrb3p2VTlJN2NwT0YwTVB0N1ZhWFJqQkN6RGNLaE5WbVo3RGhrb3lu?=
 =?utf-8?B?aGplOVdhMjNpQnExUDNwN2o1bmN6N2F6alUyOE1mcmwzd3VEdm85dE8yK05K?=
 =?utf-8?B?VHVjVkk1N1pac0I5dHlMTjlmRXBGQ0FCWC90QTdqdFJsd2JBYTQ5QT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93ea4fde-2dd4-48be-b162-08de74b6afed
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 21:41:51.9515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NzTcT0n5j/N7HoGjwjx1yJDgaIyKy4P9JeqC/BiLnXTYSSll7QneMrc4hwFyaf3854VaTNRUsWWAfIzE1BDtUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7346
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_134156_927603_1D63A9C2 
X-CRM114-Status: UNSURE (   7.37  )
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

Add managed API devm_of_dma_controller_register().

simple mxs-dma code and add build as module support.
Use dev_err_probe() simple freescale dmaengines.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v3:
- rebase to dmaengine/next
- Link to v2: https://lore.kernel.org/r/20260115-mxsdma-module-v2-0-0e1638939d03@nxp.com

Changes in v2:
- fix missed int at stub function
- reorder patches according to dmaengine
- Link to v1: https://lore.kernel.org/r/20260114-mxsdma-module-v1-0-9b2a9eaa4226@nxp.com

---
Frank Li (11):
      dmaengine: of_dma: Add devm_of_dma_controller_register()
      dmaengine: mxs-dma: Fix missing return value from of_dma_controller_register()
      dmaengine: mxs-dma: Use local dev variable in probe()
      dmaengine: mxs-dma: Use dev_err_probe() to simplify code
      dmaengine: mxs-dma: Use managed API devm_of_dma_controller_register()
      dmaengine: imx-sdma: Use devm_clk_get_prepared() to simplify code
      dmaengine: imx-sdma: Use managed API to simplify code
      dmaengine: imx-sdma: Use dev_err_probe() to simplify code
      dmaengine: fsl-edma: Use managed API dmaenginem_async_device_register()
      dmaengine: fsl-edma: Use dev_err_probe() to simplify code
      dmaengine: fsl-qdma: Use dev_err_probe() to simplify code

Jindong Yue (2):
      dmaengine: mxs-dma: Add module license and description
      dmaengine: mxs-dma: Turn MXS_DMA as tristate

 drivers/dma/Kconfig         |  2 +-
 drivers/dma/fsl-edma-main.c | 55 ++++++++++++++++++--------------------------
 drivers/dma/fsl-qdma.c      | 47 +++++++++++++++----------------------
 drivers/dma/imx-sdma.c      | 56 ++++++++++++---------------------------------
 drivers/dma/mxs-dma.c       | 37 +++++++++++++++---------------
 include/linux/of_dma.h      | 29 +++++++++++++++++++++++
 6 files changed, 104 insertions(+), 122 deletions(-)
---
base-commit: 9a07b4bb2c6019a8c585f48ee9b87fc843840e6e
change-id: 20260114-mxsdma-module-eb20ccac4986

Best regards,
--
Frank Li <Frank.Li@nxp.com>


