Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6C2CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 14:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=03TQwGi/fwdLQnsZNv4oipJecJ3ssQ5B/EqDLU7w+98=; b=1DrRkdqMLEzaYSj5gsvhUJWb7f
	CYmejuxYwto91ymvXETImRzy7pUhlVC2Yfee8W4CF6Z+NMW8eg9AvUM4s8KfFrIHyspPgljP7neZS
	8jWsDmcqabIL0LPYwYStyRMlwpa3SPQ4YqVFI1693oEDjflPBpejum5YbttCP0Dp6taGuCFhpokDn
	v7U+s3FwSxE5Kmo5oTqmU1wXZtqAG5SIRLDRI8k+Wm/gIKJlkT/Qme4RqAUH+8rfxtZji8eyvqbgb
	q5Cq9evtp6UWXm2MI9zqiffZh+Ea5FDW9tUdk/cp9hbM7aNVRnhVTa3S3s9mSEonSXPKMMzsPI3Pi
	hvrzdgBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU43f-0000000BK2g-252t;
	Mon, 01 Jun 2026 14:56:03 +0000
Received: from mail-northeuropeazon11011054.outbound.protection.outlook.com ([52.101.65.54] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU43d-0000000BK2D-0MRC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 14:56:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ez+BkshSdDeRR5LpP7xdIUNnpX9eEAp8nTATOPitMSnVWjfTjzwTVc9qNHPs5KwKUBrzriSAkgWOBJ0/Fm1gLHoy4WZJ8LEDIKlCfK14yxOlSOrum9Aae/5P/hNDqFp2tVWgWr0Oct3ZoRuu4isYKclMf3NtkeRjASXaBBG3FJF1jOYLoRV5odqpfmwJdoKx3AiM0FdjuXgyFp95WDW75ZYqP38UDySQ9mTbRFaKVzecTO2i2LJk7MloiGaXMkK7w5D5N5cR1rS06LyrOuBae/YGqk9qL0oBZhZ6rw95eZi6HyvDtljrNM2J6zgKw8iv0vRlRBbfR5leEZSWRk4ehw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=03TQwGi/fwdLQnsZNv4oipJecJ3ssQ5B/EqDLU7w+98=;
 b=jelMOg6rS/wFjt6xdAM06gVswzmgR3/qkZsYfox/ogLBoyrnJ0xj0/7GkTFWB1XullfuQS19a8R8y1RtKfuHzBQuqzVOhtfb6F/jDBlvX2Ut3T3v+0mwx/bRZCqV0cXGO3jJtPoUXsPcAW1XX55DVhJuWAqoL/002WiOR4HBstOGTWF9T9M9iIw2PNaLHV6hAzozV7iLWzus8Pq+4lWXyBTMcY12TZPBGicuRfIEOKMTPn7FppCVE1g+7lP7KQmF5/ZUxt+hXdJReMZVMw2YBLjjmkWCuKMa3JZJ/4+sX+S16BrieMfVXtIBvLukCLbccCTpkTmDohgxwxKzJNnn1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=03TQwGi/fwdLQnsZNv4oipJecJ3ssQ5B/EqDLU7w+98=;
 b=XE2YvAbGgUNoNFu8NEQCZOTqgbsnGD4eEu6m9XK18fttaBKlAEyljgaGGADtngtRaCnjJT78b+bKiyHevJ32sBdHl/0MUcL2NyznBJeYDUGcp8wvXpB65YNzvea3QkHkzzc4tF2uwQbZBPOxvgxHSbFQsX6x+Wq/jXChw69r5Fs47AMPQdcit8zde6HGrnafhkqeFN2B9xW6PNZA/RG0mAfVBh7lExIGFiBwLxfkvypYx2kzPH2h2sKmhGelI2jLQYAVOTBvosRxMKfa+2rgifjPxNjqdAYjXAB5zDqzs1+xtbEvC21cnnXRMb4FHpztkt2ZvSREI5nZpi3DCuebDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8548.eurprd04.prod.outlook.com (2603:10a6:20b:423::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 14:55:56 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0071.014; Mon, 1 Jun 2026
 14:55:56 +0000
From: Frank.Li@oss.nxp.com
To: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Eduard Bostina <egbostina@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 0/2] dt-bindings: watchdog: Convert TS-4800 to DT schema
Date: Mon,  1 Jun 2026 10:55:48 -0400
Message-ID: <178032573876.3923333.560449157923701951.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323175948.302441-1-egbostina@gmail.com>
References: <20260323175948.302441-1-egbostina@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH0PR07CA0105.namprd07.prod.outlook.com
 (2603:10b6:510:4::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8548:EE_
X-MS-Office365-Filtering-Correlation-Id: 14fd33aa-ce20-4d81-fc59-08debfede23f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|22082099003|3023799007|18002099003|11063799006|56012099006|921020;
X-Microsoft-Antispam-Message-Info: mPP802T+L6T1HXhxSU7McMQGUfX9ucXQ12blVJCfDD2xIdf5slM880hSiW/+AEPbDSZ4Ca5EfSxL4FWi0GleYEXlY/WWd3dwzXRc2NKSEzedepfysh3g3+Gxg8iDdsdyX6uI4aLQqbNSF1E6TobtnBkjiangzsx/svHtBDcry7HSAD6I+l1OFgCha5HNBc7OfWiPj8qyxjoi0fDBcdOWtegNmGNg4KWAJBlIJ7iJYgAn80iausJ0GLzoWLFULcE3RSSzwu9ZU9jWFYv0jtdYCm41vajW7ghubYjuwtpCJwzvhxX0aQp2XaLyUBGZmanoBiZY3X1J2UEGtiLtPpWCGFQq/9Kj4AvMH9GqnemHIcfu8fBK8ji8AdO4+oiYvs4Yhk8p4Foxb1D6t1Wbm5mdPT3hd8m2cOaoXitjqNOpM+glHf/x3t7i+SNIoLQOMzWajqDi8Y3ohqvriu78sewXAT+uxvevJKqjFmaO5CMmexReVt/NxHLzoDqlEIbitavh7kgb+luSYepEbJy/O2x0Yg1T9voSPMXvSQHOj/3NROtmRLRZjRSi7fHfRvJ+jVe4f9xZtRxLZ1byuAdlFc0uCaHx7diBa6v7kFq1zWCA5JSDnsGXo3zUgTP0w4BWq1OPf5NRlyio8MD2Iy+itNQZ9BFHfzjn72itp8XRXSvsgMgWOp/i79T2rezFDl4FGwhuSpZTC3gUrlIpcjegQFYd0aef+r+1Nnz1+OTqgGYbd4c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(22082099003)(3023799007)(18002099003)(11063799006)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aE02YzdkY0p5QUl3YnhSK2dwditQQi9EMUY2L2J4clJEcW5pWE82RWRJZWJ0?=
 =?utf-8?B?alY4akZOWFQyRDZ0Z0NFdmdYRlpVTU9YMi8wbzVKVDZZNHAxZHMxQld0REVO?=
 =?utf-8?B?NGlUaEh4elhweVhPeHMrZi9rTGpPa1I3R3JWeDRhY29LS3oyZFZtQWpBNERi?=
 =?utf-8?B?bG1TS0VwcUs1VmIvVU13ZVdqSXZ5ODVsT1NxYStNbGpZckM0elhxT0VVVkg2?=
 =?utf-8?B?allNN2o2bjFzVmZPUzJYN3lwWjN2bjR6SkFFcTZMVEFqKy90bjFxc2ozd0xT?=
 =?utf-8?B?RHloaU9LNjNDQnlHeEFWdUpUMjBjMzdnT29xWnJOeHVUZVo0U25INDNJV0Fv?=
 =?utf-8?B?NTdWbXQ0ekRoT29pVmdKSzVIKzdsU0NnRzA3cWdIb0pWMGRMRWZRR011MnRG?=
 =?utf-8?B?MlF2ZFNlY3J5REUzaWRXYURXWkxheDAxTERTMnhXdVlpN2dsb0cvMVM1M0ov?=
 =?utf-8?B?K2lCZ1VNZ1YzREU4czBNVFNKNnc2dkExQjVaTGhPbmllT1FvUTNEQjF2MmI1?=
 =?utf-8?B?MjJoZy9kekk0YlVTM3VsYjYxQ1R5Q0pvU3YyVjNzMzJ0bW5yL2pNcWRiM05r?=
 =?utf-8?B?VWUrQzJFdUpJZ1ZnU2U4OFlKVU9lOVljWXpqZHVRQzhRL25VeEozZE85NlhJ?=
 =?utf-8?B?MWZpSm83VUhjM2hsTS9SNnM1OC9tTTVQSmhTc3hWWGp2SHkwNXpjdnpPUEkw?=
 =?utf-8?B?SVBsLzVZMDMrSDJ3UWw0bmZXK2p6VTVpNFNsM0dkeE9NM0g2L2lJRU0yaXRX?=
 =?utf-8?B?QnBoWUtYRjkyUTVaaU5FNG5nUVl3cGtuWGhGZWZPMzJCYjlXYXE0R3pwZytC?=
 =?utf-8?B?cVgza2d1eXAwYjNHeFphb3NJVGhPWFJiMjRWZXVaYldPdEdKd1Z3WDJvV0JI?=
 =?utf-8?B?VFhOeU9IbnZpRFpDWXRJM0NGSUsvcDZESUNEb21nWDJ3N2RJdTdma21sNnh2?=
 =?utf-8?B?blQrMFppeEdlanVJV1ZHODgzb3lnc3lnQnFwQmNSNDVaM2RQODE2eDlEbURQ?=
 =?utf-8?B?aEwxOC9xZithRWxUUkxvdHUvU2FEVjdjd2NvQm5rSUoxSzR4OW9maHZaQnFq?=
 =?utf-8?B?dEJNUHFOYURzSjhRUlJiTm1YN0xhSU5rWEhhS0NEalNEVzZlTXFtMnNNSGJO?=
 =?utf-8?B?UnU0dmtCYmUzblJrRVFOVTZpQ2Q4Z3pYUm1oVWdwWUVzMUtPWEV1blZ2Q2tC?=
 =?utf-8?B?SmROMkRvclJZWnUzVHVMTXFaakh1Y0ROSmF4Mi9XSnF3ckpRQU9US0xMSlNL?=
 =?utf-8?B?S0ZyMnM3R0lKM0dQc0c1ZGxtM296S29NL0JpZDNyQi9za1IxdUd6aFYvVUlD?=
 =?utf-8?B?b2JVQWNPdWNqeXZmVndzSGtFd1pzWXdtdlFOK3Q5M2t1RlJzTWs3UVdWWGY1?=
 =?utf-8?B?bTRpMXptMWwvYzhEYTYwMllJQnk2bVlwTWNVeEZlL1pwaUVvOHkxejZWNnI0?=
 =?utf-8?B?Q1dJTlI2NEdYWlFhT3NkU251R05Hb05OTEQ1dHd3NzFVRTI4SUdpcWFXcHdJ?=
 =?utf-8?B?eG02QVBLamR1MXNOZk5KRmM3S05KNlFDOVg4VjVudU5GUm1SeTJJUjdySWsw?=
 =?utf-8?B?RjNjak5Dd2ppUTdtTkJmR0VIQUExOXY4aW9FN1FVWmxrbmMrNm9hcytKMjRi?=
 =?utf-8?B?cmlUd1hncEZ4WWJoZmtUUGp5MzkzdzNpZDJoYzBEWERaQk9lWCtjWnVTOEhj?=
 =?utf-8?B?T29JTzVjRS9HZ2lIR0hFUlVaSzJPRmZMLzd1M2Q3MHlPREtqMzcxa2NvYldl?=
 =?utf-8?B?RnZXVFB0MW9zSkFHSWJaMDdWeTU2c3hsKzlBWXZQbERYTlBtVEdxTkhIRjBp?=
 =?utf-8?B?QUpmSUE5K24xbm1Gd2pTTS9uSlMxNXp4V29aZFhsMXJLMkxla0dGSnNiV1Ru?=
 =?utf-8?B?emJ4ZW5UWk5xTEdBRnMrN2xsM2Ruenp0VHB2bVdFb3BINzc0MlIwU3UzZlpQ?=
 =?utf-8?B?bGUvM085SEZheGtKWVRFTnNDd3pWZEt6c294b3BlbnpNSXN5RU0yV0JDOGlT?=
 =?utf-8?B?VnRYMnJWU2QwM2ZvaVlSazVxWmJobllDV2J3TjF5QUlJRlgyNnlDZFlwMjF2?=
 =?utf-8?B?TGdNeFFBSi9zZUZad3g2cWIrRUNsdVR5V1VTTDBiMm94NGc5WDZFTjRwd0g3?=
 =?utf-8?B?U09CcUVYVjNlQUtONzE2WDlBSmlWdHNkczFhSWRUUTZFYi9OQmUrdlI1Mzgz?=
 =?utf-8?B?VUtEK0tjV00wWldBUUkzZUFSZ3E5UGZia1B4aW5WblZ0Zk9xejliKzQ1N2tr?=
 =?utf-8?B?WkZjRXZXTzZDUnNmd0FvQU1mTGh2R0hIc09iUmJPdThQRTJ6Nlh5S3hubThQ?=
 =?utf-8?B?Qk84NzAxUGU1c0pIRE5JSFRqTW1GczFoeUJKUDdWeExPbUhqNGNscm54NHNm?=
 =?utf-8?Q?TLawzk4/3p5yOrNc1nFT6qKnFqyd/C8Zmm33i?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14fd33aa-ce20-4d81-fc59-08debfede23f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 14:55:55.9019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R2gm2ZUT4qSdIm7O7pIlSTzHE1njAxfCl7TpSLC0e5pYiSnmHdbCoxLf6Xi/tE+K1LAcBett7TLJ3qh5IVXTmf7qCvQ43vX0QgbMFVrUA41PVxzS3uDhRFltD0cBiJoD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8548
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_075601_129582_BEA11398 
X-CRM114-Status: UNSURE (   8.79  )
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


On Mon, 23 Mar 2026 19:59:43 +0200, Eduard Bostina wrote:
> This patch series converts the Technologic Systems TS-4800 Watchdog timer
> bindings to DT schema and fixes the active hardware node in the iMX51
> device tree.

Applied, thanks!

[1/2] dt-bindings: watchdog: Convert TS-4800 to DT schema
      commit: 6570a6354bd35619070bedd71dee027b5ecf6006
[2/2] ARM: dts: nxp: imx51-ts4800: Rename wdt node to watchdog
      commit: dcf7bac8c2470a61cd457ed2e6f57960004ca392

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

