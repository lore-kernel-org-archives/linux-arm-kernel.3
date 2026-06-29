Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C1AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 21:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+Qfo4eMH7AAJF5chASl+IVG8P+mPOUu40/QKeBFMAc=; b=o7rly235SaOD80UXtoB6tsMONi
	4zqsFI39ui2OK/UdN1+DZKVHrKSuZZa38IB20nfKrXHT+VW2yk50CgTeAIAXqQ/YHw+boVcN8BiZV
	nwpZl1Szl+7jnvbR729CS7v0E3cPlgb5CsDfLMxFl29+bcbo18m3trXO5isngHcMkisKWJ2c58uo4
	Hiz7kk8k2Vdv29kO3OKz9EQzrbxUwgw0peyoU4go+PhbPtM1I1Q039ZdvrPffvxGX9pZtaa04oh3o
	Crn73MNdUNBdOr/lzGzM/gpeGfRbfFryqA/YgSbrqzdHJ0qdBSFw/Baz2JL2B9Twj1uCQydUMAew3
	oXtDQLKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weJFN-0000000FUC5-44la;
	Mon, 29 Jun 2026 21:10:29 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weJFL-0000000FUBk-2T34
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 21:10:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lwzVhHY3EYdEMyq3JyypUaVjtttzF3L0TYVHfwVIuuhy0hTOkjcILPhxeOI4itaOud+Qbb6YGEIh5TuVdFMr5CnhSEWElCPMKPzOaLpj7DD/21RJ8yN2ozqDRV//TsvYZt/7MYkZVEyyy9aEhiit/6NKELX4z6jAVKD9AuMrymzDF8j+jDYojWaaGERlkk8roEiJrmDIUmOe835quaIDtqanjXeSmCAXCXrHMTBbjLMi5jrlV4LspkLYth/txV2tUSFSkvPmlzpm3Vz/uw0zT+xjAe3TJ5K4sEgXyKZhtG58wTMMk+3j1w5c4KaGenv9qyb/ket1y8ICzIsDQMWY2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+Qfo4eMH7AAJF5chASl+IVG8P+mPOUu40/QKeBFMAc=;
 b=gcOd42QloWIKXti0GnVcGNK/wryg5cRtL3+RDeV2OxUf5YXF5Uzf7/ea4qjcnzP7bfT6rf/0+c62EAIKt2B+tDHVMpyHjAsTwwUaGuTLEj6JZ1LBo875tFAoFx4FDsP1RQAAHQfopC2V+jwyyPyk36+Lvq9tI/RmAFSufPQ2hs6keOHr6i9RuQKb+1xb6DhPEjtKff65zN1lsXHUX9Wy/dtXNZKsk8jRlptPvbS/5zTwlygn2UYfQFOlj6O+fxHsstukmvIFrJV9OahuGU05ij5gJ49lYuWzIuSYshMf3JRRm7t6O9lO/rZep8e9OW9xWDCHjHBzRi3dPwJNFob8qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+Qfo4eMH7AAJF5chASl+IVG8P+mPOUu40/QKeBFMAc=;
 b=Bz5imfGcwXdE2iL/MrRf24QWW0/f0R8S3JT0FZGb9IiqI8nWzI5XuIEUGQCY7PgAek3lw4Q8F9v1ku/tFwr00kXyj878fgz6+vnubfs/VqW2ixy/CvXzbCNwkBS7gR0Jl2CCMEXyt8eHtmiY9UWbtq+4D2Khfda2GboYXtzAHMLrU1lI0JRA9cKjqMfO3pIhLJUKOdpeHKAEEyHvgYfEqwv56jDCusbcW7IzTDn1HlGpD32o/lHw+9WRcZONCNBFLrBexav82zMXx1i+iloDtA/CtHxBUGsPTe7ORgQd0t1dcSbc4grNoQKsIL4ivUj+R34rbgPV4skapzqwl8h/7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB10033.eurprd04.prod.outlook.com (2603:10a6:10:4ee::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 21:10:22 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 21:10:22 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Frank Li <Frank.Li@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: freescale: imx95-toradex-smarc: add alias for lpuart5
Date: Mon, 29 Jun 2026 17:10:15 -0400
Message-ID: <178276740916.2496507.263937302163138587.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622093507.44132-1-francesco@dolcini.it>
References: <20260622093507.44132-1-francesco@dolcini.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P220CA0114.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::8) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB10033:EE_
X-MS-Office365-Filtering-Correlation-Id: 33e056ed-2594-49b2-106d-08ded622d4f6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|19092799006|376014|23010399003|366016|1800799024|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: vBM+1zvc3/aMkN6PjnsquJLyNXzYwqrjC/oj7OPlY89FuYJJOpxbVSnRlmnvDDh56YvbPlLmBSxlzlRfezj9578qJFCUJrAYYo4XU/cTBuEjMJve/Ml1JHK+fkX4E/OsB4EcwuJQjoVdB/j08bUI3ZLum1qRLrP+2uhdfXvw4h+oWMlb8ESpAxp8GxfZzXHkCGzCrgOV8PkZKKZ5dqsyEDqHRdN4PguKHsJzqOEEJirtiuBwYxz1gxYb4cLJjHhBdMQHzBotSaSJyJHhhxqZev80rmozXWze9ZUnM6oYlMEuibWiz+H5yBvqPNQ9KB0mVX0TDBsiEWOi5RlwKUXVmAsaFYuLekSm+YMXkdFoALWRnC0GThNzEw/NCi/MO8qDzkiFJqb7d1dU7jl0Fd2g6dejUgjRzaDZP6xoiy52Zrrrh1IuYJ/JLz0BbIaR1KG0fmqMkSf5oh2h3T3oCcBTymTQMUqy7xilWAsQOETaJ+cemhLUwYO15jz+Q5fRriRfDSIG8GZICILHQ68jFuE8OAdRcSTnDHzza755KceI+ARYEnQTI2pnkFyf4zXp3kcE5ePHI7ZzO8o9ik8aV2upCV7UEYoqO9oKjGu5ctHOQlqFSei6J+GFGGeIRXMO2Th/BV0O6VfGb3vaUqMVNeAm1v7flN4ncxrmLHTX63wsVMI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(376014)(23010399003)(366016)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFpLS3JJV2p6OHhMNzZDVkdkUFh2TXE2RmpzZkxDZUdCMTRSSFlka05nOWpY?=
 =?utf-8?B?L0RIVk1lOW8rMEV6VkJlYW0rTlZVMHV6QThHYUNscGRUc21ncDY1TFl0bGRU?=
 =?utf-8?B?YzA5VzlicXZWdWQyREZBQjBrZ0JjeDArTEFRSSt4Z3BJclNRb1pkZWFaUGVK?=
 =?utf-8?B?aHZKdURpTVJiTWNnU0pjV0U1OXUzQjIydENMK3JNWVYxWmJ1ZHZFL3d1Tnhy?=
 =?utf-8?B?dVRJdFVzQzROY1IrOEtMZ0RoVnlrZTJ4cTI2UENNYjJ6N1k5VHVJVk40cmpB?=
 =?utf-8?B?NEdsd0ZVMlVpME9zSkFoZXU3MHdWdlpqYmdXZXNwTlVRR2FZWlNyQlh5MXpX?=
 =?utf-8?B?ZWlseW52RHRhZlNLaGdHVlZZbExKL1dUUEMrTzBoeitIRjl4R2pyR2JEelR4?=
 =?utf-8?B?TittRXVrd29QZzVyWUk3VDVHcS9tdWV3SVg2QW1LSFpzdmwyNTM3T0RJNEhW?=
 =?utf-8?B?S05jQ3JKRm4zN0JBWWV6bnBuVC93dVE3aTZxeG53VGhmUXI4Vkw4OUNHZG1l?=
 =?utf-8?B?YlFQTHBLc1luV1Z0SVZYNzgwaDRzKzh3TWJURUtsR1FISXBKbDhCUnpRWS9Q?=
 =?utf-8?B?NkVxSkZtcGRsR1JZejhjWVFPNTdrTStXdW5oUUFObkpGWEEwc00rdjdNdVVW?=
 =?utf-8?B?dlRpTVY3KzBVdlNXNnNIS0VQb0RieStscGdyMG5ETUJ3VC9VTXl1bHZkaitN?=
 =?utf-8?B?aTFPaFI1U2Ftcyt6RHQwOE4yWlBwZkJmUnhHMlhlTDdDeDI5N0lnOWlsbXE5?=
 =?utf-8?B?Q3hOQTdqOUpzU1BHdnEvOFgwbXhpbElsUllvT3pBcHBhbldBZ1R4T1Jwb0Za?=
 =?utf-8?B?M2NuRmdrZU8vZmpCbmFBZmRvWFNpc3RjeFppTE9CZExucXJOaE5uNEVjVVVB?=
 =?utf-8?B?QklyaVcxYlN5OVJKUG55dWVyK2VBaE5DRjNjUDhub21abHdPZzJMdFFTUUx6?=
 =?utf-8?B?aVZKRWRDTEdVZUxhSEZRSHg4d3ZVOENEa2xUYWl2c2Y3K2Uxb2QycFdMMkdu?=
 =?utf-8?B?UzBJcDlBaXVXSGdoWWVVaVBUbk9wKy9kbUc3ZzB6UHNOY0tYdURsUFFPWFpk?=
 =?utf-8?B?QXoyVWJGdEVmZ1gwRTM5WmNiTDIyRk0wYzhYYTQ0eWFIbTZHL01IYnA4N01K?=
 =?utf-8?B?Y2dCT21TMHZ0bi9Qb2lLWXNIckczREJmenRHcm5JOCs5NWxUQ3M4VVZoVHRr?=
 =?utf-8?B?ejRaTG9xQ0hJMzhkcFExeWRtTm9kVXo3cHNDcllnLzBwMDVtak12bEFIeFk3?=
 =?utf-8?B?SHpQK2pWWFhGSUR6aWkvcFAzZDdhK1d0WE1SSEY2RGZ0QllvZUI1NGRXY1VI?=
 =?utf-8?B?S3B3VkRGNTErcDIrRXVlMXBFWkNob2I0cE1JazVUanNSQzMzYnFGV0w5M25Z?=
 =?utf-8?B?dnU5Vmg2NzF6VE9QMzQ0aTdMb3NTMHRUUE9pcTh1aVdmU0R3ZVIxV3p1cXdF?=
 =?utf-8?B?bDJTOVJDRkQrZmhZSm5tUEp4QUhxVHBLMktLTFlhTCthRkxhd1BBRnlwd0xG?=
 =?utf-8?B?alNFcUhKV01LRVlLOG1ydWxldCtjM2dWTnhaVUhIYjU3blBacUhpcGo0MkJS?=
 =?utf-8?B?WnJMQVNGeGROMm1PRkRtSTJNTHJidEl0bEx2ZGJmKzRHRGZsM093b3NyckFB?=
 =?utf-8?B?V3p3TG1zRnNMclVJUnFRVFJtUWYzeHdCU2xhU2s1eTNHZlo2RWxOZHdpTnhR?=
 =?utf-8?B?NDFhUTRMZjV0UEtRemNSOWFPZnpDUCtleHI3MCtiYk43d3NyampnTnA4eC9T?=
 =?utf-8?B?blNzVnVnUGFjL3pxSWZBUEVJQ3NRRWdHcFA0QTBaNjlUT1pYT05YTy9JMnhY?=
 =?utf-8?B?bXVwcVNuWHpLdEdpMGlPbGdhRHpha2FBN2wvMXZ5UlVqY1p3UkhkOFdvMFVa?=
 =?utf-8?B?YTRtWHEvTUwzaFNURlhrbklObFVXdGlsOEFEajU5R1pZWFNvbmtFTHdLcUYr?=
 =?utf-8?B?RFpWazVHcGIzZ2ptUkpkNHZNRWVSeFpJUk9BZjRUYnE5dzY2dm5WcVFLdG56?=
 =?utf-8?B?c29UaWxEV2syR3h5ZXcvTmR0d2ZsVjJoZ0E2ZkJsekJHY3RvRG9HeUhtUEF2?=
 =?utf-8?B?Mkp3RG9DMTF3eU9pQWthMS8rbzNWUUo2MTdvL21Ca0pEbjBjUFBFV1ZES3VM?=
 =?utf-8?B?MXRPV0hZTXcxbC83WmVEZTBKbjl2VHZlbDVCMEFwOXRjelg2K2Y5TE1RR2Ns?=
 =?utf-8?B?NkZla1hWOGt0MjZCUGRFSFlWVHcxaFNPdU1hVmRvMUZEWnJiK1VwNDRUeW5Q?=
 =?utf-8?B?Q2RjRldDckZXeWNGMGVEcWpFQ1RZYklZd0tsN21wUG14K01wb1NTRWRSY0JR?=
 =?utf-8?B?aUwrMlF6bitoYTZsd2prWDRSb2dob3kvY2xOWjZsM1BTeWVzUy9TbTN3Zk1u?=
 =?utf-8?Q?5EU8WpjVEmHGAIzhWZSyO9pznXronut6ZC6E3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e056ed-2594-49b2-106d-08ded622d4f6
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 21:10:22.4900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aVRaOVQb6BQFYTGm5KWmo0nqjkI02RtUiUXbiv0Wqkz4dEYahfeIO6OuZfvIQdXT90vo8aw2R5b2Hu6b9UckiMN0SBMnhd0KLhXyiMym4vmMY+IoSTTK0okmjHvxuxWq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_141027_654882_A14571CD 
X-CRM114-Status: UNSURE (   9.43  )
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


On Mon, 22 Jun 2026 11:35:06 +0200, Francesco Dolcini wrote:
> Add alias for lpuart5 so the UART gets a stable line number.
> Without this alias, the lpuart driver fails:
> 
>   fsl-lpuart 42590000.serial: failed to get alias id, errno -19
> 
> This prevents the Bluetooth controller connected to this UART from
> working.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: freescale: imx95-toradex-smarc: add alias for lpuart5
      commit: 3385e2f77182469940c136b9eeedf01f27b7441f

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

