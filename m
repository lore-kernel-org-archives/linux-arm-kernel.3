Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09919EA4E3A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 16:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9QA1SS/prgwUJAHXOCWnDV5mSiXGc0/dCpI08kxHzqM=; b=OxA5JaeLio+tCX7eB3UTNSHzHL
	BkbF8alepzfwTK6mEM8vYwXXJaJNPDBZtM4Q/t4vua5OvxRGU0DjtdmQxB9P5mEB4WB68w9T6zSI+
	+hr/V0cJ/SYqEuaXElJIxITYHZ0nMe26MgrhIud9Y7Hy6sbc3L/YmuFgE7IKNC9+Krg7V52uUqxuJ
	JFy5NDw57HIZSlOtLYebvFB62KkNede/VEKZ1FZcYXwIa4+EjOCLOUn2bId1zR7zro5GNmN70Yce7
	jOe0wnrhNcEYy/52qVeFc+3XGf392dt24LeB9pmiMfu3VcHg1HBAOR9fN5XX7JhWM3Tkxoc0gZIo2
	sL6NCVaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5q2-0000000DSPh-1pjt;
	Mon, 02 Mar 2026 16:09:42 +0000
Received: from mail-westeuropeazon11011016.outbound.protection.outlook.com ([52.101.70.16] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5pz-0000000DSOw-3djc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 16:09:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uBYuKN9/S57GCV/zLpVVeW7czU7ZAphIBLQn37Qy2rKNQGg/Kj/zEGd1eWabKkTVeArrfV1AhuGcv0pUSHc+8PqY2fm92T5rxS6Vv1Qm5G7vEGQJv0htDeV4IoYbTjjix9EpwchzS+8u7x92EXuRKN1OPA9oWzUec+WUvoPpYjXx/S7ShT16EPE9ylUiAfuGCki1ydFCQINYbOXSZnElWSptv72xZmJVOQndeAwG5HADSfjFkOvcTSNM8+NX+3IeD6keFYeEETh+d14P2MtoVbKzRFwNdB43kwXe9/bdfXKo7Fo4WPxHhTcKYGyX0+KjGJIAX541l6OCNMQCDFf/iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9QA1SS/prgwUJAHXOCWnDV5mSiXGc0/dCpI08kxHzqM=;
 b=ZVIvQdR0wa5YvWW6ZheyP4JuM918G1rF+JsVMu0dRdlKVCt2EJwSdj3i99Mi+tfOgvUPOMfePsqUsMJErwG7sIIuaxnTtHKh+0tfhOp3mxhBHPDZj8mnbLNFz7B57GNVUEeYVsBnYBWNj1rlEgbkcyYJ0VCBbdK8iwSadbu92RsQv4NuwTbsRcCMm4agkAtVV45TxbNksXUB0qOnbqBYa8laCw2Dzkmf+BmNPK0jcjPlBV4BxKt/99LF+kYGTn16/qtcX5EtW6ewxxK6Xjr+dJ7QImzOL5hcexPHCVSqofl35dJQEIjplp52MvGMpiXPgYqhga4YZthoq4WwFhMxLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9QA1SS/prgwUJAHXOCWnDV5mSiXGc0/dCpI08kxHzqM=;
 b=Cy6VZ5IljD7ytuvW7zh5EsoXWHwwVY9Zn7ludXt7r00pXddMnkoMJQi3kr1ZWq9PYj+M2zIYRkrp9hXfPYvC9Lgco9riz7tPTzKgrD1el1hAKMVRGbNQXicF3myoUpbU8r3SO1IIZR2fu3oVIr+aBEnI16mxxJvu6JHOqgbwTO26VV0q/Tw91wDzGfPWbzNxn0qXSw9mOSrBUEtUKIKsYEU034w1S7OdT5gSU3gPDJg1xsVBFgOQC63C/ZJqbpalEG0rADltatVDO5b4UmtciY0vL7QAutPHhUAa0+Tdyj1tSx4b3mpRGwUG5z3DHlzjUCtM4zkJ71APT1/w2RuQ4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS5PR04MB10043.eurprd04.prod.outlook.com (2603:10a6:20b:67f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 16:09:34 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 16:09:34 +0000
From: Frank Li <Frank.Li@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	Sherry Sun <sherry.sun@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V2] arm64: dts: imx943-evk: add usdhc3 for SDIO WiFi support
Date: Mon,  2 Mar 2026 11:09:16 -0500
Message-ID: <177246774496.2043722.2744255019349587022.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204022306.2372889-1-sherry.sun@nxp.com>
References: <20260204022306.2372889-1-sherry.sun@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::8) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS5PR04MB10043:EE_
X-MS-Office365-Filtering-Correlation-Id: 14a05f06-03d1-4534-6787-08de78761832
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: cPs80RuH5OlE6wP4yWrJ5bqdBSljCyvr7ID7U+pn0LwjTbdKXoXaLZzbcD0v8gBZG8qxdQhiaspn21QGjKU7O9RfrCs4cgCENGHlSBntA9Tpt0c3SAOxUoOmpijUF9itfr8htvL6ejAeqcpkv8nDRyn9wTsWzVAzMfsz2vYkwnk0WvX+/ZKp18TgA7onu0zpocuC9RdMnTyGvYQL7INRcF6pjqvFVgPjra6TN5zEMkoba7lqOtYEuysHXvfgfV3/1xuyMtPy607MWBuZgA8qFZpV0GPTb8ipAaM7afjAPyueu5yimRjM+g1HkPnabLzkgaiyA3cmQJgSGId8hhmyVZbVLNiLLoGX4zJRJMTOSKehgoUdFuZb2AUAi5c2jDRAnyT7D6+V8HEPWueyTOj4H2+p7GZsxKyFWzPobnyMDQupVWrHyGPCqLExk549oRcD1gDuCDep2ucgIsKBiYwTeWNTHaAR6NAhItrudQ0tz0jTMGYLAdCCwhdq09f4ckN8vmrWAIYH6rs9L5mVDJLAz9N/V5d7TvCPzeabV7wbnJ3yR9hAxffiY08ABsBTGjxnMI27Ah9epVwnfqjJU3H4lZhLWHxTqPm+cfZFNNNgak1cYJLxOYlMerJsmiAUC12+30BkO8w8nC/19Awpafv0GMdYyBp8zVXY3u8d3t3mXi6iWoTUVpgswpXSiV0ZI54TXiTdSBTkFbtAtnQQz+DriDU7wPn9SBNA9q5Xf0dVZia7HknpkZYSa/IhINixTt1m1zEzJdqIwGLexhEVxL38O9g8WzcBgqi8uglfOKnbppk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmE4dlFVVzBBdUlhZDhpUEhpRTJLYmFVdHpESk55cCtVdi9rdDFuOUJrRk5j?=
 =?utf-8?B?cHBXZUFyWEJwZzNxaXpROVdvbGF0cW1HVkFtQmlPazIra0hvaUYvRVMwdmhQ?=
 =?utf-8?B?TTdwZjRGQlcxTlcwSEZ2Q0JkOUNNb1JDTHBXSzF4WVRicG1NUlY3SjVBdTZE?=
 =?utf-8?B?bjYxRDMva2FhTXdPbHZwa0RLWkxmSy9SNWc1UlVxSk9YM1BsS1BqQ2VoQmhH?=
 =?utf-8?B?WkZVbXliU214b2RwVFRKTmxhUXRySGZFN3MrT0JrQm9GeDVvdHBsYmltbXN4?=
 =?utf-8?B?d1dPdnptZjcvc2J3UjNUdFExcnJSR282Slhub2JIL1RXSExGNmVvOU5JaEFY?=
 =?utf-8?B?cy85TmJ0L2k1OGpIVnZzUjIwVDd1SEl3bUxYR25QbGVLVDBRNGVtSlE2eEJl?=
 =?utf-8?B?UDNxOGZmSGlkSnJXMVRkQXdLcnlwUDdUTXpCRmFZQ2grRUNmTEkyR09YMWps?=
 =?utf-8?B?bTZQUmJ5L3F2NVEyS0YvY2xCYjBjTnNiWlhkOFpXVENqMUVsMXZrSHhPUXdi?=
 =?utf-8?B?YjJyZWpIYzFQVTNpa3g4OWMzTlZIcFQwMUNtZHg0WEI2U2xHQm9pWk8rYXlF?=
 =?utf-8?B?eGViR0Z0SEVjZm1WdVBwYlpVMnc3a1dnaXhUbGhBL0w0VTVNWEF1L3RUL0hC?=
 =?utf-8?B?dnlteng0emdVMnpLWEt0eThESUhJU0JGbnFreXhQU1BPR25ORW9OL1ZWK2NP?=
 =?utf-8?B?ZmJZcUJMTG01QkdBQ0ZwWE9DQXM0azRhTjJpeGR0RERxYUYrNlZ6VjVvL004?=
 =?utf-8?B?U1pwVnZrZ0xDWHg4U2FrdVBvcVJHU1FRUXBoSy9CZitYWVN5RHdoZmhyWHJu?=
 =?utf-8?B?Um4wWDNydFZlNFE1RHBtZkh4c3AzNnQwKy8vSzBCa2VsMG1NMTR5WUxKK0l4?=
 =?utf-8?B?djlKZ1FtMkhucFRmaDZXYS9FcHVXWTR2dDR1cjZhcFNtQm1pR0lIRDNndDFH?=
 =?utf-8?B?aUpLamtodzQ1TVVqWXBUUHBoVW5kU2w4T3lGWnY2RDIwR2srN0VKREltZUlW?=
 =?utf-8?B?UHg2TU4zL24wNnhWT2FDdWRIcVpGVmF4ellVN3gvMW05QzFOeVdIdnZFRXNV?=
 =?utf-8?B?NmY3Tnc3R0lPN1J0QzdRQXFEWW12Wjk5TDh3NnNmVlROUVYrcE53bFl1dWwr?=
 =?utf-8?B?U1BmTGVGRFdTQ3RHMUNPbHRuSGM1bGJ3TFZJa3dUUzNpTTJodSs2R1RPWDA3?=
 =?utf-8?B?azl5WnNxT25XZFhjeklEdHBlTGRGVERLYW5TMnNxR1BNeElyZFVEV0lSNVRG?=
 =?utf-8?B?UHV2dDQydExxT2NPU0h6Yk5qaXVwQnhmeFpGYXNTOERQanozVWJrZGFoRUtM?=
 =?utf-8?B?V0NxY0Y3VEJhTTA5dUJJanZJTTdWY084clBMbUk2SFY4Q085Q2s4VXcxTFY5?=
 =?utf-8?B?N2ZyT09tbU96VkZmWmlNUnNLTnhrRklteXQwcWQweHZFTFl6NFFYUVEvdVBa?=
 =?utf-8?B?bCtaZS9JV0hBRE90MThnNEQxdGliektnczBhUjFDZFVGVS8wL1pibVVkOG9u?=
 =?utf-8?B?MnJ1TEZLTHB6dWxsNTQ0SEpGWUNxVUJrYi91SDhMOXcvVnhwbzNSenI4eWUw?=
 =?utf-8?B?Y1BTWW9ibzVHdUpJZVZhNFhSQWZaay9neHUyWDJ0bVNHdlk2cC9OS0liY28z?=
 =?utf-8?B?dkwyc2JITEQvaWtWRGd3Q0lmZVJRZDlWMDRLRSsrUGRRaTVjajBWcGpuQk5r?=
 =?utf-8?B?aVZnN2JHRkhKVE9VcVBLSWZXaHpIRld5TTc1aXlUNWtndmsyd2cwUS90ajAz?=
 =?utf-8?B?d3d0NGFULzhDWjRwOUhydlVGUVlLS0N5OUg0eGdzR0tERlBVWi9zTFptTlNT?=
 =?utf-8?B?dmoyNkRxMzJ5dVIrSkp1bDJUZGc2SDRkTi9zRTBCWmY1b1dhVHluUk4veTlu?=
 =?utf-8?B?UmVyelRydXUzWTBDN1ZVb0Z3NitYcTF5clB2ZkFlTWMvL2JtaGl2d0g4SDBs?=
 =?utf-8?B?ZGdiNVBqS0kwZk1WVDFWMVhXMzNlemEvSTNHNy9lSjEvQXpFK3VidkdKT3Zs?=
 =?utf-8?B?QTVpUkFETFFUcExpVXZtem5PUDBULzFBNGlDOHlsZ2tFS3ZCK1hyQjQxVlFa?=
 =?utf-8?B?akVOeFFkaHRwd0JlbnVTS3MxSUFVbHYxODNyVThzZDVRQjVrK2J6Nm9nUlM4?=
 =?utf-8?B?RGM5d3Y1Q1NIM0ZDUmcvQkJkcnNyQUFVZGlqWVdRNDVVVG5lY0ZsSXJnTkh1?=
 =?utf-8?B?bDlzUXRtRW02TWN2RlJyNUo2bWNIZ29xR2tKNkJHWW5qMENNV1RXVDJ3b3JW?=
 =?utf-8?B?WVpXSHlkdXRYKzd3NzEvdDFRcmxyUzdGYjcwSmREajFWMm5CZHVlalZxNEFW?=
 =?utf-8?B?QmswUysxZFpNK3NUMncwOTZ1L3hsbWlBWlRCZTFaT0Exc2lJL0hLQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14a05f06-03d1-4534-6787-08de78761832
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 16:09:34.4200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SE+KwJgHVy8krNlR77fk05Z0QE6s1NSuPHYil7EogYcCBBFrzuBG6wVb2zz256sHtAz11eDaD1ayD9t804e0Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_080939_911825_582B0C7C 
X-CRM114-Status: UNSURE (   8.10  )
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


On Wed, 04 Feb 2026 10:23:06 +0800, Sherry Sun wrote:
> Add usdhc3 to support M.2 SDIO WiFi on i.MX943 EVK board.
> 
> 

Applied, thanks!

[1/1] arm64: dts: imx943-evk: add usdhc3 for SDIO WiFi support
      (no commit info)

Best regards,
--
Frank Li <Frank.Li@nxp.com>

