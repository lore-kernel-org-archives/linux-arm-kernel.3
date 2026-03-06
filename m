Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58A3FCB61D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 16:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T5SIS7GokQUC8ftlCPPmg4XbQf+sFIKPTSrqHAUeYX0=; b=AoyERYZkCkK+ca5Lo2v6zHQxcS
	tn6zKYgkwdDjlODvHEgAILzd7eNhJlws5g9vuGRjVUSsWkDIVScS7Z7hIRRM3EXETh2y0WDYQ5Zn+
	Bbt+mkZu11vci6MeVE39PJLNxejU4Nboyb+ANQ0WMH0jktZ3nP3uZbxLti8mL2tMXUZiZ+UvPntOb
	n9LMP1XpDPB16ox//Uye9w8X0UUTdWeg+sUrJ68FKxt8xZ/JaTV4xuJD8ZrUywglZSzANOCeaugRv
	0Snu5steFGaL5VtwhJKBnOEAvbzQUGbfTrzu7T9sbe8zOhCGu+SlLZxesueAURVxM2CBqDzIR/Xyi
	OQddmgGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXqT-000000048F2-2LAN;
	Fri, 06 Mar 2026 16:16:09 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXqQ-000000048Aj-0tvh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 16:16:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n5q9L3IfpWQtR0Y/nP5BpZeio3SxrDMmkDcuHJvX6J4+XQRjMSS2+IuQMSdK1Hsa7KrwqCyU96PUkt++oSdayfqKLBoAkj2A/gfSErP43Xh6pjrup11w58hrft/t1bpkFujcXLh4HrdCYre90pv7X6+Dh4BHuO+tUBDMHJMq7UrIYa5hAOhWx2HOu8io0dpnTgMNStTz3IlUBcnCzbYubpxvl1UbkJpLTvHCWrTg/oY1TMM0pHGiVglz3IYU2AFu2k5c67Zr5To8ZfwkltpQh+kXUoTLNFkqXNpOvMPksZ6dED40diiNme7WBs8OKU6Z6NNjafgSirsnIdM3hMq3VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5SIS7GokQUC8ftlCPPmg4XbQf+sFIKPTSrqHAUeYX0=;
 b=BpJ3hgpVjc8vPAQdjYPKPm8M37j3JvixjinSmcjNtOfuwFPi/n96QxGdp23sifIkHB7mQHflnUbZTbauDVzBBMdCZxV+PBJvZYNveUojoT5nSumeSj2q7eXsiZS7tWAK455L7PQt5tewntacrAF3pux9asocOakb91/GfF7qd4LSKJhBLTNM/BJyo39EMWnEwPD30X47fVxIOUNMDbnNyP73kWwcn2YuZ3g2Xe39mBDF6hjRvYSqDUUFo+AMJkmHA5gmT+O1jVdXeNv9kkpZPGnIH/6G7B0KBmVPL6hCOXYybZOpaF6buoBxrA0YFTWt6UD1kVE3XMQgjOpm8B5BrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5SIS7GokQUC8ftlCPPmg4XbQf+sFIKPTSrqHAUeYX0=;
 b=F/FVbjx6hLtCoIBPnqtTQxmi7EKgOwHEW+UQvHyyQ3A2f95uQBqw/GofozJdxedK2WQv4jx9qmdrXXDtKtLA4kOBRGIgP4xSMLaq+lEzxc2xpO6FWuRqgkfsqFyHXzlWKdN0cNn8iNIcAMgTcD//n8Wf3YUzMr91MYzGRXFmW8E871iyUo69tFN5qufj4vaTWBh8oh4zGi2ZA/nVn1pzu7kY5BGtVBUihNpaqV9C9R9HVQpo7QEayPQCEgFSGZAluh+3lVzYf8UOHxA5MNTWFtFA0pfUUMNGDroRRcfe4IXELrRJM3RjNQZtZE7POp3TPRqEinuPqEN/I53tqZKDaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PAXPR04MB8606.eurprd04.prod.outlook.com (2603:10a6:102:219::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 16:16:01 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0%5]) with mapi id 15.20.9654.022; Fri, 6 Mar 2026
 16:16:01 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	s32@nxp.com,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>
Subject: [PATCH v4 2/8] dt-bindings: mmc: fsl-imx-esdhc: add S32N79 support
Date: Fri,  6 Mar 2026 17:15:49 +0100
Message-ID: <20260306161555.9000-3-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306161555.9000-1-ciprianmarian.costea@oss.nxp.com>
References: <20260306161555.9000-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0166.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::33) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PAXPR04MB8606:EE_
X-MS-Office365-Filtering-Correlation-Id: 0af46a24-4a5d-41f5-2b2a-08de7b9ba8bb
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|19092799006|1800799024|921020;
X-Microsoft-Antispam-Message-Info: 6YiYAUNsgJotBwSyijcHShNcdV7wFKEYHQpeOpazBlCy0vwB/vslA2vwaclTp2n9leSJfpapjrCEeI4SoDkZq3uj18MP/dzDCPXv3PPHQyB44X2NlNLEUzLW3yVrNE2Jb679F+a6gXdmtcxyiTWhiyk5Wan4AVjxQoFc76vFd02p8jm6vM0IR2xDrJuHvc7gwozODeTNRjB4V7qz3oXf2y7qGenT/d5Z7KgUuG9+53gqUnY433lGKXsnEgkTdMRjhGoKhL966cHiYte5GKMhhqIUhr1eBJQrquTB7wGaUNBEFhxGg9MPuVL0GvnNgWGttbEyq9Dy/9uNLCl7EIxu3qAQVj6aHj3Shj1GXjfouUfbTzQ/j+64MMbStd3YLJFWgw1wbJ5gvvok83cVDOUEUYeg1hse5eKaQjXHWc2PqqqEDfM/KtMJ9kbs6CwAllcelwnkd1uZ7LFHI/pW4MhazG6KpnR2X6ZGt6kPBAAiOW1o/0N5+0FHMmrtJYYixL2mZalGnG5U9wgeU7/VthWnvL10gPeQlY1gilSbaSslf8AJoTb0EjDfLu15C1ec+zsIGW1JrEfqwZ3/0TxupPCrwS4g9pO0Lr1m3EUveWD13zsmtTuG8M4bVnOq9CK4U73F0ZzunXHFQ40S+KkDNaeXBSb0UqlIPVRG4rVofVK94yKToxwl5MxKdHZtL0H/7sY8wFCVJvoa+iZyV4WzfFK3Lm8FDVKQqKPCqLhp6IFkw1KDYqDSUeP13qeGeb7Sfx7aSb4xMForltvUcOq8OHBfXQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(19092799006)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkkvQWpNWE56QUw0bEprWkdvblI5QVh0Q0gxRTBkMnBrYWtubEREcEZiRkYw?=
 =?utf-8?B?cjVxZEpyeUVEV3F0WHJCeXQyZURRWHhCUUduRTliM2ZSNTZsRW5WMVVrWEJB?=
 =?utf-8?B?VTJnclpDWnZoWTZ0cXJnczJrWlpUMGZnaEVleThaQjdaNmQ5OVFGOU5xbzgz?=
 =?utf-8?B?cCs0YUVleHhsNVBhWGZmUm40NzRTZ2RsdndkNy82cEQyVmtleXM2empOQUI1?=
 =?utf-8?B?UHgxNTFrUmpjSjBWcWROM2RiV2tKRGJ3T1p5MFdHNkVRZ29XM01Xc3FZUzJk?=
 =?utf-8?B?dDA4UTluYm4zZW9KVVY0enB1bDVDOTFia0d6K2x5REhYVmZZTTZ2Nmc3NEpG?=
 =?utf-8?B?Y040ODAwUFl1SmpuUmx5Z3NlRHpRVTJUVFVDMWJhUUNmYUtKeXFOdnlQMUJD?=
 =?utf-8?B?cjhjbXhRN2FSYTNSYmlWNjRYdnNQeUhTcTR5Y3BCRi9qOUVXSjZWZTNIYWFT?=
 =?utf-8?B?WTA3ekZwbWFMQWk2T01OV0V0dWpIdmpTMFdHWXl3SWg0KytCZnd6V25JTWxE?=
 =?utf-8?B?T1BWcXlsUW01ZSsvWG0zV3BKdElIdkhPTnlMUFdCTTh6QjhYcFJFUEZJYVNs?=
 =?utf-8?B?VFFSNUZaQlBFdjJ5RW1xNmV5MzhjamVWWUFwMUxkZzIzOTlBUzhHcERmUXBP?=
 =?utf-8?B?aWo1MG5CZTFtMC9OaGRwa0haVksvODNFWnFMd29LWFlmMTF5czI4RFBJZWN1?=
 =?utf-8?B?bW0xTXJKNXphUHFmOUpuTFkzN1JzVGkxc3BDTUtUMDF5OXdwdUJTQUV3cEN5?=
 =?utf-8?B?SFdpcW9jclpJQWFady9iRnNJcDBlWC9VTVhlSFVvOWRIckQ3MHpEdUVyRTdS?=
 =?utf-8?B?U292TG5UTWlMSHAxaExiUG43ZmVBZEpjZmNYVDlJbXV5MmJmMjZuZ2RmYm5X?=
 =?utf-8?B?NTJJb09tM0d2NzBTNjM1MDZRS00wMUl5N1RHVG5nb2dqMjdaZVlBVlo4bCtI?=
 =?utf-8?B?ajZjODNqc2o0NmsySnBxenFrRWdONG40ZklTaW9YZElOOVU2MjNhMlhSVmhX?=
 =?utf-8?B?RXlndFRMT1BwdnJFUk1SSVFTaEEzaDZ2aW14dDhrSUIycUNMamtjU215OVBn?=
 =?utf-8?B?VWVMbm1uMVZqbGVoaENMZWQva0FVdlhUQ0FROFRyOEFMN1d5NW5xcVM4RlVQ?=
 =?utf-8?B?aUFyd2F0Vlo2RkJEWE1Eald6ZExBd3I3ZllVYXZvTkJKYzFEZ1NhSTRSN25t?=
 =?utf-8?B?MER1dXRyVXlqQ08rN21yUWUrMEdIcFN0UXFuMnpKcmdDMjJIM2JIS1ByeC9P?=
 =?utf-8?B?ZTkxclIreTlVemNTYkd6d3N4bnRFelpISkVTUUNOdTd5bFpIMUtZR1NqeXQw?=
 =?utf-8?B?TExlTmYreW94ZDNEalBLUDBiTnNHNm5JTit4andCR29WSDQ0ekY1UXUzY0w5?=
 =?utf-8?B?a0FjVzdyTk1vem9RKzYyQzJPYXRLdU9uL2VwYkt3R2hVM0VwZUIyTU9DTDNM?=
 =?utf-8?B?eERMdnVVVXhiNHk5ZmlFV0RuYW5RU09qdlRROVJlRnRIOWpRdGJEVkVWaUlx?=
 =?utf-8?B?cG0zRy8rZlgzS0J0M29RdFRlYWxYT2hqQ3N2eXZvcEszVVo5T1p1dGtYb0Jp?=
 =?utf-8?B?eDkvWHYwY2lyOUFkME5IRWtVbkVJWkd6Qk9DUWp5WmdhOUUrMUVKcmt0QUNX?=
 =?utf-8?B?MUJYOURab21iQlRqUGhXbjlDb0VvY3ZJNVlzVys5SjI5WWtKZDN5VGRHczRX?=
 =?utf-8?B?N3dha3R5NFpYNW9lWDh6WUNFMDhEU2tyMjZqMjh1U0tzSzBmVmgzYktJM1o2?=
 =?utf-8?B?UnFOckdkdWJ5ckpJMldVbGMvYnZ3cDRSNFo3cjVxTmZUYzlFRkh0MlNzV1g2?=
 =?utf-8?B?SUVMT1JNL2taczFORXhrQ0poY2VDNDNLQndKakdoQ0tmRkRDbzhIR2hjSHZu?=
 =?utf-8?B?RDFwYVRqam9WQnorNGpWR0hxNk1IcmtWU21GZ1BFeU9lVFZNZ1hKWWRRdzlD?=
 =?utf-8?B?U1lRRFNKSDIyVkxkNUlCVFdrZHdSc2EvV3cyaTFxMEg2NTFDYzdpK3l2SFA2?=
 =?utf-8?B?L3ZITTNhRWtCUkNnRkxLZEFUWElCYUhoeURaUlBudVUwQkxOb3A1aHRWb3lK?=
 =?utf-8?B?TDluZU5hRHAwenFoSWIvb0RIUE0rb3FSWVh1Q2pTaFZncHpNNW9VNFROQjBq?=
 =?utf-8?B?c1lMcW5IaVVEQ1liZnZBU3FMempISDVNMUVRcUlOTk5Vb0t5emE3OFdid243?=
 =?utf-8?B?RlZPd1RrUUZvWFJrNFg5SUZoblNGU2JLKzdHbmw1eTJ3RUpEc0RSejlhUEJQ?=
 =?utf-8?B?M2hNSU1oQitEN0hUZnR1dU9hbnJNWXdVL2NwbFJTV2M3MzhaVTFLQ2lGMlBw?=
 =?utf-8?B?ZDZpMkRtTTFESkdPRDVKUG5LNmpuNEdqUEFDQVA5UFBWZVpsbzlkZTNWTXlG?=
 =?utf-8?Q?XqE7tg+htuNH5k7o=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0af46a24-4a5d-41f5-2b2a-08de7b9ba8bb
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 16:16:01.6317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G/yb5+EDFrk73arsDS/P5x6wrz4ZpCIOyND3Jk0y185FtxzzuzwaTheqj2/c7csMrK4wtOgXe/jTcxA21398wSy5WVbiHD89fQRKLyL298U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8606
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_081606_248930_A96A45FD 
X-CRM114-Status: UNSURE (   8.85  )
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

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Add compatible string "nxp,s32n79-usdhc" for the uSDHC controller found in
NXP S32N79 series automotive SoCs.

Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
index b98a84f93277..014b049baeb6 100644
--- a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
+++ b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
@@ -35,6 +35,7 @@ properties:
           - fsl,imx8mm-usdhc
           - fsl,imxrt1050-usdhc
           - nxp,s32g2-usdhc
+          - nxp,s32n79-usdhc
       - items:
           - const: fsl,imx50-esdhc
           - const: fsl,imx53-esdhc
-- 
2.43.0


