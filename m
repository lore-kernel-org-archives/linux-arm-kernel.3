Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C77F41812
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 16:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLsDNstpjpYxkHgH2jd8i/u8OE9Pdxhm8IvEvQ/thGI=; b=ZKWbUuaxdy9zcpniJ/YHSLpxMP
	IapK66FUcEc/oS496MAAypjZflSsJRKVP+YwDzIO7zFHf7IFvIq2IwW5YM0AMMfSKdunmQWQlVh0K
	qy17XwMEHWSXjj5sqAYD15tMCB5pZZlqcr2GvvClnLMEkwx2BwOYD0KBdqINofynOtWm0p1JQHgYI
	/SDRMXvtXoJi57u/JX8f5Y44rwq+iK9yuziRd/Gd5tgSU3srwJ/1MECb2jMqxFGG7TCLOyHPoeZR3
	FWcA9WnXKQoMPb+XI+W3GOleNAACTlTxLBvwGqzarWB8GxS4MzSBKlTgn7Ul48OtRwpdCySYh7Le5
	nRbPnQOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdwm-00000007mCg-0bhC;
	Mon, 09 Mar 2026 16:59:12 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdwj-00000007mCK-1EPh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 16:59:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hbVD6Ay8FlWeiK6ONYHq2UcUHhhp3I5HwKYZmJYT4FAeiUoBv7/J9GuzKxjBu9O6rk8kPCtf+LEQtY90DyE+MjQ2CDK9P1gcwXF/NgLXFspGt+N+2IfBcRxUwnu1u4861AVfCvX20tM427Vjnk3GcBBMt/mYnISXBKkFw4cZEjd67rRDIn4iSJ3CQRSko/rE23vr+TUzLpLrQXOBbjwqwMgqXF4zzzvUb3EjoO68V4VVtjVuldz2gcoEFbQ0fDukn+0rW6u2kozg9tFsL9c0CmX2zhbEhz5UnxH2UkAZ1faHYOfVuT1AAG+JKViLs/VgGeZj+ggBK6sYK8bZNo2EuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLsDNstpjpYxkHgH2jd8i/u8OE9Pdxhm8IvEvQ/thGI=;
 b=vNyBIZPPoqLjCK6f9+cc35O+tO2tr3a210j3XHnAb6NodQvUVEXMtokgVLFkrgMs9dZcTXyQuw5wqWXl+BXZiZHnpIbmPOjtarSS3x2ZD2COpCgfwBhT6PWY3/ggC+AOxxNpYVlWb4hMg2Mrfq2YiDSyHYK0fvgxmEbMRV59EnbC8P/A1zRx6BpYUWEzADEeaIXANfXTvlp4jKDgWSCbAbHezio0a+0vzIbQWSOtZol6ksvGCRQrYyc61KvHsrNzN/E4roKL7CB1aRXW2ksw/ByqhdgFbELEjL4A/PEAYxN+e8xFd0oMn8fkcsIaKVNlPMd+mpKk5msuikhs4hJ31w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLsDNstpjpYxkHgH2jd8i/u8OE9Pdxhm8IvEvQ/thGI=;
 b=SuG1T4nuQSVtmpn/FNRPM9WHIKcZN4XPeFy0pPp2MIptt0feTOMq82QO6u51VIXd3fCFzeUa8Rt6Ee/uQkA/yFYn70AOoGzz8q+eJSCtXWJ/DWN8h+SUeOuIAuiaChH3PdEPAI5L2ma8WkTtzYefM1iG8GuXNETg5BjolmUlraCbZU3quEJf5TwoJcNw/XU14Xhffh7dvN3PPFkT3P1xyWoIKLIHxOQs5GDOPwz8D2Q5YIJED/41u6PAYSj/5ZT1wTpMo4SSSZC/Rlf0omPeHRmHm20ITUAUy/BeTa1bMjtzDnWKCNiF+mhrnnTvmCuu5zYR0+ma1P+1/A2DggW32w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB9091.eurprd04.prod.outlook.com (2603:10a6:102:229::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Mon, 9 Mar
 2026 16:59:03 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Mon, 9 Mar 2026
 16:59:03 +0000
From: Frank Li <Frank.Li@nxp.com>
To: shawnguo@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Wig Cheng <onlywig@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	zaq14760@gmail.com
Subject: Re: [PATCH v5 0/1] arm64: dts: freescale: add pixpaper display overlay for i.MX93 FRDM
Date: Mon,  9 Mar 2026 12:58:47 -0400
Message-ID: <177307537089.1723250.5850764089686106895.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226144819.3428730-1-onlywig@gmail.com>
References: <20260226144819.3428730-1-onlywig@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR13CA0162.namprd13.prod.outlook.com
 (2603:10b6:806:28::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB9091:EE_
X-MS-Office365-Filtering-Correlation-Id: dadce6a7-9c44-4c93-2259-08de7dfd2aa4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|19092799006|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: LqH39Mr929d5j33kpTGw7fMdNCyeLDs9n7mu2L5DpS+7DNHCcagyx/1ejzy44y4QehLESXHXCUdbGBJkj6f6HuaYSHuWHOq6VArxVkUWCHhh/QKnYZQ7TkBPKb85VMEJzIurIWot/zRLQ+BHk5S84nY4CYFV+1rTo1ZczuGQ/mNRGEDbxodu0LIfCWiz2hoND7uzMjTsyTNPPqy6npRbW0Ym1THqKdCdci7uxyV/sNnREWCIiygvpLSdzrMdusHtYUzb6812ydQOI2Qn5pkepTQ1N7QJb9Oni1ONQ/wBIwHM65QQKDTm5RWqCIwO+um5FKQjZfQk7E9D6tUQi/dhoqQpepONzzuc1T0noCucTap3yFtfifEAGaP9gRw8wONxQc4fOih2XrCSOKTXnUb25JMjjXOh1JgBGRJK1PwkTTbAcO2L57rGSVUBdYz6NCe8jLZMkdougwts0Bpcoy9DTIrtKF3c4VMPhkauBGrA5u7IV6tGVLUJpduCzi6LjiNbOzo04fVf2Kj3rUbP3Njjtb0rAZiZm6DVWYBxEeScb2b1M+cNjaCIDiXY0usLjKT60YSjdAYGL5/3dYgPdwp5XR96SDVGRqAsxVS0bA91LVb8PIwTOSi9fxdgEC2Ge/Ue6U7TjzM8vZsxKtSgSqg2o+WqV7BlHathtuS6myDd5ng5ZRGJvctfhlgXCOjmga1Z1dxZjSUeLUAHRP3b0WsjZRXcLvnsqPC1AESUgnGw0h5TVscAaGaTnlbwnzeYGu4t
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(19092799006)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2Z6alZUZ3pkNi9Rb2FUeXNKbjkvS2Jnbk5BWVlEMjY1Wnl5SFBpenUwMEFC?=
 =?utf-8?B?M2FKSWxUQmcreThVVmU1RVJxakJmZi94S0plZ2lkdUU4UHdMOExqc3Y4ZDFV?=
 =?utf-8?B?N3pyd2UwR2Jvb0xqdEIrMmpMem5EeFdOQWhjcjdUN0VGTmQ5RnFXZ2EzcjZj?=
 =?utf-8?B?UHpFdlJKQXRKUlhXSkI1WDhNMnpOOFYzZXp6R09HK0hmdGNEMVhZN3NVVCsw?=
 =?utf-8?B?TUN4Y3licXJMVzdmVCtVUTdsbmxaU0tlb0dTM2lYa2RsaTA1VmNlcDlNQ201?=
 =?utf-8?B?aUJjOXhzK0FLL284ZUhlRmFwa3Bmb25YQ2o1bG9meFAyYzlUMHFVM0ZhWTcx?=
 =?utf-8?B?K29FcTAzeTkyVkZNTHBYZWVJNlE5OTJWZ1lKRzFMaCtLUWZBOExvWFJIVVBD?=
 =?utf-8?B?V2locUl0OHdpRFFPbE4vZG1OaVNFSnhkdkpSZmN0Qm9ZN2ZaWU9uN3VFV1pU?=
 =?utf-8?B?cldxVzlURGFEZllnWERjNmNNTEVKME5rajA2MlhDcC9hMDhhQnE3ZjJEdGZ2?=
 =?utf-8?B?VFd4eGpYWEw4ZGpQWmNWQ0tJSDA5Uk1EWXI4Z215THdVTVhpdG1iaVZwWlVX?=
 =?utf-8?B?d2IrcHNRZkM3d2tyb2dHcmdBWkxRbnkvRWVyYkJZQmtmVGtmMHduL2ZPb3la?=
 =?utf-8?B?ek5LbUVRRFpEeDg1RjB0dDlmN0J6TExqWjhRUmJmOExRcENGY0djL0hQeEdO?=
 =?utf-8?B?aFAyM25VeU1yUHBZeWcrY3pONjFOamVmd2JPbWRvUEZ0NmxlTkFFWE5zZXJZ?=
 =?utf-8?B?ekgxUEJzTU5NUVBhcWNUZzB0cDVzZUs4YVptUURYbm51MlJYYjVhRXFUa085?=
 =?utf-8?B?U2RoNG9zbVJnQVhuUEJ4Q1djRFIvTVVwOTNScGNldGY2bkxqYXoyRjJPVTJC?=
 =?utf-8?B?bDVWVC9wbHJhQ2oxTytnNjhQMU5jYU1SdmRpK1RMbmtkdHRPUHRFenY0L0xD?=
 =?utf-8?B?bUZTcFVteVAyN3R6V0ZFUjcya29YaGVVTnd5MjUvT2VBSUszQWsxZCtPbWw1?=
 =?utf-8?B?SGl5Z2tvR1lQdHlQR291UTdNaHRUUU9ZY0hNUmp1VkpxZCthZVA0L2RZVyt3?=
 =?utf-8?B?WGVwQjRwZ1RkczVKRmRUdXZNVExQMXNnVnFVd28ydFhhRzZvN2wwcUsySEg1?=
 =?utf-8?B?WnRaZlR6RmpNM1FrQmRJK2RuV0xXYzNXam01ZHlxcGVNQVJjVkJhN3h0dml1?=
 =?utf-8?B?OHlBbXcrMmkzSVJjYVdyYjZ0a0cwQlhSM3ZoLzVBOUFJRlR6TUNBMUJVbEVY?=
 =?utf-8?B?TnpLSk95OWlmZmtQcGEveDR6R25paUlKTHpSSmREZlBXWTRzN1JNOHdhMzFR?=
 =?utf-8?B?bFhLZ0ZIQUhWbzQxY0NYek5lVFhQS3B6L2ZnUXIybXFJZUk2b1VMai94aEpS?=
 =?utf-8?B?bGxjQngrV0VMZWpWUG1jTk1vUFlJV0ZBQlB5YzZoTnZGS2RtUGI5V2p3TUFN?=
 =?utf-8?B?S1NVcUlvMHFKaCtJOERyelJWTzBHOTlyQlNKYnE5MmZWR0IwM091MklUZ1hB?=
 =?utf-8?B?c0Z3dEVDZWVTV2FOYWRQREQwYlg2N1IwMTNtSFczcFRlUURDbFRWdVZtSE8z?=
 =?utf-8?B?bmdkbzVROW5YKzlpZTdERk54TVRHcXFkbXNaSXJVRVJWOG82WitHK1dwNmQ1?=
 =?utf-8?B?UHZiNWhqN1B0djdpVDRZWHowbWEvMnVBY3IwWFJDeXFSRWVFU0t4MUFuL014?=
 =?utf-8?B?Y0hEMFM4TGdWSzFJTUE3U2lvV0MyUlVrK3FHSmZ6Z0tLdkpIWkZCY0lXNGlu?=
 =?utf-8?B?QTkzQTVHdVlFL2JOQXNIVGk1MHdORTdGMjRkOHNYTUtGVWtzOWYvTUlmaE56?=
 =?utf-8?B?MTlYVjVSSWNldHJmd1hoOFdPV0xVL0JtMHp6cWp5WTFBMis1a25kRzFjSlZM?=
 =?utf-8?B?ZnUvMktOTm1JRDJPb1dLRTc0V0d1VkJOc2FzQmdNM1JnSlNSTktHVThzYmdY?=
 =?utf-8?B?dW1DNUk5QkVqVWoxZlJibE5pc2pyRHdLNTVFb3BUTHRqUUo3bis0Um85OFVV?=
 =?utf-8?B?NVVDdjc4dTZSaWRTWWVVczRkZjVKcVBrbkp5Qm5EREdoTUJ2SGNwNXhVbS8v?=
 =?utf-8?B?Y1daYkNCU204dDZZMUQwRUlWdjFJbjlyZ2VFMklGRGRUaUg2UW05d0o4TzRZ?=
 =?utf-8?B?RzA1R3VVc2lnTmlaRmUvamVUOTkrc1BUMmhJZE8wQTFKQVpSekcxVzAvRXVP?=
 =?utf-8?B?QjlqL1dpNTczTE1xUTFwZlNEOGpKYnlUQjVaM044ZnpINVd4N2VMOXJ4R3NW?=
 =?utf-8?B?TTYrQVlkRFpJVEVPMUJ4S1JGWWZtZDV1bmZNaGlxVDU5VU1hUTVzZ2N0V21a?=
 =?utf-8?B?UDIrekZzWmFEcW1NMXdLSzUrZVVaWDd0OG1ZLzBZZjRpREVrU0p4Zz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dadce6a7-9c44-4c93-2259-08de7dfd2aa4
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 16:59:03.1551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gTyJn8TQWXlzKI+8TrQuuQk2Th4/Hdw78bhYRyiLBInQUgF8FR0CNssxgi6qnuMD4hFZd28LoXzChwsPJRSh/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_095909_357675_0B19C023 
X-CRM114-Status: UNSURE (   8.43  )
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


On Thu, 26 Feb 2026 22:48:18 +0800, Wig Cheng wrote:
> Changes in v5:
> - Use 1MHz spi-max-frequency to comply with binding schema
>
> Changes in v4:
> - Drop invalid property
>
> Changes in v3:
> - Misunderstood reviewer's feedback in v1, improved commit message description
>
> [...]

Applied, thanks!

[1/1] arm64: dts: freescale: add pixpaper display overlay for i.MX93 FRDM
      commit: b9f7ae25c9d60b8c2362c397f99d2b046fe74844

Reorder nodes and property name according to tools(
https://github.com/lznuaa/dt-format)'s result. Next time run to keep nice
order for new dts file next time.

Basic rule:

No @hex is first.
order by nodes name.

See detail at https://github.com/lznuaa/dt-format

Best regards,
--
Frank Li <Frank.Li@nxp.com>

