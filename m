Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE997CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 06:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eKqSWk8EWuER51J41YRDR9pHXHGy9IU6tf6fJZ9baX0=; b=E+cUmaxyqh/NawP1th7xyulOn3
	30ReGI8cHaPnUiAXZYf1AJqbUYWrZgJyCB/1TQ3VkB5klbygyFeDv9n5BMoIj73LkYnFK0USVUZnE
	d0jqDsAoJcPD2B+gHn7w1zQ49lHpcFpS0ndoqshnUIBrSZa/RMs29upn7QFz+w8vya8Hcha3EAl4l
	MF/t+7zPP0P08IdXHX5q3wFY/bvgQ60IjWh8ktDNUzLuHgw9xOxgI5UTQZB/ueuePnr2LXYm4oQlk
	q0lvKAIXsnxlcHCbCXoZ7aw6W7/SmhH/VibuyAquoUMdX+ZqTfkBLzi/tznRVAFJRybW57XZxGVs+
	QCZlG1Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOra4-0000000ERgn-37g0;
	Mon, 18 May 2026 06:36:00 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOra0-0000000ERd8-2189
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 06:35:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJPxqnlM+e+x3XFG4w40u9I/Ci3HH4M0mmAWdyNXXDDi0o7Z3q2n/KsQl5i69P9P6CoZWlvuuMKv/wvNzgzAgO+5XZQyyYNsNpCPCosOrr6PHu77Z5fDFS59NhvNbg8WrTz0FMagNcb/mCO/1B1Lo2VPkxymwzppX65A9+9qrDn8B+Pg6J+g8QWDVOaHERIhN5PdmHrwssfq7V1uaOU4duElG+HlieOs6xgy0fsmo1gziy5vx7n8hDBKhH38V2eny0R+aT7mi2/U7ecMA5fQcHK+UtMpUG7PkE1rE8niT4Uj5V4y4bhRtC8wA33qXbmSJwXyuF580GoHlnGX1vC7aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKqSWk8EWuER51J41YRDR9pHXHGy9IU6tf6fJZ9baX0=;
 b=dkj8wDG4PMBbnonrqy+pebx+3km7BUEH3eHKndJLqhnvN5oquGaad5m/e+o2yh/09NW1a0wxb3bJS9+N5k98FxAGjRcQcMhgCuRh9rnfCjrdL5j3Z2jiyQbhvNbhnWRng/HsSnnsDbunIO4AEqq2iz+LAiB4de3FMa3iDwg4DQU+7277NENsbuxuYcyr+iIUKYBKHqbo6Rc6wqHJPbpVL1umZc69k0Is0ezk2c9jbz035kKxftimSV/xk6y4sTeaGoMZLetZNDtMm6YAVwwwnk4IzrL7jZSvHcrO8i3Eov+3enU14L64dAI0EfSUoDQ/Gg1qTPPS9Gw4f/CtfSp29w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKqSWk8EWuER51J41YRDR9pHXHGy9IU6tf6fJZ9baX0=;
 b=xz8AL2zaeE95gshVUEQ6hWU8dGEeS7pAkDDiSiOCUjlJwGRInIxdullhbQSlObbbKBcHc9znzkNA8D6okBhpUt1PU66LTJsbtemYWfeYlGyqAwPdKY7NP2yaGHqpTtuhYfF0ht4vb2tSXuVZprMYGf88Wcfqswvh930aTMQvGGV/EmvHwI+GkhtvAgcKE7sFSr8macNHgZJhJVZxmVl1gOFC1PAK04u8JKludH5vh23TDYlaA0bG/AQblhPUZdq1gIxlu1r+zd7/RrdHVMZuiv0J/oqb1hSvlDzzHKNI1Qkj+2EPYQqOgQuq2ntO91Kt7hVhui886TgYo0pJ8MTIPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8190.eurprd04.prod.outlook.com (2603:10a6:102:1bf::23)
 by PAXPR04MB8093.eurprd04.prod.outlook.com (2603:10a6:102:1c9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 06:35:52 +0000
Received: from PAXPR04MB8190.eurprd04.prod.outlook.com
 ([fe80::4608:7dcb:899b:e4a1]) by PAXPR04MB8190.eurprd04.prod.outlook.com
 ([fe80::4608:7dcb:899b:e4a1%4]) with mapi id 15.21.0025.020; Mon, 18 May 2026
 06:35:52 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: [PATCH v2 1/1] arm64: dts: s32g: add PIT support for s32g2 and s32g3
Date: Mon, 18 May 2026 08:35:47 +0200
Message-Id: <20260518063547.2890353-2-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518063547.2890353-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260518063547.2890353-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P189CA0015.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::20) To PAXPR04MB8190.eurprd04.prod.outlook.com
 (2603:10a6:102:1bf::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8190:EE_|PAXPR04MB8093:EE_
X-MS-Office365-Filtering-Correlation-Id: c8472d5e-0b46-4f0f-710a-08deb4a7b4ab
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|376014|18002099003|22082099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info: z6pWr4seb+kkBJE7rBPkjo8Pu/AueeU4KSmYi4Hx4K8Z9SSmV1MTULcO/4PsgfWORP7/9fsgrdR0qETHo+pXynqP5dvM6Vo82JlxWrbCyrp0044Du0FaCxojnotStmfNPyPStduF0/SEo8LtoNkss/mqc80y0NxVxouqlrF9zx+OmOpPH77/my3E59ZhZiqfOXXfZgvY3+gRAVdeKwrrMD02p5KaDw5h4Ot6rYY1+Y04f7+cwRLYNWA79TWdNQcfAnbIBzZ1PgQnJFQ3X701532iAjzgQcBgKF3WUgu90C8umgMYDDRzXdPcFI/7PGHkHPgzd3py4SIxaTdb9U+GX2lP31fiHVDsmk9lwKX9h2cXc2TMsLEQgYTxYlYkSoGr2/9lPgLVQfrgEvrUalY+WEY3TQTWSBpcWZKCrtDVi/BMxfVp3Pk57roSqzofJxjVqxtvtaH6+pUYsyBaZBMTBEAs7LikEUaaXcrpeSiSMIO7Q4N8d+nw7jGeUUucD8FaWoPvr+wDjhbX4QDBqFr/X7tNi7XqhvvAovre9Udn3yhPLt+uulvKggU0fRZdvxzio8olYuifBfdVhakc4LMcRWp4+ujwLBv0wQ+xbt6S9VUW8IQbFY1z1P4TDT6mi3kyT0zjvNQNEx0Tf+4IDAeCdlagDRkZ/Kgtdi7mYEXzz7Kdz3V3LCgtG4MoruXHT2WM
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8190.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(376014)(18002099003)(22082099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzR6YVFRTStaWWtvbTI4WFIxMVBnQWlPV3lRcTlUREw4czV6RCtJTkNrRmxp?=
 =?utf-8?B?MUoxVUZKYkozVGdnVGRvdENCWDlpb0E4a1FHTVk5U2szc0xuNTRlZTJqZzU5?=
 =?utf-8?B?TmRuYUI1dXFsRzB0SUpIdHV1YzB3bUo5c3V1SWt2VUdOK0l6VkhpV1FJTi9w?=
 =?utf-8?B?MmI2OThvZFVON2dsc0ZtQll5ZjUyOFprSmJvN2luNStOVUJtQ1BvcFBrR3lW?=
 =?utf-8?B?VFdMa0lRckxCTXVTbENtdU04amNJeVVnTTF5VUMvUWhrQmh2aEw5c3hXSVVw?=
 =?utf-8?B?UyszdFJHNGhDTTU4VmJScm1odEtab0h3SDZLbXkvdEpkR3F0NjJ2U2IxUHY3?=
 =?utf-8?B?aUpGWUZyYURyV3gzL0pBak1QNjJTeXVkWGNvVU5tYkdNWU8vb0d2MGllY25o?=
 =?utf-8?B?RmR4NFlUekg1VWxlOXpVb3l0UlJDZWYrZVhuZW1GNmxpVmR6cEdLRE5hQVFR?=
 =?utf-8?B?MnZ6c2c4Sm5wUGFyYkdJUlVRak8ySUZINEdIa2N3UG0wakhGRStZU3kzVGJZ?=
 =?utf-8?B?T0dyc3ZmWHBXb1VNaURKSHZrd2YycEJWWTNQN1NONGFUbU5XMHovbHM2Z0Jl?=
 =?utf-8?B?ZjJQNWx0ekx0WDNmVDIwVHVyaVpaOFZVTFFQdG93UFRPY2g4UzdFSnAvQXhG?=
 =?utf-8?B?eEl3MUdsV0ttV29STmk1T1ExRTFUVXNLN2RZQndFU2VDR3ROdlduc0tnTHF1?=
 =?utf-8?B?YTdta01KQ0o2UU14VXIrMU1XSWhNR2pHTHdPTjNXYXhzd3ZaNkkydXpxQW5k?=
 =?utf-8?B?ZHU1VytKTUh5TGtBa0VycFBEcms3MHBaalRuM3pDMzhKeWdPWmJYVHBWaGVj?=
 =?utf-8?B?WTRDSjIxNkxhTVJRa05CV2duTXoydE1WRHAybERyUkRhYU82QkRaL0ZXdkNa?=
 =?utf-8?B?cTE2ZXQ1Y0NwTndGY0J1VmVob1M0SjRTczVzU3BOMW9JN0dLV1BWOXRRc09U?=
 =?utf-8?B?UlpMR0FKS01lN294WjRRTE16VzdHeU5OMVhXZ0Y1Sm44aWI1eWZnNGE5cmNy?=
 =?utf-8?B?cnVXVkJ5eDFqVVg4ZjRIMGpYN29XZXloaFJBeTZaeFFRRkN6MU5RUzJmOUgx?=
 =?utf-8?B?bE1tYkZBTURPbmFGM2d5MThJejJaek9OMHExMWh1eU42UXJJSS9XM1l0a0Q3?=
 =?utf-8?B?T2dZUFc3S24rNVNpcjV6cUpLVXM5aElDY1ZWRUIxNkgwakRERTZHRi96V2dH?=
 =?utf-8?B?TXBzZFd2Z3JiSFNFVTNvN05CRktOZWF6VEx4M1VISnVmYjBPYVZKbVlsMFFt?=
 =?utf-8?B?RlhOUENLUFEvNDRPMmZDZytvRERuRGJyd1daK0NUbUlqV0gxamcwSTgrZ1Vq?=
 =?utf-8?B?UTZJUGhBVThraEpMWVhVNTJlYkJQR256ajB5czFmMWZnQ0ptVzlhcVA5Q1Ey?=
 =?utf-8?B?VkFBMUoyQzBrWCs4Y0xmOURRdlVLc3FRdmk3S3ZjclUzM2tuaXh5alRlYUZB?=
 =?utf-8?B?NzJDcHQ5RlkvVldYUk1rRmdLbWhIRXRZc2RqdVpHQjRyNTk4RkR6Yzl4a2FF?=
 =?utf-8?B?N0Y1R2pGYzQ4ZVd4MnhTcFlUMCtCWmU3SHpMWFJnNHJXc2NNQm9aR0pPTll1?=
 =?utf-8?B?TFFKSEQ4cThlVkhsSzJTMi9uQWh2NitFbUVoTm5jc29PbmJQcGNhY3FwZ2RU?=
 =?utf-8?B?V05lMmhnb3VwT3FvR29lZFBPTVlRRHhzbER3aTFkSlVWV3ZTd1pkeHZjL2JJ?=
 =?utf-8?B?UStyeTJOR2E3Q2Q5ajZEYTdCY3Fka3dDOHQ2QWZNaXY2Tlg4WVdEd1ZLdEpQ?=
 =?utf-8?B?TVRjVXA5NEdPckl0b21OUnVTK0lLTkpQYitHZndvcFR2SkxjQ01nTkYzT09K?=
 =?utf-8?B?TzMyVjN6cEMvbDJBaXREZElpQXM0NmMwTWM5elUycEN0THZ4TWxWbVJOeWdz?=
 =?utf-8?B?SlRTQll3ZjRiZVdDTEgxaDY4YXJ6SFlNYnhtVktBaFM5KzBoNEY0cGR5K3lw?=
 =?utf-8?B?V1lWSzhrM1pOa05aRHc2U2J2RlpldnErUHJWTXExVEMzZ3VoYnpvLy90aUZM?=
 =?utf-8?B?b0hZcC9pV01YeFNQU0kvZnYzdnowUDA5cnNGdnRCcUZZMDlYYVNiU3FWV05t?=
 =?utf-8?B?Nzl5ZlFuRXRWL1VkTDdkbVNBUkRIV1RkRlovdU9WTUpVMDFmWWxPY004bzVH?=
 =?utf-8?B?SWdiV0RsY0kraG9xam43UU51d2g1QXNhZDhWZnR3ZEFjOTg0ek1qemtyQjJO?=
 =?utf-8?B?SU9OWGRsdTVtV2FnTEg2aHpwR1BNNSszdEQwZ1E5T0VDaUtJOC9paGtlbVpS?=
 =?utf-8?B?dUlDbVpEMUs3QlE1Sm1KdVY2bFUzcDJvWUYxb05oMitDSldCNk9wVXl5Qi9w?=
 =?utf-8?B?S3lxVjBzWi9hMEhnV1krbFc2dXRVa1Y2djBvanRKRWI5NDkyK0tVaURNQWJy?=
 =?utf-8?Q?SIFSSejrivHj1iBGHw7woHNE8YDmcQsE/mn9w?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8472d5e-0b46-4f0f-710a-08deb4a7b4ab
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8190.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 06:35:52.6677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UdFrNtypxN0KY1PFrotC+cxUTwpTe2YWB/kxhRbOtdd1y/rB9E6sVg8d7BG5YgZmB5uhiWqgmq0vfe4yrUUO74DsOy6HRa78eQnXn35KQBCkk3o+CoHVOcm4ezCkXg8G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_233556_521205_C61E5FCA 
X-CRM114-Status: GOOD (  10.84  )
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

Add PIT0 and PIT1 for S32G2 and S32G3 SoCs

Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 20 +++++++++++++++++++-
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 20 +++++++++++++++++++-
 2 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 51d00dac12de..57ff97e44507 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -3,7 +3,7 @@
  * NXP S32G2 SoC family
  *
  * Copyright (c) 2021 SUSE LLC
- * Copyright 2017-2021, 2024-2025 NXP
+ * Copyright 2017-2021, 2024-2026 NXP
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -417,6 +417,15 @@ edma0: dma-controller@40144000 {
 			clock-names = "dmamux0", "dmamux1";
 		};
 
+		pit0: pit@40188000 {
+			compatible = "nxp,s32g2-pit";
+			reg = <0x40188000 0x3000>;
+			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 61>;
+			clock-names = "pit";
+			status = "disabled";
+		};
+
 		can0: can@401b4000 {
 			compatible = "nxp,s32g2-flexcan";
 			reg = <0x401b4000 0xa000>;
@@ -622,6 +631,15 @@ edma1: dma-controller@40244000 {
 			clock-names = "dmamux0", "dmamux1";
 		};
 
+		pit1: pit@40288000 {
+			compatible = "nxp,s32g2-pit";
+			reg = <0x40288000 0x3000>;
+			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 61>;
+			clock-names = "pit";
+			status = "disabled";
+		};
+
 		can2: can@402a8000 {
 			compatible = "nxp,s32g2-flexcan";
 			reg = <0x402a8000 0xa000>;
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index e314f3c7d61d..efe5398e1240 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
 /*
- * Copyright 2021-2025 NXP
+ * Copyright 2021-2026 NXP
  *
  * Authors: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
  *          Ciprian Costea <ciprianmarian.costea@nxp.com>
@@ -475,6 +475,15 @@ edma0: dma-controller@40144000 {
 			clock-names = "dmamux0", "dmamux1";
 		};
 
+		pit0: pit@40188000 {
+			compatible = "nxp,s32g3-pit", "nxp,s32g2-pit";
+			reg = <0x40188000 0x3000>;
+			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 61>;
+			clock-names = "pit";
+			status = "disabled";
+		};
+
 		can0: can@401b4000 {
 			compatible = "nxp,s32g3-flexcan",
 					   "nxp,s32g2-flexcan";
@@ -693,6 +702,15 @@ edma1: dma-controller@40244000 {
 			clock-names = "dmamux0", "dmamux1";
 		};
 
+		pit1: pit@40288000 {
+			compatible = "nxp,s32g3-pit", "nxp,s32g2-pit";
+			reg = <0x40288000 0x3000>;
+			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 61>;
+			clock-names = "pit";
+			status = "disabled";
+		};
+
 		can2: can@402a8000 {
 			compatible = "nxp,s32g3-flexcan",
 					   "nxp,s32g2-flexcan";
-- 
2.34.1


