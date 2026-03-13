Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD04107BCCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 16:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:References:
	In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3z0kvyguh02soYNpyKiLd5D3yFSl6u+fq+3GyrVDZ6o=; b=CQubaK5neuEMynXvqPi5lXQxSE
	0K2cAK0cfGbkL40DEk84kO424YdItlcPAJNDJ7hoZJCN4tHq6csvzYyYYQGqS85aOyBLxHrII1yoO
	unlijcbV1C5M46llX1w7mys/o2LwmB0e4gsfxvMW+T+084jL371jpnxLAbuc0biFcK1/NiA9N8I2U
	vGOiXWVIfx23YJIa0rcaG6/cO9oYTUv1IDVC+A3O1dB8YOvGSx6eOSKruL4cJCoklxGovfCdkehoG
	RLegF4sfAGibmqzm8g+miPb5byEOf7+3LCnjbuTwmJoPMQDW+ML/H4Y5fDsSKclIrqL0WnxXtKGFl
	9cN72kJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15LK-00000000dwS-1nV0;
	Fri, 13 Mar 2026 16:26:30 +0000
Received: from mail-swedencentralazon11013066.outbound.protection.outlook.com ([52.101.83.66] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15LJ-00000000dvk-0CSi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 16:26:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H/hlB/gAiBct7E2D8WYgQeOqK5Pg6mpud2VXr69ZKVoMm+o/7va7RjuYqZqcsRVPPbK1ekHMQTJZaMotFJFIlD1tvSlqedvOShdTkvdSlHbxLnAbOYMdknQNyUIMsb6NbpmmAuFIlr9cjlgb3YCehVtrzZcnaSI8Ew4imKZRcbMQ4tDeL2uRVDeCa5sfwII5Yiy28muMRZhfyamYSkeK1539IckClT4AmGTxkQyv1jS7rjFAgGDJzG9MJChPuoOb/fQ274DZVMUZhYUESUEIUewL//5NbkNqZOwuP4Iy2bVUBid2NQFaj4FreHbC96ILGbrYQ5/H2wW3vODyhsUKwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3z0kvyguh02soYNpyKiLd5D3yFSl6u+fq+3GyrVDZ6o=;
 b=kF8SHWIun3swnWVXDmxbb5EGV5iIcEB8/rdSCacErsVuweDOI5LCuYfNlJVggvaELtxD/3iCNd3TY+3PNgSH4BO2fm/EaPFeysgahd0/f6OxgKw5fxuZKZtORHCZ8BIgsgQ/GbfTlKzYaMpTCkFOkEAYEZ7R8bGgIP8GxB+tTmPgb+W6XZyQm6BmqLBU77YkR40C7+BMDsKgnOGkHJOBAaKJiTjgqRkRYcRFLiBbahCADCJHBLsSOsLebz++xHFbEzbl8PNcuQr5cwVP28+AePv9BLsZIeB2DVf4VdqMKZj2xeDUehZTJ2UQih1YPeV5iD6bnX5APrekcZ0Yu98NhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3z0kvyguh02soYNpyKiLd5D3yFSl6u+fq+3GyrVDZ6o=;
 b=ngHYfhf3iBLMVEkc11/Tj+OXy1IqUglkq9mg9MtQxbRm/YzE7MNp1otf8aEGo+Z1myr2rFCHPYLpsdbU+VtyIF35497iYozSoOfo5Ftg9lmzKpz98mNo+tgAtJB3Io5ngk+9DwVI781lOhnC9SsU5APIhy7HQShE+qW63O69+9A9gKzB6vGQtbxml6WDnV+lh579lJGI8VkSo2nI6dF92nrPd4jsD/Zym1iQLNDi7Zd5USHBAhvmTKZNKb2QcTEXIZ8VyGq4AJtZsIvaAKlTOVJ/0oFzG2w/RR7aRrpo7JWGI13IsVHUUF2bUg4f0cbRQlIVB0BIHMgnjxE5hdjYmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PR3PR04MB7209.eurprd04.prod.outlook.com (2603:10a6:102:92::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 16:26:21 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 16:26:21 +0000
From: Frank Li <Frank.Li@nxp.com>
To: daniel.baluta@nxp.com, simona.toaca@nxp.com, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christoph Niedermaier <cniedermaier@dh-electronics.com>, 
 Marek Vasut <marex@denx.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
 kernel@dh-electronics.com, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Eduard Bostina <egbostina@gmail.com>
In-Reply-To: <20260309181524.39423-1-egbostina@gmail.com>
References: <20260309181524.39423-1-egbostina@gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mp-dhcom-pdk3: Use symbolic macro for
 IOMUXC_SAI2_TXC__GPIO4_IO25
Message-Id: <177341918137.116977.13123336084834992160.b4-ty@nxp.com>
Date: Fri, 13 Mar 2026 12:26:21 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SA9P221CA0002.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::7) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PR3PR04MB7209:EE_
X-MS-Office365-Filtering-Correlation-Id: c3be24f7-ff50-4dd4-e3f7-08de811d42e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|52116014|366016|19092799006|18002099003|22082099003|56012099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info: k6WOz8frUzosFtRBHwCq2IXPJMqzg8NmJuqaeaBpTF6IlcOt1rChvFH1LC2ymubzcg0mFOOIwqZE3HCkVxCCqo2k5uOOpwYdWt9wDpAlHjXOkzMHoNIEIBS1xIzl6FIHGyoxzdhoSig978ao5EgvMpmq1rAvZ217LxWsn+03cOXajz2sB1djBmzltYpnoF9+iZXD0slbvYKx96dDywfjG2l/OwEAHPW6Jx2amBtHlDG2tX6dAgW6euVLutT9DH8+KePzYAhmamsHrWCdMve81itFUsrKbzKTFvuAjDo1TOjBjduuQ92pJY1I6GNTnoft3tQ+CkD8a7SzHyfFQyMHKYGDykRp4RnaV0hlZ8JMdP01mdxt73WOBySfbQauFz+YraCOqDfPpEbq86ghP6a8l+FUWmjiZu121dXwoHXPA/EX4lalxuaMrCpqXhIh2q2WOqQ2lPmOOTLeTFcLkgEz2kfFvjWh5miiewHLf7xhTYy3uCJ33frtN9jTBnM8tXQTpUdtOsX0M72AZBMuWOaC4H9MlF915bP50TXpR3vbeCAn1XQzc2e/aPgHpg1DaBxytRFPJUzrEKVJtXuEoJQfJprlZ7FJCZbo/R8ICqVIT0SP03+/g0teLZ8QmxKezA1CM6hcuMPR09OUr1OLlcwPO/gcAYrjhj/VpmJdlYsDR7nnXkw1oT7DVpap+I43zsmPTJC/A6kvCk4unJGa0NoZRH3aOvul7ymTWdI9Zov7BV2rc5MdPvWO6MEhJDCAoezc+vswSFIrdmGxUOMBqvULj4Gi6Ga6We2VrjDTlc6UEqA8HW0wLjIqssN/E2dqAAIq
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(52116014)(366016)(19092799006)(18002099003)(22082099003)(56012099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ck9lUEhzS0dVZjdzUUlqSkFLOEFOK052NnErbzVSMTU2S0tzUWxYcVIwMnND?=
 =?utf-8?B?Q3NCWHVETElYM2dCK2s0VU5zbnAzQWUyZDUreE1pMGE3ZUI1YS9BYnpYclZL?=
 =?utf-8?B?Y1ptWDJQb1UzZUluRFM0WUNPdzMrWmliUW9hQWZFZDB3cHFYc1Z3WTdKS1FC?=
 =?utf-8?B?N0RLL0pISGRyb3dLS2RMWWdZYzBOYjdUZ3RIaTJWb0VPRzl1bFoxVjhXNERQ?=
 =?utf-8?B?OGwzV2RLN3lmWENJNmRMQ2MwY0NpM0YrREJoZTVjbVJBZ0NUSThxaTRXeUl4?=
 =?utf-8?B?bHdEN3pmNU90T3hHYjhSQTRNajh1OUlKbzJMeSt0MHhDTG1xMjV1Q3pEYjk0?=
 =?utf-8?B?YVlUR1JZRXVSMGhBZmJTcWJsTjVZSEU5T3FaMzloR1crR1R2N3UrZDcxYWV4?=
 =?utf-8?B?cExMNVgyNFhnOFlVQjkzcG5NNGlVZTJ3OFpPZ0M3RXp0VHVzaTkxRG5HR2lz?=
 =?utf-8?B?N1A1a3I0S0diNk12bmwwa2p4N1lpeWhFQVlLd05QNXNvWDlFZ2pOZ1hHbGNK?=
 =?utf-8?B?UHdGWlI1aHk4UzAvbktYeGxXdTViZzhIcGVsam1JNklQTkpxdHpad1lNL0Nk?=
 =?utf-8?B?S0xJQUZSRC9DdDVrazdqOHdHSW5mWlF4ZHVHSnIzR2MyY1hMSVk2UDdEV0Jz?=
 =?utf-8?B?dnhJSHFYS0dOMWdQeTV1cTAvUEw0UGRIRGEraWtoYVptb0xqeXN5cXloRVEr?=
 =?utf-8?B?RmNJOE9EWFYycDI5YW41L1QwOHVKQW9SaHU2aGhEenROeTlpSXhzanErWVJM?=
 =?utf-8?B?MXFrbUFmR0FCY2p1cjMvSGJsSWN5d3h1NlEwOE1seTIzdm5KaUFXaWZGZmha?=
 =?utf-8?B?MlM3aituemxob1ZLaXU4cEZQYUxtRjJuR3NlWVZQL09pNG5GL3NBajRoSS90?=
 =?utf-8?B?bEZ0M1A1SnRlME9jTEpqY245OVZDYkxJMTBmYi9vTVV1VHVTd0xBaVlDL21h?=
 =?utf-8?B?c1V2YmhSc0M3Zlh3Sk5oQXlrZFY3d1R1bmhSWDZ6amhIRTJSREt4UG0xWjNP?=
 =?utf-8?B?dXJYcUdHUHArUWE4R3U4RTQrUERWSk5qQ2FHRENkc0lvUXk3cDNyNnJ4NGdz?=
 =?utf-8?B?WUZEcStkUXJTRlZtcm10c0tEeTlhdU14TTRZTlNXWUsrUDUwWS9ZOVQ4bDBY?=
 =?utf-8?B?eXYzRVpnejV3TUd6STI2eXZZZWFmcFZyMTljLzVGclppOG0vN3dldEswdWcv?=
 =?utf-8?B?YU9pTHdORGlUU1Ztc0E0eGx2VHUvYXNXVnIzdGoycFN1dkxDbHZ0SnBMaDEz?=
 =?utf-8?B?SFg0SHlHa2k2aG1jVTMwc1orb28zK1BIMUMrNmhjT0ZMaU5LWHgyL09oWmNY?=
 =?utf-8?B?MFFuWUNzbW9yTjdMSkxiRExnc2hqNFIvQ2lLUTE3aDhZS25FU3FiTkhVeCtj?=
 =?utf-8?B?YnRXN0ZhV1U1Q29kSEZPQUM1a21XWGFBcjhOOEdKYXRFSllTZVlaNngrMzNN?=
 =?utf-8?B?RW5OOE1RekhkZHhISHc0QzF6MGxUdTA3NmY3dmhYU2hGcGVOUFVWNHZSazg0?=
 =?utf-8?B?dStQUDhScVIrV2F5emdhSndTREtQQSs3RlZiMktmTXpxc1F5M3BBL0p6ZzEx?=
 =?utf-8?B?eHRCUzY3Q1lwUDdvamhqQVM3SzNEOTJ5UWlYdVh3MExFSjdtUGFzaGRSQ1py?=
 =?utf-8?B?TzY0a29Fc3pSSml5elBFOTB3dmtBWCtKL2JpOFIrZ0JJdjFHdTMzQXBvS0tL?=
 =?utf-8?B?T0Z2L1h4Mk95Y3VEVlZkdS9RSkYwbzI2SVZ5TEJ4TC9QWjBKWUhXVHJROVZk?=
 =?utf-8?B?SFdVeDN3ZkFwZjMwK2hyKzErL3Ewa0lTZCtPYmZreURXbU1NcG93RkdXLzdo?=
 =?utf-8?B?eTNtcDRQTkNpTko2YTZzRTg5Wi9adytlZllCR3FXRmkyU1VJRDB4eEVwK0x6?=
 =?utf-8?B?dTgxUkhIYjZ6TmxGY1ovd0ZTMnNhYzZCT0dTL1hWaXp5TU84YlM2dVRTVENy?=
 =?utf-8?B?NEd5allkUnBDZDg3SjFLWi9BUCtNSWNzQzVkcmd5U2NGR1EycnIxSXlOdmtt?=
 =?utf-8?B?MmdMVU1WR2FBby9uazFoNm80ZG1QQitXY24vUHpMNUhma3ltdzhFQnRXbS9J?=
 =?utf-8?B?cVpyNldXQlJRRzN1anl5SUx4ayttc3NHck5FQjhyQW1FQ3VqV2x0c3lTb2Rv?=
 =?utf-8?B?eENQc09xRFhUNElCK2k5QTZnclE3Yk9pRjRSQTB5NkNzbkZpbkpBWTBXbHg0?=
 =?utf-8?B?NGFhUUxOeFd5dEpxb1g4T0gzVkgyeEhPOHdFZS9ZRTlDekg1VjRmVjRRekZ6?=
 =?utf-8?B?Z1Z2UWUvS2daMEdXMW1zaTBlZy9Sejc4S3dyVHpBZFl5S2pROXU0Nm94TjFj?=
 =?utf-8?B?MVR0S2VITjZoSVhQeUxvZzFSazBLVWFCaVgwdWdwRmV1RFJrK1NDQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3be24f7-ff50-4dd4-e3f7-08de811d42e2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 16:26:21.0845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SzqiQmYWg7V1LvJQVchFscnvqjYO3mwbWgWnWYh/rmxfUVSrzLhzwGTWSbA+7+QPaVZLXWN2kluWefofyj7KPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7209
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_092629_113025_918119C4 
X-CRM114-Status: UNSURE (   9.90  )
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


On Mon, 09 Mar 2026 20:15:23 +0200, Eduard Bostina wrote:
> Currently, in order to configure IOMUXC_SAI2_TXC__GPIO4_IO25 a magic
> raw value is written in this register. This makes the code not obvious
> to read and modify.
> 
> Use the MX8MP_SION symbolic macro instead of the magic value to improve
> code readability.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: imx8mp-dhcom-pdk3: Use symbolic macro for IOMUXC_SAI2_TXC__GPIO4_IO25
      commit: 79ab6e297167b6eee7540af315bc5569e42182ee

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>


