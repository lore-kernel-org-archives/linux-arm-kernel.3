Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 136B9C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 19:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aryjuMjr2ZgMo0RmOglyfoV06pbCZ7xoObpmnWRge6Q=; b=bPZILixiSXCwBZNTOBe6n06IrF
	7+VFxgjtQ7DBs5BiSm3A0RqhwU7IowfYrGqYvDNFSHvUoKnoRahu8lMG0fIMiupJWQeymk8w/909J
	A5O+qpqP6DAVg2NptApChu9k7/B2H0qO7+ZLBf3ErEcN9RQrv/G2pb3xe2997N77UchhNi/IgjE9M
	YDETNKcHVVxfVlFcE1dfbGveVXn7zkwKiFtzCXS5npFrHesSmoN6fWLIv0uC2Ip9AhDYOmdVSpKbQ
	yV58H1jHvDL18Ok4o+0Xm0MXjgogzMXhT/ioK3vQESgw36k0HJ1AmBnLAMD6ADTgZxJUsFazxy7qf
	KY5D/hIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9T6G-00000009NMF-3zbJ;
	Wed, 23 Sep 2026 19:57:52 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9T6E-00000009NLk-25BT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 19:57:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tOGsD5AnpLEDH2LgVsvtQy5xIo+/qNHRtKyWTTH5OqTIpo87T/3QVO/aQj4nYfVcUiz/lL6o8sM0sl3oH2a4sVrBisiYKQx44DOWiyMXwCT4IOdunYmPwlKlRcMeihw1O+Yk5gi3QxAo31aQ/9X7Af1NGtypjVL5j9sqpv6TIvmXasLzEpRaXVgY4+9E+A41Ia0TtcSFnDCwUTpGGqZyQpIH4a1ccMCI4EpuK1XYdvOZ6t9wBOo9Bxwquvo0LRrn7igIDMr5ggbRH8AFeB+zHcPSHe5SorMKsyUmb7v08SKcf0xtJ3oJRCLEOm8y6zAALVu3F/PN5wLlSDSjg8sG/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aryjuMjr2ZgMo0RmOglyfoV06pbCZ7xoObpmnWRge6Q=;
 b=cL0CHmItNItoV0KbVaF3mQghzg1rn7JsJ8JLfFdrl0GHV2iN3UJJxqEC1YXnvZu30wtHFYMa6LF0Fj4mqj14BQX17e94WXRniPsdnyuclHMUI8Af7s9hbstC0Fn3rieDOJBOybHZ3cVlDAnOxYU5YGQnQMqzOKTCeadAMfbgDKQpfoU47D+fHcc6iO2eIP2BNoj6svg1opeagH+S10vE7v8ZYDbT23GgNUlItJ2ZqW3DUSyY5zTuWVtET4kvRyQsMgCM2QlbewBU5a1Qz9cjbsJFCnmcP6ZUBkvoEyxNIeP4rHsx98wGabJUf8uBwnhONX3QA4q8LKHqBiX3IS4JFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aryjuMjr2ZgMo0RmOglyfoV06pbCZ7xoObpmnWRge6Q=;
 b=YuQVGj/noeZCaLknOMwGMXrNr/VoQN/BybKZWfXRtB26QbNvqxm+tTmUfwN6DWfUhAcifPDH0NfiVdl+UQ3OgnzyFogSs82SAS0AX47M4xyQRjqO6poPvOMY9DqreqpxgV57HKqhx2znDfaA3YbGuda/TzHvb1Bl6CPTqO5bjvYnOdFDO5Ixp1J9BBzVi19MQg3ZZK8whPgcaPSHGPCTBIEvbu/PL10GPLyVYkH/KFjnmxN5cwlMAxPsntabAVxxVDDLeecMJWejYMuM7DYe422f0kZr6bb7UKNB8TEAvs+Udl9+GI+gyf8e1RACUSRsogTXb99vz50Lhxewnq2l6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB7552.eurprd04.prod.outlook.com (2603:10a6:102:ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 19:57:46 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 19:57:46 +0000
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
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: freescale: imx95-aquila: fix gpio-line-names padding
Date: Wed, 23 Sep 2026 15:57:37 -0400
Message-ID: <179019345217.3732327.3355105751951394840.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915201825.24363-1-francesco@dolcini.it>
References: <20260915201825.24363-1-francesco@dolcini.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0191.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB7552:EE_
X-MS-Office365-Filtering-Correlation-Id: 542b8173-b0e8-4036-6715-08df19acefd4
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|23010399003|376014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: HB5D/lt9sUCqJx8udTk+/OWa4xf826MrWgP2g1Cq9m3VMAeaS9DncMi2d/gPuSkXRU5is1m7145PfZZnxH7yLTG95cVKBzCArvVoPlmS5KVvfh6lLF+FxyM+NXz9xetLxUfekEiiAcvzYrfmGig+wGsY1xnLkBMNGHjaCOfFQJ7Ycwd9axiy+3or8upvDLOJHjI1qTm7gjhvDiNwF8G+OYjf1TpYjMyuWuve3I0WPGW1R9b59bF57IagDREYeOkHGcXOyXlkwaWsAmSejPM0X39Db7ol8J4jHNjQiTXRzf2BidbKky40DN+l4/tMjVJPt5vXBZ8J6ZjYxBm8NMUFHkE5PZNfbOwuxSqQOahnuOtP2nnJ5cO+6Gmd4DXgfRs/QHa4EO1ZEe68zOVEXWiQcE0nUuZcAhXYSd+UCvAZVsrrwEBEFbQspcyk6GBrAtMqFM+K/Ix9iPhFtRiYqXtUkskaxrk6u0srQ76hS4S4Ib/qEhAqqOpx2ZPkeLyuHENGT6JuMoUhG8Rto4Wn++agUcbwVR1zkZIS07/+ybQZS4DE85zF4yR7S2h/fVJSySIuwUR73FwOnk3FljqInv6B5obrp8LUZ5seRJzgMXDaLwyNZjh0GW9vym1HUi6so9Id767xLMjccAwxXAHYQTXqXb2ZLnzrUFHtKFEUGozuKdc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(23010399003)(376014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEYwZ2lEbit4cHQ4L2VwRFVNZHF1MGdiWFgyNUpQd0dpYW0xdmh6bWh1OW5j?=
 =?utf-8?B?NzAveFlWejdmMUVQanJLOE0zZTBTUXY0L2tWRlNQVmR4MWpNOVlSbEd2VmdS?=
 =?utf-8?B?MHNsdW5QZlJMenVSS1l3RmgxNTRjT2hFemd2S0IvdVJYNFUrR00yb0dhTXJT?=
 =?utf-8?B?ZDNycTgvdnpKQ2VydGNRaE9ic1Y1ZzdRc2p2a1VYM1J4b3ZNdUxqRSsyUmRx?=
 =?utf-8?B?dGsrYWVwcFN1UUhtSlV4S0xjQ3pBU2tudUhIVjZUYVE1RWpmZDZlSlIydDh3?=
 =?utf-8?B?bnlPZ0pPQ3pBSFRHaWlBcVJYOE5Rd2grUTdjMlhvaWNtWVI0NmV2VjB4MnMz?=
 =?utf-8?B?cUNMRW9tUTAvaDNFMURjV0RIOGROL3NHTURXanJPdHdkendPODBRYmZvWHZv?=
 =?utf-8?B?UzhQd3ptbGp5ems3c1Y3amdxcHdkQ0JFK0pJc0tFQk9LaVJ2SzkwVWQ3VmZM?=
 =?utf-8?B?bGZyek1kbzVuR1ZxelRMVzdWMFdLc0J6NUhVVkZ5WmhsNFErckU5ZjFFb1BN?=
 =?utf-8?B?ZnNpWEhHeG43dUZmNUNBYnV4THhOcnQ1TVJsaHpibzdSU2MzK3NwUURNdDdB?=
 =?utf-8?B?Mm1WMWlDMGRlckJjUVUvdjJJWmc4aVdtaVJmemRhZkdwcTF4YXJGNHFCZG1N?=
 =?utf-8?B?M3dVd1orUzVEYjFHOWd1ekFTL1RPQmc1cXZUNjVHWXhYaXRGMmd0MldXRlpw?=
 =?utf-8?B?SUF4emVSOG15eTZPNGsxV1ppNWpRRlFxWkJYQ3d0d2MwZFppd0xzWXBPbDRP?=
 =?utf-8?B?ZlBYemlvekRPUVFhNDQxMnRRZzlqSVNpbkxVbHNaUUliTzdHUFd5N3o0cE90?=
 =?utf-8?B?SStNOHVGNXZkWitlbzRvcGdDTzJZWEY0WUx3eG9PaDRtWlFrbE1MbFBlYXgx?=
 =?utf-8?B?U09Wa2ZocFRyRFRXYXlzUjErVjVWd0RqSjJqNnRHdThsVzNiRU1LQnR2S1dK?=
 =?utf-8?B?RFJFNlU2d29lZDd1NGlISXNjTVlnNURRM2FUbW5YVktTMnZ6a1pmWE5jY3lp?=
 =?utf-8?B?RUx5dTJRVTYwM2RrR2ZNMUpKblcvQjhQYTdmcTdLNVlwQTdnV0N1cjF4T1Jk?=
 =?utf-8?B?Vk5nT2RodnVabHlzUzlZaTByOXd0enRFZjVralR6UmZXeCsxYUowS1NnV2E5?=
 =?utf-8?B?QlFVTENUTm1tcWhDUUVYMXlia1BSRHg5RmhJWEtyMWVxOGxWM2hrTnExUWJY?=
 =?utf-8?B?VlNQVVM1eHkyclBWYWk2angzdE9YS0g0elRtRDZUcjlqVkNSY1JrakxkU1pz?=
 =?utf-8?B?QzFWQkgyOEdEOWhxcmRZeFVoY0ExcmdCcXltbW0ydXFBRTJxTGZROXJWSkpw?=
 =?utf-8?B?MlczZXlub2VWOUhxUW5YVUdHazFUc1ZMSmRiMkVBWDFMSnFBRFpWdFRqakln?=
 =?utf-8?B?N0EyTmgzOUJYV0tDb1p4Rm5jbis5clJkRTR0c2ZRU0hUcWJiTTRPakRJRTc2?=
 =?utf-8?B?clNBQUFuTUN3d1EzVVY4YmRqR3ZaZE93SVVqQVFHZFFsZHNXWTcwRXNpK3JF?=
 =?utf-8?B?Y2tXSlBKM3BDWWNhVmZFeGkrN1hINTZuMTdyR2cwMUxzdnBIYlVPaStBSE1E?=
 =?utf-8?B?eG9uVlNDaVc5TW54Ukl2TDhtcnd6OTFEOGhHMkZmb1Vkc1dQMzY5M2l2TFg0?=
 =?utf-8?B?T1hRSDR1bWhjQjdLSjlWY1IvaVAvUkhnUlVBRkR2aE1DbStPRXNIUU14Uk5z?=
 =?utf-8?B?d3VMR29RbDJ6NmtLUXBkUmI3UTRlN1pzMWMwZFp5TnYyeWNwdlF3TGs3MDlV?=
 =?utf-8?B?dUVaK1NMb3B1blNXN2NKU0p3NUx2UndnTFdqRlBQbldWT1BYWUF6eWZnVGll?=
 =?utf-8?B?aC84MWk4RmtnNStwYkRxY3N4RllnMDJYVE5kT2NGZVV3NitweTM1UlllUm1p?=
 =?utf-8?B?dThYRVR2ZjBCTG5FeVN2M1RGUDhWRGFTYi8wZVk5L081T1prK01mMHJZSkMy?=
 =?utf-8?B?Nkp5MDNUWWRNb05MdEFzcGY5ZUttQTIwTExYY1lpVlZpMlhkbGgrUzYreFJY?=
 =?utf-8?B?Y08xZjIrU2xaSm9oZkFTdllldDJwZm02OWFLUDVjMWRGKyt6djZWQzZzNnIz?=
 =?utf-8?B?cWV2MEZEMFpnWVg2M1RYbGsxVmkwcktQRFBidWhwU3EyVy9MZnFsWTJycjFK?=
 =?utf-8?B?L1pWSUNMZzdJaEFseEFhejZsanhNRnFVRVpVbXVqdG53ZGVEQmNvdDVQa0k4?=
 =?utf-8?B?Q2FXeVUyNy90ZEdYWmU3bk1JYWJsS2JjQWZxaHFIdDdHS3RnRm1lRVY1S1A3?=
 =?utf-8?B?T3JjSzY1dWRBWFpWZ3R0SDJVaTNOZW15eW5Ha2NDOW9Jc2tTRzNzNzFXeDF6?=
 =?utf-8?B?elRhK1ZtOE5WOXVuYURqcWJRN3QyK3I1TU1SeDhJYU8rSXdMMFNsdVFITCs2?=
 =?utf-8?Q?HC1k8BaGHU4QVS/o4L3WltWCcUrZYWOT0PtlV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 542b8173-b0e8-4036-6715-08df19acefd4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 19:57:46.0234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Vg8q6EgqR7y/DQvgSGrkHIj43duiwfkoEPvV54Ck3CvI/nFL1x3i9aDnr2DJLG3KGzLp+mLEzxVFRKOSvyfSRzCrsQEbWkwC/qS8wFEgVo3VTLc7F/CO14PJvppKGU6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7552
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_125750_564506_F908911F 
X-CRM114-Status: UNSURE (   9.13  )
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


On Tue, 15 Sep 2026 22:18:24 +0200, Francesco Dolcini wrote:
> som_gpio_expander_1's gpio-line-names use "AQUILA_C1".."AQUILA_C4"
> instead of the zero-padded "AQUILA_C01".."AQUILA_C04" used by every
> other Cxx entry in this file and by k3-am69-aquila.dtsi, a different
> board implementing the same Aquila Family Specification. The
> zero-padded form is the official pin naming per the Aquila Family
> Specification and the Aquila iMX95 module datasheet.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: freescale: imx95-aquila: fix gpio-line-names padding
      commit: 66a5b2bf9d217668ae683eecfaba38bcd61cfe94

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

