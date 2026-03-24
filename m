Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCBCFEC0F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 18:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:References:
	In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9YO0m0pXvSyadmJR6CDmHEBfF75FzjJISeaBGJX9gaI=; b=vECFBqDlwe8/Kf5Av46OC4DzRm
	9JmvsEQqBq3u0iCFJaWN2EZlol4FC5yLcygOGYvCzpiTbXzCXqNCrjoc2frSVbs2Ez34oZzpcYXOa
	eo0y/dhoChWzWAMT4zV4EhqX4RpMYhjE3QqbElAhHGMBa8EhaVoCVsDb6OIpFMgXqoxYMX7WU2CJd
	cMF/kM5v37Jq0tfYZOVSv4njaoTz73QrTosndJWDMk3TiXq9CkJU9+0zlXh2Q4URB6lDVV1h4r3Gm
	AMK98MlmXzoPFK2lDmeZqHlD/lJdkm41RwsqtQ3yzafx8AL7f4s1TI4Gr66BonG28IbezJXxDVPxz
	SsXAROTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w56RA-000000023sN-15m6;
	Tue, 24 Mar 2026 18:25:08 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w56R7-000000023rs-47aV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 18:25:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XT8EkyNjtNE4HLUGPeFeHjzPJwhiBH/15OwjReltvg8J1pXNnOpRQwg7WD0C5ekjbPZy5P5nzrfrXKx7dUQqF7Nx8PLO4rNAOk9pPXVM4Tz+ZqTiYgmgPrW6g/geDgaU6oxXcC1e1T3+y9myu1bOdP2E1A7SVZkEcXnyv/ch7w/U/A7SJ+Vq7rKPDqBZJen/CO7RzrlU5w7nkfU21ag4tXzp9mC2ZljAHhCCOWiSRS+r1Xn/Zs2vjS+xfzJ+x89sfAHjtrty6vsdQ/tM6vIBDO7OCM/q9tC31qQRCAw9NWodW4gKKLBvVZTFebq7fhRFokys0TJ1HXLKOyPBCVMlkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9YO0m0pXvSyadmJR6CDmHEBfF75FzjJISeaBGJX9gaI=;
 b=s0okUUl6VXhVHq7VV9/OLx5UR2hVQO3j7SS7MBfsTD8n9TljW7T4nZjF0FPDw3cPgdXI0rtd/h2azwL4YlqB/aYua6kFfNPiEBBn9LeBUQ/YcFCgZ8xe4/pXYTnU6tSPu8i7bGp7Ffs3VOW/4SVKWoysQD3/xuDrLuTMAcCrudjYtLtQs51HW+kiHZEOorE1XuH4ZZmohbco+9LXIlehtcsrL+5kK6/utLH6iHDO9mmzkR6buHtjGFwtsEUrmqekS3CDx0TuSmdIrGTBCp8R04YX2JSFlFGClPjrSFG/FHXMb0hK2CPYhtLcFT9S6Jpmd7MxqRcsSgnzQW2rpu+0PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YO0m0pXvSyadmJR6CDmHEBfF75FzjJISeaBGJX9gaI=;
 b=U9LXvO4+0MslQnwRR7SwvbxA9cDYSwknG6sVSb+FHUhC/ML8xlChcqxk8pCG8IVa1OxQZQhQIXQnBytPUFIW/4e1i+RqSaD0ZAMhENAJp9jJwRuwr4aaRz+R3uGbSoCvNB5+2//wdBVmXRDjCMMfGOUCnRIOF3Mhl04Px9eBi0ZetQQdljYZDW9emWrITFHmbJliSJiU6c9gQRSxVGTWoj0LJR/AhSmMdsKePQY8c3evfzugT+rDHntKcuasy6VlqV3nEMt5i5m1F2VBJW2EbI103UNUm/lIvCef9u9gPTnVYpKJHTwgeyIqrABDtgJGawSLZ2VLLjnEdwKx+N9AaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA4PR04MB7949.eurprd04.prod.outlook.com (2603:10a6:102:cc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 18:24:54 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 18:24:51 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260313141305.1844209-1-alexander.stein@ew.tq-group.com>
References: <20260313141305.1844209-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] arm64: dts: imx95: Move funnel outside from soc
Message-Id: <177437669740.2230775.2527587346493347126.b4-ty@nxp.com>
Date: Tue, 24 Mar 2026 14:24:57 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SA1P222CA0030.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::6) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA4PR04MB7949:EE_
X-MS-Office365-Filtering-Correlation-Id: 777456a9-fd94-4d67-38b9-08de89d2a37a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|19092799006|366016|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: y9SyM4irI2/w4QphwI5/6WsNP2WOAcpdnQea3Y0aiTG6UsvwpsV5oxAN1jaTySqj5BpkuoZiFsHJwXH0ES8EBGaVvU6Wja9x13Yp7ESB8qo+roSdtYtVtuYmSTm4o84l8p5jWD9TShLBlTwJiQ4V1dNEcp9l4GRo7Ad5HkEf30Hzxqcnw4T2nSC4zYgmcLJ0yCgfEmIV6skRPZIG6a+IT7+E4jwxQg5ww/Gao/VGQUVtvQbEItRlnShiJLikberTXthe4FvyQvd+s1bHFt/DGdqTuSxkXZwzCjLTSf9HTwVyUi6RSGLu9IqgcxKyKarddlweXlGSB2jl6rKyMHhX1CnwmJMsJlMsO5/gAxxOfyWAiQRJvGsfW2+LWsjeeA70wjtBuGns2y/LRM/42poBEypqhp0XGqweDp8MQV7MPwwENCA7h2oSWAtRN5l+UPe0bSzoxe5Xp9CWDQZPhW4iqywIstFGiqoGkxEGoPlUPCkyi1BzoMn1qyYvYMNALYreUmUjqpvGPtVBUR4Pg1I6h15c+LTaDqDdfxr8fP0B0cm/DAE2znFC/8dINBFGNee/ceSO8sVPoz/ORu3lIHrBvV9rLJ8btFD+sGaw7JDIeYt7YcHySZKU34g0u0JfJLtGUuxYDpo7az4uhadYFalrdCS/Sy12VN5TkibJ1gUPEkbnN1BqOpIXFaiwABYtikhIsOk30XUavsGvBHUGTbe0KkpuX7Be/brDDzujq0aKwZO9COjOx3oH8Mj92iIlFfLiL7ZuES0drL8MRXk0JFLKo0y4EcfUWgoDAPSsvG/Xzu0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(19092799006)(366016)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1VtSzBKVVdZNUp5SnhNbmJJMXJDbUZMV3hrcXdkMVZtbnBEb0J3Q01hczM5?=
 =?utf-8?B?L3Z4OTJZQ1FZcExsQXFzdFhHMytmZ1BUUk5URmNPaThzVE9XdjMvZDI4bUJO?=
 =?utf-8?B?S2NwTjIyMlZ0dTNZR1ZldWFoN0F3WUpVdDl6YTNYS0E2VUdNRzl1UU1HMGdV?=
 =?utf-8?B?L0ZVUTk2SkVjUUhRUUNrRmlEODMrV3Z3TGlDTjFpUGUwRU9vVXZETWtYSGdJ?=
 =?utf-8?B?VWZLYnRXU0JrVkJVV0pyejF5VUpjU2JyNFh6cUJJWlhpTytROWg0U2tMRXRl?=
 =?utf-8?B?OVFiSnBRZXhmK2hrczBnWUpXdmZDcVpkM0FqTXRiQ0hYYk5jQm0rRUxFVXZV?=
 =?utf-8?B?WUhuK1dyV3dJMFBWK21WVjdaTElIMVp0bjJzVC91eUV1WGdjOHZKcjJwTHJh?=
 =?utf-8?B?VHJVQjE1VEJ5Sm5DSXJFaFNHVHNwREJkY3NLZVVZeXI4VTlsczgzUVRKaU5H?=
 =?utf-8?B?WEd3OExEL29mNmJtTnJJWEJqWk5zTlNJblRROHovWkw5Smw3Q2dhTVdTYmJD?=
 =?utf-8?B?dDdyQVlLUkJ1TlhWUkc4cjBRSXZZUGFsdEVPTXRMeFJjdzZlM2J5cGF6NnRU?=
 =?utf-8?B?bDR0WlI2QnBpaXpiSUltbWJpcDlpOGUzWVFSUnJaaFRVUDVZVWVDeENvMUlz?=
 =?utf-8?B?MnduUnpPN0MwMG9peXZDcEg1SzA2WTFtRExxZVJCRXZDY3liazZoQXpxeHRq?=
 =?utf-8?B?bFhtMXRablZOOFRwZHo1L1FzejFjMTJocmpLMTIxc1ZzTVlQYzZsWUFQZWY3?=
 =?utf-8?B?bkE4Q2JQM0xBSmFHTlhNekRkeGtCaWUzMGp6QlpiQVVUUitqQzBHN0NOOG05?=
 =?utf-8?B?eVgyRUg5ei9sNWFkNExjMUR6dHZMQTFRdjIrUWhrUXpWQnY3TmNWcmNEYlhT?=
 =?utf-8?B?UjFqTURmVkg5ZHg1VzltQWdSVnBFQmJCQkNQT2gram1VbHpCK1ArZGN3ellL?=
 =?utf-8?B?aU9Ha093Q2FCYXUvR2U4TnFpZXh4Ky9tMVR5aEE4U1duVWlVZC93eExtSmp0?=
 =?utf-8?B?cGpwQUVieEY2NExCWkhOMlk4bEpGUCttRzZUVnI4ZHlkeWUrU0dYWmJqR0dF?=
 =?utf-8?B?dFFNdXdlVkxxc05XeGs4NGhPVzhpbTU5WVVNQ1BhK1pUWUU3L2t3VE9CQjFG?=
 =?utf-8?B?eW5OdEpvQURlUlIwRFJPa0VzL2VyemljMGxYNDQ4NnRBUmZ4c1daNUpYUWor?=
 =?utf-8?B?dUF5U1l4VUpaNWNRYW41S3ZOYnpNRFdHWmxmVURYN1lVa0J6Ukg3bDRhNTBB?=
 =?utf-8?B?c05iRjJkQi9aUmRENFlvVDVha3BCWXhYN1pHRTdFaVpqUkJ2bW5BNHYvcHVy?=
 =?utf-8?B?azN5b0llaWxXWVFwSmpjbDkzYmxXRjJLUk10akowa3RaaGswNkZMWGk1REpR?=
 =?utf-8?B?M0wvQkZtTm5RWXZlcVBoRStWaFhPSG5BUmV1aDh2R29CV3pEOTJrenpzREYy?=
 =?utf-8?B?OG10S3FHcXFjRkdqWm5zQWNkMTJMQTJtT285SWpzZ0pPZ294bzNzTFU3VVBX?=
 =?utf-8?B?dFBCNytWaEJFRTdQZ1Naa2pIUkN4cnQxcnB0dVF1QjhNd3htYUxRamlQNE0y?=
 =?utf-8?B?QStIYVBWKzlHWS9oQnNRYlJsMlRRK2Z4b2ZRc2RJczVTR1ZhUlZrZEJGOS9N?=
 =?utf-8?B?TzBUTERhaWhkRnN0cUxVVC9mOFh2NkhDRGFEMytDNjY5VFVMRDFBWlNydG5Z?=
 =?utf-8?B?YzZEZ213WVAveXlSNHFnK25IWlpKUHRGaGRESk5SNjNWYW5NNld5WFVOblpW?=
 =?utf-8?B?OWdWUStoK2lnTzQ1V3Qwd3BjeTQxb1ZLMWxIUEwyYXBqdkw3eG56Yyt5V2M5?=
 =?utf-8?B?MW1LUUtpdm5zUnFYT2QxY0wzQUl4YzBTVXlLT20vdFJEQ09nU1MzcmJPUzgv?=
 =?utf-8?B?OHBqcTlDOUwvMVZ0VnhnY3N3SkFIbFFKcXdqaFpPbFh2NnI5c1RyU3h1SWhT?=
 =?utf-8?B?QVB4cFRjT2labDdGQ3JCMS9aQ25nVlpNUTNWU1FhRmkxVllrbUdzVlpaUjNu?=
 =?utf-8?B?SjRrazNMblEvejlKd3ZRWTdJaHZhRFFIRnlhN1RWelNoWnJuN21WYzkzdGhS?=
 =?utf-8?B?ZVZDYUhlN3gzY0xPd1BUdW1sd1cvOGhZUWMwTnNEMDZERjN4UnZZUEpzOGNG?=
 =?utf-8?B?TU9PU3dqVGdUcE1IejYzek5kL0pZYW1UcHRoRjhnZWYraGIzUWtqQmlwWjNo?=
 =?utf-8?B?cnNGd0F1RFZqVnkvZFhsTjBUNVdhWjBHdm03WEw3NXVEOUVTMEk0cnRERDIz?=
 =?utf-8?B?Ujlrdi9maFNRdU1oNEVNQWJPTWw0U1NJOVkwWUNjd29URk56ejdjc244Ty8z?=
 =?utf-8?B?WUNOZHRkVmZZZS9nNlZWNVorcEJ4R1RJTE1NV0xyNytwZExQN3ZHQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 777456a9-fd94-4d67-38b9-08de89d2a37a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 18:24:51.4035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XpadrXSQ1XLmP8SfRtBgZclY2zszHyR78A2QQk+x9D16Exui+YOp4q7NhcWp5uowHSj71PmGitXSrJlF7NSgQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7949
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_112506_056434_59DFB279 
X-CRM114-Status: UNSURE (   9.72  )
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


On Fri, 13 Mar 2026 15:13:04 +0100, Alexander Stein wrote:
> The 'funnel' node does not contain a register range, so it should
> be placed outside of the soc node to fix schema warnings from
> simple-bus.yaml.
> Change is similar to commit 9cfe3c892b761 ("arm64: dts: imx8mp: Move
> funnel outside from soc")
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: imx95: Move funnel outside from soc
      commit: ec5de824033f29f5ed041b178078f8c9344b6fec

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>


